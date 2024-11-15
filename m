Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B5A9CDEBC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 13:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E247210E0C3;
	Fri, 15 Nov 2024 12:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f8G/4qB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD0610E09D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 12:55:25 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37d3e8d923fso1256042f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 04:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731675324; x=1732280124; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CZze3yn24TXviwcT7N4kjvraoXCM6pscw+3oqLD8HvY=;
 b=f8G/4qB2pTD+2ddYquDelpnPMDKIYJqiU5adwm24dzNLSeIz90l7iRRKB/+sB4Qbdh
 cJUaY5ItTX7+IEP5SjU2SVNICaZ0Vu+1vtfRLso3E35TwjxEKl3cvGHKpdMB1JrEgqVv
 fHkItjFDg1SswOcvBiVjlnMcHFSLfxyFbXEM2VqGHihqWED6wEUEoSxu+HY5A1b/eT1c
 IM7g8jgPyQLMiHf2u+5XWpBJUAOxERNu/eYAJd94OknEmOxXIWTSvjqj56OP2phTfIoA
 PEPeqh19GdOdlocnBIN2j4azq/DmkeonIUGrlwLq25qqI9ts4DFXlfAT+a7Gepgb3tBI
 /qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731675324; x=1732280124;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CZze3yn24TXviwcT7N4kjvraoXCM6pscw+3oqLD8HvY=;
 b=Y2nrjgvb87qWFrTlqwS8prbCyXWk0jILLJEeo/3WSk7aivMKm7dEr7ZM506JcdeSWc
 y9VC0rJkgDTMqE0G8RZOCtW5vHqbI/DuL2D3dJmYvGgBcYYV/De5aOb+87JOgBUzyi/s
 itzg0uxptEnRl5kYvbC39p0AFPfvpmUlplrgnwclcyEjLItRcVQdNkwSjqRwst9uQU/7
 7nCmi0fBMVE4TuZTPDKxp/a6IBjyqayiVUJhphepLVzi+QW8/SMvGMeibdvzfspwNEAc
 C5vP37/9qbAed3CFiG9nJ6IOZXdq71BL+B0Q4FdurkY0QibtRp1dYNqYsQcrnueWRtgE
 JI+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE0VxvkoKyx9sjyuvsZ99cjyvgXTr/ZfhiVfP2U4maAytwpPjsq+JErzKZjc8RS2/pk11D87TVjnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8zeegxitB+dJuaR7nbiAEi4QrrVBU7ZYbEviS43UFHn2lU6hF
 X8tg2CEUFOQoeScDuWJS6Ybl5WL5Hph5JENbEF5ElwTQiQLa2nciDshKFFcMP4E=
X-Google-Smtp-Source: AGHT+IFCxeXdFwVvRfx+K9CW5GOw9LM/hVZhe41k/tOelfCV9iTkGBsMWti9JMRBfFAiS/C37CDtfA==
X-Received: by 2002:a05:6000:70e:b0:37d:492c:4f54 with SMTP id
 ffacd0b85a97d-3822590b9aemr1876457f8f.3.1731675324056; 
 Fri, 15 Nov 2024 04:55:24 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:f4fb:dc44:5c32:eaef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae31083sm4285582f8f.103.2024.11.15.04.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 04:55:23 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 15 Nov 2024 13:55:13 +0100
Subject: [PATCH] drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
X-B4-Tracking: v=1; b=H4sIALBEN2cC/x2MQQqAIBAAvyJ7bsGViuor0cF0q71YKIQg/j3pO
 AMzBRJH4QSLKhD5lSR3aECdAnfZcDKKbwxGm56IBszEkyat0T8GD8m4807Gjd5ZN0PLnshN/8t
 1q/UD7WkMTGIAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
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

The IRQ indexes for the intf_6 underrun/vsync interrupts are swapped.
DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16) is the actual underrun interrupt and
DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17) is the vsync interrupt.

This causes timeout errors when using the DP2 controller, e.g.
  [dpu error]enc37 frame done timeout
  *ERROR* irq timeout id=37, intf_mode=INTF_MODE_VIDEO intf=6 wb=-1, pp=2, intr=0
  *ERROR* wait disable failed: id:37 intf:6 ret:-110

Correct them to fix these errors and make DP2 work properly.

Cc: stable@vger.kernel.org
Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index a3e60ac70689..d61895bb396f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -389,8 +389,8 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
-		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
-		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,

---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241115-x1e80100-dp2-fix-beb12c6dcac9

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

