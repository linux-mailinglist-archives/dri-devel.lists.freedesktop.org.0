Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB34D296F52
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294116E575;
	Fri, 23 Oct 2020 12:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0486E56D;
 Fri, 23 Oct 2020 12:35:09 +0000 (UTC)
IronPort-SDR: chQHidXx6rCoszSTwKaGp8i/ngjVq7ySDdPuhvYR/4l94BUrEAaLrbrcNFjab8JjIDI3Ppoph3
 sHHC/zswnOjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="252365590"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="252365590"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 05:35:09 -0700
IronPort-SDR: LJqYpSQyt9nkiPakQmN3PBFOtvNHvwXYO93X5fcQ/AcQGDkKXGD1KZwuntT1Gm5j3h4OrElb0o
 5EyVTBAVwiWw==
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="423415668"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 05:35:07 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/16] drm/i915/hdcp: Update CP property in update_pipe
Date: Fri, 23 Oct 2020 17:50:57 +0530
Message-Id: <20201023122112.15265-2-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023122112.15265-1-anshuman.gupta@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
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
update_pipe instead of modeset.
This turns content protection property to be DESIRED and hdcp
update_pipe left with property to be in DESIRED state but
actually hdcp->value was ENABLED.
This caught with DP MST setup, when disabling HDCP on a connector
sets the crtc state need_modeset to true for all crtc driving
the other DP-MST topology connectors.

v2:
Fix WARN_ON(connector->base.registration_state == DRM_CONNECTOR_REGISTERED)

Fixes: 33f9a623bfc6 ("drm/i915/hdcp: Update CP as per the kernel internal state")
Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b2a4bbcfdcd2..0d9e8d3b5603 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2221,6 +2221,11 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 		desired_and_not_enabled =
 			hdcp->value != DRM_MODE_CONTENT_PROTECTION_ENABLED;
 		mutex_unlock(&hdcp->mutex);
+
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
