Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A06437D35
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 21:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115B86EDA7;
	Fri, 22 Oct 2021 19:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59306E7DC;
 Fri, 22 Oct 2021 12:06:41 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y26so2630932lfa.11;
 Fri, 22 Oct 2021 05:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R84D4r5FDARD/g2x4xeRmi2uz90HxOZb8w5h12y7ut8=;
 b=B/HOvEO5kKCZyxZM+elLWHPy4zHRSzOIWXG6wYfi895M/WVqzNFbT53DYErRvwXujp
 XlUVYujetUVeWxeQmhj9eW+gj0pLadHZsoXAn7kaZ1GMO0SJL0sdl51UWsk3VZWR0TcP
 eNRmNpoUhZbzl65l8m/8GkpHoZ7u/dmwjSCOuHcWI3q1hDSb5t8K0uje/zxCa7/L0gHt
 TTm08hGuhKbDb4FpX1Z/gYoQcLbCyKQtpBuxv/YcONd8xFbDKAT117b9OQ/e25JlPYm8
 +ykIwo40NC9qvTke9oNzqkhoGOLMotRkkGcN3l0Rww/yYUdBMR+G9my+BT/wOgPOBVEk
 bflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R84D4r5FDARD/g2x4xeRmi2uz90HxOZb8w5h12y7ut8=;
 b=CjlQf+b/bREaGhmm55GXTgNLSEh29J91UA3PF6mcQH3ui4hWggtJY8fQ6um5tMZxrn
 Qua73ZeZ0vGCGJwVeyJc1YOzPUZ5wvvK+64jOghD6ixUaRsKxDjrqY6AE2D403BL+MwK
 Bf6c2XvQtZWtJ8wYBAg5V9B9+mGpa8/cKeOQtln+ukOPj6mLhZJgSTnhpgQpU/JNauwG
 MqZI/jGt1CV8ZI3XGSTQooENML13korU+WcPdTX0aVDTEimlIIL0AVU9QaOMKtaaQi9+
 U3zASF1iTN4L3DeszPWumFRfjcPllX4BotreAdkAK2vu5zviR84lAPW4nDH9vIBKx0Bu
 9duQ==
X-Gm-Message-State: AOAM532Idzqq6R6Y36lIDvasQ8Uldv/HyKrfUegQ9hknG6EbAc5K/JMp
 2nblVZalgM0owPHuXHFuJ1c=
X-Google-Smtp-Source: ABdhPJyzFpyP0COpqxNMoju9KRywPlL0uzmAAZt7vzpS1TRsvN+hRj8eVtTncT5Hjno9P3zXfcxRHw==
X-Received: by 2002:a05:6512:3393:: with SMTP id
 h19mr11367891lfg.363.1634904400116; 
 Fri, 22 Oct 2021 05:06:40 -0700 (PDT)
Received: from trashcan.lan (public-nat-10.vpngate.v4.open.ad.jp.
 [219.100.37.242])
 by smtp.gmail.com with ESMTPSA id bu21sm715299lfb.39.2021.10.22.05.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 05:06:39 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a5xx: Eliminate condition on setup of SMMU CP_PROTECT
Date: Fri, 22 Oct 2021 11:31:23 +0000
Message-Id: <20211022113128.102304-1-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Oct 2021 19:02:19 +0000
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

Only GPU that has larger SMMU region size (0x8000 dwords) is A530.
All other GPUs have 0x4000 SMMU region. However those GPUs work
correctly with larger range protected because there is no known
registers after SMMU region.
This patch needs to be backported to stable releases because A540 GPU
was forgotten to get its branch (that would set up protected region of
0x4000 dwords).

Fixes: b5f103ab98c7 ("drm/msm: gpu: Add A5XX target support")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5e2750eb3810..ecf6318a247f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -851,11 +851,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
 
-	if (adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
-	    adreno_is_a510(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
-	    adreno_is_a530(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
-			ADRENO_PROTECT_RW(0x10000, 0x8000));
+	/* SMMU */
+	gpu_write(gpu, REG_A5XX_CP_PROTECT(17), ADRENO_PROTECT_RW(0x10000, 0x8000));
 
 	gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_CNTL, 0);
 	/*
-- 
2.33.0

