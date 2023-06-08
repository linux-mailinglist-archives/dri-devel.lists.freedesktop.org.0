Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A447285EC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 19:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3108F10E5F2;
	Thu,  8 Jun 2023 17:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4510E5EF;
 Thu,  8 Jun 2023 17:02:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92151619BA;
 Thu,  8 Jun 2023 17:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64855C433D2;
 Thu,  8 Jun 2023 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686243730;
 bh=9FEDzsYIDwHxxh598m4E7BJ7qf89BOb1Zpn6HGMQj80=;
 h=From:Date:Subject:To:Cc:From;
 b=R+kZXTb8gy/Bh8WYcChU0kwjdd0rl+u8uPULWcdlyvgn6cAdl6rMJsmJuGKvBhnZg
 COlLQz9zYTnxHm0OYGWGObXenwfQGeoI5RQt55mMLd5ApFPeOLpc6c0avGXvswyS8L
 elYz9p5b5T408DOasKPyf3vVKlFHt3Wbz0N2m6h+lKEGtBpoaJD+d0bpqstWjGg+Qe
 xOjMvYEoPpgz0ONT7ZROeQ8nSbVXbrVCmC5I/4aIRodpa1tSpD7Q/bBWVGqSW9cMTq
 /JccQQZBOHBJR0cYxttqHJy/QZaqbc3sfEZpmEFj0umlinSRTMgITtxVgZOV3L4p7k
 UJBHpyuIZ8Kig==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 08 Jun 2023 10:01:57 -0700
Subject: [PATCH] drm/amdgpu: Wrap -Wunused-but-set-variable in cc-option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230608-amdgpu-wrap-wunused-but-set-variable-in-cc-option-v1-1-48ca005f2247@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIQJgmQC/x2OQQrDIBBFrxJcd8AaUmyvUroYdZoIjZEZTQohd
 6/p8vH4j78rIY4k6tHtimmNEpfU4HrplJ8wjQQxNFZGm17ftAWcw5grbIwZtpqqUABXCwgVWJE
 juk/bJPAellxaDbSj+2As+sFb1boOhcAxJj+d5RmlEJ8iM73j93/m+TqOHz1XAlacAAAA
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=nathan@kernel.org;
 h=from:subject:message-id; bh=9FEDzsYIDwHxxh598m4E7BJ7qf89BOb1Zpn6HGMQj80=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDClNnBODSgTuzrSIzb451SfT0JRjDevszKBrl/7wufQc7
 gmz8VLtKGVhEONgkBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABPhTmH4X7DlpoX8uq47GbfP
 cBeybVq/Maz9wwm3ldt2PGDUTLe6vJThf8jORH9pvx9//BTN70yTVbG8khGxSCWfr9fM+aVHueh
 XBgA=
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
Cc: amd-gfx@lists.freedesktop.org, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 hamza.mahfooz@amd.com, Kenny.Ho@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

-Wunused-but-set-variable was only supported in clang starting with
13.0.0, so earlier versions will emit a warning, which is turned into a
hard error for the kernel to mirror GCC:

  error: unknown warning option '-Wunused-but-set-variable'; did you mean '-Wunused-const-variable'? [-Werror,-Wunknown-warning-option]

The minimum supported version of clang for building the kernel is
11.0.0, so match the rest of the kernel and wrap
-Wunused-but-set-variable in a cc-option call, so that it is only used
when supported by the compiler.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1869
Fixes: a0fd5a5f676c ("drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 7ee68b1bbfed..86b833085f19 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -40,7 +40,7 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
 	-I$(FULL_AMD_PATH)/amdkfd
 
 subdir-ccflags-y := -Wextra
-subdir-ccflags-y += -Wunused-but-set-variable
+subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
 subdir-ccflags-y += -Wno-unused-parameter
 subdir-ccflags-y += -Wno-type-limits
 subdir-ccflags-y += -Wno-sign-compare

---
base-commit: 6bd4b01e8938779b0d959bdf33949a9aa258a363
change-id: 20230608-amdgpu-wrap-wunused-but-set-variable-in-cc-option-0be9528ac5c8

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

