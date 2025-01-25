Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2BAA1C188
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83FB10EA77;
	Sat, 25 Jan 2025 06:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dsWBCTQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4133910EA76;
 Sat, 25 Jan 2025 06:47:22 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-844de072603so202538939f.0; 
 Fri, 24 Jan 2025 22:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787641; x=1738392441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28x5d6xbEGUAT7PLrsu8ZHGSSAEZicMzeP2EW9a2UNQ=;
 b=dsWBCTQ/Ohai7A5n9pFsu3HAslY5m29QK+NKPW0u3Ksyd/6MtWfsUvL/dE/YcgtLZf
 g4IiDNbD+HPUSw9TadsFLV8A2NLyo2OyoaN6fAb63TD4XEkLZjualUXbXADIunDWniQq
 M+wS3JT+JLCA/Kx/JYGhQd6qnU6w3y7D4sXxOw+xlRSIzoykxP3JVkAQBcoK080hZ3Oa
 jwaFJ8hJXncQpoQxM+XU/hrzf2kODzWFLFzr+dttMmjDb57GdN9AC9txOLvJvrPcXxW/
 WLHC4ybvgDuf9PkFXlxs0DLVzyM0LSJe4jaNpfNm5gRRkqOp2TojkfbOuzwoNxGipIcm
 bduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787641; x=1738392441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28x5d6xbEGUAT7PLrsu8ZHGSSAEZicMzeP2EW9a2UNQ=;
 b=ria1/vZuFAvIaTtbo7PFwPNqKU7JYEY2E4f9WiVLiUocXPP6kbUyBJaPsjlUJNmIsz
 HiDODxCGMsg/EvFG5A1txQv8mbd6R13aA7yImrKnsDQMZ32OQ+2PBVlU1sVD1v2EbuR1
 hQPRox2cxHh0JiWAvMnshdZhyJvrjj24vlIIYXUmN9AvDPASsMLy0A8KwI9TTSWCYyjl
 OTbEwvAf0nRq1kCt+zzEY4U6AYicyjurERZPLNwew8zMxdiSyZ7FCIhaDYAlBkAPcaZl
 320lC+aR75Ro3GHAhHYHxyuNjl1umbDhXUHqSRGaZoMiDv/O8S9Zh5PVr/qTOBxCdgzq
 QVlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfojH1AybIOOsNvEwV3Yh4Z3PuEKU2yHBZ/TiBdoluPTLu/+ZmlywH4ApSHywezYey7eB5nT4rmGTA@lists.freedesktop.org,
 AJvYcCVZi8SkHOHW2nngnZXg+NwCNglH1E6RfdKafOFb7PedqmTikYWCUFovxluwclKNh+/bMC4plV5tvNG+aTlJPQ==@lists.freedesktop.org,
 AJvYcCW2e8uYF+8ZP/1ACrV17RNhb2eHj/kpyqQ0a2j5bDfXqV3wv6mKh2vBE7TzBcHy6UiEg/tSRSTn@lists.freedesktop.org,
 AJvYcCXMbH/UhW9/IQAjrYEEevw7NklVemEYlu2aypMLOSYvpj9sAbXKcFG9TorIHmKXxUZL4EGlg5fKOa4X@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs20D4eg8QNJdUx1QPdGzEkwDsz8Ekl9yh9tkvdxGHknI+P5h9
 28iK/X9n6x2M5fjhdlVX+brl/A6MXfl1EMNb/UeMnhT+Rd34GP1j
X-Gm-Gg: ASbGnctsVcXhqDtJx5q9n5cKJt9skR2JoAuQlxcVl/hQz5l3Qhgf0vXIUVTUeX+7j0t
 tNrtT+J7WZtEb6gSPwKCx9fbpH3zfZrnuCBUUgrMCcVn2gPY74a51bFj9q3GC2Lw5098W9wjBKq
 5V0Hb+4AUtbXrSob12Q41ZGjLG2N+6qmBzDrFt24d/IM8nzF9Yj/Bdt4oJGL/I+Xk82h0O4A9MB
 dS0JoeKqpaYLrKi1RjrIV06oxSLnquHBmMN0nZG4A7VQNSMefUQHWQ/WqrcpKCxGVb4X25mCISo
 TQPUGysYJMurhrqNQLFkokhHWDQDEB6fwl8qxA==
X-Google-Smtp-Source: AGHT+IEMKrFEKpi5SUwkWWCosuXW3ioEVtU6ebYP4sTFzqjXc9Cj2di/duqbptCHxcYLBwKuqsDHFg==
X-Received: by 2002:a05:6602:2d91:b0:835:4cb5:4fa7 with SMTP id
 ca18e2360f4ac-851b62b1c79mr3161244539f.12.1737787641477; 
 Fri, 24 Jan 2025 22:47:21 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:21 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 41/63] drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
Date: Fri, 24 Jan 2025 23:45:55 -0700
Message-ID: <20250125064619.8305-42-jim.cromie@gmail.com>
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

dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
EXPORTs a classmap (in DRM core), and DRM_CLASSMAP_USE which refers to
the classmap defined elsewhere.

The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
redundantly re-declare the classmap, but we can convert the drivers
later to DYNDBG_CLASSMAP_USE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
this ignores a checkpatch
 WARNING: Argument 'name' is not used in function-like macro
 #70: FILE: include/drm/drm_print.h:148:
 +#define DRM_CLASSMAP_USE(name)

the macro is empty, and correct. only 1 arg is expected.
---
 drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
 include/drm/drm_print.h     |  8 ++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 08cfea04e22b..8f7b2aed81ce 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index b3906dc04388..46aa1bcee1a2 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -140,6 +140,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.48.1

