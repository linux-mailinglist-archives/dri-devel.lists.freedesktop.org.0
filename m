Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2C649D3A0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3E410E948;
	Wed, 26 Jan 2022 20:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71F110E804;
 Wed, 26 Jan 2022 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229387; x=1674765387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YL9g6mxphtGpceT8p5dx9hnpQ0pfIWes8938xxVyozA=;
 b=ZEPDutx/8UKOqv2pU+K0wzxaqT/jZp5eufNPfcYMfqfegJloxiMC3GPA
 5pxU/poMMtNyPQap8eHvXkOpM3EA5149hq2Zkbn7rCYVwHmuAGLvc12Dk
 A3ONCI/uc2DPTptVmm81UgqxLaLLUenzzLUMPHwb52QSi3GLUrvBpbw5g
 TxM8U8GYFw2OHOejbY4Uf1FACBhxP9sCEYCQR3OtTXoUGC2QfNbYW0nEz
 ofozXma80UvTz0ID/q4KFBRPx0kfjCNzcvDFZM9QwvCshg+INgLU20vRr
 uSUq/WfdDxk94G2ab19b3vhRW53/LHRTRO/vDDxQCvPkfdMioNhR4ZumB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000508"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000508"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221522"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/19] drm/i915/guc: Convert guc_ads_private_data_reset to
 dma_buf_map
Date: Wed, 26 Jan 2022 12:36:53 -0800
Message-Id: <20220126203702.1784589-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220126203702.1784589-1-lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dma_buf_map_memset() to zero the private data as ADS may be either
on system or IO memory.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index fe1e71adfca1..15990c229b54 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -668,14 +668,15 @@ void intel_guc_ads_destroy(struct intel_guc *guc)
 
 static void guc_ads_private_data_reset(struct intel_guc *guc)
 {
+	struct dma_buf_map map =
+		DMA_BUF_MAP_INIT_OFFSET(&guc->ads_map, guc_ads_private_data_offset(guc));
 	u32 size;
 
 	size = guc_ads_private_data_size(guc);
 	if (!size)
 		return;
 
-	memset((void *)guc->ads_blob + guc_ads_private_data_offset(guc), 0,
-	       size);
+	dma_buf_map_memset(&map, 0, size);
 }
 
 /**
-- 
2.35.0

