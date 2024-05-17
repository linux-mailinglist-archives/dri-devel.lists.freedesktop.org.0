Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500578C8CF8
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 21:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA74410EED0;
	Fri, 17 May 2024 19:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a6PRcZdi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785CB10E00F;
 Fri, 17 May 2024 19:50:29 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1e4c4fb6af3so6304495ad.0; 
 Fri, 17 May 2024 12:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715975428; x=1716580228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vGDwCwwhr9iyyZbcO2LNbRmyKSJnbSVS/UCD4IYwGr8=;
 b=a6PRcZdi5n8lu2w6/Ze+CzTG4fMhU2PzW8KgViFlz+Fk6WqKe0W4tl15oJVJdfzLcZ
 PTxRi+xYgxPObAgefoIUeXkdxkKvUq6rzQXhRJ5cVABOTB3mJHrJNL3Pnc+Z8tgqIIQo
 gHnHZ/kt/hzPcUdRCxn+Jv70vMsKQzdYEf9LPNhyw6puCQtseS2ZuU5XGgNValGtHzef
 ylS8Si8rlG/ED5TT0dzOkQIqr5lYWOP3diXbMtw0RBrVgtFMiJrsnjKiTW+cVxck9shC
 CGxMCHIFaoXqr+uWazzNtgw1+91CUWoALWNj+bZzeozuEEjmXgm7XvJJyeLv+IqXGXY+
 p9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715975428; x=1716580228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vGDwCwwhr9iyyZbcO2LNbRmyKSJnbSVS/UCD4IYwGr8=;
 b=jmTCwTMKE/fyd79bimYMLbNuST4h2Khn+/8H7kalq0sNvi7aN6QYQtRnQKhin625Zb
 Sq2gV9FprnWEJPhn0QBawIZpm3smZrU08Zr0OVUrfXwZ4otHoU65fFTUlBQjWVwekhBy
 WSPY34RETtnGh0/XX6Z+JafQ63vWnIqfT5uY+XD2Pj0yczPGE7d1p1lYWh/CLScIgLr+
 rKFgmljmTzvOkfOhmgKo2bFVEmuah8Ez58oAUfxc9vG1Hr7vx/HLweWeYop/+aufwuun
 t3CKZzdvQbbD511IcW4XkiKMnCadqGymPg8BntVNbNoyfVQZmFZ9QoxozPXFmZ66y5bE
 rRzg==
X-Gm-Message-State: AOJu0YyK7xpi9ktL0p3LNvvMOy7i4QH6vd8Z+NNpGeB3HEWFsAzTCHKQ
 yojZJ4UwZEHm0acG4Rj0ykLaxoSShBoYr+kGi1nju1Z064YOQoBkh1W+RA==
X-Google-Smtp-Source: AGHT+IGED0PKOMspRHBg/lO86eagMfaS1Pal7MYA8gYSpyUm/2pAAGCaWIEFdpCNBk+5VKC7GhGXlA==
X-Received: by 2002:a17:902:d4ca:b0:1eb:3d68:fc2b with SMTP id
 d9443c01a7336-1f2ed3f863amr1029215ad.34.1715975427744; 
 Fri, 17 May 2024 12:50:27 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d188dsm160529775ad.2.2024.05.17.12.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 12:50:26 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Nikita Travkin <nikita@trvn.ru>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Check for zap node availability
Date: Fri, 17 May 2024 12:50:19 -0700
Message-ID: <20240517195021.8873-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This should allow disabling the zap node via an overlay, for slbounce.

Suggested-by: Nikita Travkin <nikita@trvn.ru>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d9ea15994ae9..a00241e3373b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -46,7 +46,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	}
 
 	np = of_get_child_by_name(dev->of_node, "zap-shader");
-	if (!np) {
+	if (!np || !of_device_is_available(np)) {
 		zap_available = false;
 		return -ENODEV;
 	}
-- 
2.45.1

