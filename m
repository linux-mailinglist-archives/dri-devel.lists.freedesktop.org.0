Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D73760E0
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 09:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DD96ED0E;
	Fri,  7 May 2021 07:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1435A6ED02
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 06:45:04 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id y32so6458332pga.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 23:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iIHsTVDwZUKi4vi9k4Fpg3xBhTApyQbvyQyxMFkYsrc=;
 b=d26LaPUx1V8G2u7iyjzwa6TD1uOLQsla+3gprsco0Qyf0YBATrj5upfNiSOVcng0zP
 +d2U08lRYunyyfDMfxyrKeYw6mAqshqthlNtnJqYgDW560vrbIHS648WVoXydxzG7iQa
 oquS939ukdR+NePaDVsSeFD+cX7vfMYSfPkow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iIHsTVDwZUKi4vi9k4Fpg3xBhTApyQbvyQyxMFkYsrc=;
 b=X8xwkHp0v8hnGrI9zunibnRI2rpN4Pqmb0imO1sew2KOMpn1owlr94jbVt1eIdkx/G
 9FDyT9k+tZ8SQfuR/Fx+G5W0jo0kba00V5thajtBB9Pq9/Uueg57bSBQcxr+zO8Dj3T2
 5PP1vGjyPguSEAZt7AwKSmAyJfQ76/o9CyG11q4UYPv7XztODnMQPEgHZWxYi2uQ6diY
 JfjIUp57w7zG0bJTewcqsi0RCXT5B4Tu2BDvPnmK9pA8QdDpD5w5cuyyEtPYJ2StP/XD
 JJVh1SY/aRWLjR3TbReSUOgxpw/aoGNM6JgzkzpOdArvdsQDGTxDm0higCSIZcPC+5AD
 h8GQ==
X-Gm-Message-State: AOAM531GogxO/LRvIfyFhOV1+gPPmHwK4JnkEQo19hhE/esLZMC2mVsU
 SwN+u8kIOxuRIGsonR4w8sPOGQ==
X-Google-Smtp-Source: ABdhPJycX+BcyuPk4GD4/gY//WkAgZYjPSW5XZIGBAf04Qda+DAqmhB3QeZIjpvaSsmpzE+RnbJMbg==
X-Received: by 2002:a62:8fd2:0:b029:28e:8c64:52a4 with SMTP id
 n201-20020a628fd20000b029028e8c6452a4mr8840625pfd.3.1620369903634; 
 Thu, 06 May 2021 23:45:03 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id n27sm3931629pfv.142.2021.05.06.23.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 23:45:03 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH v2 2/2] drm/bridge: anx7625: add suspend / resume hooks
Date: Fri,  7 May 2021 14:44:28 +0800
Message-Id: <20210507064444.402829-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507064444.402829-1-pihsun@chromium.org>
References: <20210507064444.402829-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 May 2021 07:04:43 +0000
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
 drivers/gpu/drm/bridge/analogix/anx7625.c | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index f56f8cf1f3bd..176d395c1a9f 100644
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

