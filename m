Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C601A94EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0CC6E8B7;
	Wed, 15 Apr 2020 07:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E3A6E897
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a201so17308870wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTzqaDrOCjOy+NvsZEi5X1prpX7tJueFkok9mHub9BE=;
 b=Mx9WlA0RkjMk5en23zym4AnFC+pYZh1AhhzDtRTzs5ujL3cfdqJoOf1f2x7p7JSLrd
 v0eM3hSi3zGOGnOmDh9BJ/3e/GdZh7n0CGlkD7JlttcROmG1qXV0ahvaRFiN/zhFVtRG
 usYUgCqhgYzWb0n8P54/HbdisHLpkRRT7jHW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTzqaDrOCjOy+NvsZEi5X1prpX7tJueFkok9mHub9BE=;
 b=RD513ZYbRQ5ctMZcDEVHXtAxEBmagZBPROoU/nM69sHLPSI4yGgKvfI7ZSx7EA+4M9
 gd1n/AERf1MsTYFVs6XRUZvUuX8YxbLphTJ7yLJl5hwWpbWdK2xzs9huALvWN68leJkT
 rt7qdhQN00Iv1JU2bjPZ+4lnVbvjiOylYKDvBovuydx9zXDLcVolaqIWKr+9ne3vjNvi
 Cv7l/BTd4ne/Kk2TA32gN24b7ICYioLBBYvDzK0rmElrEu8wPkf5t22nvVQXfwVlvO3B
 U8IS3xjvJH/jm9/0HEd6G8IejlfFROK4oKkn2rc75OHqZAsLaokkbKcB/FetIFDarSIb
 KPLA==
X-Gm-Message-State: AGi0PubkNMpfnvJEmQaddDRF5hX0ULo79SZAOOHB3oZdNubpiQOfbZje
 3waNGzZNGBvN2de+Hj6iYBE7zQ==
X-Google-Smtp-Source: APiQypL/rUa/bFVI+lG/Z9+1ny7ZzFmAzsDUu29ROIFPLJOljCD1EUNPudrv/9KhNQCl/0Va8VL/JA==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr3823279wmf.77.1586936499654; 
 Wed, 15 Apr 2020 00:41:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 58/59] drm/ast: Drop explicit connector register/unregister
Date: Wed, 15 Apr 2020 09:40:33 +0200
Message-Id: <20200415074034.175360-59-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is only needed for hotpluggable connectors set up after
drm_dev_register().

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cdd6c46d6557..84b1d1fea41f 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1069,7 +1069,6 @@ static void ast_connector_destroy(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
 	ast_i2c_destroy(ast_connector->i2c);
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
 }
@@ -1112,8 +1111,6 @@ static int ast_connector_init(struct drm_device *dev)
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	drm_connector_register(connector);
-
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
 
 	encoder = list_first_entry(&dev->mode_config.encoder_list, struct drm_encoder, head);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
