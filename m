Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLIyOjmJkWnHjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEEC13E503
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BDF8911A;
	Sun, 15 Feb 2026 08:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nw5nCpcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE0910E355
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 08:52:04 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b8f9b5240a2so318131466b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 00:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771145523; x=1771750323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RPLzZkKhoMJxvVbAHnoa/psDCihakgsM1L420pgMh/g=;
 b=Nw5nCpcScpX1f/4gq7ifE08w+iyQxfUDMZatrXdqr7FUMv1cXsT9RtNZdCp95NY4MM
 4TcMoOyE1B4yROSdvdD7ZTzHt7ejOMmDALvNhIhMtUgq5IbwZfgl0UxyMU8+/TlzZ9da
 vArHWmOAdieD7gtFvqaubo5L7yGRUz8MLi/hD6e2eyAzM3WcYP3hupjfyG7t7hM0yzbS
 EjNvmHOpovaeAK+8xPclbKJg6ls4DF13UTjESHir1fwP8E5uWzvW+gWWTl/uX7sAjBH+
 kpAG5gLzwcAiBOgKD4lb1oDDwrKjZxMhYB2iD9XdwB2nMIvY0OsQ0MennEEA6wqUHz5a
 reSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771145523; x=1771750323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RPLzZkKhoMJxvVbAHnoa/psDCihakgsM1L420pgMh/g=;
 b=dHSUw87fyABQFF9qcFK17OwakjCI/HDaESjeGLqPF/hCElwdpqq+wOV9BRI34aQ0H/
 00GzGp2bWGl7TU4NjZa2hf+UoqPR1ykf4rdFtcZD9ftq7rdNqfgE2kOAZicwsc1qnsC6
 oNv0c/xRSfbho7B0zxrK15KfYNc+wbGpHIbjlMLPJVGyRpQ77y3JemlPJNsKISuoWJW8
 oXqt6wUhP7mRJi9QJYAg6pITi3JPjnZIF+IaNQLiQ39ZkWrgyoN6TmpSYip2uto+8HXj
 91fq/btLAhlQ6u2iFS/IyAkB+2520jgaNjBf6U9i7G4sjGYPFL+DdZ4sGRy9GseRMhDl
 Qqvw==
X-Gm-Message-State: AOJu0Yyrvq30AqwUC3ayOQVCWjdFx1LKJa/xh6hpt6gN+hls0c3lzXkC
 HEOyRX/sNTfPqsjaayibqKxWWLoBa84PEKKMHDgaWQLRQTVZN5Sz2RwlYOtRvQ==
X-Gm-Gg: AZuq6aJVmoBnexKoU+7T3SRN0zIlRxbSu4XTfN+Q7aaR1SUZRTbkDDg+3qqxPhhWAPh
 4ZBQOhXxSLGvVNs/R+gaCzbxwVYE5PCbvVnPNu8BpD/Txg+8kY32Zf9m9Rhr0Abcnqu/ggA7cMq
 Xik3nL8szE9a9uWsItnt5+vVyKCkm1u57ISFVbfm4qPDliOkeLGegZaFfXsFQ6zeJS+3K30pV1h
 99kGJbv5hMNsJNuV4DBjvuD2e3PLRdOsMQrPvEEmEM+ZByRzu/qw6Wf3HtoZXljFeB2AYmWaLPa
 a28GJq5MYLKpk71GyH6/G1Zg6NL5qHhmc0rKrA1b5nmkeLhX5u+GAxiHv7qmw2ZOELpuHT09/b8
 bAN2PD3WSfFx4WgViggcM01j9yZLkPqPGRXJ0cTBQrCPoVGh4+6CF6e4w9RyJ5gnx/PeZuoiuik
 29uzyU3twZoEgo
X-Received: by 2002:a17:907:1c21:b0:b7a:1bde:1222 with SMTP id
 a640c23a62f3a-b8fb4672866mr369855066b.63.1771145522817; 
 Sun, 15 Feb 2026 00:52:02 -0800 (PST)
