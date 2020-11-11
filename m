Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ECA2AE900
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 07:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ACB89DAB;
	Wed, 11 Nov 2020 06:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BC689DAB;
 Wed, 11 Nov 2020 06:35:09 +0000 (UTC)
IronPort-SDR: bkYFQ1CpGYUH6iT5xsoaJ7Ar/kcnd7R+kyrzn211kBdcNImD2+bomvrRuzXpqz/QZNpZrjYdF1
 epj1R6iGOKEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166593676"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="166593676"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 22:35:09 -0800
IronPort-SDR: dDVttIeuofaV/r1EIHa/pFFrABWAsltWC9yvijDq7PCzR/np/E4eGWnj28mo0ae+4JqivNULos
 RFjpWWpNLF/A==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="366139227"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 22:35:06 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/17] drm/i915/hdcp: Update CP property in update_pipe
Date: Wed, 11 Nov 2020 11:50:35 +0530
Message-Id: <20201111062051.11529-2-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111062051.11529-1-anshuman.gupta@intel.com>
References: <20201111062051.11529-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com, seanpaul@chromium.org,
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
Fix WARN_ON(connector->base.registration_state == DRM_CONNECTOR_REGISTERED)
v3:
Commit log improvement. [Uma]
Added a comment before scheduling prop_work. [Uma]

Fixes: 33f9a623bfc6 ("drm/i915/hdcp: Update CP as per the kernel internal state")
Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
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
