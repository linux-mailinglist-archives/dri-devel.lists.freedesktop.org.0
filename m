Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83A666947
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 04:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6541010E84E;
	Thu, 12 Jan 2023 03:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A064410E84E;
 Thu, 12 Jan 2023 03:05:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFEB861F48;
 Thu, 12 Jan 2023 03:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C101C433AF;
 Thu, 12 Jan 2023 03:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673492743;
 bh=J83wF7k7E0HU61W5ENYtGO7bGrsUpcp8KJIdVMaGB7s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Mb9PnUo8YVEMyxMGibvXcV9p1VYvPFlAE/83Y636eQxZC+SCt5tEuCTIW7OB/9Ony
 477IRakir6QrRIe/6NPfw9tKzYDQ/J2Ps3CUGrOvXLfLTVVr1UDvbEfR9JkY37oEy4
 BsWfUKoIa7s2hDIyt3jnQZhOA6Mo9ruwxMgh6asn/QjJBzfySz+6+nnwFS7s7oju2Y
 XCRF0Uq1i2YB9Sk8e3LhJR3V4niPvP9mIlY1sV6croT7Aptn8eHeq8FAzwoDjejyb7
 mXjUJsj/CRpGat52WYTHfGLUG80AlrluZhnnBMT5w4TvB9Im3ZuOYq1YPoTCn7oLG1
 XErKtEh3qpAsw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Jan 2023 20:05:09 -0700
Subject: [PATCH v2 12/14] drm/amd/display: Do not add '-mhard-float' to
 dml_ccflags for clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-12-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To: masahiroy@kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279; i=nathan@kernel.org;
 h=from:subject:message-id; bh=J83wF7k7E0HU61W5ENYtGO7bGrsUpcp8KJIdVMaGB7s=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K/78jF1rcKBxUaNA1oNO7i/ZDNc+di+83b5J6vDJ1qXm
 B4UzO0pZGMQ4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEVrcyMpxnaur+LrQtxuOEF1/17C
 khDDETv8iem5qx/dREsxsB0W2MDP8dFRkZVp8OWaoVob7Jfb3OrJtK+XPsxYIVubk7n01V4wUA
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, trix@redhat.com,
 llvm@lists.linux.dev, ndesaulniers@google.com, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
warns:

  clang-16: error: argument unused during compilation: '-mhard-float' [-Werror,-Wunused-command-line-argument]

Similar to commit 84edc2eff827 ("selftest/fpu: avoid clang warning"),
just add this flag to GCC builds. Commit 0f0727d971f6 ("drm/amd/display:
readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP
routines") added '-msse2' to prevent clang from emitting software
floating point routines.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 0ecea87cf48f..9d0f79dff2e3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -26,7 +26,8 @@
 # subcomponents.
 
 ifdef CONFIG_X86
-dml_ccflags := -mhard-float -msse
+dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
+dml_ccflags := $(dml_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64

-- 
2.39.0

