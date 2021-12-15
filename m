Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A32DF475CC3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EBD10EE41;
	Wed, 15 Dec 2021 16:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37E10EE41
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:09:17 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id b19so32270109ljr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KclpA+/0L/F7u9jRUKSOAZvZNDtVIlk59RARlc86ggs=;
 b=BW2Qt9EaFJTiHZdC3nvN/PUwTUpy6oR/0JRu42C/dW2P6CLvRaQ8LMP4HMHHmJLuk+
 p2PK7QpmjSv6EOQ4aDhdemXNuF47Ju7eN6qz+UIsw7jD14G/EST3fRXX9pVe+4sT/phl
 D2T9v2LwbqBp128aZo89UtQEFu3Rlt2uyzS4Ok5/ef9CzrpHcHIGFjHkdQoU2GetS6Ni
 ci3Y2NrukaRT73fvM81iUMphUlzP9B82buHfUtiP0RkzW+k575bk3vcAXDAZir709dO2
 OF58XG8Ol6bCAfxFxZjRI+gK1m9grn84DJ/OsUD82Xzd/jCvroYnzcf6cWc0UwXmBXhz
 c8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KclpA+/0L/F7u9jRUKSOAZvZNDtVIlk59RARlc86ggs=;
 b=G2UjDiV/ERYFrNW5S0dZ1erj90goCYsDVi0s5fAdd75DDM7w9NQBdniSkwp+9wNC+x
 WjclAquF82GroaK1pI0aWJd1O41hcBrcirA/2u1NmtB3T3z5gwQ2RhLk48G8AU6J5lKN
 poE7EEfRhJjw/IKiNFeSbkmBzE39FUzpF4kKlx05krHIjeZsStCcSunbnNXmXlX8eoA2
 gPCWf/uoGqlK7ZhrOutMLpI7SMhQq4t0ttM1+WK1ZkEpqdGTx2NBva1fG7FGdQYEJvRO
 lJbyt9EiPPszw76e+LYzalXNKWk1PtcOODiS1IookaOSRr+0CdYQYXxlxIReWiWanOXQ
 kGSQ==
X-Gm-Message-State: AOAM532S63PrcFzKMqo56F/qyxueWeQH9TS+Rkn6IpbgpyS+MOY1NbJ8
 IGHkxzuxPsgWK8ekO9mr4LRpgA==
X-Google-Smtp-Source: ABdhPJwx6kHE+Zh5SlUtduh99+fCd5xnD/MrJDiyKG5Dn+A0vsIz//wtOq3GIBs9TtKvHvEzJ0IPcg==
X-Received: by 2002:a2e:964a:: with SMTP id z10mr10593692ljh.210.1639584555501; 
 Wed, 15 Dec 2021 08:09:15 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id p3sm384429lfo.162.2021.12.15.08.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:09:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 1/2] drm/msm/dpu: add dpu_crtc_atomic_print_state
Date: Wed, 15 Dec 2021 19:09:11 +0300
Message-Id: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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

Implement CRTC's atomic_print_state() callback, printing DPU-specific
CRTC state (LM, CTL and DSPP ids).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 59b1bcfbe8c0..df128a680697 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -924,6 +924,20 @@ static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
 	return &cstate->base;
 }
 
+static void dpu_crtc_atomic_print_state(struct drm_printer *p,
+					const struct drm_crtc_state *state)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
+	int i;
+
+	for (i = 0; i < cstate->num_mixers; i++) {
+		drm_printf(p, "\tlm[%d]=%d\n", i, cstate->mixers[i].hw_lm->idx - LM_0);
+		drm_printf(p, "\tctl[%d]=%d\n", i, cstate->mixers[i].lm_ctl->idx - CTL_0);
+		if (cstate->mixers[i].hw_dspp)
+			drm_printf(p, "\tdspp[%d]=%d\n", i, cstate->mixers[i].hw_dspp->idx - DSPP_0);
+	}
+}
+
 static void dpu_crtc_disable(struct drm_crtc *crtc,
 			     struct drm_atomic_state *state)
 {
@@ -1454,6 +1468,7 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.reset = dpu_crtc_reset,
 	.atomic_duplicate_state = dpu_crtc_duplicate_state,
 	.atomic_destroy_state = dpu_crtc_destroy_state,
+	.atomic_print_state = dpu_crtc_atomic_print_state,
 	.late_register = dpu_crtc_late_register,
 	.verify_crc_source = dpu_crtc_verify_crc_source,
 	.set_crc_source = dpu_crtc_set_crc_source,
-- 
2.33.0

