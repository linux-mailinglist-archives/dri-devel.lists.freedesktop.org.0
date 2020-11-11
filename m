Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D002AE91E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 07:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A2A89EAE;
	Wed, 11 Nov 2020 06:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E228389E9E;
 Wed, 11 Nov 2020 06:35:54 +0000 (UTC)
IronPort-SDR: 01KHCPxezojIZwwF4BwBMlWqkgOfCRjnctt+8JgFsmDS00/faJavh1dCfUC5t06eBF4L4qu2UJ
 3KlrVUwpuv3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166593751"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="166593751"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 22:35:54 -0800
IronPort-SDR: E/SHT3z/orU6j+OyVFEgbQlf+ia/XJUMG2O3gT6CpG/1a0zz3E0RVGxqNfmSRQpcaBo/B2k+yn
 rlWLLH4jfWzA==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="366139449"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 22:35:51 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 15/17] drm/i915/hdcp: Add HDCP 2.2 stream register
Date: Wed, 11 Nov 2020 11:50:49 +0530
Message-Id: <20201111062051.11529-16-anshuman.gupta@intel.com>
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

Add HDCP 2.2 DP MST HDCP2_STREAM_STATUS
and HDCP2_AUTH_STREAM register in i915_reg header.

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 3ae097ed004f..5a2d1ead0f6d 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9870,6 +9870,7 @@ enum skl_power_gate {
 					  _PORTD_HDCP2_BASE, \
 					  _PORTE_HDCP2_BASE, \
 					  _PORTF_HDCP2_BASE) + (x))
+
 #define PORT_HDCP2_AUTH(port)		_PORT_HDCP2_BASE(port, 0x98)
 #define _TRANSA_HDCP2_AUTH		0x66498
 #define _TRANSB_HDCP2_AUTH		0x66598
@@ -9909,6 +9910,35 @@ enum skl_power_gate {
 					 TRANS_HDCP2_STATUS(trans) : \
 					 PORT_HDCP2_STATUS(port))
 
+#define PORT_HDCP2_STREAM_STATUS(port)		_PORT_HDCP2_BASE(port, 0xC0)
+#define _TRANSA_HDCP2_STREAM_STATUS		0x664C0
+#define _TRANSB_HDCP2_STREAM_STATUS		0x665C0
+#define TRANS_HDCP2_STREAM_STATUS(trans)	_MMIO_TRANS(trans, \
+						    _TRANSA_HDCP2_STREAM_STATUS, \
+						    _TRANSB_HDCP2_STREAM_STATUS)
+#define   STREAM_ENCRYPTION_STATUS	BIT(31)
+#define   STREAM_TYPE_STATUS		BIT(30)
+#define HDCP2_STREAM_STATUS(dev_priv, trans, port) \
+					(INTEL_GEN(dev_priv) >= 12 ? \
+					 TRANS_HDCP2_STREAM_STATUS(trans) : \
+					 PORT_HDCP2_STREAM_STATUS(port))
+
+#define _PORTA_HDCP2_AUTH_STREAM		0x66F00
+#define _PORTB_HDCP2_AUTH_STREAM		0x66F04
+#define PORT_HDCP2_AUTH_STREAM(port)	_MMIO_PORT(port, \
+						   _PORTA_HDCP2_AUTH_STREAM, \
+						   _PORTB_HDCP2_AUTH_STREAM)
+#define _TRANSA_HDCP2_AUTH_STREAM		0x66F00
+#define _TRANSB_HDCP2_AUTH_STREAM		0x66F04
+#define TRANS_HDCP2_AUTH_STREAM(trans)	_MMIO_TRANS(trans, \
+						    _TRANSA_HDCP2_AUTH_STREAM, \
+						    _TRANSB_HDCP2_AUTH_STREAM)
+#define   AUTH_STREAM_TYPE		BIT(31)
+#define HDCP2_AUTH_STREAM(dev_priv, trans, port) \
+					(INTEL_GEN(dev_priv) >= 12 ? \
+					 TRANS_HDCP2_AUTH_STREAM(trans) : \
+					 PORT_HDCP2_AUTH_STREAM(port))
+
 /* Per-pipe DDI Function Control */
 #define _TRANS_DDI_FUNC_CTL_A		0x60400
 #define _TRANS_DDI_FUNC_CTL_B		0x61400
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
