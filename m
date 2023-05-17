Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE7706E98
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E4F10E45C;
	Wed, 17 May 2023 16:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2433A10E45A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 16:50:19 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac90178fdaso9903401fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684342217; x=1686934217;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=doFIHuCbi1YVLGjN4vxnw9b75i10GnebCx9q/QOL15k=;
 b=q84ua9/uG5SVyYtD81DuUZPTSxq5rhYzcSzZz6Qn6Ngk9gihmN3MjBpoHK9+tMergQ
 3XUqLY8nIz05QUbzpms6NXtlOrAQM7FwLZdCXGN5GZSepqzpPomm1wqOh67elqjS+KA2
 UKugEONlZsdGZoak6/XSNZRHALjPEc/nvk6h0VP7oU4ZtCCip48PrHB5hbgLA8A9qiH5
 kj4w5e0CM4UdCZH/IA8pIELaIkQ3BsXvPaF4Wx/99I5Qd/1k7gU+TGO7qodJUisEiUUG
 9+SFNiwrHY7QbhnASmhZ/NhUvDENzHLB/e85in5sbxC+auy8Fc6ObAac6eFbeoYYqTcn
 tD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684342217; x=1686934217;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=doFIHuCbi1YVLGjN4vxnw9b75i10GnebCx9q/QOL15k=;
 b=beK2tL/gLKmS7pxT8bA1G09N9zlIYhWXcbHr66FUqtPujjyYURSqXD2kp+5w+5oe+R
 bsEV+3sHBcfD10tS0DPohstQIWh+BcttIht3n9KFS6Q4r/ArbGbd3EFLrqRHWTmiF1A+
 AuTZEsAJlM2aleiM0W6g/Zg3m3TePEuMbZyyVziEaRIkAEKO8M6Uadf+ka8hnQ/LeaRX
 S25JVUOc3EbMWY99OFaM25mk8v6l3gn1MQL40+TgUkG+l/SshjJwaRRkEjkvqnMyTZDF
 iiVGzVV9i7vXqMAEtM+fyxZOSnB5mdnbmqpj9L0Fdeb6/wrjdxgJN6zeLOdRxASTwMuX
 pcRQ==
X-Gm-Message-State: AC+VfDytw8GAAcgs+50bQweNzP3OBUd2Jo1irUVit6dRPLwuJX4w/c8+
 MqH9nTCqexqo9cof0IxsT4Erhg==
X-Google-Smtp-Source: ACHHUZ7e1U1bUzU4tY8e7QVk7/FKiRfI0hj0BYVrry6UsUx67+Ea9YcPxgwDeXC34t5tE2dl04gMnA==
X-Received: by 2002:a2e:9e0f:0:b0:29c:3f18:57a7 with SMTP id
 e15-20020a2e9e0f000000b0029c3f1857a7mr9570078ljk.35.1684342217227; 
 Wed, 17 May 2023 09:50:17 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a2e9cc6000000b002af0e9abaf6sm159224ljj.131.2023.05.17.09.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 09:50:16 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 May 2023 18:50:09 +0200
Subject: [PATCH 2/6] drm/msm/a6xx: Skip empty protection ranges entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v1-2-7a964f2e99c2@linaro.org>
References: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684342212; l=1049;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3GlljK/1BVjiAo5f22OuFyyc96OvFEAFjCCjuTjlQ3o=;
 b=JDAk6fXSs/PfJosLcj5uyuRhiKpGLFyoGp8A7FuUirGZ0Z6GNIin23Zlc9OKACT9KDP3GHh55
 fa1FCvSNzO3CwCD12p1MakhpVpfc+wIbLCFNIwFpMakrwwqxNaXyaMm
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some specific SKUs leave certain protection range registers empty.
Allow for that behavior.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index deed42675fe2..8707e8b6ac7e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -778,8 +778,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	 */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3));
 
-	for (i = 0; i < count - 1; i++)
-		gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	for (i = 0; i < count - 1; i++) {
+		/* Intentionally skip writing to some registers */
+		if (regs[i])
+			gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	}
 	/* last CP_PROTECT to have "infinite" length on the last entry */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
 }

-- 
2.40.1

