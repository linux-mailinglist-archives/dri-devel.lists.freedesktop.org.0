Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41061726AB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC54E6ECF0;
	Thu, 27 Feb 2020 18:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CA06ED29
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:16:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c84so408507wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HAoa+ReMwHomgBUwnpPQde3KSJuaKiY678ziXw+Di+w=;
 b=cakfD6r55fCvzGarKFBqYglf8FTssyC3z94iBfMxX+RPvDStBq4cJ6PQluE3NXoaOe
 Jto68nza+PDrdJJgHDwMNDtBeDYMu5ZydgCkKAqOm/u7XZcdUZbInE47pFHWWth83QYN
 USDSLZ1mGj4L2n8QFTT+064FlhOP91dlGGxyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HAoa+ReMwHomgBUwnpPQde3KSJuaKiY678ziXw+Di+w=;
 b=TJYJAVwaFPH8aSb68bHJUFRzjQEqPzfhz2FwxFCH+aOz1TqNfFSracJBSPknMSgMH1
 ueLqJLZ+S+UTd9lnWUHQfdM5RY+Zjxex/rrZunoAgHT83rR4v5X3UoABgm1DIRUnHCkl
 2Egw66cx0P7LqnGu0GzOmyOwqSRz9D8Swrchn0Kcd+o5REqmkCM4cC86u5Cfbo6eO1v/
 XklY4rg/ntz5/ZV/CUMBo0NfIBTcGoRVBnRZbRkqhEDidnch1dDRgJRlrmnq76LKINvw
 Wf2AqJAnwgvRtk4LljNpdbdnazNgpKYoU0LXlxt3oHAk/NieZmkvtAF8iQSvbmuFx6rk
 DEMA==
X-Gm-Message-State: APjAAAXwY1iHXznBNNM1WqWh067QZe4AkN0dBTbaoEI1c/FpOjrwtH+C
 +SiQySN48BS/KwXF+WVtCfzKoPMZwqY=
X-Google-Smtp-Source: APXvYqzESsriBDxrVIZJy4KqipgF40cfCthLA8Ed/cuXHvWibnJy7wBKDwRSLha8t+4ho2lGul0IBg==
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr15585wmf.101.1582827377964;
 Thu, 27 Feb 2020 10:16:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:16:16 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 38/51] drm/stm: Drop explicit drm_mode_config_cleanup call
Date: Thu, 27 Feb 2020 19:15:09 +0100
Message-Id: <20200227181522.2711142-39-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, m.felsch@pengutronix.de,
 Yannick Fertre <yannick.fertre@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
index ea9fcbdc68b3..5b374531dd8c 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -88,7 +88,9 @@ static int drv_load(struct drm_device *ddev)
 
 	ddev->dev_private = (void *)ldev;
 
-	drm_mode_config_init(ddev);
+	ret = drm_mode_config_init(ddev);
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
