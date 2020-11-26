Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698752C4FBC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 08:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470E16E846;
	Thu, 26 Nov 2020 07:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061F56E844;
 Thu, 26 Nov 2020 07:51:30 +0000 (UTC)
IronPort-SDR: uBul4ktgI79qR2DAt8XudfHuHnjMvd9B6fBCAXTUYlWugsxOQL0DeCQ2IP+Wp6bEvvj37kMti5
 wFG8zUf2YZBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="152084917"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="152084917"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:51:29 -0800
IronPort-SDR: 3dSAqg48M+ZwfVBlHyBS1JtXQP8smo+AdYwnFHj6Yw2GGy9d39lJAEHyRKtEwhNQbWotvabpvd
 bwzaXOrwbwOQ==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="535652456"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:51:27 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 04/18] drm/i915/hdcp: No HDCP when encoder is't initialized
Date: Thu, 26 Nov 2020 13:07:08 +0530
Message-Id: <20201126073722.19107-5-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126073722.19107-1-anshuman.gupta@intel.com>
References: <20201126073722.19107-1-anshuman.gupta@intel.com>
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

There can be situation when DP MST connector is created without
mst modeset being done, in those cases connector->encoder will be
NULL. MST connector->encoder initializes after modeset.
Don't enable HDCP in such cases to prevent any crash.

Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Juston Li <juston.li@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b9d8825e2bb1..7d63e9495956 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2106,6 +2106,12 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	if (!hdcp->shim)
 		return -ENOENT;
 
+	if (!connector->encoder) {
+		drm_err(&dev_priv->drm, "[%s:%d] encoder is not initialized\n",
+			connector->base.name, connector->base.base.id);
+		return -ENODEV;
+	}
+
 	mutex_lock(&hdcp->mutex);
 	mutex_lock(&dig_port->hdcp_mutex);
 	drm_WARN_ON(&dev_priv->drm,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
