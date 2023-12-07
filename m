Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B5F8082B2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 09:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A11C10E181;
	Thu,  7 Dec 2023 08:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067DD10E181
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 08:18:18 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d08a924fcfso5425355ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 00:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701937097; x=1702541897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZQJWnhNLnP6Awp7NjFB9t/P5znClGB7Yq+APmm7pGdg=;
 b=E0xhbU23D6O9E2W9Cji7En3TfBH1SzViHE/RGYNjNYll5o044KICYdskFXbylNb4ue
 CtVrTyol1uNge+qU9EoEiFM48AM+0qaCeYsMh9wyTBF0vA/j33X2Oz0yr3oZSiOL/N26
 7iWvhgEVS84Kn8D9huo9c1LYNDHMwC8ZF7PS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701937097; x=1702541897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZQJWnhNLnP6Awp7NjFB9t/P5znClGB7Yq+APmm7pGdg=;
 b=u3ujwu/+4hEhMYddPtn9xZB8NGWGlqtg3sj6NQQDr+S6KDTduCe3eoPE3MAgQnQVV7
 5JaR9RfOO4Gjix+lu17h8S3iwv2hXfxd4pw69rd3uakWz4T27gtwYk3cXAg4C+5xtMqm
 7epTuGHDQZrifsXNMoA6JSoWBKeduDrf5KmsAoPGfRkJqsBRn3bm4xgFEyzIteoGQ6nq
 S7CKkSwzVrMmZaQL0eA8NEIzoX82416M3iQzASH5WDZ/lC191h1e8DYXHy+lxxw2sKv8
 lYheaVrnkoGjzfTar6ZVwhHLxtukXxVdRCGCvX/aGnypukHbchkLC/uZW4TVi/0A1BXE
 6XSg==
X-Gm-Message-State: AOJu0YwredMHMa1Mx9Zvbl15jhoNaxoCo1e/VP4Oxy23uvsVJjNSr0IT
 vMp74W+ulkqBxf/kuLxQ6ivwLw==
X-Google-Smtp-Source: AGHT+IGgqFxlIC4wu2oAnuqzZtdbL46HAt+drIAs9tIBCh2pssTSR+uBR95ax8mNq1iftLTEdDOpDQ==
X-Received: by 2002:a17:902:dac5:b0:1d1:d939:159 with SMTP id
 q5-20020a170902dac500b001d1d9390159mr1890437plx.21.1701937097547; 
 Thu, 07 Dec 2023 00:18:17 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:663f:6f8e:5f2d:e06c])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a1709028c9700b001d09c5424d4sm748128plo.297.2023.12.07.00.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 00:18:17 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/4] drm/panel-edp: Add powered_on_to_enable delay
Date: Thu,  7 Dec 2023 16:17:36 +0800
Message-ID: <20231207081801.4049075-3-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231207081801.4049075-1-treapking@chromium.org>
References: <20231207081801.4049075-1-treapking@chromium.org>
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

(no changes since v1)

 drivers/gpu/drm/panel/panel-edp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a0b6f69b916f..44acf9cacaf7 100644
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
2.43.0.472.g3155946c3a-goog

