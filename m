Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60894F7740
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791F810E4AA;
	Thu,  7 Apr 2022 07:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D27B10E48B;
 Thu,  7 Apr 2022 07:19:53 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q14so6251161ljc.12;
 Thu, 07 Apr 2022 00:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LV373kX4fLfELSmndVIxiO5YeeHiT9L2fCGascwOW60=;
 b=ePm/fLsKnUbkQBkDcJ/iHBm7pYapr7DQEcDXZnwcufGKzkZnajQNKIoo4Cs1U7D1lE
 j0XhOzhMvi7gz5MynkwCqbr9DQvIUruSkyX72p7E3zgN0gPyUiKvoxzcog9RtSqA4L+p
 +cIOjE/IDoN+kAOvcET4mW5EeYzUlqumrEkGjP+YrJHiGD9n/S+1FgNUuUYRJDv+effb
 clEVOM0OxbwOUa8Rba2DfrFwKrvn9sMtYZZCnYuIB7dn49GiRfZe0u4LImRqKtK+mYL1
 C6FKmnX88lC7j6u+Phz4RHfYBqTP9Elu5QdWuM1HPLf2POC+WUehvwWyAj6c8R0Xqqn8
 aGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LV373kX4fLfELSmndVIxiO5YeeHiT9L2fCGascwOW60=;
 b=I/IiHi1WnyBatMQhRoPqb9dmli7P7bZfg2y7OBZi3e54xh2qaQZocGwfuf8gGiCEVd
 MrKhFtQbrJGiBBlVnMqBlebTkM9BPVji9ev+ghhWy4ZHSy+fIqE/Xjal9xLLjqm52qY7
 SOy1PGuh50Gnqa6JKsEvA+ZEFYJnrJPOtYTPnb2kDNpde4xFgb3RLsn5R9xS5+Of8GPA
 iYcwCv8NIGOQDMvQMqtzkraPpj7rqsbR3mskr9nHWjD2XSbS5s9T6KtEx0uM1c24slRm
 zSZuTshPRHyTAGeKNUsQOhfCe4zH2I0+QXy9A0vuoRjBAMHLmtUV7oV64z2UoACZtJLE
 Va+A==
X-Gm-Message-State: AOAM533W+9y1NLUNbZWOec+cat4xj1rs/PXqHqQ33qppkwh0qKWtJ3oH
 gow37GDYyyGMmIo+2pVnyqQYpL76b3o=
X-Google-Smtp-Source: ABdhPJxMSCswxp6dJAppuWQhhualmSJRIArNFTwDCemjfULlriSmPnJsezyI3XTBrzNj5Qg/Tz7aJQ==
X-Received: by 2002:a2e:a7c7:0:b0:249:8273:b488 with SMTP id
 x7-20020a2ea7c7000000b002498273b488mr7874222ljp.238.1649315991248; 
 Thu, 07 Apr 2022 00:19:51 -0700 (PDT)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056512220a00b0044a308dad8csm2081465lfu.149.2022.04.07.00.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 00:19:50 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v9 2/3] i915/gvt: Save the initial HW state snapshot in i915
Date: Thu,  7 Apr 2022 03:19:44 -0400
Message-Id: <20220407071945.72148-3-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407071945.72148-1-zhi.a.wang@intel.com>
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Save the initial HW state snapshot in i915 so that the rest code of GVT-g
can be moved into a dedicated module while it can still get a clean
initial HW state saved at the correct time during the initialization of
i915. The futhrer vGPU created by GVT-g will use this HW state as the
initial HW state.

v6:
- Remove the reference of intel_gvt_device_info.(Christoph)
- Refine the save_mmio() function. (Christoph)

Cc: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h  |  2 +
 drivers/gpu/drm/i915/intel_gvt.c | 92 +++++++++++++++++++++++++++++++-
 2 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 943267393ecb..abb39444b8be 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -421,6 +421,8 @@ struct i915_virtual_gpu {
 	struct mutex lock; /* serialises sending of g2v_notify command pkts */
 	bool active;
 	u32 caps;
+	u32 *initial_mmio;
+	u8 *initial_cfg_space;
 };
 
 struct i915_selftest_stash {
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index cf6e98962d82..65daab2c4d9e 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -86,6 +86,85 @@ void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
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
+	u32 *mmio, i;
+
+	for (i = offset; i < offset + size; i += 4) {
+		mmio = iter->data + i;
+		*mmio = intel_uncore_read_notrace(to_gt(dev_priv)->uncore,
+						  _MMIO(i));
+	}
+}
+
+static int handle_mmio(struct intel_gvt_mmio_table_iter *iter,
+		       u32 offset, u32 size)
+{
+	if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		return -EINVAL;
+
+	save_mmio(iter, offset, size);
+	return 0;
+}
+
+static int save_initial_hw_state(struct drm_i915_private *dev_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+	struct i915_virtual_gpu *vgpu = &dev_priv->vgpu;
+	struct intel_gvt_mmio_table_iter iter;
+	void *mem;
+	int i, ret;
+
+	mem = kzalloc(PCI_CFG_SPACE_EXP_SIZE, GFP_KERNEL);
+	if (!mem)
+		return -ENOMEM;
+
+	vgpu->initial_cfg_space = mem;
+
+	for (i = 0; i < PCI_CFG_SPACE_EXP_SIZE; i += 4)
+		pci_read_config_dword(pdev, i, mem + i);
+
+	mem = vzalloc(2 * SZ_1M);
+	if (!mem) {
+		ret = -ENOMEM;
+		goto err_mmio;
+	}
+
+	vgpu->initial_mmio = mem;
+
+	iter.i915 = dev_priv;
+	iter.data = vgpu->initial_mmio;
+	iter.handle_mmio_cb = handle_mmio;
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
@@ -115,15 +194,23 @@ int intel_gvt_init(struct drm_i915_private *dev_priv)
 		return -EIO;
 	}
 
+	ret = save_initial_hw_state(dev_priv);
+	if (ret) {
+		drm_dbg(&dev_priv->drm, "Fail to save initial HW state\n");
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
@@ -147,6 +234,7 @@ void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 		return;
 
 	intel_gvt_clean_device(dev_priv);
+	free_initial_hw_state(dev_priv);
 }
 
 /**
-- 
2.25.1

