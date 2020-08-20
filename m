Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA1E24C879
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9588F6E064;
	Thu, 20 Aug 2020 23:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526C56E064
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:22:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208947] amdgpu DisplayPort won't recognize all display modes
 after 5.9 merges
Date: Thu, 20 Aug 2020 23:22:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ckane@colemankane.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208947-2300-u74BIZwvPL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208947-2300@https.bugzilla.kernel.org/>
References: <bug-208947-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208947

--- Comment #12 from Coleman Kane (ckane@colemankane.org) ---
Ok I re-did the bisect and I think I found the actual commit that introduced
the regression. I have confirmed this by generating a reverse-patch and then
applying that to the latest staging-testing branch I had cloned at the
beginning of the week, and I was able to use the newer kernel without the bug
occurring.

The bug appears to have been introduced by commit
3fd20292c2352660155bbc11736dd014b2fc6e98:

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 5cb7b834e459..1a3dbed3becb 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -1133,6 +1133,45 @@ static inline enum link_training_result
perform_link_training_int(
        return status;
 }

+static enum link_training_result check_link_loss_status(
+       struct dc_link *link,
+       const struct link_training_settings *link_training_setting)
+{
+       enum link_training_result status = LINK_TRAINING_SUCCESS;
+       unsigned int lane01_status_address = DP_LANE0_1_STATUS;
+       union lane_status lane_status;
+       uint8_t dpcd_buf[4] = {0};
+       uint32_t lane;
+
+       core_link_read_dpcd(
+               link,
+               lane01_status_address,
+               (uint8_t *)(dpcd_buf),
+               sizeof(dpcd_buf));
+
+       /*parse lane status*/
+       for (lane = 0; lane < link->cur_link_settings.lane_count; lane++) {
+               /*
+                * check lanes status
+                */
+               lane_status.raw = get_nibble_at_index(&dpcd_buf[0], lane);
+
+               if (!lane_status.bits.CHANNEL_EQ_DONE_0 ||
+                       !lane_status.bits.CR_DONE_0 ||
+                       !lane_status.bits.SYMBOL_LOCKED_0) {
+                       /* if one of the channel equalization, clock
+                        * recovery or symbol lock is dropped
+                        * consider it as (link has been
+                        * dropped) dp sink status has changed
+                        */
+                       status = LINK_TRAINING_LINK_LOSS;
+                       break;
+               }
+       }
+
+       return status;
+}
+
 static void initialize_training_settings(
         struct dc_link *link,
        const struct dc_link_settings *link_setting,
@@ -1372,6 +1411,9 @@ static void print_status_message(
        case LINK_TRAINING_LQA_FAIL:
                lt_result = "LQA failed";
                break;
+       case LINK_TRAINING_LINK_LOSS:
+               lt_result = "Link loss";
+               break;
        default:
                break;
        }
@@ -1531,6 +1573,14 @@ enum link_training_result
dc_link_dp_perform_link_training(
                                status);
        }

+       /* delay 5ms after Main Link output idle pattern and then check
+        * DPCD 0202h.
+        */
+       if (link->connector_signal != SIGNAL_TYPE_EDP && status ==
LINK_TRAINING_SUCCESS) {
+               msleep(5);
+               status = check_link_loss_status(link, &lt_settings);
+       }
+
        /* 6. print status message*/
        print_status_message(link, &lt_settings, status);

diff --git a/drivers/gpu/drm/amd/display/include/link_service_types.h
b/drivers/gpu/drm/amd/display/include/link_service_types.h
index 4869d4562e4d..550f46e9b95f 100644
--- a/drivers/gpu/drm/amd/display/include/link_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/link_service_types.h
@@ -66,6 +66,8 @@ enum link_training_result {
        /* other failure during EQ step */
        LINK_TRAINING_EQ_FAIL_EQ,
        LINK_TRAINING_LQA_FAIL,
+       /* one of the CR,EQ or symbol lock is dropped */
+       LINK_TRAINING_LINK_LOSS,
 };

 struct link_training_settings {

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
