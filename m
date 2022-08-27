Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233FD5A39D4
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 21:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E027110ED24;
	Sat, 27 Aug 2022 19:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0ADF10ED34;
 Sat, 27 Aug 2022 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661629558; x=1693165558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DMFsuu+fuwKWgAw4aT3XvpCUkg+UksyuSVnxJU0iZqw=;
 b=c/DkDO5p+c/l6vZdckh0V0lANdMWnSRlLYmjKNzcVJ4460qJEJx2lquU
 chA9Ce1Oa6Aa6BQ9/NvMnRWNn74XurPlAHZVPvxizuN8bMiFHCYYNdyW+
 K4fr5pKj+f5RLKvcYBierGIbqZ95o05Ho0gQ9rJ4QSAngQzMV2WuLN1UZ
 oeNNHuy8W/zKKxOpL7Amxs2XRsc0/l4dozjCBjkC0HdN37fU0nccBFxE3
 4hGDJyUyBlR6usDupsqwgw+yszj+tIvbomU8ARCzDqeh7exb+YeFXoniv
 PhnV22gd3CzCiOM0SK32h7UB+so2HRDDIVR4Nprjt6zypL/snbOMULG1b Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="293431112"
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="293431112"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="679209962"
Received: from hluxenbu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.75])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:54 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 06/17] drm/i915/dmabuf: Deny the dmabuf export for VM
 private BOs
Date: Sat, 27 Aug 2022 21:43:52 +0200
Message-Id: <20220827194403.6495-7-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220827194403.6495-1-andi.shyti@linux.intel.com>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Ramalingam C <ramalingampc2008@gmail.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

VM private BOs can be only mapped on specified VM and cannot be dmabuf
exported.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index f5062d0c63336..6433173c3e84d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -218,6 +218,12 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
 	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
+	if (obj->priv_root) {
+		drm_dbg(obj->base.dev,
+			"Exporting VM private objects is not allowed\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	exp_info.ops = &i915_dmabuf_ops;
 	exp_info.size = gem_obj->size;
 	exp_info.flags = flags;
-- 
2.34.1

