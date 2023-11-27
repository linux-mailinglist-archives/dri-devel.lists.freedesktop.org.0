Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F99D7FACD1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A5B10E3FA;
	Mon, 27 Nov 2023 21:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE9A10E3B2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:54:04 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c873cf9f74so61147641fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701122042; x=1701726842; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ArlAEnUqFzFF52c5Tk73UD/2KvIsYGODuDfHTLaWfCA=;
 b=apVLeDJaNDlgurJDJOWeCtx1dkvm0zFuQnZJfCi+bL92YPp9BtPdLYNsDpBD21nzYo
 di0LTMJ3W0l9RnWwTMLXEg7sTz4iggTFp3HPsqEykc1nAGbNCTcU6ruJRm1j0x04L6yN
 oFlLRCDaPK8wt1GGsFE3TwmTVMeurENABeLkD2vBejWZTk6raiyIZgcvgyHrRuS/hqMf
 Hc6MQEGXhyHFraHJTCs3FoKWtQt7d3J1eUhJtqV/fTkOVPwAVbtimZcJrB7nMvh75hUu
 io1zypPrxvq22cShMHTy96OlgnThxqSodreafuhrObKrb9oKwGeFFvy8iBBDbmPFgRAu
 AzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701122042; x=1701726842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ArlAEnUqFzFF52c5Tk73UD/2KvIsYGODuDfHTLaWfCA=;
 b=JwABHxiTMIJ7FlxpMlBNvv1Ln94JZt5G70i1ogdO306kjK2hSKpG7umJUocN1d3BaQ
 TiDNUAwU/u3G9/dx6bdCYEZVs8xohGw7R9V6YSTVjhsEg4/lcoCql80NOmZzw+1B6+O8
 3ksTlMCsg2XTj8RxfnjDlNFLfBvfv3vqXEtJqozslsejaF0pEkurvQEOV+rMjlJxnDuS
 ZqrldeMjf6Xk38p23APvWWKoh22a88CPHqwleBXHDdKhxdUrsqSblKhDQRtCNEoTvO+J
 sdiAyeUnOfOMGesxWbMWEWAqbKEU3ChmQMZ6scdZeTnn35wfn0TK1wgr81jzOqxT8MLF
 Tmyg==
X-Gm-Message-State: AOJu0YzJznPeijGR9cA5wWYdw6GBUdzO2e0Ah4+gYPAk3/iyE9IzdXnD
 0daU1/uom+w7vpkKcTNBwnJUrg==
X-Google-Smtp-Source: AGHT+IEJ0MrB1oiO9t4k0oOQGCb2i0ZvEyweQLr45Ug10MCxF9Ksc3lEgYPRf/H43l4221vP7BHN5w==
X-Received: by 2002:a05:651c:70e:b0:2c9:a1c3:487f with SMTP id
 z14-20020a05651c070e00b002c9a1c3487fmr2907888ljb.23.1701122042393; 
 Mon, 27 Nov 2023 13:54:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a2ebc09000000b002c6ec01aa08sm1471830ljf.110.2023.11.27.13.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 13:54:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/mdp4: flush vblank event on disable
Date: Tue, 28 Nov 2023 00:54:01 +0300
Message-Id: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Flush queued events when disabling the crtc. This avoids timeouts when
we come back and wait for dependencies (like the previous frame's
flip_done).

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 169f9de4a12a..3100957225a7 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -269,6 +269,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
 	struct mdp4_kms *mdp4_kms = get_kms(crtc);
+	unsigned long flags;
 
 	DBG("%s", mdp4_crtc->name);
 
@@ -281,6 +282,14 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
 	mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
 	mdp4_disable(mdp4_kms);
 
+	if (crtc->state->event && !crtc->state->active) {
+		WARN_ON(mdp4_crtc->event);
+		spin_lock_irqsave(&mdp4_kms->dev->event_lock, flags);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+		spin_unlock_irqrestore(&mdp4_kms->dev->event_lock, flags);
+	}
+
 	mdp4_crtc->enabled = false;
 }
 
-- 
2.39.2

