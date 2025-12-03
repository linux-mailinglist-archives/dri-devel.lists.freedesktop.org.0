Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEECCA081C
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 18:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBD210E182;
	Wed,  3 Dec 2025 17:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KJngMK8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A611810E182
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 17:35:28 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so122555e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 09:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764783327; x=1765388127; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nKJI8GMtAjNrzKnACSkzNNj+w+iIpDqT7iblY7Qxnls=;
 b=KJngMK8x5YdhD3qx7URkRw5vM4acqxWng5y1nIOTxb/esmVC9/p+pUyc3sdpB3UAZF
 /tvZUh3F8yuFBFySHtfq8LiwmzwtZvZ6EqnSt6udB5LaugykGv+HyJcOhZnTgIIFzG3f
 w3t1TDI837Pw6Qt08iYoDrBQXiYepD1Fh4uLRa2z2hEtZvLWuOyzDfDUQRn9/jJRSoR/
 lUHJwkV443m0QFG7F6eVCz/1nM0k84fZy+7cOngfgm6/oKDeebZf2Qm6x+vRzHhOwqmI
 Mu4pub3YusnZoCEYGI9bN/p2adC9HwUi+VIdNOU39pJeFALCGRhpk7v7ux3jyXN7JQeu
 XgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764783327; x=1765388127;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nKJI8GMtAjNrzKnACSkzNNj+w+iIpDqT7iblY7Qxnls=;
 b=BSvxhUvsvmDvdiyoWROZyO7PIuQ/uQ+3Hek9MxE+qgTrOcpCL3twFcaTU34MEFYrWm
 QvXmtTxjPFoCS2TZWT2AWNe0uRzbg+aEp0RPxVnhI4//pj2sVD2hsnZ/SzEJxChcH8SK
 YekVR1XBmG/+FFVq74oXCJCMnwy6rpZOrkhL71YGYhBr03l/s+5dHbGUs3FuLIjqTtHT
 UQ8JXcBH/nOHl4ZW8+P2Ryj1PCzPe4cp4O38bwlkMW87abZN3j60VRE4h/rpEjlIHU6F
 L4XKUwmH5F7RGHHinmLl3iYc4c4SyTSc1wt/QivSsuGgsSUsEw9UqfR89L8p5BX3ST8O
 zwqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6t5NkPSnhZpYekvnztDFMiyxTMwxHClIeIf5ho2yo/aG3QqGg1mhxTfh3gwKj7nawRh6sne/gV6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK82HwlSs2E/EdsV/jn5y5hvIw+Q0V0VC2fkq/Kt6IjweSe39/
 LbJGs0eEdSKMwCmZmMlL+dzpEp8sbls0QoRhLmjaGwnJl3azMIDeutqFx6ZuTHcq+QQ=
X-Gm-Gg: ASbGncuIRYgdZOLE7sXoT4AcxowupDSjHmJJtj/oEJybZnYwVCGf8o743cy+m7jRxNn
 znRmuqrfUavMxwQnO1+Cg7aojUZgJvICEUEwmobWxXKMEr3MctyW7VLSmhMIhAT1o7TrkvHx+AW
 AFxMa5wrZT3vjAvkhqSoEk8SSisQmW88OsWFXx7IAKL7/dQSdDzlkGpwcleJq5T5qOFN8TsXgkk
 68QziVmV7zYYfXeSWcwk/SY1vPWDamO6FDNg4DMdeAfqH32TE7mwSw+0Sa/HhbfmDICMwUX7yf9
 D9FONEr/gpZ7YrW4HphVQaPCCrlClb+CeTwbSddwjbBkYpnEn9mSjWDgOok2AV+TaK9VkdkN44c
 jGZsjGGqYkRlqI8FDORmu/j+DalsrUktGSDuLs0R4wzzzdaZc85muvP6bAsOkUih7mxxV7Wll64
 pIlTKLKjHtTzG4vFnQ
X-Google-Smtp-Source: AGHT+IEudFPB8fqTRUYo9jAjw9iQXj8WoOA1AJGB7dducQ+6U4yMLLe6rwsDuMAuj36q/yWs6CIXUA==
X-Received: by 2002:a05:600c:45ca:b0:46e:4a30:2b0f with SMTP id
 5b1f17b1804b1-4792af486d7mr35170365e9.29.1764783327011; 
 Wed, 03 Dec 2025 09:35:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42e1c5d613esm41252875f8f.11.2025.12.03.09.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 09:35:26 -0800 (PST)
Date: Wed, 3 Dec 2025 20:35:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/plane: Fix IS_ERR() vs NULL check in
 drm_plane_create_hotspot_properties()
Message-ID: <aTB023cfcIPkCsFS@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The drm_property_create_signed_range() function doesn't return error
pointers it returns NULL on error.  Fix the error checking to match.

Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index f72bfbdddf23..6ee752c90380 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -338,14 +338,14 @@ static int drm_plane_create_hotspot_properties(struct drm_plane *plane)
 
 	prop_x = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_X",
 						  INT_MIN, INT_MAX);
-	if (IS_ERR(prop_x))
-		return PTR_ERR(prop_x);
+	if (!prop_x)
+		return -ENOMEM;
 
 	prop_y = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_Y",
 						  INT_MIN, INT_MAX);
-	if (IS_ERR(prop_y)) {
+	if (!prop_y) {
 		drm_property_destroy(plane->dev, prop_x);
-		return PTR_ERR(prop_y);
+		return -ENOMEM;
 	}
 
 	drm_object_attach_property(&plane->base, prop_x, 0);
-- 
2.51.0

