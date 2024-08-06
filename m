Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9CB949BE7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 01:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FD410E14D;
	Tue,  6 Aug 2024 23:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aLbLyJxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB41210E0F6;
 Tue,  6 Aug 2024 23:10:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 871F6CE0FB1;
 Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21795C4AF52;
 Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722985803;
 bh=+He+gtxBEfl84UV5f19qlMQcV5CCfyJDOMqxiVvtbII=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=aLbLyJxtYoDu5TGf0hBkTczCnA5tXznd/CqtRPoDueECJQqPixBgxrK1R6VJU4ALQ
 wHZifyZwJpUqkcXzqh6ZTUeJXh9uE8lwd+OxU3dU99uZ56ZTSP+q0vSy4QSJktfZ2x
 /tZyFRY2dnCmPxOfo9NVMRqfVfcLqsZZVeXzBKgqj3BArSKVY8my2wx9g9QVJssTD6
 gNmwARWq1WXchHb2JkQ5HlE7cifTbfItuWLYcMPM7rUweSS21IVX5l3qCGZP/bNc0S
 UUfSWuCWYu8/aAQmFYejLcdLA2FzilLeIF0l4Ry824CqiUIGQZq5bXm3UEaPJIRGnc
 RI9UhDJq7BmUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 13D5DC52D7D;
 Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:19 +0200
Subject: [PATCH 05/12] accessiblity/speakup: genmap and makemapdata require
 linux/version.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-5-4cd1ded85694@samsung.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=1496;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=D/b2l/ogAQ53pGShlNQZ21O8ea5Cj2WGeFYeW0o1yvE=;
 b=R4qyiYP+OSMcXzv9ooR7/t6MnLqProoNVp1nlUQ8nIYUNbvpy7GzUbYP6W8c5xRb6Xs1z5qrf
 NNsKqstejrNCJU8W3NSEixOEN8GSNjVGvk+o0yOAwyi6oB306luifET
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

Both genmap and makemapdata require the linux/version.h header. To
ensure successful builds on macOS hosts, make sure usr/include is
included in the HOSTCFLAGS.

Fixes errors:
drivers/accessibility/speakup/genmap.c:13:10: fatal error: 'linux/version.h' file not found
   13 | #include <linux/version.h>
      |          ^~~~~~~~~~~~~~~~~
1 error generated.

drivers/accessibility/speakup/makemapdata.c:13:10: fatal error: 'linux/version.h' file not found
   13 | #include <linux/version.h>
      |          ^~~~~~~~~~~~~~~~~
1 error generated.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 drivers/accessibility/speakup/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accessibility/speakup/Makefile b/drivers/accessibility/speakup/Makefile
index 6f6a83565c0d..74ee0c31370f 100644
--- a/drivers/accessibility/speakup/Makefile
+++ b/drivers/accessibility/speakup/Makefile
@@ -38,6 +38,7 @@ clean-files := mapdata.h speakupmap.h
 # Generate mapdata.h from headers
 hostprogs += makemapdata
 makemapdata-objs := makemapdata.o
+HOSTCFLAGS_makemapdata.o += -I$(srctree)/usr/include
 
 quiet_cmd_mkmap = MKMAP   $@
       cmd_mkmap = TOPDIR=$(srctree) \
@@ -51,6 +52,7 @@ $(obj)/mapdata.h: $(obj)/makemapdata
 # Generate speakupmap.h from mapdata.h
 hostprogs += genmap
 genmap-objs := genmap.o
+HOSTCFLAGS_genmap.o += -I$(srctree)/usr/include
 $(obj)/genmap.o: $(obj)/mapdata.h
 
 quiet_cmd_genmap = GENMAP  $@

-- 
Git-146)


