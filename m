Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE9A7943A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6AB10E89D;
	Wed,  2 Apr 2025 17:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rhx/GeQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C14710E897;
 Wed,  2 Apr 2025 17:42:49 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3ce87d31480so493295ab.2; 
 Wed, 02 Apr 2025 10:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615769; x=1744220569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UexT083kjVXSMtfjeXG2YLxPBGob4DA2kkNTE3v1uqE=;
 b=Rhx/GeQY3ltV/2oJbfQHK7C8jVDlSVdXvO5/1/iqQxNvxp+cKj4oI52uLqC1PRLfao
 sopkzOY0HrKgDzX7otI7RjJd93lE1VxBmJsNtY6OfzdU8HUYRMwVS8GBuA5RJ8FUIdGB
 vK02skiHXWwnkGt3iyuJdF5J0c5SgH33N38DiY/h1SJkzLjplZemEHrys5hJsyVvokwV
 FJwrJ3o39V/XaiwE3A+Y7oOGpLxbRgJFS/n2X8soaoJ0FDJW5JiOAe7wvOCXLCA+tVcR
 VKjZ1wp7RTsrUuI0r9p9o9Vjaf+SeLjqLHoyS+wyq8BUzxLo9siuFFvcqueR9kjGmWDL
 C9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615769; x=1744220569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UexT083kjVXSMtfjeXG2YLxPBGob4DA2kkNTE3v1uqE=;
 b=NP7lh/kj89rNHg6XdfE25caCuYjzgF1VkSwqCvr48RF35bjqZ5Oo7BtihC6r3gw1lZ
 yh4yceFTQOd7WK5qXTdJUAlWw7bwyD3Pt5B4jxeYnhqjyN8hODkIJSaIL2J8dl8btrCa
 ahIMiwROYK6F0LAnu9CknEBiFW3w9q/h+s44wUC+UOTtX31wuaq9e/o/yRlFDocIuFoS
 t253p48eEIc8JWFqOp678NejIGaZoYSO6DOf6+DhLZ7xC7QE1x2zTUltjFKlKaSv41pO
 bLEaKjecBo2Gc4HWjrtTBTqASCIU0sGpeQsZXlL81ceuFnl0rsXcAZ/Cdoch+ENSDGUI
 BPwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNKhBo8pkGdWn12EtUwPeod9wotp56KQoYN1XwvuEyVvBu6wJ8FmALuWK/R5bPm14eUyCtEAgpZCoo@lists.freedesktop.org,
 AJvYcCXYh4MzEP5p60Siir/lCFPi+VkYyGJqqq4dPXp+3nDUTHlHu9kZDRyOO2HXJO+nmB6LfAujH0WdpnSG09M0Ng==@lists.freedesktop.org,
 AJvYcCXpaxpIZSHxxgE20gJT1FghZA4qM72wwxJRC64GIcYBek7UltVL6PDPVCD1twCEA7CsmCEDo6UP@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2vvE7zOwb0HZA4CWX6Xb3+CQ9fZnyHBsF9kdC5090malKb8Mr
 ya6lcfH64O84rzdEk8maMeTan+GItBchAbPVyYfwwMRYL0THPcqE
X-Gm-Gg: ASbGncvb10j4ppCXCKyZmdh7y163wV+atyKfbcvaEydPctJ8nxAWAMsaoPE9rC5PCPq
 vTcCGrzfHzkjq5wCJdHCIjTEFzZhS8d+bORxKMhfn+A4AN/ymTatZjQljbY9+gROhL2ahE4uION
 TTT2jz0nFsrHrifVDpIxV5gNAzXgnP1YMyhr03OYbHpD0HwLr1V/june0xhtalwAGYbBEDwsiyb
 LCtBS+S8MD2eb0OfCjycHQ9iPCoU4ZYtNwRUvrEiymoZH+GkhV7Qm5RPlk8+3jmiFpTLVPtj98r
 LLDOVx3PsNZIbdcEKdKzQrXd3xbExSiJiDbkDd2J291JrhGqcGQHAj6rdYFTFYTSg75z9wLaWpD
 EbA==
X-Google-Smtp-Source: AGHT+IG2+BK5PK9DVFs/ltNR0E73frvh29ivhJ5H3WwGU3GpDmZNKKN6o+UboVJzXIf7Z+nQdkxLrQ==
X-Received: by 2002:a05:6e02:184e:b0:3d0:4e57:bbda with SMTP id
 e9e14a558f8ab-3d5e08eacfbmr222774665ab.1.1743615768727; 
 Wed, 02 Apr 2025 10:42:48 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 35/54] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Wed,  2 Apr 2025 11:41:37 -0600
Message-ID: <20250402174156.1246171-36-jim.cromie@gmail.com>
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

