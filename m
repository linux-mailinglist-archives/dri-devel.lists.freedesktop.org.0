Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D5A582D8
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 10:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A2410E073;
	Sun,  9 Mar 2025 09:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lItLYkVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84B310E073;
 Sun,  9 Mar 2025 09:55:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43bcc85ba13so25706335e9.0; 
 Sun, 09 Mar 2025 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741514129; x=1742118929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8ZpuHav96lrk832Cicku4PQcIvGBzmRkHChNSbUFJB4=;
 b=lItLYkVV9GrR+byIKL7kJ4VRr2oBnTfVhptgAT+f92G/J3D8w5Oore6pAABWJymnTz
 byvxRPSxYzMP6mgKlyc9JLexh8s7fD8R+pvnfJlu8LGv2jcdpVU6dZiMsD0GobjaygVA
 kMOH2s83ul8u3gND38RdEkcjbcjefjko0EvB/XMYD7s5g9j0byKa9R/pXxRHuQW3nwE1
 T48sJUYkHPMW9f1aX1xVc+naDEix164wuTmuVfmVKm2XyY2722awG3fBkK7ozRXmkioJ
 YIqCeMnFKb4kYN9iwdpL6QhdT7LsOSN8iKj5HTXxjm6Rdrc0bCxD3LifwQaV4NQDfuJg
 LXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741514129; x=1742118929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ZpuHav96lrk832Cicku4PQcIvGBzmRkHChNSbUFJB4=;
 b=T0dfDePC+CXaF/yp27oz28/spNuUsO5G4uZY0N8kdyG2b5VbVKsewk9QqB405HIU9Z
 U5eCLqOjpDaAi8V0nSWZLwLgxOKXLMhqFap3YUtRRrUAZLk8X15swmBl1ptXEJYsvu56
 tuQ7k6/fAAL+6Pga2QYc7Ke0m38oBQyXEcJi0/0Mn4pIM4omMCGo6lexlXbIyew0na3a
 vQToBh90WFm5Y13dNSRgTjO5WF/OPSPs4TPiCDNpJEBZtLd9pfnvVkjn9eftLsp0XBRe
 Ka9+rgdpbhcC9ADLUwHDaIbOLUZ77olpFbkOjen9p940g7TkXbThuzVjR8KxRBhxNMl0
 Y51g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfk1pAQlqoo98c6F4M+/q83geT4BLT0/dgBpVyaquY8nIDV1YkfBDUR3mjmFMVbBLDcqH0BSRBbS0=@lists.freedesktop.org,
 AJvYcCXzEJsXHDAAY16tnPBzEnxpRCF5KaYrk/hOZ1rXuTCxbndjw3r8EW/XTe2PhYkj1j0groD4E2mLC35s@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy+wuEqPpRMhas6k67qyMM6zBr89rB/djGz56rCgHTm/0CJd6P
 BoJ815y46qHdI+PvpwF4j+z9mrFE8uqreIZf1pDaGVJ06clVzj1k
X-Gm-Gg: ASbGncuHhi6yXkB15ou+QbXX9I2WgnpoJpR4Seo8YKvBJmNEMb3FalfN4MtG1vtcFEp
 1KfM/tKUVdfRE2xOlEPCMPMJ4SIW3rdsRIyLkvEzwpi7iDyeUH4iKXwEb0LIS6Okzxs2P82Qmcv
 3YVwzCIBGR41CX7A6TrQfem2D3NX3OMEgossRNN1M3qZ66mQQxi2j0kEIn4QjZCU2Y9+unZDCvt
 Ic38H5vYLwyRtBdPBI/wpS12v5m9bCbUnMOdaFG3F+JmaurdFg40erD6BWmVjzRk10CJC3ZXnvA
 gEJextYr39eI0qrB5C9PT3wVYSOWwSUtkXpuYa7CfHE9Cg==
X-Google-Smtp-Source: AGHT+IHfI/VJZftDRqHYeb3Xwib26RWuigXJPjvLBRgin8Bg+mZushMIzjAxfzKYiLNvU6b4hTnErA==
X-Received: by 2002:a5d:6d8a:0:b0:391:12a5:3cb3 with SMTP id
 ffacd0b85a97d-39132d2af8bmr6599086f8f.3.1741514129156; 
 Sun, 09 Mar 2025 01:55:29 -0800 (PST)
Received: from qasdev.Home ([2a02:c7c:6696:8300:8afb:1194:b90e:9410])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e2bb7sm11567926f8f.63.2025.03.09.01.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 01:55:27 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dpu: reorder pointer operations after sanity
 checks to avoid NULL deref 
Date: Sun,  9 Mar 2025 09:55:25 +0000
Message-Id: <20250309095525.7738-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
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

_dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys"
before the sanity checks which can lead to a NULL pointer dereference if
phys is NULL.
 
Fix this by reordering the dereference after the sanity checks.
 
Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v2:
- Moved Signed-off tag below Fixes tag
- Moved dpu_enc declaration to the top and initialisation below sanity checks

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056..0bd1f2bfaaff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1667,7 +1667,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+	struct dpu_encoder_virt *dpu_enc;
 
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
@@ -1678,6 +1678,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		DPU_ERROR("invalid pingpong hw\n");
 		return;
 	}
+
+	dpu_enc = to_dpu_encoder_virt(phys->parent);
 
 	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
 	    dpu_enc->cwb_mask) {
-- 
2.39.5

