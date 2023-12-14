Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF3B8134C0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 16:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A6A10E957;
	Thu, 14 Dec 2023 15:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E5B10E1A5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 15:28:25 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6cebbf51742so603229b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 07:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702567705; x=1703172505;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HwxChGA7kEkaVI+0NazbW4JwE+2WuKPP+E6QFXGK0uY=;
 b=UHuXxLINRCvKUvzwT0ej+C0wM/AW8KF58m8aO9cpXCynGmTA87RO4n3aorLOnuk7l6
 xu7XP+FVok/8nlJDTb+M+J/nPDX/a/qjNx+QXd9XsjWH+bcQcLkMIIpZo3cXMawGVctb
 dShsMT6v1Fj+cZjNlbtWAJQubuxGzTItKMRpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702567705; x=1703172505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HwxChGA7kEkaVI+0NazbW4JwE+2WuKPP+E6QFXGK0uY=;
 b=vvaQo/txY04PoV9hf7w+iMNhPN63ueKQusC1AHjj7cGeOqMuLvVrMPEIhwt2eccaIY
 4zixXlf7cbCeXYCZklzVf3DBmOLLAnp7AxdH3eWjE+3PUcJnZmyw1aa/FOvdOaJpZg92
 tRPzX7rKAJdEisGxbjquSiUZDienxYmxTWnbfyU03ETZxguzZs5pB2jngfH07sb85vOL
 lwfMAjJKeZOZp/ODD1ipNPgtcUbVIx+Khfg7CRZqDqBSJRT+vSVAWXY7y4a2yL81hsIo
 F7yGTIXCzE9fCcvdQOHyxE5+VNjF883jjklnVVw308PUNfFgGzCGLN0ajaxCLg443uia
 Xxdg==
X-Gm-Message-State: AOJu0Yw6O+1/CBBMlqOXKshJfcDeIMmVXl0u+e8Tb96gIrzPDaw8XbVR
 +2dCFHT+owhKrDOn0Hr230bg+w==
X-Google-Smtp-Source: AGHT+IFZLcl1hSZFp0+x3DWXkuTh8eukgK9MN7dqZrZCA5EfR1Y/k6SLf/6jRNXAANHXWUc0bOhv5w==
X-Received: by 2002:a05:6a00:1952:b0:6ce:47f4:2b45 with SMTP id
 s18-20020a056a00195200b006ce47f42b45mr15186074pfk.13.1702567705505; 
 Thu, 14 Dec 2023 07:28:25 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:6530:8349:4ba8:984a])
 by smtp.gmail.com with ESMTPSA id
 b8-20020aa78108000000b006ce7bd009c0sm12281179pfi.149.2023.12.14.07.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 07:28:25 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/3] drm/panel-edp: Add powered_on_to_enable delay
Date: Thu, 14 Dec 2023 23:27:50 +0800
Message-ID: <20231214152817.2766280-2-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214152817.2766280-1-treapking@chromium.org>
References: <20231214152817.2766280-1-treapking@chromium.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Changes in v3:
- Collect review tag.

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

