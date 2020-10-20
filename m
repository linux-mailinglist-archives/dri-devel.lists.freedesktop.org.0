Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54563293DA4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 15:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE6B6ECA6;
	Tue, 20 Oct 2020 13:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D726ECA2;
 Tue, 20 Oct 2020 13:49:39 +0000 (UTC)
IronPort-SDR: ETpO5tVeRUSJAK+K7HYN/OkqVXOgppan1oMrPBXx9Py6mgDF2wVsKZX4iBB+CPdIqgz0EngPHY
 9KdCyRigNFnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="184837491"
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="184837491"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 06:49:39 -0700
IronPort-SDR: YRvVztdnqvA834+ERi6RSGIj6ZZdjAWnKM0IuIR5WGXnqv70imVxWy4RtEc7WNhUyNy7ZPgeRQ
 lHdCf5JyQgDg==
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="465934919"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 06:49:36 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/15] drm/i915/hdcp: Update CP property in update_pipe
Date: Tue, 20 Oct 2020 19:08:52 +0530
Message-Id: <20201020133906.23710-2-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201020133906.23710-1-anshuman.gupta@intel.com>
References: <20201020133906.23710-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, seanpaul@chromium.org, juston.li@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>
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

Fixes: 33f9a623bfc6 ("drm/i915/hdcp: Update CP as per the kernel internal state")
Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b2a4bbcfdcd2..cbe3ee661bb7 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2220,6 +2220,10 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 		/* Avoid enabling hdcp, if it already ENABLED */
 		desired_and_not_enabled =
 			hdcp->value != DRM_MODE_CONTENT_PROTECTION_ENABLED;
+
+		if (!desired_and_not_enabled && !content_protection_type_changed)
+			schedule_work(&hdcp->prop_work);
+
 		mutex_unlock(&hdcp->mutex);
 	}
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
