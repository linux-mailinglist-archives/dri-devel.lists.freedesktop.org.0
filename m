Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A970B19201
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D91310E4C4;
	Sun,  3 Aug 2025 03:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RrqC3ZNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108BE10E4C0;
 Sun,  3 Aug 2025 03:59:24 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3da73df6b6bso9003385ab.3; 
 Sat, 02 Aug 2025 20:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193563; x=1754798363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9PcjPUjmFrLewSvRSEJPDWXh0n51inHqjt5GPCorNY=;
 b=RrqC3ZNaw8L2fUzHINXbA6sYnX17PwKJEgyXEIYerp2qBQ8g1sQDY3C5/ooM6xbtYo
 7UJPgNAjv0yjrnHhlajVPJ3uHedxVJhIoym6faJkcmQAR6JHPmNMeEFZUt4FMW6PiAPl
 PmLvwl7iX0R6Zt+v5cNyQjXImd0kITL2mAM9h3yILkLBlvR6MtbAuV1Rre4LV2EIi+SC
 Rd/uJshx4f9NQdbwZpQhCn5JzkPNKbLG3u9v/CcnXR+Co0hfO9tjK5VfAUrYcQ1NTNny
 EAoi3d8oXkNb2UuXkYfCVk0UeDys8F3tnNrpxlLxpCqzUEjzrolg8gXjFB6lhbzty43n
 VhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193563; x=1754798363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d9PcjPUjmFrLewSvRSEJPDWXh0n51inHqjt5GPCorNY=;
 b=k18/hai8/OxXAQnU2T8nPc20ZiB0LYTWIn9cw5NcAqf7PfET7FhEt3Psnd/YOeGGN9
 JoN/SkRtzo1JajMVdQHl4pyDeghYTxQGLBQfBI8YEal9+BN/aXAvQT8C0HEi0QvGCSBg
 SKT/9DjcMPZkgTsx59VZHeZJP2VcG6M4mM1L+txuCjKmtuaUHD25j/1ROx2zdgCErtcv
 oH0YFKOwJvoOROPwttGYPOiLUStXGPoDPm8ug1fAUkRRc56GGnC9wcMOOUdvVRh5HhR4
 N75ZA6yXq97rvcFpNreHUelOmjokERB1B+xYyc62agtsXyQC8MDpq1ikhtn+qrklMMfD
 1QXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIsxoUoRhxLrUDIyJFmoA0gnFSdhzn7lkxeRZDRU1c3d6qKOdyitgqql6CvESKXwWLsoWk2VSR1561@lists.freedesktop.org,
 AJvYcCWKg69rHitD941J0lsmrlaNmTqn+AJrYiVomQ6NnX0jKgTwcOyvMH9YnhzJ750KC7w+a0otN7tL1z1OsBrx8Q==@lists.freedesktop.org,
 AJvYcCWaht2Ezrddziwbd8F0X4pRMy+rOZKTYo5j8xTqhdvpp84Gf1GEqUgJWazyNDexFoEvtlX/It2L@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3oezyHc4OtmpO24OSnLDxlRQilrRyrUJ8ybwIXKA9mR1Hjpbc
 hvB+k9azNn+QnRtNTK+2VsMm70eH1ECwDoKaHP2HpPOtgqwpYPz0p0eu
X-Gm-Gg: ASbGncsgZu+/DySghCLRCme7Czz+tvnIhz74fGkGKLgJ0wGKN98MGf/eOFXKMk5GgLO
 lAZBFuzIXLcuXBiGSsjUXxftkXvB3iFyZngo+0bl37r7uhMRRaRoyUYlypwq8H9Y8BazumR3pR/
 xHBiGgDGgfJGHIStuq708IceKxk1gKwXvC0Ilnu0xn23Rl6/1qf3bTsNQsYJX9fveBMRk5h88hf
 BLVTs29ve7NPYBTYgGxGU4a619VTU78sTi7HDjec5Cs+4Sgga4bZFrpoHU6OjfHbVvsdBYC5C2N
 B1Sp6N1GMi+r2h+oVvjvDK0WhhgrSirj5sxCjkg59UmzuGrlTv4FXZskhzyimB0YHSxljIKZXbk
 gfnjR8S4iLibSNbHKh9D7ibYKn/Y1B+5G+uh7DV4IhaafAdPNqJuS5t9myNT5ZjKXL9ao4JAWsG
 jg3A==
X-Google-Smtp-Source: AGHT+IGHik12b+NzuHXdXH1TPCs7I43pZRfGChkNXR0L9WcmFgFx3EM2Cq+84hECD9IhAilvjxg83w==
X-Received: by 2002:a05:6e02:1f85:b0:3e3:e78e:4e0a with SMTP id
 e9e14a558f8ab-3e41610d65cmr100228055ab.1.1754193563265; 
 Sat, 02 Aug 2025 20:59:23 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:22 -0700 (PDT)
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
Subject: [PATCH v4 33/58] drm: use correct ccflags-y spelling
Date: Sat,  2 Aug 2025 21:57:51 -0600
Message-ID: <20250803035816.603405-34-jim.cromie@gmail.com>
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

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which disabled dynamic-debug in modules built with:

CONFIG_DYNAMIC_DEBUG=n		# 1
CONFIG_DYNAMIC_DEBUG_CORE=y	# 2
CONFIG_DRM_USE_DYNAMIC_DEBUG=y	# 3

NB: this adds the flag (when 3) more often than strictly needed;
modules built with CONFIG_DYNAMIC_DEBUG=y (!1) don't need the flag.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5050ac32bba26..96b57b34bc505 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-- 
2.50.1

