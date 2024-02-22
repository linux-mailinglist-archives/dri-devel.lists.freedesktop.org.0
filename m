Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A485F75F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 12:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9DF10E35A;
	Thu, 22 Feb 2024 11:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wxj2mApI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C25F10E2A9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 11:43:20 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-512d8950e3dso1397262e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 03:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708602198; x=1709206998; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hYPkSB60pBwtBZ+SSGzv94FRelSuOYY2eb3nzYDmJZk=;
 b=wxj2mApIdY84oocUldLZv6etoYOdd8NDN1Dwr1gwCZtGpfo6Djkic3mlMQQGSgdpBu
 mBzyEovMHCIdn+8tijRY10OVmOUe624MUzcIfws7mOHP7FF6bjeYkKHzrsvGwM9frp/5
 EdFWmvYE8+UtGLOMdGq2UGG3D8yjUYoISm9FFkHnLis7mk1X2ccdMrUnURS+3IlAhf3E
 VqB1psvsHyvKDVxfjM02bOJasNsWKr3WL7I/fUO0r1kgn1HAkGfKbszWk90XUrNNLDdT
 nYUykRzh8z71Ey4u+cXilFqxTUv8qdlirUPxHXLHShji6E3LkzAT3p1HNXYDAFtH3Kvb
 1Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708602198; x=1709206998;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYPkSB60pBwtBZ+SSGzv94FRelSuOYY2eb3nzYDmJZk=;
 b=aHweZ3pDY0eCbzam9Bria/ncru2VSZcTXYjpUwn3FtQ/chaSf/Hz5HQrE3ijGgZkUr
 lbE1LJW/pl41ZZbJdPGldjj3rT5Wxmm2qvMDK9frReT16/6Iu46ViYZ/9wlglGtt/6V/
 hSkfOc7Uv0IYL2kzeKSrkHppTS/Rnr/j9gce24q5ysbPsh2opv0X1hyuvzuPUvrpuH9c
 /yMfstJ3nOeBEVMBJEDKcg2roAhXEj90u6ZhiTLm197PLlbtm38WjDojY8ZdfRGc83Fh
 kRjKMoWpjtMYkWjauNUMdoacebqFrnvT/6ZD4qlTA857QBf9il4GbK4A48E91mYBpqL2
 yBfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxDyJ6r8l9RuiehVhsMiocoDL/Q6wQh9rN9s3AWUu+1kpsD78xpMgMSNjIajF0de/LBIECcDblc2ujR5TKqR75KmVbhAtj+592eqKvrSqR
X-Gm-Message-State: AOJu0YzHxbmA9/NTf8HHOSLi/0gE90me+MsuA4Ag65MTmJiTIRp1APLf
 1ZV28pjylV5RnMZjXtZgefiv9TFnNj0CRXosTjGXmP/ihgxxUS4CRU2J26Rql8w=
X-Google-Smtp-Source: AGHT+IGpucXGAiEbDtm7N61Be8iq6upzySqobSaK9Ma9ZnCygy45E+cnYOI4Dt3ONEMB/PA63I9Y9A==
X-Received: by 2002:a05:6512:1023:b0:512:e137:5f5c with SMTP id
 r3-20020a056512102300b00512e1375f5cmr385270lfr.34.1708602197961; 
 Thu, 22 Feb 2024 03:43:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 h24-20020a19ca58000000b00512d495ef0bsm596857lfj.113.2024.02.22.03.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 03:43:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 13:43:17 +0200
Subject: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFQz12UC/x2MuwqAMAwAf0UyG2jjC/wVcag20SwqLYoi/XeLy
 8ENdy9EDsoR+uKFwJdG3bcstixgXt22MKrPDmSoNkSE4tEfJz6XbTOoxnYS25AX10kFOTsCi97
 /chhT+gBqOi6ZYgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2623;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/xAIOI0l3dOikmLlNmwn5S6CqFH5sP++nL7ytb94Y1o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl1zNVL3NFur7GrLWkn3Ro1lU4Hj5863qqgmmdr
 6lq1hjhGp+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdczVQAKCRCLPIo+Aiko
 1RdHB/0TkzNYPTo596AbO+BpnR00wJNPQ4vLArU56Pz+y+reGLuC3iBDcNIQboww6FMm/yrfd7H
 jlA5Fsd76hyTi+gWwm6gE+21WLEmWXVnDlbXHPRvfR2DlqBczYqSf0SO7OpbWAMoF87hYTuUC3n
 cdHS95WBOUAlXMH4ZCXmFwS0gc5zwR2hCAJqUzTKuETQ6/LixCNzKQM4negckMTpZj467MxX4go
 rgAv9VNO9gxMg10vb4LiqXODTsF2PxvFpA19RGnILRLPf9mVwW3gYRcsvcZluhsJAvC9L4FGrNY
 b6FPZBcCUjoxSASo1+8PSrGO+2CS21SSKe0r75UOhD4LnDoE
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

The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
Extend it to also support 4:2:2 and 4:4:4 plat formats.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
the clock inefficiency factor from 105 to 117. I'm not sure that it is a
correct way to handle it, so I'm sending this as an RFC. If we agree
that bumping the .clk_inefficiency_factor is a correct way, I'll send
v2, including catalog changes.

I had no such issues for the YV16/YU16 formats.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index e366ab134249..1b763cd95e5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -475,6 +475,30 @@ static const struct dpu_format dpu_format_map[] = {
 		C1_B_Cb, C2_R_Cr, C0_G_Y,
 		false, DPU_CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
 		DPU_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YUV422,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C2_R_Cr, C1_B_Cb, C0_G_Y,
+		false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
+		DPU_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YVU422,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C1_B_Cb, C2_R_Cr, C0_G_Y,
+		false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
+		DPU_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YUV444,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C2_R_Cr, C1_B_Cb, C0_G_Y,
+		false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
+		DPU_FETCH_LINEAR, 3),
+
+	PLANAR_YUV_FMT(YVU444,
+		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
+		C1_B_Cb, C2_R_Cr, C0_G_Y,
+		false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
+		DPU_FETCH_LINEAR, 3),
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ccbee0f40ad7..949c86a44ec7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -195,6 +195,10 @@ static const uint32_t plane_formats_yuv[] = {
 	DRM_FORMAT_YVYU,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU444,
 };
 
 static const u32 rotation_v2_formats[] = {

---
base-commit: ffa0c87f172bf7a0132aa960db412f8d63b2f533
change-id: 20240222-fd-dpu-yv16-yv24-6bf152dfa7f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

