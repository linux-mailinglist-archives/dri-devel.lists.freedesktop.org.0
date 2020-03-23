Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4718F793
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75536E222;
	Mon, 23 Mar 2020 14:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF09E6E24D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a9so12076933wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xv+IrwzuQ23kGkBFfkZ4yhYMKBg9vr4BWeG8XNXKFTc=;
 b=DFBuV/vHRlNy4uJgrHIviIKNEHIGV8DUY+m8Sf+lTTyhzMxZEKPTCOQJ6YV2BBEW6P
 /aR0KqcuCP7S7DbHXwUiuCcVeu9B/+SJ4+kFhRl4eHQaoHYLCN4Z6eWTRuk2PftIsH3z
 kRT6/M6GKtBM48YSYRBFw6eY40D4ZLZbGjffw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xv+IrwzuQ23kGkBFfkZ4yhYMKBg9vr4BWeG8XNXKFTc=;
 b=BmmAn9u1S44TGmVCJn5R/S4+Mdw8tuAS4wqZX8rU9neaCLt+b4yq2D8iZFNefjO7z7
 kQthmfeEG/Dqz/7IG39Em92Wi1flpOD5UQKiwVOqkER1PpVajMXgxwfO6kW56ibRgG4l
 EoFEaRGxig3nRyPTpCZc1wbzKUtwurW+uTiBNsZs0E2ZKagdnEcJIraBrpGiizaC3W6D
 tcZ3khgiRHOKbF8fdjoQFt3hgM9ROz6+e1Hve//zpyN9Y2huAJ4APstFAVPRX/3V0mNv
 fCSXAWCCbfr2c5pDNTI8bhG2KPIPOhjsq1q1k5RJ+8rtKhyjwmi4XGK2+5Tp7jeCtFaO
 EPJg==
X-Gm-Message-State: ANhLgQ0xZrTjIsk1vG72APY+6EU8z5ITPqSBQElratipHrQtdNyHfxYt
 1DjtfVxy/uhlUcsmZE+BcYXkG/s9tW2oSQ==
X-Google-Smtp-Source: ADFU+vszAryUzDEXodO9VeF21jcLEW9fueenhM6J2rfMAdMCTpAiCypypKtGWjmlifuRUoMyaOqCvg==
X-Received: by 2002:a05:600c:10ce:: with SMTP id
 l14mr13066649wmd.161.1584975051183; 
 Mon, 23 Mar 2020 07:50:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 38/51] drm/stm: Drop explicit drm_mode_config_cleanup call
Date: Mon, 23 Mar 2020 15:49:37 +0100
Message-Id: <20200323144950.3018436-39-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Philippe Cornu <philippe.cornu@st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/stm/drv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index ea9fcbdc68b3..0f85dd86cafa 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -88,7 +88,9 @@ static int drv_load(struct drm_device *ddev)
 
 	ddev->dev_private = (void *)ldev;
 
-	drm_mode_config_init(ddev);
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		return ret;
 
 	/*
 	 * set max width and height as default value.
@@ -103,7 +105,7 @@ static int drv_load(struct drm_device *ddev)
 
 	ret = ltdc_load(ddev);
 	if (ret)
-		goto err;
+		return ret;
 
 	drm_mode_config_reset(ddev);
 	drm_kms_helper_poll_init(ddev);
@@ -111,9 +113,6 @@ static int drv_load(struct drm_device *ddev)
 	platform_set_drvdata(pdev, ddev);
 
 	return 0;
-err:
-	drm_mode_config_cleanup(ddev);
-	return ret;
 }
 
 static void drv_unload(struct drm_device *ddev)
@@ -122,7 +121,6 @@ static void drv_unload(struct drm_device *ddev)
 
 	drm_kms_helper_poll_fini(ddev);
 	ltdc_unload(ddev);
-	drm_mode_config_cleanup(ddev);
 }
 
 static __maybe_unused int drv_suspend(struct device *dev)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
