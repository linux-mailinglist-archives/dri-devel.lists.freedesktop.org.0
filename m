Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432EA650072
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA13610E256;
	Sun, 18 Dec 2022 16:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CC310E253;
 Sun, 18 Dec 2022 16:14:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13AE460DCB;
 Sun, 18 Dec 2022 16:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64679C433F0;
 Sun, 18 Dec 2022 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671380035;
 bh=To1zNpXD0KVKRva4FzasldUmR2gCcvIZD+yhSo2fdVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B7ZVhEn/56yleAd5THNPOAfPBv6U9fQa7u5xl0fcpWbRNLepqMO83xmD9fKJ/giap
 iZu0g6Wsb1a1QypVgUKRf92DLONGMLpadKAPX+axFgwyZu4FrN8oXZCjnea60nfSuO
 ziNzjym57IS5DwLpjhAhruETBgVIkSGRvnLtvj0FCOdGl3lWgxdOg/0fu0BH++m1E2
 tiGgrwN0+NCXHnF9NRSEI8pFoS/EgkvNzklwlkm+CmvmigHrYRbDqyN3HvsjDiWhOE
 OOqsSGAvZlJcdf3G6Tsbfo/C9RVPNH2fHi0lVLzR4lz1bQYWiZPLlLaaPOA1jZDOQ0
 b2kj2VE7Cp4XA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 16/46] drm/amdgpu: Fix type of second parameter
 in trans_msg() callback
Date: Sun, 18 Dec 2022 11:12:14 -0500
Message-Id: <20221218161244.930785-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218161244.930785-1-sashal@kernel.org>
References: <20221218161244.930785-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, lijo.lazar@amd.com,
 Kees Cook <keescook@chromium.org>, dri-devel@lists.freedesktop.org,
 horace.chen@amd.com, Xinhui.Pan@amd.com, ndesaulniers@google.com,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Victor.Zhao@amd.com, danijel.slivka@amd.com,
 Sami Tolvanen <samitolvanen@google.com>, PengJu.Zhou@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, victor.skvortsov@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit f0d0f1087333714ee683cc134a95afe331d7ddd9 ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c:412:15: error: incompatible function pointer types initializing 'void (*)(struct amdgpu_device *, u32, u32, u32, u32)' (aka 'void (*)(struct amdgpu_device *, unsigned int, unsigned int, unsigned int, unsigned int)') with an expression of type 'void (struct amdgpu_device *, enum idh_request, u32, u32, u32)' (aka 'void (struct amdgpu_device *, enum idh_request, unsigned int, unsigned int, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
          .trans_msg = xgpu_ai_mailbox_trans_msg,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c:435:15: error: incompatible function pointer types initializing 'void (*)(struct amdgpu_device *, u32, u32, u32, u32)' (aka 'void (*)(struct amdgpu_device *, unsigned int, unsigned int, unsigned int, unsigned int)') with an expression of type 'void (struct amdgpu_device *, enum idh_request, u32, u32, u32)' (aka 'void (struct amdgpu_device *, enum idh_request, unsigned int, unsigned int, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
          .trans_msg = xgpu_nv_mailbox_trans_msg,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

The type of the second parameter in the prototype should be 'enum
idh_request' instead of 'u32'. Update it to clear up the warnings.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index ce31d4fdee93..4af3610f4a82 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -62,6 +62,8 @@ struct amdgpu_vf_error_buffer {
 	uint64_t data[AMDGPU_VF_ERROR_ENTRY_SIZE];
 };
 
+enum idh_request;
+
 /**
  * struct amdgpu_virt_ops - amdgpu device virt operations
  */
@@ -71,7 +73,8 @@ struct amdgpu_virt_ops {
 	int (*req_init_data)(struct amdgpu_device *adev);
 	int (*reset_gpu)(struct amdgpu_device *adev);
 	int (*wait_reset)(struct amdgpu_device *adev);
-	void (*trans_msg)(struct amdgpu_device *adev, u32 req, u32 data1, u32 data2, u32 data3);
+	void (*trans_msg)(struct amdgpu_device *adev, enum idh_request req,
+			  u32 data1, u32 data2, u32 data3);
 };
 
 /*
-- 
2.35.1

