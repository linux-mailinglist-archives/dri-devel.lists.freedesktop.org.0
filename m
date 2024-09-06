Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EBB96F226
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 13:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193E010EA1E;
	Fri,  6 Sep 2024 11:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nxG8/z3/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA65310EA14;
 Fri,  6 Sep 2024 11:01:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F257EA44EBB;
 Fri,  6 Sep 2024 11:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA70EC4CEC8;
 Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725620500;
 bh=k/ostPjBb2RaOLOfrnDMYA2N54/QZE16AA/TWFsbio4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=nxG8/z3/5I8z1C8Wzy1qACh38gwMf7IXF0thhrk3iBgh4ZrzM5KoJdkhMSSGQf4sM
 sgzlS6SuCOXT6CbUjOsUFBZPj3eTZGa5+wicqdlK1tUL8tV2HocJp52aVK2EkcoUls
 f2fvs65iKksdw3TIzhU5gep70ltRpsrh8QPcpEV+/qvuQebqtdBGAATk+YjIKYlPHh
 aYA8G0yNEGNBzYWhzc2/Q2y0EdRLNJQ/KVT3XJ+SC8TsteShmp2v6ywigmXAoBYStb
 KoFz2eLqNaN9jpjt9RrlVNMniNwNPjikbq3nRLYwhpOeg6mthscmFySsV8B4YJCnwE
 cQYFf4ywkOduA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A1A76CD5BDD;
 Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Fri, 06 Sep 2024 13:01:34 +0200
Subject: [PATCH v2 7/8] selinux: move genheaders to security/selinux/
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-macos-build-support-v2-7-06beff418848@samsung.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725620498; l=3373;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=g4JOSV4HqHDizgdp1dK7R63MzB9RpJwV09N6flHpMq4=;
 b=oOIBFyDWmIhzLNfk0f2h+dEpxGUEWkknDwR03lHNhX0SplfqCIavTEk26syHTsKXggxUTu0MI
 IQEl+ez/e6oBBpwWqLDY6C6/4Av2j0+dPziED7wGl02bPV2Os+pMbRe
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

From: Masahiro Yamada <masahiroy@kernel.org>

This tool is only used in security/selinux/Makefile.

There is no reason to keep it under scripts/.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
 scripts/remove-stale-files                                    | 3 +++
 scripts/selinux/Makefile                                      | 2 +-
 scripts/selinux/genheaders/.gitignore                         | 2 --
 scripts/selinux/genheaders/Makefile                           | 3 ---
 security/selinux/.gitignore                                   | 1 +
 security/selinux/Makefile                                     | 7 +++++--
 {scripts/selinux/genheaders => security/selinux}/genheaders.c | 0
 7 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index 8fc55a749ccc..6e39fa8540df 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -20,6 +20,9 @@ set -e
 # yard. Stale files stay in this file for a while (for some release cycles?),
 # then will be really dead and removed from the code base entirely.
 
+# moved to security/selinux/genheaders
+rm -f scripts/selinux/genheaders/genheaders
+
 rm -f *.spec
 
 rm -f lib/test_fortify.log
diff --git a/scripts/selinux/Makefile b/scripts/selinux/Makefile
index 59494e14989b..4b1308fa5732 100644
--- a/scripts/selinux/Makefile
+++ b/scripts/selinux/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-subdir-y := mdp genheaders
+subdir-y := mdp
diff --git a/scripts/selinux/genheaders/.gitignore b/scripts/selinux/genheaders/.gitignore
deleted file mode 100644
index 5fcadd307908..000000000000
--- a/scripts/selinux/genheaders/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-genheaders
diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genheaders/Makefile
deleted file mode 100644
index 866f60e78882..000000000000
--- a/scripts/selinux/genheaders/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-hostprogs-always-y += genheaders
-HOST_EXTRACFLAGS += -I$(srctree)/security/selinux/include
diff --git a/security/selinux/.gitignore b/security/selinux/.gitignore
index 168fae13ca5a..01c0df8ab009 100644
--- a/security/selinux/.gitignore
+++ b/security/selinux/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 av_permissions.h
 flask.h
+/genheaders
diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index c47519ed8156..86f0575f670d 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -36,7 +36,10 @@ quiet_cmd_genhdrs = GEN     $(addprefix $(obj)/,$(genhdrs))
 # see the note above, replace the $targets and 'flask.h' rule with the lines
 # below:
 #  targets += $(genhdrs)
-#  $(addprefix $(obj)/,$(genhdrs)) &: scripts/selinux/...
+#  $(addprefix $(obj)/,$(genhdrs)) &: $(obj)/genheaders FORCE
 targets += flask.h
-$(obj)/flask.h: scripts/selinux/genheaders/genheaders FORCE
+$(obj)/flask.h: $(obj)/genheaders FORCE
 	$(call if_changed,genhdrs)
+
+hostprogs := genheaders
+HOST_EXTRACFLAGS += -I$(srctree)/security/selinux/include
diff --git a/scripts/selinux/genheaders/genheaders.c b/security/selinux/genheaders.c
similarity index 100%
rename from scripts/selinux/genheaders/genheaders.c
rename to security/selinux/genheaders.c

-- 
2.46.0


