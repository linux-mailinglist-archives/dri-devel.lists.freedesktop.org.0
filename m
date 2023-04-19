Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E829F6E8B33
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0548010EBB3;
	Thu, 20 Apr 2023 07:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5058910E9D6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 14:42:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o9-20020a05600c510900b003f17012276fso1571907wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 07:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915319; x=1684507319;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1yymjSGC3tlJ8CTIWQfRQnr7EzIyj4uwftqUzbfgU4Q=;
 b=D/0UzDxfvxPNll1SFt9ReNSOMw7GR5gMsFEgFViRFdc9JG/hhS+0jC//Bmf6e/rOsR
 OqU+p9AkOs01JMEIE04jvHzPkUAiuRfwXrrzgLQlEddqieON9xINvdv3+4G4GDnxjSFl
 JfB7Mw04qQgFpezNH7Iyyw2O90O5hiEWv3y/Elif3Nz3QrTLv55xCZmqVhdhr7nBt+4m
 tO1vR4tPEiv1yKOtnDPIEtIpzz7a47w4Ztt2NmtspD6PCmMoqdanfp3Zde89zGwM3iHB
 TWXJ10VW93Mc18JfkPv3wGo8KhZAgomBWdzrhUODN2q8ZfjhbFU+YAb3XwXdJ0F8H4Nt
 SDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915320; x=1684507320;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1yymjSGC3tlJ8CTIWQfRQnr7EzIyj4uwftqUzbfgU4Q=;
 b=dnB6GHZknUoPwURves8+AR+R8WO/BzHDe5YJ9ismOtiTMrgEmVJf1Rpjncgu5W1V88
 GUHF+OM28xLJgEa/IQ9M1vbErutSa+ZQ8TR2UMIa/NQyRfMUvuiKIR7o2rn/QeOvsoIR
 ZWm1DNL2KwbcXYWyjykuDkFTGltMnnP9lTSJWwBtinxStlD10ZtlveMIijyTsCyWe5kU
 sKYr1U8KDoiHuRX2EM7UXNKmEUXhaW8z74429FIKVLm9yJTgXWdBR9/Zz33MJ03V9htW
 i4JqqDezNOTK1FYW/iMae55BzHdZQM5oIkAcW4MicBGHF1XvuotXzRrr7ZYHi1BxgJbO
 SYbQ==
X-Gm-Message-State: AAQBX9dTHa7lWnDV4p4FGyky2wY0AnnSQuunZYq/mj+kv8rTcAEyz7AU
 FAtvh4LWrYjoBPIhOc74u9Tx
X-Google-Smtp-Source: AKy350ZA/JCUf9E/Lnl5b1IOhgk6vVOtDmd7tvW/kBoqV3l2kbmlmpjpCylw6CXGNsKCu4y1wTIRGA==
X-Received: by 2002:a7b:cb49:0:b0:3f0:8fb3:24ea with SMTP id
 v9-20020a7bcb49000000b003f08fb324eamr16592965wmj.9.1681915319834; 
 Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:15 +0200
Subject: [PATCH 08/11] drm/msm/dpu: fix cursor block register bit offset in
 msm8998 hw catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-8-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=1CThvjvUKSB2kgPiGI9aOtJO2XMAO12qU/LwO8wOVFQ=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2oUuxrZffTMgc2Prc/9Cgyh4CwUGixDoWFE
 tdJpMbmdG6JAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9qAAKCRBxA//ZuzQ0
 qx3ID/sFH9PfKFzjd9oKmQi89pqSx7jCVGBpbWTrAHuhnQ6bIjfELDfr1V6GQo7xl/ef0gMR/u9
 6v8qm4VGQHws43khIcFXvu+NrjE2uwVqhTGYZ2uItNg1fcnkqCKhvoDg/08SDI7ADvpD6ZmCi0j
 lHVJv9KFGa0AR4039iGE7R0NBQqcEei/HolSkxQxdZDjNbDF+Ls0lcMwcZsTufGLktpr5n/4fHL
 KFoeqUsi0p2CwfaC5ou4bFnwK3slgkrq9qeHqU+cef0CYqdJPWgPXKuMq57bvS54nm5u6c23mqc
 MLdkZ7pZ41nh9S/LMHbVg8NfvAQZaBPCFFbHrSrbFnvg9OPfU9st29P6aYmHEYneXaRgPEuWUq+
 ind4eFdmm4boScVYenSJJLMctBlN8MckIi/k3SjXanJY5tz/bCkL/pJLhyDhKjxs4PDxx3b4ECw
 VRWIPmuYaUHhruk9rGgEbysNG6ZuKw3pOBnACN3ZjNSQLMn/VPfPCnoSKjZX/fprenyL5l8vyjg
 +IofBepTPZW5y2P/SXLQQ4GWUXFM3eoW6+KC35RX/A7ene7ilr9YQiwKDKlYsj/QG9t5NxSgzNk
 1THb6wsKAFgBV0cISRJ8F39WFmhTpVvXJXu+AL6NDHRTbDBaV6+cI4h3dBnvO94eOs1bcmDBYRN
 nAKrWj89r9JRgig==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This matches the value for both fbdev and sde implementations in the
downstream msm-4.4 repository.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 7de393b0f91d7..5ae1d41e3fa92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -39,8 +39,8 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 12 },
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 15 },
-	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x3b0, .bit_off = 15 },
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 16 },
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x3b0, .bit_off = 16 },
 	},
 };
 

-- 
2.40.0

