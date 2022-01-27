Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA749E1F3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 13:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2D810EE9D;
	Thu, 27 Jan 2022 12:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0220310EE87;
 Thu, 27 Jan 2022 12:05:42 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id q127so4008503ljq.2;
 Thu, 27 Jan 2022 04:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PD8tG4uBUkcfc+ygEPwPwH4Q/3Yqv2G5LtNythjO6r8=;
 b=IEn0v+nEk4s7ATLA40gu/51VvwmLnZ5+EDjqDSNZjXn9oAdZkoAZEUnYo8iUzmLjfJ
 3xpxL8x02+qJviHJkBAzrd0ma8lg4omZ5x/3APDGy8KtdIcTIP7Fl+C0rgwHyh1JyoIZ
 5cgWNHNqFCfO/3dEfBysAE5MwtihTIwCcL1GjbIdAxNhXXYD+0pqtVWsU00DRH3orXYC
 5hPDgcO+SlcRY4nnmRF40FiFUB0/deMeK0kfxXPIdZ8VcgqVCAUGcdQySOGAm5/rOP3W
 uU4PX7uuXK2QsHdm5J3flUI2nZdD3IZ20vw+qFrUMa4/rtUs0hRuoc3ic4/3jbITLiAe
 ejQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PD8tG4uBUkcfc+ygEPwPwH4Q/3Yqv2G5LtNythjO6r8=;
 b=Bjl541eITnkTrXjDaLwH/1nfknwM7ZRoQ4Igc2k+KGnTJ/nhKhno8w67p1rCbzK5J8
 4plxXptVprWl+dpHKrlRzWTLXUfHD7pcapg6Dj49cvuAv7k5oEhCk/cIefsWiQDZNgLp
 Z0vQo7IUx5a3PO5bkXutfIPU4XOZpDPNNq/J2xt2txhSWksJorvAzb0A5RULDDC51GE4
 wHwRqL0Th+IAR94m82MYbDVgmpl3u0vN9GgQm8ACEofM/j6NtuPT60+6NcZTJdL4olHu
 7bK9OXeJS8G/LObUiN5Qxxus5/CNOyT7DPqKVprPN+N2kQYs+AiCevX99mTF+kmdz5oD
 uu5Q==
X-Gm-Message-State: AOAM5307s3q8/fI4RoQvk9wkTOPSxu/c7H17Ahefjama+Yy7+Y7IDpZn
 l5AP3tzxmC+weLcyJI96xpA=
X-Google-Smtp-Source: ABdhPJxxeI5fs45mqHhhgEeX1Spuc5wCJ1pLLSnlirJAwcgZEVPpVO2NQu3ytU+zS3CsOvhUr4lFow==
X-Received: by 2002:a2e:50c:: with SMTP id 12mr2555635ljf.461.1643285141251;
 Thu, 27 Jan 2022 04:05:41 -0800 (PST)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id b5sm1418722ljk.123.2022.01.27.04.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:05:40 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: hch@lst.de,
	jgg@nvidia.com,
	jani.nikula@linux.intel.com
Subject: [PATCH 2/3] i915/gvt: save the initial HW state snapshot in i915.
Date: Thu, 27 Jan 2022 07:05:07 -0500
Message-Id: <20220127120508.11330-2-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127120508.11330-1-zhi.a.wang@intel.com>
References: <20220127120508.11330-1-zhi.a.wang@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Save the inital HW state snapshot in i915 so that the rest code of GVT-g
can be moved into a dedicated module while it can still get a clean
initial HW state saved at the correct time during the initialization of
i915. The futhrer vGPU created by GVT-g will use this HW state as the
initial HW state.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h  |   2 +
 drivers/gpu/drm/i915/intel_gvt.c | 110 ++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 44c1f98144b4..2a230840cdfa 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -606,6 +606,8 @@ struct i915_virtual_gpu {
 	struct mutex lock; /* serialises sending of g2v_notify command pkts */
 	bool active;
 	u32 caps;
+	u32 *initial_mmio;
+	u8 *initial_cfg_space;
 };
 
 struct i915_selftest_stash {
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index cf6e98962d82..a3d8bdb24d3f 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -86,6 +86,103 @@ void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
 	dev_priv->params.enable_gvt = 0;
 }
 
