Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669E867CEA6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF8B10E927;
	Thu, 26 Jan 2023 14:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4677310E927
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:47:23 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id z13so2009341plg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A1BDEAt+rxWWloQDlKB/2I6ZLTZG0ASWjyAAcB7oGTE=;
 b=lMOybId87xz2ZyOHJXou8xZjJy2Gienx1uyxdWQ0pNTgLk+M2+B9DN4O5BJIr5Pji+
 XW6Xp6rjEnaG7YFn/hj/Oh93k0G7s506IcxiYqxAg4dAN2bBej0MOTA+2h77TSGv5DcS
 XBUawWXccLWOHRppDnOqp1h5c8rU/sGkxnT8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A1BDEAt+rxWWloQDlKB/2I6ZLTZG0ASWjyAAcB7oGTE=;
 b=5Xba45NFECc0rOS3x5unTAe9gAAzRbWv3sU45V89OfIFMLM5JMFp9Vd3ib2EImBGiD
 2uY+bzmyW7IOZ26VXb2LEcchU4boa9uze6qEBWGZfGlQtkxopZOunKF+yVRfESnAK2h0
 Oa+lfVZOsIjLgJWHN4bULd6MkOpe2Cr6A+NZjwmThqYI/Haie6bNB7Nc0MkVZeR7sgqL
 7F/xBqkB6nkbP6CsBLvFDEoz6ee9wCQB8u1ZA65JQrZ7dpQzsZ6Af2sWEyc4q3fOH4f1
 GRQmz933RUhIKlMLDcdC4A5jI47TuQE03mHXtNXuq7966LsO0jB6eyddB2g558utLtx3
 tZ6w==
X-Gm-Message-State: AFqh2krJqqGYe96pxooCZMzIP10+cJjVoJIZ8V8sBiusoAdsd0RqW9+y
 n8PAgdOfwr/VTOpdP+D6YivYNw==
X-Google-Smtp-Source: AMrXdXsQ9iGnU7hZJbbFFwwp29B7k3r1WFplJKzJsKhS/P+qYxclQigi3wIX8J/engpZhelsyuPTsg==
X-Received: by 2002:a05:6a21:3381:b0:af:6cc0:5b3d with SMTP id
 yy1-20020a056a21338100b000af6cc05b3dmr50400165pzb.7.1674744442878; 
 Thu, 26 Jan 2023 06:47:22 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:47:22 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v12 13/18] drm: exynos: dsi: Add host helper for te_irq_handler
Date: Thu, 26 Jan 2023 20:14:22 +0530
Message-Id: <20230126144427.607098-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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
index 488fae218205..1d95909391e2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -325,6 +325,7 @@ struct exynos_dsim_host_ops {
 	void (*unregister_host)(struct exynos_dsi *dsim);
 	int (*attach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
 	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
+	irqreturn_t (*te_irq_handler)(struct exynos_dsi *dsim);
 };
 
 struct exynos_dsi_enc {
@@ -1333,11 +1334,10 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
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
@@ -1716,6 +1716,17 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
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
@@ -2030,6 +2041,7 @@ static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 	.unregister_host = exynos_dsi_unregister_host,
 	.attach = _exynos_dsi_host_attach,
 	.detach = _exynos_dsi_host_detach,
+	.te_irq_handler = _exynos_dsi_te_irq_handler,
 };
 
 static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
-- 
2.25.1

