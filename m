Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC59866831
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEC210ED32;
	Mon, 26 Feb 2024 02:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AwyIwDpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD01610ED30
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:28:05 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so36631361fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708914483; x=1709519283; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2zrSUS1oI8t8ANu34PzPLXDrLfaANT7YZx3X0xgYm0k=;
 b=AwyIwDpOMYwDn1TdmbhSbclfiZbga6yqpnGsESsPk+AfIePOq4zruNY3hhhJdvPjVq
 x77lhlOwUDYwRYXJTQP2l59dG3vJb2Tl0jyXUYPjCS0/OMhXFacEAZDX3vH5LsAZ0SgU
 69EjpOKzSztvB3tCWSwqzKLOcxV38D40Qy8rw/a0ZKyNSoZRdW6Y/JYsrrDgQps+7g2q
 nzS/9PS9hWgt1fJGoaR0Gn5l624XCepi3TDuplhGJkjRLY0iFG2AhFJ0S99XiiGwiXca
 32JDAGBYgAGxqg5zxcP0gkjgWKnTIoxQanHB/pxPvNoSfgZmjYhbWMj27VfoojrVXqjR
 BAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708914483; x=1709519283;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2zrSUS1oI8t8ANu34PzPLXDrLfaANT7YZx3X0xgYm0k=;
 b=djGTqrA2YoVslUVL02JAcChbrgad/ZAn08fc8Mz+JoItC41Wt+t11h7QFTxLwRPzqY
 1lo+vRNn1UCyisR8PbQRIMFGW7QVa9TiDRdopL6XZpeMFOHoO7+tPAHBa+5TKOBnR78g
 UoPUuOqFTXJoCx/rBtuGsWZElNDugKmF4GuNORYDD5Q22CXtCNTIej+b/o5anoSNG6v9
 YJD87vyUjf/8OzNlxHNorqVQ3/S1Bng7ta5fVot+VStSyyGJqf+BlGbikhruNFs894rk
 bRiU9HXnvEKwk/lh46k/N0pJCQUNabfmA4wtWNTGSbS1lRIocD9LY2ZK6QUh0+Hfxt3E
 CfkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrQeqzoeGPXrkFOH/ag7RjJHultfsgQEoHcUMY9MXL7R5lHxrUWGRXass8HtbC7XgWFe5GOrXaf88KUjwv3DjxayQWK3/ugIBFhe9WUWgc
X-Gm-Message-State: AOJu0YyOUI5cJrP+Kuu+u6O94SOEFfznbcpLCeaFQaHdPoVsrx3vN6Wa
 OkC+2FqwUbkbPSc/aHZ+sRz2UPzxBIbVxsCj3OgmcXPBERN94oo+Gi8b2vw7tNU=
X-Google-Smtp-Source: AGHT+IFefIdbhKnjJWT9odB7e2g6A6Qc+KZ3uR9VQXjUuUyxkrMxksYwTJufk3CxDVrfoe1de/bzVQ==
X-Received: by 2002:a2e:8ec5:0:b0:2d2:3820:fb4f with SMTP id
 e5-20020a2e8ec5000000b002d23820fb4fmr2920818ljl.12.1708914483696; 
 Sun, 25 Feb 2024 18:28:03 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a2e8553000000b002d11ef66881sm713092ljj.91.2024.02.25.18.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:28:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:28:01 +0200
Subject: [PATCH v4 3/3] drm/msm/dpu: capture snapshot on the first
 commit_done timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-dpu-debug-timeout-v4-3-51eec83dde23@linaro.org>
References: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
In-Reply-To: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DcJkg8xY9yU1wn7LtAuvfIPSDQOSJ+nJ+ORj2FrKvhg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rt7/oaDYu8RNoPts+ZddbZcfsC6eypMzb3mR1w/7Pvs
 Ilev7RRJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmskaV/X9y3YNSk7+/8w1W
 3k3ge/RaK+Z1dUKrak9sw5z6AGvZsu/veVIYS0tnyPGsbQn9zFe81oF9y6/pC7fZWCwTXvHs6rM
 zk5jm23h+cVgTUdrp31ac26J6r51n0/sJd02dqiT+Jrbxz7yRo7nPJHO/1dar+kt+C9VtOzi7Mj
 qfOXd9opRLvIurnZTjktlim/Vapp2+uidq7uZb1fH3L2vwbgrq0X5YNrO1faLI3c5yw3u73vF2B
 HS5C/pJvS8xvFB9tuY5a8fz+D/fnXy07AOWeIrcq0vltRLXNzvNHz3BstBPz8j1r+FLh4bU+jvl
 SeGT7P/sl/ZdLuj6anHp6fO3QhWrhXZE+sbvmRBv6GEGAA==
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c99c7fd770f6..c45edcde7ebc 100644
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
 
@@ -2431,6 +2436,10 @@ int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_enc)
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

