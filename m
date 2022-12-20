Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11186651FA2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 12:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BC510E3AD;
	Tue, 20 Dec 2022 11:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B8610E3AD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 11:25:54 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso3368721pjp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 03:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qL3q8JCSm7dZpOMKxIJmM85ousNnPYyNvyBWJgJYTmw=;
 b=VGFKrEB5fp2xCuXYNsMMXnJNbm8MkZ1iJbKa2Rwjkhmj3iefziiq9C1Kdq9KwbGPB+
 3lQQ/dCEqIbaz0Ov/yxEGTRCupOiUzBiycb5Ng8xHjhk2iB+1IFbNAyQ5+33k7NEuU7A
 yc+p5rQVKmx3vklhIpZiRnu2vIpl5dGLwvFhXz6j7CtuRoLDweynCz6s3IsDSoCUMME8
 kx68hTeIlJGWI8XrySClqh+4Md2tZUqP8x2Vruai9KEjFsuMLyCZ/MITj86mrgu1Uy3+
 72zjtQ4MQZyH3g7XE7CiRphZZBJ754Im7DmJh4OGXtXwOTUdlP15L98DX5n6saPJUfAT
 VVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qL3q8JCSm7dZpOMKxIJmM85ousNnPYyNvyBWJgJYTmw=;
 b=HnepXlsvUW+5kHofqF4Jwvjgo3I8poXSGM6VAKFdHpOqwLewNOsm6sAl1tVxIE0IA3
 xmJci83WXo1mLRq06JzlWK94RetE8TDRbQuIl2cxuOHmqaCFtSEo4r0m6/yMMBPGgQSn
 DxeES5rChlY1dl0Nd1R4N09B8kqPB1wmiwuzMipgihnLxXlooua7ZEhs5iKowA+j0fkL
 9IghEffrWzAFTwxNHcqe5y0acKFB/olfQffPDNRzD4QZe4/PmWdEjdmTs4maq8Oxkk6J
 eaGKJBjMqyGgl4+FoCDzPBkP936pxO/4/TdnjwZQYwUzOzVa+DB55aV8Zye3yIs85+ge
 FAzQ==
X-Gm-Message-State: AFqh2krNEMU+mBVmma6bxW22dLOxDdlZ38j6RNqYjA8SgoRRmpKKTp1q
 HyswMEg7NtOhTi0dP8/vNZ4=
X-Google-Smtp-Source: AMrXdXtQog0J3OQ9/m/1FZxavZLd2S1k9iOW5sVlK6YbMXoSVlJieaashWu6o3f4JuLz8MC66NknHw==
X-Received: by 2002:a17:90a:cc08:b0:223:2aa6:7f0f with SMTP id
 b8-20020a17090acc0800b002232aa67f0fmr26260754pju.7.1671535554392; 
 Tue, 20 Dec 2022 03:25:54 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 qe12-20020a17090b4f8c00b00212cf2fe8c3sm1194982pjb.1.2022.12.20.03.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 03:25:53 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: Fix refcount leak in vc4_hvs_bind
Date: Tue, 20 Dec 2022 15:25:44 +0400
Message-Id: <20221220112545.1460168-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

rpi_firmware_get() takes refcount, we should release it with
rpi_firmware_put(), add missing rpi_firmware_put() in the error path.

Fixes: 2a001ca00ad5 ("drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c4453a5ae163..816844ea60b1 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -809,6 +809,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
 		if (IS_ERR(hvs->core_clk)) {
 			dev_err(&pdev->dev, "Couldn't get core clock\n");
+			rpi_firmware_put(firmware);
 			return PTR_ERR(hvs->core_clk);
 		}
 
-- 
2.25.1

