Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724DA79451
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E3B10E8AD;
	Wed,  2 Apr 2025 17:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TUoIZSSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FA589613;
 Wed,  2 Apr 2025 17:42:55 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3ce868498d3so420875ab.3; 
 Wed, 02 Apr 2025 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615774; x=1744220574; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3ieg6OYf20TvXEjKUEioS2vPpvBZB2Yv38SKV0x07E=;
 b=TUoIZSSUGN7jtpOXRJEnrXJp05eA4hohNwJz3ylsvp/ej4fd6fJDz7WskM4Y132iiv
 9qI6f85Is0U9s8QM3nb+fuhI3rp5qMWxVgZI70ILFRMWaFWOK6qOU8rxgnC4soVyb+9v
 v9KcIcNPBqW6+jryALw0rzcAfdjuVfm/iKlpXuWH9dpEmYwCOTRl0GptaBY+hgsaEglo
 uGYqRCqrifOMNScK3WAUxPn5p7jWsiXLG+5l8O29ELqg/5Zndl4eOy/1CvBDb2s/sTbr
 uTGjGkPR+jmeWGY/X0RXaDLsrUDxXvjGuyq1inMD/O72Qeo+BVfTgu7aAJfqChbMwyJi
 klsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615774; x=1744220574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/3ieg6OYf20TvXEjKUEioS2vPpvBZB2Yv38SKV0x07E=;
 b=a6aWkhvXFHY13xFV5/9D15Qx1LyDlfEWBogWj21/mP41NaJwkGLCh5A3hZTneN5BnO
 0YIqO4QTeIrNVneI5ACOnm6hG7/cCL226YDHzQU1HFrYSNCTBJuTaRU9hxUMVB2n426e
 VZ14E/v5wJebspKzyLVQa3beaP7CNqaVxFCpEvsW2or2nYoZKu51c5itARb5dnUaHg4k
 Ncsyh+qeShkkTYFJ39I6sGQrHfA3x3RUHCUt/4iKkn8DToS8CgiYU/XjVVhvoAUuIxRX
 /Da0vDs+uYIZdooSaRx2yBoUfKOf4kE8BjdGi7jRtl+9ACusuG2nesR4lWoHY5cROrd8
 LXlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7EpnieIJJD6bb8VD/7h0GifOY5EZiBy2Drw6kEMusfOm6r4F08JDxjbE3uhuT/O32fRndWVb1asvL@lists.freedesktop.org,
 AJvYcCW2UqO3XaJKm9M8nnKDO+ghcrjX67AtHlWmwjwm9o/idy+E+MN0pbjt2P6O2O4Xc4maRSYiMjKC@lists.freedesktop.org,
 AJvYcCXhejIGJueTuaOj7U8dCUcoXtnOh/X7sADBXyw9eCyVvF/M58MU4I6/tzUmigJeNkFB0y7uXgCldkuWxdp5QA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza0Sl8fHmxKCLqZ9RkAIujj0c+HOglbJrMsS85ywYvuYpNyaxG
 F1Ks+RoTnCoGg45ma/UZql3KF5FaeU0Ho4J8412nEhdVjfimavMo
X-Gm-Gg: ASbGnctbaN9fhjcBAAMInfLLA/YXk2TyYllNqDYhRtMSZvgLqNo+84eYvWIgIEy8Gq+
 Nb0j0dwh+gIvR4x41uw7ynAoWTN9q5SBaEjyDns04Y0sUc11jy4KXWh6y04ewJy57OgJVRZsD/q
 wf77Jx6XUsu3GUFlO50vHw3kGHj5AjAmX/6dpCgOnt0Nm1Vwd5qQOzvG2BT8/tPE/lLtwqhvZqE
 fO4MknWaRpMwtSZDYna9HcNzHTrn9+Qu8+jvkk/HuWYkfzG2gRpZWiggtxtQvpP2Tnf0/mwXUUo
 yPWDBNAKj9EgfLD6nVQul/3lrZy9oELDWrszBQyY1PfPlwtiaAmq3oRPcd2gvbOR4SBdK4pkaii
 /wQ==
X-Google-Smtp-Source: AGHT+IHe/pqeVfJKwU/w9Mu6w5oW6sxJF8LlG8OrV986EBMutyzx2qa4fxPX6enM0iFttCFAiE+Ekg==
X-Received: by 2002:a05:6e02:1a8f:b0:3d3:ff5c:287 with SMTP id
 e9e14a558f8ab-3d6d5535a0amr31645515ab.14.1743615774357; 
 Wed, 02 Apr 2025 10:42:54 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 41/54] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Wed,  2 Apr 2025 11:41:43 -0600
Message-ID: <20250402174156.1246171-42-jim.cromie@gmail.com>
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

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 5d9ab8adf800..bcf2cccac0ec 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -34,6 +34,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.49.0

