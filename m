Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD111464215
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5414B6E2C0;
	Tue, 30 Nov 2021 23:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DF16E226
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:10:20 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u3so57882829lfl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vPO+bBApcxdA5y2Q3fy7ZINB3CJ88qaYAenQZvkSVDc=;
 b=JXF/9H/QlTPQRtSNPlU/aReawD8FLsfHSdZ5gWqyQa8IU4fTxXQ7exyba7eawM26o4
 X7z5WN7JY97gds/BQfxNXJS1qZzAPx3rGhOLhM3lFvGE1oWic47rd24iUJOtVdABVhhv
 3QSiyb6trhmK2lAwpPvh4VYHpf2g5qqBZfh4h+oFtrtWLFAUc/Ql/ucEUDBydbluy73X
 YE4tpMcFVC23KFQYhxDrlwS06Ex+ybN58CF6kPPSzGm1/MQGOPa3+XNRKZG+IynkZW+Q
 yOOE4PnB7ir0crR3J3Vq1YvpySGnsXR04OGFcsZ+cCb0FdwQ5fa3n7i/siyBvUnd4oCZ
 DoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPO+bBApcxdA5y2Q3fy7ZINB3CJ88qaYAenQZvkSVDc=;
 b=WTybVCW1LR1BOQLj310kgILVeivRse5DnrFEh6KJqbaNCKHpveldErTldH4zI+lc7M
 3tQhglfvw9ghDGIVSmhxXseAOOxZM77+KFoIWTOAQomCwfkEUy5CMXU7rTNWH3Ao1pSu
 3w2VAJhoHq4ZJ6B/cuHPWFjFbBWoJ8mWXoxyYU8Sf6u/GLeX/luwKwxdss3MQ7c5kAyO
 3IZTXATOXxbm82QJvkuniPnp76vqA/uMYh9mfScOg3oEbk4RvEYJ0GszluHH9HLj883b
 6F7DA7D37YTzXW5811KyPfEfT92uPmFXbLK3rpO2jPU170h9G9rAjJVo9wl/JV2l5Bzs
 C39A==
X-Gm-Message-State: AOAM5338QlOg3gSkDHeEBHv+VRRnfTRvLlQljnuihcqWI49MUvEpPRjZ
 8EItkLglivvisvPecte+b3Y=
X-Google-Smtp-Source: ABdhPJzT82nM+GzSJsweT5whwKerGSgmA6VOGQpuf/7AVm3SkHRotqQ4zUKh+EsKIxErrvo3G/boJw==
X-Received: by 2002:a05:6512:c17:: with SMTP id
 z23mr2105714lfu.175.1638313818970; 
 Tue, 30 Nov 2021 15:10:18 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id k14sm2099846lfu.210.2021.11.30.15.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:10:18 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Graichen <thomas.graichen@gmail.com>
Subject: [PATCH v2 3/4] drm/tegra: dpaux: Restore DP AUX DDC registration order
Date: Wed,  1 Dec 2021 02:09:56 +0300
Message-Id: <20211130230957.30213-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130230957.30213-1-digetx@gmail.com>
References: <20211130230957.30213-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restore DP AUX I2C DDC registration order by moving registration to
DP AUX driver probe phase. This fixes broken display panel driver of
Acer Chromebook CB5-311 that fails to probe starting with v5.13 kernel
when DP AUX registration order was changed to prevent accessing
uninitialized aux->drm_dev. Tegra SOR driver is never probed now using
the new registration order because tegra-output always fails with
-EPROBE_DEFER due to missing display panel that requires DP AUX DDC to
be registered first. The offending commit made DDC to be registered after
SOR's output, which can't ever happen. Use new tegra_drm_device() helper
that allows to set aux->drm_dev during DP AUX probe, restoring the DCC
registration order and reviving display panel.

Cc: <stable@vger.kernel.org> # 5.13+
Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
Reported-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Tested-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 1f96e416fa08..148d3c00dd8e 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -530,9 +530,12 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	disable_irq(dpaux->irq);
 
 	dpaux->aux.transfer = tegra_dpaux_transfer;
+	dpaux->aux.drm_dev = tegra_drm_device();
 	dpaux->aux.dev = &pdev->dev;
 
-	drm_dp_aux_init(&dpaux->aux);
+	err = drm_dp_aux_register(&dpaux->aux);
+	if (err < 0)
+		goto put_pm;
 
 	/*
 	 * Assume that by default the DPAUX/I2C pads will be used for HDMI,
@@ -544,7 +547,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	 */
 	err = tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_I2C);
 	if (err < 0)
-		return err;
+		goto dp_aux_unreg;
 
 #ifdef CONFIG_GENERIC_PINCONF
 	dpaux->desc.name = dev_name(&pdev->dev);
@@ -557,7 +560,8 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	dpaux->pinctrl = devm_pinctrl_register(&pdev->dev, &dpaux->desc, dpaux);
 	if (IS_ERR(dpaux->pinctrl)) {
 		dev_err(&pdev->dev, "failed to register pincontrol\n");
-		return PTR_ERR(dpaux->pinctrl);
+		err = PTR_ERR(dpaux->pinctrl);
+		goto dp_aux_unreg;
 	}
 #endif
 	/* enable and clear all interrupts */
@@ -571,6 +575,14 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	mutex_unlock(&dpaux_lock);
 
 	return 0;
+
+dp_aux_unreg:
+	drm_dp_aux_unregister(&dpaux->aux);
+put_pm:
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return err;
 }
 
 static int tegra_dpaux_remove(struct platform_device *pdev)
@@ -579,6 +591,8 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
 
 	cancel_work_sync(&dpaux->work);
 
+	drm_dp_aux_unregister(&dpaux->aux);
+
 	/* make sure pads are powered down when not in use */
 	tegra_dpaux_pad_power_down(dpaux);
 
@@ -717,11 +731,6 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
 	unsigned long timeout;
 	int err;
 
-	aux->drm_dev = output->connector.dev;
-	err = drm_dp_aux_register(aux);
-	if (err < 0)
-		return err;
-
 	output->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	dpaux->output = output;
 
@@ -759,7 +768,6 @@ int drm_dp_aux_detach(struct drm_dp_aux *aux)
 	unsigned long timeout;
 	int err;
 
-	drm_dp_aux_unregister(aux);
 	disable_irq(dpaux->irq);
 
 	if (dpaux->output->panel) {
-- 
2.33.1

