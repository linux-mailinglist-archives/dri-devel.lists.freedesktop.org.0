Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2883896F225
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 13:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC710EA1C;
	Fri,  6 Sep 2024 11:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EsPz/rSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CFE10EA0E;
 Fri,  6 Sep 2024 11:01:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 077B3A44EA9;
 Fri,  6 Sep 2024 11:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF6A7C4CECB;
 Fri,  6 Sep 2024 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725620499;
 bh=TZ+5SMHrhrYlL8TOlFpYxPkfKpZGWI5ka+ne8BNKBYU=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=EsPz/rSiQlXGQJZAplFuV7djjKI0Bk3bxrXy/Ay04/nanHb0TmgO15cuYyvw/wTfe
 CMOiE+R6NxyJr3sgSNw9QXoW1Rpm0l2pkUfRrcOSmLmvMZXdDHkXWqZJFEBywNO7pd
 wLX/gscdGoFd8hOxSWeUerNYUdkAWf+r0pTtseDDOcRR6h730Tv4BF5e08xtvnfLO3
 DLF6b/U//YCKX29CEQu1WnDy4LqXIxoYMnYBod5HKshud7A1bjVZ4bO2DJ+19Geizy
 pzJgizOSL+pWSuakTm3zDKxt8KiQszMHHmQwFe69lNmwQm2VjGOGJIBC8DOxzWnNAz
 EFaqTkw9EHZKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B0AA8CD5BDD;
 Fri,  6 Sep 2024 11:01:39 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Subject: [PATCH v2 0/8] Enable build system on macOS hosts
Date: Fri, 06 Sep 2024 13:01:27 +0200
Message-Id: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAfh2mYC/32NQQ6CMBBFr0Jm7ZiWoAVX3sOwKJ0KkwglHUo0h
 LtbOYDL95L//gbiI3uBW7FB9CsLhylDeSrADXbqPTJlhlKVlaqVwdG6INglfhFKmucQF2ycVWS
 MpU4byMs5+ie/j+qjzTywLCF+jpNV/+z/3qpRYeVIk6f6cm2qu9hR0tSfXRih3ff9C2+x1CC4A
 AAA
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
 Daniel Gomez <da.gomez@samsung.com>, 
 Nick Desaulniers <nick.desaulniers@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725620498; l=6996;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=TZ+5SMHrhrYlL8TOlFpYxPkfKpZGWI5ka+ne8BNKBYU=;
 b=ayL2MPQnBtEx4lGC0G1crXfF8O4KlaX6OFWn5S6fsN4KlxD3Qdnjil/2zTLO/l2WVayP0UXIO
 ZVoNG/cKjqEDiiR+0GxTIYS6rNsNoRuqaX/hj9danc0NcoamLKkrxlf
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

This patch set allows for building the Linux kernel for arm64 in macOS
with LLVM.

Patches are based on previous Nick's work and suggestions [1][2][3] to
enable the Linux kernel build system on macOS hosts.

macOS does not provide certain headers that are available in a GNU/Linux
distribution with development headers installed, usually provided by
the GNU C Library (glibc) and/or other projects. These missing headers
are needed as build dependencies. To address this, the patches depend
on a new Bee Headers Homebrew Tap formula [6][7][8] that provides them
together with a pkg-config file to locate the include directory.

To locate them, Makefiles include something like:
	$(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)

[6] Project:
https://github.com/bee-headers
[7] Headers repository:
https://github.com/bee-headers/headers.git
[8] Homebrew Tap formula:
https://github.com/bee-headers/homebrew-bee-headers.git

To set up the environment, documentation is provided via last patch in
this series.

More configurations and architectures as well as support for Rust
(from Finn Behrens [4] [5]) can be added in the future to extend build
support.

[1]: WIP: build Linux on MacOS
https://github.com/ClangBuiltLinux/linux/commit/f06333e29addbc3d714adb340355f471c1dfe95a

[2] Subject: [PATCH] scripts: subarch.include: fix SUBARCH on MacOS hosts
https://lore.kernel.org/all/20221113233812.36784-1-nick.desaulniers@gmail.com/

[3] Subject: Any interest in building the Linux kernel from a MacOS host?
https://lore.kernel.org/all/CAH7mPvj64Scp6_Nbaj8KOfkoV5f7_N5L=Tv5Z9zGyn5SS+gsUw@mail.gmail.com/

[4] https://github.com/kloenk/linux/commits/rust-project_macos-dylib/

[5] https://kloenk.eu/posts/build-linux-on-m1-macos/

