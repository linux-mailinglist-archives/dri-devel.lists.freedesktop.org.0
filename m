Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4341931BA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 21:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461336E1B7;
	Wed, 25 Mar 2020 20:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2BD6E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 20:16:07 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z5so4028410wml.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yPLnagV0XBnTWT+nGjtRaD+LnSq2BqmeAJnp8U+CWPw=;
 b=sj7XVraxdwiyRAeepEQ0wy1nLUUH6vcloNotxoFwaAZmvU2GILePtp+OM8VZxzmSg1
 qVjos+BzgdtxI0QGYvlsRwZJmw1PdwfTDzM8kMKmP2AfXDgnFG7LZsGZnzTmdPqErqG6
 RfQwpZiPunHplEvI/epnPHACQlV9HoX+teAIWP9gyJkMYwBCVOirkfv4yGqGZWyEciZ2
 yM5mGeUZ/OprHtVVEEuF5yb50CJm8cBEHBMr2ooS+0jm+avVEG8DKe9QM2nWgJB7+TXH
 7+iryK1A4PDr9L6syw0p6sAbkFd2+P/p44d/rqsKPWTQG0lkd0cgRHx9fVPls/P4Snyr
 JwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yPLnagV0XBnTWT+nGjtRaD+LnSq2BqmeAJnp8U+CWPw=;
 b=jemVQ0SgerSYn1GkJglPAeAkRH9I23h9T7jcncCBySYKSWNqetgBQqDtkpoeKy4f4g
 vnsh2o2TvOICNqdJAho3IRHo4eF1SwXaXRltaUYrv3RfVv7qgNMyPGPSjY2xI+iaFkAZ
 BsGl4fdtf/eCg+IYtzFn/VPPjA7SszZP7sHSz94i8wrM7jHx7jva1r7qciWM8+AdWy8w
 oXLAiBPCvG/j2HIfL7IB3foDuR1djsjUjyVbuXW0Vcs9wlqr+SVQAPpBSAav67wAR8d8
 44WY5ImNfx9waHJBIFl2X5iSIH4GfN9oaEfmB++2fjWE8NH3Ek5SU2db+cPXUhBVpcEd
 lPNQ==
X-Gm-Message-State: ANhLgQ1UXNpQIjGdzD9KQHGw8y1UeGDoplfE9qZCZsx8t2Rc0dF19gB8
 lG0WsLPU/Dh3mtJmrF38+TRIDQNy
X-Google-Smtp-Source: ADFU+vvV+Qjqcd+wksczhsC9MSisSEM36LfhftNulFkmYxqwCfpDcq22YDEoWHYpgjaXwwZC4lgCyg==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr5416219wml.154.1585167366416; 
 Wed, 25 Mar 2020 13:16:06 -0700 (PDT)
Received: from localhost
 (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de.
 [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
 by smtp.gmail.com with ESMTPSA id i4sm132568wrm.32.2020.03.25.13.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 13:16:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] drm/tegra: Fix SMMU support on Tegra124 and Tegra210
Date: Wed, 25 Mar 2020 21:16:03 +0100
Message-Id: <20200325201604.833898-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

When testing whether or not to enable the use of the SMMU, consult the
supported DMA mask rather than the actually configured DMA mask, since
the latter might already have been restricted.

Fixes: 2d9384ff9177 ("drm/tegra: Relax IOMMU usage criteria on old Tegra")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c |  3 ++-
 drivers/gpu/host1x/dev.c    | 13 +++++++++++++
 include/linux/host1x.h      |  3 +++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bd268028fb3d..583cd6e0ae27 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1039,6 +1039,7 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
 
 static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 {
+	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
 	struct iommu_domain *domain;
 
 	/*
@@ -1076,7 +1077,7 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	 * sufficient and whether or not the host1x is attached to an IOMMU
 	 * doesn't matter.
 	 */
-	if (!domain && dma_get_mask(dev->dev.parent) <= DMA_BIT_MASK(32))
+	if (!domain && host1x_get_dma_mask(host1x) <= DMA_BIT_MASK(32))
 		return true;
 
 	return domain != NULL;
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 388bcc2889aa..40a4b9f8b861 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -502,6 +502,19 @@ static void __exit tegra_host1x_exit(void)
 }
 module_exit(tegra_host1x_exit);
 
+/**
+ * host1x_get_dma_mask() - query the supported DMA mask for host1x
+ * @host1x: host1x instance
+ *
+ * Note that this returns the supported DMA mask for host1x, which can be
+ * different from the applicable DMA mask under certain circumstances.
+ */
+u64 host1x_get_dma_mask(struct host1x *host1x)
+{
+	return host1x->info->dma_mask;
+}
+EXPORT_SYMBOL(host1x_get_dma_mask);
+
 MODULE_AUTHOR("Thierry Reding <thierry.reding@avionic-design.de>");
 MODULE_AUTHOR("Terje Bergstrom <tbergstrom@nvidia.com>");
 MODULE_DESCRIPTION("Host1x driver for Tegra products");
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 62d216ff1097..c230b4e70d75 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -17,9 +17,12 @@ enum host1x_class {
 	HOST1X_CLASS_GR3D = 0x60,
 };
 
+struct host1x;
 struct host1x_client;
 struct iommu_group;
 
+u64 host1x_get_dma_mask(struct host1x *host1x);
+
 /**
  * struct host1x_client_ops - host1x client operations
  * @init: host1x client initialization code
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