+static void free_initial_hw_state(struct drm_i915_private *dev_priv)
+{
+	struct i915_virtual_gpu *vgpu = &dev_priv->vgpu;
+
+	vfree(vgpu->initial_mmio);
+	vgpu->initial_mmio = NULL;
+
+	kfree(vgpu->initial_cfg_space);
+	vgpu->initial_cfg_space = NULL;
+}
+
+static void save_mmio(struct intel_gvt_mmio_table_iter *iter, u32 offset,
+		      u32 size)
+{
+	struct drm_i915_private *dev_priv = iter->i915;
+	void *mmio = iter->data;
+	u32 start, end, i;
+
+	start = offset;
+	end = offset + size;
+
+	for (i = start; i < end; i += 4) {
+		*(u32 *)(mmio + i) = intel_uncore_read_notrace(
+				to_gt(dev_priv)->uncore, _MMIO(offset));
+	}
+}
+
+static int do_mmio(u32 offset, u16 flags, u32 size, u32 addr_mask,
+		   u32 ro_mask, u32 device,
+		   struct intel_gvt_mmio_table_iter *iter)
+{
+	if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		return -EINVAL;
+
+	save_mmio(iter, offset, size);
+	return 0;
+}
+
+static int do_mmio_block(u32 offset, u32 size, u32 device,
+			 struct intel_gvt_mmio_table_iter *iter)
+{
+	if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		return -EINVAL;
+
+	save_mmio(iter, offset, size);
+	return 0;
+}
+
+static int save_inital_hw_state(struct drm_i915_private *dev_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+	struct intel_gvt_device_info info;
+	struct i915_virtual_gpu *vgpu = &dev_priv->vgpu;
+	struct intel_gvt_mmio_table_iter iter;
+	void *mem;
+	int i, ret;
+
+	intel_gvt_init_device_info(dev_priv, &info);
+
+	mem = kzalloc(info.cfg_space_size, GFP_KERNEL);
+	if (!mem)
+		return -ENOMEM;
+
+	vgpu->initial_cfg_space = mem;
+
+	for (i = 0; i < PCI_CFG_SPACE_EXP_SIZE; i += 4)
+		pci_read_config_dword(pdev, i, mem + i);
+
+	mem = vzalloc(info.mmio_size);
+	if (!mem) {
+		ret = -ENOMEM;
+		goto err_mmio;
+	}
+
+	vgpu->initial_mmio = mem;
+
+	iter.i915 = dev_priv;
+	iter.data = vgpu->initial_mmio;
+	iter.do_mmio = do_mmio;
+	iter.do_mmio_block = do_mmio_block;
+
+	ret = intel_gvt_iterate_mmio_table(&iter);
+	if (ret)
+		goto err_iterate;
+
+	return 0;
+
+err_iterate:
+	vfree(vgpu->initial_mmio);
+	vgpu->initial_mmio = NULL;
+err_mmio:
+	kfree(vgpu->initial_cfg_space);
+	vgpu->initial_cfg_space = NULL;
+
+	return ret;
+}
+
 /**
  * intel_gvt_init - initialize GVT components
  * @dev_priv: drm i915 private data
@@ -115,15 +212,23 @@ int intel_gvt_init(struct drm_i915_private *dev_priv)
 		return -EIO;
 	}
 
+	ret = save_inital_hw_state(dev_priv);
+	if (ret) {
+		drm_dbg(&dev_priv->drm, "Fail to save inital HW state\n");
+		goto err_save_hw_state;
+	}
+
 	ret = intel_gvt_init_device(dev_priv);
 	if (ret) {
 		drm_dbg(&dev_priv->drm, "Fail to init GVT device\n");
-		goto bail;
+		goto err_init_device;
 	}
 
 	return 0;
 
-bail:
+err_init_device:
+	free_initial_hw_state(dev_priv);
+err_save_hw_state:
 	dev_priv->params.enable_gvt = 0;
 	return 0;
 }
@@ -147,6 +252,7 @@ void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 		return;
 
 	intel_gvt_clean_device(dev_priv);
+	free_initial_hw_state(dev_priv);
 }
 
 /**
-- 
2.25.1

