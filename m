Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 257787528C1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035BE10E767;
	Thu, 13 Jul 2023 16:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBBB10E752;
 Thu, 13 Jul 2023 16:37:02 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-345db6c12b4so4014335ab.0; 
 Thu, 13 Jul 2023 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266221; x=1691858221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FH1hoS5TyoLcmhyYV0xYU1iuMulIPyQc9Z8crXbpYkA=;
 b=dZjKH4hnSpuZ3DTO53o8QKHq0NPNvgYYxlgFp+7pfxVeTTVJHEVyQ+GHQf1R2RPDaG
 dfhJXbMmM9lCQBqsbp+aZqUw4vI54B6tqh7xWJsWp5O+MP1w+ng43Y7IhhTmUj2vFYcb
 Zg2qdshNds5TRWuzHH4Xbe8bq//a2I+qyIjgPTCZIH3CBqFoog97LPA90mgd0eQ7ASyR
 VgIBqaaFrBIFK7Lcg4rEoDOwxLSBP/tdYc2QAnNSfpCSAFt4ozhZPsoD1JrcQgCP+jEI
 OfotqOaBQOSUkrlOLm1b+x/cQI0TxB7x+dsBsQ3sR76vievwTLn9ayR4KOLj8WFRJ4gu
 yJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266221; x=1691858221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FH1hoS5TyoLcmhyYV0xYU1iuMulIPyQc9Z8crXbpYkA=;
 b=FPtdhy+di2yqKUjq9VGzTpmPsJ/DLTACmhxm2WYTgjx6ihqm3ZfRuL3XcdDCwXaGRZ
 ngUYlQrEB507S9eUd9Uhh+TwBP4gynPjqRAQG5smtwTbY+sWYC3z/+gNWkgnJgMHio2t
 Enhhf/x42a0N2xeG/aL+1Ead+PX7iGx0yMSLLLnyh6SGuT0yT/tCEgiLU34krMP/PsUi
 dYUrBfHYdX70+Dw7rm7u2beoI2bWnOrNSxClqtJM7T1EHxnFZfJCi1VIUIUPQZyluN5/
 LI+1hDVXfZ+SWL+zU2ydDiYH9KVCU5wJ3pQ4qnZqZNRBQGEGJO3i9CZDevDAdoXrwTNh
 kbwg==
X-Gm-Message-State: ABy/qLaGI9xVA+aV65VCs/vPVQk+Ja+DfQ7bHi6tpa7uaLrTu91iIVWr
 2WO2XATJsIjuqnzv3WMLNos=
X-Google-Smtp-Source: APBJJlFvBLi5hEov/kmv/k83zFFm7u/g7LY7tseK/2jtSQtpfiGSFRnCP0gXT9Lmz2F8s2b9Ib2K7w==
X-Received: by 2002:a92:c803:0:b0:346:59a1:ce35 with SMTP id
 v3-20020a92c803000000b0034659a1ce35mr2334271iln.6.1689266221643; 
 Thu, 13 Jul 2023 09:37:01 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:37:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 16/21] dyndbg-test: make it build with just
 CONFIG_DYNAMIC_DEBUG_CORE
Date: Thu, 13 Jul 2023 10:36:21 -0600
Message-ID: <20230713163626.31338-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make the 2 test modules buildable with CONFIG_DYNAMIC_DEBUG_CORE,
add CFLAGS_$ofile defns to supply -DDYNAMIC_DEBUG_MODULE to cc.
And change the Kconfig entry to allow building with just _CORE.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/Kconfig.debug | 10 +++++-----
 lib/Makefile      |  2 ++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ce51d4dc6803..d4fbbcc395d2 100644
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
+	  and a LEVELS/VERBOSE classmap (where 2>1).
 
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

