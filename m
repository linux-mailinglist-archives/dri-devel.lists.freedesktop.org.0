Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FC949BD8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 01:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB42810E0EF;
	Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XyM4t6ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224B210E0DC;
 Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E23661119;
 Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3CB0C32786;
 Tue,  6 Aug 2024 23:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722985802;
 bh=srDtPMkx+3Ib/2vxXDsh66x8GKusBSCFnXcAPZ0/fJs=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=XyM4t6uixRdVtkkTDbe0NOXLXZ37CozxQGFZMrfsO/1RoZeoVND7Z91irbEFkZG1o
 QK9utNoPH7ktjzxgS9PHoD3qn/DNgqvVdZsgReOQMjUrT2TlQWFkqaNximTlbkANJw
 fwIaCs8OsL+5RpaxQ7RQgnnJNhR2sK1DHuPhkA26DmsSHTA9hDidEKUXDf1733zm99
 S42u2FVCM/ikVhxmWNb19aaYerJ5H8KgfmYrOTZTuTaNNyjHX7w/yoQnm1GFvnWvt/
 BEBQiXjUFnQg6HPQgb/LURhqtACOPKxOuV9p3+Gjq6Aluocc6VajyOLbdkqKccoIPM
 bvFunUNgxUrOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 96120C49EA1;
 Tue,  6 Aug 2024 23:10:02 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Subject: [PATCH 00/12] Enable build system on macOS hosts
Date: Wed, 07 Aug 2024 01:09:14 +0200
Message-Id: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABqtsmYC/x3MQQqAIBBA0avErBuwCKyuEi1MpxqoFCcjiO6et
 HyL/x8QikwCffFApIuF/ZFRlQXY1RwLIbtsqFXdqFZp3I31glPizaGkEHw8sbNGOa2NmyoNuQy
 RZr7/6zC+7wcg7OjoZQAAAA==
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
 Daniel Gomez <da.gomez@samsung.com>, 
 Nick Desaulniers <nick.desaulniers@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=5760;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=srDtPMkx+3Ib/2vxXDsh66x8GKusBSCFnXcAPZ0/fJs=;
 b=LiLIkclk6gyjYUEvcQG/jWd8xczYA+IguM7XsmOaFyvBmuk7FzB0cX6xsiSYYX3g4q3i4pKTn
 rvltGN/7ZboBznQAO+ngrBCel8MYDLLj7yJ1vi5dIVQBZPHBahIv5wm
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

This patch set allows for building the Linux kernel for arm64 in macOS with
LLVM.

Patches are based on previous Nick's work and suggestions [1][2][3] to
enable build system in macOS hosts.

Since macOS does not provide some of the headers available in the GNU
C Library (glibc), the patches include a copy of these headers from
glibc-2.40, with minor modifications detailed in the commit message.

To set up the environment:

* Provide build dependencies (installed via Homebrew):

	coreutils, findutils, gnu-sed, gnu-tar, grep, llvm, make and pkg-config.

* A case sensitive volume for building:

	diskutil apfs addVolume /dev/disk<N> "Case-sensitive APFS" linux

* And include in your PATH all GNU tools required by the Linux kernel as
well as LLVM:

	PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
	PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
	PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
	PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
	PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
	PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
	PATH="/opt/homebrew/opt/llvm/bin:$PATH"

* Start the build using LLVM:

	make LLVM=1 allyesconfig
	make LLVM=1 -j$(nproc)

I believe other architectures could also be supported if we can move
forward this initiative. Additionally, we could incorporate Rust
support. I understand that Finn Behrens has some patches [4][5] based on
Nick's previous work.

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
Daniel Gomez (11):
      kbuild: add header_install dependency to scripts
      file2alias: fix uuid_t definitions for macos
      drm/xe: xe_gen_wa_oob: fix program_invocation_short_name for macos
      accessiblity/speakup: genmap and makemapdata require linux/version.h
      selinux/genheaders: include bitsperlong and posix_types headers
      selinux/mdp: include bitsperlong and posix_types headers
      include: add elf.h support
      include: add endian.h support
      scripts/mod: add byteswap support
      tty/vt: conmakehash requires linux/limits.h
      scripts/kallsyms: add compatibility support for macos

Nick Desaulniers (1):
      scripts: subarch.include: fix SUBARCH on MacOS hosts

 Makefile                               |    2 +-
 arch/arm64/kernel/pi/Makefile          |    1 +
 arch/arm64/kernel/vdso32/Makefile      |    1 +
 arch/arm64/kvm/hyp/nvhe/Makefile       |    2 +-
 drivers/accessibility/speakup/Makefile |    2 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c     |    8 +-
 drivers/tty/vt/Makefile                |    1 +
 include/byteswap/byteswap.h            |   35 +
 include/elf/elf.h                      | 4491 ++++++++++++++++++++++++++++++++
 include/endian/bits/uintn-identity.h   |   48 +
 include/endian/endian.h                |   63 +
 scripts/Makefile                       |    3 +-
 scripts/kallsyms.c                     |    4 +
 scripts/mod/Makefile                   |    6 +
 scripts/mod/file2alias.c               |    3 +
 scripts/selinux/genheaders/Makefile    |    3 +-
 scripts/selinux/mdp/Makefile           |    3 +-
 scripts/subarch.include                |    3 +-
 18 files changed, 4672 insertions(+), 7 deletions(-)
---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240807-macos-build-support-9ca0d77adb17

Best regards,
-- 
Daniel Gomez <da.gomez@samsung.com>


