Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62286949BE5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 01:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEE010E13D;
	Tue,  6 Aug 2024 23:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o+lQ8BSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C650A10E0F7;
 Tue,  6 Aug 2024 23:10:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6FF7961161;
 Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC059C4DDF2;
 Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722985803;
 bh=9e5HihbYrzW+yqMwPJuNIyYK7+g4nznwrO87MB3vxcw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=o+lQ8BSoR4Ju/qZlqGOlRz8W2f4q625HDTETwcqpRBjBIpAHGmQ4EhMKKTCrVreRQ
 cIij2h8u3Uj6gXm5CHjB8ZQimA5YafQ9XWOV2o1uu3tZBWOvgIMFI8AFfFiJ0dI92M
 aoytBlmDJanRB8H64UdAlaPbXPnzN4D/Wc3OFyrsX5han8E3MgpLOUmmDDLWEAHz9y
 p+5O8jYXU7kKMItQ7ePyHdVWGORIV+pm5SYHGS28lg/JmvXwTxkuGKyTZ97qEWWWqF
 AjIMrzZ4mMs+L8E3mvHZQYOkKmBB3WEHGFQ6jwmqa8mALLsYxxk4D8WrcyhqZtG2kx
 h3F7SMY6psQPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3E3C52D7C;
 Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:24 +0200
Subject: [PATCH 10/12] scripts/mod: add byteswap support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-10-4cd1ded85694@samsung.com>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, 
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=5000;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=Qowyf7kXi1f6DRNle64eE+hm/m7HuihHCLdS1ou6yWA=;
 b=XP/CA3ITn/u6BrAjNNPHqWBAlVrrGINO1YjcxsqBUDayPo6aLVaS+rjtkAXOWZpLD9D5LKteD
 curVBFT06iiCK+55uBnnvP0sGKgQlV/aIMRgcPJ3CQmwNbgNCAfx2DS
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
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
Reply-To: da.gomez@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Gomez <da.gomez@samsung.com>

macOS hosts do not include byteswap.h header required for modpost
objects. Add a copy of the string/byteswap.h from the GNU C Library
(glibc), version glibc-2.40 into include/byteswap and update the modpost
Makefile to include the library.

Remove the following headers from glibc:

diff --git a/include/byteswap/byteswap.h b/include/byteswap/byteswap.h
index 66efb8fc4327..d27dd5e4bc6a 100644
--- a/include/byteswap/byteswap.h
+++ b/include/byteswap/byteswap.h
@@ -19,11 +19,6 @@
 #ifndef _BYTESWAP_H
 #define _BYTESWAP_H    1

-#include <features.h>
-
-/* Get the machine specific, optimized definitions.  */
-#include <bits/byteswap.h>
-

 /* The following definitions must all be macros, otherwise some
    of the possible optimizations are not possible.  */

Fixes build error for macOS:

$SUBARCH is [arm64]
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTCC  scripts/mod/file2alias.o
In file included from scripts/mod/symsearch.c:8:
scripts/mod/modpost.h:2:10: fatal error: 'byteswap.h' file not found
         ^~~~~~~~~~~~
In file included from scripts/mod/sumversion.c:11:
scripts/mod/modpost.h:2:10: fatal error: 'byteswap.h' file not found
         ^~~~~~~~~~~~
In file included from scripts/mod/modpost.c:23:
scripts/mod/modpost.h:2:10: fatal error: 'byteswap.h' file not found
         ^~~~~~~~~~~~
1 error generated.
make[1]: *** [scripts/Makefile.host:133: scripts/mod/symsearch.o] Error 1
make[1]: *** Waiting for unfinished jobs....
1 error generated.
In file included from scripts/mod/file2alias.c:15:
scripts/mod/modpost.h:2:10: fatal error: 'byteswap.h' file not found
         ^~~~~~~~~~~~
make[1]: *** [scripts/Makefile.host:133: scripts/mod/sumversion.o] Error 1
1 error generated.
make[1]: *** [scripts/Makefile.host:133: scripts/mod/modpost.o] Error 1
1 error generated.
make[1]: *** [scripts/Makefile.host:133: scripts/mod/file2alias.o] Error 1
make: *** [Makefile:1191: prepare0] Error 2
error: Recipe `kernel-build` failed with exit code 2

Fixes: bd78c9d71420 ("modpost: define TO_NATIVE() using bswap_*
functions") build error for macOS.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 include/byteswap/byteswap.h | 35 +++++++++++++++++++++++++++++++++++
 scripts/mod/Makefile        |  8 ++++----
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/include/byteswap/byteswap.h b/include/byteswap/byteswap.h
new file mode 100644
index 000000000000..d27dd5e4bc6a
--- /dev/null
+++ b/include/byteswap/byteswap.h
@@ -0,0 +1,35 @@
+/* Swap byte order for 16, 32 and 64 bit values
+   Copyright (C) 1997-2024 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#ifndef _BYTESWAP_H
+#define _BYTESWAP_H	1
+
+
+/* The following definitions must all be macros, otherwise some
+   of the possible optimizations are not possible.  */
+
+/* Return a value with both bytes in the 16 bit argument swapped.  */
+#define bswap_16(x) __bswap_16 (x)
+
+/* Return a value with all bytes in the 32 bit argument swapped.  */
+#define bswap_32(x) __bswap_32 (x)
+
+/* Return a value with all bytes in the 64 bit argument swapped.  */
+#define bswap_64(x) __bswap_64 (x)
+
+#endif /* byteswap.h */
diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 98b4cd8cc7e6..f398dcddef58 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -8,10 +8,10 @@ modpost-objs	:= modpost.o file2alias.o sumversion.o symsearch.o
 
 devicetable-offsets-file := devicetable-offsets.h
 
-HOSTCFLAGS_modpost.o = -I$(srctree)/include/elf
-HOSTCFLAGS_file2alias.o = -I$(srctree)/include/elf
-HOSTCFLAGS_sumversion.o = -I$(srctree)/include/elf
-HOSTCFLAGS_symsearch.o = -I$(srctree)/include/elf
+HOSTCFLAGS_modpost.o = -I$(srctree)/include/elf -I$(srctree)/include/byteswap
+HOSTCFLAGS_file2alias.o = -I$(srctree)/include/elf -I$(srctree)/include/byteswap
+HOSTCFLAGS_sumversion.o = -I$(srctree)/include/elf -I$(srctree)/include/byteswap
+HOSTCFLAGS_symsearch.o = -I$(srctree)/include/elf -I$(srctree)/include/byteswap
 HOSTCFLAGS_mk_elfconfig.o = -I$(srctree)/include/elf
 
 $(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FORCE

-- 
Git-146)


