Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF9662E60D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 21:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A377110E657;
	Thu, 17 Nov 2022 20:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C252D10E657
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 20:39:10 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id m15so1542061ilq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Qtp1sQRQzBXlT3WBoRlm6hPTuZynYBPeMuxiH1WVCs=;
 b=mxu1ZgEQKaJCi68utQFU0bC1fkMRs13p4Xs2GkoaBU2QH4wFfg/WxjPA5j0rkPnioW
 Sa5tyQFiUFI53GUAjfZmJOPp62c17/GzgAM9E4RPx2/t9PW165trmk7Y3EQGLXX0exeX
 byktKViokoVJeV3MqqKA1XbBPxlvSrLz2Zfxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Qtp1sQRQzBXlT3WBoRlm6hPTuZynYBPeMuxiH1WVCs=;
 b=f/wKbiRmqUWRnt9o9XWEL217zNlSWSJwXUovU0EGUBd+jXkTyYaPO5JcC3WVcEk7kl
 oY2MQvyTxJPxGfzG7d5Xa0AqQ9WeNHi2UBhhu6wiP47REpkK9ZJG1jk41fKFbYgeUUs2
 j1NJOprr0v7QW+m8WykTy+p7pyL8LgtYk9vLOuhhe855kf+HezIEw2MN20E6jR5RU5+J
 DvCUXJU3IsILaOgXdphswk96eC4gpmA2tteREAfcuEg85MKgfXn/+iONfhf6d8aCWPkW
 BtNRF6GZpnH2524FCcZyfigJYGjLlgbz7uoF7Z4EXEz8GIHuwGiKgtf4oPAaNmiWEADS
 5Pdw==
X-Gm-Message-State: ANoB5pnFf19eLMKg8u0sgXmJEagxqQfGVMYLZDp9kz3mm+qVRiDtD3F4
 rG1kZY3G4sLGomoo8iJIgz9rg/+f86qoJA==
X-Google-Smtp-Source: AA0mqf7jiV+CUhBJR5sMY+0ATWmq+aNHemsPzFFpBRvofMaokqK+YPcfrO4aRwlaJTF1Dm4QFUvHQA==
X-Received: by 2002:a92:dd0e:0:b0:300:b9c4:8c1 with SMTP id
 n14-20020a92dd0e000000b00300b9c408c1mr1945545ilm.124.1668717549772; 
 Thu, 17 Nov 2022 12:39:09 -0800 (PST)
Received: from midworld.bld.corp.google.com
 ([2620:15c:183:200:b285:6808:3f3e:f538])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a0262c8000000b00363da904602sm570192jac.13.2022.11.17.12.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 12:39:09 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/panel-simple: Use ktime_get_boottime for delays
Date: Thu, 17 Nov 2022 13:38:46 -0700
Message-Id: <20221117133655.3.Iebd9f79aba0a62015fd2383fe6986c2d6fe12cfd@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
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
Cc: dianders@chromium.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Drew Davenport <ddavenport@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ktime_get_boottime continues while the device is suspended. This change
ensures that the resume path will not be delayed if the power off delay
has already been met while the device is suspended

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8a3b685c2fcc0..065f378bba9d2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -280,7 +280,7 @@ static void panel_simple_wait(ktime_t start_ktime, unsigned int min_ms)
 		return;
 
 	min_ktime = ktime_add(start_ktime, ms_to_ktime(min_ms));
-	now_ktime = ktime_get();
+	now_ktime = ktime_get_boottime();
 
 	if (ktime_before(now_ktime, min_ktime))
 		msleep(ktime_to_ms(ktime_sub(min_ktime, now_ktime)) + 1);
@@ -307,7 +307,7 @@ static int panel_simple_suspend(struct device *dev)
 
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
 	regulator_disable(p->supply);
-	p->unprepared_time = ktime_get();
+	p->unprepared_time = ktime_get_boottime();
 
 	kfree(p->edid);
 	p->edid = NULL;
@@ -351,7 +351,7 @@ static int panel_simple_resume(struct device *dev)
 	if (p->desc->delay.prepare)
 		msleep(p->desc->delay.prepare);
 
-	p->prepared_time = ktime_get();
+	p->prepared_time = ktime_get_boottime();
 
 	return 0;
 }
-- 
2.38.1.584.g0f3c55d4c2-goog

