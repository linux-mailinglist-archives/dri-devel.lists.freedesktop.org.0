Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C4F907968
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D160110EB4C;
	Thu, 13 Jun 2024 17:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yIu6a2Jo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D39710EB46
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:05:15 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52bc1261e8fso1574032e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718298312; x=1718903112; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LxfhilPdPb1RXE+S/LuVgqnL996/AiFZGIBEx4qRgKw=;
 b=yIu6a2JoDBzsj8kBlKxAOr+R4x93n65F1HOVqAJBhkhf5Vzc8e9cgTg287hJpJl8wn
 THmLP/vhvhskIJM7aK6wcxuJz+zqNGNVetNMPCLV92YroE4MzIdUBJ2tnbChto5kMWTr
 ahDyMoY0LVUZ/MBKffR16/541FWSwltc9a9v5lWKvBz5xxxPJkMATCAjmZrful6Y3rMy
 t9+tdI0UUYcYJhi1VRfeagvEpWRiiDxDQq79SJYave9qkrmzGa/BWwNPec9NYWmUeh3b
 fTC3TX/W8yKeTfp8voAmzKjdSNQh0Vko3sWbmb/rBx31tzk2mSp+mfv0YX/vNURRR7Uo
 rnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718298312; x=1718903112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxfhilPdPb1RXE+S/LuVgqnL996/AiFZGIBEx4qRgKw=;
 b=jychMraPwcj5BUIfeiaBqeOSoDdlKAlewqFHTce5bEXHFRyx7ADgVS0OG9sFieR6ez
 2BdmM+qNYXOuiqST+uVvqWSd0Vs26HmShg96ezAWYnumVn/DBVUuYZACbDHdT/3ooSbv
 WaoePqH4jjlGc7wBOvtHGFsBpFywBI8lR2bRo1OPAdigfhjxDeg4AVAIZ2girbcGSBuE
 fdsZcSfVkefIDgMYB2L0xi0iTYHFyZ3icMXRsJ+dcrfbSb9T1uhDhCEMeoFSvMZGyRVm
 IFsvKfmlwn5AVoruKHjyHYARGoNKJ1NrVffNvsouDrfJDY7dhBcMcBWFViVuyYukQcO8
 hDdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGizeZRdzxdoE8YnbbMSHpAzhsxSM/YuWEjiqTXEeWu0cKnLiDr3/uj+blw/LPBXT+NeqZFsAXnlcaLtcvVZxx5kE3N1SCr2p8H7hAAGxH
X-Gm-Message-State: AOJu0YxWTXDl6uO3UfOnn1cl02IdMMw2jsOhoRHWhAy1+RMqJIoKEyQK
 BvTQ0KWEpRKjEN5zeyZZZEtIx4EpB/6lQZYizUe12FuFccnZEzZjHKv39jFMxn4=
X-Google-Smtp-Source: AGHT+IEf5wxWTGAi+H2OXcWUzMFlgq68EhRU3vSbXtmfgZ+Fn9MOelVxmGfI8CUyr5IIWCUCpwtrfQ==
X-Received: by 2002:ac2:5227:0:b0:52c:8428:1d32 with SMTP id
 2adb3069b0e04-52ca6e6e429mr236455e87.40.1718298312025; 
 Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:05:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:10 +0300
Subject: [PATCH v2 7/8] drm/msm/dpu: support setting the TE source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-7-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2478;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QUCPmblJLuOJth7ZyUHXw5QYG/4ROl41Z9y5v31PglU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybBgNJopZrFl3W9f3Uix8iVD9Cn/0h0V/H/W
 Q4JhCCmF+uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwQAKCRCLPIo+Aiko
 1cmnB/4vxIQkTqqcPlHS5vscCiQrq401V8LOYwOI6sO0WLfu28SenfTJSbZihQA9d6fEXydnggC
 ojbnQbpArL33k6dN4OXDGNsMrSCNAUtj4HtF4resPlCGAfpIWvPiGWkZcYQsGd23s3mNxTiKUnz
 MK7PP9odFnr2YI8dJIEKyCT8tqYIxoGnbPHKGkOTvihdNAUyebreidNORDgukMwCYTYNjwWZRie
 4ah+pnwaOKadp0zsQ05lx2XLFJVI7+w6ezXYBE94e/CPPiu0Si2/5LwDeNI6TyRxVSgNwAz75gf
 EHPUQJGn/n/W1p6o2F6ajcqWVYZ8AJYGCeTBVChMBOsgPLEk
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

Make the DPU driver use the TE source specified in the DT. If none is
specified, the driver defaults to the first GPIO (mdp_vsync0).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 44 ++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e9991f3756d4..6fcb3cf4a382 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -505,6 +505,44 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 		dpu_kms_wait_for_commit_done(kms, crtc);
 }
 
+static const char *dpu_vsync_sources[] = {
+	[DPU_VSYNC_SOURCE_GPIO_0] = "mdp_vsync_p",
+	[DPU_VSYNC_SOURCE_GPIO_1] = "mdp_vsync_s",
+	[DPU_VSYNC_SOURCE_GPIO_2] = "mdp_vsync_e",
+	[DPU_VSYNC_SOURCE_INTF_0] = "mdp_intf0",
+	[DPU_VSYNC_SOURCE_INTF_1] = "mdp_intf1",
+	[DPU_VSYNC_SOURCE_INTF_2] = "mdp_intf2",
+	[DPU_VSYNC_SOURCE_INTF_3] = "mdp_intf3",
+	[DPU_VSYNC_SOURCE_WD_TIMER_0] = "timer0",
+	[DPU_VSYNC_SOURCE_WD_TIMER_1] = "timer1",
+	[DPU_VSYNC_SOURCE_WD_TIMER_2] = "timer2",
+	[DPU_VSYNC_SOURCE_WD_TIMER_3] = "timer3",
+	[DPU_VSYNC_SOURCE_WD_TIMER_4] = "timer4",
+};
+
+static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
+				     struct msm_dsi *dsi)
+{
+	const char *te_source = msm_dsi_get_te_source(dsi);
+	int i;
+
+	if (!te_source) {
+		info->vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+		return 0;
+	}
+
+	/* we can not use match_string since dpu_vsync_sources is a sparse array */
+	for (i = 0; i < ARRAY_SIZE(dpu_vsync_sources); i++) {
+		if (dpu_vsync_sources[i] &&
+		    !strcmp(dpu_vsync_sources[i], te_source)) {
+			info->vsync_source = i;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
@@ -543,7 +581,11 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
-		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+		rc = dpu_kms_dsi_set_te_source(&info, priv->dsi[i]);
+		if (rc) {
+			DPU_ERROR("failed to identify TE source for dsi display\n");
+			return rc;
+		}
 
 		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
 		if (IS_ERR(encoder)) {

-- 
2.39.2

