Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CFD82ABB1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FD410E8D6;
	Thu, 11 Jan 2024 10:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D14B10E8D6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704968095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S16ICIiOihOWmFRVFMbuskDB7oAUbfdibwyo8M1GhmA=;
 b=J8EbVEAOkD+WvcyMl74YChzgVpFBtIQJ/1oPGn0XnmWL7SGOvbdTBic/pxgeYUt8T3GftR
 Fx/S626UojmKK1/lpKRg0ctjhrZJGrsfmguy5ShYLLP9iROcJHiktXPpY5CjkZO4q5gZst
 tzJNO9YW8SVISYgoVX09hkRqSIzrtn8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-OgmRtYHMOi2YuHEWySXQ3Q-1; Thu, 11 Jan 2024 05:14:53 -0500
X-MC-Unique: OgmRtYHMOi2YuHEWySXQ3Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-680b16b2cf1so14058686d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 02:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704968093; x=1705572893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S16ICIiOihOWmFRVFMbuskDB7oAUbfdibwyo8M1GhmA=;
 b=EqqWkC/zQGMUUFDGBOchLVXipZQefIsxeLR3fJWDxS8IUZN+YV4WvhA5xiTT55HQCt
 mRHzeIKezg1N7iUSuWW0FZutIzhXW1LOXoIAASII/2bO9sTdy+BDiuWW+WRwRaUbSTYc
 036os5jGS5EdfS1yWKw7MqgtDklLFTzIZGT8OHexVYs2lavdT00fYl1NahZ4XZSWi1Ab
 4y7I+Ar8NC9a8gAqilFXYAP6HbWAj5yWT9fhdcz8t2H2QDxpR7nBc5p4x5g6kO6GZ81U
 HhXsTf5LNR+vhfmyg226r5//OxjLo95SCWZd2P3B0FGyuWJgSksihE3QD6W+/OznOB6d
 dd3A==
X-Gm-Message-State: AOJu0Ywnhe578v9+ArdA4N9XuUKoA1WhIweebtyglTgHCBJoQ/btOmyk
 OXi6zqwvFeKMYOoC5NqOVp5CbX91MXXoiWPfMJP38aZ/xOVqGBvxkG3KEm1L5l0JaPQ8MPDdO8k
 7QtYfjsvQxUUvVXHNWQIMULtBBqXpR+XxtRKY
X-Received: by 2002:a05:622a:c3:b0:429:c64e:bbf2 with SMTP id
 p3-20020a05622a00c300b00429c64ebbf2mr722042qtw.1.1704968092961; 
 Thu, 11 Jan 2024 02:14:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTzZl0NIrM5dujx955ccLPeiLKGsrMmKqGnmN6hPG7JhM/ZFMOo9jRoDntIWauIMCWURrJVA==
X-Received: by 2002:a05:622a:c3:b0:429:c64e:bbf2 with SMTP id
 p3-20020a05622a00c300b00429c64ebbf2mr722019qtw.1.1704968092644; 
 Thu, 11 Jan 2024 02:14:52 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 eo7-20020a05622a544700b0042993549c3asm313237qtb.32.2024.01.11.02.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:14:52 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 2/2] drm/imx/dcss: have all init functions use devres
Date: Thu, 11 Jan 2024 11:13:47 +0100
Message-ID: <20240111101346.15193-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111101346.15193-2-pstanner@redhat.com>
References: <20240111101346.15193-2-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, Philipp Stanner <pstanner@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dcss currently allocates and ioremaps quite a few resources in its probe
function's call graph. Devres now provides convenient functions which
perform the same task but do the cleanup automatically.

Port all memory allocations and ioremap() calls to the devres
counterparts.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/imx/dcss/dcss-blkctl.c | 14 +++-----------
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c  | 15 ++++-----------
 drivers/gpu/drm/imx/dcss/dcss-dev.c    | 12 ++----------
 drivers/gpu/drm/imx/dcss/dcss-dev.h    |  1 -
 drivers/gpu/drm/imx/dcss/dcss-dpr.c    | 25 ++++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-drv.c    | 12 +++---------
 drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 23 ++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 24 +++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-ss.c     | 11 +++--------
 9 files changed, 30 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-blkctl.c b/drivers/gpu/drm/imx/dcss/dcss-blkctl.c
