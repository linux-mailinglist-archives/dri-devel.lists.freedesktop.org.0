Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B403B1920C
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B4410E4C3;
	Sun,  3 Aug 2025 03:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iz/COh4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BCA10E4C3;
 Sun,  3 Aug 2025 03:59:31 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3e3d31a9ac7so12935035ab.0; 
 Sat, 02 Aug 2025 20:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193570; x=1754798370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqxoGMNKs0zT3PFEOQHIVmiXhAzu6aMNCZrDaU5Xy48=;
 b=Iz/COh4w7XvSWkuVn1VsV7WlRNCm6XgftRrGwErTfJP5aOdijRi9yN86LxuQjtC7PC
 TQjn479W9EHCTIYRo3nW1fk2sNpeo+AN2LL8HeHxmWiZDaZWaBMnokRqvjiuRBX16t7C
 XacWgH0/zwA0eXzndebpwpXQ1QWE6GNhX5gaPGiWIfReN+M4GsmiGew2b45RTiLZg0m8
 hhUBu17tglfYDaHf/gF7i0EFZq8vh92qmxhaO7bJJIwuwppWVfT17Zvxzq1he9ywwWtf
 SEE++vbXAh+Ge/86o/uU65AikanMsdxQLyY1kyDZGxsJTcAYoToKQTr+iSSd5sXVdboD
 Y+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193570; x=1754798370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqxoGMNKs0zT3PFEOQHIVmiXhAzu6aMNCZrDaU5Xy48=;
 b=h44Ozy4EtSUrx32wK/uWoRwyETM2/yhPo4mpDRmYGi+qeWIjEnTk9XMX6cbE+o+i3H
 Hl3wuAN7qB1oX0T3DHOK8I8Og6mDQpzpU9f3Cn6QldZgF3DBX1j6tMoIzkt5VSVdl0Gu
 0sCka7h6tmfnugd+f/FDTKB4R7AKRRRiK2pbQNgdMe4OhD2Jm467UFqozTJOowlQWqCh
 xBSUCsN09Syb530zzU4CNEOypIKSFcFOWI8jXSflqRyx0cq8T7AcLuwvX+6KBzddTErT
 rxx7F59U8UBXUn4pu6+jizasOHUFIBSweTgTO0sesCXGckKabNPN9vh+Y6Ur6kuT9lOy
 aJBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbuE0yqAJBE0Pd2lCu1ZtQZC1OwiYpkiQP9RgOfOSotQd1PHp7ua92OBb4PMWbj9jMcxq+96VU9M9VsmRmNQ==@lists.freedesktop.org,
 AJvYcCWQLq3I7+cCbrSViUipJxJf48PYykF/uUnK5GR05M2vZ8lSp9K7lbXqTqjL0nyqT7lIEvwWnUEr@lists.freedesktop.org,
 AJvYcCX645A13y8lGiY1c+tn02SbB2crOo+cq21TQnWD6cgrSp07ShDo7bf8rot1SUqDQiNc+3nTYwT1VqAW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/EZngs2Bj7gmDUuTFjB28py7G9WTiviCG3Bg0tH4En//JrT+j
 4bndVoYQKDWsVuUUVDpDinF3QvyPAeeXND2fEAcEAbxNV0F8IxOZDZnP
X-Gm-Gg: ASbGncuH75YmOLYj9RzCWQNyBWiIOJi5LuZ4anfJaA6fzFK6S2TZO9xC9LqfIVZhtb/
 L2c8Z/qAZAKy1lu69pOgeSleXmWhtNWY+ArOeu5FQ4998DdH7qsLRcB3dyDzLEnE4gmLv9W+HQ1
 T+GqNpdcgfR7sRiH/uWs+7YOJvUBQeYdXZQqgw9ozlno/Y/jl1slg5JFHwTcHolKoocag80FJPu
 4rUyvPcVrbt3689+9afp5psTp5a/O7E77Uhj8ZioqbZNM84LPohtqzvgS9WDRW35MmphjtIf2jo
 wWlq2Wzu20amsKtVTEAMhSf0AB3IFHCSmMU+Qr7RCKwNKiB6WF8vYzxxxD5lSd/Z6dB2vED+9WG
 IvjfMZM8hKw6IIsBQXAW8NiT/4J1AjNDtA6WPy83hbHynzxIeJuufF89cbchnJMmfF1YOit7BBB
 guYQ==
X-Google-Smtp-Source: AGHT+IHsfQJoD6SRNz26VMT+qJigHz89jvyvI66oHmBULdJ7IaJZxTqFyxCoP7GQo4VUZTT9hDwD9w==
X-Received: by 2002:a05:6e02:370d:b0:3e2:8e44:8240 with SMTP id
 e9e14a558f8ab-3e416345ab5mr91990955ab.11.1754193570153; 
 Sat, 02 Aug 2025 20:59:30 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:29 -0700 (PDT)
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
Subject: [PATCH v4 38/58] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Sat,  2 Aug 2025 21:57:56 -0600
Message-ID: <20250803035816.603405-39-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/i915/i915_params.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 37746dd619fd8..2dc0e2c06e09f 100644
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
2.50.1

