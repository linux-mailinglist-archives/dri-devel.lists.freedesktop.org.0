Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF62AD2E21
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 08:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BC510E269;
	Tue, 10 Jun 2025 06:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YGecwDUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C00310E25F;
 Tue, 10 Jun 2025 06:53:09 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2352400344aso44042115ad.2; 
 Mon, 09 Jun 2025 23:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749538388; x=1750143188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L40mN9hDD1YShdc9tuvud2gAJyku74rtyG9Hba9Zg7w=;
 b=YGecwDUU6xx1ySLQhEEkLHwamNwu3cc0k02waHGRAZ305rBVRp0hKWTyA4SqqNwNch
 bQoA8ld3Os+1xnQMOeiztE0x31Q5WNLRgkvPwvy+3safvDp4cNP6dQiRVc+iJpvgYZlA
 /9/5lx6MzRuAbrjEWIRwy7Zn7TEZsi7mlM718rDyeggTkmNPFOPAvOunv/vLE5gqNEe7
 p41Oepl7ekkpibGQG8BGKaT6NDBISw9X/OX5JsazId+kfJwGk/wPbRIWUcBqvNQZlVkW
 93nAGigFBPElgOzfoBnzf9KzN80NqmdK5pac8CEHXKhcJzzAHiqREFSnenfDFQmqFZTh
 f5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749538388; x=1750143188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L40mN9hDD1YShdc9tuvud2gAJyku74rtyG9Hba9Zg7w=;
 b=PFVSl+SOwNmNoqNY4DnoLQwXWT7jhIf0v4WJohbXhpC04KuRgfrZEWzRNOuI/DqM4K
 IsdqBSjMeidQLm1C+DhMgI9Sox1aDpeiVubFXVkTfE1/E0hDjorjpYPGu7lLBWeNZGui
 b1osWh6I7mP1YZ2ZgE6Fl2wIoTN/sLa9wN9MBcP+WLveRO7yhDhk0mKvZCVdUrGqgdDt
 cJaK+eIZYcjNtMxxJiXzCH/gTu9TacQ+l3cYjDw2ICCcdYI7w3lZjcxm6/JkHUY1v+jy
 X+KzpWDMj4/YIUBWbZ6sIJqRbZ9xyjdB11MC2OCvD/DVX3LsXlWQo8qQgoehUKS+FrOh
 mmYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEPvGwULohQkCJo26zLRtbiDDgQWqny3zBTiCOdTR1qOrSGafmwTAj2wLEJppVF9U3DvUi9F5Fw0Y=@lists.freedesktop.org,
 AJvYcCXdLqbaJSbKrX+RUrL82TLaBgJArYPnqFLuHb8xcVmkXOJtdZLXn+BfT5Z/KBpO+FMnOPfDzCxyzQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd1d1n0Uhh85QrANBuNjbjNch43Xus0IDtCdodJ6zcK1SsqoJj
 s1L/rxc0L+su0wrLLXfnITKmnOHrrqaNz3IFb6R5OjscAr5ukJ1vUGAb
X-Gm-Gg: ASbGncuZbkbHkkU1GyANYnKeLqqtdDdeq0ZUoMgYBhdTLg9nxURFXpGcWzYgx7oUaTB
 14tp6w7WWzk00nGs67Ws4szbt9zIU1ONbBzCG6ll1oSXgh8IEWyRCxE93/pnRnrTZso7+ZZeSne
 3onZVeROnjkYqfNFZUH8MyVJnrdLlH6YVrtDX21Ohdtcbfv6uILFNnCIqnPI+iPnk+l2YKAWE5X
 TiPnaFq6xgxjBWvXTUVKX7Sr81PUpil6H7sMntuUgpT+ycSk2cK2JIxRO0SeC75Y+Tg/mlEEIJz
 FYBq7cdik6OCNVmQK4TAzKP1KIRhDXCFoLtwqPC3FVNvTVDU4X3z1FfM1uCwjg==
X-Google-Smtp-Source: AGHT+IGGhf4qcSKcWuzkG7Ma2lcSo0wcjny/oVMbLwAkNWZVZHFdXOLtBb5AiH1aGJ8+FB+mlbV4Bw==
X-Received: by 2002:a17:903:3c2f:b0:234:914b:3841 with SMTP id
 d9443c01a7336-23601d74a16mr222179975ad.39.1749538388441; 
 Mon, 09 Jun 2025 23:53:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2363ad3492esm4038345ad.154.2025.06.09.23.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 23:53:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 9B9974209E8C; Tue, 10 Jun 2025 13:53:04 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: nouveau: Update GSP message queue kernel-doc
 reference
Date: Tue, 10 Jun 2025 13:52:57 +0700
Message-ID: <20250610065258.41467-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465; i=bagasdotme@gmail.com;
 h=from:subject; bh=UG8A5/L+Irb0vjL1NjpfPa+O989gEUIFs600uZGgXt0=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnuVxRPvcnb/mPm1D12Lbu/hZYErzuxKWJOhFqNZp3vr
 7TXOxXCO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjARM1aGfybTnrre0du1WiJh
 25KFy1ddPu9Z0dI8h1vv9rqu+dn/5hkyMrR9u2q/JNV9bnyb6EYTzrkb+QrEVF9cNN3I4hlf/S+
 EkREA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Commit c472d828348caf ("drm/nouveau/gsp: move subdev/engine impls to
subdev/gsp/rm/r535/") moves GSP-RM message queue implementation in
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c to versioned path in
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c, but forgets to
update kernel-doc reference in nouveau docs, hence triggers htmldocs
warnings:

ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

Update the reference.

Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/gpu/nouveau.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
index b8c801e0068cb0..878fb1ade31e4c 100644
--- a/Documentation/gpu/nouveau.rst
+++ b/Documentation/gpu/nouveau.rst
@@ -25,7 +25,7 @@ providing a consistent API to upper layers of the driver stack.
 GSP Support
 ------------------------
 
-.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
    :doc: GSP message queue element
 
 .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
An old man doll... just what I always wanted! - Clara

