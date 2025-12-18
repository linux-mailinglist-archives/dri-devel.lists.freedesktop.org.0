Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D4CCBBB8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 13:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3658910EEAF;
	Thu, 18 Dec 2025 12:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m+sxOXiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F9610EEAF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:10:13 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a099233e8dso5175145ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 04:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766059813; x=1766664613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qOWaFXqpm74y7sdJY7lj3lPz4pEHcCsnHUa4ddlZBMY=;
 b=m+sxOXiOuoOqeCksrZaXOW+ll2fn9o6WhERLmCSB6SM4KqAiBn0TJVT/DP2Qx9MxB4
 Nu5HsNWUtslzuN8geMuMLUzfwwZKv4XiB0lxb6+uGBqBi3dbUD6+9uTnra4BGv/Cb+ey
 QJL3lwGnVrjp3iL7ma2DN6ThXRU8LJKZOd17v1xNvF2oZ33KEmSaCHBsZ8Op6dv9HUn7
 PIW2mnkFVYzaqK31xWRDYoMRLcU74ChR6ubMx/MhD4x5fPKUWSPa3aoYupTYgmZkgwso
 ZLJfKXIqQU/o7xua83BPLrOZWJafRTtun48u6eY9gx6f3sZ3ioIktdfIMZg8vYlxw3fV
 bGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766059813; x=1766664613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qOWaFXqpm74y7sdJY7lj3lPz4pEHcCsnHUa4ddlZBMY=;
 b=f4p8xAFN8srq+uozazLVB8YvKAIjI5wIEv4/VOrDYSyCB2vwjT0cApi9QM8zCvEBTv
 sP1E8sO5RyZ5Owr2YH+6R9tQa/He4+hDJ+ySWgzSDdzMjihpw/SQ2mmwVs9uyEr8b59x
 q2g2cmsLPrB7qnqnmXOrIlNH5/Yw9xdd92de7Z5VU6QY+mMQg4yRF+jBNn7hdhRe19b2
 k4MhiKxqgwLTJ+Ch4PC71g2jjSOwXorKoxLLcLdo95Tm7oXZtDl1YKuP7Oy3RxK3bQjo
 RF7hj/wkyPKprwUz1pTNSI2A9rtaIaq8az2I69WgB0r26anPf0mpW0iWx61hrnkQ1ShA
 Bo4Q==
X-Gm-Message-State: AOJu0YxVdA5FvKi3WMNWLqqG7LSFn9Pa1PUTGIG//Zn63t6EIv6qILjH
 3mvVfFNoJj/2oBSpg5JKen94B6u3PtAN8+WpwvHJ+V0Sluawmb2wq665
X-Gm-Gg: AY/fxX6uZEuk8S1cKJV+TaabkeaSsu/4vuVPr0+K6ZZQSC+pPpZaT5g/G5WboMotQkr
 5i9KIPHTBzxjfwQIumzle9ZnM+DPTRqAo54hGkQGjkzDki9+7ofVeT7addeMdSTsv09x2sMyTsD
 nO3VgPy7wPLJ2hMA4rhb3GpGDz/6fKu3RpGs+d7xC3pnEp0ef450K04zdCR+/ER3yr6n4WUoXr9
 JscsI/2fag8pkRT4ftrZvg2BT2Bv8p/ESNAq5GKwLtN4H5BWNmF9zgM5gjaB6LCHZYMr5cTBNAR
 r1pcca/8+r+//eDNNGIYveDJGQV4scmwOC55HMUxhqhtKNbJCv+GjKHzKD9i+M3CjL4R097i7YR
 +Ba4GAtTc0dCIEc6hBh7hSsGwxdXamvzjhDOVLIfrEZkmTTSDd1hXvpUQN/p2IbWPDdffU1BorS
 oXp2AbynCmJyVs7rcH+9CPb3GCqr6LZvvsvth6yVtrQwUuDJGUZfbxEoaOqvJ+AltqkjyO2v58r
 ZjgkcGDXq8NLw==
X-Google-Smtp-Source: AGHT+IFwS6OIsDwZer+0tNaVZWDLxetbvduNSu7zZktJBqOYGOtNbaVUJPhCqOoTtBYrJt56YuRJyg==
X-Received: by 2002:a17:902:e804:b0:295:96bc:868c with SMTP id
 d9443c01a7336-29f23dd535dmr215259295ad.5.1766059812744; 
 Thu, 18 Dec 2025 04:10:12 -0800 (PST)
Received: from oslab.mshome.net (n058152119183.netvigator.com.
 [58.152.119.183]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2d0888fbdsm24480035ad.32.2025.12.18.04.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 04:10:12 -0800 (PST)
From: Tuo Li <islituo@gmail.com>
To: neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tuo Li <islituo@gmail.com>
Subject: [PATCH] drm/panel: Fix a possible null-pointer dereference in
 jdi_panel_dsi_remove()
Date: Thu, 18 Dec 2025 20:09:55 +0800
Message-ID: <20251218120955.11185-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In jdi_panel_dsi_remove(), jdi is explicitly checked, indicating that it
may be NULL:

  if (!jdi)
    mipi_dsi_detach(dsi);

However, when jdi is NULL, the function does not return and continues by
calling jdi_panel_disable():

  err = jdi_panel_disable(&jdi->base);

Inside jdi_panel_disable(), jdi is dereferenced unconditionally, which can
lead to a NULL-pointer dereference:

  struct jdi_panel *jdi = to_panel_jdi(panel);
  backlight_disable(jdi->backlight);

To prevent such a potential NULL-pointer dereference, return early from
jdi_panel_dsi_remove() when jdi is NULL.

Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 23462065d726..ea975170faff 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -434,8 +434,10 @@ static void jdi_panel_dsi_remove(struct mipi_dsi_device *dsi)
 	int err;
 
 	/* only detach from host for the DSI-LINK2 interface */
-	if (!jdi)
+	if (!jdi) {
 		mipi_dsi_detach(dsi);
+		return;
+	}
 
 	err = jdi_panel_disable(&jdi->base);
 	if (err < 0)
-- 
2.43.0

