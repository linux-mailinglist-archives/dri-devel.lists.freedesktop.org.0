Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A4D871253
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 02:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51D61127CB;
	Tue,  5 Mar 2024 01:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="muVfPBsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AE71127CB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 01:26:17 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-21fed501addso2945313fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 17:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1709601976; x=1710206776; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FCqXLrmsXLG2D4x9zpckaAUzUAFfK9PrDtc1e9Xqif0=;
 b=muVfPBsjNQHx9mbYLD38LnuFl8t7fjuBpKz5bjmcurhFsBwyjAzmXJOm0ef1L15p3h
 zIq77WVaG0QM6KKQBJviF47oXnzvnTBbqg1iGff+4bHQNlWPhckfINkYJQXWmBdvhg2m
 GTTp7/6gD/7r5q2j9xatsJot3owyYGf2rlEF3vo9HNi0L1ha26pgn1Yhz7jAg8liWmF6
 qbrO67oky85Hg2KOuv4O/kcJ3ZtVbe/SAMXrT00XYuGm4fmRnncq6EB2C9U7RiGow+y3
 /MgMFC+ZfsTW5vcjJ3hwTs6V1vECUp7e028A1yRjZF6Pj+R8367CrgcB8irMPTZjPfFB
 icnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709601976; x=1710206776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FCqXLrmsXLG2D4x9zpckaAUzUAFfK9PrDtc1e9Xqif0=;
 b=msb/8sCKMxJ8m8zTHbzufh9X4zal9EVkwFwIbiyZHVoMoAHgG0A75i59ug42qWboho
 rCxSbct1ImiZZWnHU6PXQ4kl4Fs4cHd1GnF0TuPVL4oAN+MOD7zFR4TUi7LBof5H1ivO
 SECiytak5U0Ukd75JuRe5ZtjcJFdYKo3yQeIGNjokfLCacYjIlTstq7w/ViVp7PLlS5a
 wJLaT1mt33uh9z5y3pjih0+sMpRTIFrFoQeQp6DIr7Kml70CjDi2jFF1v+W+HGTgbslL
 SEELguGNkCeipeHsN2AFPbINc9SVK1/BodjOYAi3AP6bCm7iD1GSKgYjKaqSBbWWgDlq
 kPXg==
X-Gm-Message-State: AOJu0Yz4dk5aiSQfgwAwlW7IM0C7IpyrD4BzPGyokspbJ61WgR6uUYQb
 533EZYz6L+YFCDBSpSU3n0wQ31ZsANUX/tKxgvEbUtmFyg/lWaNH+nPGCcSrCwU=
X-Google-Smtp-Source: AGHT+IHyQxOyfE25xAVDnFGbiegMVyflG/2eJe8BkB+GsFEu5dvJBtmADvmtxwigO1e3MzoCQL1vWw==
X-Received: by 2002:a05:6870:6c12:b0:220:c885:b817 with SMTP id
 na18-20020a0568706c1200b00220c885b817mr495468oab.10.1709601976584; 
 Mon, 04 Mar 2024 17:26:16 -0800 (PST)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 ka16-20020a056a00939000b006e559c41679sm94655pfb.2.2024.03.04.17.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 17:26:15 -0800 (PST)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, hsinyi@chromium.org, swboyd@chromium.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH V2] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP (again)
Date: Tue,  5 Mar 2024 09:26:04 +0800
Message-Id: <20240305012604.3869593-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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

The current measured frame rate is 59.95Hz, which does not meet the
requirements of touch-stylus and stylus cannot work normally. After
adjustment, the actual measurement is 60.001Hz. Now this panel looks
like it's only used by me on the MTK platform, so let's change this
set of parameters.

Fixes: cea7008190ad ("drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02 panel HFP and HBP")
Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index bc08814954f9..0ffe8f8c01de 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1768,11 +1768,11 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
 };
 
 static const struct drm_display_mode starry_himax83102_j02_default_mode = {
-	.clock = 162850,
+	.clock = 162680,
 	.hdisplay = 1200,
-	.hsync_start = 1200 + 50,
-	.hsync_end = 1200 + 50 + 20,
-	.htotal = 1200 + 50 + 20 + 50,
+	.hsync_start = 1200 + 60,
+	.hsync_end = 1200 + 60 + 20,
+	.htotal = 1200 + 60 + 20 + 40,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 116,
 	.vsync_end = 1920 + 116 + 8,
-- 
2.25.1

