Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B66801FEB
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 01:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7232310E247;
	Sun,  3 Dec 2023 00:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D546A10E246
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 00:05:38 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50be08b8fd9so1757376e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 16:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701561937; x=1702166737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+wZcXHVwkeUQMwvuCD7bm1l/4FwKqd7nf6ZvebDIGQ=;
 b=h73YauICHCEf81Fev+nZMuSwqEbluDZvtrvvjwg21kM3qYX+qhTgj1O1OTL1UlNpzi
 3kViP4U+35eMcIZxiTzrk7lR3QougNRQ2VSh21TxmolELeMhHCFSffK9czA3Gl67RHCq
 v8kVkyjUhg6g94/cTLAj3mJhLg9TPYHW0NrsEqr1v8khQKwxaB4QuB+XpMbmyXmjUoTX
 OsnY+2NCwILTY+fkB1+R9WhVkxWAqQTDF68+83cBQK6vuEx1ltHfuI7a31C3TuaomKQL
 qryBH0CpwS/+mIaMMJPEvG15VfGSU7jZpGDeDPIB+zZES7BVmOLlcXp6EvTRdZ7KFl7P
 A3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701561937; x=1702166737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T+wZcXHVwkeUQMwvuCD7bm1l/4FwKqd7nf6ZvebDIGQ=;
 b=QnezSnN2k+N0r2KgQo2glpmbdPx8YEGpy/Yf9wUwdJRB7MXSD/kb0wSXGzCvdIsafx
 1iPFTGYp02WjKXj+nJrQ6DzYE4jxdIlc+BRfqURfQdkfVUievvqO62GTh9gX8S9KAAnx
 CEXaRKy3GStkePk+Mzz3gPjBwIU5NaI//VFsSbEf+072X3eDYA1dX8pm1kOIdI0ibG03
 QLT3Czb6TyeU4JaYM5GJx5F5u7sarbMCBBm5j9y6/Y5WPfLYtVoh6qhdI/Qx+CKPBtVQ
 YxypVSYJWLMHHFVBEHcFAgGK9OUj3EQtPIjKNHIlocaKZkTDJAy0iQGDX0rhpkWCCIMI
 VFog==
X-Gm-Message-State: AOJu0YyrEJ9U5aC5Yj5/24VDUaPqvj/Lk3qpd250515NZ1oR4ZqdNzls
 pO9USdUeytI1/A0nEniSpErYww==
X-Google-Smtp-Source: AGHT+IENugRCNKbSEq35yn6WCv2d3q8Y4gd+BmrHRk5E/Q8JWVggoRvCzdt8HjHJvntRZkrSF8G87w==
X-Received: by 2002:ac2:44ba:0:b0:50b:b13f:f46a with SMTP id
 c26-20020ac244ba000000b0050bb13ff46amr1600759lfm.3.1701561937180; 
 Sat, 02 Dec 2023 16:05:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:05:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND 3/5] drm/msm/dpu: drop global_state_lock
Date: Sun,  3 Dec 2023 03:05:30 +0300
Message-Id: <20231203000532.1290480-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the commit b962a12050a3 ("drm/atomic: integrate modeset lock with
private objects") the DRM framework no longer requires the external
lock for private objects. Drop the lock, letting the DRM to manage
private object locking.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 73f70e67cfef..26ac00f8f486 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -328,11 +328,6 @@ struct dpu_global_state *dpu_kms_get_global_state(struct drm_atomic_state *s)
 	struct msm_drm_private *priv = s->dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_private_state *priv_state;
-	int ret;
-
-	ret = drm_modeset_lock(&dpu_kms->global_state_lock, s->acquire_ctx);
-	if (ret)
-		return ERR_PTR(ret);
 
 	priv_state = drm_atomic_get_private_obj_state(s,
 						&dpu_kms->global_state);
@@ -373,8 +368,6 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 {
 	struct dpu_global_state *state;
 
-	drm_modeset_lock_init(&dpu_kms->global_state_lock);
-
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
@@ -388,7 +381,6 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
 {
 	drm_atomic_private_obj_fini(&dpu_kms->global_state);
-	drm_modeset_lock_fini(&dpu_kms->global_state_lock);
 }
 
 static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index b6f53ca6e962..ed549f0f7c65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -84,7 +84,6 @@ struct dpu_kms {
 	 * Global private object state, Do not access directly, use
 	 * dpu_kms_global_get_state()
 	 */
-	struct drm_modeset_lock global_state_lock;
 	struct drm_private_obj global_state;
 
 	struct dpu_rm rm;
-- 
2.39.2

