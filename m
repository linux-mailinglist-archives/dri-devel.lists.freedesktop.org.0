Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94938924AAE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE9310E70F;
	Tue,  2 Jul 2024 21:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aNBAXQlK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA3610E700;
 Tue,  2 Jul 2024 21:59:20 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7f61e75642cso212372639f.1; 
 Tue, 02 Jul 2024 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957559; x=1720562359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+Eqreo55RWzciyFbwYCY+bKp2K8wKhzwrrhakb4uDM=;
 b=aNBAXQlKe8tlCnkvrGEq5biAMcKhdEgec9OKUgmu1KrMfHACAvbjiRiX4EVFYcUhml
 y0egujpFFo5syfi9utOtGLDuI/4SKn6dE1zZX8HA0IWFAVNI0OnzfHR9rch+YgHacZ/q
 ZP9uYeUFj9qgLw4oneb8G0NPDvKKV5ptUepKFgPAyKm0HBAjS0sUqJ0ogAeUSxXjIHBk
 Lv0Hmz3OzeueZCiRwRKfzI4QxWtrfOrZAdZR4MNignPuOe02D5QQDsME2gf2JhNk5I9r
 qWKnXxChDolBXUb5HXw8dJ6bcoRW0oVZvgpSPxV3FG7oQvm8dlX2dDi4nNZt0Z3qe5nc
 Qj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957559; x=1720562359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+Eqreo55RWzciyFbwYCY+bKp2K8wKhzwrrhakb4uDM=;
 b=IYImwwxFkk/LV/SOdc5RwDH8j5Ua40V5vZx25ghk+R9IqRYYs+uFi5/Meg0hfEaOS2
 pk7vsV1gWBsi0iIUlegC1jT5lgOKQRwICrYJpzbDnoRo8GrwT3HdH6jDoARdM0nHy+9H
 m533bFkaE+jtkSbXa+7UFO6xfOg8ADLDwdOo15it01GmnMjobaz6apsiD9uAK9XBWB1j
 2RMUGv14cl3lIicMLz9bAe9Dm/FMzLubXIG7raQZZCw/Nyeqw5fwgAcQ/4datGfumQ9z
 0LHMq/yD0lcXHwy0dHdPSERlgvzybfzLcuBroGus7hsQhIfiV+IMmbJ4f4cGyixB+hxS
 QIKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiQ48FgTiKQh4iszAKA3Vb1TDjFZdmWZ8SZx5+cXcf1ZzWeLs3iBvR+Lu1A1k0VchEUJZwlW1ALauczVpjTUMbSVtn2PG6GjvPel49KVKeu5/UJUkWrE7ycmM27J3Jz2GQ+XrUFf9dhoxq4bK9u+S5eMMlnb9xzxhQq//EtgnfrQ4xQyCmbZ8yZVd84wMjutFjg3EaSPFyVi86HTuPZb+2a2+2IKqrIJjNnG15VBx+IfJA4Ic=
X-Gm-Message-State: AOJu0YzeOaTgAPIXSy0835LVUK4nAwyKLLOWgXKnlfSUccYerp4ayM77
 cNxO8AMdN+/9MUCgPoOjsyCKl70h8Vu21rp3HDwRIO5EBqwn2NAI
X-Google-Smtp-Source: AGHT+IGcyZCDZRZp6V6RnDZJi7b8GdP/ji76gbOaeQMp4gTOzKk8wvV+sE7C+kypGaK6A4D4KgsymQ==
X-Received: by 2002:a05:6602:600b:b0:7f6:4f7e:b87e with SMTP id
 ca18e2360f4ac-7f64f7eba13mr445715539f.21.1719957559493; 
 Tue, 02 Jul 2024 14:59:19 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 44/52] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Tue,  2 Jul 2024 15:57:47 -0600
Message-ID: <20240702215804.2201271-58-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7bf08164140e..d22308328c76 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -247,6 +247,8 @@ int radeon_cik_support = 1;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled (default), 0 = disabled)");
 module_param_named(cik_support, radeon_cik_support, int, 0444);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct pci_device_id pciidlist[] = {
 	radeon_PCI_IDS
 };
-- 
2.45.2

