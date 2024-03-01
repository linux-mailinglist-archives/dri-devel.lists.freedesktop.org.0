Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5553E86DB59
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 07:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6504E10E69C;
	Fri,  1 Mar 2024 06:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="UkjgdR+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12CD10E69C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 06:11:48 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-29996cc6382so1332693a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 22:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1709273508; x=1709878308; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rr3q7FsdLCaRHkXKKCZsUMF6OYrj2cJelo1MSVgbjk0=;
 b=UkjgdR+w6Lt/IJB22ZVUYWH6l9EeYyt+5k+kvcvnjAOKYLRPTrjpm+r7OHXS9TWRmu
 Rs9EwP3kMKXwS5stIA9RAZ+GixeAk0Qq0vm/uqGZMllIXyXA/CPhZO5bd2YKiSJYx6xd
 zcv8FsbluKww/tmTIgRr0rC/nfa+LDMzNeRsPVN2FzKqfYMIHUISC8LvqA050GCN9vVb
 kBwITETvns9SjxNVfAIxNCHgXQSUZtzOl516hBzbYZPzaLY5kivhgzBaOLecQh0GqPK1
 4uNGWDIS0pgmLaQki9m0eAg6l3xHxxl4TdXcVUURDpfpyqG5TZlONUVsnF8GuXR1JZPm
 5EKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709273508; x=1709878308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rr3q7FsdLCaRHkXKKCZsUMF6OYrj2cJelo1MSVgbjk0=;
 b=BxrTztSiuOxx4U32VHyKHVzVzYFk4Ebmfr1jFkDuMSdzBKjFwz0suGzlWh7/fDBsDT
 QYFt+5vqh8nzsi8k9AxFzwUykwCDhnpiHiQpVkwWY89u5T7Qza0c6w1mnjJUj0fnuoec
 ScJk8GEP9VPQcz3XMn36PQoYXf7FcCYOUtuYma5Bw/eK7B95hpjRrWEFGO9tfFXvSeiv
 wQK9iPJjf4hIY7TgRViaAksVEEMr/gXdGSbspalKl3O5/C9dPyvNcQ0x6G5WkCP+sPfi
 H1LalzZh0TaSHCiLOnbFumWSUiNHh6W40TR3BA0Q3hPMO8zGhEu3TrfjgA2pP3MIY/wT
 xCKg==
X-Gm-Message-State: AOJu0YwssXcf0O0ISQJLAqlBwtW5KdAKfpVuxSqYDLDIW2Iwpsl6ZFJ0
 b9BnTsk5XoGxXHbEXxZKMfrCDOCsyDQx1QVaIMKPi0ncrpSgDYHWCKPHAXhM/xw=
X-Google-Smtp-Source: AGHT+IHauwRo1CPioT0EvuRk51QDIG/BoMYAzEg0M4YzOYJ0ErvD9wXy45DaO7v4Ou0TWGDQ6KMw9w==
X-Received: by 2002:a17:90a:fa98:b0:29a:8b5a:892a with SMTP id
 cu24-20020a17090afa9800b0029a8b5a892amr760942pjb.39.1709273507844; 
 Thu, 29 Feb 2024 22:11:47 -0800 (PST)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a170903110700b001dc9893b03bsm2543965plh.272.2024.02.29.22.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 22:11:47 -0800 (PST)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, hsinyi@chromium.org, swboyd@chromium.org,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02 panel
 HFP and HBP
Date: Fri,  1 Mar 2024 14:11:28 +0800
Message-Id: <20240301061128.3145982-1-yangcong5@huaqin.corp-partner.google.com>
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

Fixes: cea7008190ad ("drm/panel: Fine tune Himax83102-j02 panel HFP and HBP")
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

