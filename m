Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D15296F69
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36AF6F643;
	Fri, 23 Oct 2020 12:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B50B6F643;
 Fri, 23 Oct 2020 12:35:46 +0000 (UTC)
IronPort-SDR: zbnGtDP7HVe8rGIql+HifCzoGW3lVuaNbyOgFWurGGbZDFJerjvCXGAPVQgpb+2TvqPQ58U9it
 APIbOeZi/pBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="252365719"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="252365719"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 05:35:46 -0700
IronPort-SDR: EyBv38L0FYT4zJC8xqwGkubiZq5YIm9TZfo6QxgPlAHmrL9bXbsxu0RUjXfcZdTAefo2ZqfJWa
 T7QA+xHnbuMA==
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="423415816"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 05:35:43 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 14/16] drm/i915/hdcp: Add HDCP 2.2 stream register
Date: Fri, 23 Oct 2020 17:51:10 +0530
Message-Id: <20201023122112.15265-15-anshuman.gupta@intel.com>
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

Add HDCP 2.2 DP MST HDCP2_STREAM_STATUS
and HDCP2_AUTH_STREAM register in i915_reg header.

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 86a9a5145e47..cb6ec2c241f2 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9882,6 +9882,7 @@ enum skl_power_gate {
 					  _PORTD_HDCP2_BASE, \
 					  _PORTE_HDCP2_BASE, \
 					  _PORTF_HDCP2_BASE) + (x))
+
 #define PORT_HDCP2_AUTH(port)		_PORT_HDCP2_BASE(port, 0x98)
 #define _TRANSA_HDCP2_AUTH		0x66498
 #define _TRANSB_HDCP2_AUTH		0x66598
@@ -9921,6 +9922,35 @@ enum skl_power_gate {
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
