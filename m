Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483CA79437
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290A910E897;
	Wed,  2 Apr 2025 17:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Acu115tc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B50710E8AB;
 Wed,  2 Apr 2025 17:42:47 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3d59c8f0979so3699655ab.0; 
 Wed, 02 Apr 2025 10:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615766; x=1744220566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdzbEW9zH0UE5x9JfjsCyVhdiuYXlGo5WMhyJQ/maLs=;
 b=Acu115tcqHH1r7w0/Nz9268tm0fsXE8t8it8xD2fXUcRSbeuAJSoUIqsXp5sVTZtva
 S7h1PJryMGorSr82F8KqQJPkTg1ooTFre9jOGQdsqM3DY3GGcJEZdAu/YtKiLYQzMLwW
 0OhwpktzCo8RU8AAJHyDtBDUsFyE05QzzWCvTcTZAyi04bGCxXhl+2GcMiDiFMired2U
 dAzOeVfCfxL/kmAUpVcgAQOXyq0AfpECxrx/qL0PRmQ5TepdMWzLprsDiPBwgjEo2E6J
 1tskQvt0uEoFdr7D2QD4oXMj+B/D9rRu5CI5LrzoRprwWBPXnEtjhTPrGsFmYa7yuxB5
 b1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615766; x=1744220566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdzbEW9zH0UE5x9JfjsCyVhdiuYXlGo5WMhyJQ/maLs=;
 b=p2rMoOv9mFo+U7FwmoqPV4WpGH0jg527iIxh4VcanPtRe/c8/tHL/IBF6dZ0Wf1LlK
 6iox5kMMUEN6/eoaL+SRGHrKaXbRbkpiggs6dryFvjDG1v+nUzg2PETC4RbiRhEWMOvY
 tq08a7nX/vY7skqRDs6U+dSalF9cfMRZTroiHRPpsqKA709P2Ji3+zhg9EqydrcMQvfF
 +mJqtXcCkKvY4lQbJ/tv0+0pCoSKjP/dvF1cl8RwqxX6E+ZmI7mBcRjLrD4Aq0Y3a3Af
 mPLGtd0Po3C2BlF46i5vMMz6E1Qubjq7B12gF+zuFPvYsEquFNkUQnWROa54+0Y+3kw3
 bpAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKOy+kSkE7L/EWdQR8PE8OVCwiRB1NPy75KPnaef1mat3BNDIn8ZocVsYQT9fFW/D+19zX7KXu@lists.freedesktop.org,
 AJvYcCUblxJlZDuZfj6aqGizesjc8vub9rJoxZCq6OFwiIC4VxGr5/Is9QAzTzwp3eV5eFUl/QtlXBn5rzxkNnf2pQ==@lists.freedesktop.org,
 AJvYcCWf4NiuklHpjiNfyNnzZYsOjZeBaNTpRpQhNM4awUs58xufiWU5yyubbsHVxtT2suqI5zuM6WcLwgGr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy5GpM9Gy5C2FGtCqxC9dNFlxhmAv1HIr+q5GAGgrOeORvoVLs
 yveS17L4iI1Gds+1npfLPsYgDdHUa0LgL78fIbORhQYgWcKDpQj2
X-Gm-Gg: ASbGncsECKAlCDEp48/c31+3d7GoYP3jlfN8/2oXCrTPhF66lyfu8cc3q+eKpOXmrZz
 IHgn0QBX/zKhPWQmsuax5XBChvMnWg0DBVFHxW2GNkQ2ZYo5PGCBv7NWMvTZFw3fqE2TKCcHG4i
 8BI/2xa5AAfLOvYizYbyZQs/7IGnfuvGyKYv83wRorm8Cj3RJnEFKjV6KDGII+mENfZtIC1XNDu
 X1NGpJ4UaDDLOd7zbOSxKrRvkO1M0QPa35Dd5o5zM+qFoB3nBy2jDc7YATUlI+3sR47FVkH7sQv
 ploqKuJIxvLmIxXTpRYQbqxFViZ+VcRV6He9cANmYpTgxz7MWhnZX4SkvYL3Vh6SjubKuYf7mDe
 4Ew==
X-Google-Smtp-Source: AGHT+IHM7tagESMun47M5HMS7lAKv6qUWexzrO14AcKjGRpEF7WGOj0nJoAxliwzZGovvAJef0zyEg==
X-Received: by 2002:a05:6e02:1749:b0:3d4:6ed4:e0a with SMTP id
 e9e14a558f8ab-3d6dcb5e15emr6148965ab.4.1743615766244; 
 Wed, 02 Apr 2025 10:42:46 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 32/54] drm-dyndbg: adapt DRM to invoke
 DYNAMIC_DEBUG_CLASSMAP_PARAM
Date: Wed,  2 Apr 2025 11:41:34 -0600
Message-ID: <20250402174156.1246171-33-jim.cromie@gmail.com>
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

Invoke DYNAMIC_DEBUG_CLASSMAP_PARAM to hook drm.debug (__drm_debug) to the
DRM_UT_* classmap, replacing the ad-hoc wiring previously doing it.

Add DRM_CLASSMAP_* adapter macros to selectively use
DYNAMIC_DEBUG_CLASSMAP_* when DRM_USE_DYNAMIC_DEBUG=y is configured.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 4 ++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index a3b70d104afa..46d53fe30204 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,12 +69,8 @@ DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
 		    "DRM_UT_DP",
 		    "DRM_UT_DRMRES");
 
-static struct ddebug_class_param drm_debug_bitmap = {
-	.bits = &__drm_debug,
-	.flags = "p",
-	.map = &drm_debug_classes,
-};
-module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
+
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index e86ebb716b4c..8758449491b8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -144,9 +144,13 @@ enum drm_debug_category {
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
 #define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
 #define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(__VA_ARGS__)
+#define DRM_CLASSMAP_PARAM(...)     DYNAMIC_DEBUG_CLASSMAP_PARAM(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
+#define DRM_CLASSMAP_PARAM(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.49.0

