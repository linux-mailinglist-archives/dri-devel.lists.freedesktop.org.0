Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5BEB19218
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3E310E4CD;
	Sun,  3 Aug 2025 03:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iOTqrO/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C93510E4C7;
 Sun,  3 Aug 2025 03:59:36 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3e3f152700fso12488655ab.0; 
 Sat, 02 Aug 2025 20:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193575; x=1754798375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zl5QPlbYy//3A+9v3q0806p6kCi+/AVd1aBX/P0nslw=;
 b=iOTqrO/UHNk7FMCUlfzZM8BrXX0zVqR/zjLueuv9OxfFByOqtkSJOkhiMtkhwHGwgw
 XaX/mv4Ms/T11E9vC8xU2OWQICkKU9q3TCk/IIRBjuUB1JraOlv9VVla84ytwZnzkbJs
 XmodcfyMKQWjXs0FghaIPnS2ctOLdgGLP27P0smXGAx1WIUxUAoqYNsTDxAdbVdf6oVr
 AZ6ZZJg35rX+NNrAgthxhLfNtWJtc1rTYxFN/QG2HcvNJhAG1Yd3VAvF6gTKAAsLKaxm
 bF+7D6mQ+ZuM5HFfxbEu//mtaUHqY8yYBYxyQt0g3KtZExKRBnhSIz02Oantv7eY4GnY
 UmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193575; x=1754798375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zl5QPlbYy//3A+9v3q0806p6kCi+/AVd1aBX/P0nslw=;
 b=X8yHUFjn6CZt1wUjhDbmvl7cVocmI3Q/rEAJgYn/awH5tQklHFA98BxGuGmAaypt2W
 oGpZkz4l+wQDvCoKiEqdMJmv6C2pUOktsJTAFj/PchhSnZoILNyGXZXJ2fj8JtFAZaM4
 1Wpx7eTbB1as3Hs2puhe9n+HFK8r7qrEP6lc02l7Dwk7//2kePfRSqG14kX/Slwr7GH/
 LSz0N5HqCkM92Ey6KIhayhaSSwaCzeKPhxPbCAp8j6G1iz/6rZyHEOiC64FR21HrSyR3
 mICmnOz8+oaY1QpyuSXveh1mX1+9kf1AEDVNUCyM0Exd0WWJKqwDwtSYEXKhSzdyqWQI
 1Umg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSy7woz4c5IDF5dTpRLe5qyQvQVLSjTV1Cm6n+F06SarAU5urWcGETp7DL/ebtzZXiRiZIjz+UrMCzCG9QSA==@lists.freedesktop.org,
 AJvYcCVVnTTPKKVBavoEZn0GV9KckrslY02DQ01y+fJsjnjI1UXQFJCejy3lffg+oYj3v1i8leXGWlDjbEzT@lists.freedesktop.org,
 AJvYcCWOy58G3RbiWDpziaG8P6PkAKGEgoTUzrFDSLGplL88Mq9Q/cV4//zZ4CK2qgkm0f5GXgpnjW5a@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/yITCVcxngFh53/KuOWwJKSUL6m8sxsnNDocycf3waaAkHJUY
 8VurSVP4Ot0qoZY/547+ZXDklc6z4k1Cu2YgJXzkn+lp1tY8buIuENLv
X-Gm-Gg: ASbGnctVo11LTeF2l3Xn9gMIPTQ2aSyL6lEhm5/rthEm02CNz2m19PfyGM5phxjXwIU
 xLNq2F7tPriKcSwE5cOvvmPd19t51hB+cePESoJTMmF0a3Qs31dj8/JNdGuwrbDqEHWMRn4CtJ/
 r+wiCOYKd7NjK7aTkGHe1HHOgGbgAisLhCyEKUecdiIe8LDMl+0rW1Qh6jgTh8Gbhqzk2Ivt4l8
 N/5uIQcGhXQWyuTQ6Y03+eAAt+5YMdiabsg5PHnVB5eoMmuh4N65N3CXgeAlLgIkDhI2rpOSIwy
 3XCJwUCRg0uzHBMkUTnwSLUUeS88rswGabUE4nCU6kiq045Iq4xhlqHEeDSuavvMPusq34RjDLS
 jAZXwGs5dHP3OFBoHGKxy8+i4AKrblUfz9HkIcNx586XSe0sLRuw/50sDt+q56fjB6t5nekEUUk
 0ieg==
X-Google-Smtp-Source: AGHT+IESuEDr8QZLisykL64g4ba83tdiLk29yQO3uqavO7uuyBzNgS6eJTj2v9K17Lorh8odwbLS3g==
X-Received: by 2002:a92:cb86:0:b0:3e2:9f1e:e291 with SMTP id
 e9e14a558f8ab-3e4161cec37mr78734765ab.21.1754193575462; 
 Sat, 02 Aug 2025 20:59:35 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:35 -0700 (PDT)
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
Subject: [PATCH v4 42/58] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Sat,  2 Aug 2025 21:58:00 -0600
Message-ID: <20250803035816.603405-43-jim.cromie@gmail.com>
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

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe has
drm.debug callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 31f688e953d7b..52ccc4701e067 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.50.1

