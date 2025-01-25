Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E56A1C196
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9567310E2B7;
	Sat, 25 Jan 2025 06:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UNfKCgwP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A210110EA84;
 Sat, 25 Jan 2025 06:47:33 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3cfc8772469so5194985ab.3; 
 Fri, 24 Jan 2025 22:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787653; x=1738392453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QXJvwkX5dMWwVOOB9k5iDyJ+DvIudVbZ+A9Ut3PgCsY=;
 b=UNfKCgwPKXyK2QDToDx0l/NJSkPysCUOl9zFLyGmYQVOegdFJabWysP7IIcSdbm81W
 ZuglG3mR7ND0EJCcQgKLdtxFYPh2wnppZhtE8/EIhN6IFXuqKgDJFiqzr6Pi4OvzyFIW
 dQRhAATbCY0xdVvC+kRZWUSl41aT/wS+yCaRK5vCSraw2KiNLTd1cqor0igw1ragVaZA
 oEt6o7MJzg5THkmI9pgP9Z/JWZlZUqnCb0lrBYRsbrXWRvrfkncP5sWHUhkoCEX+WFUI
 aWqx2kyuF3W8Wp5eLSV0RNyXlVoNcFamnOUQ9lcv9R9mAlCcwXb8q3BsjH9mO7VJ07HD
 BNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787653; x=1738392453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXJvwkX5dMWwVOOB9k5iDyJ+DvIudVbZ+A9Ut3PgCsY=;
 b=X7uGxIIM31TjpQapHxFImfanNeCV9leIUAORQaAh/w0vk6B4khEMvnrJRaqq1FfSja
 1mvVkPocyhV2uKlp5cFVFlhyYxbsiySyzD2phFAuGNfQDJ6Crq2gOz61Iyh5lbnmG6P8
 kRBISXMnB259nv2Ao/b1vbO0luFz1ONilwDnKHhpf4/6h6nYfCta48esFgRjlOeTnspq
 s5iViHLTSF3Yt2jZqrwFqU2azm+nV1T3JiIW6LYqDJdkdazsvf5NIUCy6Hy7llFi2v6G
 LWt00w0vnOtxAvHlvX+TV2fE3JS6qxfHUPU06zPqJYdc8Le2hZ0F7nJhPXynQegzI4xY
 bOfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG4E1ZIzXnjB0V1X9flF2PzSOY3PPR+2JZPE2xymZqTfpanrY3eYxSuugEmZk4SCl0hybH+OSsuVgz1cq4yQ==@lists.freedesktop.org,
 AJvYcCUq+MNKkzERFR4Y3dEZwiY1JmzMcJz5R3HiS3YeX2iFLCed3VnV4kJR4KnYQ2qYgCyFptvoyAK0eub+@lists.freedesktop.org,
 AJvYcCWmJLwJuMaIhZ5J77E4mkQoWswhFR7WJ8NG3/F5sKpWk1Afdeq5zHlQptTxht+UcxYiGHTIYL+pGDyr@lists.freedesktop.org,
 AJvYcCXPhaOHC/Px/66ZtF5lqkgG5kdXg1MCQCpcAPlHARMg65XtjMVTACp1PFSA/FcP14svOyDYAT/b@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPR4obvCVyIRdG0rWLUtUAUr94Nozkeb4PMqFKz/XPjHcmX6JI
 lisftU2+cKLvbC7SbR9O4pPos8tg8LJ5vNh6fhmn0EHe8KNl3Yf+
X-Gm-Gg: ASbGncsFKuNHjey82RT8rTl4rh1AzAaseU/I9sQ0FG8siri7uR5qbMlR2tdBKPO8EPy
 zZ+aoWIdhZNRYEuLaZOjNk5cOBj9Gaj2i3pysCLXKz+q8nEFRooTphmcQc0rErWWYzig3tzgi51
 lY9y5AsZpnFl9cD6cS1sbmfgqxZ2nFmqYpH9Ny89cFeQPUsT9HpcRUKI5/4DBQOW7B/zKd9hvc0
 wo5hxj5PeNxg+A/aUuTs+9bCNDZ5c8RL1SdakBzupEyHYFH3ct4+YG5wtqDQiS/C8yDLD5DKrhG
 dNco6F8cUqnkk2i6VtU+5U9g9bN08z3TQ4oYTA==
X-Google-Smtp-Source: AGHT+IFR8c5S4HlnxAhhQQrNs6VgmiPrwR9vlqdXV98OhQbNPjVEjH4OwoZZHaDBKr7qyvOeA3I8Dw==
X-Received: by 2002:a05:6602:4881:b0:84f:537d:b097 with SMTP id
 ca18e2360f4ac-851b62b5a35mr2857317739f.12.1737787652958; 
 Fri, 24 Jan 2025 22:47:32 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:32 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 52/63] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Fri, 24 Jan 2025 23:46:06 -0700
Message-ID: <20250125064619.8305-53-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 6f91ff1dbf7e..d29541aa82ab 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -59,6 +59,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.48.1

