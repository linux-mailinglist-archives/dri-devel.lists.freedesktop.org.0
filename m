Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29EB49D39F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC9210E905;
	Wed, 26 Jan 2022 20:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B02910E804;
 Wed, 26 Jan 2022 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229387; x=1674765387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i9SXXTzxPQ1P+9nF2qf0V+DxxwDMxeYlRcXvTTY7RFc=;
 b=DsBnfXOfYMuNdlppXTOBs+x/XT1it6DarjwE89dlylb7tZx8jc0cHmK4
 T/gVdiixKAGtnjp8Fh8Ajxlwgc/qVzXDWfCqMxqtMAWWrmMYD/+PR5oTD
 1/QAnxL4rwTF0Jg9WJkuU+HSwceRFTnAaa9cyOAkXtZ9+AM1acDO1jMqt
 Akwl0SSKiArgBj9oG3z0Boz8ypzhys4YmwExceeQWsqfPQHAKE+j1NkPi
 UKipecfYkdug5bYEC7aP+z8pt6it3jAS0OQOspGYvBR04m8+i2o0ZVltH
 TdAYeR7il9I9fc9/0FXvdP2GQ/OYDEfJuyS1yJrxLlmLhfMGk6Qzt02fk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000501"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000501"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221504"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/19] drm/i915/guc: Add read/write helpers for ADS blob
Date: Wed, 26 Jan 2022 12:36:48 -0800
Message-Id: <20220126203702.1784589-6-lucas.demarchi@intel.com>
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

Add helpers on top of dma_buf_map_read_field() /
dma_buf_map_write_field() functions so they always use the right
arguments and make code easier to read.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index c012858376f0..01d2c1ead680 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -59,6 +59,14 @@ struct __guc_ads_blob {
 	struct guc_mmio_reg regset[0];
 } __packed;
 
+#define ads_blob_read(guc_, field_)					\
+	dma_buf_map_read_field(&(guc_)->ads_map, struct __guc_ads_blob,	\
+			       field_)
+
+#define ads_blob_write(guc_, field_, val_)				\
+	dma_buf_map_write_field(&(guc_)->ads_map, struct __guc_ads_blob,\
+				field_, val_)
+
 static u32 guc_ads_regset_size(struct intel_guc *guc)
 {
 	GEM_BUG_ON(!guc->ads_regset_size);
-- 
2.35.0

