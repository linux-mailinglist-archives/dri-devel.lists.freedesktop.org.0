Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5215688BB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9B011AEF8;
	Wed,  6 Jul 2022 12:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723BF11AEEA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:53:07 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso9932472pjc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=02sx8dmnjBV/TuA75YAbyzwEMk2jxyWLuGZcJUXA1mA=;
 b=X9gPzsTtEqyMRnO0Ze3pIsRss45disf2+3R39oFMVTCGIQYT5ISLaMeO4Gh8LRckRx
 OERTPNsDduJXlF7SJsWM6NOCPOLaRNPDFhuL1h/nJ9YD5qa9n21qbyoY8vZic5K1hDcl
 VxrOjj8xpT3Tn2zhuDO+XCcn7MNtsKGW5+rZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=02sx8dmnjBV/TuA75YAbyzwEMk2jxyWLuGZcJUXA1mA=;
 b=vQJJ/pgo8fsj65GG6WUXadzKg5qQrhKZ+0dJjyi5eEWz4zOnYVDZuhikbKSfQlTr1O
 fTsXeEHSwcvRo+cffu+azq66iWrcgPHhQZZSEq4fAFiYvFm8eIP7fZ3KFNfLcL0kmdrc
 Ztrq1Q6+FnabO1vW5tUjsJBv1sKUd9/qnYElMQlWzCU2veINNTnYlnW2dBW5ZI82uTZU
 LOh7FA0L3UlYSfaqgsHxlqD1YlJKwR3mlr7aX8m0W+xjSV96R1q6x0rDYfLKe2uDBCPs
 xlpQ8E9BT1KuPWEgVnFqeYCXHUC02i86d6uJFyvHHYypo7V7kRVLpW5WiezB0jFCl2uy
 8HBg==
X-Gm-Message-State: AJIora/M9SRnbukM0LNQ3gaEQ+Rx0VWbzYKq6/ptChaaDyLdtH21gyf0
 w5iLG+epsOEsr/5dq5gqO4uiJg==
X-Google-Smtp-Source: AGRyM1tVtIQMvEuRrEN1V6YdOkUQGwBxQrSJYSlc5cAvGJXjazJWEXQKaWJoonujkv303bFau4bonQ==
X-Received: by 2002:a17:90a:1a42:b0:1ef:680b:8ecd with SMTP id
 2-20020a17090a1a4200b001ef680b8ecdmr30544374pjl.88.1657111986992; 
 Wed, 06 Jul 2022 05:53:06 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5300:b974:1680:1bd])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090341cc00b0016a6cd546d6sm25640127ple.251.2022.07.06.05.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 05:53:06 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 2/4] drm/bridge: anx7625: use
 pm_runtime_force_suspend(resume)
Date: Wed,  6 Jul 2022 20:52:52 +0800
Message-Id: <20220706125254.2474095-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706125254.2474095-1-hsinyi@chromium.org>
References: <20220706125254.2474095-1-hsinyi@chromium.org>
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
more consistent.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Xin Ji <xji@analogixsemi.com>
---
v1->v2: Fix typo.
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 33 ++---------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index ab346d32d8735..fcf07a037c2c8 100644
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

