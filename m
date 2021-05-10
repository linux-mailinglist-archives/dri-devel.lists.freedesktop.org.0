Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD84377DA1
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 10:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9A26E22B;
	Mon, 10 May 2021 08:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD43B6E408
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 05:31:46 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id 69so3948989plc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 22:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3uZlkdD1HWKgRch2ttjuGoW2tvlVxTNtmyNQyMfx3E=;
 b=FFXr2jSenbxpqxMUI4nePQ7AdoB+B00Bp3IF+EaQmvS7YhIBktmcgcDSkpRCb6wHnJ
 yDpnvfJ5EbJg3BAiMn+epraOwT0GuwRnVlEjSuWVWProC7mcXBcUjeXKRuaZbESOm12a
 d4Cdk0yu5paVLskbeoCwautAqGT23OkKTINjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3uZlkdD1HWKgRch2ttjuGoW2tvlVxTNtmyNQyMfx3E=;
 b=N9pNeUdZlfL0z4DAJmhNFPp3E55jS7o9RGpIFMblkJbakTml97pehduMS6MNwmomvI
 GETst3ttw+BOXt9l8y7OjD0KpQ+oMlZPuvq+hcOHrc6V+QnVIpx7kn4/f0zNdC9Plbrw
 qk9uzJyxH6xokvH4OgrOq38ZatShgBHTjSVUoTwI2mgTsbC0jP8oLRynZoIpwbSn6gSx
 B+9XqHX04axWLrzwZY1mxdSr7YMVyDPP2veuwvWEfmLRpJZPuvz+zgNAA/ZThYWA7rTA
 iJuG7VbJf96FpZN7rbuDo/c0oJKqvv2GLjno2AqJpshQw1oPcrI2IrtbUc1jfSlwZx3O
 2vhg==
X-Gm-Message-State: AOAM531PZgvcCn0OOmCSKJKzEF19DLQqpjhkzMdiUuRLh9E3yELyeIph
 5BDfr+J6q9C1uNhP07lWgVHf3g==
X-Google-Smtp-Source: ABdhPJyClYsefcDI4WYWbIMRt4/1/G6Zslx9GrWyEsEGJiL5t27r81d3t1J/kW4j2r+Kyt/FSZgNJw==
X-Received: by 2002:a17:902:7c94:b029:e6:e1d7:62b7 with SMTP id
 y20-20020a1709027c94b02900e6e1d762b7mr22651481pll.29.1620624706378; 
 Sun, 09 May 2021 22:31:46 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id w2sm10485834pfb.174.2021.05.09.22.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 22:31:45 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH v3 2/2] drm/bridge: anx7625: add suspend / resume hooks
Date: Mon, 10 May 2021 13:30:52 +0800
Message-Id: <20210510053125.1595659-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210510053125.1595659-1-pihsun@chromium.org>
References: <20210510053125.1595659-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 May 2021 08:04:24 +0000
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

Changes from v2:
* No change.

---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index e1bf31eafe22..b165ef71e00f 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1705,7 +1705,34 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused anx7625_resume(struct device *dev)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	if (!ctx->pdata.intp_irq)
+		return 0;
+
+	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev))
+		anx7625_runtime_pm_resume(dev);
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
+	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev))
+		anx7625_runtime_pm_suspend(dev);
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
2.31.1.607.g51e8a6a459-goog

