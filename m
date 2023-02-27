Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96FC6A40F9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B605310E3C4;
	Mon, 27 Feb 2023 11:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2785210E3E7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:41:07 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id y11so2230860plg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/pvsdevlqP7CP6iuiZkDWC//vV9mr41wh5OsotB/Yc=;
 b=etdN6B4Mi1P/DeKzAILaVP8jTsuFtEagaBLBWZXFKmFgci1uk/2BkOjo71+OHjyLux
 6/tB/OmEJSOQdqXVDO0SZ/tzRTmqCRKRf7xGtzMdJwEKtAuqGaYAbl+1t3jB/N3YAVy4
 9Z5nidBQCOko9Lij7cN5MqCICk9bikPls0ElA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h/pvsdevlqP7CP6iuiZkDWC//vV9mr41wh5OsotB/Yc=;
 b=4G3Obt32+p65MtOCJIBzpKsVXtVA3UeTYT6sR5gAW9WFAOA8ugTJeGTxxrHzVjjSuw
 HBD49vprasQlrmSTKAb14v5g6YBiAcN4qFih1ZA/JNRvl/f0XLsk/Hz7lYLgkB7E0w9A
 UG23nVVm56tyuBupbNpBcPlKl+YHnnUmgAm0DMs0dyQ/I0JLM7s0Okl5AcVufpUfWm7K
 cJqHS65NUWL2O6lFBkhKBbcHWdFA8Yobqh+vDVpEBpe6WPKokKjLWwqxWEQyJ9Xl5fQw
 6P+bZaU0g/GaTuW2Kry0u1JR2P5lyLEgP+ubbLsIYZ7ac+9hN9ysxYGClgt889pXOy50
 iK6w==
X-Gm-Message-State: AO0yUKU4Uk8ovG4umi1SsoenUX1jjUh0QNvtfNpKor8wkuWGyk1NtQvz
 KETii5gQwd0Qo/3DalCvW9uMww==
X-Google-Smtp-Source: AK7set+dXkslzu7uYxWeNhKZ7UutDuItz6gSM7qUMRXQhRD4vq4HX9Hf+zEl4I2N9M7MTt3HVM8j8A==
X-Received: by 2002:a17:902:f542:b0:19c:e405:4446 with SMTP id
 h2-20020a170902f54200b0019ce4054446mr8518208plf.30.1677498066732; 
 Mon, 27 Feb 2023 03:41:06 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:41:06 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v13 13/18] drm: exynos: dsi: Add host helper for te_irq_handler
Date: Mon, 27 Feb 2023 17:09:20 +0530
Message-Id: <20230227113925.875425-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IRQ handler for te-gpio seems to be common across DSIM host.

However, Exynos is handling this via CRTC drivers but there is no clear
evidence on how the same has been handled in i.MX8MM. Keeping the handler
as-it-is can be a viable option but adding DSIM bridge core in upcoming
patches is not possible to call Exynos CRTC handler as DSIM bridge has
to be common across DRM bridge core instead of platform specific DRM
drivers like Exynos here.

So, this patch handles the handler via platform host helper, so-that
handling platform specific hook across Exynos and generic can be
reasonable till it makes it generic across all platforms.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- none
Changes for v12:
- updated patch
- suggested by Marek V
Changes for v11:
- none
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index de8604450fb9..938bbc701d3c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -326,6 +326,7 @@ struct exynos_dsim_host_ops {
 	void (*unregister_host)(struct exynos_dsi *dsim);
 	int (*attach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
 	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
+	irqreturn_t (*te_irq_handler)(struct exynos_dsi *dsim);
 };
 
 struct exynos_dsi_enc {
@@ -1334,11 +1335,10 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 {
 	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
-	struct exynos_dsi_enc *dsi_enc = dsi->priv;
-	struct drm_encoder *encoder = &dsi_enc->encoder;
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
 
-	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
-		exynos_drm_crtc_te_handler(encoder->crtc);
+	if (pdata->host_ops && pdata->host_ops->te_irq_handler)
+		return pdata->host_ops->te_irq_handler(dsi);
 
 	return IRQ_HANDLED;
 }
@@ -1728,6 +1728,17 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
+static irqreturn_t _exynos_dsi_te_irq_handler(struct exynos_dsi *dsim)
+{
+	struct exynos_dsi_enc *dsi_enc = dsim->priv;
+	struct drm_encoder *encoder = &dsi_enc->encoder;
+
+	if (dsim->state & DSIM_STATE_VIDOUT_AVAILABLE)
+		exynos_drm_crtc_te_handler(encoder->crtc);
+
+	return IRQ_HANDLED;
+}
+
 static int _exynos_dsi_host_attach(struct exynos_dsi *dsim,
 				   struct mipi_dsi_device *device)
 {
@@ -2042,6 +2053,7 @@ static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 	.unregister_host = exynos_dsi_unregister_host,
 	.attach = _exynos_dsi_host_attach,
 	.detach = _exynos_dsi_host_detach,
+	.te_irq_handler = _exynos_dsi_te_irq_handler,
 };
 
 static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
-- 
2.25.1

