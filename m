Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDA924A9BC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 00:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4FC6E878;
	Wed, 19 Aug 2020 22:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AA96E878
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 22:53:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208947] amdgpu DisplayPort won't recognize all display modes
 after 5.9 merges
Date: Wed, 19 Aug 2020 22:53:28 +0000
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
Message-ID: <bug-208947-2300-1pK2QHKXpE@https.bugzilla.kernel.org/>
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

--- Comment #9 from Coleman Kane (ckane@colemankane.org) ---
I'm going to venture a guess that if I were to reverse the following part of
the change that it would likely "undo" the cause of the problem, but it doesn't
really solve the problem.

One question I'd have though:
return (dc->hwss.optimize_timing_for_fsft &&
              dc->hwss.optimize_timing_for_fsft(dc, &pStream->timing,
max_input_rate_in_khz));

Looks like if dc->hwss.optimize_timing_for_fsft is NULL (function pointer
nonexistent) then it would always return false, rather than using the old
behavior. It looks like the structure should be populated with that function
pointer, based upon changes in dcn20_init.c and dcn21_init.c, but it's probably
worth verifying whether its ending up NULL at that point or not.

Aside from that, the only other "return false" I see is here in dcn20_hwseq.c:
+       if (max_input_rate_in_100hz < timing->pix_clk_100hz)
+               return false;

I'll try to also get a read out of what values are being populated for these
two values as well.

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 10d69ada88e3..0257a900fe2b 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -246,20 +246,18 @@ struct dc_stream_status *dc_stream_get_status(

 #ifndef TRIM_FSFT
 /**
- * dc_optimize_timing() - dc to optimize timing
+ * dc_optimize_timing_for_fsft() - dc to optimize timing
  */
-bool dc_optimize_timing(
-       struct dc_crtc_timing *timing,
+bool dc_optimize_timing_for_fsft(
+       struct dc_stream_state *pStream,
        unsigned int max_input_rate_in_khz)
 {
-       //optimization is expected to assing a value to these:
-       //timing->pix_clk_100hz
-       //timing->v_front_porch
-       //timing->v_total
-       //timing->fast_transport_output_rate_100hz;
-       timing->fast_transport_output_rate_100hz = timing->pix_clk_100hz;
+       struct dc  *dc;

-       return true;
+       dc = pStream->ctx->dc;
+
+       return (dc->hwss.optimize_timing_for_fsft &&
+               dc->hwss.optimize_timing_for_fsft(dc, &pStream->timing,
max_input_rate_in_khz));
 }
 #endif

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
