Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E081419080E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC506E0FB;
	Tue, 24 Mar 2020 08:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5FD6E0FB;
 Tue, 24 Mar 2020 08:49:47 +0000 (UTC)
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 02O8mgsh011219;
 Tue, 24 Mar 2020 17:48:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 02O8mgsh011219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1585039737;
 bh=EKZjb7DWYR4s7jGHGhFrynB+pQ1ESbu9YqfclUuLIXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RaI62uUSi+TuYSdITao9E3pXoHm2kJAxRS4RfxbanuNPHrpbByYoL80qrDDy7sGwN
 X90uq2aHoq+UrCHqF/zRPDNyc2wcAi7eGIP9Za62TV1/Qk5WmUs0sivkGCQYemyS41
 DuGp3FECM267nLNoF2k25NF4L/hRred/vjOCXO2A0G6iYvj4uNJPZwCVgshLTUcXJE
 n9bb49Yjr5vOBpd6ANIxTfyZw6+JEmzr6/m1RkcqgwljDqtKPzM3Zinl1epQbBWZpN
 qZDG0Ji5Nhyv8Q6+miY/EJuJdt7GGFe4hxi2NcSwqPNsH19b/IriHr/RQC9Dve7o3m
 o1UOYoQEjzHOQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/16] drm/i915: remove always-defined CONFIG_AS_MOVNTDQA
Date: Tue, 24 Mar 2020 17:48:15 +0900
Message-Id: <20200324084821.29944-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
References: <20200324084821.29944-1-masahiroy@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Herbert Xu <herbert@gondor.apana.org.au>, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 clang-built-linux@googlegroups.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-crypto@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>, Kees Cook <keescook@chromium.org>
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
