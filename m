Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748EB2D53DD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 07:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB1C6E3E3;
	Thu, 10 Dec 2020 06:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0B06E3DB;
 Thu, 10 Dec 2020 06:40:23 +0000 (UTC)
IronPort-SDR: 6NB/NQIUogrmlqA3UXOyL6MWGsH+Wwk3lGMcQkNJDmRr3KAHQBUaaPYoQK8HjKeSNdF2PxUwPQ
 SWywxwU25Wtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174322160"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="174322160"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:22 -0800
IronPort-SDR: cLLbmgXAX9HLLuFbffuJ2w9hMDKkJ36xM2sCh3rA7SzZuSH/4On/keUHXaQjy7KTEd6duEjzmO
 7yL8BB1ev7+Q==
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="318854313"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:19 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 01/18] drm/i915/hdcp: Update CP property in update_pipe
Date: Thu, 10 Dec 2020 11:56:23 +0530
Message-Id: <20201210062640.11783-2-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210062640.11783-1-anshuman.gupta@intel.com>
References: <20201210062640.11783-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, Karthik B S <karthik.b.s@intel.com>,
 uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When crtc state need_modeset is true it is not necessary
it is going to be a real modeset, it can turns to be a
fastset instead of modeset.
This turns content protection property to be DESIRED and hdcp
update_pipe left with property to be in DESIRED state but
actual hdcp->value was ENABLED.

This issue is caught with DP MST setup, where we have multiple
connector in same DP_MST topology. When disabling HDCP on one of
DP MST connector leads to set the crtc state need_modeset to true
for all other crtc driving the other DP-MST topology connectors.
This turns up other DP MST connectors CP property to be DESIRED
despite the actual hdcp->value is ENABLED.
Above scenario fails the DP MST HDCP IGT test, disabling HDCP on
one MST stream should not cause to disable HDCP on another MST
stream on same DP MST topology.

v2:
- Fixed connector->base.registration_state == DRM_CONNECTOR_REGISTERED
  WARN_ON.

v3:
- Commit log improvement. [Uma]
- Added a comment before scheduling prop_work. [Uma]

Fixes: 33f9a623bfc6 ("drm/i915/hdcp: Update CP as per the kernel internal state")
Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b2a4bbcfdcd2..eee8263405b9 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2221,6 +2221,14 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 		desired_and_not_enabled =
 			hdcp->value != DRM_MODE_CONTENT_PROTECTION_ENABLED;
 		mutex_unlock(&hdcp->mutex);
+		/*
+		 * If HDCP already ENABLED and CP property is DESIRED, schedule
+		 * prop_work to update correct CP property to user space.
+		 */
+		if (!desired_and_not_enabled && !content_protection_type_changed) {
+			drm_connector_get(&connector->base);
+			schedule_work(&hdcp->prop_work);
+		}
 	}
 
 	if (desired_and_not_enabled || content_protection_type_changed)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
