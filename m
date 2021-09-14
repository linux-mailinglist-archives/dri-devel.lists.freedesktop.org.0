Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852240B861
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 21:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00AE6E5CA;
	Tue, 14 Sep 2021 19:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B29C6E5C3;
 Tue, 14 Sep 2021 19:52:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E478260F25;
 Tue, 14 Sep 2021 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631649164;
 bh=MWZC3gluGK8hQ4vrKPYduZs4rZZZWKe3APwaEYkMSnk=;
 h=From:To:Cc:Subject:Date:From;
 b=VMPQ7wiQa96AHLQH+AGPwpnl3fDPyXHZdg68LV4cOttphZvHrM4KohpsDh0BD7wuP
 E1y+436smP9BwEABLatUk5xv6iYJiMvfxxxg5OxrmtGrLGb+EzR0Gg7lTV8zphHJCe
 paQzCkqmgcZpNPMk8u3Y2zIZERApyMMV02T+UhP/Exnr7EJm68wz5iLFbWLTYaP0Tl
 1CKW+B/fJmsHR+cSFizt+QdMmK9XfeEnSEoMSTnWizvoQKmEhPNAKh0ucLlegdphDp
 P8njymThnzGWOroBF1fquKxOCfs0lo0gz2fpJLrnVFsQ/dNPtUvFcBzALbZYQAbh3Z
 VHvS23dZ8erKA==
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] drm/i915: Clean up disabled warnings
Date: Tue, 14 Sep 2021 12:49:45 -0700
Message-Id: <20210914194944.4004260-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

i915 enables a wider set of warnings with '-Wall -Wextra' then disables
several with cc-disable-warning. If an unknown flag gets added to
KBUILD_CFLAGS when building with clang, all subsequent calls to
cc-{disable-warning,option} will fail, meaning that all of these
warnings do not get disabled [1].

A separate series will address the root cause of the issue by not adding
these flags when building with clang [2]; however, the symptom of these
extra warnings appearing can be addressed separately by just removing
the calls to cc-disable-warning, which makes the build ever so slightly
faster because the compiler does not need to be called as much before
building.

The following warnings are supported by GCC 4.9 and clang 10.0.1, which
are the minimum supported versions of these compilers so the call to
cc-disable-warning is not necessary. Masahiro cleaned this up for the
reset of the kernel in commit 4c8dd95a723d ("kbuild: add some extra
warning flags unconditionally").

* -Wmissing-field-initializers
* -Wsign-compare
* -Wtype-limits
* -Wunused-parameter

-Wunused-but-set-variable was implemented in clang 13.0.0 and
-Wframe-address was implemented in clang 12.0.0 so the
cc-disable-warning calls are kept for these two warnings.

Lastly, -Winitializer-overrides is clang's version of -Woverride-init,
which is disabled for the specific files that are problematic. clang
added a compatibility alias in clang 8.0.0 so -Winitializer-overrides
can be removed.

[1]: https://lore.kernel.org/r/202108210311.CBtcgoUL-lkp@intel.com/
[2]: https://lore.kernel.org/r/20210824022640.2170859-1-nathan@kernel.org/

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

v1 -> v2: https://lore.kernel.org/r/20210824232237.2085342-1-nathan@kernel.org/

* Rebase on drm-intel-gt-next now that the prerequisite patch series has
  been merged: https://lore.kernel.org/r/87wnnj13t5.fsf@intel.com/

* Add Nick's reviewed-by tag.

 drivers/gpu/drm/i915/Makefile | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c584188aa15a..fd99374583d5 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -13,13 +13,11 @@
 # will most likely get a sudden build breakage... Hopefully we will fix
 # new warnings before CI updates!
 subdir-ccflags-y := -Wall -Wextra
-subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
-subdir-ccflags-y += $(call cc-disable-warning, type-limits)
-subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
+subdir-ccflags-y += -Wno-unused-parameter
+subdir-ccflags-y += -Wno-type-limits
+subdir-ccflags-y += -Wno-missing-field-initializers
+subdir-ccflags-y += -Wno-sign-compare
 subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
-# clang warnings
-subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
-subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
 subdir-ccflags-y += $(call cc-disable-warning, frame-address)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 

base-commit: 43192617f7816bb74584c1df06f57363afd15337
-- 
2.33.0