index c9b54bb2692d..58e12ec65f80 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-blkctl.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-blkctl.c
@@ -41,15 +41,15 @@ void dcss_blkctl_cfg(struct dcss_blkctl *blkctl)
 int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base)
 {
 	struct dcss_blkctl *blkctl;
+	struct device *dev = dcss->dev;
 
-	blkctl = kzalloc(sizeof(*blkctl), GFP_KERNEL);
+	blkctl = devm_kzalloc(dev, sizeof(*blkctl), GFP_KERNEL);
 	if (!blkctl)
 		return -ENOMEM;
 
-	blkctl->base_reg = ioremap(blkctl_base, SZ_4K);
+	blkctl->base_reg = devm_ioremap(dev, blkctl_base, SZ_4K);
 	if (!blkctl->base_reg) {
 		dev_err(dcss->dev, "unable to remap BLK CTRL base\n");
-		kfree(blkctl);
 		return -ENOMEM;
 	}
 
@@ -60,11 +60,3 @@ int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base)
 
 	return 0;
 }
-
-void dcss_blkctl_exit(struct dcss_blkctl *blkctl)
-{
-	if (blkctl->base_reg)
-		iounmap(blkctl->base_reg);
-
-	kfree(blkctl);
-}
diff --git a/drivers/gpu/drm/imx/dcss/dcss-ctxld.c b/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
index 3a84cb3209c4..444511d0f382 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
@@ -199,10 +199,11 @@ static int dcss_ctxld_alloc_ctx(struct dcss_ctxld *ctxld)
 
 int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base)
 {
+	struct device *dev = dcss->dev;
 	struct dcss_ctxld *ctxld;
 	int ret;
 
-	ctxld = kzalloc(sizeof(*ctxld), GFP_KERNEL);
+	ctxld = devm_kzalloc(dev, sizeof(*ctxld), GFP_KERNEL);
 	if (!ctxld)
 		return -ENOMEM;
 
@@ -217,7 +218,7 @@ int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base)
 		goto err;
 	}
 
-	ctxld->ctxld_reg = ioremap(ctxld_base, SZ_4K);
+	ctxld->ctxld_reg = devm_ioremap(dev, ctxld_base, SZ_4K);
 	if (!ctxld->ctxld_reg) {
 		dev_err(dcss->dev, "ctxld: unable to remap ctxld base\n");
 		ret = -ENOMEM;
@@ -226,18 +227,14 @@ int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base)
 
 	ret = dcss_ctxld_irq_config(ctxld, to_platform_device(dcss->dev));
 	if (ret)
-		goto err_irq;
+		goto err;
 
 	dcss_ctxld_hw_cfg(ctxld);
 
 	return 0;
 
-err_irq:
-	iounmap(ctxld->ctxld_reg);
-
 err:
 	dcss_ctxld_free_ctx(ctxld);
-	kfree(ctxld);
 
 	return ret;
 }
@@ -246,11 +243,7 @@ void dcss_ctxld_exit(struct dcss_ctxld *ctxld)
 {
 	free_irq(ctxld->irq, ctxld);
 
-	if (ctxld->ctxld_reg)
-		iounmap(ctxld->ctxld_reg);
-
 	dcss_ctxld_free_ctx(ctxld);
-	kfree(ctxld);
 }
 
 static int dcss_ctxld_enable_locked(struct dcss_ctxld *ctxld)
diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index d448bf1c205e..597e9b7bd4bf 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -109,8 +109,6 @@ static int dcss_submodules_init(struct dcss_dev *dcss)
 	dcss_ctxld_exit(dcss->ctxld);
 
 ctxld_err:
-	dcss_blkctl_exit(dcss->blkctl);
-
 	dcss_clocks_disable(dcss);
 
 	return ret;
@@ -124,7 +122,6 @@ static void dcss_submodules_stop(struct dcss_dev *dcss)
 	dcss_ss_exit(dcss->ss);
 	dcss_dtg_exit(dcss->dtg);
 	dcss_ctxld_exit(dcss->ctxld);
-	dcss_blkctl_exit(dcss->blkctl);
 	dcss_clocks_disable(dcss);
 }
 
