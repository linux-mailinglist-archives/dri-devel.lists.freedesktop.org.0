Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62FC517173
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD7C10EA1D;
	Mon,  2 May 2022 14:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A7A10EA15;
 Mon,  2 May 2022 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651501518; x=1683037518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=51yA0eOWD3xJqFpNFCK2XhtwOD9fR3+eVOFDRVMwPJM=;
 b=BqmZDg4JoddQTihg6mQwHq8AZ/F8B24VDNBh5XPKNzynzJndvzzBpbah
 IGxpV7FhuygbstjA6r23VqftcS7Md+6Ou7mWBAdN5VJkuq4itg6RrrSph
 hz7eu7iB/yKG76lIghnlrYlOXuuJ3lKtW1xVQ5zLYK8t8Ti80gxcxf9P3
 wcZqEEQle88BN0wNoeYUeVvGP8Bo3Nz1dJ5CIaztTpVO/OdAV2wCI2nZW
 ec/Zdz62741RvdoTu3v1v1aLbnujwrgC1W/ihAh/1wxnr/EpXoVLTsXXF
 rttyrqfJuOlH5FyjQkfHYbPx29w3+jZaH95GbgrCBQQfLfr7dX8pWhnUg w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292403398"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="292403398"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:25:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="516111151"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:25:17 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/3] drm/i915/gt: BUG_ON unexpected NULL at scatterlist
 walking
Date: Mon,  2 May 2022 19:56:16 +0530
Message-Id: <20220502142618.2704-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220502142618.2704-1-ramalingam.c@intel.com>
References: <20220502142618.2704-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While locating the start of ccs scatterlist in smem scatterlist, that has
to be the size of lmem obj size + corresponding ccs data size, report bug
if scatterlist terminate before that length.

v2:
  s/GEM_BUG_ON/BUG_ON with more commenting [Matt]
v3:
  Converted GEM_BUG_ON into BUG_ON with more documentation [Matt]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> (v1)
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 9d552f30b627..168d17b6f48a 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -687,6 +687,16 @@ static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
 		bytes_to_cpy -= len;
 
 		it->sg = __sg_next(it->sg);
+
+		/*
+		 * On Flat-CCS capable platform when we back the lmem pages with
+		 * smem pages we add extra pages at the end of the smem
+		 * scatterlist, to store the ccs data corresponding to the lmem
+		 * pages. get_ccs_sg_sgt() is called to get the pointer for the
+		 * start of the extra pages added at the end of smem scatterlist.
+		 * So scatterlist can't end at or before bytes_to_cpy.
+		 */
+		BUG_ON(!it->sg);
 		it->dma = sg_dma_address(it->sg);
 		it->max = it->dma + sg_dma_len(it->sg);
 	} while (bytes_to_cpy);
@@ -748,8 +758,10 @@ intel_context_migrate_copy(struct intel_context *ce,
 		 * Need to fix it.
 		 */
 		ccs_bytes_to_cpy = src_sz != dst_sz ? GET_CCS_BYTES(i915, bytes_to_cpy) : 0;
-		if (ccs_bytes_to_cpy)
+		if (ccs_bytes_to_cpy) {
+			WARN_ON(abs(src_sz - dst_sz) < ccs_bytes_to_cpy);
 			get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
+		}
 	}
 
 	src_offset = 0;
-- 
2.20.1

