Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 993C3182F0D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 12:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973AD6E188;
	Thu, 12 Mar 2020 11:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17EA6E16B;
 Thu, 12 Mar 2020 11:25:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 04:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; d="scan'208";a="354108281"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2020 04:24:57 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 3/5] drm/i915: Introduce scaling filter related registers and
 bit fields.
Date: Thu, 12 Mar 2020 16:44:47 +0530
Message-Id: <20200312111449.21202-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200312111449.21202-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200312111449.21202-1-pankaj.laxminarayan.bharadiya@intel.com>
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

changes since RFC:
* Parametrize scaler coeffient macros by 'set' (Ville)

Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 48 +++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index ee4a75ac9186..c64213755296 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7202,6 +7202,7 @@ enum {
 #define PS_PLANE_SEL(plane) (((plane) + 1) << 25)
 #define PS_FILTER_MASK         (3 << 23)
 #define PS_FILTER_MEDIUM       (0 << 23)
+#define PS_FILTER_PROGRAMMED   (1 << 23)
 #define PS_FILTER_EDGE_ENHANCE (2 << 23)
 #define PS_FILTER_BILINEAR     (3 << 23)
 #define PS_VERT3TAP            (1 << 21)
@@ -7216,6 +7217,10 @@ enum {
 #define PS_VADAPT_MODE_MOST_ADAPT  (3 << 5)
 #define PS_PLANE_Y_SEL_MASK  (7 << 5)
 #define PS_PLANE_Y_SEL(plane) (((plane) + 1) << 5)
+#define PS_Y_VERT_FILTER_SELECT(set)   ((set) << 4)
+#define PS_Y_HORZ_FILTER_SELECT(set)   ((set) << 3)
+#define PS_UV_VERT_FILTER_SELECT(set)  ((set) << 2)
+#define PS_UV_HORZ_FILTER_SELECT(set)  ((set) << 1)
 
 #define _PS_PWR_GATE_1A     0x68160
 #define _PS_PWR_GATE_2A     0x68260
@@ -7278,6 +7283,25 @@ enum {
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
@@ -7307,6 +7331,30 @@ enum {
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
