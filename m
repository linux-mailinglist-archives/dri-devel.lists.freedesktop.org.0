Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC869790FD1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC0310E26C;
	Mon,  4 Sep 2023 02:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2091510E279
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 02:04:59 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so13594571fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 19:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793097; x=1694397897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJKUNdikO94CMyRH4pyQDb+K5Uh7omm4HrkDcf2ckFg=;
 b=I5RDFSWPGF2vNoiPKovOODduikNzQ5G2iZlvWIqwowXE4m45VWnxnxytF0gonoOGME
 AKpMRRCySJ5bra13nKHLVItgBLwxFeercIMJSlc6ers23zsHZXc63hrbStunXOiQlIJZ
 4Cg2cfM4UtfWKvmBsP/Ckq92LTpZAdrkUkvuI90o+8bJxFcjYJYIzrZu8ypgGgGIcIGb
 5XltIsuifDRJYcicScSV/sDbQxHvmTHd7H4CSNPuTnLOT4Lqo3Tm5IoVL+0fqMEU5+3S
 GkHyr36/0yAPeuS8Cq2qI0iLKmV3Wz+SzILNNcxU0qKDY7XxY7G510CqADiu2Kw95+Eu
 8fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793097; x=1694397897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJKUNdikO94CMyRH4pyQDb+K5Uh7omm4HrkDcf2ckFg=;
 b=KcW2JGuj8x+ODPybsL27PqD1iJzuC6fLjku7oXaKU3clD1OOpTnf0fkYG/flR46a06
 hd99F4vclv/wrVq7KXDnFt1DmbS7D2vTw6BCpkZHL99plW5IUQt8xmkCIASASq92sWph
 2/6x0KB6lr0JNoQnnpWIr30Q+BoFe9K/Iu8XDPPUhrjK2BFbwYqhrRNDZG5ytOHsRAyp
 Q8QX86p6Qcs29jgkU4ZQUFn4+ePcpo8XgrxrKQTXCiiVywWbZVKprxW4uPpN5ZKNxWnt
 xFLOn+hNqOXkPCGu3FTe1ejgzvWVcRX3W5lOts1eZgsoXxnovmw3M878jxIOikYBaPTl
 7AQg==
X-Gm-Message-State: AOJu0Yz8KBzBA3ICkwaStd/BtDDY43g5IwufUsF1PZGS2wsMos33XWPV
 III5k5wjzDP7zgvyTxj5fUcACw==
X-Google-Smtp-Source: AGHT+IH+ZeEKNM9GR8BkN9YjjINxrtEHHZvvBz+TecZ/euGggBDNfy2hV3F+bhtP9xeeI5LZP8ZtzA==
X-Received: by 2002:a2e:8053:0:b0:2bc:c3ad:f418 with SMTP id
 p19-20020a2e8053000000b002bcc3adf418mr6221192ljg.20.1693793097407; 
 Sun, 03 Sep 2023 19:04:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 3/8] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
Date: Mon,  4 Sep 2023 05:04:49 +0300
Message-Id: <20230904020454.2945667-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPU_PINGPONG_TE flag became unused, we can drop it now.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 713dfc079718..d89bdd0dd27a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -79,7 +79,7 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 6c9634209e9f..9aac937285b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -119,7 +119,6 @@ enum {
 
 /**
  * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE         Tear check block
  * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
@@ -128,8 +127,7 @@ enum {
  * @DPU_PINGPONG_MAX
  */
 enum {
-	DPU_PINGPONG_TE = 0x1,
-	DPU_PINGPONG_TE2,
+	DPU_PINGPONG_TE2 = 0x1,
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-- 
2.39.2

