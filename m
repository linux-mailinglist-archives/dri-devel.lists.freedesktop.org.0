Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EB238F327
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 20:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A666E902;
	Mon, 24 May 2021 18:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DDD6E902
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 18:42:40 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 22so21162112pfv.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0lIj2JPS56Xp2DBaz+Q3cwfyZBcU2zyGs0Uphk2Sqys=;
 b=XO4WiNivZKpaOGgwvH9M2+upDycSqmiKS7yAVt+IclB6rTZUJNwpeIWhJ94TpGm4yF
 x4KkkGUl8A1vD0M/B3BCA7lGYO23IQsq6BIU6/6eqY7YYv3wpqZJ2uAlOcLjUO1rCa+c
 Mr7j3Aet1fQP8HUFKhf8Uv+Tw26M5HF30s2Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0lIj2JPS56Xp2DBaz+Q3cwfyZBcU2zyGs0Uphk2Sqys=;
 b=ruX5mJeAfyTOWqy2aYElMrVwUsb+JndC/yZdTFg0R3gX64kDsLWj42jQzdz7Kk9Ltl
 bF/U+PuTcRtw1HljZWURRpGbCh/TyzPHZb8qKXxI7J0tZWRlCqOzzNCTkYjRliFrGmXM
 YnzIk77j35dpUYtUUh5LugeW9lUtFVDLo0d1iXpfKGPW1Om+/QYd9wOfRv2ny3Hpt78e
 v7WHbpqWQr6pu6QbuIWYtVNSqpD6D4L+03bVRplgHFlHpRDIhz/YLg8OjxqvPhw6khxb
 +RwtlJByvUC3RW1Ig07meupvbpoa9cc8u6Sq+1K44/HajwvfH6b6SfNrGkFFtNH744m6
 /8AQ==
X-Gm-Message-State: AOAM533WE6DIBLN3tod9xEzFEq7Xx2VM3ImPZAYKFQsbfRJPJn3wFgWr
 CYyavwhTrp3/QgjUhkvpHHJxdA==
X-Google-Smtp-Source: ABdhPJyEESSJu6/xp/AD92L7LjPu5dY5wWdr0BidRyr6bfpQDMyd3WRLMHc+/WXauzF0qSpZA12prw==
X-Received: by 2002:a05:6a00:1996:b029:2e0:9d87:a547 with SMTP id
 d22-20020a056a001996b02902e09d87a547mr25586981pfl.12.1621881759691; 
 Mon, 24 May 2021 11:42:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:3e9e:4cb3:3e0e:f4b1])
 by smtp.gmail.com with ESMTPSA id s2sm155655pjz.41.2021.05.24.11.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 11:42:39 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/panel: panel-simple: Fix proper bpc for ytc700tlag_05_201c
Date: Tue, 25 May 2021 00:12:26 +0530
Message-Id: <20210524184226.3064621-1-jagan@amarulasolutions.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ytc700tlag_05_201c panel support 8 bpc not 6 bpc as per
recent testing in i.MX8MM platform.

Fix it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9be050ab372f..6f4151729fb7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4164,7 +4164,7 @@ static const struct drm_display_mode yes_optoelectronics_ytc700tlag_05_201c_mode
 static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
 	.modes = &yes_optoelectronics_ytc700tlag_05_201c_mode,
 	.num_modes = 1,
-	.bpc = 6,
+	.bpc = 8,
 	.size = {
 		.width = 154,
 		.height = 90,
-- 
2.25.1

