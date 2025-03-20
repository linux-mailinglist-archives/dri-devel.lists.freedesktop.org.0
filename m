Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E175A6ADA9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3311210E6BA;
	Thu, 20 Mar 2025 18:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h9dF6QwL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2770410E691;
 Thu, 20 Mar 2025 18:53:46 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85b4277d0fbso49356539f.0; 
 Thu, 20 Mar 2025 11:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496825; x=1743101625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Bsn0H7+fs71frfQ+1OquFl1HD8Y6SgOd3dNDu3Wz8I=;
 b=h9dF6QwL6H7ha9rtyczCvr+w2eQpJSYvgKBNI5SmpVC/2+5NjMGc8mXGsrcay/OQ6e
 PxEk2NuBNsaaGHWiEsLnOcltao8qr4DqoBNnI+vjRMKDInzbjAv2oKZrFHvfVa4pujVn
 ikjlLTjxw9TuOYx+qYF2vxJ/UN4VxvV0tMaZQswSDxm+uosIateGZbY3fQUYYndKK4gM
 zPnD7smYPJL51P/zfoDNxzh//SM5TtyPIDB34+p0HNdw5a1agA0GZ13n/fo9pNFQJ/6d
 TT6NuRSyX/Wo6e+AbukYkNza3LFLZgxkdlhm62UFN7lFmkRJr99TIE4UHl9kQUKfpNhz
 cKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496825; x=1743101625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Bsn0H7+fs71frfQ+1OquFl1HD8Y6SgOd3dNDu3Wz8I=;
 b=B5axzQKuomxdlcf8/fbKsGW44Xjj+rvLq4f0rKo6vyd1sb5c8oKGhSoqUKin3nk7tB
 jylSAiQdocRPvrIK2EP+2qNXD6WN9b7XZ6GDKPylRAJxoxzHhfosM2Fsy7aMAVCCLX1Q
 yKNkT5B4TctLo4CBcfOJ2ImtqnBPDflCUe/qOh6aRDCDrYeuQF/kU94nr5MHGiUDP46m
 puEtUzWTwrZivW+FaNsIarMUWMBYe3C6zJ4oakb8WUevpik+ZIisekTwSBvjGW9/W9VO
 VqarjinlTvMQUj0z9nEyhyBZpI17CPj0j4kspTrvxaFJxOy8/lyfWy7KD641zm8SWnxc
 WiXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPnyyQMVOtyXNBwECSLOL6UbHGJzZx7wb1+rkbeJw/ckjq4NM8PmhIPESeBjFR+a+FxGQ2WUpnYm+y2FuiCaoJsA==@lists.freedesktop.org,
 AJvYcCVnEDv1p5rqi2ChWU6VwNOC2HjK+Zq++JEUC7hYix2dcO9LDYW43paQKGoNKr1Ex00RwkgxupPTJkQlJTaAeA==@lists.freedesktop.org,
 AJvYcCWVpTS0lAIe9vdieujqLGWpJRW5C3TsUVY8ALdBXv47jP1d0eM3PUUvlB4CTH0BeXWIQNIAMe794GxY@lists.freedesktop.org,
 AJvYcCWgoevG57HdC+nKzi5V1BxPH3y6giktsiUFkngDJ3ST7nP5h/etXXREdov/7zPUqdCX6oKPo462@lists.freedesktop.org,
 AJvYcCXKbgZ39remSNVoNJWohvyIxlKF/m8CY6MoVLHPr98wYxsVNVmlzSWpvEbfLCFtKbrbPDPjSOGgLaCe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAjAo3S1R7KvZ0VD0N5sJAyaaF4Zfma9SPCvdRbeGzO4CZtAVt
 CoZ48SB27JaTpmbvdiOJOWtAxXhNnH/OzJ7PkalvPl/pYUOB9VVhfBwPSvbu
X-Gm-Gg: ASbGncuCnqMFe804+Hw0UbGlvx0ZMzPRun45xgz13EDwiRHtIbb6f2+E1DoIPnxqSKG
 4DznX97wPpqswopsUUskqQoxrLpqdL/DWMPZQy6i9YwoG4sRagYFJOkShbryERz8w4072RIKpEM
 QCkY7FpTPnFpS92i11rCl5FoGnrNq10oB7Y9psUXUA9P0IUcN8GyoqKONIW+RShPqw3F4xJ9/JO
 0mDfJczIsz2I3CseZ1CDvhVyyrnl82+HDEfNGCwM9F9ZGNUeO+CuKur2IddCWjay2ii5qONOoWr
 PcTqLQ0hOAMtvj8Awxs0rlajhC9Dja1BKlU3NOD0+StkW3kqRKHRGDdwX2ivDEOP9vci6095Jt3
 rzQ==
X-Google-Smtp-Source: AGHT+IFBsswm/PB9JzXq4uuRlWaB+fwcfKZNp5OK53APl/ScwLJfw2dIo+UeZ8s3nXlJQ90V+RQYRw==
X-Received: by 2002:a05:6602:4c83:b0:85b:577b:37c9 with SMTP id
 ca18e2360f4ac-85e2cc5fe8fmr34189539f.12.1742496825365; 
 Thu, 20 Mar 2025 11:53:45 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 36/59] drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
Date: Thu, 20 Mar 2025 12:52:14 -0600
Message-ID: <20250320185238.447458-37-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
index 79517bd4418f..a3b70d104afa 100644
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
index 9732f514566d..e86ebb716b4c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -141,6 +141,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.49.0

