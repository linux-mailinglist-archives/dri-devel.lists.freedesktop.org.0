Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0721155C062
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 12:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C07113F4D;
	Tue, 28 Jun 2022 10:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8C4113F4D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 10:46:59 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so15492360pjr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOIcgKg0TtpygR+M4l/a5Aie7Bx2vAFMNFWbFKFYQ8U=;
 b=GuvFAaNjrohDIewzt9xxIfAXValLDg3IzoAnYxQQMA6X6zm4KAWN+PuxIBqzsm5/SI
 mxV07tknmbPx8U/rDWAC363nkdVz+vHZYm4ufprrnfDdDpaIwSfb+QY8f8NgMrxOWgTM
 h3qOMjrpAVTUPm2jQNgSKNjQ+iMx5CZOvcgeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOIcgKg0TtpygR+M4l/a5Aie7Bx2vAFMNFWbFKFYQ8U=;
 b=zaprKNqFydpDaHuhKAgcIXTpcLTPqOMf3YYF/L+1otR5VqGY/ouBgru2qag6o7IM4J
 SacFhcEG5CWFF6uf0AtcJWsaTMZN9Gv2xWM2/JaqlcyASyqtkopZh5Uu6E0d7R9TAU92
 empiHJA3SW999OawKIg8ghQ2sK+pHPs9ZkxKtcYTldWAXWo1iQh6fcif62OyUFmGF4X0
 ugmwDiVUw+eAFfjzT1J70zDMoWtapNuAVXTKvUB7cz7KyhBlOBfldCBw3Knr1weXqvIu
 DCFABVLvvT2fQuOcqGCgWnOpgg/GsEVU0oxyZep/4pXbM4I5QjObVJJbsDXfV2tUKrBa
 Aanw==
X-Gm-Message-State: AJIora+Nyf6FKz74ptIXQRW1agMA0hiMrOOWpl4fbsH76A4Fow3rvDxf
 4nE6nmiu0v4bYarhAR05eXsZCw==
X-Google-Smtp-Source: AGRyM1sdnK8kNyQNyHtoepsQkJEghWZ/ol0iWg2u5H/YPdHl6rnzDJLPpw+uJbtuDgeIVjMH8gSCPw==
X-Received: by 2002:a17:90a:e7c2:b0:1ed:3a07:caa8 with SMTP id
 kb2-20020a17090ae7c200b001ed3a07caa8mr21070377pjb.234.1656413219420; 
 Tue, 28 Jun 2022 03:46:59 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:eafc:4c4c:9d0a:651e])
 by smtp.gmail.com with ESMTPSA id
 jj22-20020a170903049600b001674d61c1c6sm8846377plb.272.2022.06.28.03.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:46:58 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH] drm/bridge: anx7625: use pm_runtime_force_suspend(resume)
Date: Tue, 28 Jun 2022 18:46:50 +0800
Message-Id: <20220628104650.2239191-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to check for IRQ or disable it in suspend.

Use pm_runtime_force_suspend(resume) to make sure anx7625 is powered off
correctly. Make the system suspend/resume and pm runtime suspend/resume
more consistant.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 33 ++---------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 3710fa9ee0acd..09688a1076037 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2542,38 +2542,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused anx7625_resume(struct device *dev)
-{
-	struct anx7625_data *ctx = dev_get_drvdata(dev);
-
-	if (!ctx->pdata.intp_irq)
-		return 0;
-
-	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
-		enable_irq(ctx->pdata.intp_irq);
-		anx7625_runtime_pm_resume(dev);
-	}
-
-	return 0;
-}
-
-static int __maybe_unused anx7625_suspend(struct device *dev)
-{
-	struct anx7625_data *ctx = dev_get_drvdata(dev);
-
-	if (!ctx->pdata.intp_irq)
-		return 0;
-
-	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
-		anx7625_runtime_pm_suspend(dev);
-		disable_irq(ctx->pdata.intp_irq);
-	}
-
-	return 0;
-}
-
 static const struct dev_pm_ops anx7625_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
 			   anx7625_runtime_pm_resume, NULL)
 };
-- 
2.37.0.rc0.161.g10f37bed90-goog

