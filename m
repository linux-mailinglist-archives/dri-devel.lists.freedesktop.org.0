Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F192BBB9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC1D10E559;
	Tue,  9 Jul 2024 13:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oELmUd66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87210E559
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:48:29 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52eafa1717bso2481345e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720532908; x=1721137708; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E3rqoSXZHGMGmxvjGDiiPCjvj8LcgIFTaqvOfNwnFjg=;
 b=oELmUd66PK5xSM23Hntfrl7bg7D6lqgpaIIA1c4bZKSpvHPcNNdDmsTQYZjRPEdNxB
 e/HM4TmU1+TF7zQOm9keZ/at0HUdcUhT9g3v5JeYEZG+pNstSPBiljcaw+CZg2RWlyZn
 jh3hcmoRIPKVnAienoiLll/EFXN2Wwmql0w7NiLq8rLdKHBI+f8vSZXz/HYnHqfwh7Do
 x/iUruEeqfD/YZmb6CU4gQIgM4RqGi3wthDMdBfIk35EuCl21+Vk3byF1HPa600qD3bW
 WRzWytTkG9tgXu56GxgrgRXkFhleLqAjO/jE5svTtc+fX/yYkyZLJm4zbzBsohiZvZZt
 hNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532908; x=1721137708;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3rqoSXZHGMGmxvjGDiiPCjvj8LcgIFTaqvOfNwnFjg=;
 b=guvZbz7yFjYtoIuBJA4DXkZb5W777JHYdCKVbJv+Ct4eDgsODQ6xq4R284vopQQOJk
 TsfF5OLISQBxrGSi9Js1wtU6xT0dQ24tG39+eQ5+MuuMvlqd0Z//aTHexrXK1JYHaFdn
 zVZo3dCRUa3SRLQ1IZbL8lbBl/7pXraWYFJWMrv7CfCbk4C2+cB6XYCAIAqUlEM/C7aM
 zyeTv50h4cl1/8vCtBC0UsC1rlhejfjDmGwvy6RTH4acD57KJPrGfTE/XN5OjzYWDoyk
 141Qwfw+XIjchQnPUizJaB9UgTuQrr2Bxrv16yIOCewrPNgSFWCFYvP+Mbf94JEQB6n7
 kHNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHm9sBko/T2uv5v4vNVM/bt9M7zj6wgxqgbPn0kZoQggnbTGE3rJWV82K84IA48faN7QBUhbWXW36g6ne8MVrmSeJ9OBdm+HGHtNYIpr0/
X-Gm-Message-State: AOJu0Yw+EC6qzyg2WXapbGrQRPKnzcFNX6NExoxm7kQ8phyGT0KGZHw9
 X+OJSCRJ98cOqLAFBJ2xoV1wrV9jw7sCYugkjDQgKexnZo73ECW67otZlwUq/0c=
X-Google-Smtp-Source: AGHT+IEJOKC9CKr3gPG/ltR1Yag3QnJkvqhSLl98qea8/8qeL+x+wytN3L9Buqxyh3K51KaCWlt2Iw==
X-Received: by 2002:a05:6512:ea5:b0:52c:dbe6:f5f9 with SMTP id
 2adb3069b0e04-52eb9990e79mr1811035e87.12.1720532907990; 
 Tue, 09 Jul 2024 06:48:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eb8e4959csm250297e87.82.2024.07.09.06.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:48:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Jul 2024 16:48:22 +0300
Subject: [PATCH 1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dpu-fix-wb-v1-1-448348bfd4cb@linaro.org>
References: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
In-Reply-To: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Archit Taneja <architt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org, 
 Leonard Lausen <leonard@lausen.nl>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+E5EN258CmnPr6iL8KBqJO5+7w/22exHf4+Ix8HRjHU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmjT+ot0Pj4iBt23/EIWWepNxdc5knallwOTMKB
 koOGNPvKYCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZo0/qAAKCRCLPIo+Aiko
 1QKrCACjWqffsbS74ss5192ue6vxtSpLZimoCu02BjWnVbJm7yBYjEdISlCFKotHf0tVu/dW71C
 WhQy92Bej8KFlfXpBgnE/GvMqMDyQN7azFM/rcRWqJl/nKSbia/Fw5sKXHmNAQonGSBXEZWF0WP
 V7HsgrG016SbytVD0wPJiZaY/HfWxWsn8qZgpS1m4PRrNnPt0cM6JOF9WLaZLs27utpEm6yDD8X
 uPv2DI1F+EcsA+UQPo3hBTZnJv+GnghVf2SQqatQT64R/lPa+S+Uza7IbvvYpQcrrdf/rHB4dR7
 IJcfpheofCTjzvSWLvpf7s2AX5bmdzxZG2fv60b6kEFW0n+m
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

In order to prevent any errors on connector being disabled, move the
state->crtc check upfront. This should fix the issues during suspend
when the writeback connector gets forcebly disabled.

Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
Cc: stable@vger.kernel.org
Reported-by: Leonard Lausen <leonard@lausen.nl>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 16f144cbc0c9..5c172bcf3419 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -39,6 +39,13 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 
 	DPU_DEBUG("[atomic_check:%d]\n", connector->base.id);
 
+	crtc = conn_state->crtc;
+	if (!crtc)
+		return 0;
+
+	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
+		return 0;
+
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
 		return -EINVAL;
@@ -47,13 +54,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 		return -EINVAL;
 	}
 
-	crtc = conn_state->crtc;
-	if (!crtc)
-		return 0;
-
-	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
-		return 0;
-
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);

-- 
2.39.2

