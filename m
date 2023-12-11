Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023180D52C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 19:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AA410E4D0;
	Mon, 11 Dec 2023 18:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24A10E130;
 Mon, 11 Dec 2023 18:20:06 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d04c097e34so37200065ad.0; 
 Mon, 11 Dec 2023 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702318805; x=1702923605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lepig9sX0iMaeuKxaJLhhBtg/75ZzLxsYSPeqzHl//Q=;
 b=L9lPBwKkvNPn+Py4X/xIecjTr7pl6ilsWlB1i4Lwf90SEVYs2IKoJaFgQKE2rtCDN9
 dCDt+vNWec3IepLp+LDDyHaIHChD67skInPVn6KGzJ+Ff7R98Rn2GluVLrpiZXKYLkTe
 w5hYZnk45p2hsSH44+ePFCKsfpeTQCkNLX/WaG8R1DEpDf+u3wRDSuQHPlVmvki7HsPo
 zPs7fz94DkCsuNgYzFb1AqySLP/Yf1u6pxD1lQyUyk1STLvEfN1A2UYKMmLKT6yh5dmP
 Ex4Iu0ozBJypgqMvTrGsx6d0z03EWxLB2C0Z+i+q+VtQf976qO3rX3MAdIuV3XGr3m+4
 c4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702318805; x=1702923605;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lepig9sX0iMaeuKxaJLhhBtg/75ZzLxsYSPeqzHl//Q=;
 b=fkAMA4UIhmqCh1CwXWbDI8MnkA7QDBJJKZb4/djlr93jAh156MouOWOkal0QC5HnM/
 iXwyaE/Tu88O2dIaGf96n3gkrFLOBMQ7UXt0cDYu0l5JBG5S6G86Y3Flef1EujbGZixz
 7i0l7Z7kyZX9vGwxBUvO39nyFv7LJDhceu5achmstpwsXsjJRhgTkXU/0jsF1juBJzGM
 MqXV+craGaGEt1Rb0ltcXSUr+/8CrbDenSlQSJUmOvPXDSA4bhhYh+YD44UECy8F/IKI
 gZqKJSfP75P9UsNWPRkUXXNpII/eOrCBa/bB+c2bUp2A6XmGoK+9PiXlCSvJgQfjmwXX
 c4oQ==
X-Gm-Message-State: AOJu0YzBE/8pscLH8uwOmBFb3t8MKi5RRuYzeCsSzLAJt6bKIZtcHkJZ
 trvpu/Ye2UZq/Ucbt+5Zg+nZ+28AXwo=
X-Google-Smtp-Source: AGHT+IF5zPAEXKHleyZmB6qML88UwNzFZsg/96ztg13BrpxCP7mmLhF2gWVQ2If/JPYQnsqV+mEg6A==
X-Received: by 2002:a17:903:1205:b0:1d0:68a:4a12 with SMTP id
 l5-20020a170903120500b001d0068a4a12mr7091998plh.15.1702318804872; 
 Mon, 11 Dec 2023 10:20:04 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a170902821400b001d075e847d5sm6964594pln.44.2023.12.11.10.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 10:20:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: Ratelimit framedone timeout msgs
Date: Mon, 11 Dec 2023 10:19:55 -0800
Message-ID: <20231211182000.218088-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

When we start getting these, we get a *lot*.  So ratelimit it to not
flood dmesg.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---

dpu should probably stop rolling it's own trace macros, but that would
be a larger cleanup.

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 82538844614b..7c22235d0eba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -39,6 +39,9 @@
 #define DPU_ERROR_ENC(e, fmt, ...) DPU_ERROR("enc%d " fmt,\
 		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
 
+#define DPU_ERROR_ENC_RATELIMITED(e, fmt, ...) DPU_ERROR_RATELIMITED("enc%d " fmt,\
+		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
+
 /*
  * Two to anticipate panels that can do cmd/vid dynamic switching
  * plan is to create all possible physical encoder types, and switch between
@@ -2339,7 +2342,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 		return;
 	}
 
-	DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
+	DPU_ERROR_ENC_RATELIMITED(dpu_enc, "frame done timeout\n");
 
 	event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index b6f53ca6e962..f5473d4dea92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -51,6 +51,7 @@
 	} while (0)
 
 #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
+#define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error]" fmt, ##__VA_ARGS__)
 
 /**
  * ktime_compare_safe - compare two ktime structures
-- 
2.43.0

