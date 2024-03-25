Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C788B250
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 22:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A32710E649;
	Mon, 25 Mar 2024 21:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H5ti8vwD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D76C10E52C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 21:08:13 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6e6fb9a494aso3750281b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711400893; x=1712005693;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mOw6fcswQwxOvYHww+pfzlL0zz/FCwx/qV0ISLCzS6k=;
 b=H5ti8vwDgOoFy31XNIjjBNo+1Mc0jDlBPMEdcfL5ne4blqyT66wqiT+tx3GgSk90X8
 CN1JH/kgiH/A3xIQcBz2fwP3u03Ni0KH2SrLe5WvxKrct1uiyDa69Js5Zy3GCQ9cgowB
 LbkJVRiWJ0Ls+sWl4dPvp5FzgHslSI+emFD90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711400893; x=1712005693;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mOw6fcswQwxOvYHww+pfzlL0zz/FCwx/qV0ISLCzS6k=;
 b=RZnxXf9gkuFvYOKCCp7XF0Cea/JznY53yBPT167ll+xIQbV8l46dru25BsQ7isciHI
 6kZI5q1gYbPgyVjkbW2x4za1+DbZjy0BqGZkufYeQFU26rQSHWkapn2kwZi4Od6L4y+x
 bwZNHXd34f7zuwiNja7vnXqF8l9pwdaEcjvp6PdP5CA31pa6qUOlZFyGMxWTVsEncbC5
 hBB+XUe+dZERyx6LLlHP4JxpFE4D503qF+bVee67KGO070DwZDkCjwQABbOX1d0nbhbN
 eFh6JvPJYzrrlAvphpFuKHVZTGLb6W2USv7FeWO7Zv9ZPBjsNXk4nVBcvyrs1Q1jEJOm
 x/tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYP8VdBIEYf0F5AJnvCPcQFF0oE1a1n0B1IF4FtktEnkfIQAqFaIw0fFp6QaX7ae9RYx4ITRdmYty8W6bfWABEG2s6c9vSaMBqUVNibCHY
X-Gm-Message-State: AOJu0YyQSymySqzCkAO+6t5vIhCRucLHcSKlOi5aOTXvL3kBeaAEW9/G
 L9m8erp59FwqopTfznP/Ywnwt+cV28IerbmFQ8wYvlnV9OOlEXUaYokiHZPaeg==
X-Google-Smtp-Source: AGHT+IFNMzzlQS+M2WzYTzH5qd5yGumfrSL44l9e2y2KmdW8eGoSNDQ4K0XzusabfDNfOaNLkU2CdA==
X-Received: by 2002:a05:6a20:12d2:b0:1a3:4671:2285 with SMTP id
 v18-20020a056a2012d200b001a346712285mr7841746pzg.44.1711400893255; 
 Mon, 25 Mar 2024 14:08:13 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com.
 [34.125.198.4]) by smtp.gmail.com with UTF8SMTPSA id
 fn18-20020a056a002fd200b006e4e93f4f17sm4584180pfb.117.2024.03.25.14.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 14:08:12 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add newlines to some debug prints
Date: Mon, 25 Mar 2024 14:08:09 -0700
Message-ID: <20240325210810.1340820-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These debug prints are missing newlines, leading to multiple messages
being printed on one line and hard to read logs. Add newlines to have
the debug prints on separate lines. The DBG macro used to add a newline,
but I missed that while migrating to drm_dbg wrappers.

Fixes: 7cb017db1896 ("drm/msm: Move FB debug prints to drm_dbg_state()")
Fixes: 721c6e0c6aed ("drm/msm: Move vblank debug prints to drm_dbg_vbl()")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_fb.c  | 6 +++---
 drivers/gpu/drm/msm/msm_kms.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index e3f61c39df69..80166f702a0d 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,7 +89,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &msm_fb->iova[i]);
-		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)",
+		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
 		if (ret)
 			return ret;
@@ -176,7 +176,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 	const struct msm_format *format;
 	int ret, i, n;
 
-	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)",
+	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)\n",
 			mode_cmd, mode_cmd->width, mode_cmd->height,
 			(char *)&mode_cmd->pixel_format);
 
@@ -232,7 +232,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 
 	refcount_set(&msm_fb->dirtyfb, 1);
 
-	drm_dbg_state(dev, "create: FB ID: %d (%p)", fb->base.id, fb);
+	drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
 
 	return fb;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 84c21ec2ceea..af6a6fcb1173 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -149,7 +149,7 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return -ENXIO;
-	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	drm_dbg_vbl(dev, "crtc=%u\n", crtc->base.id);
 	return vblank_ctrl_queue_work(priv, crtc, true);
 }
 
@@ -160,7 +160,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return;
-	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	drm_dbg_vbl(dev, "crtc=%u\n", crtc->base.id);
 	vblank_ctrl_queue_work(priv, crtc, false);
 }
 

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
https://chromeos.dev

