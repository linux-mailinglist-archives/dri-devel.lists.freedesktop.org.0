Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C9985759
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 12:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686B410E034;
	Wed, 25 Sep 2024 10:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jOiEQSi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD1810E034;
 Wed, 25 Sep 2024 10:49:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8FC1EA43EB7;
 Wed, 25 Sep 2024 10:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46791C4CEC3;
 Wed, 25 Sep 2024 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727261355;
 bh=mOXXN4nugLNVdxFs6HhctyrPesuIbe74k5zt1Zd71jA=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=jOiEQSi2MLB3MILqtRoU6w9cmVJBjvPHa59d1+jhOdllVFtqNdQVOwmpRKbh9hKeD
 IsVP5FrwbAsm/AcqFcgIaOXcyMwvNfyfk+ssBXRYnQVq8Kl1L+kMM9W6wIhWQns0+B
 e4450JCwqo15q8I7Swu6GUyau2DoHV3IsXr1EY0XgCknsdsAbXJqNos3waIrys4zb8
 eT6Gq2FvZ+v46a/j36snIOW3U1eobMfjezQsePj0TmNbUtMgAXLZBbZ0g0mRTUCLPz
 PtMjgW6835HMjETcdNu/H4wclb6lUta3fOGbw/MCejEiL2L0PNITDokd7LfNiDAfzH
 Y56f+sjo6CMog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE28C369C7;
 Wed, 25 Sep 2024 10:49:15 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 25 Sep 2024 12:49:00 +0200
Subject: [PATCH v3] drm/xe: xe_gen_wa_oob: replace
 program_invocation_short_name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240925-macos-build-support-v3-1-233dda880e60@samsung.com>
X-B4-Tracking: v=1; b=H4sIAJzq82YC/33PwWrEIBQF0F8JrmvQaKIJpcx/lC6e+pKRTmKqS
 egwzL/XZCilULq8gufdeyMJo8dEuuJGIm4++TDlIJ4KYs8wDUi9y5lUrJJMM0VHsCFRs/qLo2m
 d5xAX2lpgTilwhiuSf84Re/95qK9vOZ99WkK8Hkc2vr/+722cMiqt4w6drptWnhKMaZ2G0oaR7
 OJW/Sgta/5WqqywxmDfS6611L+V+6NoxI81r14ebcmIKcGxuiuev3muqlbIkguutGCU53MJzj6
 G6+kd44SXMsThZV9uICHN/OiXrsC+lrWxTEBTS6EtGNTKoOGmBV4b1vfWNGAxd7l/AQmlimyJA
 QAA
X-Change-ID: 20240807-macos-build-support-9ca0d77adb17
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Finn Behrens <me@kloenk.dev>, 
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
 Nick Desaulniers <nick.desaulniers@gmail.com>, 
 Klaus Jensen <k.jensen@samsung.com>, Jeff Xie <xiehuan09@gmail.com>, 
 Barry Song <baohua@kernel.org>, Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727261354; l=7033;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=4fIjzJpNMXdpRQVn4dyBriGnGibGkiKPfvdpbwf8+L8=;
 b=3lmM0CgemUBgtj+LNeOe3nV81XNjUyBIQ6h7vFtjr0IPrI7x/+3gaFSs6GoihsRKy+t7hZW9N
 Dl38e5SAEMfDkw70yOQ4cVUtZkVU6Imx/J9waPje2zLFewIi7Iw1usZ
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

program_invocation_short_name() may not be available in other systems.
Instead, replace it with the argv[0] to pass the executable name and
make it portable.

Fixes build error when program_invocation_short_name is not available:

drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
undeclared identifier 'program_invocation_short_name'    34 |
program_invocation_short_name);       |                 ^ 1 error
generated.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Tested-by: Jeff Xie <xiehuan09@gmail.com>
Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
This patch allows for building the Linux kernel for arm64 in macOS with
LLVM.

macOS does not provide certain headers that are available in a GNU/Linux
distribution with development headers installed, usually provided by
the GNU C Library (glibc) and/or other projects. These missing headers
are needed as build dependencies. To address this, users need to provide
these headers manually.

To assist with provisioning and setting up the environment, the Bee
Headers Project [1][2][3] provides the necessary headers, along with a
pkg-config file to locate the include directory and an initialization
script to configure the environment. However, this is optional and users
can choose to set up their own environments and manually provide the
required headers. In that case, the project can be used as a reference.

