Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C74B4B6E99
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 15:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5348010E602;
	Tue, 15 Feb 2022 14:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE15310E57F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:16:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id e5so7336618lfr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 06:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hYRG8XeM7V1EDX7uymsrwJU1RATDlAUQXVMD/dRoT3A=;
 b=bXL4YAbSWX9gQVtW2ksFkHQI0+/CYTR2mgdEqd2taCeCFMG6zyWotY96YaUJaHUFSN
 Q6VW1v98o3pf25SBSEnE7vyIbuzrNBB15a34deX2Xdu2ivzVN9Xv0vb/Q/YuOxsZPjqu
 KTGetEh5XBY3FFdOXRVYaE13H6cFmXHZYUD6rsmTIqNXjttWu5f4xg4T1o+q8wMRK67f
 YGQGAtyYHZvUOIDJyKIVW3LFZdoYW1zNxZ+mUwzOWZ4xy8dOgLjCZ6pZaUNDzX/3hvY+
 iHLfF7siobPaPWzKmQ26ENZN41J/CWew1SkXnnWupiNPTJrphSxZT/soOkbZcytVcyur
 tGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hYRG8XeM7V1EDX7uymsrwJU1RATDlAUQXVMD/dRoT3A=;
 b=oPgqm984I5CoB7d8qLg9yEPKGWAYwSR8tCgQubY9I0QRH7H7l0Gp0fR9NLWcGvxniv
 tkfKhHb8m1YJj7XDBnpGT14fKng6SuMxlmuqog8H/NzouKPRV3SRrDs2lEowPE+ThDkq
 cZuftnY6XBAE2lgTuUNjYxksUAlLwcfPYE/JQoThuP4A19wqBR9V3Aj0Mn6uhVJp9kgO
 ARo/a4sHB3cOeVQjP/VAXbIaVXzorV6fsJ06It7Y9Q/xgO70Yytq1HEVohVQ0rPFBbnT
 8H0zNJNVE86/FJzojZxKxwPX3Zc3wLCTNHEpHM2mbE8QxDPMxGinW/TktYDQ5K5fldx6
 /HIA==
X-Gm-Message-State: AOAM5314kCD/QG2BjlV8N9x7ybGUD1rgp2A14Jow52pTDq7EXXFaGjZs
 D9tq15qhuaZUlu8NlNTzMcAfyQ==
X-Google-Smtp-Source: ABdhPJwwu3zVcf9Mnn3XL+hLajNMlRfV9Y6lOcliwAQFdg23/Dphv2oJGJr/JrOPKXTaT8TuePWy/g==
X-Received: by 2002:a05:6512:4012:: with SMTP id
 br18mr3072889lfb.533.1644934606241; 
 Tue, 15 Feb 2022 06:16:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 06:16:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/8] drm/msm: move struct msm_display_info to dpu driver
Date: Tue, 15 Feb 2022 17:16:37 +0300
Message-Id: <20220215141643.3444941-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm_display_info structure is not used by the rest of msm driver, so
move it into the dpu1 (dpu_encoder.h to be precise).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index e241914a9677..ebe3944355bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -34,6 +34,24 @@ struct dpu_encoder_hw_resources {
 void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
 				  struct dpu_encoder_hw_resources *hw_res);
 
+/**
+ * struct msm_display_info - defines display properties
+ * @intf_type:          DRM_MODE_ENCODER_ type
+ * @capabilities:       Bitmask of display flags
+ * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
+ * @h_tile_instance:    Controller instance used per tile. Number of elements is
+ *                      based on num_of_h_tiles
+ * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
+ *				 used instead of panel TE in cmd mode panels
+ */
+struct msm_display_info {
+	int intf_type;
+	uint32_t capabilities;
+	uint32_t num_of_h_tiles;
+	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
+	bool is_te_using_watchdog_timer;
+};
+
 /**
  * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
  * @encoder:	encoder pointer
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3ab19775a5c3..57b0cd6f917e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -109,24 +109,6 @@ struct msm_display_topology {
 	u32 num_dspp;
 };
 
-/**
- * struct msm_display_info - defines display properties
- * @intf_type:          DRM_MODE_ENCODER_ type
- * @capabilities:       Bitmask of display flags
- * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
- * @h_tile_instance:    Controller instance used per tile. Number of elements is
- *                      based on num_of_h_tiles
- * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
- *				 used instead of panel TE in cmd mode panels
- */
-struct msm_display_info {
-	int intf_type;
-	uint32_t capabilities;
-	uint32_t num_of_h_tiles;
-	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
-	bool is_te_using_watchdog_timer;
-};
-
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-- 
2.34.1

