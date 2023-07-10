Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2849C74D0BA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BD410E23A;
	Mon, 10 Jul 2023 08:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1BB10E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:59:28 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-666e6ecb52dso2162091b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 01:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688979567; x=1691571567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2OanSTpq1Hu+eB1tq8Ra7sloAy2DlkjuZwNNKykIg+Y=;
 b=N80NZ44X0t7thJJ0vLDqvr4zKutEVaCwMMFAPELtgteYsbDVFii3DI0Cx8z9T7Aacg
 +qdAnK579GkxHladVU00spflDJwR44Mdob9ep2ghfszyHQrUZiZzbDd+9J5A7fvaDZN9
 LIoqCRPzLjQw0Avyf6rcTyZs01pPkLs9Os4Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688979567; x=1691571567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2OanSTpq1Hu+eB1tq8Ra7sloAy2DlkjuZwNNKykIg+Y=;
 b=ecURDBiMjRaVkEAdvyGa3pY1fGT/JQFhrhO+NXypKmTZgyYEt/jsJ0WWVobsrmDqkc
 BYjwe69cSZMH45PbS1Z9rJ0KXQxntkm2IUZIFvcY+kEs0/s9IfCpa0oELZrxT6CiibMI
 s3JEnUqR8EOhU91Ib784kBybJD/Z6M/qaPYbUlr9r9tddaPQxFePLkl8RTMIyGj9KMVg
 Gei8Wc5krZJEyl+hz8mHvjHTn1kzc2/HFljrkPjq9NKVATKTOUSdN+hstEvM3lSCmNt9
 +u4NXJUAaNzJ2EsGkpijtC7ReOZ7mYr7RDNtmBLI052p39KWneH4rfPuAVU4oUGzJchV
 ncwg==
X-Gm-Message-State: ABy/qLaZnrjocjLwfmd3vrj9wETpMFNyvaIO9g0GW4lVOG7TZnTnMKh3
 sb0hEHqQrI6+sPCWvDonWgAFOQ==
X-Google-Smtp-Source: APBJJlFY3VjxNMecfVD5N/oZbTxkxOx3DlD/D4Wh64sajE5X05MzrcSz0Ig3kMHdNwy6WaRwDMTCQw==
X-Received: by 2002:a05:6a20:a11f:b0:12c:dac0:a9a4 with SMTP id
 q31-20020a056a20a11f00b0012cdac0a9a4mr11924214pzk.5.1688979567468; 
 Mon, 10 Jul 2023 01:59:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:be97:1d05:f9b6:36a6])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a170902778700b001b8b3108292sm7750701pll.12.2023.07.10.01.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 01:59:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] drm/bridge: anx7625: Drop device lock before
 drm_helper_hpd_irq_event()
Date: Mon, 10 Jul 2023 16:59:21 +0800
Message-ID: <20230710085922.1871465-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device lock is used to serialize the low level power sequencing
operations. Since drm_helper_hpd_irq_event() could end up calling
.atomic_enable, which also calls power sequencing functions through
runtime PM, this results in a real deadlock. This was observed on an
MT8192-based Chromebook's external display (with appropriate patches [1]
and DT changes applied).

Move the drm_helper_hpd_irq_event() call outside of the lock range. The
lock only needs to be held so that the device status can be read back.
This is the bare minimum change to avoid the deadlock. The lock could
be dropped completely and have pm_runtime_get_if_in_use() increase the
reference count, but this is not the same as pm_runtime_suspended().

Dropping the lock completely also causes the internal display of the
same device to not function correctly if the internal bridge's
interrupt line is added in the device tree. Both the internal and
external display of said device each use one anx7625 bridge.

[1] https://lore.kernel.org/dri-devel/20230112042104.4107253-1-treapking@chromium.org/

Fixes: 60487584a79a ("drm/bridge: anx7625: refactor power control to use runtime PM framework")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- restore early return if event < 0

 drivers/gpu/drm/bridge/analogix/anx7625.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 866d018f4bb1..e93eba89d5ee 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1593,18 +1593,20 @@ static void anx7625_work_func(struct work_struct *work)
 
 	mutex_lock(&ctx->lock);
 
-	if (pm_runtime_suspended(&ctx->client->dev))
-		goto unlock;
+	if (pm_runtime_suspended(&ctx->client->dev)) {
+		mutex_unlock(&ctx->lock);
+		return;
+	}
 
 	event = anx7625_hpd_change_detect(ctx);
+
+	mutex_unlock(&ctx->lock);
+
 	if (event < 0)
-		goto unlock;
+		return;
 
 	if (ctx->bridge_attached)
 		drm_helper_hpd_irq_event(ctx->bridge.dev);
-
-unlock:
-	mutex_unlock(&ctx->lock);
 }
 
 static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
-- 
2.41.0.255.g8b1d071c50-goog

