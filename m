Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8335AC79B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C045E10E3A2;
	Sun,  4 Sep 2022 21:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8953410E290;
 Sun,  4 Sep 2022 21:42:59 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id s3so1911308ilv.4;
 Sun, 04 Sep 2022 14:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=KACUwbv9zFDFS+/NnZ2+bHc0BJ5XxAtoDioY/cngaq0=;
 b=VWLo9KQRx3wUEpHavD9gtPYNFllTyy4JKxvs/7m7tkQZM4ST377wbMAzvfbzKUgbOp
 J6WuHZ3P93mqwHnELmx4xWY2iE88bkmZTSJqZgzV49g9rgdp//m9df+iAKw5mapuizNM
 8N7/7jcJanbJgpES8DxAtzXNIpOD8ZbW5WOPK05nV0i1YT9y6m46gm5tX0ZuDvQutVME
 hVXVPzZsqJYaB2x7eaQgiQ5QGXMW5MZGs2s9lLUmDUh275cuM3Hr9LM8UftEseh/RA6Z
 Yc6+zDt9i1m5X50alTa/P6gMXlOYHL2RiMbZY6SXX3tIiEk2zkHyzL+A2td9lp2Hi3c2
 vR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KACUwbv9zFDFS+/NnZ2+bHc0BJ5XxAtoDioY/cngaq0=;
 b=TODwl0ZnAWhfJzsks+oSTjz5sDpxRzjLgfwV4bexRYxZ4/8iOgE1Ij3mO+WSS/ndRb
 js/QLo9CFLp26lmNqmhi6NRENEDfITAM50RiimcPidqwvqwi4NakFJrDCbIDAH/h958g
 +QOkaNZbpegYJAtCHyyL7cbCfYIdxTLzOlYqjxm01+Apdp80KtBfgkp38wnowEbfaH3o
 rXstka2EfSYKSvBcClDIEXu5pIXlu/feFncQST9T0F4nRAEIbXZWrUZbotWhHmn4iymW
 wIcVvYRb88cmQIYpTaTBCiWC0g0xPjWp/7jvd0MgItVOjyuItF71IYxieNICKvIv7rK1
 PZMw==
X-Gm-Message-State: ACgBeo1W0K9Ihou1RK8JJksW+gJpSZRBEYfJQvExDdYU1XNQ6QC/l0HM
 WSZt8IWuVDRNMUBYD2cSx4o=
X-Google-Smtp-Source: AA6agR4Fn4lGPNDj+VkdpCwid3ve66XVQ8L4VIZBVbVLfcwMhJmhHwO+CmYwocy3EXC3pDUoc7POZw==
X-Received: by 2002:a05:6e02:1c2b:b0:2e9:f263:2942 with SMTP id
 m11-20020a056e021c2b00b002e9f2632942mr24514448ilh.74.1662327779197; 
 Sun, 04 Sep 2022 14:42:59 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 51/57] dyndbg: prevent build bugs via
 -DNO_DYNAMIC_DEBUG_TABLE
