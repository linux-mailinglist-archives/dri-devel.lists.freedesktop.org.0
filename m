Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C383CB19229
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157FC10E4D5;
	Sun,  3 Aug 2025 03:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W51aprOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1E110E4D3;
 Sun,  3 Aug 2025 03:59:48 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3e3d94aa969so14697795ab.1; 
 Sat, 02 Aug 2025 20:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193588; x=1754798388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Y2j3K6T9pEbVJmy/1+mQG/Hh4BA91G5pqycFLMj9u0=;
 b=W51aprOCV46e2biXaFhuclrMZ8TADx1QHMW6kg74Xo2XdrvwRkT5vx2TlXoEXWAWsp
 77GXVeqNe0amZK3oLjMMNkfrv3hvWS13JM3UVz7WaD2klGF+SaIFbU+vUzPNqsosi9dY
 VHE0dSwU8IQwKhmeJpVLnvQsZcIE7iZG+R3xCp7RL2FDCuZDsiC35NbOYFXC95Cq8uCc
 oIJWg3HtijSx0rjogZDrFzwH98cWbKsKcOR9MRdDBHPtYiVRFiODtwF5bZRV8E0RbRsD
 y8Kud+AnObn5NR0QuPuvJYAmn+fBGZoILVHUlGI6FGvvmA1jdMvptu9S1H9fijT95ZO2
 bGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193588; x=1754798388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Y2j3K6T9pEbVJmy/1+mQG/Hh4BA91G5pqycFLMj9u0=;
 b=lcwJnXUx4XO3MGSABxhpFgqkUvBnyKhDPHbJCSjAgJkpat6RRKRC/OF6BYUECweeys
 ZK1Yg8i+/B3J9yjTNmNhSjyjNlhTQ0famJUCc8xhJh/iopc1XHJN7i2HbFo2IWi0o3fF
 ohSMsr24b6e54gmjrqfWrbEoyBZ6cQt4zI0hK+xn9cXTDA2DuAB21Z6nNGs7t3kKcalJ
 BeJ2WYmmV2qnycskT7svWi+G+dE6h7OnIJE5XUiCoyv+c8X2qEYCy5VILSDNHRoPMb9r
 y4VwdC4s8FnH9yoEvd+mispCN63d1RJ422lMRLKqWPPX5axthp7/4sPLB+tQPQmwqkkQ
 6UuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs/LEEUHxvRypeFZKdH65xmPLaA/gpu/mU1MH7xh/bSW1tvZbKb5BwwlJYEME6LvyEEdF/T33g+FOuqgLy2w==@lists.freedesktop.org,
 AJvYcCWgCzRuPvFyD1E5d44v/aQYe0/r56R9hb7hf30YzLMCQZT2rE7P+SOtN3VPAxDTAp8JJ1tLFb86hNLj@lists.freedesktop.org,
 AJvYcCXiefqWb08/nvvbulfOpGp5sNujNLLetkvT2x48Lzdssf8EBHYtkwLztJ5iTwED1848x1V4ObED@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgbffgRacI7MYZs6VkRtU1eL9e3nIMOA40cpgX/kZoJlX4lowG
 maTIQVNi0L4Lo7Da+T0O9ZE0WQ9XUkOJBxCHHQY4t1ceG0z1lC6TzZNn
X-Gm-Gg: ASbGncssC0tCcDMuM/d1n7vpowXKcBzFUAPJaPjOn7Vqm9oVgymsqGqUsl7lG8aTOF5
 jkepgwaMEk6w8E+XngwVEARnXWtYdWRLknTPAJSx33SE9LMImqemqyzbcTTsEkejUKsNafhzeKl
 FPtLSDlJdRTWokIerjXHxrzupL6RRJMkFYBB06AqlfOyitY6rl69XaWuN0wk6+Cgq/0yKCVNZxS
 fIYRPYdC+/4ZZTbUc8m1uXiCtIHE8qLlnwW8/Yb7Zxwk3ozPeQlZWv9Y5jd0J0hdWt2speu+uUY
 /jV+nsMgJcUBHUUHnW2RIAaHPXnXrcCxA4/rXQ0LWRb9JwYVL6ugBwJdSHBZjeJImvK2igbU7I4
 BozCnZ+mhN5yXUcw6yhNYeOAS1G9wA9ROeVeqXWXFwy1nDncsVg+dsj0oP19FC8+aTDB0WOJ1Do
 Dy7Q==
X-Google-Smtp-Source: AGHT+IG5rAfDnGWWHI38mC3T85otZ6jr6iMt5B4TFAIz2EjPIhuXzfVe7WbaaJ0FoMpD7p5DssgRSA==
X-Received: by 2002:a05:6e02:164f:b0:3e2:a749:250b with SMTP id
 e9e14a558f8ab-3e41615d149mr81988415ab.14.1754193587969; 
 Sat, 02 Aug 2025 20:59:47 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 51/58] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Sat,  2 Aug 2025 21:58:09 -0600
Message-ID: <20250803035816.603405-52-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index bc58991a6f144..5ae66ffd72bd6 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -21,6 +21,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.50.1

