Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4072B5E9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 05:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF0F10E14F;
	Mon, 12 Jun 2023 03:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E02310E14C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 03:16:21 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so4357466e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 20:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686539777; x=1689131777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vX21LLla0MPhcsSW4wvj7gR4EaqJE3wcHLDAEcLoY6c=;
 b=UEaw34LyFdwrlSiYVQJ5ZILZiR/N1JaAlaYFfucPkw2w4awQargHtrcPxLharIfjev
 qzrJowpSqvTy03z3pxsq1FA1OMc7suBtxDz16gi9EyuH7YI6BH6W0hk9VbRgs0t7D4Js
 1yVAFTvwQ0bZJGLdiPE1DB0ibsClmU17XnjfmODHvgAdQx38K6Fib6Nm8Jw3kfiWdcP1
 ufhOEPNZLRrMG1bpB6Y2MLDO59QtR12kNmvvSdMCh0GttG7NmOeJnS8xTjx+1o9QgGkE
 tHGrEC4u2+ioh1s2vHvL3VZXXIAf6gE/xWNko1SZXTqjDT8f2VV3thEhomWZlzgsz6aq
 DuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686539777; x=1689131777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vX21LLla0MPhcsSW4wvj7gR4EaqJE3wcHLDAEcLoY6c=;
 b=AyFc9Vx+9bPfJsR3oQmTa/hBsdhNobydCAjyXInoaM/9FhFxiDh3ivhBIhByZHeG/G
 Wd2tYLwQKSwy+yrB/q2E9Q3lXZjqCxXTRSznMv0Wp7M6E4sUSVsGpNdnIneTaQ1VeYP4
 SW3rHrv0CJP2VYJkAdtOPZlf2Dbd9ZVrB3B5QrKJXI3dcCVInXpRNp+t+OjyWvHal5+U
 Bs0P0eggK27T0YNR5SXJK9chIyrJoZq8FVBuSiyJBtADnupp5xO9bP1mN91YE7Hms1Md
 8TvE7O9avOjT1bA+Sy/ULCXO4RvlkstBx/HenEcQLPxi1cinovJQYcUYx+avfLQT11/B
 6BDg==
X-Gm-Message-State: AC+VfDw4lDSA/wao/+tDjQj1/Oa6x9NOZ4V4ykCSOiajZLAy34cTwIJ9
 9ZUMjsxrBuLuNN4jSlz2OBHZTg==
X-Google-Smtp-Source: ACHHUZ7xb6D35xBh+yT8h5vDpe68vonKc8bOPpe7y8I0g1oqybnBZZ8oB4/Z3mNH3dbwcrX/01MghQ==
X-Received: by 2002:a19:4f4e:0:b0:4f6:40e1:4a92 with SMTP id
 a14-20020a194f4e000000b004f640e14a92mr3490850lfk.13.1686539777360; 
 Sun, 11 Jun 2023 20:16:17 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 g12-20020a19ee0c000000b004f27471e0aesm1295901lfb.79.2023.06.11.20.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 20:16:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Date: Mon, 12 Jun 2023 06:16:15 +0300
Message-Id: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Degdag Mohamed <degdagmohamed@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
overhead") the drm_fb_helper_funcs::fb_dirty helper is required for
proper dirty/damage processing. The drm/msm driver requires that to
function to let CMD panels to work. Use simplified version of
drm_fbdev_generic_helper_fb_dirty() to fix support for CMD mode panels.

Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
Fixes: 93e81e38e197 ("drm/fb_helper: Minimize damage-helper overhead")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index fa9c1cbffae3..b933a85420f6 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -139,8 +139,28 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	return ret;
 }
 
+static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
+			      struct drm_clip_rect *clip)
+{
+	struct drm_device *dev = helper->dev;
+	int ret;
+
+	/* Call damage handlers only if necessary */
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
 	.fb_probe = msm_fbdev_create,
+	.fb_dirty = msm_fbdev_fb_dirty,
 };
 
 /*
-- 
2.39.2