Date: Sun,  4 Sep 2022 15:41:28 -0600
Message-Id: <20220904214134.408619-52-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: lkp@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 seanpaul@chromium.org, joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The next patch adds DEFINE_DYNAMIC_DEBUG_TABLE(), which broke several
subtrees, including efi, vdso, and some of arch/*/boot/compressed,
with various relocation errors, iirc.

Avoid those problems by adding a define to suppress the "transparent"
DEFINE_DYNAMIC_DEBUG_TABLE() invocation.  I found the x86 problems
myself, lkp@intel.com found arm & sparc problems, and may yet find
others.

Reported-by: <lkp@intel.com> # on [jimc:lkp-test/dyndbg-diet] recently
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 arch/arm/boot/compressed/Makefile     | 2 ++
 arch/sparc/vdso/Makefile              | 2 ++
 arch/x86/boot/compressed/Makefile     | 1 +
 arch/x86/entry/vdso/Makefile          | 3 +++
 arch/x86/purgatory/Makefile           | 1 +
 drivers/firmware/efi/libstub/Makefile | 3 ++-
 6 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 41bcbb460fac..f2d7a3b62727 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -81,6 +81,8 @@ compress-$(CONFIG_KERNEL_LZMA) = lzma_with_size
 compress-$(CONFIG_KERNEL_XZ)   = xzkern_with_size
 compress-$(CONFIG_KERNEL_LZ4)  = lz4_with_size
 
+KBUILD_CFLAGS += -DNO_DYNAMIC_DEBUG_TABLE
+
 libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
 
 ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 77d7b9032158..58ed4d64c978 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -30,6 +30,8 @@ obj-y += $(vdso_img_objs)
 targets += $(vdso_img_cfiles)
 targets += $(vdso_img_sodbg) $(vdso_img-y:%=vdso%.so)
 
+KBUILD_CFLAGS += -DNO_DYNAMIC_DEBUG_TABLE
+
 CPPFLAGS_vdso.lds += -P -C
 
 VDSO_LDFLAGS_vdso.lds = -m elf64_sparc -soname linux-vdso.so.1 --no-undefined \
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 35ce1a64068b..b76bbf9fc504 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -36,6 +36,7 @@ KBUILD_CFLAGS := -m$(BITS) -O2 $(CLANG_FLAGS)
 KBUILD_CFLAGS += -fno-strict-aliasing -fPIE
 KBUILD_CFLAGS += -Wundef
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
+KBUILD_CFLAGS += -DNO_DYNAMIC_DEBUG_TABLE
 cflags-$(CONFIG_X86_32) := -march=i386
 cflags-$(CONFIG_X86_64) := -mcmodel=small -mno-red-zone
 KBUILD_CFLAGS += $(cflags-y)
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 12f6c4d714cd..3182728f9f4d 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -29,6 +29,9 @@ vobjs32-y := vdso32/note.o vdso32/system_call.o vdso32/sigreturn.o
 vobjs32-y += vdso32/vclock_gettime.o
 vobjs-$(CONFIG_X86_SGX)	+= vsgx.o
 
+# avoid a x86_64_RELATIVE error
+KBUILD_CFLAGS += -DNO_DYNAMIC_DEBUG_TABLE
+
 # files to link into kernel
 obj-y				+= vma.o extable.o
 KASAN_SANITIZE_vma.o		:= y
diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index 31c634a22818..8d264836ae64 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -35,6 +35,7 @@ PURGATORY_CFLAGS_REMOVE := -mcmodel=kernel
 PURGATORY_CFLAGS := -mcmodel=large -ffreestanding -fno-zero-initialized-in-bss -g0
 PURGATORY_CFLAGS += $(DISABLE_STACKLEAK_PLUGIN) -DDISABLE_BRANCH_PROFILING
 PURGATORY_CFLAGS += -fno-stack-protector
+PURGATORY_CFLAGS += -DNO_DYNAMIC_DEBUG_TABLE
 
 # Default KBUILD_CFLAGS can have -pg option set when FTRACE is enabled. That
 # in turn leaves some undefined symbols like __fentry__ in purgatory and not
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 3ef67431f05e..2b7e34555c5a 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -14,7 +14,8 @@ cflags-$(CONFIG_X86)		+= -m$(BITS) -D__KERNEL__ \
 				   $(call cc-disable-warning, address-of-packed-member) \
 				   $(call cc-disable-warning, gnu) \
 				   -fno-asynchronous-unwind-tables \
-				   $(CLANG_FLAGS)
+				   $(CLANG_FLAGS) \
+				   -DNO_DYNAMIC_DEBUG_TABLE
 
 # arm64 uses the full KBUILD_CFLAGS so it's necessary to explicitly
 # disable the stackleak plugin
-- 
2.37.2

