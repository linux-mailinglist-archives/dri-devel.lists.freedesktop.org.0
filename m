Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7152934AA73
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921FB6F409;
	Fri, 26 Mar 2021 14:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BA86F409
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:51:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id g25so3163875wmh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mYZHwCwRW4nMunvHncCTe6a/rr8wamJxRARNjK2ntJo=;
 b=eyC59KwUVdj4wh2qXTUJoBU3hvwj73JNBUYOV5f2GE2l+3SN23gCe08mELuBhiLJE4
 GqA9uoVijwFH+qNNoRxiPskJLyzAo1AWVatJSYz3HFw1P1itlX1KqK6Mvr2bLZmmvwLa
 SfBrKW8/I+yNF5AJWvA+XiMvv99XG6PKOhGcKwCzaFf6nzgMo3/dXPOPCgpo6aKrNxmn
 61it3+EqyzN026gBOG1ad5cLyujK120R0ogms9o/4yN4nSwANOffc3vF8207ztuqExD+
 LW/iGlNdHdzADGgbDDEzIsAvlEr4X9Owu0z91Q6tRk0I7utQt2aeJEb0MOvAZAnH6l5f
 A7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mYZHwCwRW4nMunvHncCTe6a/rr8wamJxRARNjK2ntJo=;
 b=Kx0nl9XTV/xiX+24Zh9QuGm8bKMWxqBXbKobJ8UccSf12BQX2ZaJCJlIA+m+4Q7gSx
 s7cMuolhuvpEvLtf0xmkijhwgQD1MXSZeogZDJeUg5cEJA2IXVg7rAyFrXNprQ4k6+jE
 8Jzc5Wdy8DJiDKgLJK6mfxgRBT7TmRUNObYzmuzJtwfZWBzsX472lsTXli7pfJNrlKxL
 6NOyb0bfptV6LW8PvPJZ25ZhaYzz2ykTmdyyFJaLrswrejgD0804hLQ03X8+bdricgS0
 q/0CNo1XttWXIH2zG7btddNyNXw3LBcFKhIz0GHjpDp/VdcZStybOk5X0jZXqHrwLJ0/
 +8ww==
X-Gm-Message-State: AOAM531ypP2ZeKncpy3x/F8896WdTnpR7qJ5uLi9q9j7y5xINCbyK7er
 unntlumh0nwZO571r9qIE+o=
X-Google-Smtp-Source: ABdhPJylGou6xdZQHDcpDelq2ymSU1tXgTq3g9SINF4tCi4n383YKtC9pWSPljq9f+EY+naLSxSDLg==
X-Received: by 2002:a1c:ddc6:: with SMTP id
 u189mr13752722wmg.171.1616770290034; 
 Fri, 26 Mar 2021 07:51:30 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id l8sm13147469wrx.83.2021.03.26.07.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:51:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 03/10] drm/tegra: dc: Inherit DMA mask
Date: Fri, 26 Mar 2021 15:51:32 +0100
Message-Id: <20210326145139.467072-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Inherit the DMA mask from host1x (on Tegra210 and earlier) or the
display hub (on Tegra186 and later). This is necessary in order to
properly map buffers without SMMU support and use the maximum IOVA
space available with SMMU support.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 7 +++++++
 drivers/gpu/drm/tegra/hub.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 40bf8f33a2ae..935717e7410d 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2538,9 +2538,16 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
+	u64 dma_mask = dma_get_mask(pdev->dev.parent);
 	struct tegra_dc *dc;
 	int err;
 
+	err = dma_coerce_mask_and_coherent(&pdev->dev, dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
 	dc = devm_kzalloc(&pdev->dev, sizeof(*dc), GFP_KERNEL);
 	if (!dc)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 8e6d329d062b..617240032c37 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -848,12 +848,19 @@ static const struct host1x_client_ops tegra_display_hub_ops = {
 
 static int tegra_display_hub_probe(struct platform_device *pdev)
 {
+	u64 dma_mask = dma_get_mask(pdev->dev.parent);
 	struct device_node *child = NULL;
 	struct tegra_display_hub *hub;
 	struct clk *clk;
 	unsigned int i;
 	int err;
 
+	err = dma_coerce_mask_and_coherent(&pdev->dev, dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
 	hub = devm_kzalloc(&pdev->dev, sizeof(*hub), GFP_KERNEL);
 	if (!hub)
 		return -ENOMEM;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
