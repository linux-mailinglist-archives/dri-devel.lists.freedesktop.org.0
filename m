Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF6B147D2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 07:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB45610E1C3;
	Tue, 29 Jul 2025 05:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="GTZC5D7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E594F10E1C3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 05:44:47 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so5643042b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 22:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753767887; x=1754372687;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cz0hAfmTTvl+76x/6A3khLDSp6/1Q/+pHFEJNnO3Rw=;
 b=GTZC5D7JhBLnBO7PPDmbtuSDkFjMGg2hYK+n6DyGCD5xLi9Q/fUPhVVVPprWk4qq0i
 Xm+YSL0Wmxvk9xAvnVNl7cHWXr3ylJRJXh6K4KXeC/Mh5D/0N6fld0yS+yA9Alq/cO9R
 eXv9MbyhTSnLeddHLnCtn3UNeaoeqgkzCn5+sRVHBkAkj5NSLsApRjaec8fYML4dmd/p
 MAt3ttbshgCQ2uCNsdwuRJmtkI1vQmhesS5n8boYilXZ/a5sv0U+jsZRFn8h1yQvRRl1
 gbVQvgmx478wlyG7L7BspuKsuselRnvupaNT0xlRgnRpObPNKwZcokLDJr/uVe6Htu+2
 WwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753767887; x=1754372687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3cz0hAfmTTvl+76x/6A3khLDSp6/1Q/+pHFEJNnO3Rw=;
 b=dubi6WIPs0gne2A8K2DshulbaLJBfVtWX9uFsSXQTYLjCgbK9OsSd9uBrWqOlrjMFD
 nrym830Lmkidcg3KkgzcfcydqGBjlL2OYEwSo/QPlgEJ2fhcABPVK0mdFgQOco0yRBMW
 NEVzWlI1YhC3Z4SoLvjUnuC0B7csSpvUqp43HTJEA5c9x4D2ymM40cAbPxqXfdA+SS++
 nfW5qbszMKyOzzIVIkLkuEBEr1Pu2fzdOgeog8YtJDigz+FlRSmC3M4Vcalmh8vtQHka
 ibYPHOLuEL0TbfXEVdnMNOWDk54e3ct74s5zH3dCgECI/sfPgdiQckfyN1cmfVrn6M1+
 ktGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdA7n8+VFjJQsKdEO/L9HwcYU7MVI12Va1NvVMGxdzr8yh6aPmlcWQF9YkncdTqusWhWea6JexOeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeRkKiW2TBlYwtSGMmLSH9pyRde5JbVEUfsRONv/gLPnm1jYfm
 sTW3UTaCEnFBvD9ajljgKHIjKMl4K/gxDRh1PtN9/FvP7wTRZjBfucJn1PIc4DE186Y=
X-Gm-Gg: ASbGncuB4gFhVUZPa0IjMMQqIy9ELlhzLFoTk+3N7TOYZLR4lpkzkg6v5uZ3gOTMcD5
 lTx06TDktFKmBkkePdZ2y1PQd1zEZyLh0N3fCVQBRcER+kdbkjcKTC8xeyp7b3Uxoh9cNF0mg5T
 ehhSx+dEGWJD/XzAmePnyRMzwLBIWINBv3OrTEqewKlO4pCcTy5jKoV06jP6hE/nGCjIV8fBaoB
 4aH0vd7LEh20EPMkUGoCp+/N9EeiqhIGw4UwlV4GpAq01eZ95NMyQqivYpJj58eGQ8/iY72dJdV
 5/nrgueIH+dKy9MOrzr9/Ci/IeXuJ1bA3z4shZklA0cV3FxarwkRjETd776zD3HW5xLHbKs7QGB
 imomjVHWDV1WhFjSDkLA2Vy1/RB3UfOCmn1tRHaiRFWZ4lnWqQRIUE/L2Q3g2
X-Google-Smtp-Source: AGHT+IGah/K2Kf1bDWtenETiFySO8an4FDCFWmr6N2dAeClkfyN4gd4Uk2XWExkSGq4VfY6iG4VPBA==
X-Received: by 2002:a05:6a00:2e23:b0:742:b3a6:db16 with SMTP id
 d2e1a72fcca58-763377f25f6mr21242667b3a.20.1753767887419; 
 Mon, 28 Jul 2025 22:44:47 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640872a500sm6972462b3a.22.2025.07.28.22.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 22:44:46 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 1/3] drm/panel: novatek-nt35560: Fix invalid return value
Date: Mon, 28 Jul 2025 23:44:33 -0600
Message-ID: <20250729054435.1209156-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729054435.1209156-1-me@brighamcampbell.com>
References: <20250729054435.1209156-1-me@brighamcampbell.com>
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

Fix bug in nt35560_set_brightness() which causes the function to
erroneously report an error. mipi_dsi_dcs_write() returns either a
negative value when an error occurred or a positive number of bytes
written when no error occurred. The buggy code reports an error under
either condition.

Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight handling")
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 98f0782c8411..17898a29efe8 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -161,7 +161,7 @@ static int nt35560_set_brightness(struct backlight_device *bl)
 		par = 0x00;
 		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
 					 &par, 1);
-		if (ret) {
+		if (ret < 0) {
 			dev_err(nt->dev, "failed to disable display backlight (%d)\n", ret);
 			return ret;
 		}
-- 
2.50.1

