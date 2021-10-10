Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877574281B1
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 16:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D147E6E328;
	Sun, 10 Oct 2021 14:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20D36E328
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 14:15:52 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id a10so5573033vsr.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 07:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=izKUqplOlmWkgjpjFs49PGSqbc2h9R8tIH8Xtb4XJNg=;
 b=U+4fxzpDjqHua+VWNZJOxIq1Wz2MZQ5R/56ea7sju/7qwEJbL+KW29uRGo+8510jUd
 WJIoKHCARhEtMivL8LnJVmis8eVI/qXccbyqGmI+J/PY+hZuiPA/3sXlgzpcJDGtEOK8
 75mueYH3SlKlYMmPRU4gv6Zu9WMqZDuCC9ngEJ50cRE2jUezh7aWVuD3tbSGQ2+xdQw9
 6+UEToDwEhEPJmBnYnbUVKxZ1x97vntD1FuiDvwKfyZNn0T8vwQNpSQ3Omi9Xza7yMnJ
 5G5ySujNyPNUtmKLw13Qyx4pQ2nu79niOu0rjxsXLtz9bIJjboafMP7QHHQsJmRrN9Dz
 Glsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=izKUqplOlmWkgjpjFs49PGSqbc2h9R8tIH8Xtb4XJNg=;
 b=WX6WoW9iq4ipvVGcGU2vyVX4hmx7Chs8hSik9MVAY60od7bQyjEZieVhNqmvQTb2gj
 +2sBxE2ygjHYdkE+z/ei01GXgewPIhsn76vY2d5Tu5aoxNre2KMcS9E2Fvbf0vdFlTUc
 II+45SbDdHBiGk4EMFkz80qukRdx85oM5y7trJlrPAyIEUjdjc8xNh2p3CeecOpMfAZg
 cgFST2kXccD5coAaHl4IsvBqQiZESaYnPbscNs86YwA5mIKXftPU04UACeamAawOhY8u
 ze1QkJtXTDBSbhNEoSYGxEMciGQiiEQhccvI3Rwi14UDGk6tIhUcsOsh+A/INQ4TKkM7
 KYkw==
X-Gm-Message-State: AOAM5324ukTvjqYduJaetJ+u/FHHTETu20IljE9p7Nv1B4vLDd8Qn2B1
 onCVZZHTt64oXgySF2PrrHTFiw5HGyJNWA==
X-Google-Smtp-Source: ABdhPJzXalRyY+6yUjIXEiHBORgYlLEMNVnNyKkBrHP89Bjrw4g20ki6kJLfTkpKxXz0V6+BghAcsA==
X-Received: by 2002:a05:6102:f08:: with SMTP id
 v8mr19614984vss.60.1633875351140; 
 Sun, 10 Oct 2021 07:15:51 -0700 (PDT)
Received: from fedora ([187.64.134.142])
 by smtp.gmail.com with ESMTPSA id s81sm2093208vks.55.2021.10.10.07.15.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 07:15:50 -0700 (PDT)
Date: Sun, 10 Oct 2021 11:15:47 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: replacing drm_modeset_lock_all for
 DRM_MODESET_LOCK_ALL_*
Message-ID: <YWL1kxAbsq26//kF@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

As requested in GPU Driver Developers Guide TODO list, replaces all
drm_lock boilerplates for DRM_MODESET_LOCK_ALL_* helpers.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 17f44ffea586..71b7ff7b7dea 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13466,22 +13466,13 @@ void intel_display_resume(struct drm_device *dev)
 	if (state)
 		state->acquire_ctx = &ctx;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (1) {
-		ret = drm_modeset_lock_all_ctx(dev, &ctx);
-		if (ret != -EDEADLK)
-			break;
-
-		drm_modeset_backoff(&ctx);
-	}
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	if (!ret)
 		ret = __intel_display_resume(dev, state, &ctx);
 
 	intel_enable_ipc(dev_priv);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	if (ret)
 		drm_err(&dev_priv->drm,
-- 
2.31.1

