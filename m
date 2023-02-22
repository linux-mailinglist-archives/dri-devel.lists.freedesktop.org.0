Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C569EE58
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 06:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AC710E3E1;
	Wed, 22 Feb 2023 05:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8CB10E3C8;
 Wed, 22 Feb 2023 05:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677043987; x=1708579987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aXUz/m4zbl4WKC7y3ud/bU4Ydeh6EE8T+vUficha83k=;
 b=l9B/uBkK9nH2CloQMaUq/Egoa9SBqW1Hf5rrr/pyyYXM8CwNXw2jKlnv
 GDvY4d3gfdxUvlhExpXkQwDUJmcSU+R82hCbojRUNociKJ7KeU3J43coA
 //WfTiP9pS4KVZSda4vTjh7KbDuZgX+D0MQSX/o4/T8I/73wAVNN1VE3i
 lpg5zWI5V+lDRDsx7iFduRLNgabvhbNKvlReGO+mI8trZ6oxWY2t+DkgY
 LWWdENikeNuEOkQSwktrucrVUVLTDrQh8mKKjpeuXiksOUXvnnVh+NhrV
 c9xYpqqNCcVsyItdV3GLbGRMNPmZdhPRUs6777ctkmV4jg7adEHtY8PRA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332843212"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="332843212"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 21:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="917450518"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="917450518"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2023 21:33:05 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/7] drm/i915: Adding the new registers for DSC
Date: Wed, 22 Feb 2023 11:01:49 +0530
Message-Id: <20230222053153.3658345-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222053153.3658345-1-suraj.kandpal@intel.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Vandita Kulkarni <Vandita.kulkarni@intel.com>, ankit.k.nautiyal@intel.com,
 uma.shankar@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding new DSC register which are introducted MTL onwards

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Vandita Kulkarni <Vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 596efc940ee7..9e25e21d37e4 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7715,6 +7715,8 @@ enum skl_power_gate {
 #define ICL_DSC1_PICTURE_PARAMETER_SET_0(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
 							   _ICL_DSC1_PICTURE_PARAMETER_SET_0_PB, \
 							   _ICL_DSC1_PICTURE_PARAMETER_SET_0_PC)
+#define  DSC_NATIVE_422_ENABLE		BIT(23)
+#define  DSC_NATIVE_420_ENABLE		BIT(22)
 #define  DSC_ALT_ICH_SEL		(1 << 20)
 #define  DSC_VBR_ENABLE			(1 << 19)
 #define  DSC_422_ENABLE			(1 << 18)
@@ -7959,6 +7961,32 @@ enum skl_power_gate {
 #define  DSC_SLICE_PER_LINE(slice_per_line)		((slice_per_line) << 16)
 #define  DSC_SLICE_CHUNK_SIZE(slice_chunk_size)		((slice_chunk_size) << 0)
 
+/* MTL Display Stream Compression registers */
+#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB	0x782B4
+#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB	0x783B4
+#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC	0x784B4
+#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC	0x785B4
+#define MTL_DSC0_PICTURE_PARAMETER_SET_17(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
+							   _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB, \
+							   _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC)
+#define MTL_DSC1_PICTURE_PARAMETER_SET_17(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
+							   _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB, \
+							   _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC)
+#define DSC_SL_BPG_OFFSET(offset)		((offset) << 27)
+
+#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB	0x782B8
+#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB	0x783B8
+#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC	0x784B8
+#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC	0x785B8
+#define MTL_DSC0_PICTURE_PARAMETER_SET_18(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
+							   _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB, \
+							   _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC)
+#define MTL_DSC1_PICTURE_PARAMETER_SET_18(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
+							   _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB, \
+							   _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC)
+#define DSC_NSL_BPG_OFFSET(offset)		((offset) << 16)
+#define DSC_SL_OFFSET_ADJ(offset)		((offset) << 0)
+
 /* Icelake Rate Control Buffer Threshold Registers */
 #define DSCA_RC_BUF_THRESH_0			_MMIO(0x6B230)
 #define DSCA_RC_BUF_THRESH_0_UDW		_MMIO(0x6B230 + 4)
-- 
2.25.1

