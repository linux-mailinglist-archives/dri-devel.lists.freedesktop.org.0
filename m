Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6496CD36
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 05:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9A10E659;
	Thu,  5 Sep 2024 03:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OvXa5SqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CBF10E627
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 03:26:18 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53436e04447so224830e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 20:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725506777; x=1726111577; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YU8j84JZB809IcncSQWLx7Izd+21A+I9iJZxkqhYAfM=;
 b=OvXa5SqPh0mWJXgB/oRzztT+5xIIUnrTpt5qytAnur68mkozXrA8emxs0rsN3Hb137
 kPWgBSV7a6NUzVD7dbZgkj2XMxoLnN849hvhLOViv2GTSJPsSM3kLWDKaZ75Pu5xo5WU
 aaiSbFS/N2cfjGrTanH8XPHgSJV1Zy2GzejMOvQqkY+lwAnHHGJEsqEiEAw09lTQ1eXO
 4rzHZd77TjQDp+ocquFztLWBuuqCmbx0/WodU6GF4NLIFhPQHtaW899aT1RZzsj2KVg5
 IE9W9VUKWIAJG87n4q3Sba+vg5sx8MtmZdPXQhN8ICTCd5ATdQ+FZSyK6frc3NuGzrwE
 yYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725506777; x=1726111577;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YU8j84JZB809IcncSQWLx7Izd+21A+I9iJZxkqhYAfM=;
 b=Vn9Ln/POwow2aNm1ya/KmA2gLkNuwyaS1/M0PcGtdbDvPdc7SK6Hks9Lnu0A+hKMra
 bkjLzDWFq/06/7RXGgt297CpgjnHLp69TCz+/vhro7lthP5khkieCKFy2MSei2ebUAdA
 Xbx/YkyqdJaO15Q28vAlIgNI+6sUw2wCs5D+e1pnRBaMWmJXFUTZ72B3/6R1ruL9y0Az
 bFVqx+6lDVCGrtdjVD0SarWXkF0DybHCxipu8ZUNq5AhHZ/mhhX8X9ZCjj/QCAH8aBp4
 ICALR8pUzm5lctK0W1CBXByGzuD/y3B4fOmPKys2RvirXSVL0aiZTlA0ZYdGHAHqG92b
 cNZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkYkfZOv7fv+QLmfV2nyiuKf+voidtGJnSGvNsP0/yd0tPBXr/HBZVzJdQWjtARRdrLhz4DZPGALg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztmefXb6YvUsxf5GcpmLV7rLEflZdj5gwmVRlOYVm+Vgsbl8ZK
 gnQUDX+R6QRVDDV4CQzVVUDa23MNkhbE2zVF7TGyJ+xhkOqtxDtq1/i3hMwMRAV32FtYBJnWsyo
 O
X-Google-Smtp-Source: AGHT+IGsEWNXC2f1c3D0I+zxRSTqAMuxXvpOEo91BcFHWNG5/aUwRnJA/fWQmf3Mdhco8AyTjrh9zw==
X-Received: by 2002:a05:6512:1188:b0:52f:441:bdd6 with SMTP id
 2adb3069b0e04-535674e7e79mr1533655e87.0.1725506776531; 
 Wed, 04 Sep 2024 20:26:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540841a3csm2533860e87.226.2024.09.04.20.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:26:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 05 Sep 2024 06:26:13 +0300
Subject: [PATCH 1/3] drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-dpu-fix-sdm845-catalog-v1-1-3363d03998bd@linaro.org>
References: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
In-Reply-To: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Archit Taneja <architt@codeaurora.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=F9C+Oqk1Y88LBjszt+kJ0vjfDky4vE/BJ9fNTH+vsZM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2STW6BXa+LG+21cLphfZoxD9U8XBc0s/zxIHx
 DMxe6ZCcLCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkk1gAKCRCLPIo+Aiko
 1WD1B/sERkzjfa0PtufXwoDP1wA9cOwPVuN3B1cfX80GzU4cgDDJM7bYvRJFk3bQDDYrHfaIBjz
 37smnHdSIuQU4E5JKPFz93dYiXqozXYeuCBa+0TnYxGB55Hqn1WS21h/PLZWY2rLgHL0tHGcsCn
 WZtBoxTh+TbXooB/CaGb5rbFCBF0hLSIzzCS4NzuMzrTk1uads2oo+87hHNZYpFGs7JkuYS4G8e
 JCnuei9zRkTecd8AlcWT16hbXa7vFjJM+DprcEaAxSc1hSq2hZ5+t1vIoiqX2zlDVXwojGKiCV5
 evZcaBtnsmpygJT8XRK2J1ImcrI81Pejvwl68qeMJ4jZHq4i
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the SDM845 platform the DSPP_3 is used by the LM_5. Correct
corresponding entries in the sdm845_lm array.

Fixes: c72375172194 ("drm/msm/dpu/catalog: define DSPP blocks found on sdm845")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 7a23389a5732..59eeea3dd2e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -161,7 +161,6 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 		.features = MIXER_SDM845_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_NONE,
-		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x0, .len = 0x320,
@@ -175,6 +174,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	},
 };
 

-- 
2.39.2

