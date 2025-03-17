Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02114A648B2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 11:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F334710E3DB;
	Mon, 17 Mar 2025 10:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eskDXS37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A5010E0C4;
 Mon, 17 Mar 2025 10:04:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso11687295e9.0; 
 Mon, 17 Mar 2025 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742205863; x=1742810663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
 b=eskDXS37qLwyzIgo92GjB8+bpSd1U/DyncimTwQYYUA6vydVOC6qxV60z4SAw6bpYN
 HKHb9uCXNwk3XNWa0btFzxHzne06S4OG1c5uS1wMf1Rherj7LFddq6GuY3qkZEfiWV6N
 QbhAvJFXOy3Cmfrpb2+CcORHS3f3VLtqOJC7skkOnkVlo4UgiiR2WslhcZexPL2a+BXE
 nSFQ9hNQ92kUHILbcf5xXZleOqbt7Leb4zVPlJrY44f+qY1YHGbLja0/h14ltDDgQLYF
 htXHMHziKqWBcgzM5elOvqC3LuQT7ix2oJoCdAVvvIxKce/2FzWBaodbcXLmLWurEB8t
 qLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742205863; x=1742810663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
 b=vY2Tof/C0KuefkDoSWxW/nix+I5/RUn7Flig0WmVlSApZkjkZLlWeAOvrkinjgcpjF
 ICTvPDml3pStrVDwZCt17PLRQyEq9kJnhLijxYjNH/b+iLg+8Lv2+G3TzVLjBAlElDYM
 S0KjElkP2FXtAGk9Hmb+/MqTiGUyXioFBp9ljJckgnNNhAZ03vXouoLfFIY9tX+ypJsl
 yaFiANQlAotIjJZCcNWWtn54U/vdXOljGMR3nwdNSUCalcsnE4KhBmHvdR4rgP+j3ML9
 gCisx1JKLCYwFAsYtawEu1EQ2oWXZQRbYqz6sHLJqD3AbL11ZHCdXf0hRzhha05yL9oX
 SSaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUToV0Xn9M/UDvbiHrUF9SDQT6SO5H5KR7toQfCB5zq1rmDAI05AXPMr0eksJ1/n4e/Vmo89tLA52M=@lists.freedesktop.org,
 AJvYcCUtwavW1HNOwOQrxvLxlvlsJWOCv7BnCftyivy55Mx2IzMy5US68iwOl38R4/Jj5+Quboic8GXmN4Kr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5GJ5ZKpLBaY9owfuxbH1hiJF/q4G+HDHb9d5KpqiuHuDdHKOY
 Emkky6+5YoMTT/arD4CkBnWZBaYQp5D/EkEG1nQeYQVkGXQsEIg5
X-Gm-Gg: ASbGncsLPA62Ap/m8zuMn7rVMDF6YHJ9Uwo/lg5awFnrCTctJtfDtaOu3ACPilf21Qb
 AAoI1ew1pzifKA1y9KC7L4uSCF1M/gQDx7Lmza10aWTnHh+dnNd3pHNg/EXH1BbSEo9tEL5TVzX
 MnA6QetpUiddYWwWkCiKok/zHQ+mlWebkNlFTmRI4h23wR9XzosZ78VoBXFw51KPVMmY82Qty0T
 K00tsquRk8wQJPvs5Jmr83srw4mp4kDoY9NQK8FfAKT1AeBMWsIYpL4SS285/o1IOSintS2AOLz
 NNEp0Ic6t3eEvsYTeF1gROLXFnzXlSyjbXyuycW+oSHzljpjGEmyohw=
X-Google-Smtp-Source: AGHT+IFfGeQEz1fH8E9WgZ9LTqktpbJrFeivyHsKULyD8zVFvwU6tCzK0tU0jMqV23CaR1wP57QAPw==
X-Received: by 2002:a05:600c:3c9e:b0:439:9737:675b with SMTP id
 5b1f17b1804b1-43d1f1f3fccmr125031635e9.7.1742205863188; 
 Mon, 17 Mar 2025 03:04:23 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:12f:b743:681a:75c6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb62c1sm100391105e9.4.2025.03.17.03.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 03:04:22 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] drm/msm/dpu: reorder pointer operations after
 sanity checks to avoid NULL deref 
Date: Mon, 17 Mar 2025 10:03:55 +0000
Message-Id: <20250317100355.14789-1-qasdev00@gmail.com>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

