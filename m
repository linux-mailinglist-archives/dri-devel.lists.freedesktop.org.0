Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF8CA755E5
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 12:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DAA10E224;
	Sat, 29 Mar 2025 11:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dyFzhWmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903810E21B;
 Sat, 29 Mar 2025 11:35:58 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so29396505e9.3; 
 Sat, 29 Mar 2025 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743248157; x=1743852957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
 b=dyFzhWmFtXCRlub2LuRmpdLC36rSDIFsu8GYkIudxvIISg+HJuow42pPVjbGdBNqP5
 JEgGlKCNUg90MsCvLUge9iKzDdmlBHzYBOWf9O0mxezqLaw4p6r0GmNN+jzGKv58csO4
 xRI0x8BkOq0w5yofQGkRB36wpYe7BTRa4+VOnvpLUVqRGrjFalk4ELy90ynMDfX1VIE5
 T+TeaHdq8Nfnek/NrvF9DBoK4746cN50ROJF7LI8pt0jyLdqNsJc5ZPal2lB6W6JJPcv
 t7nLj9u3c9sU6raDVzCWQHHRVczswW3DRSX5vNtwPKPsk+0yr1l+nEyiIarooa8nJM3U
 O/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743248157; x=1743852957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
 b=jEcPQrc6d5NE/2Mdk3EPwdhMr7yRM65uyxMn8QtPu6rHcF/xCIIW2Fh/4Nbekc54U8
 2TuTqcZHBkOrYXdZ/9DkwDr2uXK/7i9EAdXvwpJH4g5JP9O3ddzGtXE6egc6W35vIywy
 IPrT71Z8nst32a6Fzy9yhKNJnVFOVh/OvuzaZ4Yn5HRHj2iQpijtQnXLUR1eZsH7UIBq
 +YR1bVFHs1gjlhPDpNyi8NMGX11GRU78rbhAf7If8iSVL9YQjEQfm5u1wQbvrLAk1GT2
 822EvJsCXpIt/c2svZBqpfi6irwV7q/qlS2Gw/wnzhnpNJduPctx2iWzo7pLydsgr+M3
 N55g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHE/D7KKQYGjQBSFQj6XevefbJ4PGTwGaALmrHmsRVaxxtYI9gFcSeAxSzJxhFHoqFdIl6UZerdpA=@lists.freedesktop.org,
 AJvYcCXVijnuY5HDH00TQd/ptvy+IJMUhQIkXnT215obXDdZP4bNfzKtaNE9m9UU6Q4muC7V7BZ59OojJ9UF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmZjhtagWbftVLS8W/u5fO8PAPJhtY3VEWceXyJ0dloLyIQEqG
 ARgmdOBVib01zfe7+M24TxRqXb2f6zRhdxSGj8gmyLLKJXcTeqVI
X-Gm-Gg: ASbGncuBmCtsWAdX7xocbEuCGcP+E6BYwbMpuUeg7wohn1n+S92kdJoXxZR+XwfYn9g
 /ul3dmXzJccl1a2s+bggeG6bD+tdXv9ebvhIgfzN8tX2egMT8Z2ho+ZJ9yTPBwT1kgmm667d4mu
 Q0B2xmfhW9bZXuQoGDheSBLi3+Odtta89Mqj7SqexmP1JTtQJzKlxzXUZrn9yOBJE5csO7JpuX9
 h+kxm1YknTsR8Yi1KMl8RhAupqpy8M5v+OAkaTlQh6IUrf9VkrrcnngH51wqYR1dZqBXOlbluWQ
 h5QPyMsmykIPVJuf+xLu4MHiSsCI+oqziWH4Vx68qmMbdw==
X-Google-Smtp-Source: AGHT+IGzFDOv0az8Oo04Dh1HgtexqBpJ0sbaJycOwnYRGsKdBcmFIR0JBxHT3YADEewHZjwrHQSoFQ==
X-Received: by 2002:a05:600c:4e48:b0:43c:fb95:c752 with SMTP id
 5b1f17b1804b1-43db61e05abmr26723235e9.3.1743248155735; 
 Sat, 29 Mar 2025 04:35:55 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:c564:b82e:4883:713c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e834a5sm104631655e9.13.2025.03.29.04.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 04:35:55 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, lumag@kernel.org,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 RESEND] drm/msm/dpu: reorder pointer operations after
 sanity checks to avoid NULL deref
Date: Sat, 29 Mar 2025 11:35:38 +0000
Message-Id: <20250329113538.7935-1-qasdev00@gmail.com>
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