@@ -190,7 +187,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 		return ERR_PTR(-EBUSY);
 	}
 
-	dcss = kzalloc(sizeof(*dcss), GFP_KERNEL);
+	dcss = devm_kzalloc(dev, sizeof(*dcss), GFP_KERNEL);
 	if (!dcss)
 		return ERR_PTR(-ENOMEM);
 
@@ -201,7 +198,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 	ret = dcss_clks_init(dcss);
 	if (ret) {
 		dev_err(dev, "clocks initialization failed\n");
-		goto err;
+		return ERR_PTR(ret);
 	}
 
 	dcss->of_port = of_graph_get_port_by_id(dev->of_node, 0);
@@ -233,9 +230,6 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 clks_err:
 	dcss_clks_release(dcss);
 
-err:
-	kfree(dcss);
-
 	return ERR_PTR(ret);
 }
 
@@ -253,8 +247,6 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
 	dcss_submodules_stop(dcss);
 
 	dcss_clks_release(dcss);
-
-	kfree(dcss);
 }
 
 static int dcss_dev_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.h b/drivers/gpu/drm/imx/dcss/dcss-dev.h
index f27b87c09599..b032e873d227 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.h
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.h
@@ -104,7 +104,6 @@ extern const struct dev_pm_ops dcss_dev_pm_ops;
 /* BLKCTL */
 int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base);
 void dcss_blkctl_cfg(struct dcss_blkctl *blkctl);
-void dcss_blkctl_exit(struct dcss_blkctl *blkctl);
 
 /* CTXLD */
 int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base);
diff --git a/drivers/gpu/drm/imx/dcss/dcss-dpr.c b/drivers/gpu/drm/imx/dcss/dcss-dpr.c
index df9dab949bf2..d6b2ad5e6977 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dpr.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dpr.c
@@ -125,7 +125,8 @@ static void dcss_dpr_write(struct dcss_dpr_ch *ch, u32 val, u32 ofs)
 	dcss_ctxld_write(dpr->ctxld, dpr->ctx_id, val, ch->base_ofs + ofs);
 }
 
-static int dcss_dpr_ch_init_all(struct dcss_dpr *dpr, unsigned long dpr_base)
+static int dcss_dpr_ch_init_all(struct device *dev, struct dcss_dpr *dpr,
+		unsigned long dpr_base)
 {
 	struct dcss_dpr_ch *ch;
 	int i;
@@ -135,7 +136,7 @@ static int dcss_dpr_ch_init_all(struct dcss_dpr *dpr, unsigned long dpr_base)
 
 		ch->base_ofs = dpr_base + i * 0x1000;
 
-		ch->base_reg = ioremap(ch->base_ofs, SZ_4K);
+		ch->base_reg = devm_ioremap(dev, ch->base_ofs, SZ_4K);
 		if (!ch->base_reg) {
 			dev_err(dpr->dev, "dpr: unable to remap ch %d base\n",
 				i);
@@ -154,8 +155,9 @@ static int dcss_dpr_ch_init_all(struct dcss_dpr *dpr, unsigned long dpr_base)
 int dcss_dpr_init(struct dcss_dev *dcss, unsigned long dpr_base)
 {
 	struct dcss_dpr *dpr;
+	struct device *dev = dcss->dev;
 
-	dpr = kzalloc(sizeof(*dpr), GFP_KERNEL);
+	dpr = devm_kzalloc(dev, sizeof(*dpr), GFP_KERNEL);
 	if (!dpr)
 		return -ENOMEM;
 
@@ -164,18 +166,8 @@ int dcss_dpr_init(struct dcss_dev *dcss, unsigned long dpr_base)
 	dpr->ctxld = dcss->ctxld;
 	dpr->ctx_id = CTX_SB_HP;
 
-	if (dcss_dpr_ch_init_all(dpr, dpr_base)) {
-		int i;
-
-		for (i = 0; i < 3; i++) {
-			if (dpr->ch[i].base_reg)
-				iounmap(dpr->ch[i].base_reg);
-		}
-
-		kfree(dpr);
-
+	if (dcss_dpr_ch_init_all(dev, dpr, dpr_base))
 		return -ENOMEM;
-	}
 
 	return 0;
 }
@@ -189,12 +181,7 @@ void dcss_dpr_exit(struct dcss_dpr *dpr)
 		struct dcss_dpr_ch *ch = &dpr->ch[ch_no];
 
 		dcss_writel(0, ch->base_reg + DCSS_DPR_SYSTEM_CTRL0);
-
-		if (ch->base_reg)
-			iounmap(ch->base_reg);
 	}
-
-	kfree(dpr);
 }
 
 static u32 dcss_dpr_x_pix_wide_adjust(struct dcss_dpr_ch *ch, u32 pix_wide,
diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index b61cec0cc79d..bd3f9d58042c 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -51,15 +51,13 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 
 	of_node_put(remote);
 
-	mdrv = kzalloc(sizeof(*mdrv), GFP_KERNEL);
+	mdrv = devm_kzalloc(dev, sizeof(*mdrv), GFP_KERNEL);
 	if (!mdrv)
 		return -ENOMEM;
 
 	mdrv->dcss = dcss_dev_create(dev, hdmi_output);
-	if (IS_ERR(mdrv->dcss)) {
-		err = PTR_ERR(mdrv->dcss);
-		goto err;
-	}
+	if (IS_ERR(mdrv->dcss))
+		return PTR_ERR(mdrv->dcss);
 
 	dev_set_drvdata(dev, mdrv);
 
@@ -75,8 +73,6 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 dcss_shutoff:
 	dcss_dev_destroy(mdrv->dcss);
 
-err:
-	kfree(mdrv);
 	return err;
 }
 
