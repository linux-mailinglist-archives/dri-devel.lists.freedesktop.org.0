Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280973773E7
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 21:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D436E098;
	Sat,  8 May 2021 19:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49AE6E0DB;
 Sat,  8 May 2021 19:53:03 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 fa21-20020a17090af0d5b0290157eb6b590fso7876705pjb.5; 
 Sat, 08 May 2021 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P7qWaXSLZT/HSg5BGmuOtFL+9OavfUK43XNh+avyzkE=;
 b=Cfz6kXOQ7lqNfnzW70b8KqN+tUSJD0CXYqIS6qaQ1jYmxz8btG4RZHeN1w5BrbyI8O
 dGL2brbo+0eiVkFGuUoqNfqpIiBgcu+ZFkwMM3q9G8kA+j6gUtVEWo8peuSFxZ4QYVzR
 oS/hswtOr5v0V1Se+RGAGRHT6MJgDNK7avqyXT3wBlu5djN7qFJmqh93sBjuyzIWb9Q9
 Ji0Jcoa6GaOtW1fvE5rkTPFN4Mr/rlBjGJkQgs/9tdO3krNNTTsvhinGf3Dp4QN7Cs4P
 xIeDlmvQD5dPJVR2o55d/LYGT3muYdKY5/RrT659fVp9tAf1wjBg/auTDLZKXCcfxgwT
 KUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P7qWaXSLZT/HSg5BGmuOtFL+9OavfUK43XNh+avyzkE=;
 b=hOsP/5cvDuzl9rqXOiLVrpbCR2eHpi40wF2KUytNr5eRhmXevj3AqjSXpXc529AMLG
 TeDQ+3LSbDm4YNREuNwic/7tICnC06fufJAkq8aICEvAFiaynAmwIqjXnbh8FAAgeIe1
 rK9ELkfCTVWDO8ZcZ5krxZHsNhX7pq9ud4Ac1SXLBU1GJbr+45ER6HgGnEhEVjoVePF0
 he2r8wBACKeiBWvmc5K+n/Z91OPW1r+ZnnAk28VpxwazJmxSlKDI8H17CZW3IxsCmimz
 tYgakXC+Rag4T0zEA2aRA/s04sC1PziXZBOLSOVCllxAsdvVGvoAGCf3r8tR1tkJ2MuC
 2ulQ==
X-Gm-Message-State: AOAM532LRAoSVA9GluJY20gtkT/Mo4ZWgkjL5PRpAM1fNZtNHgVly2kz
 LdlJ+/1gqb6BJ+AYE3QyIRJ7+lKhybwVfw==
X-Google-Smtp-Source: ABdhPJwLl3aQzZ4odu6hB+uFJI7LKqDT9XIEAljRfcQb0PSIx+QTdBUvLKu9+xxTse/3dzOqGWlCGg==
X-Received: by 2002:a17:90a:c297:: with SMTP id
 f23mr17680567pjt.197.1620503582651; 
 Sat, 08 May 2021 12:53:02 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j26sm7484972pfn.47.2021.05.08.12.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 12:53:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: Wire up needs_dirtyfb
Date: Sat,  8 May 2021 12:56:39 -0700
Message-Id: <20210508195641.397198-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210508195641.397198-1-robdclark@gmail.com>
References: <20210508195641.397198-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Hongbo Yao <yaohongbo@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, Maxime Ripard <maxime@cerno.tech>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5a74f93e29da..868ee6136438 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -143,6 +143,19 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 	return true;
 }
 
+static bool dpu_crtc_needs_dirtyfb(struct drm_crtc *crtc)
+{
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder_mask (encoder, crtc->dev, crtc->state->encoder_mask) {
+		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		struct dpu_plane_state *pstate, struct dpu_format *format)
 {
@@ -1343,6 +1356,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
+	.needs_dirtyfb = dpu_crtc_needs_dirtyfb,
 };
 
 /* initialize crtc */
-- 
2.30.2

