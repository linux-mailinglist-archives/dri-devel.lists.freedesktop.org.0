Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437592D7714
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435966EE01;
	Fri, 11 Dec 2020 13:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44A76EE06;
 Fri, 11 Dec 2020 13:56:54 +0000 (UTC)
IronPort-SDR: zRJ1bhya+ZdoEiSdfHKSjqGrWZ0y9mhog9Yt+O35rC4ZihRjBJdMRI/cLk995JvVifmZxzxA5n
 EsIU4BSzQkxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="162187711"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="162187711"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:56:54 -0800
IronPort-SDR: Y9fxljqqbm0AznJImdSU19D2GkDdnwht8IODUeUc+ZKC2n/VWoPgbzxF4HF4w1AlALFr1WSS7Y
 y9RXR35XQlXw==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="409228399"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:56:51 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 09/19] drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
Date: Fri, 11 Dec 2020 19:12:34 +0530
Message-Id: <20201211134244.14588-10-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211134244.14588-1-anshuman.gupta@intel.com>
References: <20201211134244.14588-1-anshuman.gupta@intel.com>
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

Enable HDCP 1.4 over DP MST for Gen12.

v2:
- Enable HDCP for <= Gen12 platforms. [Ram]
v3:
- Connector detials in debug msg. [Ram]

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 47beb442094f..f76e2c2a83b8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -829,12 +829,11 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	intel_attach_force_audio_property(connector);
 	intel_attach_broadcast_rgb_property(connector);
 
-
-	/* TODO: Figure out how to make HDCP work on GEN12+ */
-	if (INTEL_GEN(dev_priv) < 12) {
+	if (INTEL_GEN(dev_priv) <= 12) {
 		ret = intel_dp_init_hdcp(dig_port, intel_connector);
 		if (ret)
-			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
+			drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP MST init failed, skipping.\n",
+				    connector->name, connector->base.id);
 	}
 
 	/*
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
