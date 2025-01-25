Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F2A1C1A7
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95F710EA97;
	Sat, 25 Jan 2025 06:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FpdKhP8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44A710EA62;
 Sat, 25 Jan 2025 06:47:29 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3a813899384so7145435ab.1; 
 Fri, 24 Jan 2025 22:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787649; x=1738392449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dejYp+eKN9WKMrqw2DFywvLty5rdJ1+8alPM8PzQvUM=;
 b=FpdKhP8tC6IZ6kzJwCXqQrzeu03PDbn3HYvAjvP+RcySNXyQAWlWe00jd7bpVuHFKr
 znZvxQPpQBffrNzdxwyOwfgptaBTaqmTvNPPKS8r2dKsFQdTK5LJBx0tNR2FvQBNdJkW
 PE3phXYn+uG3idsBTBB8wJq+PmCUndPAwQ+W+bqfcCwj+ee4iOAeVfVergrPvXnG7DZN
 OImxyY3RxRbRLkHfazke+3yjurp1+tS3k8k0tSTH7IYIQi8Lr+TIwKK69ry9CIVqPOoC
 gMW5fYwaa4et/vWfHBeAUAIQE6RECIXcYmvl0/W9NLkQB/ntY9AtBH+6uQYtCu2dfCNR
 wdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787649; x=1738392449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dejYp+eKN9WKMrqw2DFywvLty5rdJ1+8alPM8PzQvUM=;
 b=rUT9DI0LB5KuRnMu0xxy0oe17RTN6fEDfi8QuH2kTp6c7aoF/Rfj/+RneqQubVkPF/
 mdrrKH+miaLUrJaz7D5DHeE8xT2DUgSL8MF8QZyuyBFaEVW3HkYGtX5uvw0clWPxdHCx
 68q9D2ItCi4rqY01clHHSP34EwNg2ikGiRZHPCjOvINKPcJJ11Z37Nf3Kak6z9uoQeKO
 KLxJdFs2nyJsTy2FoN820S2nLuEp3DEYtj+OYLFIHPimg78LHcNl+NBpAwrm1KKl6MTA
 tUtUscqA56ZbpH75F6UknV4pCC9lEvwyBBNGUVVMP5ox5auK3uonvK4PCSeWcWGaQRrQ
 EuCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5ak+HP+ijskBlQWidNxvRXZ1lJV2w1S7lJ7SRVW6zT4FTs/bZAT2QI/J0dMo23LHu7IWwTgzQ@lists.freedesktop.org,
 AJvYcCXdhmEvtodpeJFTrUvDSDIKlT6KBKNwHyJzIJd/Eener3nrVF3u+ZAwvCXsfc8Er4dfOtQrRjlbKked@lists.freedesktop.org,
 AJvYcCXib1H8SxzqDv3iIOCpZTLnrFxY2B6MerA+fHwr05yeBPxZTwIygGT4rI0LyNaiq0eBszeYZ7xWbAlo@lists.freedesktop.org,
 AJvYcCXt1gpVsf9EZMeDtLAvmEeP578gmwUT754Fm3O0VDTrziPIX6i/R1j3+iIkQ+i/71KhqPpV8qRw6Yrp8jF+jw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNjteAmCKSydbJ/0scsHXCceEdiWWJ8YKp5ZiQivCRoi/EqaQ7
 +6SRMAIsD7js6A9Niy25dkpllhvo2AtjPsN7EofZAcnbyeYTUtjB
X-Gm-Gg: ASbGncsFNB2Y1Vjk84i9DYDmweo9X05CmQxTdogkzjPKrsSCmfYJZeKJn8V0IW8H2Xw
 ejeaCP/idN0MYyOIQw/Zf1gp1n/XfXWs+cbGKgH3iThEK6kKvxxrlCpVkGlMCY0TLfaAJG4Xb7X
 0yiGynU/iU3XdBNzSEfuxvFDGVbBmzp7WoGalOsDJ/Yh55j9Ioke9gYvttbAJc1+ER92t4f8Da0
 AFltt48qKN9gNgUTVKfidf16XwFPbectASgbhHiDyaGVc8xKkeQjl4wrr80QZEQMkKWfnI9ipMf
 gfJC+rkWO4mKB3xQkLQJeySIZ4X8SWwiGmkuMw==
X-Google-Smtp-Source: AGHT+IEAUiOldW5NYz+yhWjZW7GY3yrwC5+bdXLqQ7WliEEkiuhkttZXPlv4GP8R7SFDqRQg9KT8aQ==
X-Received: by 2002:a05:6602:3e88:b0:84f:41cb:1895 with SMTP id
 ca18e2360f4ac-851b616dc39mr2912096739f.1.1737787648918; 
 Fri, 24 Jan 2025 22:47:28 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:28 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 48/63] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Fri, 24 Jan 2025 23:46:02 -0700
Message-ID: <20250125064619.8305-49-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 107f63f08bd9..416e122fa58d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -72,17 +72,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
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
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
-- 
2.48.1

