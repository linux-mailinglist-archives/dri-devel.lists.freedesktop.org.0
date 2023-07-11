Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA274F795
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 19:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8F10E3E5;
	Tue, 11 Jul 2023 17:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7FC10E0F4;
 Tue, 11 Jul 2023 17:54:19 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1b89600a37fso30691645ad.2; 
 Tue, 11 Jul 2023 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689098058; x=1691690058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=51D9c0yVqzyFZCZkTJ0kt3i/VPXv4eay4HZNWC1auNY=;
 b=Gcs0mnql8X3fsKI4gmoydVQVgblWa79bdy2+0+otEJiCi1adxEiy9VHGCNDkKW8YgL
 6Tt4mVCfrwo+Xatv5kG92nimpb5P60z2S93KR3RYlAvisz1GWKFOg6YorffdFlFMDDOJ
 pp/XRTTmTQ1jHfu/tgDyNpMc0wg8iCiurHDY60lrPMVMu0BTYD7oO+BIZP/mWORRAYBa
 yKYa+i5BQVwpyqPFx2ihW0gtMLfuTNwSVN/XUtxaHT3xsoFO60hB1dnHH7sJ4bGBO2PY
 X41+jBiiHzyQsx1XITHYpYrLHA65bjv/X2UQqfBt0J4wkWATpMj38zKnDmeMI4HMWJq5
 o4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689098058; x=1691690058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=51D9c0yVqzyFZCZkTJ0kt3i/VPXv4eay4HZNWC1auNY=;
 b=O1QSOiHaVJr8ZP+hBsZ9FbgwcP7BhBIsMbjbHpVv8PjfjLJ/JcrN3LT/LGlg2svGDW
 CMh8SEplx+Vg9QBRzWmPGH9+7ayCbgabMibITniB69hHpjK7f2DqTA0Xur549/hO8uzO
 cprcqbWCmK3N7TwTJaJUPUR6tsGs9OZqHHlUqP2uCP27Rc/cUuSjk6PA9eDYIcHsi1jM
 /YR+YvJxRO3gG/ouiJOkCqnHzzyJp9IVtaxhBTAgASt4sF5q3BiCs58Ur5u+tgPu0oxm
 Me4HdSMGUOsRWg0YNgyKPzO+mUZ52BuS6HTsaHUe2JdTR3ginQ6H4VGokCTVGgCFMEeT
 kaKA==
X-Gm-Message-State: ABy/qLYc2MuAHvWtMM1aFrvjRUDT1wIngOlNWuy4z2zadr5vh4f0D8zI
 /fXLLjKqGP5u2+tP1QZBIvBYRuSpevM=
X-Google-Smtp-Source: APBJJlFiqtZa561h/NtpWyoYGEjlQjCnGiocVAnOqtntgECALUFn5OzNYw/w9eCMwwNevLA/drwf9A==
X-Received: by 2002:a17:902:e54a:b0:1b7:f99f:63c9 with SMTP id
 n10-20020a170902e54a00b001b7f99f63c9mr16862415plf.67.1689098058301; 
 Tue, 11 Jul 2023 10:54:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a170902820b00b001b8a85489a3sm2191062pln.262.2023.07.11.10.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 10:54:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: Fix snapshot BINDLESS_DATA size
Date: Tue, 11 Jul 2023 10:54:07 -0700
Message-ID: <20230711175409.157800-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The incorrect size was causing "CP | AHB bus error" when snapshotting
the GPU state on a6xx gen4 (a660 family).

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/26
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 790f55e24533..e788ed72eb0d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -206,7 +206,7 @@ static const struct a6xx_shader_block {
 	SHADER(A6XX_SP_LB_3_DATA, 0x800),
 	SHADER(A6XX_SP_LB_4_DATA, 0x800),
 	SHADER(A6XX_SP_LB_5_DATA, 0x200),
-	SHADER(A6XX_SP_CB_BINDLESS_DATA, 0x2000),
+	SHADER(A6XX_SP_CB_BINDLESS_DATA, 0x800),
 	SHADER(A6XX_SP_CB_LEGACY_DATA, 0x280),
 	SHADER(A6XX_SP_UAV_DATA, 0x80),
 	SHADER(A6XX_SP_INST_TAG, 0x80),
-- 
2.41.0

