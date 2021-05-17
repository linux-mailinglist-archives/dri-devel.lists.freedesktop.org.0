Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34BF382565
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 09:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247446E8DF;
	Mon, 17 May 2021 07:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054736E8CB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 06:36:11 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id t4so2561911plc.6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 23:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Tg/RgH3lp5a6IJvwx2oVZOXwmXN1gNn/tsf5GPtb30=;
 b=MVc5tdGuSSUGmOzbRzu21NtT/fVffglYdp2tHOwdLEDQEOl37jDtoulN8H0ED38KMq
 LTXzbhVAf4v4A70E7+h6V+hP6ckzhj23OQ+7/wUX0FM009eDjwgF6VqmZywn/uJeM0LL
 zauYn3zpV5igIJ9RmdyJOYHF0+MfLMsB5kQaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Tg/RgH3lp5a6IJvwx2oVZOXwmXN1gNn/tsf5GPtb30=;
 b=KAgjcY+GgdrvmsarYhcnknZ7aSJkijmd2B20OAyw4RfIzwqHF/2y5Tg3tDFNz8A3ox
 QTIsYhQjcYJZvPWy50csVAN2fLKMXAeilim/XUz7zzDG1dqxgfNhA4W6WdrqVdxeLeDo
 PorzAWrHAIr0vJ9RMqioNmaTxArRVxCr5aw6pRmLyNzhWH4f7jZlY+MfiVzw9KW/38KV
 URH4kNVCGKoNZN/9hF7bpT+7zBKrBfbT7o5E0+jwXZ6nuD/qTDwdBw6Pk5Hr6c8oPTvS
 CsL11zglecOUXOS24Fu3X90HskheVsBUqHn/wRh9vKmaPPvk870l9DecOALzSkC3M1Sx
 i6pQ==
X-Gm-Message-State: AOAM530LeUuWHEdCNhx9EVsHGBF4xyw+8TiXp3k52NmlpS9VSsH79skl
 ewC2H76fz0kNlTSnN0EYLC7uYA==
X-Google-Smtp-Source: ABdhPJy9094BrnHnEUXn71wH1HENbeF/VCLgouqXsZoavo6R53U59pCdxn2vVifSvk0jvhwwVUNn9g==
X-Received: by 2002:a17:90a:f18e:: with SMTP id
 bv14mr18728495pjb.234.1621233370562; 
 Sun, 16 May 2021 23:36:10 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id js6sm13287612pjb.0.2021.05.16.23.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:36:10 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH v5 2/2] drm/bridge: anx7625: add suspend / resume hooks
Date: Mon, 17 May 2021 14:35:29 +0800
Message-Id: <20210517063553.554955-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210517063553.554955-1-pihsun@chromium.org>
References: <20210517063553.554955-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 May 2021 07:32:15 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add suspend / resume hooks for anx7625 driver, that power off the device
on suspend and power on the device on resume if it was previously
powered.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---

Changes in v5:
* Disable irq and flush workqueue in suspend hook, so the irq handler
  won't be run during suspend.

Changes in v3, v4:
* No change.

---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index e1bf31eafe22..8fb76ca66e5b 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1705,7 +1705,39 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused anx7625_resume(struct device *dev)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	if (!ctx->pdata.intp_irq)
+		return 0;
+
+	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
+		enable_irq(ctx->pdata.intp_irq);
+		anx7625_runtime_pm_resume(dev);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused anx7625_suspend(struct device *dev)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	if (!ctx->pdata.intp_irq)
+		return 0;
+
+	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
+		anx7625_runtime_pm_suspend(dev);
+		disable_irq(ctx->pdata.intp_irq);
+		flush_workqueue(ctx->workqueue);
+	}
+
+	return 0;
+}
+
 static const struct dev_pm_ops anx7625_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
 	SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
 			   anx7625_runtime_pm_resume, NULL)
 };
-- 
2.31.1.751.gd2f1c929bd-goog

