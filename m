Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27874BAD3
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5A810E63E;
	Sat,  8 Jul 2023 01:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49A510E634
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:18 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b700e85950so38174941fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778257; x=1691370257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EISX21FWLXz1QXdvUtqFaW2f6EH0tEp3Z4D8cCpj34M=;
 b=kyv3hf8HJcSmH3fJ6FcMv408NUaNI/RTNg9GB4Sr1Qxgr/8bkMStJxWPqwPZcznOSy
 K67WzScQjeDRLWG/1PcT44R5NOn2ousY68HeQVAerhiffn0v8ELyh4LW2+vawwcRNuPw
 r0KLm4zmL8k/4f6hEfxjWnlrnxDPiUVaRP6qpHuEC0ySjaGxpjAI3pbNKyTJHSB9+upK
 ru7qz0mY67QH/eg0mnw3MgIUUjiZu2M4pqukk0srvN7EcQYK+Xb7f8/mw7Q5nJxvcQgM
 wQ4YzhLgO0rfOeoWKwNlSUt1WCEGVuKRBsKE1VjVbbp1N4S08x2gGpbJFtstbItDiii5
 MRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778257; x=1691370257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EISX21FWLXz1QXdvUtqFaW2f6EH0tEp3Z4D8cCpj34M=;
 b=a+B0f7cbiqTgKhUg89QV4UVh0lUBrX2S0slk9+tPx1bRgUwVL2MEiDRUJq5sQbsrG7
 oZkOt9kkQs/jYWtgf7fDTPFOy99I2/o13Sk7tT1uOnKG8d2DGEC+bpbMR9wrIaL9iQd5
 wVoERcDI/ZHxu/YnyZ5WHKgYtwVZqlms6PVf9m6j8H1m/6qiVb7d4/RiGevW8LD4mvCj
 Wj4iSh5qwoV9vnZy/Ug51aOjFUG7i04qU/vEiVj1GxUDrmZTBDMQVd8wtd/0JF7DxL90
 jjMn2usL/5kPLRo2lOxRXNIgaF4XWSkYTabx0l3HafgiLNioCsVFxGVjIh4IL8p9i/0/
 cWAA==
X-Gm-Message-State: ABy/qLYmTKmMsKpVe+VN0oQ7+g0w26m9F7Xbby5SIV27U/RAQEYE1W+J
 F1NLNBvoQ5XtWDJlVanCAZBcBw==
X-Google-Smtp-Source: APBJJlEIW0FoNB5b9BrFSYf40N9wE3CqFzLjv77pyHHsHa8Ek607/fTd3Um2fmarqn1NQHBKYhLeCw==
X-Received: by 2002:a2e:a311:0:b0:2b6:fa42:1b1d with SMTP id
 l17-20020a2ea311000000b002b6fa421b1dmr5173406lje.29.1688778257194; 
 Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 12/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
Date: Sat,  8 Jul 2023 04:04:02 +0300
Message-Id: <20230708010407.3871346-13-dmitry.baryshkov@linaro.org>
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

Change struct mdp4_crtc allocation to use drmm_crtc_alloc(). This
removes the need to perform any actions on CRTC destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 33 ++++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 169f9de4a12a..5e5c31b44a8a 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_flip_work.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -123,16 +124,6 @@ static void unref_cursor_worker(struct drm_flip_work *work, void *val)
 	drm_gem_object_put(val);
 }
 
-static void mdp4_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
-
-	drm_crtc_cleanup(crtc);
-	drm_flip_work_cleanup(&mdp4_crtc->unref_cursor_work);
-
-	kfree(mdp4_crtc);
-}
-
 /* statically (for now) map planes to mixer stage (z-order): */
 static const int idxs[] = {
 		[VG1]  = 1,
@@ -475,7 +466,6 @@ static int mdp4_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 
 static const struct drm_crtc_funcs mdp4_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = mdp4_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
 	.cursor_set = mdp4_crtc_cursor_set,
 	.cursor_move = mdp4_crtc_cursor_move,
@@ -616,6 +606,13 @@ static const char *dma_names[] = {
 		"DMA_P", "DMA_S", "DMA_E",
 };
 
+static void mdp4_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
+{
+	struct mdp4_crtc *mdp4_crtc = ptr;
+
+	drm_flip_work_cleanup(&mdp4_crtc->unref_cursor_work);
+}
+
 /* initialize crtc */
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 		struct drm_plane *plane, int id, int ovlp_id,
@@ -623,10 +620,13 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 {
 	struct drm_crtc *crtc = NULL;
 	struct mdp4_crtc *mdp4_crtc;
+	int ret;
 
-	mdp4_crtc = kzalloc(sizeof(*mdp4_crtc), GFP_KERNEL);
-	if (!mdp4_crtc)
-		return ERR_PTR(-ENOMEM);
+	mdp4_crtc = drmm_crtc_alloc_with_planes(dev, struct mdp4_crtc, base,
+						plane, NULL,
+						&mdp4_crtc_funcs, NULL);
+	if (IS_ERR(mdp4_crtc))
+		return ERR_CAST(mdp4_crtc);
 
 	crtc = &mdp4_crtc->base;
 
@@ -648,9 +648,10 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 
 	drm_flip_work_init(&mdp4_crtc->unref_cursor_work,
 			"unref cursor", unref_cursor_worker);
+	ret = drmm_add_action_or_reset(dev, mdp4_crtc_flip_cleanup, mdp4_crtc);
+	if (ret)
+		return ERR_PTR(ret);
 
-	drm_crtc_init_with_planes(dev, crtc, plane, NULL, &mdp4_crtc_funcs,
-				  NULL);
 	drm_crtc_helper_add(crtc, &mdp4_crtc_helper_funcs);
 
 	return crtc;
-- 
2.39.2

