Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3570353F5BB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 07:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D406112A9A5;
	Tue,  7 Jun 2022 05:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9DB10F122;
 Mon,  6 Jun 2022 21:13:36 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id n10so31387145ejk.5;
 Mon, 06 Jun 2022 14:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/vrjMAvCFt6wUI3BDJ99m6gry4K6PxML5aBtTWp7pZQ=;
 b=JjYSoRegWg4TZgb8oMQZIZJSQWGIKj9z2gM5kWLF70V1Ib9I32PpN4BWerHyWCrw5l
 HvB34rGAglkE+wPkkNQab9kQ2pJrPEfJWtJDZUJ1KBouMzrWehKMd1FW8niFVKONtVfI
 g8AU4ecym7aMzL+hZZnsf9cHrn/sZB/GQzUuKLBn6HuBaL+iDsAEJlQDHkHpJZXUX6DD
 449ChyQIf7H4J5vEq0bzWxuAkbYfh+b2mtm2xu6bpHJvtbS1Ac2IchV5YbnwjZcQ8JBx
 psWXQsq67vFX3OebEtCBqQkMpm5deM6VD7q/RQgrd4xR56BCBk+k27cAQ7XNpg83GQdl
 b6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/vrjMAvCFt6wUI3BDJ99m6gry4K6PxML5aBtTWp7pZQ=;
 b=mn37cDLPbiiSF9VC6eFmO8MUKqGyi0U5I5E+zVDgHbEr2PPrZYlw4OmbFe+99fHEvw
 eomXn8MvH775HF5s8umo3y9xKO99bHuMsGaUET8Y4ZS66dVBZ2Nj5vkP0tob9U54b/xu
 yGfShqPh2Z2lsacJGbAHLPSx2fqP8PXpIj79L46Pha4vhiCqxMQEpc9Mq7AZLOXKQy/5
 M655cQWvQkqdhATVOkn10zV6iI9eN7wnOP6q1KMN5wS7A+zAjemIjEfoA17J7tiMD0tp
 B7MQOWGWRt1yVi5Dc7DHvXsLXG3aGoXvlIDMdt1ZR1YDTk10raURnoxPZpBCoMKDmpXP
 jgWQ==
X-Gm-Message-State: AOAM5304imriCee5lAGQgwIRAMS1+bjRb3TtAUzPGNJlB9+jHFP3q/Io
 iTgwP9XrFnV1kry9wBdEjf4=
X-Google-Smtp-Source: ABdhPJzu0VYk2HyNbCEmKotVrY7I0kwRusHR3DozhQRm/s4pEzZeZM0+mkyCZ1uSwCq8FooJhmyt9w==
X-Received: by 2002:a17:907:961a:b0:6ff:b74:7e67 with SMTP id
 gb26-20020a170907961a00b006ff0b747e67mr23436126ejc.424.1654550015210; 
 Mon, 06 Jun 2022 14:13:35 -0700 (PDT)
Received: from xws.localdomain ([37.120.217.83])
 by smtp.gmail.com with ESMTPSA id
 kq15-20020a170906abcf00b0070cac22060esm5144284ejb.95.2022.06.06.14.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:13:34 -0700 (PDT)
From: Maximilian Luz <luzmaximilian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm: Fix double pm_runtime_disable() call
Date: Mon,  6 Jun 2022 23:13:05 +0200
Message-Id: <20220606211305.189585-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Jun 2022 05:55:10 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following commit 17e822f7591f ("drm/msm: fix unbalanced
pm_runtime_enable in adreno_gpu_{init, cleanup}"), any call to
adreno_unbind() will disable runtime PM twice, as indicated by the call
trees below:

  adreno_unbind()
   -> pm_runtime_force_suspend()
   -> pm_runtime_disable()

  adreno_unbind()
   -> gpu->funcs->destroy() [= aNxx_destroy()]
   -> adreno_gpu_cleanup()
   -> pm_runtime_disable()

Note that pm_runtime_force_suspend() is called right before
gpu->funcs->destroy() and both functions are called unconditionally.

With recent addition of the eDP AUX bus code, this problem manifests
itself when the eDP panel cannot be found yet and probing is deferred.
On the first probe attempt, we disable runtime PM twice as described
above. This then causes any later probe attempt to fail with

  [drm:adreno_load_gpu [msm]] *ERROR* Couldn't power up the GPU: -13

preventing the driver from loading.

As there seem to be scenarios where the aNxx_destroy() functions are not
called from adreno_unbind(), simply removing pm_runtime_disable() from
inside adreno_unbind() does not seem to be the proper fix. This is what
commit 17e822f7591f ("drm/msm: fix unbalanced pm_runtime_enable in
adreno_gpu_{init, cleanup}") intended to fix. Therefore, instead check
whether runtime PM is still enabled, and only disable it in that case.

Fixes: 17e822f7591f ("drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init, cleanup}")
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4e665c806a14..f944b69e2a25 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1057,7 +1057,8 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
 		release_firmware(adreno_gpu->fw[i]);
 
-	pm_runtime_disable(&priv->gpu_pdev->dev);
+	if (pm_runtime_enabled(&priv->gpu_pdev->dev))
+		pm_runtime_disable(&priv->gpu_pdev->dev);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
 }
-- 
2.36.1

