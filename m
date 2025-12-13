Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308AACBA5FF
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 07:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3409610E991;
	Sat, 13 Dec 2025 06:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BCx/DiFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA83610E7B3;
 Sat, 13 Dec 2025 06:16:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D96F43A67;
 Sat, 13 Dec 2025 06:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C77AC4CEF7;
 Sat, 13 Dec 2025 06:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765606615;
 bh=sTK1YGj6eKx5Gicnu8MwLR39ZdM9m/hCqbZOnP6BLvM=;
 h=From:Date:Subject:To:Cc:From;
 b=BCx/DiFYF0Cm+b/S0kXjjRkkvo7nUgLni7sz1Z8q4nAO4dHe4aymGHirPoVsfPcEK
 146Wlgo2YKVlbuzIDt50IlKYLStuex/MK15b6StglIhZlmxiuKQ84XDr7ofatk0Ui3
 5+gc3Fl7JzOzKJxpTmAKes4J8V015wxnqfUq4WEQDpYCGPHKH8C7nxP6QeDtlM9FsN
 voVTajLQs7mjwEUsJIYTrxr5NFzPZQGSH9UdJTmee6tVTYegHEgHaIo5/inzqzFTs9
 mSWPWSZW/FdFeWLmZHO7lifEl5MzxtgeZb9KIE5IdjJRFgON/RXn42/0bjyXodpX/o
 PsBbsqacRwS/g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 13 Dec 2025 15:16:43 +0900
Subject: [PATCH] drm/amd/display: Apply e4479aecf658 to dml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-dml-bump-frame-warn-clang-sanitizers-v1-1-0e91608db9eb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMoEPWkC/yXN0QrCMAyF4VcZuTawdiroq4gXWZdqZK0j2XRs7
 N2tevnB4T8rGKuwwblaQfklJs9c4HYVhDvlG6N0xeBrf3DeNdilHtspDRiVEuObNGPoyxKNsoy
 ysBrW1OxjOLkjcYCSGpSjzL+by/Vvm9oHh/Hbhm37AH/qiS+IAAAA
X-Change-ID: 20251213-dml-bump-frame-warn-clang-sanitizers-0a34fc916aec
To: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=nathan@kernel.org;
 h=from:subject:message-id; bh=sTK1YGj6eKx5Gicnu8MwLR39ZdM9m/hCqbZOnP6BLvM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJm2LJcNlgga6tv4uJbunheUZOjHWdZe2RBQy2h6XND96
 AG39CsdpSwMYlwMsmKKLNWPVY8bGs45y3jj1CSYOaxMIEMYuDgFYCJLmRgZ1upuvF7lKNurrav6
 erL81lcOC06rLTWp5L9pKKk+/9Xxq4wMvTditv5aGH/ntGScz1xrW7Omm5vCdVokrSzipt+88aK
 THwA=
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

After an innocuous optimization change in clang-22, allmodconfig (which
enables CONFIG_KASAN and CONFIG_WERROR) breaks with:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1724:6: error: stack frame size (3144) exceeds limit (3072) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
   1724 | void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^

With clang-21, this function was already pretty close to the existing
limit of 3072 bytes.

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1724:6: error: stack frame size (2904) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
   1724 | void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^

A similar situation occurred in dml2, which was resolved by
commit e4479aecf658 ("drm/amd/display: Increase sanitizer frame larger
than limit when compile testing with clang") by increasing the limit for
clang when compile testing with certain sanitizer enabled, so that
allmodconfig (an easy testing target) continues to work.

Apply that same change to the dml folder to clear up the warning for
allmodconfig, unbreaking the build.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/2135
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index b357683b4255..268b5fbdb48b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -30,7 +30,11 @@ dml_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
     ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
-        frame_warn_limit := 3072
+        ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
+            frame_warn_limit := 4096
+        else
+            frame_warn_limit := 3072
+        endif
     else
         frame_warn_limit := 2048
     endif

---
base-commit: f24e96d69f5b9eb0f3b9c49e53c385c50729edfd
change-id: 20251213-dml-bump-frame-warn-clang-sanitizers-0a34fc916aec

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

