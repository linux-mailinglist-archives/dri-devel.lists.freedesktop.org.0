Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92A2A6ADAC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED06310E6BE;
	Thu, 20 Mar 2025 18:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YIbIOK/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB6410E6B2;
 Thu, 20 Mar 2025 18:53:50 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-855fc51bdfcso64466439f.0; 
 Thu, 20 Mar 2025 11:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496830; x=1743101630; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W1gVL5lJAtRX3Sj7ZSt43epD+xZQUqg7ig8oqq/1rgA=;
 b=YIbIOK/Oh+hzY/IySTGQs8BwSh5iqbeaEFTlXJtKkGobOeYBoqmLLdeBFNFYImu9OQ
 Nrp5Fr4jVzjIQypUrqvvbBhgMso10RaGQj35H7Rym+03+t7Zyy2oga4vxCEDS2idI1PS
 3Lkis1RhV2DC3WSruZr4j3B8p2XSur/MT7R43bH7XB6+FqiWFt5pI72wWeEf708WKHxP
 SB9Ln9xxflMvBiqE4maKqX433A9IH844tYkeMYU28SoRpYh5rpBHQx7BDGA5H6WFrbts
 U0zJ1hMqUkcu8Xkw25+bPzbgLwZ3M1LU35Amwq/ykc/HmHbCfkD0/d4hNEuXcUVUMhZ9
 /3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496830; x=1743101630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W1gVL5lJAtRX3Sj7ZSt43epD+xZQUqg7ig8oqq/1rgA=;
 b=qIvKpiAaYWTmpFqx2jtK4kJ9wIR2K57ku5/Ec8Xeqy+OSVyUVBf4RpCO4VSFLKYEWM
 tqbPpakEheX5cScPhA+gdzHCjpZu2naNoXfNWE0CqjbyFCdg1M1mzY4LcdQlftzDVJTv
 qQZLSoz8CcPPXNF5wzwV17cMRXvRf3kwLjT89xSiC2kyip2fxnfinrRMRK0+BLmNzqZg
 txNw8bjMBzJxiS3P23FMbyUVtIp8HzCJttU7jENp5OMVq9ikE22GJADoNKrGyQHcuiX0
 oEWAKvgw08wh5+7ajNhOjd5LpsqePQurwWfCQyql04KvdDpnrl4WiGFaWbdGwKxVOAvv
 n3uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1uGfaPbKe+4CSIwGcvQh19Jfr/BOywSTTpD7XkKIDqrEsWaK/z9k8vLnCnRZcXk0DjkgLHaRrssxo@lists.freedesktop.org,
 AJvYcCU735Hzvm9fJ/VhCdGR/zhnFOYDaQyovE5Hy4WjBNz79aH8OmwYiQDPx28Pdm71gVuoI3SU9A0s@lists.freedesktop.org,
 AJvYcCW5gpH6uNSWViafhKEdLeJPNHxgYO96D/4fe7b5p2/HSEP+MOeiw8i2HgHERsI9Hf4LqUKCUvfh7vTsc6XaTIJrDA==@lists.freedesktop.org,
 AJvYcCWYleDCopg7O94d4qpz1Vc6/ELELU3EknfE4mXdt55XK5ZuovjpvoyubWKrJjFdxwA0QgLCjMtKMgwt@lists.freedesktop.org,
 AJvYcCX/Cg0PmlOsoQWPtE6Vz7kr7mS8AlBmMdi68jIvNY8s0xqt2pyjDkF4yaL4mjEPypQfWiRfiHgp1FyC2AriMg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7SwHd5iMxNB0BnUo0nrpmc9/bWxBNW4+OaRHiavWTZtKnmujb
 fDsJRX8nmkuk4QVjwbLg3J+ul9yXWEiyAzKr4+oPVsadRXEyWuXv
X-Gm-Gg: ASbGncv8FUXw0B6Zbs6hqy9SDzFKBj+Ox48wlyn49YKL5Bd/1YscxlLv8nm54VaYi8e
 ZF2xxDX9gK8sLk8Am0ixeIE5iXldwuJW8oDDlV89ye/FYvGECAcj1TxrR2UMNa1S0/bd7tNPvcz
 3jpQNm5ii1N52DjuGNOfzOsAPxzSq2MHSdfhd4GKAkClMB8G0L90xVyTDlI/tOdTykNdBjtUr1U
 0M4H6UsbQpIznONUkUezSZAv3cX9tmGqSjwpcwsSNEVU/eAZfCBK4+JiLYnU3SEp9DgCRcdl7xW
 QBD/Bnw9jb5Jjh3PnoW4bnmo1w9feDxpqnIV+OmiZ8WWBHrJ0yEuvlrXQUT4lYp2d4WNhmHuwmh
 E9g==
X-Google-Smtp-Source: AGHT+IE1Zxq7CiZjQgYwsnaWE10QdCmVkXBUfaT6ifKAFgRdb5GHq8Wsf3mZdsiEyRGMPQIP52/JEA==
X-Received: by 2002:a05:6602:3991:b0:85b:5869:b5f with SMTP id
 ca18e2360f4ac-85e2beed32fmr86356739f.5.1742496829800; 
 Thu, 20 Mar 2025 11:53:49 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 40/59] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Thu, 20 Mar 2025 12:52:18 -0600
Message-ID: <20250320185238.447458-41-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/i915_params.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 37746dd619fd..2dc0e2c06e09 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,17 +29,7 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
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
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
-- 
2.49.0

