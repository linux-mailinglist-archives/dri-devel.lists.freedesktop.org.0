Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF33862AA0
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 15:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A029610EE89;
	Sun, 25 Feb 2024 14:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pp8tfIK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BC710EE88
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 14:12:53 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-512e733a525so1901456e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708870372; x=1709475172; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W1EgeiS53bZU89cWnjtfqhJ0Xbfd+zvllvWyAXpOfzo=;
 b=pp8tfIK1URcNLFKlG1Qpd4dfEpt4bzbj+dULCenWyswjEYQkDj2ZmvCwOE1DDhwXRl
 wnQov4eLETiLFL5NncvBfdxWYeop2DkuopNQLtqcau5jjY3qnPdhlFGJQ8fAupUc1aRc
 6TaRsQSfWTC3+GAr0KBZQL+Gwp9aEfzF80AdjKDvsExeIJDZEaNIXyJ+ZxmPbVj8eEBd
 TFPoelts2xCrtbaLMx+7sZWzRg/gWQ18lG4nEVjVx0wwWVpQWs9QeAcTmaXvrteh8ig4
 uJJrGCJKRzvKeGn6vZJ4XIKILwGNeHFvDBGrZUqo0nIRRtFbhUE79colQjGNM8vrZ2zL
 mO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708870372; x=1709475172;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W1EgeiS53bZU89cWnjtfqhJ0Xbfd+zvllvWyAXpOfzo=;
 b=AZ+EHh2ITUESJswi4h5QFRuxyCyvO2aoOiDrXlxwpLJQa+G8Nfq+07tFC0LaUvi8v6
 Vr5/pkohwz2Vh/V7CGt6k5BSu5oe0m2AkkYozguoFY1VmWpKNS9ei+s3tygBnz9AT2SA
 6hsraIPzcouj+enGv38HRe6OLtEo5iSzKh7O49xZqyCSDlgWj+9idC1UvELF94Dp5Riu
 dX9BWt43smb2TOGGhKQWkfNxBo5GYe+Dm01lF8kBtBTcFrp39zAfdS/wyuNJ3wuzg/gm
 IxPOAnAYuouYuyRkpSdBJw2dHuugectDDbo64sGw36LCzbGNlFizhxgN+nfmLzsyb9kI
 GoEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV17kHrY2nNYGz7i/MlhnZ+qeRon6xWZDWZaWbRaviHaaaXjNn+eYkh4Hybw3H0djVl1raG4ZDwhvVuDPl/IxxGueZj5GqxZJFe6ln3v985
X-Gm-Message-State: AOJu0YxV8xCsdS0bO9Jcy/9yC/pbRnhvDXCqsWAvkPmJqdAIxIsMaZpA
 c7sO/+UL+f18ocsQEw64EfTF77aifLYuFRxCSynHl+72Vn04EXVKacyZYg7ixBU=
X-Google-Smtp-Source: AGHT+IGDF5gFZnVV/AVUsZV5OqBJcSJBuROwG/Zy/8wkdCAhfxPNJhhBt9WEw3y137XfIL3bJJFROA==
X-Received: by 2002:a05:6512:3087:b0:512:d7fb:8c8d with SMTP id
 z7-20020a056512308700b00512d7fb8c8dmr1562188lfd.23.1708870371781; 
 Sun, 25 Feb 2024 06:12:51 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 w13-20020ac254ad000000b00512e5bd2296sm522931lfk.217.2024.02.25.06.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 06:12:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 16:12:48 +0200
Subject: [PATCH v3 3/3] drm/msm/dpu: capture snapshot on the first
 commit_done timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-fd-dpu-debug-timeout-v3-3-252f2b21cdcc@linaro.org>
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
In-Reply-To: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kq1wMGjAFgykNjnALUOfiwVmAiWVNLEAtKXn23jQRrA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl20rfZatQwbsnIGDdcoW5gLJWbqK0DBCsltFny
 PS9SGAxgeOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdtK3wAKCRCLPIo+Aiko
 1UitB/wITuYU5p6dOOSUv1JzfYEmwL/GKKF0SC4IbGLssbPmSgUySdE9DqjlCPM6rj5vaVRx1Bk
 p+/ypYmnmyncdrYoAno3IJVFcBQWctCe5DyU6JvmrLk6gHLN8r+cKk7HyvhoFeH7F+WB1+S+NAt
 TpOAXWCqaCGaCqzPgN+J1h3J8xbsKPKUqymyjbnVtdrjfIfGsFqA79FJpUi4MFpCzEJMfiZod/J
 G2VBYphZ86mzY1WNA/wJlD6UN/LU9J9UEfCF0l+qulZoZ3SES+Tz369iyyFMAu2HjMlPBv76zGv
 mUzVOA9EOlu5Yn4BVYOLhdWQOd3W4KpdLHpA3kAbEB4eED82
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

In order to debug commit_done timeouts, capture the devcoredump state
when the first timeout occurs after the encoder has been enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 30f349c8a1e5..3cae07bf0b9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -126,6 +126,8 @@ enum dpu_enc_rc_states {
  * @base:		drm_encoder base class for registration with DRM
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
  * @enabled:		True if the encoder is active, protected by enc_lock
+ * @commit_done_timedout: True if there has been a timeout on commit after
+ *			enabling the encoder.
  * @num_phys_encs:	Actual number of physical encoders contained.
  * @phys_encs:		Container of physical encoders managed.
  * @cur_master:		Pointer to the current master in this mode. Optimization
@@ -172,6 +174,7 @@ struct dpu_encoder_virt {
 	spinlock_t enc_spinlock;
 
 	bool enabled;
+	bool commit_done_timedout;
 
 	unsigned int num_phys_encs;
 	struct dpu_encoder_phys *phys_encs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
@@ -1226,6 +1229,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	else if (disp_info->intf_type == INTF_DSI)
 		dpu_enc->wide_bus_en = msm_dsi_wide_bus_enabled(priv->dsi[index]);
 
+	dpu_enc->commit_done_timedout = false;
+
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
@@ -2436,6 +2441,10 @@ int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_enc)
 			DPU_ATRACE_BEGIN("wait_for_commit_done");
 			ret = phys->ops.wait_for_commit_done(phys);
 			DPU_ATRACE_END("wait_for_commit_done");
+			if (ret == -ETIMEDOUT && !dpu_enc->commit_done_timedout) {
+				dpu_enc->commit_done_timedout = true;
+				msm_disp_snapshot_state(drm_enc->dev);
+			}
 			if (ret)
 				return ret;
 		}

-- 
2.39.2

