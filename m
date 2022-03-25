Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D6D4E7A1D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBE810E97C;
	Fri, 25 Mar 2022 17:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D4610E8EF;
 Fri, 25 Mar 2022 17:53:11 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id k21so14640630lfe.4;
 Fri, 25 Mar 2022 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLgjjMSuFWQdL+dKuSVaDlRlfsfwjYB9yjRacbyvBAg=;
 b=idb7lzMCnWEbezjpXE9rxAJr/VOHsHBfnwgr5E/fRG+h77t7cN/X9fjKUCZD5H9E5u
 GSjmUMQAllN2jv/kXhTN+9q6wtKqVaD6t6xgOBrCUTw9fhvioebdL9y78UvB6XtjcM2w
 8RvZsh5MXdXNXKAk3kSklaDHB9RGgeDOUzdiziXBBwKbNVvXRF8eg9JIe94wq551QvbW
 hm7fhNHKwyjmwx5PWtTP0fKKSWA0Yqq4DMyRxkwhxmz+Tq4AE+LRduLSdo058F2dltuS
 f/vUglgcITMP9i9pBCHpir3iPpRxbaNnWAjzin1YA1yqjyOrWGBTeMCCe2H7KsBxNBCG
 XzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLgjjMSuFWQdL+dKuSVaDlRlfsfwjYB9yjRacbyvBAg=;
 b=oUMbGaXob+cgswO1LENd1i3ZyUWpkEDRCrakBN0+a0NOd7kIaZ6xxg0c/St64n4lOZ
 e2mstBLrBmUK5ExKnfGAKxpDWT6abpncFda+pbG3JX/fBPyP5GDTzFjPAEdkCG+B42ND
 gI/svLpfhWsoX3GnvrmuBBZO44DsNIlYllospH5dxr7YVxrnDbR4gjnYqdEPiDuzvGcX
 xIBhp0jXcAtL7JOSII3ilgJ4Bov94Axh+G/1kxgG1nrSyp8EamUhGygbvDe6KT7wEKRP
 07YRk0r83XES131sagH873f/u/tXX5+i/jB+yBKrct+NAMSb6yljXoeew3bLt3Rsy16u
 rdIQ==
X-Gm-Message-State: AOAM531yBSJiSDUb/g0r5IT0p8wf+G4OOMOJ/nu+8n2mt3Io5YTth68K
 8+/hVw2sCGEAdMY3Hw723Ux9PXerQaA=
X-Google-Smtp-Source: ABdhPJygl9p/SrnsG+58B/oLdqZT57Xs3JA2FTcoaJGyz/rq48oAawcTn4cGjfraswTc/MhJHp1lPg==
X-Received: by 2002:a05:6512:3b21:b0:44a:20fc:3e15 with SMTP id
 f33-20020a0565123b2100b0044a20fc3e15mr8650907lfv.266.1648230789531; 
 Fri, 25 Mar 2022 10:53:09 -0700 (PDT)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 z17-20020ac24191000000b004483a4d9a3esm775738lfh.152.2022.03.25.10.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:53:09 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v7 2/3] i915/gvt: Save the initial HW state snapshot in i915
Date: Fri, 25 Mar 2022 13:52:50 -0400
Message-Id: <20220325175251.167164-2-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325175251.167164-1-zhi.a.wang@intel.com>
References: <20220325175251.167164-1-zhi.a.wang@intel.com>
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
index 418091484e02..0edc9ecbd403 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -429,6 +429,8 @@ struct i915_virtual_gpu {
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

