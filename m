Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD0276BA9D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274EC10E450;
	Tue,  1 Aug 2023 17:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4FF10E427;
 Tue,  1 Aug 2023 17:03:41 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b8ad907ba4so37232815ad.0; 
 Tue, 01 Aug 2023 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909421; x=1691514221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqTzNELHRtLIMmnQe4IjBi2Pg9cHOtSAwPPFPZ1pbxQ=;
 b=DqQYslUARFkvpK1vwVZZmKxOQSYTZOhPIzf+014DE3xPfhfS2z+eEgQ2Epz5O3LqlA
 7BOeyJeELxsdiat2q/p9KY1PIpat7Bk7pEvC6Ty1ZpzBoRp85q9IxWo9qhfE6I1W6YZo
 DRCR18HwB4rx8quTql2hLfzZceDC1weH0j/72kCqR37ctCKr0kWMjb4fokiTaun7U0NI
 ifhA5ukAVoD8lQ9AzK56Bg1n46jA5c65QerE/eKK9kwfTF4SaPIcTUX5ocUwF2M8vgO+
 DvPikXjIaYxXAQfX+Q3HGflzXFkCWuzsBgtzfzdOM/SOTKlVv17KwOY4cg+v3458AB2Q
 y3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909421; x=1691514221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqTzNELHRtLIMmnQe4IjBi2Pg9cHOtSAwPPFPZ1pbxQ=;
 b=gVzDgJomo2PLeJzCMtERgweQntp5S6w6EsX0NuGsUc4Uyt4iOvDxiKh/Tsp4UvEtfy
 NVaw5sa7mxp14zCLHC2dHQGoc+rhM6/IKHfV13HJPwxHDkr1m/8MFVVmEJ8/2u2NgDHP
 VDnl+EzAt3hd850JQDIHN5790n0zS44vHh8WO6IrESCQYz/kPLoWduCgokXlYdIZfRYY
 95i9JWQKCw0DgtwXcHUlsLuONbyJaTXKUG+4B1Vhz3sb9pVPj1kovGShIkjiBoBWQG1Z
 keolQA90HOyFaRJe+kdzi6OEiJyQohmefhb8fSuJJqfBYlxemHoBgBQrcGACSRF3K455
 C55Q==
X-Gm-Message-State: ABy/qLawslr63AzridjW8lw+ryH9ChZR+wlCyO/e79Vr9h5GVwz3iDH2
 mjvlXpDypC83uogPBo7rX3E=
X-Google-Smtp-Source: APBJJlGBC/pkTqfaofa3HRqJHDYvxiYCmGJoY97jdUvLmblEt0DaAuSeyNfKmxlve04DiaFeZ/p56A==
X-Received: by 2002:a17:902:700c:b0:1bc:2036:2219 with SMTP id
 y12-20020a170902700c00b001bc20362219mr3106819plk.41.1690909420776; 
 Tue, 01 Aug 2023 10:03:40 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 18/22] dyndbg-test: build it with just
 CONFIG_DYNAMIC_DEBUG_CORE
Date: Tue,  1 Aug 2023 11:02:51 -0600
Message-ID: <20230801170255.163237-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the test-module buildable with CONFIG_DYNAMIC_DEBUG_CORE; add
CFLAGS_$ofile defns to supply -DDYNAMIC_DEBUG_MODULE to cc.  Change
the Kconfig entry to allow building with just _CORE, and fix the help
text.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/Kconfig.debug | 10 +++++-----
 lib/Makefile      |  2 ++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ce51d4dc6803..22e022ceb9a1 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2695,12 +2695,12 @@ config TEST_STATIC_KEYS
 	  If unsure, say N.
 
 config TEST_DYNAMIC_DEBUG
-	tristate "Test DYNAMIC_DEBUG"
-	depends on DYNAMIC_DEBUG
+	tristate "Build test-dynamic-debug module"
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	help
-	  This module registers a tracer callback to count enabled
-	  pr_debugs in a 'do_debugging' function, then alters their
-	  enablements, calls the function, and compares counts.
+	  This module works/demo's the dyndbg's classmap API, by
+	  creating 2 classes: a DISJOINT classmap (like DRM.debug)
+	  and a LEVELS/VERBOSE classmap (like verbose2 > verbose1).
 
 	  If unsure, say N.
 
diff --git a/lib/Makefile b/lib/Makefile
index f36048371dd2..8411015a57c1 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -233,6 +233,8 @@ obj-$(CONFIG_HAVE_ARCH_TRACEHOOK) += syscall.o
 obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
 #ensure exported functions have prototypes
 CFLAGS_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug_submod.o := -DDYNAMIC_DEBUG_MODULE
 
 obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
 
-- 
2.41.0

