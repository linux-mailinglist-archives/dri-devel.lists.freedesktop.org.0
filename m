Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF818283D8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945E810E6F4;
	Tue,  9 Jan 2024 10:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC2210E6F4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704795649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMTEEq3AsQe2TdpantqsP/tLBypPshyH9GIKsnl/dK0=;
 b=i1vUzP+SLTHY5kFn8G9X5oU0wt61EfYNnlsdwu/MH+HJjBhq+NL2ggiYjP6XbVo/q2xxR1
 tPfhbEuZKXDSjw4zUws1BNy4q0C44htE/uhTikN7ayPDo0QF3Pi4lJzZKeiJFGiXq8rYv/
 nmtSwZlkKk9VYgvALa0wbIAQXS30VvM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-Kld8Cpc2MGO_uVdWh4OyDQ-1; Tue, 09 Jan 2024 05:20:48 -0500
X-MC-Unique: Kld8Cpc2MGO_uVdWh4OyDQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-781314b6298so51184985a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 02:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704795648; x=1705400448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMTEEq3AsQe2TdpantqsP/tLBypPshyH9GIKsnl/dK0=;
 b=ldM1i9lDJoSnvFXITiOWGFTvCy6Nb0UHzj4naebCVQ1ZzNO59XTwF0Q5Ccj8CGU8PB
 HX8H54+S2tXc5TPnV9BXJObL1Zf40IB5TuVg2WQyTBa0k/NFjMJpIC1lZi1LV//qvBJR
 skiBlzZTMZShDfWDbmW6O5JcAKk/ImsIDXWgvLkSZpAxVOVvImHEiFNZKv+iO69sgJOt
 jW6I0QBSCo8bood5GftJxbXrFEuEhmVPOgJbP8wpcT01wAF4tKe0x6Lp2lcMmNsSZBbu
 CMWVJgS/BWiGSbRnHK6xK9mawk4RxK+vbUeO6c8Iz9lIC7LWmhFUFUgh6cOPjooX8kph
 hvdg==
X-Gm-Message-State: AOJu0YwYKEGHhig2Fc+TELQdatmpNBTnILjwlK4Hts1YA3ZFbOOFkwwY
 7nbCBXqCkgFsaMuAG+ccXo2MDQRJ0ggk9+iRUf30/rwFNKS2I3l6ienkXRaUxIIl3NoWP09RwaW
 KkeQtnXKDLKMNr4L23257xUSRQxCA+53rZxT3
X-Received: by 2002:a05:620a:8a89:b0:783:202f:594f with SMTP id
 qu9-20020a05620a8a8900b00783202f594fmr5165328qkn.1.1704795647823; 
 Tue, 09 Jan 2024 02:20:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2JL++L27GVmuL0o0pA/G9Z2tjOGqYUmDVqbYE0/CBggar9eduv+9cZepc+vbvwFgu5VXAbw==
X-Received: by 2002:a05:620a:8a89:b0:783:202f:594f with SMTP id
 qu9-20020a05620a8a8900b00783202f594fmr5165318qkn.1.1704795647500; 
 Tue, 09 Jan 2024 02:20:47 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 m24-20020ae9e018000000b00783217607d6sm679695qkk.115.2024.01.09.02.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:20:47 -0800 (PST)
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
Subject: [PATCH v2 2/2] drm/imx/dcss: have all init functions use devres
Date: Tue,  9 Jan 2024 11:20:32 +0100
Message-ID: <20240109102032.16165-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109102032.16165-1-pstanner@redhat.com>
References: <20240109102032.16165-1-pstanner@redhat.com>
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
 drivers/gpu/drm/imx/dcss/dcss-dev.c    | 11 ++---------
 drivers/gpu/drm/imx/dcss/dcss-dpr.c    | 25 ++++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-drv.c    | 12 +++---------
 drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 23 ++++-------------------
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 22 ++++------------------
 drivers/gpu/drm/imx/dcss/dcss-ss.c     | 11 +++--------
 8 files changed, 29 insertions(+), 104 deletions(-)

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
index 1f93313c89b7..206452cf98d6 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -109,8 +109,6 @@ static int dcss_submodules_init(struct dcss_dev *dcss)
 	dcss_ctxld_exit(dcss->ctxld);
 
 ctxld_err:
-	dcss_blkctl_exit(dcss->blkctl);
-
 	dcss_clocks_disable(dcss);
 
 	return ret;
@@ -190,7 +188,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 		return ERR_PTR(-EBUSY);
 	}
 
-	dcss = kzalloc(sizeof(*dcss), GFP_KERNEL);
+	dcss = devm_kzalloc(dev, sizeof(*dcss), GFP_KERNEL);
 	if (!dcss)
 		return ERR_PTR(-ENOMEM);
 
@@ -201,7 +199,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 	ret = dcss_clks_init(dcss);
 	if (ret) {
 		dev_err(dev, "clocks initialization failed\n");
-		goto err;
+		return ret;
 	}
 
 	dcss->of_port = of_graph_get_port_by_id(dev->of_node, 0);
@@ -233,9 +231,6 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 clks_err:
 	dcss_clks_release(dcss);
 
-err:
-	kfree(dcss);
-
 	return ERR_PTR(ret);
 }
 
@@ -253,8 +248,6 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
 	dcss_submodules_stop(dcss);
 
 	dcss_clks_release(dcss);
-
-	kfree(dcss);
 }
 
 static int dcss_dev_suspend(struct device *dev)
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
index 47852b9dd5ea..3dbd0ed68ac1 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
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

