Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221AD560551
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7096A10E52A;
	Wed, 29 Jun 2022 16:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0C910E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 16:06:05 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id d14so16123359pjs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egURh53ld+NhXDS1wdCdA08O6R9LPjRpDFkoMid42Z0=;
 b=OSUkiwyuskUf+Byr0SuVvncCH4Lzu8K/kheg/bLfzzOv9U5BElk+a7IkIR+OjNTcHM
 iXFdbBJNlc09zCigO4KRlLz54n0cFDGu0DzFnbh+XATA//Bv3VoM7/dkXOM8/xR0gOhD
 DIeg1AciRPbBxiRCRbWd/Lh2svnORZXpz5cto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egURh53ld+NhXDS1wdCdA08O6R9LPjRpDFkoMid42Z0=;
 b=mZDDvqp5cAQs70R8IWPePy3Kpkmon/vMnqY0OlZBvR5v5VZKtxCR3g7iZFNX9FvreJ
 KapwqVduoqGMwVGYpFAkBu8cfhMQCjJVnmVc9sRYb8GaPrH/jROD8mydlaynroUFk3iZ
 4QUmRjSwgq2Gsfbka91z0WylyD1bR9jWnxqzGmWFh/iVVundhTgrN6IQKIxFHIrooIOY
 w0KFVW3jt1C8YXTYaq/Ng1N6ZvStOmCwYss7GjQ75izLqvxLidIdNyC7Xz6uUzFqIMZG
 aB1Ic/Up1BSGh9XmS3TEjQ78eeRvwk0dV/FXn+Y/wsqKPpRfi5eIFXUPmqEqPj5Ioyrd
 gPhA==
X-Gm-Message-State: AJIora/ZDXsrtvViBSCON5E1+dUAx0k2Dbxmgd5gb5oTevaQUaivH2+j
 f0/LrXwQcbMFdVcdFaR39qSWeu6TOXK2ig==
X-Google-Smtp-Source: AGRyM1v0n9Yujom0ChKMec4x+DMXG77s3nGIWQJwoZbRjQyXCrugCj4jmNVrznO8yxMBPKzwSGF+LA==
X-Received: by 2002:a17:90b:1d09:b0:1ec:bb51:9396 with SMTP id
 on9-20020a17090b1d0900b001ecbb519396mr6573335pjb.192.1656518765408; 
 Wed, 29 Jun 2022 09:06:05 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9841:721:7d8b:4502])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a170902e3d300b00163f8ddf160sm11495350ple.161.2022.06.29.09.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 09:06:04 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 2/4] drm/bridge: anx7625: Use pm_runtime_force_suspend(resume)
Date: Thu, 30 Jun 2022 00:05:48 +0800
Message-Id: <20220629160550.433980-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220629160550.433980-1-hsinyi@chromium.org>
References: <20220629160550.433980-1-hsinyi@chromium.org>
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
index f89e8151475f7..478f5af381c7d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2504,38 +2504,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
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