@@ -87,8 +83,6 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)
 	dcss_kms_detach(mdrv->kms);
 	dcss_dev_destroy(mdrv->dcss);
 
-	kfree(mdrv);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/imx/dcss/dcss-dtg.c b/drivers/gpu/drm/imx/dcss/dcss-dtg.c
index 30de00540f63..5c0f697587e6 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dtg.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dtg.c
@@ -151,8 +151,9 @@ int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base)
 {
 	int ret = 0;
 	struct dcss_dtg *dtg;
+	struct device *dev = dcss->dev;
 
-	dtg = kzalloc(sizeof(*dtg), GFP_KERNEL);
+	dtg = devm_kzalloc(dev, sizeof(*dtg), GFP_KERNEL);
 	if (!dtg)
 		return -ENOMEM;
 
@@ -160,11 +161,10 @@ int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base)
 	dtg->dev = dcss->dev;
 	dtg->ctxld = dcss->ctxld;
 
-	dtg->base_reg = ioremap(dtg_base, SZ_4K);
+	dtg->base_reg = devm_ioremap(dev, dtg_base, SZ_4K);
 	if (!dtg->base_reg) {
 		dev_err(dcss->dev, "dtg: unable to remap dtg base\n");
-		ret = -ENOMEM;
-		goto err_ioremap;
+		return -ENOMEM;
 	}
 
 	dtg->base_ofs = dtg_base;
@@ -176,16 +176,6 @@ int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base)
 		((dtg->alpha << DEFAULT_FG_ALPHA_POS) & DEFAULT_FG_ALPHA_MASK);
 
 	ret = dcss_dtg_irq_config(dtg, to_platform_device(dcss->dev));
-	if (ret)
-		goto err_irq;
-
-	return 0;
-
-err_irq:
-	iounmap(dtg->base_reg);
-
-err_ioremap:
-	kfree(dtg);
 
 	return ret;
 }
@@ -193,11 +183,6 @@ int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base)
 void dcss_dtg_exit(struct dcss_dtg *dtg)
 {
 	free_irq(dtg->ctxld_kick_irq, dtg);
-
-	if (dtg->base_reg)
-		iounmap(dtg->base_reg);
-
-	kfree(dtg);
 }
 
 void dcss_dtg_sync_set(struct dcss_dtg *dtg, struct videomode *vm)
diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
index 47852b9dd5ea..ed4d1eb9442e 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
@@ -291,7 +291,7 @@ static void dcss_scaler_write(struct dcss_scaler_ch *ch, u32 val, u32 ofs)
 	dcss_ctxld_write(scl->ctxld, scl->ctx_id, val, ch->base_ofs + ofs);
 }
 
