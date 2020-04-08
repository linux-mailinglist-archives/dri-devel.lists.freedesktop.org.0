Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DD81A26CC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 18:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C45A6EA8B;
	Wed,  8 Apr 2020 16:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715546EA8B;
 Wed,  8 Apr 2020 16:08:38 +0000 (UTC)
IronPort-SDR: aUeF0zXjxLdXQfqtSeZ/URgglgICNCVeWhcdDDss71mH2OQEvY4Rh85zgCD+cRaGZxzxSn+ZRa
 vQHDXiqJoYvQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 09:08:38 -0700
IronPort-SDR: TN4Lvy7CewBjT1XuR7CZzsCsZ2jEmgCNKp+NymzL2eKAWLGPJvfOjFbdfxv9Aml/x2LHRYilMG
 2RM+oSn36A1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; d="scan'208";a="242397241"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2020 09:08:34 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sameer.lattannavar@intel.com, ankit.k.nautiyal@intel.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 3/5] drm/i915: Introduce scaling filter related registers
 and bit fields.
Date: Wed,  8 Apr 2020 21:29:25 +0530
Message-Id: <20200408155927.32300-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200408155927.32300-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200408155927.32300-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce scaler registers and bit fields needed to configure the
scaling filter in prgrammed mode and configure scaling filter
coefficients.

changes since v3:
* None
changes since v2:
* Change macro names to CNL_* and  use +(set)*8 instead of adding
  another trip through _PICK_EVEN (Ville).
changes since v1:
* None
changes since RFC:
* Parametrize scaler coeffient macros by 'set' (Ville)

Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 1a7bd6db164b..e8d9c3261ac2 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7296,6 +7296,7 @@ enum {
 #define PS_PLANE_SEL(plane) (((plane) + 1) << 25)
 #define PS_FILTER_MASK         (3 << 23)
 #define PS_FILTER_MEDIUM       (0 << 23)
+#define PS_FILTER_PROGRAMMED   (1 << 23)
 #define PS_FILTER_EDGE_ENHANCE (2 << 23)
 #define PS_FILTER_BILINEAR     (3 << 23)
 #define PS_VERT3TAP            (1 << 21)
@@ -7310,6 +7311,10 @@ enum {
 #define PS_VADAPT_MODE_MOST_ADAPT  (3 << 5)
 #define PS_PLANE_Y_SEL_MASK  (7 << 5)
 #define PS_PLANE_Y_SEL(plane) (((plane) + 1) << 5)
+#define PS_Y_VERT_FILTER_SELECT(set)   ((set) << 4)
+#define PS_Y_HORZ_FILTER_SELECT(set)   ((set) << 3)
+#define PS_UV_VERT_FILTER_SELECT(set)  ((set) << 2)
+#define PS_UV_HORZ_FILTER_SELECT(set)  ((set) << 1)
 
 #define _PS_PWR_GATE_1A     0x68160
 #define _PS_PWR_GATE_2A     0x68260
@@ -7372,6 +7377,17 @@ enum {
 #define _PS_ECC_STAT_2B     0x68AD0
 #define _PS_ECC_STAT_1C     0x691D0
 
+#define _PS_COEF_SET0_INDEX_1A	   0x68198
+#define _PS_COEF_SET0_INDEX_2A	   0x68298
+#define _PS_COEF_SET0_INDEX_1B	   0x68998
+#define _PS_COEF_SET0_INDEX_2B	   0x68A98
+#define PS_COEE_INDEX_AUTO_INC	   (1 << 10)
+
+#define _PS_COEF_SET0_DATA_1A	   0x6819C
+#define _PS_COEF_SET0_DATA_2A	   0x6829C
+#define _PS_COEF_SET0_DATA_1B	   0x6899C
+#define _PS_COEF_SET0_DATA_2B	   0x68A9C
+
 #define _ID(id, a, b) _PICK_EVEN(id, a, b)
 #define SKL_PS_CTRL(pipe, id) _MMIO_PIPE(pipe,        \
 			_ID(id, _PS_1A_CTRL, _PS_2A_CTRL),       \
@@ -7400,7 +7416,13 @@ enum {
 #define SKL_PS_ECC_STAT(pipe, id)  _MMIO_PIPE(pipe,     \
 			_ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
 			_ID(id, _PS_ECC_STAT_1B, _PS_ECC_STAT_2B))
+#define CNL_PS_COEF_INDEX_SET(pipe, id, set)  _MMIO_PIPE(pipe,    \
+			_ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX_2A) + (set) * 8, \
+			_ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX_2B) + (set) * 8)
 
+#define CNL_PS_COEF_DATA_SET(pipe, id, set)  _MMIO_PIPE(pipe,     \
+			_ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2A) + (set) * 8, \
+			_ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2B) + (set) * 8)
 /* legacy palette */
 #define _LGC_PALETTE_A           0x4a000
 #define _LGC_PALETTE_B           0x4a800
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
