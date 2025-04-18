Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F62A94069
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 01:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2395210E25C;
	Fri, 18 Apr 2025 23:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QyRQV5WC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324BC10E25C;
 Fri, 18 Apr 2025 23:50:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C6E449AF0;
 Fri, 18 Apr 2025 23:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4259C4CEEB;
 Fri, 18 Apr 2025 23:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745020238;
 bh=IJzLGDXtTM+PrRhEz5In0Xb0/7YHoI2xCi4o5wcrZTw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QyRQV5WCNZ1XQBQWJi70yL4cpSNaEA5wGy4SKzFvMG1Dx9N1DEE7Vce3NLb3z9Hkz
 FimiCnRZxje2nNYI/vV1OXuSGwR4O+ps46Gy6xB1Eubw+k955Yo27397+ChsYCqlc0
 GrLq2Jc8rOiLxy9FHwICAlxXDN0NS/VC7CpwmyEznMdZoUBjuFnFLOFlsHQr6fiIwL
 CM63uXPPFoJoRRRpJdXqUHjfpGZNbWX/LK3C0HFVCJl2fIspMbIXdukE0makvNJVyl
 LsYpSk1AbhlP2JWVY9q+KONlxESS5dRkwV/wl+RJCYwuwbhWp0htd0NjsiPksIkrIJ
 kkW1iv12aeETA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab@kernel.org>) id 1u5vTL-00000003KFE-3NxD;
 Sat, 19 Apr 2025 07:50:15 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3 3/4] scripts/kernel-doc.py: don't create *.pyc files
Date: Sat, 19 Apr 2025 07:50:04 +0800
Message-ID: <28fcf7e44294fc4b5320d3c289f09cb5211ff8f3.1745019660.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745019660.git.mchehab+huawei@kernel.org>
References: <cover.1745019660.git.mchehab+huawei@kernel.org>
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

As reported by Andy, kernel-doc.py is creating a __pycache__
directory at build time.

Disable creation of __pycache__ for the libraries used by
kernel-doc.py, when excecuted via the build system or via
scripts/find-unused-docs.sh.

Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/Makefile      | 2 +-
 drivers/gpu/drm/i915/Makefile | 2 +-
 include/drm/Makefile          | 2 +-
 scripts/Makefile.build        | 2 +-
 scripts/find-unused-docs.sh   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ed54a546bbe2..d21d0cd2c752 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ed05b131ed3a..ab6b89a163e7 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
 #
 # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
 ifdef CONFIG_DRM_I915_WERROR
-    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
+    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none -Werror $<
 endif
 
 # header test
diff --git a/include/drm/Makefile b/include/drm/Makefile
index a7bd15d2803e..1df6962556ef 100644
--- a/include/drm/Makefile
+++ b/include/drm/Makefile
@@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 13dcd86e74ca..884dc86ce04e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -83,7 +83,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
 endif
 
 ifneq ($(KBUILD_EXTRA_WARN),)
-  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
+  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(KDOCFLAGS) \
         $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
         $<
 endif
diff --git a/scripts/find-unused-docs.sh b/scripts/find-unused-docs.sh
index ee6a50e33aba..d6d397fbf917 100755
--- a/scripts/find-unused-docs.sh
+++ b/scripts/find-unused-docs.sh
@@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
 	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
 	continue;
 	fi
-	str=$(scripts/kernel-doc -export "$file" 2>/dev/null)
+	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
 	if [[ -n "$str" ]]; then
 	echo "$file"
 	fi
-- 
2.49.0

