Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D75B2AC5A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8876A10E481;
	Mon, 18 Aug 2025 15:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QZZIiDov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0EE10E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 11:36:03 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45a1b097037so20731545e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 04:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755516962; x=1756121762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dDUdPZKNkg1iBDfC6ofC+qEV+2e3XCCr9Niar66w+L4=;
 b=QZZIiDov/a+pHThg4wCqfW8AQMF0o5PEqLWqOa/pH/31ZQ2mtMhBsH5An7v3iLCQ3j
 GV1B8YDaRkq/LXE62pR43Oryi+7M71nk5SeR6bxz1qGn+2WgHiEMFSTrKHeWcWj5BNhz
 r1K3yuVzwVAGkF/JqEb5Rvd/8aCATcgYyG3D8NX87HvLuKKZ83wy1zwW60elQei9dQ2i
 /Kxvn33AuP4QFSE5UW59ZsWaEoEg2RcS8XKM/zpTm9R7T/aryWCepkqafSgUd/ar66iT
 Ooh6s4m1ge/c/QHQ5jhjZ5LrgYIpmPOM63Nx0+hLIpmLNjflvaoJ+tCVNulPfOzouWwN
 IJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755516962; x=1756121762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dDUdPZKNkg1iBDfC6ofC+qEV+2e3XCCr9Niar66w+L4=;
 b=aFG/Yx3klApgL5WOOLSlNzWMWekVDkvZPUhc8bv44iRobaT/9BXe/+OS4Hpdq0uusj
 TLnkzdN9CLuTjfDigEjRxtKo/QckssDrvEuHpwfEZs29MN4gAYc5p+t+kgKb+/P2BuC3
 eWUL1Trxiw8pkVwHTOJ71Zt7m7btjyQOw0MDsKD7MPqqigwv66XReoU7H+a2Mbm6fxYq
 tpo2F+YL/Q7DV1uh8KAjpsbkas2SZRU1zGOabsTQzg0r0wUP4PKri2L50d+CkSS4TqZ5
 cR6XerO3Frdz5GR6bGMlpgQ4+a3e9Orsfx4Bj2+YYVBi1F0VGFj5pkxDhC7Fwpy/roCP
 Yaxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHHPaZwxJqFsdsIO5ofOIS/TBq/slWYjJM4HKjfh5KfEieHPr9IwTSp6u7GjbK1cvLfwr64NE7HHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMINtRKz2N6oIP7mxkOfaEg0VfZGu4zvAkmTGJ43jOrvxwaVgT
 N8PGxJKwp9QNo+N2OgLjno+/kVezyqgIplgEJUmTWDA7e9xbY4KBsuSaEdB0Cg0G
X-Gm-Gg: ASbGncuTdpOJr+ot2POs311WMsptcG0DXcXWJChI4WQGWGtXWrd7OJ5NeFo17M2M7ou
 uDkRETh6nAluedmSPJa5qsoWOa1GIkz+aAQMHBd3zpGwrMZU9XloXrHIAHadCZ3TALfaZn4JlB9
 m35Df0GGaPYji+xdMwvFJOLqQBFts/QRxiK8w3Wh9OwYJ8AbDNAESiRgqNhGU914kIwE2capfe0
 olUEFFBln7YefGbBpB1ScVOqe2yG7bmWo1k1ZWvicsBkNL+iL0eTkZq0cr8DiTwcpSuRxNUB9tA
 GIZ4ZVWvIJzz7kkJh6tAVFaUSadhXQ9g7T7spg9m79qTr0hjsNSixJDII+7CvcIi7phCRVDTLHx
 jrhyKWNnpqQXPmr+kLbnbrnEo8t2sBT7rHdxsYZdF9F7Cjgkg/WS/0Q==
X-Google-Smtp-Source: AGHT+IEvNQBZsuo8Hf7IiG7SsKJtDHqDwAW6SCT0x2vVEo9x1zPaztZ3dLK1klhGjAt39vstSNNDxw==
X-Received: by 2002:a05:600c:4f4c:b0:459:d9a2:e92d with SMTP id
 5b1f17b1804b1-45a27151246mr62315245e9.5.1755516961619; 
 Mon, 18 Aug 2025 04:36:01 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c74876csm169135535e9.14.2025.08.18.04.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 04:36:00 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Leander Kieweg <kieweg.leander@gmail.com>, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tiny/bochs: Convert dev_err() to drm_err()
Date: Mon, 18 Aug 2025 13:35:29 +0200
Message-ID: <20250818113530.187440-1-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Aug 2025 15:16:13 +0000
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

The DRM subsystem has a set of preferred, prefixed logging functions
(drm_info, drm_warn, drm_err) which improve debuggability by including
the driver and function name in the log output.

As part of the ongoing effort to modernize logging calls,
convert a dev_err() call in the bochs hardware initialization
function to its drm_err() equivalent.

This work was suggested by the DRM TODO list.

Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8d3b7c4fa6a4..d2d5e9f1269f 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -252,7 +252,7 @@ static int bochs_hw_init(struct bochs_device *bochs)
 		}
 		bochs->ioports = 1;
 	} else {
-		dev_err(dev->dev, "I/O ports are not supported\n");
+		drm_err(dev, "I/O ports are not supported\n");
 		return -EIO;
 	}
 
-- 
2.43.0

