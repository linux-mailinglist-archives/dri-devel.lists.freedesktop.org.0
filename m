Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F22CBFAD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 15:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776EE6EA3A;
	Wed,  2 Dec 2020 14:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E058D6EA38;
 Wed,  2 Dec 2020 14:31:09 +0000 (UTC)
IronPort-SDR: KYGK8nPvUd1kqy2AaYjLNnDAXqJ2TJzhzHuJhtAi7bTp9TqaNwQbmdDVbWMPISzJTdWwl2qMX8
 LXzL/jAs3uBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="257733793"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="257733793"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 06:30:31 -0800
IronPort-SDR: WidhVcJs2pe5qoPfXmJ7TFQqEU0p0Er+vWoHiSHp+DNqAnMUEF7TlQhxHTmqgS87zuA2Sx7TOZ
 MgCN1Lti6fYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="373191401"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by orsmga007.jf.intel.com with ESMTP; 02 Dec 2020 06:30:28 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 01/13] drm/edid: Add additional HFVSDB fields for HDMI2.1
Date: Wed,  2 Dec 2020 19:53:53 +0530
Message-Id: <20201202142405.14951-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142405.14951-1-ankit.k.nautiyal@intel.com>
References: <20201202142405.14951-1-ankit.k.nautiyal@intel.com>
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
Cc: swati2.sharma@intel.com, airlied@linux.ie, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

The HDMI2.1 extends HFVSDB (HDMI Forum Vendor Specific
Data block) to have fields related to newly defined methods of FRL
(Fixed Rate Link) levels, number of lanes supported, DSC Color bit
depth, VRR min/max, FVA (Fast Vactive), ALLM etc.

This patch adds the new HFVSDB fields that are required for
HDMI2.1.

v2: Minor fixes + consistent naming for DPCD register masks
(Uma Shankar)

Signed-off-by: Sharma, Swati2 <swati2.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 include/drm/drm_edid.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index e97daf6ffbb1..a158f585f658 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -229,6 +229,36 @@ struct detailed_timing {
 				    DRM_EDID_YCBCR420_DC_36 | \
 				    DRM_EDID_YCBCR420_DC_30)
 
+/* HDMI 2.1 additional fields */
+#define DRM_EDID_MAX_FRL_RATE_MASK		0xf0
+#define DRM_EDID_FAPA_START_LOCATION		(1 << 0)
+#define DRM_EDID_ALLM				(1 << 1)
+#define DRM_EDID_FVA				(1 << 2)
+
+/* Deep Color specific */
+#define DRM_EDID_DC_30BIT_420			(1 << 0)
+#define DRM_EDID_DC_36BIT_420			(1 << 1)
+#define DRM_EDID_DC_48BIT_420			(1 << 2)
+
+/* VRR specific */
+#define DRM_EDID_CNMVRR				(1 << 3)
+#define DRM_EDID_CINEMA_VRR			(1 << 4)
+#define DRM_EDID_MDELTA				(1 << 5)
+#define DRM_EDID_VRR_MAX_UPPER_MASK		0xc0
+#define DRM_EDID_VRR_MAX_LOWER_MASK		0xff
+#define DRM_EDID_VRR_MIN_MASK			0x3f
+
+/* DSC specific */
+#define DRM_EDID_DSC_10BPC			(1 << 0)
+#define DRM_EDID_DSC_12BPC			(1 << 1)
+#define DRM_EDID_DSC_16BPC			(1 << 2)
+#define DRM_EDID_DSC_ALL_BPP			(1 << 3)
+#define DRM_EDID_DSC_NATIVE_420			(1 << 6)
+#define DRM_EDID_DSC_1P2			(1 << 7)
+#define DRM_EDID_DSC_MAX_FRL_RATE_MASK		0xf0
+#define DRM_EDID_DSC_MAX_SLICES			0xf
+#define DRM_EDID_DSC_TOTAL_CHUNK_KBYTES		0x3f
+
 /* ELD Header Block */
 #define DRM_ELD_HEADER_BLOCK_SIZE	4
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
