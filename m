Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4BAB19205
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C63E10E4C2;
	Sun,  3 Aug 2025 03:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lbx0iZaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA4E10E4B0;
 Sun,  3 Aug 2025 03:59:25 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3e3fcf5b150so25033635ab.1; 
 Sat, 02 Aug 2025 20:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193565; x=1754798365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qE6JxyQwiWHZBMKi6WQ8cp8jsc9voUk1gJ0tGlbbje4=;
 b=Lbx0iZaFlr+tPXi+kq43pKjYenOZKL6ZWr7vVoLdzAKzYIgs7Fgvo7v941haJSQ8HQ
 CKl08PKI/OMwMVqBOiCEWDe7+4rN0g2YJ69AUOohtgYjmM4JRj9Vt2EGGbqj7ywbJe/l
 HEsaUdJLXR9PzF/21rByngagn1DaYTp5FSff/+7qi/EaiMbl32TowLe70YMoXwoyDwPc
 i6NRVk++Kysh3SZH7H0a0kClsSIW+5lmJBNagX47RRjHFDPrxSsOqNc4uakwOjKpDxp1
 sx4zmaf6lJcZ6xWGgrr26vJ+ySSjr8qNIl0E7SPDyRzFc6j1KIMdWizjvI/52lKIoVH4
 p0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193565; x=1754798365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qE6JxyQwiWHZBMKi6WQ8cp8jsc9voUk1gJ0tGlbbje4=;
 b=pQ2//1mIQTILaE6UEK46Bk7zJHYG0m1GAONGEFSaSpqK0JFWuwgHK2GtIH5o4C73Mx
 02pSZ2QvrlW8DaoRZkZIsAfCcioWif0xzzFVakLj+3cTDFBE6MJLpeI0FzNsXvuUjbDM
 Gil1IDLSFXZQo8LgwP/KtNuGMLKYvB1XPn0TXBvV3lfI62ru5126BUxVVqesaTofEZwC
 N36TB05BZtJP9V5oyY7u4z/LzkrP1/LVo3w0F9YK32HuYi/vIboa02PVzmlZ2AkwuDFA
 2oXxAOyUkH8gYhHaaZiuBbnBHB58c4BWcDW73yeiitDbgpjlD4N1KOUUL8LFuEvex/94
 WQDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDZ+tZTfuZU1fBa+i9gj/fxqLf1L5VN7lSKXd21YSOUhu2QFhuelNVaustQC84nc4pVC+gAUq0zCMjbkXwIg==@lists.freedesktop.org,
 AJvYcCVXzmOplbroa2DKHkRlyCuaxwhClcv8BDwHwmXGRm13ScLX+c0Q679l1xMBh9KOUl1xMjN6kqao@lists.freedesktop.org,
 AJvYcCVf5+BiT3AAhutPV75TxKbtsjoOuCxQCV1DsF9YF8aUbGNebYcifBFmEuf2GN0xR2qoQ2UFA9m74Us9@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl+C+WJhxjiyWBsq/AuN/60ffJ6/kSwgR1He1ZBdJNyVAD/ly/
 n18fi+uGajQFbCVAJkSpRov0Wtt6HBnYuBoUpPT0aKzOJ65OkuNM72rS
X-Gm-Gg: ASbGnctfwN05JqzkXKxJY/qrCKwGfJRHSogNja8x4uSm4uJ58Y005jm4EYCHDHq3dei
 PKdIoD1sQQGqmUOVFygekO3kpo0ODUtVCYUMew6l4uc81MFQ/yU6nADhiyY8HgbXG8tRKmwBGX6
 ihmimwTee9/7LR+h/RZxEVz2LUnlNK3txWeyovy5bY4N+K1NH2JN30VcZLE+3Q0tntRzWHXLmvU
 javVxqlXqc1TaybccCNpXcFijMllnueNcrz3lcenDP+L5ZnURqlj4Xvs9lwMeiUfCyHjCs/Utum
 Q7Ga8CrEz/4eUupKR4/dt0EaB69IZ7Bb7QJzACUqSztx00rCgRZmhQ0sSHCLHwRl5HT7iwZkVtG
 HNu7ZYVe+CWW1coDdd8hJVp3IcCDqgJQMeG6YYICcNUvczfSNC9rECZb9+XpdGqpMt1w4efGfcR
 mFGHrH9xwCHPoo
X-Google-Smtp-Source: AGHT+IEcJd96ZbRdB8HACajO/EedKr9dmR2Fy+zza3wMWxlrICb3NJAXPqemd5+ww/dq/aKcOT0zCQ==
X-Received: by 2002:a05:6e02:1485:b0:3e3:c6a6:2799 with SMTP id
 e9e14a558f8ab-3e4161e006dmr101903435ab.21.1754193564670; 
 Sat, 02 Aug 2025 20:59:24 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:24 -0700 (PDT)
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
Subject: [PATCH v4 34/58] drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
Date: Sat,  2 Aug 2025 21:57:52 -0600
Message-ID: <20250803035816.603405-35-jim.cromie@gmail.com>
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

dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
EXPORTs a classmap (in DRM core), and DRM_CLASSMAP_USE which refers to
the classmap defined elsewhere.

The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
redundantly re-declare the classmap, but we can convert the drivers
later to DYNDBG_CLASSMAP_USE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
index 79517bd4418fe..a3b70d104afaa 100644
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
index ab017b05e1751..03b0a2bbf91b3 100644
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
2.50.1

