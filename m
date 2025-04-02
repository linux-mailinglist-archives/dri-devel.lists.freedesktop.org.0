Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C03A79447
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BD710E89F;
	Wed,  2 Apr 2025 17:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="di2dQ8kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066CF10E89F;
 Wed,  2 Apr 2025 17:42:54 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-854a68f5a9cso2556039f.0; 
 Wed, 02 Apr 2025 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615773; x=1744220573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmnUjD6NKJR963XR8Ej2QuH8oZFh+mV0bkdDgwQtC1c=;
 b=di2dQ8kQQh7xS/JBDUgTAFXG+BQkZeJ9VU5iNc+aYc6xo3uDUZ8dW1SCEOhtbD1qXw
 xVLDFHErxs7b9DtgutNllNSq4tFO3I/6iVjbJ5nlFEul67wKTTPFZew+LQasAQaOtNBx
 IDm7eEoWYA5aEUf5jg0smCx5te7lq4D1NRjEOOh+AHviDb26fpV6LIVVolYaSe3SYx4b
 zWWITRBJZQLHLv+B8JnhG1zfScGKBgoY0yo63lnP/NMDI+/S+uJ3HgJgiKrRNf5xivPh
 dLNV2XtgkWkt+1DeSVpbKM5HPjbqK5/PMtudRssdqOYXQHU0Um4m/oeQ+Bfk6AOKq/TG
 zv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615773; x=1744220573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lmnUjD6NKJR963XR8Ej2QuH8oZFh+mV0bkdDgwQtC1c=;
 b=aa/7KBl2vC9HL1GuUJW/FrectgQquq1ifEswmRA0m2c6FdP0bkohOJORO76N6ui5ix
 KsAlTlTbeLB0zcKwWzvI7yxfVG+6y9A5xxFJHRYh8miz6BqMwNNoGbSnBmUOgYwED29n
 dEVHxP5McaqBh3MC2OEVf5wA4F57WUbcD6lLk0UVWYgDRRI7jOwcAxX3RfU+WCBIprkO
 0kvnS+rBK8pCuFqOSKNVS/CZVKXChQNA6ERBNs+WgSv81Yb1T2KUIFnE/7D/HXJhL029
 1RpRlTYldx1A6btVbjdweJuDXfv9Rwy8h+ZFKWmA9FjBWh/AFt44jIav2svy1XPmJ+08
 7mTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsPehr/3GFlqjHqwIge6jc2fjPcPjR/hdvWNH8xawsEqESb0sjhFcLh0FMrVXmsUD2Q52ep/3N@lists.freedesktop.org,
 AJvYcCXd1a+dAjl/vujPIDcDAWq/2Yw8sURprRw0U0lLdoJirT/DSbPO0ouwhkNYMchMudm/tzgJNUn4YamH9k/DEw==@lists.freedesktop.org,
 AJvYcCXuXMTlpaMbq+ua0q+9xgZugdJE/rWM9H7uEkwwwynsPwIupitpiPwHCmnJiuxE2Q+Hn0ph/oKdZ6sP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfrUZM8ssVk77SPFyLLKN8DLEyQCvN0vzcIExvHrLZ0KLdQm/F
 GHLOTXYTGoF7gQhlOmcVJqETDJF9AbyiuWnrvPi/aHqULdaZj0hk
X-Gm-Gg: ASbGnctak1eozV8gPA3bJoFnSGmj5fN3O1dR26yf6rQNfzPHgY21vMnH1FNxjgzALba
 GOo2jRStL7LN23SqMiZNuJywV4I3t9IT6To5KeijGC7AquGhl3cYruzVelzFzFGCUjJrKcRUccm
 jDBUH2JTPl1AnUOK+hfvngp75mnxqFiaAFZkt7dpQDEyXhDTZ3htKHIFru7bYeTxsDE4Ts5WZZb
 cX50yAm6BhmXh6xh7SurJP/5BqTCnz4kRafFS+kPjege8gP4yD8GHwZopUgW3kRZ6hVJCuHr4WZ
 GF3sfaYu4Ij7bn8eE2n/nYSGkkViDTk6rRPi1m/F9Lzn0sg30F7Ly8prrWwPa1G0B+HrprbukYQ
 v8Q==
X-Google-Smtp-Source: AGHT+IEsoNgpLODjysSkI25oKJsaNZz7XSjHcm/Nhcv9gVki2+9S2pVoYAXgC+K6TNfR04N0YUf8TQ==
X-Received: by 2002:a05:6e02:3981:b0:3d3:d823:5402 with SMTP id
 e9e14a558f8ab-3d6d54a1420mr42397655ab.7.1743615773292; 
 Wed, 02 Apr 2025 10:42:53 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 40/54] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Wed,  2 Apr 2025 11:41:42 -0600
Message-ID: <20250402174156.1246171-41-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 6a67c6297d58..3bc4e6694fc2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -45,6 +45,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.49.0

