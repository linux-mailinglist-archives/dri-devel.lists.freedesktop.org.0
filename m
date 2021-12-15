Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1728C475CC6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA35210EE46;
	Wed, 15 Dec 2021 16:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB1810EE44
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:09:19 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id p8so34100006ljo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdlZYDEg2Npa2/UOZIIxAI9S4NIeOJrywA2dsCR6BOI=;
 b=z3fLO+k3D0KXKxgHVZ/qrpAwc/J/XXxxg+KWwgi1W2ARobrtO6/lZmbwxHcAVc5UF/
 MbvvXZWUSAzT5FXrlxUNBR2KGQ5fbmWw4JckHPYxqnyR10NSoXdfOX7mpC1RVjBsdspJ
 qzse8CCQjFytx+KpIroNnru2jv2KtinxjNMkpb6AYVriYFZ1Ovj8CKozzcKo5c2BtHwB
 MQqcUzCYkPyx6yni2SifrXydTSrvbaiH8HUCBSXgtB/xUZ3yoVTRbI6mWjOOqLad3ZYg
 p8YpzeKLnELSXkNvNsevwGKgWoWVvszDl3w1ZIxQsJww3lTNX0HWCKpouaS6alVKh4m3
 WcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdlZYDEg2Npa2/UOZIIxAI9S4NIeOJrywA2dsCR6BOI=;
 b=CzGyxDWUfsUqt4Qsr/hWCMXPHPFREUK6bHHND6yzSEVvcxNVKHE5OT+eS8X41TZvKu
 /nq+z8PWNg266jeL3n6gwAstXqT09ZR1r9Yze7NugED4v7hogKahaCgI1yF3Q5OGZcYN
 zr7G9WCqOceC3SHxRNw1z4hu1Wi0jEDyAH4ZelxREtie5PdqnsFB2WAPvhKkKlHtbLkA
 PR7UKwXFjZ3jvg/kVmqNJvLsphBnVtp/W7HmkV/UJJo1F4j5dHxAMpkEtCwMloGpdKvW
 3s7dMzHEJfoXj9PJ4Xou9d9COx9Qx3TlP55gTE7TacZRfD3Pc9Hn5Az68b01L63FbTBt
 seSg==
X-Gm-Message-State: AOAM531BxcYsYWrHNKg645TTnfd8e4PKcF1uc+UebYh32t/sGNQDBp9V
 Dc4QNjLo3ZQUFV0delC+aQXdjQ==
X-Google-Smtp-Source: ABdhPJxJy+yy9jINDuvepRp9N0wcx4oGTHViP6LIEndAKbsS4l47bJquWjs8tvQEFCChTxEtYmGPPA==
X-Received: by 2002:a2e:7216:: with SMTP id n22mr10870580ljc.44.1639584557936; 
 Wed, 15 Dec 2021 08:09:17 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id p3sm384429lfo.162.2021.12.15.08.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:09:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 2/2] drm/msm/dpu: add dpu_plane_atomic_print_state
Date: Wed, 15 Dec 2021 19:09:12 +0300
Message-Id: <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
References: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
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

Implement plane's atomic_print_state() callback, printing DPU-specific
plane state: blending stage, SSPP and multirect mode and index.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index fe2f8221ab6e..bdecbe39a12b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1305,6 +1305,46 @@ dpu_plane_duplicate_state(struct drm_plane *plane)
 	return &pstate->base;
 }
 
+static const char * const multirect_mode_name[] = {
+	[DPU_SSPP_MULTIRECT_NONE] = "none",
+	[DPU_SSPP_MULTIRECT_PARALLEL] = "parallel",
+	[DPU_SSPP_MULTIRECT_TIME_MX] = "time_mx",
+};
+
+static const char * const multirect_index_name[] = {
+	[DPU_SSPP_RECT_SOLO] = "solo",
+	[DPU_SSPP_RECT_0] = "rect_0",
+	[DPU_SSPP_RECT_1] = "rect_1",
+};
+
+static const char *dpu_get_multirect_mode(enum dpu_sspp_multirect_mode mode)
+{
+	if (WARN_ON(mode >= ARRAY_SIZE(multirect_mode_name)))
+		return "unknown";
+
+	return multirect_mode_name[mode];
+}
+
+static const char *dpu_get_multirect_index(enum dpu_sspp_multirect_index index)
+{
+	if (WARN_ON(index >= ARRAY_SIZE(multirect_index_name)))
+		return "unknown";
+
+	return multirect_index_name[index];
+}
+
+static void dpu_plane_atomic_print_state(struct drm_printer *p,
+		const struct drm_plane_state *state)
+{
+	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_plane *pdpu = to_dpu_plane(state->plane);
+
+	drm_printf(p, "\tstage=%d\n", pstate->stage);
+	drm_printf(p, "\tsspp=%s\n", pdpu->pipe_hw->cap->name);
+	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->multirect_mode));
+	drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->multirect_index));
+}
+
 static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
@@ -1388,6 +1428,7 @@ static const struct drm_plane_funcs dpu_plane_funcs = {
 		.reset = dpu_plane_reset,
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
+		.atomic_print_state = dpu_plane_atomic_print_state,
 		.format_mod_supported = dpu_plane_format_mod_supported,
 };
 
-- 
2.33.0

