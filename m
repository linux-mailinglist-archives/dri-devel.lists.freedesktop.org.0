Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58F924A79
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA2610E6E5;
	Tue,  2 Jul 2024 21:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="edI3UR31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2F010E6E2;
 Tue,  2 Jul 2024 21:58:52 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7f61f41eef0so205080639f.3; 
 Tue, 02 Jul 2024 14:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957531; x=1720562331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82cgNbRoYEtZbLGOSF5g6lGYBT3iAgTZZ5N8otaIkxw=;
 b=edI3UR31Z5ZgSERtLXBBy8YUMytYK/ARdjS6UyKtDx1SoiKTdt3X+z7WIM4L/wsQzE
 Ef0NOZc5wE/JadxRubGrsSlA5hYOuYr0bpFvYYCBGGeFe+U98oXGEGh04VuOOcW5A/4z
 9tXqmucbJRJYYk1/mSQjgvAuGWkQ22Wq4UzetE5R4vkMeyLVDnMuCcqn1ve/Foth4FbL
 VfoxU1DtITZCBUSplXRVP4TGt0i7ZfhzOcHI0xcTsgIglO96W4WKJaZAevftd+Uu8sv1
 Ult0AlXaPasWh+Dqm4ouYoKIWfrZKgnX2oveylV9LYPx/hBmdCbf/hwxQGskFMES3ZAp
 ERSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957531; x=1720562331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82cgNbRoYEtZbLGOSF5g6lGYBT3iAgTZZ5N8otaIkxw=;
 b=vHwdDiE+QOybJEWrMuOWNu0HOO3+RaYcdmijJ4xIqWRhNcKoBYKk9C4afHNgR5+piC
 a0kxtnf9RYESVoaLfplRW10x2MrNPoNEVPCPpU3xG0zv8yzy0+RczK/Ru6brfHCyTk4C
 iXMacOcCrvdUrNVPXwVRjB4b0EqBW5ryJYlvOdZ1anPu0bMbH7lFUF3zwe57FnQBcB86
 tN0rBHSGbUAIAvXZpDO8RZc8ZE7PJ4waAVF7iIiQUCT4Ceh3k2cOQxFMeNbvqVBiEtHf
 N8CAreVOWgdbRVgDXSZFhz7tS+Soxy5pMzf8onaMV7a0B+yVPP/ZQKK+f3RSeunkzYbE
 8lXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUfxKFsXYbIRxMiv+lzIeLR022V6ucghyXPS+JxsfOt5/TbRklUkx2y94HKotBjX1KfUYQXTrnP0IOoG+fyIT+zeOfQEcHDVyxZYEGn6kwwo3faEwHTAMomgnzli0S7c/GrddbaLYz+37yeMHLoAq3uD2S8yaBMeYck3TiTUx66vopnpXJZ6UhqDyLK9X2hmSnbjZDyFgrOm/tclzLrlxoEb2JYKCtdTf+tQmwdL95UDq66rQ=
X-Gm-Message-State: AOJu0YztCWwpNI3EKV8k1zjA/Gbhfxj/yd8wyeVUnuNkDYJiSjKIdMbk
 u//VxV0fkzgvnHcoLMvgdSh21m3y7k0RJUm0Id4o4LUIPZB4ixOF
X-Google-Smtp-Source: AGHT+IF0XfGuaBZergfyh09/+1cwiSfDW4SSxiw5JoBgqXQoqE0seQNYvFesDvoSIIDGsiZcxnz7Ow==
X-Received: by 2002:a05:6602:42c8:b0:7f3:d811:d808 with SMTP id
 ca18e2360f4ac-7f62eeae89fmr1232570639f.17.1719957531440; 
 Tue, 02 Jul 2024 14:58:51 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 31/52] drm-dyndbg: adapt DRM to invoke DYNDBG_CLASSMAP_PARAM
Date: Tue,  2 Jul 2024 15:57:21 -0600
Message-ID: <20240702215804.2201271-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 6 ++++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 4a5f2317229b..efdf82f8cbbb 100644
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
index 905fc25bf65a..95c667934bbb 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -141,11 +141,13 @@ enum drm_debug_category {
 };
 
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
-#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
-#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_DEFINE(...)    DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNDBG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNDBG_CLASSMAP_PARAM_REF(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.45.2

