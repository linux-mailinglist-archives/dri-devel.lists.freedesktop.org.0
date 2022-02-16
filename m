Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FAD4B8F64
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345E310E860;
	Wed, 16 Feb 2022 17:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC07210E6FA;
 Wed, 16 Feb 2022 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033254; x=1676569254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ioKKATaD12FXahK6GFfhLt2aX4ido1jwzEB+aWAfOo0=;
 b=eKyPf5m1pgczTLqp8i2JuVjFnAFzmqcPdSPKsfx9M1kxkLwZkoE8usap
 B8pQD+ch11AcH3jvbbOlwb+N+9AjDcr9BsU7zHCyqmO6Jh9MBqveZMrxG
 amYMf7m2ZxRkImks7vKyF4v5/2n7zmyr41gObAJIMF9u1kXbEFgk+vZp5
 yv73oyqWVKlKieRfSmEwYYEarKRLSK3V+nvj/uqzl7sNNeX+TWfV6pWld
 efE2oiSj/b7F/F7nnwQEfkxJNUXU96f9W9cQzn0hsejcjx17Y91an3Hua
 KkUHVGe8hdIeMSNhQoJZAFPSmKM9uw2SUrzxAayo+A/Z285BNi9vjg3Ua g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641939"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641939"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226629"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:53 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/16] drm/i915/guc: Add read/write helpers for ADS blob
Date: Wed, 16 Feb 2022 09:41:36 -0800
Message-Id: <20220216174147.3073235-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216174147.3073235-1-lucas.demarchi@intel.com>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
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
 Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers on top of iosys_map_read_field() /
iosys_map_write_field() functions so they always use the right
arguments and make code easier to read.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 4ea842752bbc..b645df7d46b6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -60,6 +60,13 @@ struct __guc_ads_blob {
 	struct guc_mmio_reg regset[0];
 } __packed;
 
+#define ads_blob_read(guc_, field_)					\
+	iosys_map_rd_field(&(guc_)->ads_map, 0, struct __guc_ads_blob, field_)
+
+#define ads_blob_write(guc_, field_, val_)				\
+	iosys_map_wr_field(&(guc_)->ads_map, 0, struct __guc_ads_blob,	\
+			   field_, val_)
+
 static u32 guc_ads_regset_size(struct intel_guc *guc)
 {
 	GEM_BUG_ON(!guc->ads_regset_size);
-- 
2.35.1

