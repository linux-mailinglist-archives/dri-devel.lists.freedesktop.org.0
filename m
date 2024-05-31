Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA278D6A53
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16C410E1CA;
	Fri, 31 May 2024 20:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kaq2tnrE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD5410E1A7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:07:32 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e96f29884dso27960221fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717186051; x=1717790851; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xsWyvZJ7smsYEwcJt3QXuB4RboSifhUzN4Y/+3fVgYs=;
 b=Kaq2tnrEGE+Z0+qptwZOCmBQwPcGVcIHtvTltuDe4pSxSRqyagGySHeQJz56EOFJlg
 s57QJTB1Yjij07WORhzNQELp9Mlb1GclBgf4CDLpD872BTE3otWZe6ZYEWp17EvWdkpb
 3rz8zaA426h2HGHCDkIiyvv0dBKN9/AHyEz3j+iWfCfHYw8nI4QP0sGOWEFa8ycFrYJc
 ZkDCUvPNsChcIWN06CnI6E0/59iwtotttlBjtcgXO6okhpE2ngDU5qEL5oOcwWMQJDJU
 3dxkLUkFIU+zpLB7GxCCwdFgHcPMj78DUJI+hJ/sUhONU8N9xnn1lo1NSx6z2uI5ZBq1
 Up9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717186051; x=1717790851;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xsWyvZJ7smsYEwcJt3QXuB4RboSifhUzN4Y/+3fVgYs=;
 b=oQVVNdLJvn6YJi6HbxBE/w/jJeMHNijGTmPwAL+vays4uHpOOJw07x4FJTN6ViNR+X
 GXTEHzjGiIFz2FL4ysPimS5VVTRAzXPYPBvfTzdQuTmeYVwhqTbhKRyWX6S9738Uw+to
 zY/SCOI+5AlFxZUqDNd68MRHLnwReBcoCz73gDac8LSTzKjU/4XQVcxD4fqGZXXWaKcl
 if9aIYPUFfNxC3Uo9sBCyTzXjHId6BDImdTGA1nBOzrCk40iOzzpKLRjTovUiDzdN7SI
 yr+E0rrnVo3ew9EWliWC6FlrotB7g7uUQMfjxBZaxWSsqIRzCdgH7rjGIzqBS51bBBZE
 AavA==
X-Gm-Message-State: AOJu0YzVaVZCYumcT7xUHg7nEJbtCNsehVr9gD1XPeQWWhSLrAmi8GUp
 nN2jLBNZ0w8wzQus5KE3A/prEyYphlJtqZuRg7bG6mgXHVyDoC31FoLjsUasRGY=
X-Google-Smtp-Source: AGHT+IG1DN5+DBzFiRuDTYEQSvzREpoKSfY1gAB8eFQNpo82N+Nkll6VfEl6SAftfhSSjQ8BLG2yWw==
X-Received: by 2002:a05:651c:1a28:b0:2e1:cb22:a4d with SMTP id
 38308e7fff4ca-2ea951e0c9cmr24442131fa.36.1717186050858; 
 Fri, 31 May 2024 13:07:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:07:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:24 +0300
Subject: [PATCH v4 1/9] drm/connector: hdmi: accept NULL for Audio
 Infoframe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-1-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AXQkgT8bLCi+J4VLmDhYURPEkLAsLkNbwsYyTx65pa0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4A4mslqnmrqRRzX6aSZEDOT1WCm1EzeG9wr
 U/QUtoki1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAAAKCRCLPIo+Aiko
 1SUjB/0e2GTfiChGvovX7efLQ0j2ffZdGrlSDSwGrLLZc+B6/ZbDne/yndL1jZu8s9RmnWztqwB
 gyZSl06x0cl55ESAcn+6WVktsGPpk8dZKMqFe1OQT25lqL3uyPrIhuigQ64W/EX8+9+KLn2wn08
 9hTe/0RG1CmTUWbzzYL0AiCvqkaU19lt1SvNH3x3XULdutaam97jjHCbJhbwpvIDL/TSCltQ4tY
 mPl51o4WSuBlaVIcumVOiCYt/lpmn1dywPMY31gJl6e+eTGqZFOa9TfDdA86+YHdhQo+CuadVd2
 JaOYarn+U4myQ9cBkESIesfM8s8SMqUBofMb2JCj2rwpgoou
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

Allow passing NULL as audio infoframe as a way to disable Audio
Infoframe generation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ce96837eea65..5356723d21f5 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -681,7 +681,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_infoframes);
 /**
  * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the Audio Infoframe
  * @connector: A pointer to the HDMI connector
- * @frame: A pointer to the audio infoframe to write
+ * @frame: A pointer to the audio infoframe to write or NULL to disable sending the frame
  *
  * This function is meant for HDMI connector drivers to update their
  * audio infoframe. It will typically be used in one of the ALSA hooks
@@ -704,10 +704,16 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
-	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
-	infoframe->set = true;
+	if (frame) {
+		memcpy(&infoframe->data, frame, sizeof(infoframe->data));
+		infoframe->set = true;
+
+		ret = write_infoframe(connector, infoframe);
+	} else {
+		infoframe->set = false;
 
-	ret = write_infoframe(connector, infoframe);
+		ret = clear_infoframe(connector, infoframe);
+	}
 
 	mutex_unlock(&connector->hdmi.infoframes.lock);
 

-- 
2.39.2

