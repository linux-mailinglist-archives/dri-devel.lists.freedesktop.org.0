Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0071CFCC56
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9131B10E31F;
	Wed,  7 Jan 2026 09:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mpSlR1gO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A73010E09C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 03:07:15 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59b6f52eea8so265408e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 19:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767755233; x=1768360033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Im5w+X2Lal8NwiECghgDir2UlUgw/byLKwq5m4IWhH8=;
 b=mpSlR1gO5+verrNfmET5JW1hNFLO0EWviHjJtCd1qsB+bpTagaHhMTP6lRuCPwPX3i
 eocKCPmPIAWxH/MHouWXCxEYDgkFTQxRfe/JySHfEYWjC1fIqg2gihPiMrL4CpubefFZ
 IYQnAFTUFPWQuqrZc4DvTJ+CK+f7tKN/XgEA/yv071BbAqhaHw6a9uUh8c2KIuaHjaCR
 CTWfl9H0aXMrU+cqH6IvYtOYEBtNLuI5O/4ZKRugSni7BYpEWjnKj554TQjHcvJXscvT
 qkV1oVPDmphN9kjnXiNVvDrNwF9h07RvHDv5jPlrXmbGWnPM2vFXQTpzk/Z05LiaQi2p
 CoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767755233; x=1768360033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Im5w+X2Lal8NwiECghgDir2UlUgw/byLKwq5m4IWhH8=;
 b=BEEnF44mh8ojAAolIV/gmIzqtlD907kHZCtuveAnKA37sRFfeEncxV2PprTL+GolCo
 X86vhtUI7GiJDv5n/Mkndu0DYfpsIdTc3CaSMM9HNtQinFjcTCvBXnOKgLvq83IXzm29
 QNMIQ10UKsJGEEU0qpAkkID0PVchuUIXtuS5wtU53TGXzKqg2rZifE+j8qCcZsY7fiT9
 IJutYxDLA4hnYkm3IFsniylwp59X9i3SuFxrsdF/tryjmqn5GIo6Gu0YI3tCynRPI1wO
 2G+Ud6CfOUj3QNclWXHc5zyV67ANc19ZLGBHlFvl+/QWLXhLOfrVNa9dkoin0mc8wjvW
 um/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfGlLoTr5mwTwS19wb7ZlE8Ag1Hm08arOyaOiRbmeyyg5xkmGgaKypGpee1jjwVs2jQmFCuOQnkg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTxmGbLXf68HYbpJLqxA2UCy03lQjyuiLkjgz9S5tDFFE4jMEr
 C2F6d2UCqeIyNwWV8+wF7FF7MPPfZFkJulOYlg0qu03ci1Bavv/qJwes
X-Gm-Gg: AY/fxX6RUAFL10kKKw5PczTKFywIy8AxioufzKcQHBpR0SPwE9SAZ9vQHq81jUA7VaC
 N1AENfHVuY6z7EPXHcyw5iKjv7x1VP6JG5DUSnouz8PPpH0PxQZrrkqOmBhVr17okzLDQNSt3Jv
 2qUxsUoSwQNhJ0RIcn5bM1URowtMr5QMTGwfQWraCJ9bZnlXLXghTnGfnC79TFA0n83kJZS9hri
 9TX1zsxjW5LELZxqICND06H2RrAmMZ72FKRp6QlvbR2v7bodb6dtb3beeRap4UwxAhiIXpZYnl+
 RuKNC8RDLorx1U5iHmsTly4LDfsgmOZffc5lZLccajSVN0YtKYI0cX6/Jzqfq7i5zhBYLGmY6ID
 to3etmdRt94CiPuLAFaM8xsvTV3qsJ9fGtsF8gydAjw7Pzy1KZykYbd4kEoqS2uATrPyhsr1xcS
 43r+G9fY/C+M4aWC5J3omuig+MlpDSOw==
X-Google-Smtp-Source: AGHT+IF7r9BrS/noTScLMtUxw/ll7yVuUTiu1i9Y2D+wZO2s/y5ZZu6A1j7zjLY2/YSk16GUxNJUkQ==
X-Received: by 2002:a05:6512:3dac:b0:595:7c47:cd47 with SMTP id
 2adb3069b0e04-59b6ef06975mr357582e87.2.1767755233109; 
 Tue, 06 Jan 2026 19:07:13 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-382eb7b464fsm8468761fa.20.2026.01.06.19.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 19:07:11 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: Vladimir Yakovlev <vovchkir@gmail.com>, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andrzej.hajda@intel.com,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: change to use
 devm_request_threaded_irq
Date: Wed,  7 Jan 2026 06:07:00 +0300
Message-Id: <20260107030700.326843-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: DEZGWL9B8SOU.ON89J7KLA9QA@bootlin.com
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Jan 2026 09:14:13 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's better to use devm_request_threaded_irq because resources will be
freed automatically and no additional checks are needed.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 3868ad05e011..bb5cff021c93 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -851,9 +851,9 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	init_waitqueue_head(&lt9611uxc->wq);
 	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
 
-	ret = request_threaded_irq(client->irq, NULL,
-				   lt9611uxc_irq_thread_handler,
-				   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					lt9611uxc_irq_thread_handler,
+					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
 		goto err_disable_regulators;
@@ -892,7 +892,6 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	return 0;
 
 err_remove_bridge:
-	free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
@@ -910,7 +909,6 @@ static void lt9611uxc_remove(struct i2c_client *client)
 {
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
-	free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
-- 
2.34.1

