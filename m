Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0C74BAD1
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8FF10E1A0;
	Sat,  8 Jul 2023 01:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EDC10E171
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:16 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6f52e1c5cso39888871fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778254; x=1691370254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZRc+2bH50lvFJ4iQH0iWkQogB1jp6GLL6Q5jQcWv5c=;
 b=NAQNmVlx7dyYNEJw33aoe7CnqzPlfbFTXZVIWnwnuDKeRz8U0xtYNzuIfJgcmpsf8w
 HTO9vnEYTxqa4tATeYaZANFvfIJMUg5/t5FjWwwwawaEHSfiN+++jZmVlc8/wxRSmupJ
 lZqNBYp45tPQB04cn3RyHn3fqjiW/DwRAIVXakIj5YTidJMsnSEFcjxUovtrq06ic0kZ
 +j+REWufz4zfPoy53dlJz6Zb5kAAlSGor+HmfbbGLvaUR0WaRAKjU1SS5BIPHnuOg0r2
 5Q9Vt41AiS2DZqhnmsU1TYLp6AO7fS2SAQIZsJTu+zWghUN6P+WaRjjroLM8hBvrEP2M
 FUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778254; x=1691370254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZRc+2bH50lvFJ4iQH0iWkQogB1jp6GLL6Q5jQcWv5c=;
 b=Mfx3Jq0tpU0X20vv2gZbRFvnLPsi2DXZaMUVAcS7qS22Dmusspb8/amX6+vXxZ5CJL
 12q0HU38UBkN4Vp2NYAtkjbzyJCUb0Hk3F52BcjUebzi41qZbLG0uQC3LwecHewoRyQw
 /Qfwk4GdF66HE+61jy/O1/JOOnDHrGnu7fufn/P3S9owE1RAhsgCI9DLpDKIzurjwe1h
 pT838suf9OT756wV12rhv9ITm9MoG1f/UWkWQ4bG9Z10tURID1rkn9nWQ8blX4Jhz+O8
 g0/b579xDvm6tnj61T4+z2hvHUnCBk6jvwJ91WMVdgkRhj5pbx06huYOrEk7DlcHU1L2
 VRrg==
X-Gm-Message-State: ABy/qLYEyCwqnzjV1c5rkdRB9qdLocbsBCPW+nYm+URutSaWXjJib3dN
 XwiRECnLplWS62bn/XCizSjBEQ==
X-Google-Smtp-Source: APBJJlHfiT0JSF+WIlOaycarm3up6mXwNOlI+utPgVtqTcHat90TaWXUewXh2QsycPcg7rsakHTF+Q==
X-Received: by 2002:a2e:b174:0:b0:2b5:1b80:263a with SMTP id
 a20-20020a2eb174000000b002b51b80263amr5836130ljm.47.1688778254384; 
 Fri, 07 Jul 2023 18:04:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 08/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
Date: Sat,  8 Jul 2023 04:03:58 +0300
Message-Id: <20230708010407.3871346-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change struct mdp5_crtc allocation to use drmm_crtc_alloc(). This
removes the need to perform any actions on CRTC destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 30 +++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 86036dd4e1e8..4a3db2ea1689 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -13,6 +13,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_flip_work.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -172,14 +173,11 @@ static void unref_cursor_worker(struct drm_flip_work *work, void *val)
 	drm_gem_object_put(val);
 }
 
-static void mdp5_crtc_destroy(struct drm_crtc *crtc)
+static void mdp5_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
 {
-	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
+	struct mdp5_crtc *mdp5_crtc = ptr;
 
-	drm_crtc_cleanup(crtc);
 	drm_flip_work_cleanup(&mdp5_crtc->unref_cursor_work);
-
-	kfree(mdp5_crtc);
 }
 
 static inline u32 mdp5_lm_use_fg_alpha_mask(enum mdp_mixer_stage_id stage)
@@ -1147,7 +1145,6 @@ static void mdp5_crtc_reset(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs mdp5_crtc_no_lm_cursor_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = mdp5_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = mdp5_crtc_reset,
 	.atomic_duplicate_state = mdp5_crtc_duplicate_state,
@@ -1161,7 +1158,6 @@ static const struct drm_crtc_funcs mdp5_crtc_no_lm_cursor_funcs = {
 
 static const struct drm_crtc_funcs mdp5_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = mdp5_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = mdp5_crtc_reset,
 	.atomic_duplicate_state = mdp5_crtc_duplicate_state,
@@ -1327,10 +1323,16 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 {
 	struct drm_crtc *crtc = NULL;
 	struct mdp5_crtc *mdp5_crtc;
+	int ret;
 
-	mdp5_crtc = kzalloc(sizeof(*mdp5_crtc), GFP_KERNEL);
-	if (!mdp5_crtc)
-		return ERR_PTR(-ENOMEM);
+	mdp5_crtc = drmm_crtc_alloc_with_planes(dev, struct mdp5_crtc, base,
+						plane, cursor_plane,
+						cursor_plane ?
+						&mdp5_crtc_no_lm_cursor_funcs :
+						&mdp5_crtc_funcs,
+						NULL);
+	if (IS_ERR(mdp5_crtc))
+		return ERR_CAST(mdp5_crtc);
 
 	crtc = &mdp5_crtc->base;
 
@@ -1346,13 +1348,11 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 
 	mdp5_crtc->lm_cursor_enabled = cursor_plane ? false : true;
 
-	drm_crtc_init_with_planes(dev, crtc, plane, cursor_plane,
-				  cursor_plane ?
-				  &mdp5_crtc_no_lm_cursor_funcs :
-				  &mdp5_crtc_funcs, NULL);
-
 	drm_flip_work_init(&mdp5_crtc->unref_cursor_work,
 			"unref cursor", unref_cursor_worker);
+	ret = drmm_add_action_or_reset(dev, mdp5_crtc_flip_cleanup, mdp5_crtc);
+	if (ret)
+		return ERR_PTR(ret);
 
 	drm_crtc_helper_add(crtc, &mdp5_crtc_helper_funcs);
 
-- 
2.39.2