-static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
+static int dcss_scaler_ch_init_all(struct device *dev, struct dcss_scaler *scl,
 				   unsigned long scaler_base)
 {
 	struct dcss_scaler_ch *ch;
@@ -302,7 +302,7 @@ static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
 
 		ch->base_ofs = scaler_base + i * 0x400;
 
-		ch->base_reg = ioremap(ch->base_ofs, SZ_4K);
+		ch->base_reg = devm_ioremap(dev, ch->base_ofs, SZ_4K);
 		if (!ch->base_reg) {
 			dev_err(scl->dev, "scaler: unable to remap ch base\n");
 			return -ENOMEM;
@@ -317,8 +317,9 @@ static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
 int dcss_scaler_init(struct dcss_dev *dcss, unsigned long scaler_base)
 {
 	struct dcss_scaler *scaler;
+	struct device *dev = dcss->dev;
 
-	scaler = kzalloc(sizeof(*scaler), GFP_KERNEL);
+	scaler = devm_kzalloc(dev, sizeof(*scaler), GFP_KERNEL);
 	if (!scaler)
 		return -ENOMEM;
 
@@ -327,18 +328,8 @@ int dcss_scaler_init(struct dcss_dev *dcss, unsigned long scaler_base)
 	scaler->ctxld = dcss->ctxld;
 	scaler->ctx_id = CTX_SB_HP;
 
-	if (dcss_scaler_ch_init_all(scaler, scaler_base)) {
-		int i;
-
-		for (i = 0; i < 3; i++) {
-			if (scaler->ch[i].base_reg)
-				iounmap(scaler->ch[i].base_reg);
-		}
-
-		kfree(scaler);
-
+	if (dcss_scaler_ch_init_all(dev, scaler, scaler_base))
 		return -ENOMEM;
-	}
 
 	return 0;
 }
@@ -351,12 +342,7 @@ void dcss_scaler_exit(struct dcss_scaler *scl)
 		struct dcss_scaler_ch *ch = &scl->ch[ch_no];
 
 		dcss_writel(0, ch->base_reg + DCSS_SCALER_CTRL);
-
-		if (ch->base_reg)
-			iounmap(ch->base_reg);
 	}
-
-	kfree(scl);
 }
 
 void dcss_scaler_ch_enable(struct dcss_scaler *scl, int ch_num, bool en)
diff --git a/drivers/gpu/drm/imx/dcss/dcss-ss.c b/drivers/gpu/drm/imx/dcss/dcss-ss.c
index 8ddf08da911b..0a8320adc302 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-ss.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-ss.c
@@ -82,8 +82,9 @@ static void dcss_ss_write(struct dcss_ss *ss, u32 val, u32 ofs)
 int dcss_ss_init(struct dcss_dev *dcss, unsigned long ss_base)
 {
 	struct dcss_ss *ss;
+	struct device *dev = dcss->dev;
 
-	ss = kzalloc(sizeof(*ss), GFP_KERNEL);
+	ss = devm_kzalloc(dev, sizeof(*ss), GFP_KERNEL);
 	if (!ss)
 		return -ENOMEM;
 
@@ -91,10 +92,9 @@ int dcss_ss_init(struct dcss_dev *dcss, unsigned long ss_base)
 	ss->dev = dcss->dev;
 	ss->ctxld = dcss->ctxld;
 
-	ss->base_reg = ioremap(ss_base, SZ_4K);
+	ss->base_reg = devm_ioremap(dev, ss_base, SZ_4K);
 	if (!ss->base_reg) {
 		dev_err(dcss->dev, "ss: unable to remap ss base\n");
-		kfree(ss);
 		return -ENOMEM;
 	}
 
@@ -108,11 +108,6 @@ void dcss_ss_exit(struct dcss_ss *ss)
 {
 	/* stop SS */
 	dcss_writel(0, ss->base_reg + DCSS_SS_SYS_CTRL);
-
-	if (ss->base_reg)
-		iounmap(ss->base_reg);
-
-	kfree(ss);
 }
 
 void dcss_ss_subsam_set(struct dcss_ss *ss)
-- 
2.43.0