To: Masahiro Yamada <masahiroy@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nicolas@fjasle.eu>
To: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Hellström <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: William Hubbs <w.d.hubbs@gmail.com>
To: Chris Brannon <chris@the-brannons.com>
To: Kirk Reiser <kirk@reisers.ca>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Paul Moore <paul@paul-moore.com>
To: Stephen Smalley <stephen.smalley.work@gmail.com>
To: Ondrej Mosnacek <omosnace@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
To: James Morse <james.morse@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Zenghui Yu <yuzenghui@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: speakup@linux-speakup.org
Cc: selinux@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: linux-serial@vger.kernel.org
Cc: llvm@lists.linux.dev
Cc: Finn Behrens <me@kloenk.dev>
Cc: Daniel Gomez (Samsung) <d+samsung@kruces.com>
Cc: gost.dev@samsung.com

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
Changes in v2:
- Add documentation and set this 'feature' as experimental.
- Update cover letter.
- Drop unnecessary changes. Patches removed:
	- kbuild: add header_install dependency to scripts
	- include: add endian.h support
	- include: add elf.h support
- Update Makefiles to find Bee Headers with pkg-config.
- Update file2alias to solve uuid_t conflicts inside Makefile as
suggested by Nicolas Schier.
- Adapt xe_gen_wa_oob to solve getprogname()/
program_invocation_short_name in runtime. as suggested by Lucas De
Marchi.
- Remove linux/version.h in accessibility/speakup as suggested by
Masahiro Yamada.
- Replace selinux patches with new Masahiro Yamada's patches:
	Message-id: 20240809122007.1220219-1-masahiroy@kernel.org
	Link: https://lore.kernel.org/all/20240809122007.1220219-1-masahiroy@kernel.org/
- Replace tty/vt with new Masahiro Yamada's patch:
	Message-id: 20240809160853.1269466-1-masahiroy@kernel.org
	Link: https://lore.kernel.org/all/20240809160853.1269466-1-masahiroy@kernel.org/
	(Already merged in the linux-next tag used)
- Replace scripts/kallsyms patch with Masahiro Yamada's patch:
	Message-id: 20240807181148.660157-1-masahiroy@kernel.org
	Link: https://lore.kernel.org/all/20240807181148.660157-1-masahiroy@kernel.org/
	(Already merged in the linux-next tag used)
- Link to v1: https://lore.kernel.org/r/20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com

---
Daniel Gomez (5):
      file2alias: fix uuid_t definitions for macos
      drm/xe: xe_gen_wa_oob: fix program_invocation_short_name for macos
      arm64: nvhe: add bee-headers support
      scripts: add bee-headers support
      Documentation: add howto build in macos

Masahiro Yamada (2):
      selinux: do not include <linux/*.h> headers from host programs
      selinux: move genheaders to security/selinux/

Nick Desaulniers (1):
      scripts: subarch.include: fix SUBARCH on macOS hosts

 Documentation/kbuild/llvm.rst                      | 78 ++++++++++++++++++++++
 arch/arm64/kernel/pi/Makefile                      |  1 +
 arch/arm64/kernel/vdso32/Makefile                  |  1 +
 arch/arm64/kvm/hyp/nvhe/Makefile                   |  3 +-
 drivers/gpu/drm/xe/xe_gen_wa_oob.c                 |  4 ++
 scripts/Makefile                                   |  4 +-
 scripts/mod/Makefile                               |  7 ++
 scripts/mod/file2alias.c                           |  3 +
 scripts/remove-stale-files                         |  3 +
 scripts/selinux/Makefile                           |  2 +-
 scripts/selinux/genheaders/.gitignore              |  2 -
 scripts/selinux/genheaders/Makefile                |  5 --
 scripts/selinux/mdp/Makefile                       |  2 +-
 scripts/selinux/mdp/mdp.c                          |  4 --
 scripts/subarch.include                            |  2 +-
 security/selinux/.gitignore                        |  1 +
 security/selinux/Makefile                          |  7 +-
 .../genheaders => security/selinux}/genheaders.c   |  3 -
 security/selinux/include/classmap.h                | 19 ++++--
 security/selinux/include/initial_sid_to_string.h   |  2 -
 20 files changed, 123 insertions(+), 30 deletions(-)
---
base-commit: ad40aff1edffeccc412cde93894196dca7bc739e
change-id: 20240807-macos-build-support-9ca0d77adb17

Best regards,
-- 
Daniel Gomez <da.gomez@samsung.com>


