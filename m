Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5341AA2454E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 23:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535AB10E21B;
	Fri, 31 Jan 2025 22:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o7NKj2V9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2F610E218;
 Fri, 31 Jan 2025 22:31:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 335075C5C6F;
 Fri, 31 Jan 2025 22:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C011DC4CED1;
 Fri, 31 Jan 2025 22:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738362705;
 bh=5WW6WvPEP+frdA3hs61x3sVE8CtyeNxuUnRpo9yZHgY=;
 h=From:Date:Subject:To:Cc:From;
 b=o7NKj2V9NreCfPwjo/ABeoPJeNsHYZ0OfjLHi1gpEhBUpyCk6dQlyGF7SHYw1NVDV
 ttFuFLpt2lcMNDRTcCYBQ/X/GDQdj9rJN+Wc3JDXNqDlo9M2FfRzJnW2j1YJeVpffI
 wcOFuTkYK8vA0D6LyWrIsdcabqHeZ6eqJKXiL8T/6bGEQd4i9+djXCIo8GgR8qcz/k
 WTsUiB0zXqpjta3TqqaDxy+VQFXOpxs7o/+jVcoCvBLZox56Y9VeQBpR4DEQpdVdSX
 G8mmKdyVZb9Lg0GUBFMxka5sH1P0wrMDur9ype0jgB+2Y2LyCh+cuw3jpGKtYnFK9e
 B6WdT/jpDmHbA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 31 Jan 2025 15:31:19 -0700
Subject: [PATCH] drm/amd/display: Respect user's CONFIG_FRAME_WARN more for
 dml files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-amdgpu-respect-config_frame_warn-v1-1-68255384492b@kernel.org>
X-B4-Tracking: v=1; b=H4sIADZPnWcC/x3NQQqDMBBA0avIrDtgorWkVylFpnESZ2EMk2oL4
 t0bunyb/w8orMIF7s0ByrsUWVOFuTTgZ0qRUaZqsK29tqYzSMsU84bKJbN/o19TkDgGpYXHD2n
 CW+fIvWzfu4GhZrJykO9/8Xie5w8IikIQcgAAAA==
X-Change-ID: 20250131-amdgpu-respect-config_frame_warn-739a9b24496e
To: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3488; i=nathan@kernel.org;
 h=from:subject:message-id; bh=5WW6WvPEP+frdA3hs61x3sVE8CtyeNxuUnRpo9yZHgY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlz/f117m+ctIPHqld824FJlft5thWGpTBmVOfOmn98y
 jwRfrfujlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARib+MDI314Xv0ryzi+fBQ
 Lu7x/R96lQ62Lixz956rN9BvEL0TFcDw38/dc7vGhGrT6K2+FlPDOaWftFofkl4zre/v2wcniov
 dmQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Currently, there are several files in drm/amd/display that aim to have a
higher -Wframe-larger-than value to avoid instances of that warning with
a lower value from the user's configuration. However, with the way that
it is currently implemented, it does not respect the user's request via
CONFIG_FRAME_WARN for a higher stack frame limit, which can cause pain
when new instances of the warning appear and break the build due to
CONFIG_WERROR.

Adjust the logic to switch from a hard coded -Wframe-larger-than value
to only using the value as a minimum clamp and deferring to the
requested value from CONFIG_FRAME_WARN if it is higher.

Suggested-by: Harry Wentland <harry.wentland@amd.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Closes: https://lore.kernel.org/2025013003-audience-opposing-7f95@gregkh/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile  | 14 +++++++++-----
 drivers/gpu/drm/amd/display/dc/dml2/Makefile | 22 +++++++++++++---------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 46f9c05de16e8c9035f9e26c0b5c481c274d52ef..e1d500633dfad75e4f2265552be42a3e19dee6bf 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -29,11 +29,15 @@ dml_ccflags := $(CC_FLAGS_FPU)
 dml_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
-ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
-frame_warn_flag := -Wframe-larger-than=3072
-else
-frame_warn_flag := -Wframe-larger-than=2048
-endif
+    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
+        frame_warn_limit := 3072
+    else
+        frame_warn_limit := 2048
+    endif
+
+    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
+        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
+    endif
 endif
 
 CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 91c4f3b4bd5f46ac5c1c74f665b06dbe61081917..21fd466dba26ef3359196d0b26bc29125bb1507a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -28,15 +28,19 @@ dml2_ccflags := $(CC_FLAGS_FPU)
 dml2_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
-ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
-ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
-frame_warn_flag := -Wframe-larger-than=4096
-else
-frame_warn_flag := -Wframe-larger-than=3072
-endif
-else
-frame_warn_flag := -Wframe-larger-than=2048
-endif
+    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
+        ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
+            frame_warn_limit := 4096
+        else
+            frame_warn_limit := 3072
+        endif
+    else
+        frame_warn_limit := 2048
+    endif
+
+    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
+        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
+    endif
 endif
 
 subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/dml2

---
base-commit: 7f2b5237e313e39008a85b33ca94ab503a8fdff9
change-id: 20250131-amdgpu-respect-config_frame_warn-739a9b24496e

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