Here’s a quick overview of the setup process using Bee Headers:

Set up a case sensitive volume to fetch Linux and build:

	diskutil apfs addVolume /dev/disk<N> "Case-sensitive APFS" linux
	
Install dependencies:

	brew install coreutils findutils gnu-sed gnu-tar grep llvm make pkg-config
	brew tap bee-headers/bee-headers
	brew install bee-headers/bee-headers/bee-headers

Initialize the environment with `bee-init` and run it in each new shell:

	source bee-init
	
Start build:
	make LLVM=1 defconfig
	make LLVM=1 -j$(nproc)

For more details and manual steps, refer to the README [4] of the Bee
Headers project.

[1] Project: https://github.com/bee-headers

[2] Headers repository: https://github.com/bee-headers/headers.git

[3] Homebrew Tap formula: https://github.com/bee-headers/homebrew-bee-headers.git

[4] https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md
---
Changes in v3:
- Update drm/xe patch to replace program_invocation_short_name with
argv[0] instead of using getprogname + ifdef as suggested by Masahiro.
- Patch merged: "[PATCH v2 1/8] scripts: subarch.include: fix SUBARCH on
macOS hosts".
- "file2alias: fix uuid_t definitions for macos" patch is dropped. User
requires to set up this in the build environment with something like:
export HOSTCFLAGS="-D_UUID_T -D__GETHOSTUUID_H"
- Drop documentation patch. Environment setup and headers should now be
provided by the user. The project Bee Headers can be used to help with
the steps and documentation.
	- HOSTCFLAGS should be used to provide the missing headers as well as the
above defines. Example using Bee Headers:
export HOSTCFLAGS="$(pkg-config --cflags bee-headers) -D_UUID_T
-D__GETHOSTUUID_H"
	- PATH needs to have all tools the kernel build system depends on.
Something like this:
	PATH="#{HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
	PATH="#{HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin:$PATH"
	PATH="#{HOMEBREW_PREFIX}/opt/gawk/libexec/gnubin:$PATH"
	PATH="#{HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:$PATH"
	PATH="#{HOMEBREW_PREFIX}/opt/gnu-tar/libexec/gnubin:$PATH"
	PATH="#{HOMEBREW_PREFIX}/opt/grep/libexec/gnubin:$PATH"
	PATH="#{HOMEBREW_PREFIX}/opt/make/libexec/gnubin:$PATH"
	PATH="#{HOMEBREW_PREFIX}/opt/llvm/bin:$PATH"
- Drop patches below as they've been replaced by a new 2nd version [8]:
	selinux: move genheaders to security/selinux/
	selinux: do not include <linux/*.h> headers from host programs
[8] Subject: [PATCH v2 1/2] selinux: do not include <linux/*.h> headers from host programs
https://lore.kernel.org/all/20240906172934.1317830-1-masahiroy@kernel.org/#t
Note: This has been specified as dependency with b4 and message-id in
the cover letter.
- Link to v2: https://lore.kernel.org/r/20240906-macos-build-support-v2-0-06beff418848@samsung.com

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
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 904cf47925aa1d5bc37983af83232d5e4697c49e..ed9183599e31cc9d76da3f22c9fb3884384a49bc 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -28,10 +28,10 @@
 	"\n" \
 	"#endif\n"
 
-static void print_usage(FILE *f)
+static void print_usage(FILE *f, const char *progname)
 {
 	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
-		program_invocation_short_name);
+		progname);
 }
 
 static void print_parse_error(const char *err_msg, const char *line,
@@ -144,7 +144,7 @@ int main(int argc, const char *argv[])
 
 	if (argc < 3) {
 		fprintf(stderr, "ERROR: wrong arguments\n");
-		print_usage(stderr);
+		print_usage(stderr, argv[0]);
 		return 1;
 	}
 

---
base-commit: ef545bc03a65438cabe87beb1b9a15b0ffcb6ace
change-id: 20240807-macos-build-support-9ca0d77adb17
prerequisite-message-id: <20240906172934.1317830-1-masahiroy@kernel.org>
prerequisite-patch-id: 5d49a803cc75a57174d16745222d1602809aeb96
prerequisite-patch-id: b2da334443fa81626d742053ca5005074e9e1355

Best regards,
-- 
Daniel Gomez <da.gomez@samsung.com>


