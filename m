Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4058B96F21F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 13:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA79810EA0E;
	Fri,  6 Sep 2024 11:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uWD382OF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCF210EA0E;
 Fri,  6 Sep 2024 11:01:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 757185C5AC8;
 Fri,  6 Sep 2024 11:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30E7AC4CECF;
 Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725620500;
 bh=VRY9hw7zC+rmwJqhBTSG/76DJOwQSDt2QqR1xiCym/8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=uWD382OFT6kbeZILBvct3+ps3vQOuIMXE7IGd+9h7l1pcSoKqakHneRZJYMkb5WG8
 xVUiflkH01b28wXkhRcrqywH+dhdfFP/kvNfAXHOioyAVObECBr5IjCIphE3gWtm3Q
 scDo8Fm+iuaXAsgV58cl9gMCnIy/fOyTx7tnDu+Tvt+TCbbhvEVZ7TQs5lJXKTKLII
 dePIxiy6dV28S1dct4tih+mvjanUybrGhFzZt4eHWST6GFxt3qeNLeEFakS72s7ieX
 VXfuoQmRSmPRX5coOL9FODTJ92D5kvrh70oi7+wElaUotlw4DnZzAJN5OrQufRGieT
 J1cAKibRl2zdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1D794CE7B00;
 Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Fri, 06 Sep 2024 13:01:29 +0200
Subject: [PATCH v2 2/8] file2alias: fix uuid_t definitions for macos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-macos-build-support-v2-2-06beff418848@samsung.com>
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, William Hubbs <w.d.hubbs@gmail.com>, 
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, 
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
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, 
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725620498; l=10491;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=kEoEyvruU1xrPTnRzMVPNv/DX5W819KO2SPMHt88X9k=;
 b=zvtijQv+MlRcQEW1UxGj5ftHZV4daT/doF2R2i3mC2QdO36IpAm4k54Mo9R6dylpW1kAX3wl8
 V9KDI1IPuv8BNr7uRX/2M7DXWnZ8WXLYzBkClN04ARgNGx++SwQYVZp
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

The uuid_t struct defined in sys/types.h on macOS hosts conflicts with
the one defined in file2alias, resulting in the typedef redefinition
error below. To resolve this conflict, define the _UUID_T and
__GETHOSTUUID_ in file2alias HOSTCFLAGS.

Error:
  HOSTCC  scripts/mod/file2alias.o scripts/mod/file2alias.c:45:3:
error: typedef redefinition with different types ('struct uuid_t' vs
'__darwin_uuid_t' (aka 'unsigned char[16]'))    45 | } uuid_t;       |
^
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   sys/_types/_uuid_t.h:31:25: note: previous definition is here 31 |
   typedef __darwin_uuid_t uuid_t;    |                         ^
scripts/mod/file2alias.c:1354:7: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1354 |
 uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1354:19: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1354 |
 uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1354:31: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1354 |
 uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1354:43: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1354 |
 uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1354:55: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1354 |
 uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1355:7: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1355 |
 uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1355:19: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1355 |
 uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1355:31: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1355 |
 uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1355:43: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1355 |
 uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1355:55: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1355 |
 uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1356:7: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1356 |
 uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1356:20: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1356 |
 uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1356:33: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1356 |
 uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1356:46: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1356 |
 uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1356:59: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1356 |
 uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      |
 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
scripts/mod/file2alias.c:1357:7: error: member reference base
 type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
 'unsigned char[16]') is not a structure or union 1357 |
 uuid->b[15]);      |                 ~~~~^ ~
/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
   secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
   __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
   |                                                        ^~~~~~~~~~~
17 errors generated.

Suggested-by: Nicolas Schier <nicolas@fjasle.eu>
Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/mod/Makefile     | 2 ++
 scripts/mod/file2alias.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index c729bc936bae..75c12c045f21 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -8,6 +8,8 @@ modpost-objs	:= modpost.o file2alias.o sumversion.o symsearch.o
 
 devicetable-offsets-file := devicetable-offsets.h
 
+HOSTCFLAGS_file2alias.o += -D_UUID_T -D__GETHOSTUUID_H
+
 $(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FORCE
 	$(call filechk,offsets,__DEVICETABLE_OFFSETS_H__)
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 99dce93a4188..ab743f6d60ef 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -11,6 +11,9 @@
  */
 
 #include "modpost.h"
+#ifdef __APPLE__
+#define uuid_t sys_uuid_t
+#endif
 #include "devicetable-offsets.h"
 
 /* We use the ELF typedefs for kernel_ulong_t but bite the bullet and

-- 
2.46.0


