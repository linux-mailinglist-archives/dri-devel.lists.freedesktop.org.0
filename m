Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98491295C01
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 11:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7676F5A0;
	Thu, 22 Oct 2020 09:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CBD6F59E;
 Thu, 22 Oct 2020 09:36:43 +0000 (UTC)
IronPort-SDR: 5DcfXLupK+qUonIlr/zu13EAvl857FuMW6Raq147gEGAOi0rfRV23QCFOP2LUai62rvL0R7VUb
 d2Ps985WX5Tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="164905572"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="164905572"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 02:36:43 -0700
IronPort-SDR: oR4F/WPUtDd0S119qI0mbGwPPpjUzpPy2SYo/ipSa9oWLUTOsdZmxrdbbvVV1dsqZOZ8yU0Ip8
 IXLEbJ0y9SrQ==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="359807509"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 02:36:40 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/16] drm/i915/hdcp: Pass connector to check_2_2_link
Date: Thu, 22 Oct 2020 14:25:49 +0530
Message-Id: <20201022085552.18353-14-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022085552.18353-1-anshuman.gupta@intel.com>
References: <20201022085552.18353-1-anshuman.gupta@intel.com>
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

This requires for HDCP 2.2 MST check link.

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 3 ++-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 3 ++-
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 3 ++-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 24e0067c2e7c..dfb5be64e03a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -375,7 +375,8 @@ struct intel_hdcp_shim {
 				  bool is_repeater, u8 type);
 
 	/* HDCP2.2 Link Integrity Check */
-	int (*check_2_2_link)(struct intel_digital_port *dig_port);
+	int (*check_2_2_link)(struct intel_digital_port *dig_port,
+			      struct intel_connector *connector);
 };
 
 struct intel_hdcp {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 384e384cb9e2..a0c62e363c39 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -585,7 +585,8 @@ int intel_dp_hdcp2_config_stream_type(struct intel_digital_port *dig_port,
 }
 
 static
-int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port)
+int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port,
+			      struct intel_connector *connector)
 {
 	u8 rx_status;
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 2e719df1e5b1..86a3ffadd97f 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1942,7 +1942,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	ret = hdcp->shim->check_2_2_link(dig_port);
+	ret = hdcp->shim->check_2_2_link(dig_port, connector);
 	if (ret == HDCP_LINK_PROTECTED) {
 		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
 			intel_hdcp_update_value(connector,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 0788de04711b..bd0d91101464 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1734,7 +1734,8 @@ int intel_hdmi_hdcp2_read_msg(struct intel_digital_port *dig_port,
 }
 
 static
-int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port)
+int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port,
+				struct intel_connector *connector)
 {
 	u8 rx_status[HDCP_2_2_HDMI_RXSTATUS_LEN];
 	int ret;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
