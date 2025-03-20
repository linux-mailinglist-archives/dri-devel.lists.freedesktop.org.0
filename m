Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78893A6ADB1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A580310E6BD;
	Thu, 20 Mar 2025 18:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dDDYcQKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A064610E6BE;
 Thu, 20 Mar 2025 18:53:52 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-85e14ce87ceso35284239f.1; 
 Thu, 20 Mar 2025 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496832; x=1743101632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9YY4p1KIoF8NcF+Z/sMeox8vZB2Tw1a5BANUy2dvOpI=;
 b=dDDYcQKd8a4iejnmBWd1VbwW6GhB1YJvuELlIYSGFCWU0K2desYGcFByOzBFwxe28R
 PRaGWRKI5zPUUg2ui6/Ok8YH6MOQrroUnhLhRNJoIxhuPPh5fvXYKo0+L0Z+o2/kHN5t
 FOeOY0nLvjVCqX7GhKtcDggmByIockRMQ/4PtgLl6O+lbJUKdV4ZBnzuvdYAPeNqVxqv
 3DN2MONuZJn/w6XKkWNzdOubcmpacOGAZKgms9O+MOeG6cZiE2n1w/pfq+PuSDqkPlC9
 XBl1JkOB3jN+WgKv8O4vTS3sDIrPzx56ZwNtysLfQhDAJlBgl83P2FrWfigoqBldzRUm
 BVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496832; x=1743101632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9YY4p1KIoF8NcF+Z/sMeox8vZB2Tw1a5BANUy2dvOpI=;
 b=J07uBsub8bGzUUKdWUm+VGAVchHWTBFscYM+YLGCXDkp76ysWU8D/4BUlvV0u0LAOG
 jeZI21y4pYHJti+7bcoS5V6qhjYSCQROX6s4XUhcU7Ha+Bkoko4J8a6npfRQbhVPMJak
 8fVxSR1b8x+bNp5cLuCGHeClh/MdbaVHvWHQ80WPWP6X0vM8sSNb8+4aJDI33BGG0UYZ
 1DFn2Ucc2Dqv9HKxRY1/pVrOqSgY1jhvOiU4q8ySBEA4uSImONsAJmmRvsosppzMaC/Q
 Jibdp5Vac3OkFKxwrbXmgWuG4q+K0s+sM5UkiPlmnnnnt5/UyJ9EVsKojoR5hGkaoUbK
 uasw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBrN8TWfZFnXwRxn10bV3DBL9mrK+bYMMckh6OtSCm0EM3MGp5aXLp3qFz09m0QpX8tKv8KDG08pXi@lists.freedesktop.org,
 AJvYcCVQBQzHgIxdPF18y9HqwwU+STpBUeIRg/mjgS4cwiquf70YYYKOsaZ/o+TO4DxFm+J4q3b3hyGePGiTeWzSvQ==@lists.freedesktop.org,
 AJvYcCWpq5YiNk5MgxBIQovdEIYgEcC4lCj3hQWemHpz+txaNdRjfbNQviQt3RcD3dgZS+t3gLJCroS49fdR@lists.freedesktop.org,
 AJvYcCX8BbJuH9tTWKip9QY7TojFuWOwqYX7++vLz5UATW21dJudnz35rZi8ZVpyHFmKJlOOvOCB8LOr@lists.freedesktop.org,
 AJvYcCXuQJwYGj+PdrBaTY1C+eH1PQQlb65BUcO6pAqkZA1QSairK2RpptDU5etjFsfqnQdqa+HIemdr0OmK/guq/wpWvQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWHLIV1b9FBQOlGJhmJFGqARe6UjcwSFXmbk12kpoZ+yY8xueQ
 U0OCp4/8eRRRtW6qaIJopz5bwZnNxhOYvzPNr2n6Nb1NKLA1R02w
X-Gm-Gg: ASbGnct/dQ8RedNoRo1+OSjceVs2+I3YsOky/5WpGB5snzL7Xt6dgz+cAuIo2BLxuj0
 hoLBWpZVF2XHV3p8exi4AuR741wjb7VwnBHAtRraBDqPNWLlWe0nXsaN6kgleRZX7fDjYqXg83F
 JiYfpQMgNbvHGrt8S5teNYzD+LLSxslE9Q+g0yJWdr4keezf8F0j8Mfr3MmsDb7b9EQQOaG48KC
 cYTvRtyoMprKL6CD7TnRYWt6x4/02h7fv3GZQF6ZRbx3txWoKn4MDR+g+SoHJ6yFaAfyO9e7HMu
 HmdhOPQcj2vZm0B6y6Q1dadHtL+3l/zWcui2KFlIR+Y/5xmQJweVBXFlARZidKNyIXyv7q1FUMP
 1/w==
X-Google-Smtp-Source: AGHT+IFRfc+XzhcXsN2Drd9zujyOgJy6REOdYhT/1Oijm2SQSUJCYNpgS+yjBgNdLmsoPBETLNSPbw==
X-Received: by 2002:a05:6602:3a13:b0:85b:4d78:cfe7 with SMTP id
 ca18e2360f4ac-85e2bec5c71mr92629139f.4.1742496831849; 
 Thu, 20 Mar 2025 11:53:51 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 42/59] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Thu, 20 Mar 2025 12:52:20 -0600
Message-ID: <20250320185238.447458-43-jim.cromie@gmail.com>
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
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 61c7c2c588c6..68ba17eb2541 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -43,17 +43,7 @@
 
 #include "drm_dp_helper_internal.h"
 
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
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
-- 
2.49.0

