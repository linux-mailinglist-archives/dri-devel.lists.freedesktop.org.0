Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53164AD5F5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DED110E5ED;
	Tue,  8 Feb 2022 11:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0982410E484;
 Tue,  8 Feb 2022 11:12:03 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q22so23903493ljh.7;
 Tue, 08 Feb 2022 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYg4fF82TqldaTKh+wvFHU/Pm9VH0/HNJEVIn7SmcZA=;
 b=ULyJi7vlcuUm3UxFTk+EU+vyELQ52olCKW21A88P4t/7L7ApAdDIRLkm9yKeIpyZlB
 7bOe89rgpQkfq4+TS82wBctMnz9JuzPBLJRmqHBtg11IegldDnMXnVNN38HwZQDbpnUB
 4SD8jBmjzHVBlLm8tfg+/nGCuF7iowKI7Km+or/2MLKKGGkbnYBvVlnaXqTmWT7tSEsA
 6pO7iFxMFkre0ZrXt892X+dn0EGxqcSqrhlTJSGeKE7ZipXsPsHkCHU+RlAGUkZNZ1ts
 jMIjAwinBk1CwJYhJKSt7xfWVBH1nIJGXVumNdqYytnOGCPzqH94QeKp89lJCAxq75xI
 rw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYg4fF82TqldaTKh+wvFHU/Pm9VH0/HNJEVIn7SmcZA=;
 b=FbFGTET4Fq6xo0SWbudxM7nD2gUkZFyE+/APX+gC/aQQ/hiye2Q/v3L5IXoTLpEGLn
 yj9tf32NGXuSdRisomoFFgQLL+2mBwpquEacQoORbQ5+X9D0vigtLUA2dYJxk3CFZMjx
 GTSxeRkiIhGbJnSajXpcdEguWnj/9h8Q6A3uqpE/pPsKDst9EwhPCsKzxhUc11ibrK2n
 T944K/OR53OIOgnT0MQ8UN1heGSB9VtRTMnnKqW6dInTyhRzYBTAE+9YkBKkhXc6WJN5
 XM09yPpfFjUsUl0PQXLkh0zaS4CJaj5+1EyIUodTRdnqHreZc4f3JKOaJT4uoBUULfRr
 96hA==
X-Gm-Message-State: AOAM531GpHphg2lH+EkoXFb2jCI8dvBnyeqn83RJDS98z5PXQgNV3QeR
 hnlukLhqWbt3z2cclfblTZKzSeeeFbtzEQ==
X-Google-Smtp-Source: ABdhPJxHeItkLS/PGpyVuGpkIIYboI4f1+7XvHQNussyzApZbNzgfArHsxupAEDdhNm4vIxbWcAJpw==
X-Received: by 2002:a2e:7219:: with SMTP id n25mr2380480ljc.204.1644318721250; 
 Tue, 08 Feb 2022 03:12:01 -0800 (PST)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id j20sm1878093lfg.232.2022.02.08.03.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:12:00 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: hch@lst.de,
	jgg@nvidia.com,
	jani.nikula@linux.intel.com
Subject: [PATCH v6 2/3] i915/gvt: Save the initial HW state snapshot in i915
Date: Tue,  8 Feb 2022 06:11:50 -0500
Message-Id: <20220208111151.13115-2-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208111151.13115-1-zhi.a.wang@intel.com>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
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
index 32aa6f111d6b..c5019173ac44 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -68,6 +68,85 @@ void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
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
+		       u32 offset, u32 device, u32 size)
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
@@ -97,15 +176,23 @@ int intel_gvt_init(struct drm_i915_private *dev_priv)
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
@@ -129,6 +216,7 @@ void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 		return;
 
 	intel_gvt_clean_device(dev_priv);
+	free_initial_hw_state(dev_priv);
 }
 
 /**
-- 
2.25.1

