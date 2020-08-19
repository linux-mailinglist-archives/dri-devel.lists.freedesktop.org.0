Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26578249C4D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05286E231;
	Wed, 19 Aug 2020 11:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FB16E24D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 093342310C;
 Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837583;
 bh=zHf77lVLfTNqIaF9sRrNbaiO3qYSqs9jubzcWDx1ovA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lqYhiCf4WYrkZPL2mxfY4LFdgDMcf0IqacgkYiFAinHtvsLLw3nGvlRlGBuq2tExC
 sceu3WD8kEwqxZtiHI9Du/wNwhm5UOIo8sSpTykX26dS1KpIiBGQ9TGW+NSCHCDqFT
 NvrVXGF9PpS3l24SHgKq/HPA5yjH1dbBZKrVZ1yM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXt-00Eubj-0d; Wed, 19 Aug 2020 13:46:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 37/49] staging: hikey9xx/gpu: don't use iommu code
Date: Wed, 19 Aug 2020 13:46:05 +0200
Message-Id: <0230300d41aaa80f27aeeeafe585b8d19b4d5146.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Wanchun Zheng <zhengwanchun@hisilicon.com>,
 linuxarm@huawei.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While this driver apparently supports both IOMMU and no-IOMMU
access, it always enable the IOMMU via some code, at the
downstream version.

Apparently, the downstream iommu is there just to get the
physical address of the logical IOMMU address. Based on
the downstream code, it sounds that the IOMMU would be an
specific one for the GPU.

Anyway, right now, the driver is set to not use the IOMMU
at all. So, let's comment out the code which allocates
IOMMU pages, and the code that would try to use it to
setup a register, as, without the IOMMU, this would cause
an OOPS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c      | 12 ++++++++++--
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c        | 10 ++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index e3bb0a32dddf..546da775f2fb 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -769,6 +769,14 @@ static int dss_plane_init(struct drm_device *dev, struct dss_plane *aplane,
 
 static int dss_enable_iommu(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 {
+#if 0
+/*
+ * FIXME:
+ *
+ * Right now, the IOMMU support is actually disabled. See the caller of
+ * hisi_dss_smmu_config(). Yet, if we end enabling it, this should be
+ * ported to use io-pgtable directly.
+ */
 	struct device *dev = NULL;
 
 	dev = &pdev->dev;
@@ -781,7 +789,7 @@ static int dss_enable_iommu(struct platform_device *pdev, struct dss_hw_ctx *ctx
 	}
 
 	iommu_attach_device(ctx->mmu_domain, dev);
-
+#endif
 	return 0;
 }
 
@@ -934,7 +942,7 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 			 DSS_MAX_PXL0_CLK_144M, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
 	}
 
-	/* regulator enable */
+	/* enable IOMMU */
 	dss_enable_iommu(pdev, ctx);
 
 	return 0;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 9113937478f5..6b6774b8d903 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -1333,8 +1333,17 @@ static void hisi_dss_mif_on(struct dss_hw_ctx *ctx)
 	set_reg(dss_base + MIF_CH11_OFFSET + MIF_CTRL0, 0x1, 1, 0);
 }
 
+
 void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
 {
+#if 0
+/*
+ * FIXME:
+ *
+ * Right now, the IOMMU support is actually disabled. See the caller of
+ * hisi_dss_smmu_config(). Yet, if we end enabling it, this should be
+ * ported to use io-pgtable directly.
+ */
 	void __iomem *smmu_base;
 	struct iommu_domain_data *domain_data = NULL;
 	u32 phy_pgd_base = 0;
@@ -1374,6 +1383,7 @@ void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
 	phy_pgd_base = (uint32_t)(domain_data->phy_pgd_base);
 	DRM_DEBUG("fama_phy_pgd_base = %llu, phy_pgd_base =0x%x \n", fama_phy_pgd_base, phy_pgd_base);
 	set_reg(smmu_base + SMMU_CB_TTBR0, phy_pgd_base, 32, 0);
+#endif
 }
 
 void hisifb_dss_on(struct dss_hw_ctx *ctx)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
