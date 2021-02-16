Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B5131D213
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 22:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802CD6E993;
	Tue, 16 Feb 2021 21:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705876E993;
 Tue, 16 Feb 2021 21:30:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F211264D99;
 Tue, 16 Feb 2021 21:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613511031;
 bh=uwBWkNHGck9kFBqA0+H8/eT9Jc5XAGfEFx3Kba3gL4k=;
 h=From:To:Cc:Subject:Date:From;
 b=Ru/chHN9ndSQZRU6kcPNpf0W0XEdZm3ESkkB7+Rme8xma3/EdjnB48g/YGdMRuH26
 j41sevdpq56S6D1FcUiqUe587rJeGLNYIRpBkq4hqxMWjaE9Nl1B+l8gqbJf5Dbv0Y
 X5Cf2Gi7bJ+i1AgZ8b3eEwH9ubV/XjpHQMoCQLmsGilr1moNIaV1RqMOQ9aL356hxi
 0pjTYRxkZjXDSEi9ko3Lp3vor5250L1ucr7rx9ykXonMGZ3PI+0x62A99qUdTQ2rmA
 ypMWNh9Rtv/fIIaqI0hdt3a5ykleMBdQDvnHOFA1H0amz8tCtnF0fJldfMnmomP8oI
 qIzSMOFmaTXVw==
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: Enable -Wuninitialized
Date: Tue, 16 Feb 2021 14:29:54 -0700
Message-Id: <20210216212953.24458-1-nathan@kernel.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

-Wunintialized was disabled in commit c5627461490e ("drm/i915: Disable
-Wuninitialized") because there were two warnings that were false
positives. The first was due to DECLARE_WAIT_QUEUE_HEAD_ONSTACK, which
was fixed in LLVM 9.0.0. The second was in busywait_stop, which was
fixed in LLVM 10.0.0 (issue 415). The kernel's minimum version for LLVM
is 10.0.1 so this warning can be safely enabled, where it has already
caught a couple bugs.

Link: https://github.com/ClangBuiltLinux/linux/issues/220
Link: https://github.com/ClangBuiltLinux/linux/issues/415
Link: https://github.com/ClangBuiltLinux/linux/issues/499
Link: https://github.com/llvm/llvm-project/commit/2e040398f8d691cc378c1abb098824ff49f3f28f
Link: https://github.com/llvm/llvm-project/commit/c667cdc850c2aa821ffeedbc08c24bc985c59edd
Fixes: c5627461490e ("drm/i915: Disable -Wuninitialized")
References: 2ea4a7ba9bf6 ("drm/i915/gt: Avoid uninitialized use of rpcurupei in frequency_show")
References: 2034c2129bc4 ("drm/i915/display: Ensure that ret is always initialized in icl_combo_phy_verify_state")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/i915/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 6d9e81ea67f4..60b60204004f 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -21,7 +21,6 @@ subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
 subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
 subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
-subdir-ccflags-y += $(call cc-disable-warning, uninitialized)
 subdir-ccflags-y += $(call cc-disable-warning, frame-address)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 

base-commit: f40ddce88593482919761f74910f42f4b84c004b
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
