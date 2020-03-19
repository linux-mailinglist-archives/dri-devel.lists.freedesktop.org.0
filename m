Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D930118B16D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65026E9E5;
	Thu, 19 Mar 2020 10:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D266E9E5;
 Thu, 19 Mar 2020 10:31:01 +0000 (UTC)
IronPort-SDR: C07zixydLjdKQiaC52bmvXcQ1k4s/ve0OF43vlVEm6zRTAhzXRNvzXa+3TI2f72H3x1dwhSj6x
 zmrzOTMcHPtQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 03:31:00 -0700
IronPort-SDR: 6WiRqcyaeNZTwkIhFBqtoBI0VziQdFjTjpP1kEOBqXeiPXEJEuluKUNhwxl/fsCoIHOU3ilUa2
 0qUqGhURC3GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,571,1574150400"; d="scan'208";a="263687115"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by orsmga002.jf.intel.com with ESMTP; 19 Mar 2020 03:30:55 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: sameer.lattannavar@intel.com, jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 3/5] drm/i915: Introduce scaling filter related registers
 and bit fields.
Date: Thu, 19 Mar 2020 15:51:01 +0530
Message-Id: <20200319102103.28895-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
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

changes since v1:
* None
changes since RFC:
* Parametrize scaler coeffient macros by 'set' (Ville)

Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 48 +++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 9c53fe918be6..d40f12d2a6b5 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7205,6 +7205,7 @@ enum {
 #define PS_PLANE_SEL(plane) (((plane) + 1) << 25)
 #define PS_FILTER_MASK         (3 << 23)
 #define PS_FILTER_MEDIUM       (0 << 23)
+#define PS_FILTER_PROGRAMMED   (1 << 23)
 #define PS_FILTER_EDGE_ENHANCE (2 << 23)
 #define PS_FILTER_BILINEAR     (3 << 23)
 #define PS_VERT3TAP            (1 << 21)
@@ -7219,6 +7220,10 @@ enum {
 #define PS_VADAPT_MODE_MOST_ADAPT  (3 << 5)
 #define PS_PLANE_Y_SEL_MASK  (7 << 5)
 #define PS_PLANE_Y_SEL(plane) (((plane) + 1) << 5)
+#define PS_Y_VERT_FILTER_SELECT(set)   ((set) << 4)
+#define PS_Y_HORZ_FILTER_SELECT(set)   ((set) << 3)
+#define PS_UV_VERT_FILTER_SELECT(set)  ((set) << 2)
+#define PS_UV_HORZ_FILTER_SELECT(set)  ((set) << 1)
 
 #define _PS_PWR_GATE_1A     0x68160
 #define _PS_PWR_GATE_2A     0x68260
@@ -7281,6 +7286,25 @@ enum {
 #define _PS_ECC_STAT_2B     0x68AD0
 #define _PS_ECC_STAT_1C     0x691D0
 
+#define _PS_COEF_SET0_INDEX_1A	   0x68198
+#define _PS_COEF_SET0_INDEX_2A	   0x68298
+#define _PS_COEF_SET0_INDEX_1B	   0x68998
+#define _PS_COEF_SET0_INDEX_2B	   0x68A98
+#define _PS_COEF_SET1_INDEX_1A	   0x681A0
+#define _PS_COEF_SET1_INDEX_2A	   0x682A0
+#define _PS_COEF_SET1_INDEX_1B	   0x689A0
+#define _PS_COEF_SET1_INDEX_2B	   0x68AA0
+#define PS_COEE_INDEX_AUTO_INC	   (1 << 10)
+
+#define _PS_COEF_SET0_DATA_1A	   0x6819C
+#define _PS_COEF_SET0_DATA_2A	   0x6829C
+#define _PS_COEF_SET0_DATA_1B	   0x6899C
+#define _PS_COEF_SET0_DATA_2B	   0x68A9C
+#define _PS_COEF_SET1_DATA_1A	   0x681A4
+#define _PS_COEF_SET1_DATA_2A	   0x682A4
+#define _PS_COEF_SET1_DATA_1B	   0x689A4
+#define _PS_COEF_SET1_DATA_2B	   0x68AA4
+
 #define _ID(id, a, b) _PICK_EVEN(id, a, b)
 #define SKL_PS_CTRL(pipe, id) _MMIO_PIPE(pipe,        \
 			_ID(id, _PS_1A_CTRL, _PS_2A_CTRL),       \
@@ -7310,6 +7334,30 @@ enum {
 			_ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
 			_ID(id, _PS_ECC_STAT_1B, _PS_ECC_STAT_2B))
 
+#define _SKL_PS_COEF_INDEX_SET0(pipe, id)  _ID(pipe,    \
+			_ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX_2A), \
+			_ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX_2B))
+
+#define _SKL_PS_COEF_INDEX_SET1(pipe, id)  _ID(pipe,    \
+			_ID(id, _PS_COEF_SET1_INDEX_1A, _PS_COEF_SET1_INDEX_2A), \
+			_ID(id, _PS_COEF_SET1_INDEX_1B, _PS_COEF_SET1_INDEX_2B))
+
+#define _SKL_PS_COEF_DATA_SET0(pipe, id)  _ID(pipe,     \
+			_ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2A), \
+			_ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2B))
+
+#define _SKL_PS_COEF_DATA_SET1(pipe, id)  _ID(pipe,     \
+			_ID(id, _PS_COEF_SET1_DATA_1A, _PS_COEF_SET1_DATA_2A), \
+			_ID(id, _PS_COEF_SET1_DATA_1B, _PS_COEF_SET1_DATA_2B))
+
+#define SKL_PS_COEF_INDEX_SET(pipe, id, set) \
+			_MMIO_PIPE(set, _SKL_PS_COEF_INDEX_SET0(pipe, id), \
+			    _SKL_PS_COEF_INDEX_SET1(pipe, id))
+
+#define SKL_PS_COEF_DATA_SET(pipe, id, set) \
+			_MMIO_PIPE(set, _SKL_PS_COEF_DATA_SET0(pipe, id), \
+			    _SKL_PS_COEF_DATA_SET1(pipe, id))
+
 /* legacy palette */
 #define _LGC_PALETTE_A           0x4a000
 #define _LGC_PALETTE_B           0x4a800
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
