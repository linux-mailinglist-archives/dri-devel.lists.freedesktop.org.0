Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72487D643
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 22:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BBF1125A0;
	Fri, 15 Mar 2024 21:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m2owhOyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7DD11259C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 21:37:40 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6e6b6f86975so1781839b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 14:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710538660; x=1711143460;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3H6OXEbfvIDjIIA1tOpuyHi0Op96O49XQrGRIR14qb8=;
 b=m2owhOySURmAXl7lYHkM/UPmX4hyQxXBGZtrfb/65jzQD6g4irL5GhhjJfDYJVOicl
 OSm54smPuxlIqsXWNYuggVlM6khKExkXgGkHmG14HRJrBK7x7kSyvOMPj+Lk3+ul+ZNZ
 jJjM+fIsfH0qBzq49mb4BsuBXmbIrtICGr070=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710538660; x=1711143460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3H6OXEbfvIDjIIA1tOpuyHi0Op96O49XQrGRIR14qb8=;
 b=OwrPKLwU9bKs+0W+7w5209VZ9//8ZyGXggk64sjskjqkB6ZnCzMktI3QMtMMdlvBh4
 0B/IYroyVlgGilK9Cgo96tTdBDsAaDc8DA1yIvgpzq5P91n1AdzZiJ+7fbz22PwFmwc8
 4T6ZAlNT72kt/gTuBJ8L8WchhbLmGUc48pkriLOVGtmuU14bdUKCwmLjRrl97Sb0Z60g
 AIFPFIXdABh+zEc8YorIVEv6RPSkqCHXuYQxwTV/w6zQeaTk5Yf2QCk20szRD35wzOQE
 X9id5gcvku5HwbvxIpkZZPUlbT2lfWMWczVXHsypbl5HnX9QCI1be4gTIrVy5P4S5geG
 c7KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcwtvPsMI/Ao+vldXzGngDq0Cc2MTzA/m0oXjbejKZRPmoec10oQHBnhQ3V9tYfUiT8lPmkk2aE6VDIfTmrmg7EQnbkIsb7ncYvRXqlrPO
X-Gm-Message-State: AOJu0YxtTxEraRN0k08LPYZnXuj+FvV62QTiixD8c7++MfNRwebj6ZIF
 JNgJRx6fswP2mDwuVzH6o0OlaPviR75O6qqIu99p5GrEnFXMdCh5ycMujqUYGA==
X-Google-Smtp-Source: AGHT+IELVx8nj+GWNrW14grfom6LFcSIwtz44rFdKRDSOfNG3DdINnqC2cuXSkNUt4NU7HimWVkT7g==
X-Received: by 2002:a05:6a20:12c6:b0:1a2:b33b:d6e0 with SMTP id
 v6-20020a056a2012c600b001a2b33bd6e0mr7220673pzg.59.1710538659655; 
 Fri, 15 Mar 2024 14:37:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:b23e:e8dc:3df4:aa2a])
 by smtp.gmail.com with ESMTPSA id
 a26-20020aa7865a000000b006e6b5e65579sm3837142pfo.106.2024.03.15.14.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 14:37:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Stephen Boyd <swboyd@chromium.org>,
 Vara Reddy <quic_varar@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/msm/dp: Avoid a long timeout for AUX transfer if
 nothing connected
Date: Fri, 15 Mar 2024 14:36:29 -0700
Message-ID: <20240315143621.v2.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
In-Reply-To: <20240315213717.1411017-1-dianders@chromium.org>
References: <20240315213717.1411017-1-dianders@chromium.org>
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

As documented in the description of the transfer() function of
"struct drm_dp_aux", the transfer() function can be called at any time
regardless of the state of the DP port. Specifically if the kernel has
the DP AUX character device enabled and userspace accesses
"/dev/drm_dp_auxN" directly then the AUX transfer function will be
called regardless of whether a DP device is connected.

For eDP panels we have a special rule where we wait (with a 5 second
timeout) for HPD to go high. This rule was important before all panels
drivers were converted to call wait_hpd_asserted() and actually can be
removed in a future commit.

For external DP devices we never checked for HPD. That means that
trying to access the DP AUX character device (AKA `hexdump -C
/dev/drm_dp_auxN`) would very, very slowly timeout. Specifically on my
system:
  $ time hexdump -C /dev/drm_dp_aux0
  hexdump: /dev/drm_dp_aux0: Connection timed out
  real    0m8.200s
We want access to the drm_dp_auxN character device to fail faster than
8 seconds when no DP cable is plugged in.

Let's add a test to make transfers fail right away if a device isn't
plugged in. Rather than testing the HPD line directly, we have the
dp_display module tell us when AUX transfers should be enabled so we
can handle cases where HPD is signaled out of band like with Type C.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Don't look at the HPD line directly; have dp_display call us.

 drivers/gpu/drm/msm/dp/dp_aux.c     | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  4 ++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 03f4951c49f4..e67a80d56948 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -35,6 +35,7 @@ struct dp_aux_private {
 	bool no_send_stop;
 	bool initted;
 	bool is_edp;
+	bool enable_xfers;
 	u32 offset;
 	u32 segment;
 
@@ -301,6 +302,17 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		goto exit;
 	}
 
+	/*
+	 * If we're using DP and an external display isn't connected then the
+	 * transfer won't succeed. Return right away. If we don't do this we
+	 * can end up with long timeouts if someone tries to access the DP AUX
+	 * character device when no DP device is connected.
+	 */
+	if (!aux->is_edp && !aux->enable_xfers) {
+		ret = -ENXIO;
+		goto exit;
+	}
+
 	/*
 	 * For eDP it's important to give a reasonably long wait here for HPD
 	 * to be asserted. This is because the panel driver may have _just_
@@ -433,6 +445,14 @@ irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
 	return IRQ_HANDLED;
 }
 
+void dp_aux_enable_xfers(struct drm_dp_aux *dp_aux, bool enabled)
+{
+	struct dp_aux_private *aux;
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+	aux->enable_xfers = enabled;
+}
+
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
 {
 	struct dp_aux_private *aux;
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 511305da4f66..f3052cb43306 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -12,6 +12,7 @@
 int dp_aux_register(struct drm_dp_aux *dp_aux);
 void dp_aux_unregister(struct drm_dp_aux *dp_aux);
 irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux);
+void dp_aux_enable_xfers(struct drm_dp_aux *dp_aux, bool enabled);
 void dp_aux_init(struct drm_dp_aux *dp_aux);
 void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4c72124ffb5d..b0f3e2ef5a6b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -565,6 +565,8 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	int ret;
 	struct platform_device *pdev = dp->dp_display.pdev;
 
+	dp_aux_enable_xfers(dp->aux, true);
+
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
@@ -629,6 +631,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	u32 state;
 	struct platform_device *pdev = dp->dp_display.pdev;
 
+	dp_aux_enable_xfers(dp->aux, false);
+
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
-- 
2.44.0.291.gc1ea87d7ee-goog

