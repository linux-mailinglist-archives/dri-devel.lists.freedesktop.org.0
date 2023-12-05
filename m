Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF38805451
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 13:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8181410E50E;
	Tue,  5 Dec 2023 12:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF99910E50E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 12:36:45 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ce52ff23dfso1507430b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701779805; x=1702384605;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5mNmjMPCqBbX4f2kZl/QjTxGMwPMe3/nj+TBHAFfXI=;
 b=GqXprvVvBTf6Neo5fhgyBrVRri+lozs+r3cifIwQFWu/q/RgMBSL/fhtrPqk9CHzww
 aABHejwGY5veNEnkRunFAR2h9i7bXViKUeOHOt0wCU8H3KHxMx5DIRCwq2+5/3TDIbNI
 30bHLptKWZQ3657MV1dzrSWgsZaOwU6/juykA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701779805; x=1702384605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5mNmjMPCqBbX4f2kZl/QjTxGMwPMe3/nj+TBHAFfXI=;
 b=lOsSTAJLbDr9G5c9hi5bpyRTX7N85Ay0JZnX1SIc53KJpL2gmmspYFBwP3DQDyJ8Bw
 kkS90UmHz1WtxosJhHgEtMPV3OzWt2q8HxFzNaCeZupnfEdnbxErttaH3jqTAWKaq3s2
 FpoHgylHipuyD7FDzNywc6HyXuZCNMKNh8jhj4oemITrJ8wGs52UTynqRH93+OsVjHaU
 IXAuT983aiaV0FFJGZ9zxu9bsH8u8PTeL5ug9642UIxmbs0vN5BqOghIDUHfTsAMR414
 TCFbWrGREpVwy4xmZl1gA5YUUFzJwccuu3sx7hJ+SIqPKgkm1Yunf2RpQwyqA+AfODXO
 tqvw==
X-Gm-Message-State: AOJu0YzJkMhh7Tp12SXC9wrahkMHDgvVyjMpE15EWAFNC/3FptKHK5yU
 1kvi8phZUzC6bwRtVlXmpceEyg==
X-Google-Smtp-Source: AGHT+IE/D6fPLH75eLG9HpAcEh5urre5KQHQWGFui4XsKp47sqHxc/gbp1W0L6LtW1vVgO8lr3xT+A==
X-Received: by 2002:a05:6a00:420f:b0:6ce:2731:47b4 with SMTP id
 cd15-20020a056a00420f00b006ce273147b4mr1403242pfb.20.1701779805324; 
 Tue, 05 Dec 2023 04:36:45 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:433d:45a7:8d2c:be0e])
 by smtp.gmail.com with ESMTPSA id
 p26-20020aa7861a000000b006ce7abe91dasm285115pfn.195.2023.12.05.04.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 04:36:45 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/4] drm/panel-edp: Add powered_on_to_enable delay
Date: Tue,  5 Dec 2023 20:35:34 +0800
Message-ID: <20231205123630.988663-2-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231205123630.988663-1-treapking@chromium.org>
References: <20231205123630.988663-1-treapking@chromium.org>
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
Cc: Guenter Roeck <groeck@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the support of powered_on_to_enable delay as the minimum time that
needs to have passed between the panel powered on and enable may begin.

This delay is seen in BOE panels as the minimum delay of T3+T4+T5+T6+T8
in the eDP timing diagrams.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 825fa2a0d8a5..819fe8115c08 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -70,6 +70,21 @@ struct panel_delay {
 	 */
 	unsigned int hpd_absent;
 
+	/**
+	 * @powered_on_to_enable: Time between panel powered on and enable.
+	 *
+	 * The minimum time, in milliseconds, that needs to have passed
+	 * between when panel powered on and enable may begin.
+	 *
+	 * This is (T3+T4+T5+T6+T8)-min on eDP timing diagrams or after the
+	 * power supply enabled until we can turn the backlight on and see
+	 * valid data.
+	 *
+	 * This doesn't normally need to be set if timings are already met by
+	 * prepare_to_enable or enable.
+	 */
+	unsigned int powered_on_to_enable;
+
 	/**
 	 * @prepare_to_enable: Time between prepare and enable.
 	 *
@@ -216,6 +231,7 @@ struct panel_edp {
 	bool prepared;
 
 	ktime_t prepared_time;
+	ktime_t powered_on_time;
 	ktime_t unprepared_time;
 
 	const struct panel_desc *desc;
@@ -455,6 +471,8 @@ static int panel_edp_prepare_once(struct panel_edp *p)
 
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
+	p->powered_on_time = ktime_get_boottime();
+
 	delay = p->desc->delay.hpd_reliable;
 	if (p->no_hpd)
 		delay = max(delay, p->desc->delay.hpd_absent);
@@ -579,6 +597,8 @@ static int panel_edp_enable(struct drm_panel *panel)
 
 	panel_edp_wait(p->prepared_time, p->desc->delay.prepare_to_enable);
 
+	panel_edp_wait(p->powered_on_time, p->desc->delay.powered_on_to_enable);
+
 	p->enabled = true;
 
 	return 0;
-- 
2.43.0.rc2.451.g8631bc7472-goog

