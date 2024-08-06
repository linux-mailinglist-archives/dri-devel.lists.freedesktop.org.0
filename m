Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB48949BDC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 01:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152010E10B;
	Tue,  6 Aug 2024 23:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qafz2PhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E815F10E0DC;
 Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0C7361129;
 Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01B09C4AF16;
 Tue,  6 Aug 2024 23:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722985803;
 bh=uHxvuxO0nTmpbMtxhgnEbpjTz1SrBIV60PpJ/lx8HtY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Qafz2PhGLQMsInHmaxpimjHf7o3vElKcSPcKPBkNLA8JmsImJyqRr1TA+PQw7yIWb
 DFFrqCGUYfIWUz3Mhwkc6nBFI3FoAQT/5bHnkY9IqwccKVsvaq8P0jh7FwqIqzutPW
 1a+h06OAtCmOFSPrgH1Ou/QvwGmqkG+dPZK46ZBLa0g3Avpz5iJSTy0wClBLiKmSrM
 otMkTBzlZWAktenJiRsO2gsFNw+C7JGaeR0FuWnAjJCoc5/ehTvmPt+FwyO/mqSXFt
 dAeiARvy6n4kF1LmO0ZdL6zVCe/HI/qWz8SJVzmSkb/R/UmENH74Z+zXwEaDTj65t1
 Ym4mYn26pW6qQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E2447C49EA1;
 Tue,  6 Aug 2024 23:10:02 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:17 +0200
Subject: [PATCH 03/12] file2alias: fix uuid_t definitions for macos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-3-4cd1ded85694@samsung.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=9911;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=nemzUrB1i67gy9aXyJv3/64HHXWWgSa+4xEBHOyixjc=;
 b=p+yuh3mL0iCpJvZtgrkpRIYmhQo3akpYmU0pqAz9yDBcruXUcnpdx64xl9e2JWqKRcddaLKCp
 Z9H1KKB7B39B+F3fPDUcBRxI0WkigqfNwAc/pD18VVCbCOpX8TuelHs
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
error below. To resolve this conflict, redefine the uuid_t specifically
for macOS hosts.

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

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/mod/file2alias.c | 3 +++
 1 file changed, 3 insertions(+)

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
Git-146)


