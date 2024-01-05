Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2870825D3B
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 00:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A40610E6CB;
	Fri,  5 Jan 2024 23:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D69310E6CB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 23:50:14 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ccbf8cbf3aso666591fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 15:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704498613; x=1705103413; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zgIr5KjeQ801ktUcvEq9tOSFsZbUarwYEDM+BV8WLFA=;
 b=c6L4pEluiiIFVKFxhp2nMsKjKtq24qVzS84BJDJwhw5ihAruD+eQUeIi/j8bA6YGiE
 iiupiUbF9by8AraAmqNVu9XAqo2t0PvvkgURGSlcEo6AO3yb2c/lAAtUaMV7/yCWy7Bj
 j61R7yDkkRBowUfaZHJE1Lx3QQF7+NqGiVtYQwVU32CNwFMOtw2d3CWzOotC/1aJ4HiI
 2BHypvl/ux10G6TLnAU8+OZLIDm4WdTa8Uadc6cdJ3despFX3+nVA1dqnPVCQfEM+bqE
 FMLi5s3995bvP+doSOXaUZF1SfOjnKyE6um4oWiY9Nw6Qnw6opgSdBg3UmEfN/ZF71Yq
 DLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704498613; x=1705103413;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgIr5KjeQ801ktUcvEq9tOSFsZbUarwYEDM+BV8WLFA=;
 b=Mna2uugLjPpRCdCVVyeHpB8QxvTyYFCeFbTMP2RfqE1Jb4xTRO1pPIl+KdTEfGf65K
 vIBMLm0kHNrf6NsKqmpChPf82Mdlz6io4KzMRelfR5iWAn6siK2opkHzwKpfwICrXQi2
 XToeyaj9MppvbfVfF2q9ivDHj9H6+pLIQz4Hh9OQaLXrwCNgg/3af3rLapENSvnb3y/J
 3ltEiLEJmy0LTSIKpqkH6Qx1CHq/CSrMa25v51hJLV7MS+AfONYdh4LcfZ5HGYgMl2im
 TaJ6SXJziLf/yV7Ocgq41OWjK414F5nCbFlVAdWCYM2ba/S5o/emGecoOVY7G7U7mQJs
 7u+w==
X-Gm-Message-State: AOJu0Yz3M/npK//jBlw+CCFobvr77oqRMimPkqEV9JnZV/+gMlU3WWdY
 J0zlyN0WO5pakcz7pcNCx80IVw3nUDpdZA==
X-Google-Smtp-Source: AGHT+IEeBbWCgqwqpQYOR/iZ1DVjP4wiVNLe6VxZxGScfvx35vnY4HypTMhHt3kImH3vRzo4e9Vr8g==
X-Received: by 2002:a2e:9ed4:0:b0:2cc:675a:10ee with SMTP id
 h20-20020a2e9ed4000000b002cc675a10eemr50853ljk.78.1704498612830; 
 Fri, 05 Jan 2024 15:50:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x26-20020a2ea99a000000b002cceac0fdacsm465056ljq.126.2024.01.05.15.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:50:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 06 Jan 2024 01:50:11 +0200
Subject: [PATCH] drm/msm/dpu: make "vblank timeout" more useful
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org>
X-B4-Tracking: v=1; b=H4sIALKVmGUC/x3MSQqAMAxA0atI1gZSlTpcRVyoTWsWDrRWBPHuF
 pdv8f8Dgb1wgC57wPMlQfYtQeUZzMu4OUYxyVBQUZEijdagOSIanqLDU1be44ncqtrSNDekS0j
 p4dnK/W/74X0/OpMcKGYAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YlE6Y0Xns3P31n5Refq7dS9qQ/5BgtlDWj7ZX0gAmHE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlmJW0SyaFLLT16qHzBkNy9w9VfQQTtHjumXc8G
 ehTggFWw26JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZiVtAAKCRCLPIo+Aiko
 1Y/XCACauqkupaBDpfAh57h+imFyIUuQC+PVqXl/Xj6YmYMMfhgQSaWUbh+a7qObFJKzI/rc+Sm
 Tzqf9gSWXcgGZCbsHKj9K0f0eapMiGVOWCzYncRwOrSvDfZJ34Q5j42eRkpsFdl+iM0uFbOV9Mq
 6e2RRnhEhHBxMgge7rkFNXZhjhAjI4PL/wVtAB/3M82FFy125DUo0nmUb3RNfomh+UXLJCPS377
 ahwF4ewfR+2orJ0zHbYWIaxd+5d7dqF2sD4fbUdHMmq6P5z0BqGg8Cw4/ptyTstV3Zx9lMoPPCm
 mAEvZOMyhdjwZwssqGYGHpggNu8Nnn04tznaNUy+aAcQkWCp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have several reports of vblank timeout messages. However after some
debugging it was found that there might be different causes to that.
Include the actual CTL_FLUSH value into the timeout message. This allows
us to identify the DPU block that gets stuck.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d0f56c5c4cce..fb34067ab6af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -489,7 +489,7 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
 		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
 		msecs_to_jiffies(50));
 	if (ret <= 0) {
-		DPU_ERROR("vblank timeout\n");
+		DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
 		return -ETIMEDOUT;
 	}
 

---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

