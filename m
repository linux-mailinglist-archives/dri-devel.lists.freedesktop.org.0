Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F8C2D7722
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA6E6EE06;
	Fri, 11 Dec 2020 13:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2DB6EE15;
 Fri, 11 Dec 2020 13:57:15 +0000 (UTC)
IronPort-SDR: 6eHrHnQPb6XNl/IOcY7DBMOC+QETdvCCvZhfefzoUgPrcC7QBABtsSFEyVDHQmvDhPg1eyaozc
 +C03YmR9dP6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="162187759"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="162187759"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:57:14 -0800
IronPort-SDR: r8bdm0HNf/07tHuK9LzsxAMSlb9TOVl0uhVlzfFhMsM2c2oiFuG/B/5WfWLZcWo6M71E0bKkyn
 P/9XSd5a1F5g==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="409228499"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:57:11 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 15/19] drm/i915/hdcp: Pass connector to check_2_2_link
Date: Fri, 11 Dec 2020 19:12:40 +0530
Message-Id: <20201211134244.14588-16-anshuman.gupta@intel.com>
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

This requires for HDCP 2.2 MST check link.
As for DP/HDMI shims check_2_2_link retrieves the connector
from dig_port, this is not sufficient or DP MST connector,
there can be multiple DP MST topology connector associated
with same dig_port.

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 3 ++-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 3 ++-
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 3 ++-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b37a02a73de6..63de25b40eff 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -379,7 +379,8 @@ struct intel_hdcp_shim {
 				  bool is_repeater, u8 type);
 
 	/* HDCP2.2 Link Integrity Check */
-	int (*check_2_2_link)(struct intel_digital_port *dig_port);
+	int (*check_2_2_link)(struct intel_digital_port *dig_port,
+			      struct intel_connector *connector);
 };
 
 struct intel_hdcp {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 3f23f8b53dcd..9ade1ad3a80c 100644
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
index e26a63f0c189..2fd8b0453b1d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1947,7 +1947,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	ret = hdcp->shim->check_2_2_link(dig_port);
+	ret = hdcp->shim->check_2_2_link(dig_port, connector);
 	if (ret == HDCP_LINK_PROTECTED) {
 		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
 			intel_hdcp_update_value(connector,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 25d76460f8f9..977e6b6c35c7 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1733,7 +1733,8 @@ int intel_hdmi_hdcp2_read_msg(struct intel_digital_port *dig_port,
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
