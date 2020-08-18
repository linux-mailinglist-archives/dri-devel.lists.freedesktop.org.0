Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0DC248BA5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 18:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEBA89FA9;
	Tue, 18 Aug 2020 16:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC9589FA9;
 Tue, 18 Aug 2020 16:30:32 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id j13so79771pjd.4;
 Tue, 18 Aug 2020 09:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uYxuSXULk2GwrV5tHUS7tlUyDew6i48Gt8hPnnZN84g=;
 b=jlUvltomcG5Fs1zTsYqZ4MPlEO7mi885cnLyByLOf/phVAxDxC/U7iZvM77jJsGEon
 BSB92p/40B+ItljjVLLfyC22l7nQGtkrG1fY4SSNZ6/h6lXzRO0A55vLcLqJAschsIAk
 rWMmS6jskMc8PRfm2Fdc3eM+SAw68d28J38L9Mq22289DScuXoqjQEY2HPybucWrJNpb
 eo95W8tP05JxIplOkGywaw3NvV5jayRJtLaVFtxS+Vj2rgkMvIUxwvCO4VGph/FYgCS1
 U7tsrS0QrTXU0VV2fTmqNDJD97o2IIVqob3Mg9fq1BycbARA8d5fMoUbixGGQ5Wi/5WP
 L7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uYxuSXULk2GwrV5tHUS7tlUyDew6i48Gt8hPnnZN84g=;
 b=V0YfpC14rdHRJrxzRmw3PbPwLkPz8/4SE4/49h56s5NWBunJaXRhXQGMdXeiADNLfV
 yaVm0Lr168vjNvicuY0Pu03hIBeh1S820LrJKYFHaRzHTpawQyVd+CKBv5DLA0F0rnCf
 w9x5XXfNFh5Nahi+64NNWU0oJMbzjYV2uk05wT5IvIFvl8Jkgun0Ny2NRgZOQ3SLS7JS
 fkrvj0Q70C+BnPZGrpYdF1SjOFo752pTSp0lDjz77V/JnT0P4ovGLZCWXteHTBULMyka
 JYfKqIyP9DibRDMKw3Kx6dNIEvyIHukBqmlbukVg5kF4MK9MS+EDnLZ8LU+VCgiUXGqa
 LEhw==
X-Gm-Message-State: AOAM531VjRR2yRyT0w6JBaeFrKEfGG3Nj9z8ljXH96nCe5t+qR2B+clZ
 EQ9glmWJwjuiH1vBrXfpilsGacnkKzkbjySt
X-Google-Smtp-Source: ABdhPJwGwtmXC5WmDnnwZPtj1PesksPhW1Ru5oVRk3RWoVgwq9xKWge/sunWKKolPUaWZ9nAMKTCQg==
X-Received: by 2002:a17:90a:d70c:: with SMTP id
 y12mr621940pju.31.1597768231683; 
 Tue, 18 Aug 2020 09:30:31 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 g2sm374594pju.23.2020.08.18.09.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 09:30:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: enable vblank during atomic commits
Date: Tue, 18 Aug 2020 09:31:19 -0700
Message-Id: <20200818163119.715410-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This has roughly the same effect as drm_atomic_helper_wait_for_vblanks(),
basically just ensuring that vblank accounting is enabled so that we get
valid timestamp/seqn on pageflip events.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 5ccfad794c6a..561bfa48841c 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -27,6 +27,34 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
 	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
 }
 
+/*
+ * Helpers to control vblanks while we flush.. basically just to ensure
+ * that vblank accounting is switched on, so we get valid seqn/timestamp
+ * on pageflip events (if requested)
+ */
+
+static void vblank_get(struct msm_kms *kms, unsigned crtc_mask)
+{
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(kms->dev, crtc, crtc_mask) {
+		if (!crtc->state->active)
+			continue;
+		drm_crtc_vblank_get(crtc);
+	}
+}
+
+static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
+{
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(kms->dev, crtc, crtc_mask) {
+		if (!crtc->state->active)
+			continue;
+		drm_crtc_vblank_put(crtc);
+	}
+}
+
 static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 {
 	unsigned crtc_mask = BIT(crtc_idx);
@@ -44,6 +72,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 
 	kms->funcs->enable_commit(kms);
 
+	vblank_get(kms, crtc_mask);
+
 	/*
 	 * Flush hardware updates:
 	 */
@@ -58,6 +88,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
+	vblank_put(kms, crtc_mask);
+
 	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
 	mutex_unlock(&kms->commit_lock);
@@ -221,6 +253,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	 */
 	kms->pending_crtc_mask &= ~crtc_mask;
 
+	vblank_get(kms, crtc_mask);
+
 	/*
 	 * Flush hardware updates:
 	 */
@@ -235,6 +269,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
+	vblank_put(kms, crtc_mask);
+
 	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
 	mutex_unlock(&kms->commit_lock);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
