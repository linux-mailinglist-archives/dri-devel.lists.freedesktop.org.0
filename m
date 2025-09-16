Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67F3B7E32B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B7410E80F;
	Tue, 16 Sep 2025 22:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IlarMRCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CDC10E039
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:22:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-46070cf4dc5so2355135e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758032529; x=1758637329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pl1jcFzXvRWCuO/5MhdLryyBckGIL24XMYEjQYGJmG0=;
 b=IlarMRCVuUsfZxYLzP72HQ2HmvLQG1cr5p9s5Qh7JiUU0xVtb6j5GD8UlRwfz8TqNs
 z5UK2euTP//Slq7XN3jHw0S4+he2yka+GgXaeYo3SrvcPESMeba27mcpiUuipbGolhk0
 QfEHPOqxmI+5anVfUfUyHxW6aTnd8b+ICavzU2L6giS6FnvPPDREYVj9vsEBP6TEp4vb
 mFZvQ4//LBxH6vxvqUB7pQzncKxIkYU36HRN1OMK7daH+NNp3rbQfKljjYO9z5j+wp+Z
 ZBFY/orjUVur5ZKHqmjQF+fE6aD3Bvwuno+H9sLu837aDMv6lUngdMSiIpA1NyyDYkAe
 ojvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032529; x=1758637329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pl1jcFzXvRWCuO/5MhdLryyBckGIL24XMYEjQYGJmG0=;
 b=nJ78efZgY18Jmrxs6kVqHlSEaTM8nebdzdXbpsBvyQUE8U6ta4sK8tCSQg6HIK5txm
 WWNjDJn+KSt/tMEgEjzvdN+Bbou7MjJGdy0jTtPvvP4P1KC6fxu7XlFqBsMFF7IVDB95
 oc3/9Cx4ScXZoIKklzwC9VFSfkgiMOd7v+FHIzI4VS9thfJYhjNFN4C18TvrCNlpdJpy
 KzyIpardyxvrzgISo77e398envssJU231MSf3QB90xFfd2Y5buymMP4IdzVvbHhQmNhk
 NRhhqy+/Hgk6TX/nQETm/igbEKsZeIHgVJOMae7d0J4qtjJRoQJTlYN+XZ/Zh67c5GU+
 H/zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXqKgxJc9wH/jTq5NFOsbXHkbhCREAuzjQVBF4yuem5WKip9qP5NdSNSV5v7gZlGYuy0HPoit7kZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu54BnjCILh9mOOxmiPALs7sNg0wFsxIrL//A56BPX+G6QvKPK
 Pd9HSDQTV+K+g2ZAFE1osjkcLhlN6PBkUujrYVGTT0VAPL8J2r04G4la
X-Gm-Gg: ASbGncuLaZoCXeBGIbC7cVpkY/Rf7NBQ9oYhWh8syL7iEkyHWYgKO6KN0V4JUH2hpCm
 wbBzy6kIEv9zSXsaVuOnpkWy6EBvuNYf8Ka5zDkgeCxta4ujAlwzrKZWiVGQraQS19yQou0uGld
 XpDWHe9cnt3+1czH9a5WmIZOUT3uqUMur+u3vVOVt9t+Fo/5/0Y/2MDnhTnMWsq6RsHZqgMpsfV
 p9TVi6pT+2Cpc9FJUR7jEOTFqn0HFuIhz6cEXLcguEVpJtnfvmTPi6+6HIo/niQ7jELyG4MgZ5c
 qRn/W+XbO+Z5l1IoMfRofv+jP1RFmYI6+LpSnNuaXHwh78kRa+CeoA0MfgUszHTu75N2ZnwskUp
 O3IYikjuhvFmRIykILpxTi9sjZEslX6JxvqFr6haKsyC0ElAk8HufEsGWpuatJOEavuzGAcwQ0y
 0IvijqLk08YwBhW1lYAtXmG54iiSx2c1ioXpIrcg==
X-Google-Smtp-Source: AGHT+IEfo6dIZQgb+2KQqBaq9k8zgeodNBoQBmoTlSmN4T18NxGs2JJXZCHspCns20/kog8GcmY8rQ==
X-Received: by 2002:a05:6000:3112:b0:3ea:e0fd:290a with SMTP id
 ffacd0b85a97d-3eae0fd2e16mr6354578f8f.12.1758032528799; 
 Tue, 16 Sep 2025 07:22:08 -0700 (PDT)
Received: from emanuele-nb.corp.toradex.com
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037c4490sm225090165e9.19.2025.09.16.07.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:07 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: 
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jayesh Choudhary <j-choudhary@ti.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/bridge: ti-sn65dsi86: Transition to LP mode on every
 video line
Date: Tue, 16 Sep 2025 16:20:43 +0200
Message-ID: <20250916142047.3582018-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Sep 2025 22:36:40 +0000
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

The component datasheet recommends, to reduce power consumption,
transitioning to LP mode on every video line.

Enable the MIPI_DSI_MODE_VIDEO_NO_HFP and MIPI_DSI_MODE_VIDEO_NO_HBP
flags so that the bridge can enter LP mode during the horizontal front
porch and back porch periods.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Jayesh Choudhary <j-choudhary@ti.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linux-kernel@vger.kernel.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ae0d08e5e960..957e9abd46c3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -689,7 +689,8 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 	/* TODO: setting to 4 MIPI lanes always for now */
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_NO_HFP |
+			  MIPI_DSI_MODE_VIDEO_NO_HBP;
 
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(dev);
-- 
2.43.0

