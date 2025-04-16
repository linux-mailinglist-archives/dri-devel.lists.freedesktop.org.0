Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFFFA8B0AB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 08:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F4D10E841;
	Wed, 16 Apr 2025 06:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KMTfEoTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF7910E852;
 Wed, 16 Apr 2025 06:43:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E317A44F1A;
 Wed, 16 Apr 2025 06:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1024C4CEE2;
 Wed, 16 Apr 2025 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744785808;
 bh=3fxTh2/IW45q1FIh85eFha6W/n2T/3ziJzmCR16YX+c=;
 h=From:To:Cc:Subject:Date:From;
 b=KMTfEoTcPQtmfDXORRmyBAJ4SiLXvcDP3abUGTVrC/4wLWH8aAWlePEBkIKHX3j4E
 POaEnPNUlKobt7eBUtRos1N+VpHY9luWZE6rKHARZYsZPxT2aq67FLlo9Taf48+qlW
 DfbzePm0DzvQjvYvXQR5y2AWp3ta0V6zWsYN9ey2FPyRorM/izc+GQ02UcQqsZkJ7d
 5o6dgT/ifWSm1EmNiZoitaCempRsAxKf/ioiukXcnFIBm6CbEpPZu/+7eKkgNtZcDp
 sIwsG8oLbkHR/fjoZnjqrjNncGk6YwzwMNNhN9fLlcAlkzPbYbEIRFf2iixguo+uwa
 0+czBCLXsiTvA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab@kernel.org>) id 1u4wUD-00000002jyH-3Qul;
 Wed, 16 Apr 2025 14:43:05 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/kernel-doc.py: don't create *.pyc files
Date: Wed, 16 Apr 2025 14:42:57 +0800
Message-ID: <432f17b785d35122753d4b210874d78ee84e1bb5.1744785773.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
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
 scripts/find-unused-docs.sh   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ed54a546bbe2..1469d64f8783 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ed05b131ed3a..bb873f9cc2aa 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
 #
 # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
 ifdef CONFIG_DRM_I915_WERROR
-    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
+    cmd_checkdoc = $(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none -Werror $<
 endif
 
 # header test
diff --git a/include/drm/Makefile b/include/drm/Makefile
index a7bd15d2803e..6088ea458f44 100644
--- a/include/drm/Makefile
+++ b/include/drm/Makefile
@@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
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

