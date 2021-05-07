Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFC3760E2
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 09:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C656ED22;
	Fri,  7 May 2021 07:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB00D6E7DC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 06:38:05 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id ge1so4599715pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 23:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D8n6iEvOkp7JFMHexk5IlQ4+H1eYCStP31Up2Te53h8=;
 b=eYRoMuYrsgXth/nt3aA95A0Ju5CDtmbNodAMrTcTWjzzch30d9zDPj1Pk41pfvPOXh
 bmtynlX9pri0zqwcv0ugGOckny3IyCN907m6hO9ueWM04m7w6KVWE1DDaRR8MgJwB5aP
 tKhot9yqISnmLO9IswFCHRDB/8zufUNFf1ufs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D8n6iEvOkp7JFMHexk5IlQ4+H1eYCStP31Up2Te53h8=;
 b=Qs4KOAlRi5mS0zTpfKqD9YG60xSvLhOKt0ZW5WeOcX7ajMZFNq+cVDn40Bd5h+nafE
 VMIg7erbx+JHK2+G5ySwCuGCQFtzgx4hwciwjXl9pq5qMi/we6wyXleFdLpfWwN9DHLt
 Nnp4fWCJm6vhx/g+jxamdJgrLh0uYYBihPRMaKR3eU8FjwbV/0itmgzITxFDD+nhP43D
 7dTqe2RyKPgX1h8OaVvB2ihaTQxoIIxQD2EAcZAzm2YKeMFnY6gnrnrkWK0EUr435T6h
 XvdUA1iXy0tbtc3peCvX++/PupGaeqNzGA1uqTaIu1Yor01oNQu1RPcWBM0C7OdtTGam
 Mzqw==
X-Gm-Message-State: AOAM531gQWu2l67SUf4cJjbst2jid0gYyiVuaOwPTypJ7VhqzqNMAB65
 YNG5fzsEIKrTHntYURYjBEHIMw==
X-Google-Smtp-Source: ABdhPJzUkdsAWpxxZdSFoS6HX7Z3ySRUQePju+VXk3kq5Gi68K6cD7mpqAe5LA2qX/M0mQILuEakmw==
X-Received: by 2002:a17:90a:7063:: with SMTP id
 f90mr21964188pjk.95.1620369485497; 
 Thu, 06 May 2021 23:38:05 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id d16sm3713345pgk.34.2021.05.06.23.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 23:38:05 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH 2/2] drm/bridge: anx7625: add suspend / resume hooks
Date: Fri,  7 May 2021 14:35:48 +0800
Message-Id: <20210507063620.390280-2-pihsun@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507063620.390280-1-pihsun@chromium.org>
References: <20210507063620.390280-1-pihsun@chromium.org>
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
Change-Id: I62122cc2a4eafdfce4859cbb419edc39875ebe3b
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0d90cd63fc27..dd23db9bc3d4 100644
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
+	SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume) \
 	SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend, anx7625_runtime_pm_resume, NULL)
 };
 
-- 
2.31.1.607.g51e8a6a459-goog

