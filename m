Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152E3B19221
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355B310E4D2;
	Sun,  3 Aug 2025 03:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UvThMZ1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DF110E4C9;
 Sun,  3 Aug 2025 03:59:41 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3e40d006105so14220495ab.3; 
 Sat, 02 Aug 2025 20:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193581; x=1754798381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2dm3Is+hmVrCyHRXfMeY87/RIu8WM4w64xIqHyRgwI=;
 b=UvThMZ1Rcm9NEriXp2xVEwibsC+eVzjqInfGLDRAHhioJDJjXbni6yK2es11ZpcEwl
 SUKn/vrjl5r5iAbDF10usm+0MRi/0towA9zT834CX38YmpFAFACYGLybdELYho2gRvVs
 4H2h0ncfe3KQhOHerCFvszpAv+llyYO2C9iYh0OLd3HD2UcV2gQKLcaszh2NuehT0e2S
 iZvb8TRbHq0Fs/jE3NAhzpdxightpQ2U92FWUt+9mwpIvjNzLH59mxnvQ9paZLtWgp5P
 /NvSLBXBScWH3DlL9uThjytKf92NbRLDUG/VFPWzP42gQUjGt4bQW/9SJM7DN2PYCD7G
 zSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193581; x=1754798381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2dm3Is+hmVrCyHRXfMeY87/RIu8WM4w64xIqHyRgwI=;
 b=F84RqOz8bX5zyXvOFurG5iX6tx+ybwZwWuUpcB2DKBg/G1Q2ycTbT6L/6CLuF/jubt
 tNCweWUrfiQPxHvfNq3NAUQJtKOCvWUx3GMsEwqrSS/hdGBMsJf4NRbuet6EpumGVabb
 3xlibRkCPPRyLIueOPlGl0Epz9gfsDzgyRhVcXRCYkCSpE4oFCv0rjQn0Nk9CW8Lvl7S
 hppWtflSRHlKFe0Gp5nisv0+0S+z9l1/Zl805Ie57D0S3AhKZfahOGNsZktHK8pwLXyY
 ynCPPj/00NzCKYyZ1wPu+SpnPem/QL3czR9L7UiXWP4Q7ZO5pD23wUEHemXyjSyaj6vB
 AVSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8lnrpA2VrL3q4C1aaRnMffjTM4O7vnAV0mma+b8lIEMC9TkKcErPxo858voyX6PpDrGVdM28YouHSoig47g==@lists.freedesktop.org,
 AJvYcCW8pqOGWE8jTwGkRZRLXWUTQpqbZZBgU/0HPW2kfEXUyXuKfZJiMTu1/3EnoOMH3+5Svi8KKP/Nf5+6@lists.freedesktop.org,
 AJvYcCXwsf96fi3qpGm8XISiQ2r2M7ZTngHvQFej/OscZqesjEktP5UQ1vifxtUjaCVhq44KkzoAmTeX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySuoTtF7gaRoqpvNnruBhohyqLr1TXWhPSZbLyxKuTHJtjq5Jf
 c0HbqhAvAtEa5+51ZC1qPKdztrxI49JMryihgm69Hif7KT+xQMAjgQC2
X-Gm-Gg: ASbGnctHjfUT9jErZzRmp0G9hs3e9z71BXxVu9WaQt+riDVzLJCcsuwYaCF/+y7wHpF
 I01PGBUNfDjK/qhvpBBMOSxSonLdlOJ86RtFNAoZTquaT10q/iVYlXajKHN8QWvsRMBZqrMaJHa
 gHkO9Z4MlCmw/WuKYcklU6vhGDB1GVuxfVIKHe6J2ZP1XRuCXiW2rHB/5PzUBuT0Qu8GJCNmbg3
 5Po7V24GRH+NR8r17ui6JGDDkO11osoxaEGvWaSRZdxtpla0m1yV8V0yVv9iFNvH1rQW7IMEsrm
 iE3YAU+4CsyhBjZQRVcxpZ/3Q38zaZeV9YZGbHSR/QhLKkU8dgk76UX9ZYuiUasWCSj3b9R22FJ
 NqXhI0OAbb7K8DKjw8ZkzHhltxOLn7re1AT9lowOvXxkb3+PwgX84mRNd696nyGs8NVGOpCyK+z
 lKeA==
X-Google-Smtp-Source: AGHT+IHicophLwIo0f3Ezs0eOmSQt7ySKYvJ63NCgmDZPmmfZpDGy7DzzpgME8ux0Ifq1iE3S3f0yQ==
X-Received: by 2002:a05:6e02:17cd:b0:3e3:d197:b567 with SMTP id
 e9e14a558f8ab-3e416117005mr96473805ab.9.1754193580921; 
 Sat, 02 Aug 2025 20:59:40 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:40 -0700 (PDT)
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
Subject: [PATCH v4 46/58] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Sat,  2 Aug 2025 21:58:04 -0600
Message-ID: <20250803035816.603405-47-jim.cromie@gmail.com>
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3e91747ed3393..70759b7d338f9 100644
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
2.50.1

