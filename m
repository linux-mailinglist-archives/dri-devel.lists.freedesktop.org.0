Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83AF193A33
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 09:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F288F6E2CD;
	Thu, 26 Mar 2020 08:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36D96E2CD;
 Thu, 26 Mar 2020 08:02:31 +0000 (UTC)
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id 02Q81Wpc002183;
 Thu, 26 Mar 2020 17:01:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 02Q81Wpc002183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585209709;
 bh=1kwyPiyPgRPS8M5GHrXIKo7KAtQM8nhh5IKej8Tf4fs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z2HLjPnoIUx7xxf6jaPY/9NQ8gGttNV5mMdLnjDZNtxsBJKHwDKqDX6GG6gz+GDyY
 iyO6HWF3QyaISQjPZANMr+X43SDf2qaOI5FWRpD3LMb4apVJJA6izFbqUq0DOqeMI/
 emOrOGh4itMVgoPMmrF7hzVqPPdP1MQpsGV7PTm1cu+sEn7wr4C5YmoV0iBJOf+uPm
 ESkgTpY0OknKLY3Rf8ROv3uEjAftihyb+fkpJA4DB4VJBbXKUf/yrh4xH0GQ+/nT32
 LUaaMvWCJ5dkybGBL1Ev/BXIcNCZeTihmckWZBHHR9jr3vpK4Ez9i+R4kWoUOCA0EE
 kWEk6RCZjqi0w==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v2 09/16] drm/i915: remove always-defined CONFIG_AS_MOVNTDQA
Date: Thu, 26 Mar 2020 17:00:57 +0900
Message-Id: <20200326080104.27286-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>,
 x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Borislav Petkov <bp@alien8.de>,
 dri-devel@lists.freedesktop.org, "H . Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gfx@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CONFIG_AS_MOVNTDQA was introduced by commit 0b1de5d58e19 ("drm/i915:
Use SSE4.1 movntdqa to accelerate reads from WC memory").

We raise the minimal supported binutils version from time to time.
The last bump was commit 1fb12b35e5ff ("kbuild: Raise the minimum
required binutils version to 2.21").

I confirmed the code in $(call as-instr,...) can be assembled by the
binutils 2.21 assembler and also by LLVM integrated assembler.

Remove CONFIG_AS_MOVNTDQA, which is always defined.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

Changes in v2: None

 drivers/gpu/drm/i915/Makefile      | 3 ---
 drivers/gpu/drm/i915/i915_memcpy.c | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index a1f2411aa21b..e559e53fc634 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -28,9 +28,6 @@ subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 CFLAGS_i915_pci.o = $(call cc-disable-warning, override-init)
 CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 
-subdir-ccflags-y += \
-	$(call as-instr,movntdqa (%eax)$(comma)%xmm0,-DCONFIG_AS_MOVNTDQA)
-
 subdir-ccflags-y += -I$(srctree)/$(src)
 
 # Please keep these build lists sorted!
diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/i915/i915_memcpy.c
index fdd550405fd3..7b3b83bd5ab8 100644
--- a/drivers/gpu/drm/i915/i915_memcpy.c
+++ b/drivers/gpu/drm/i915/i915_memcpy.c
@@ -35,7 +35,6 @@
 
 static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
 
-#ifdef CONFIG_AS_MOVNTDQA
 static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
 {
 	kernel_fpu_begin();
@@ -93,10 +92,6 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
 
 	kernel_fpu_end();
 }
-#else
-static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len) {}
-static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len) {}
-#endif
 
 /**
  * i915_memcpy_from_wc: perform an accelerated *aligned* read from WC
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
