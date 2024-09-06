Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D475D96F227
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 13:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066A710EA25;
	Fri,  6 Sep 2024 11:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MRCQHnm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156A910EA11;
 Fri,  6 Sep 2024 11:01:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 107BA5C5AA5;
 Fri,  6 Sep 2024 11:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C72E0C4AF55;
 Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725620500;
 bh=XLEFleBi1dpezrCN0L236rCr8UnL4qKgiVJMT/gVdZo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=MRCQHnm7DALEbPuviJjS6zZwzYuQkJA9x6div0Fqn6MZQ06mWVihWBozJsiUvGcAc
 bJR6fiu5HZGRuaPcnQFN1Genvd4fYchjFtcLVcT23784VO+uuEQRHSxBO8fDEBnhHa
 RtINq3H7JdCCsRq12zSOhLMcz03TSXWgNcf/eqBmlmVUYzaKGBFIks6ZbLh2hADNAK
 cs6fBUh/DRTcvIwpUpNC0qgp0hKNjsyVf276mku+BTTSmdHMdImMz5MqqH2VlWkXWF
 KN9Rw33I1rINwOweAvT5vZKBA1rJiD1bAr2c5/O7k5JHtpE474mXigAC3KJkRU30W8
 ouI72lr0Is0kw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BBCBDCE7B00;
 Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Fri, 06 Sep 2024 13:01:35 +0200
Subject: [PATCH v2 8/8] Documentation: add howto build in macos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-macos-build-support-v2-8-06beff418848@samsung.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725620498; l=3295;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=d0Jf83ehBVzZd/6sDJAXa3klyzghUuKXMDUak+RyqVk=;
 b=HHVXUAKYpwg0oAq4Llj7Qicr7YTY8yOi8z/Ymdnnl/W0ykKZJbrrJ5EOU8LrjlVkcwlA+JR2O
 50rFNWri/6gCAgythyvckdtJX73zV3YaMq3ZWFUY7eZPAc4+9wznTjX
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

Add documentation under kbuild/llvm to inform about the experimental
support for building the Linux kernel in macOS hosts environments.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 Documentation/kbuild/llvm.rst | 78 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index 6dc66b4f31a7..de3bde925793 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -186,6 +186,84 @@ yet. Bug reports are always welcome at the issue tracker below!
      - Supported
      - ``LLVM=1``
 
+Experimental Build in macOS
+---------------------------
+
+Building on macOS with LLVM is experimental. This section provides steps to
+install dependencies via Homebrew, set up the environment, and start the build
+process.
+
+1. **Create a Case-Sensitive Volume**
+
+   For fetching and building the project, you need a case-sensitive volume. Use the following
+   command to create one:
+
+   .. code-block:: shell
+
+      diskutil apfs addVolume /dev/disk<N> "Case-sensitive APFS" linux
+
+   Replace `/dev/disk<N>` with the appropriate disk identifier.
+
+2. **Install Build Dependencies**
+
+Use Homebrew to install the required build dependencies.
+
+- **Core Utilities**: `coreutils`, `findutils`, `gnu-sed`, `gnu-tar`, `grep`,
+  `llvm`, `make`, and `pkg-config`.
+
+   .. code-block:: shell
+
+      brew install coreutils findutils gnu-sed gnu-tar grep llvm make pkg-config
+
+- **Bee Headers**: Install byteswap, elf and endian headers using the
+  `Bee Headers Project <https://github.com/bee-headers/headers>`_.
+
+   .. code-block:: shell
+
+      brew tap bee-headers/bee-headers
+      brew install bee-headers/bee-headers/bee-headers
+
+   After installation, verify the `CFLAGS` with `pkg-config`:
+
+   .. code-block:: shell
+
+      pkg-config --cflags bee-headers
+      -I/opt/homebrew/Cellar/bee-headers/0.1/include
+
+3. **Configure the PATH**
+
+   Include all the required GNU tools and LLVM in your `PATH`. This ensures that
+   the necessary tools are available during the build process.
+
+   .. code-block:: shell
+
+      PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
+      PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
+      PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
+      PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
+      PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
+      PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
+      PATH="/opt/homebrew/opt/llvm/bin:$PATH"
+
+Building the Project
+--------------------
+
+Once the environment is set up, you can start the build process using LLVM. Run
+the following commands to initiate the build:
+
+.. code-block:: shell
+
+   make LLVM=1 allyesconfig
+   make LLVM=1 -j$(nproc)
+
+Supported in macOS
+~~~~~~~~~~~~~~~~~~
+
+At the moment, only arm64 is supported and tested with `allyesconfig` Makefile
+configuration target. Other Kconfig options not included in `allyesconfig`
+target and architectures may be supported as well as support in macOS is based
+on LLVM effort and maintenance.
+
 Getting Help
 ------------
 

-- 
2.46.0


