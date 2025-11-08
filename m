Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91CEC43443
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 20:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78E210E205;
	Sat,  8 Nov 2025 19:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FfFyXEGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB5F10E209
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 19:50:19 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-475ca9237c2so9309315e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 11:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762631418; x=1763236218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTErcnYX+Ce1Mb0cQ/tmSFUfGgG0iezGcfWDSHlRH28=;
 b=FfFyXEGNpE9P0eQGWu4BVI1mcetdjUgK0hi9GQeARjPknjLFWhq9gkBcF4IhwYfY5c
 s4ihUYlDEmPZu4WeMKrUMgAyno1vb6JKMAiU0HBeT9lSe/VRcpDKGP1cWoSGsdUcEUDI
 KwXuEbDNUVxfNOnUADuRW/GksKP7mPmXOtGHXSmyx/noJSL6h1VXYmGAGLsOJLDY7vQE
 Myru9nl2Sw7xXjlsQ46vlSqXmKTi06MwJE2fA0JA7NpaxQYirQVThZhBahxiJh5c5DVF
 iKKbikwgkLhnBybAG6Cwi+iHP8gMzPJPFw4iYjexQGy9/12afOfFhVb0IlQv+aLvVo9c
 YEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762631418; x=1763236218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wTErcnYX+Ce1Mb0cQ/tmSFUfGgG0iezGcfWDSHlRH28=;
 b=o1H8bu3Pb7ExScHSKugwWx4C07wKIc8DGwjY6niqjgIynjrLQD2P96GuFU+0o4ZCjE
 yThK6w01vNnW7VlMc+4BQMfOv2o0ZRgQ4VrL5dC06j91zk5tLRwrrC3RoLLLzwvrMj/H
 nEM9h+g+Z8JKC4VgyGjhtehwDAoA1G7U7XxgFfccjAnnpohMoPLkztlBAiGVjxQ4HTuo
 TznVXV3Jgj3BiY/+oGdha/2PYdQGuNUq/6IkTDrw232kD0X0HhqGNVGWieIhe2tOmf35
 Lo9GvhyIuJU5M1SokbVepOKaBcZTVe8PfYzhzbycxDmq1O1CMpJNXPTq5q5fFmU2377G
 0lhA==
X-Gm-Message-State: AOJu0YxwiBmGct3uAA8EpCVEM25ErwZbtOcKS93IO+lKiuvwJ9NbAt5Z
 xYoVpoOc3d8geKuWyS8AIn43eyFXCupFuFLzP0zuwtTbsSe5RBeh+g7N
X-Gm-Gg: ASbGnctMtTPwm9Gv0QgiwCMSMZjT9nOk8+CqDvF+0+gqs77pQ4LA80fYee9eTXcQPxJ
 3/JXonAi/U/WEGT191SySgjMa922LbnOB9a4BqZDbzyAM2t57wcyowEZ+tqjgJP+Un9zAwgImmf
 IenZKdt0aY/lDaqY/r9x1UEcir0Yj4lo7zr4nyyOIWV/HCJT+bngkNa4ETiiZSsLKrWfPbm8T79
 HFg1SwEs2io5gXsWQF5FeqA/NeJQMs25CL3rPRiE6wIOdDxn4q0MH8elVqysu4DliLnEEUxuG+b
 UnwR9/buxHeJMAxY3WYoyJ4EOAfF/jiRqQ8D0xBHi/iOPh3LLChHhZiFb7+uimASiRhjBYdEJC3
 HJNR+ZiwdTDAgXEilYnA44qbAzPhuG9iAB99uvBqA+IxgaOaxTffRe3FHhYQbL7+2LqoySn5X/C
 jvBzP1oSSP434jKlYj4/02
X-Google-Smtp-Source: AGHT+IEH/b7pHKnY1anHYgYBmHLRygxIbG7U8tQjG1nHRxCMqpqETqU/RlUFAKuvVjweQbQ7cR35GQ==
X-Received: by 2002:a05:600c:1912:b0:477:7946:dcf4 with SMTP id
 5b1f17b1804b1-4777946df44mr499715e9.24.1762631417554; 
 Sat, 08 Nov 2025 11:50:17 -0800 (PST)
Received: from fedora ([156.208.73.128]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cdc33bdsm233461435e9.1.2025.11.08.11.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 11:50:17 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 James Jones <jajones@nvidia.com>
Subject: [PATCH v5 5/5] drm/nouveau/drm: Bump the driver version to 1.4.1 to
 report new features
Date: Sat,  8 Nov 2025 21:49:19 +0200
Message-ID: <20251108194919.68754-6-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251108194919.68754-1-mohamedahmedegypt2001@gmail.com>
References: <20251108194919.68754-1-mohamedahmedegypt2001@gmail.com>
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

The HW can only do compression on large and huge pages, and enabling it on
4K pages leads to a MMU fault. Compression also needs kernel support for
handling the compressed kinds and managing the compression tags.

This increments the nouveau version number which allows NVK to enable it
only when the kernel actually supports both features and avoid breaking
the system if a newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 55abc510067b..e5de4367e2cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_MAJOR		1
 #define DRIVER_MINOR		4
-#define DRIVER_PATCHLEVEL	0
+#define DRIVER_PATCHLEVEL	1
 
 /*
  * 1.1.1:
@@ -35,6 +35,8 @@
  *        programs that get directly linked with NVKM.
  * 1.3.1:
  *      - implemented limited ABI16/NVIF interop
+ * 1.4.1:
+ *      - add variable page sizes and compression for Turing+
  */
 
 #include <linux/notifier.h>
-- 
2.51.1

