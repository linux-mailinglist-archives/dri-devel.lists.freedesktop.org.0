Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35354A4154B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 07:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524BE10E13A;
	Mon, 24 Feb 2025 06:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vhy8n0Pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543C710E139;
 Mon, 24 Feb 2025 06:23:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C24D5C3F39;
 Mon, 24 Feb 2025 06:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CC4C4CED6;
 Mon, 24 Feb 2025 06:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740378225;
 bh=cuyUHzmNRrlRengPj2KWGGE7uP665a9dsZbLx/j8reQ=;
 h=From:Date:Subject:To:Cc:From;
 b=Vhy8n0PgndAb1R2oxQLvdFy/gSk/u/G05X+Ht7jPi9KZLU1q2VKDhaPF6YRHW1cvs
 8FFdyRk58kF36XiE0PSpIabDL0/NuYmFz4PClvpqmlNj9OPZ7mi0MeJ+VnRlbh7wL2
 jrWLr8+fwSlfnzVipwbxgEBd9cDz6dJHDUlfwgTUcaXqyeWT8BXlFLH2pg9o5SnSo5
 uw5zBGLrXOD9mhCiacoOXOOaCiYxHwlhDdbvEyfhUYlW30M0ATRFXJE12TshRm/tvz
 aaT0gxAWtQAqHdWokPmdL2x7g4XtxbeSXJ9SBHUC0sb+RrvcxjQgr7fBH9nwufTajV
 mq9PpSUHj44EA==
From: da.gomez@kernel.org
Date: Mon, 24 Feb 2025 07:23:13 +0100
Subject: [PATCH RESEND v3] drm/xe: xe_gen_wa_oob: replace
 program_invocation_short_name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
X-B4-Tracking: v=1; b=H4sIAFAQvGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMT3dzE5Pxi3aTSzJwU3eLSgoL8ohLdilTdNAND82QLE0ND4yQzJaD
 mgqLUtMwKsMHRSkGuwa5+LkqxtbUAW9q+nXAAAAA=
X-Change-ID: 20250224-macos-build-support-xe-f017c84113b6
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Justin Stitt <justinstitt@google.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Klaus Jensen <k.jensen@samsung.com>, Tamir Duberstein <tamird@gmail.com>, 
 Theodore Ts'o <tytso@mit.edu>, gost.dev@samsung.com, 
 Barry Song <baohua@kernel.org>, Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Gomez <da.gomez@samsung.com>

program_invocation_short_name() may not be available in other systems.
Instead, replace it with the argv[0] to pass the executable name.

Fixes build error when program_invocation_short_name is not available:

drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
undeclared identifier 'program_invocation_short_name'    34 |
program_invocation_short_name);       |                 ^ 1 error
generated.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
This last patch allows for building the Linux kernel allyesconfig target
for arm64 in macOS hosts with Clang/LLVM.

Summary of previous feedback and work:

Other Makefile targets, such as defconfig, can already be built
successfully if the necessary headers are provided and the Linux kernel
build system is configured appropriately. To facilitate this process,
the Bee Headers [1] project was created not only to serve as reference
but also to document [2] the process and supply the missing headers.

To get started:

1. Setup:
	diskutil apfs addVolume /dev/disk<N> "Case-sensitive APFS" linux

	brew install coreutils findutils gnu-sed gnu-tar grep llvm make \
	pkg-config
	brew tap bee-headers/bee-headers
	brew install bee-headers/bee-headers/bee-headers

2. Build:
	source bee-init
	
	make LLVM=1 defconfig
	make LLVM=1 -j$(nproc)

[1] Project: https://github.com/bee-headers
[2] Documentation:
https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md

The changelog below has been refined to focus only on feedback related
to the xe driver. Version 3 was submitted some time ago, and although
some errors occurred in CI, they appear to be unrelated to the changes.
---
Changes in v3 (RESEND):
- Update cover letter and To/Cc list.
- Rebase patch onto next-20250221.
- Link to v3: https://lore.kernel.org/all/20240925-macos-build-support-v3-1-233dda880e60@samsung.com/
Changes in v3:
- Update drm/xe patch to replace program_invocation_short_name with
argv[0] instead of using getprogname + ifdef as suggested by Masahiro.
- Link to v2: https://lore.kernel.org/r/20240906-macos-build-support-v2-0-06beff418848@samsung.com

Changes in v2:
- Adapt xe_gen_wa_oob to solve getprogname()/
program_invocation_short_name in runtime. as suggested by Lucas De
Marchi.
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
base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
change-id: 20250224-macos-build-support-xe-f017c84113b6

Best regards,
-- 
Daniel Gomez <da.gomez@samsung.com>