Received: from xeon ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7629b63sm139799766b.35.2026.02.15.00.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 00:52:02 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] drm/panel: r61307/r69328: remove redundant checks
Date: Sun, 15 Feb 2026 10:51:37 +0200
Message-ID: <20260215085140.20499-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215085140.20499-1-clamor95@gmail.com>
References: <20260215085140.20499-1-clamor95@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9FEEC13E503
X-Rspamd-Action: no action

This is now done by the DRM framework itself.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 10 ----------
 drivers/gpu/drm/panel/panel-renesas-r69328.c | 10 ----------
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-renesas-r61307.c b/drivers/gpu/drm/panel/panel-renesas-r61307.c
index 45afa44af114..2cc3bd66d6d4 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r61307.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r61307.c
@@ -35,8 +35,6 @@ struct renesas_r61307 {
 
 	struct gpio_desc *reset_gpio;
 
-	bool prepared;
-
 	bool dig_cont_adj;
 	bool inversion;
 	u32 gamma;
@@ -92,9 +90,6 @@ static int renesas_r61307_prepare(struct drm_panel *panel)
 	struct device *dev = &priv->dsi->dev;
 	int ret;
 
-	if (priv->prepared)
-		return 0;
-
 	ret = regulator_enable(priv->vcc_supply);
 	if (ret) {
 		dev_err(dev, "failed to enable vcc power supply\n");
@@ -113,7 +108,6 @@ static int renesas_r61307_prepare(struct drm_panel *panel)
 
 	renesas_r61307_reset(priv);
 
-	priv->prepared = true;
 	return 0;
 }
 
@@ -175,9 +169,6 @@ static int renesas_r61307_unprepare(struct drm_panel *panel)
 {
 	struct renesas_r61307 *priv = to_renesas_r61307(panel);
 
-	if (!priv->prepared)
-		return 0;
-
 	usleep_range(10000, 11000);
 
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
@@ -187,7 +178,6 @@ static int renesas_r61307_unprepare(struct drm_panel *panel)
 	usleep_range(2000, 3000);
 	regulator_disable(priv->vcc_supply);
 
-	priv->prepared = false;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-renesas-r69328.c b/drivers/gpu/drm/panel/panel-renesas-r69328.c
index b40bfd702fac..b5fe127634ae 100644
--- a/drivers/gpu/drm/panel/panel-renesas-r69328.c
+++ b/drivers/gpu/drm/panel/panel-renesas-r69328.c
@@ -33,8 +33,6 @@ struct renesas_r69328 {
 	struct regulator *vdd_supply;
 	struct regulator *vddio_supply;
 	struct gpio_desc *reset_gpio;
-
-	bool prepared;
 };
 
 static inline struct renesas_r69328 *to_renesas_r69328(struct drm_panel *panel)
@@ -56,9 +54,6 @@ static int renesas_r69328_prepare(struct drm_panel *panel)
 	struct device *dev = &priv->dsi->dev;
 	int ret;
 
-	if (priv->prepared)
-		return 0;
-
 	ret = regulator_enable(priv->vdd_supply);
 	if (ret) {
 		dev_err(dev, "failed to enable vdd power supply\n");
@@ -77,7 +72,6 @@ static int renesas_r69328_prepare(struct drm_panel *panel)
 
 	renesas_r69328_reset(priv);
 
-	priv->prepared = true;
 	return 0;
 }
 
@@ -142,9 +136,6 @@ static int renesas_r69328_unprepare(struct drm_panel *panel)
 {
 	struct renesas_r69328 *priv = to_renesas_r69328(panel);
 
-	if (!priv->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	usleep_range(5000, 6000);
@@ -152,7 +143,6 @@ static int renesas_r69328_unprepare(struct drm_panel *panel)
 	regulator_disable(priv->vddio_supply);
 	regulator_disable(priv->vdd_supply);
 
-	priv->prepared = false;
 	return 0;
 }
 
-- 
2.51.0

