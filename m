Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF94C991C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76210E8C0;
	Tue,  1 Mar 2022 23:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF8B10E7BB;
 Tue,  1 Mar 2022 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646176590; x=1677712590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oS+vlLqsGiQ+UpcFP91BGhxhUB+vV0nBdn9UoU4yWhg=;
 b=fEmYytpyK3TIIB0iIg61ekQvFyqb/33VtN76Zu/Jjj9SuCZH1JVeEy62
 wNhUWSLFiSFS7p21tljnoiabGXD3TZCHkH9vo1jPbOGgCZR59SXHODFSG
 2jruDzskccmGLhhVKDL6Lh5AaJlVKz211np7jy21q/lUGePTcfqVRHsli
 /hVAGexiwGtmF/809pHGZMEAbKJzgTIDTp7YudBu5pKHcDXE+K1KF85Xx
 peDr17ExGfEiKHhPbYAJIrBF62CpANb02LsnoF6KoqaE1XlOUEvfAJ7ti
 vSXhDf6zlJPO23rtSpwoUunZHNZaFJMyJG2HdKxt5NYtVgYDFBiMGHsb+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316479068"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="316479068"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709253486"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 09/13] drm/i915/xehp/guc: enable compute engine inside GuC
Date: Tue,  1 Mar 2022 15:15:45 -0800
Message-Id: <20220301231549.1817978-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301231549.1817978-1-matthew.d.roper@intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Tell GuC that CCS is enabled by setting a bit in its ADS.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Original-author: Michel Thierry
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 29fbe4681ca7..9bb551b83e7a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -434,6 +434,7 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
 				     struct iosys_map *info_map)
 {
 	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], 1);
+	info_map_write(info_map, engine_enabled_masks[GUC_COMPUTE_CLASS], CCS_MASK(gt));
 	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
 	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
 	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));
-- 
2.34.1

