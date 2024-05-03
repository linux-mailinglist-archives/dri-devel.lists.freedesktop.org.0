Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF33D8BB600
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8AB11329E;
	Fri,  3 May 2024 21:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hH8S4p13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C53D11329E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:24 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1ec69e3dbe5so1226175ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772242; x=1715377042;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HRQb/I07011T3t9lbY5bJjPOFJ2fx1sx6agjLTdJWzE=;
 b=hH8S4p13+Dn4V9sfyMDsVrglGLUJQPwcrHqpseImtf/83hQxNVDtrZ1JhmL658m3kc
 UDgEcVz1QTHTV7/s0vxl0o1ny3g9Xx0ih+NKC4fQZYtcgBT8EsXSvzE+rxx09TubIQgb
 LViGg5ApkJWu5jd6WbnOSX/Fgsc8BjGzJJ644=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772242; x=1715377042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRQb/I07011T3t9lbY5bJjPOFJ2fx1sx6agjLTdJWzE=;
 b=Owpgg3aDHtyl1RiwWRxYUWA8CmJLnd93gbY1QBLK2rJk3kmUdVT9C48tT86+g/VMbV
 OA6tzHOiPE2J/AhV+k+zkTNPz1sliAFGujtNmhN1f3YAEFW2BTKpyO0I1XPoV5jd/e9c
 Gfs52VfHllVGrVQOqq+5buTsAIxsU5vsRmQdnwnaaxcgYd7aNN8qtE1ucnY5OIbmU1sb
 8PL9gKPN6F6zyyEyoZl4u2if8B4pBDRi9YsCruM/KFSLnN+kGCJrh+7yE2bSS976Q5Uq
 hIs8p+UK5+aHM033lVD+Ku+dbH3NbFOfSQVZSzqvNuE5GO/itNFgBCWHHocEEHvPeI2j
 fe7Q==
X-Gm-Message-State: AOJu0Yz9zqEjbRyVLgBrJPf71fhfGbYRFU4Mprsu2poUQq6elJGmcLWc
 MxKuZYtsv9U0e3tVO8TuRehpmITQawic96+5SaeauFBBKvX9CacbQlfLpbt6eqvGCun7pnmGdMQ
 3hw==
X-Google-Smtp-Source: AGHT+IF6CDvqfSrYxn7iKNnjnE2VAXasLzRdp4BnWV2DoDu3VKywSCP3Ny+zWphkbKiYpV8TR9pS2g==
X-Received: by 2002:a17:902:cec7:b0:1e2:817b:460a with SMTP id
 d7-20020a170902cec700b001e2817b460amr4432991plg.34.1714772242613; 
 Fri, 03 May 2024 14:37:22 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 25/48] drm/panel: samsung-atna33xc20: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:33:06 -0700
Message-ID: <20240503143327.RFT.v2.25.Iaeacccf98e6cb729b8fc3a782725769cd66812ad@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by Qualcomm boards. The Qualcomm driver
appears to be correctly calling drm_atomic_helper_shutdown() so we can
remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index a322dd0a532f..9a482a744b8c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -327,21 +327,10 @@ static void atana33xc20_remove(struct dp_aux_ep_device *aux_ep)
 	struct atana33xc20_panel *panel = dev_get_drvdata(dev);
 
 	drm_panel_remove(&panel->base);
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
 
 	drm_edid_free(panel->drm_edid);
 }
 
-static void atana33xc20_shutdown(struct dp_aux_ep_device *aux_ep)
-{
-	struct device *dev = &aux_ep->dev;
-	struct atana33xc20_panel *panel = dev_get_drvdata(dev);
-
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
-}
-
 static const struct of_device_id atana33xc20_dt_match[] = {
 	{ .compatible = "samsung,atna33xc20", },
 	{ /* sentinal */ }
@@ -362,7 +351,6 @@ static struct dp_aux_ep_driver atana33xc20_driver = {
 	},
 	.probe = atana33xc20_probe,
 	.remove = atana33xc20_remove,
-	.shutdown = atana33xc20_shutdown,
 };
 
 static int __init atana33xc20_init(void)
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

