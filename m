Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01B96C06E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 16:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D8E10E7CE;
	Wed,  4 Sep 2024 14:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YHAK5Ern";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9FC10E7CE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 14:29:15 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7148912a1ebso3801673b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 07:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725460155; x=1726064955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2wagnvc93xdBl6hG/s4kAM1tDGElsqmf7qECrntbOAA=;
 b=YHAK5ErnQnDBZ5CKpmkxx+dA+7KjPl7USUnKbrRVBH/IuPBdlN8YZazF59ghI7ChNY
 jE3WD8OIUocN/Nzhysy472a3qmOM3R3fvTRqafeS1ltFdbUIPl8dIDc5lOJHaLS6IFdW
 I1b/ZWdcf8ooS3lbntmC1khbygEn/qefnjXansDPCSHc4LaNLLZ5dbudCxA1aOCg+7gM
 suhdjqsmNKOrQOO+udtCpTUOvrv4YcAzk5as8fiRU+HUewpiTo8u3bggWG96x9BGmnSd
 qiEe59MQb11tTPjzwfuOt2DQqInPdcfkNEdPf5pw2pJeGYPvfzPE5V/+YA7Q5nAjjhYh
 +ksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725460155; x=1726064955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2wagnvc93xdBl6hG/s4kAM1tDGElsqmf7qECrntbOAA=;
 b=tEO9qNNXQwc17sxb0/9Wop97Ln5z2ihsanEFzrfUHn0mJ/TSnXv10efqO0yqXQ4/rC
 x87Ma+Wgo/twdT0lOQghpxgwXj39QNlAvk0Pwf2R0SsrT5iaO8k5Na/Pt0kRqhkBKjZI
 hU4NGC6E3P/uJdKMmJaj4VqixF0fQblyft/sSmhxiYGtsLU0O1+mR8Yxp991ohrGUhFs
 BoaqM881dJtryXe2P0p7lXc/oB22mf8e2EvlodAmUUTNJnwuLGOlMF9i/d3WcWZpm1Ae
 cWS4CFf8MXkZ9Q+VUEiO6TZsbZP4nb0IR4wPQo51ov1ifFRaXc4j5zU7QZfF3YL0Vwnx
 RQoQ==
X-Gm-Message-State: AOJu0YxZhohWpQCBDqi06a6mbOCB5wldwNUo+nBeq0d+En3pTbl4uttq
 YfEGwIMNDdsMuhPzvgKDo5/01Z3HwOMY97EhZETHItgndVi+5c3V
X-Google-Smtp-Source: AGHT+IFHSl3cs8LGLZK5K6yC6s8qFdueGpXSBHVjJWHT3BmFX4+NBM+gdIg+sZFHWkmTj0niEul1LQ==
X-Received: by 2002:a05:6a00:4f93:b0:70d:11d9:8a3c with SMTP id
 d2e1a72fcca58-7173c5c237emr12770548b3a.26.1725460155079; 
 Wed, 04 Sep 2024 07:29:15 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-717785b4de5sm1663296b3a.190.2024.09.04.07.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:29:14 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel: nt36523: use devm_mipi_dsi_* function to register
 and attach dsi
Date: Wed,  4 Sep 2024 22:29:07 +0800
Message-ID: <20240904142907.367786-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Switch to devm_mipi_dsi_* function, we don't need to detach and
unregister dsi manually any more.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index 18bd2ee71201..04f1d2676c78 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -1095,18 +1095,6 @@ static int nt36523_unprepare(struct drm_panel *panel)
 static void nt36523_remove(struct mipi_dsi_device *dsi)
 {
 	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(pinfo->dsi[0]);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI0 host: %d\n", ret);
-
-	if (pinfo->desc->is_dual_dsi) {
-		ret = mipi_dsi_detach(pinfo->dsi[1]);
-		if (ret < 0)
-			dev_err(&pinfo->dsi[1]->dev, "failed to detach from DSI1 host: %d\n", ret);
-		mipi_dsi_device_unregister(pinfo->dsi[1]);
-	}
 
 	drm_panel_remove(&pinfo->panel);
 }
@@ -1251,7 +1239,7 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
 		if (!dsi1_host)
 			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
 
-		pinfo->dsi[1] = mipi_dsi_device_register_full(dsi1_host, info);
+		pinfo->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host, info);
 		if (IS_ERR(pinfo->dsi[1])) {
 			dev_err(dev, "cannot get secondary DSI device\n");
 			return PTR_ERR(pinfo->dsi[1]);
@@ -1288,7 +1276,7 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
 		pinfo->dsi[i]->format = pinfo->desc->format;
 		pinfo->dsi[i]->mode_flags = pinfo->desc->mode_flags;
 
-		ret = mipi_dsi_attach(pinfo->dsi[i]);
+		ret = devm_mipi_dsi_attach(dev, pinfo->dsi[i]);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "cannot attach to DSI%d host.\n", i);
 	}
-- 
2.46.0

