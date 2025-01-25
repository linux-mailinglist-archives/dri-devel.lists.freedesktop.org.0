Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD1FA1C193
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6D810E2F1;
	Sat, 25 Jan 2025 06:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VTxm6LCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA7F10EA6E;
 Sat, 25 Jan 2025 06:47:23 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-8521df70be6so138813339f.1; 
 Fri, 24 Jan 2025 22:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787642; x=1738392442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CdP+5ahFf+s27dJYZ4lT8xt9OBauCFRo3IWsY0YnyjQ=;
 b=VTxm6LCFf0TExJB5Nuu411xymikZBDuk6/5w6Fn3i8XJkWYXNBC6XM3GHwLC7QnlzT
 4qgVqbR0g0R05PYO9u5csATDWl1woAt80ramFYUtUWBZ0W1r2NIrvBt37erhnM6U/9HI
 8U9WWCxc6noQ6mQLoUP93/OGRMuj5gx2mJYygBb5fhZd8MQadjIurgguXTjGtXDAJSAm
 G70Su1LkoVuB6SYNel5z25MzdKJXAnOX14YQMPjdX6bdZUS+peltoPUnEFJsWDg1mCjV
 KvEAZpzzpVHC8/MpTng5PQx4ff5IF2yAOlKTByUOk36IWalVcanAVhL0pI4TyH7exp4p
 RRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787642; x=1738392442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CdP+5ahFf+s27dJYZ4lT8xt9OBauCFRo3IWsY0YnyjQ=;
 b=JASYzlEARqlqtCgxdSVcY6GnFpWEJPKw82EqeeO9qtAtTe5et+qkkJsaX9tQxgm675
 rfBmdQvDPJyt2QPFCmd5OxhWNFmurxLw4rFjtr+DrS1rQSF79auAXhU+J9NrwHsF9eFd
 ZXK0ke07PP2Q60uWq0hgN7F8KoRQ5LktXbTOIm3YHpq6IXmDZ7Rb98RosKmV6vqOYFyJ
 X7QI1IPpWcuiJUsZ96qhEvnmr5DEKhqziFcnIyPoJe++Ki2+aR7R5Ou5h65DpHAilm/+
 F9V9kYvzGZTREgF7rtjXqmlv2d1CncRfXPrQyuqDqUViMLrV9WaXuW1OsAIaMOXNs1s9
 l9Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDkR32aCSwjeWi4Blu51eRHZ569mTJ/hrVJ7YwNWLqOUjdPE+VewjVL7+bRDJfO7JGtWTcs0dOCPst@lists.freedesktop.org,
 AJvYcCWPxbzYxE172NiQlZ59aGdL6DppQy7QlJZp1cq+fi4mig/z9vREIl+wFV+gjLQM505hh5GMdbtQmkFU@lists.freedesktop.org,
 AJvYcCXIQBC6YNZ/8D/pMpQ9zvKkzUVs66i+z3Hy84KAPVGR6Mqb+6gAL8BMZR4iJE6sJnpuqxJ9tiVuXYcSpCpYQw==@lists.freedesktop.org,
 AJvYcCXg8RWgO1d4e42rTuXGRaoSahlm93yBZKT8m4EcQEBHSyyBYy/d+3F6Qcc40ikO+0ODfNyIknbr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4fSQj3qXnoXSAAhKhHKJd9udl5A8mg8neFLPPj4GmFxtR507a
 MH8+ep6LyOHaC7fm7xYw2VLXafePxNgGFSwfYyXob6s8vxwGO1hy
X-Gm-Gg: ASbGncu8kQsVWbdPZZ1ylor6PU2T/ENw4B/dcJIhz4Ua+FpY0fQpJPMsviBX1z6AjHu
 T2ESneXsNjp7v+UJk3Pac7ovycT5ZJkm5RjXTAoAe5CHhwtDg+aYReXtzPT5y1Eff4mfo7awqnA
 oCGrqeosjQr0mSUSelWshZLckDxyWgaxco3Qm75c86dReYYvdSCWlKKaDpxDCNjgIKeolkPrk0e
 07gEv9Po93j7LgywWlZF82aZRIoiKeDcr0rXZwC+Lkb5T0wBLL/bWeyIAqTPZi4zVwnsvMlhp/R
 N6w+90/C+0oF0T2QRq7nWyjhQaPD6I9GcFxZ1Q==
X-Google-Smtp-Source: AGHT+IGP0GWDKG4GMuUlLSKsdtYWo97WA0h3IFnQzW7R7bdxh/A/DFPj3CVg43yxHZDS7JI/Popefw==
X-Received: by 2002:a05:6602:3c4:b0:84c:e8ce:b547 with SMTP id
 ca18e2360f4ac-851b62b1e17mr2865443039f.13.1737787642440; 
 Fri, 24 Jan 2025 22:47:22 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:22 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 42/63] drm-dyndbg: adapt DRM to invoke DYNDBG_CLASSMAP_PARAM
Date: Fri, 24 Jan 2025 23:45:56 -0700
Message-ID: <20250125064619.8305-43-jim.cromie@gmail.com>
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

Invoke DYNDBG_CLASSMAP_PARAM to hook drm.debug (__drm_debug) to the
DRM_UT_* classmap, replacing the ad-hoc wiring previously doing it.

Add DRM_CLASSMAP_* adapter macros to selectively use DYNDBG_CLASSMAP_*
when DRM_USE_DYNAMIC_DEBUG=y is configured.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 8 ++++++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 8f7b2aed81ce..b5fe0c37dcee 100644
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
index 46aa1bcee1a2..53b62b6459a0 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -141,11 +141,15 @@ enum drm_debug_category {
 };
 
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
-#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
-#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_DEFINE(...)    DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNDBG_CLASSMAP_PARAM_REF(__VA_ARGS__)
+#define DRM_CLASSMAP_PARAM(...)     DYNDBG_CLASSMAP_PARAM(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
+#define DRM_CLASSMAP_PARAM(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.48.1

