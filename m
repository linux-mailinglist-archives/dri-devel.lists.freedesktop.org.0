Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBAA1C1B1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A19A10EAA0;
	Sat, 25 Jan 2025 06:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eJOgrGwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26A110EA76;
 Sat, 25 Jan 2025 06:47:34 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-844e1020253so73051139f.3; 
 Fri, 24 Jan 2025 22:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787654; x=1738392454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QcpavcUXYAdtW417rxXVfrXu3Dd8GPKW+FYGpTZrgBg=;
 b=eJOgrGwZopbBhV3OkXrh787IQLjxLETAeODM9KdlpVVzJLnSgbzigdbXoQVKMI509g
 tbkV4Iy86KkBSGsxG2mLZBieRJ38zrCwgRo+Yer8YS3CEsv2xx5r/bMwsckTAvppWlyo
 wwA1dK8hhmlG0kU6gLG5yM+basR1OsC09JLIGWkI5qKDiKKLPvEfItUJqiRDPfItRXsr
 6AIkGEcFuT8KeiSEL5ETyjOtGRr1z4WX+QFvHLfWFnmtNT9qpjhjpNYsjdUbrKi0A9OK
 vwh8X+HsNFchUCbIStZoa7rQtnw4uC6Tu0JvZGf6Ijf45Nr3cfKyj2UebpcXMgUPijoA
 QRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787654; x=1738392454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QcpavcUXYAdtW417rxXVfrXu3Dd8GPKW+FYGpTZrgBg=;
 b=KSC63VtzelAlW4au1vntg+RErn4a5/D4vPrs1/MZnnREHpBPsid1jwSwLGC8UJUoEf
 UuBbjw2z7CgY5GN2NsTkRv3ANTvYpNJaznZJhxB0CazRGD7XZgEMYricW8c6AdXxPv8B
 REp8R5fziuOwDlpAu953EZcLmhNG6Q8pNhvEDcBNi8njUhvms4v+JI6Iulgl9Uhb4/nb
 EjnoVcZh94KAHt/28QxcdcnNNGNcKAH1GKLAzajdStaaREaHbsw/tUdi0ekk1eDzrWO3
 Gth3mnROV4RlKn4KZO2lXifHJfvVHDADkaC1wU76azaVorg5afZJ79pIPA8osxOV7kPX
 ifzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO6WAiFy5TgTv3pYAZkFi9zEiOK/5sBGfcX9rK+ViuD/dYmYZrimWop0tBsEJf7ohDY1oxD8XD@lists.freedesktop.org,
 AJvYcCWnRbRYAtwqS4d3GBI4kKaCNCkoC2paHOa70jRjWhbikgEX4qp6Qk+DLzOxTwPtxoKj2+1UjOZwQVxf@lists.freedesktop.org,
 AJvYcCXLkBzRHp7Yf0ne9NGLyUSU7MvKN/tq0x4aqKVlUQovKA0c/SPbBNgjttSKY47BIWKdm9UaqFvOSul1U67PUA==@lists.freedesktop.org,
 AJvYcCXWKFovYrdb2Q3i+98RzhBocX6KheW51cSf04B2qMNsvmgHKrSGvXuScCbSolb2EfCKuc7JOPXEMIRd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR+xkB3cTvR0Q2TrvxeQ8NFebyUM4oJeFL/Iks8uKhUIK8j4Zt
 fdr9zToVTzYUBgNdJTZ+bh5bRXBvVsUlojxfvBbeqcLlLn205Jdr
X-Gm-Gg: ASbGncv+96h9HtQmTRrEGIG6SQnQeEkPDoymg4upoluVDHCEbtmBPVj70ItbDSR0yjL
 jVSuQsDvEkrs9qivYYQQ3HPjaOGtrs7XiAdqRR6zxXSam2ynvI5Bt1VMhQTHZaxiaGUg+1mVzkV
 W6KD7LcAGhyMc7uJaS6cohhkJ4oa9crKEcRlJv8bhvKa6c1mScP61tgQlMDVi8n8tNdrikFJM/+
 QOhWTFGHaDyvCAOepDqu/RzbZO6BaDkfX8gc8nYjr5j0wcAmP41I/fM7U3Y4ZDNXvktbtyJHuny
 ZxOZcyibhn+ggSxfnwX5GMcJz5KHh12Mk+Jyig==
X-Google-Smtp-Source: AGHT+IHqoKSuGlX+q9v1Ocs1Z6z9FnMPhWaJOuL9McgRkRNJSbEYd+QYa+WkyaLQg8Ipw+FhxU4mjw==
X-Received: by 2002:a05:6602:134c:b0:847:37fe:e25b with SMTP id
 ca18e2360f4ac-851b62842eamr2705537139f.11.1737787654037; 
 Fri, 24 Jan 2025 22:47:34 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:33 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 53/63] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Fri, 24 Jan 2025 23:46:07 -0700
Message-ID: <20250125064619.8305-54-jim.cromie@gmail.com>
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index a46f9e4ac09a..9c2bf8b5726a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -25,6 +25,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.48.1

