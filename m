Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3E02849B7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 11:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D516189BC2;
	Tue,  6 Oct 2020 09:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D319589BA5;
 Tue,  6 Oct 2020 09:54:32 +0000 (UTC)
IronPort-SDR: NDZntTKkNGw5ZTAG/rSK+vyuWHfaLOZsT6sj+zOwWL1b2gReaftBVadcXP25hZv5XtnjxwLRM3
 wEaolvuC+ghQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="151361677"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="151361677"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 02:54:32 -0700
IronPort-SDR: 8R2rYtjwdhPXlmgOfU9EmNXn+NhmrP4xuGa4OqK9InxH+7butQOaIaT9hVH0VhTXyeUgeO7Yy/
 mouvYqQz3C9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="342171687"
Received: from unknown (HELO linux-akn.iind.intel.com) ([10.223.34.148])
 by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2020 02:54:29 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC 1/8] drm/edid: Add additional HFVSDB fields for HDMI2.1
Date: Tue,  6 Oct 2020 15:17:12 +0530
Message-Id: <20201006094719.24119-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006094719.24119-1-ankit.k.nautiyal@intel.com>
References: <20201006094719.24119-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org, swati2.sharma@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

The HDMI2.1 extends HFVSBD (HDMI Forum Vendor Specific
Data block) to have fields related to newly defined methods of FRL
(Fixed Rate Link) levels, number of lanes supported, DSC Color bit
depth, VRR min/max, FVA (Fast Vactive), ALLM etc.

This patch adds the new HFVSDB fields that are required for
HDMI2.1.

Signed-off-by: Sharma, Swati2 <swati2.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/drm_edid.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b27a0e2169c8..3b6371f36676 100644
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
+#define DRM_EDID_DSC_10				(1 << 0)
+#define DRM_EDID_DSC_12				(1 << 1)
+#define DRM_EDID_DSC_16				(1 << 2)
+#define DRM_EDID_DSC_ALL			(1 << 3)
+#define DRM_EDID_DSC_NATIVE_420			(1 << 6)
+#define DRM_EDID_1P2				(1 << 7)
+#define DRM_EDID_DSC_MAX_FRL_RATE		0xf
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
