Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F224059B540
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 17:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919CB8E43C;
	Sun, 21 Aug 2022 15:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7CB8E467;
 Sun, 21 Aug 2022 15:54:09 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id y4so7948134plb.2;
 Sun, 21 Aug 2022 08:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=bkh2RmwQz43pDpH6k4U/hhGBE1MuNMuBG/1+04H09nA=;
 b=ZNuEb7fEQxkPm2NNO2ZrPhQhxg0BwQRwImIdnuP6Yf88nqeoybObA5gVPi/QaxeDl2
 lMXau9nQFQN/XhXyesFCEWMsBo63C+eAi4u/rVGieZyYN6kjxqcl9iQynZQedN1tPBzG
 p9r5Xen6HBfl0pr9MDJ/T9bZd8jQhITDM3DCPkOKstNtSgKgnUcU4OkutHqMZLY9IB4M
 LxnMaAipIehqbD/frL8KKAdKDq5WHiWncxGG+XnFkP+QSY9P5FNr50Ldcf15qF/GFEz1
 7qHy/tzRU9+cVvIjIXToTf2d0996+QJIJ8MknJHzydRBfWG/RTxdTViurjUjKHHfqlPh
 NvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=bkh2RmwQz43pDpH6k4U/hhGBE1MuNMuBG/1+04H09nA=;
 b=6iu6rGzeRQDYvDnTTZkz4I6q1IjMOOmqdNEsLs4VWL5OMgvX24RpxsUK2nToDtpY+X
 O+BbuK0uxHD2uH1N/Iy2g9/gwTtjSnwK6OLa6xZaJ6H6IX6ipOmAuM5Zwrky8QUCM7IP
 g5dvwMpmXzvIJiqkHdjMsmNc8pBwfP07D+7B9SWvmyE0hpxGqj5ZYWJGZ/mgkPZostE9
 5wip8CjfG7tRsDimI+QKbvhkwTbk5boynEnUBiyI/rLD9lS6ytqkYr+yHW7LTvoJ71Mu
 qAw8JALm4WG02KZzhJ1EnwGqYpY2ttefyPJQc2K/LDxlDXOUVvacdRbobqNmCuOvia7y
 NTmA==
X-Gm-Message-State: ACgBeo3hbD5G7moKoCoeuMfwj6YQH2kkgGg+VBC94e2r8BAwNjnVhfNk
 b6cBmqZyrcJBuvPF9hNm5dvdJH0p3jY=
X-Google-Smtp-Source: AA6agR5Zh5My6hY3phecIGV+h3IPFUyS+zATf/VZj14J1TTIDjXcv0iGZrjT1Z8iftL+CvaKJJHV8Q==
X-Received: by 2002:a17:903:28c:b0:172:e5f7:f58c with SMTP id
 j12-20020a170903028c00b00172e5f7f58cmr2283522plr.37.1661097248488; 
 Sun, 21 Aug 2022 08:54:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a170903244800b0016bea74d11esm2910408pls.267.2022.08.21.08.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 08:54:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: De-open-code some CP_EVENT_WRITE
Date: Sun, 21 Aug 2022 08:54:35 -0700
Message-Id: <20220821155441.1092134-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 0ab0e1dd8bbb..2c8b9899625b 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -68,7 +68,7 @@ static void a3xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	/* BIT(31) of CACHE_FLUSH_TS triggers CACHE_FLUSH_TS IRQ from GPU */
 	OUT_PKT3(ring, CP_EVENT_WRITE, 3);
-	OUT_RING(ring, CACHE_FLUSH_TS | BIT(31));
+	OUT_RING(ring, CACHE_FLUSH_TS | CP_EVENT_WRITE_0_IRQ);
 	OUT_RING(ring, rbmemptr(ring, fence));
 	OUT_RING(ring, submit->seqno);
 
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 0c6b2a6d0b4c..7cb8d9849c07 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -62,7 +62,7 @@ static void a4xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	/* BIT(31) of CACHE_FLUSH_TS triggers CACHE_FLUSH_TS IRQ from GPU */
 	OUT_PKT3(ring, CP_EVENT_WRITE, 3);
-	OUT_RING(ring, CACHE_FLUSH_TS | BIT(31));
+	OUT_RING(ring, CACHE_FLUSH_TS | CP_EVENT_WRITE_0_IRQ);
 	OUT_RING(ring, rbmemptr(ring, fence));
 	OUT_RING(ring, submit->seqno);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4d501100b9e4..c8ad8aeca777 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -146,7 +146,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	 */
 
 	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-	OUT_RING(ring, 0x31);
+	OUT_RING(ring, CACHE_INVALIDATE);
 
 	if (!sysprof) {
 		/*
-- 
2.37.2

