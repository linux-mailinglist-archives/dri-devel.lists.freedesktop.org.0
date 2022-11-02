Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D126661660C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 16:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFB110E4B7;
	Wed,  2 Nov 2022 15:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C5710E4B2;
 Wed,  2 Nov 2022 15:25:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2150F61920;
 Wed,  2 Nov 2022 15:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4FAC433B5;
 Wed,  2 Nov 2022 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667402757;
 bh=hGx+6YDUsiGnguDXLfFqKT39GRFMP/Uu3APqDdfj8VI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lZqy94Pqj8EW3jOLG3l7Bn5qWcflGeeQrQ2aXEPTTLim/2BOfS84/XDX9hZ1CA5MF
 07J5fQoAf+GOtybBC0b7RRqNwEGASwUUsX9zN89OaS3S8Mq/QHVCAhVcyxoeNL+jV8
 ZXhn+p49r1Sp/gTlBogoGPdabtwT+XPsZdevJsh1QbiGgQSXRQQr0lPu8IA1sijYlm
 4UAXUZlyNRyvgBxm+xrASJGTAvejkT9j4qn9ujsoVP/Z8nPSqG+R7aYQhDKbHJuWlU
 h3NOW80DaL+c/FOS47MxZJ+YOAJdo6Xnerom5o85kIdyH0JsaWVMGg211ndQfpn+DN
 4Ul89CjYwfcnw==
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Fix type of second parameter in
 odn_edit_dpm_table() callback
Date: Wed,  2 Nov 2022 08:25:40 -0700
Message-Id: <20221102152540.2389891-2-nathan@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102152540.2389891-1-nathan@kernel.org>
References: <20221102152540.2389891-1-nathan@kernel.org>
MIME-Version: 1.0
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
Cc: Kees Cook <keescook@chromium.org>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 amd-gfx@lists.freedesktop.org, Sami Tolvanen <samitolvanen@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:3008:29: error: incompatible function pointer types initializing 'int (*)(void *, uint32_t, long *, uint32_t)' (aka 'int (*)(void *, unsigned int, long *, unsigned int)') with an expression of type 'int (void *, enum PP_OD_DPM_TABLE_COMMAND, long *, uint32_t)' (aka 'int (void *, enum PP_OD_DPM_TABLE_COMMAND, long *, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
          .odn_edit_dpm_table      = smu_od_edit_dpm_table,
                                     ^~~~~~~~~~~~~~~~~~~~~
  1 error generated.

There are only two implementations of ->odn_edit_dpm_table() in 'struct
amd_pm_funcs': smu_od_edit_dpm_table() and pp_odn_edit_dpm_table(). One
has a second parameter type of 'enum PP_OD_DPM_TABLE_COMMAND' and the
other uses 'u32'. Ultimately, smu_od_edit_dpm_table() calls
->od_edit_dpm_table() from 'struct pptable_funcs' and
pp_odn_edit_dpm_table() calls ->odn_edit_dpm_table() from 'struct
pp_hwmgr_func', which both have a second parameter type of 'enum
PP_OD_DPM_TABLE_COMMAND'.

Update the type parameter in both the prototype in 'struct amd_pm_funcs'
and pp_odn_edit_dpm_table() to 'enum PP_OD_DPM_TABLE_COMMAND', which
cleans up the warning.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/include/kgd_pp_interface.h   | 3 ++-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
index a40ead44778a..d18162e9ed1d 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -354,7 +354,8 @@ struct amd_pm_funcs {
 	int (*get_power_profile_mode)(void *handle, char *buf);
 	int (*set_power_profile_mode)(void *handle, long *input, uint32_t size);
 	int (*set_fine_grain_clk_vol)(void *handle, uint32_t type, long *input, uint32_t size);
-	int (*odn_edit_dpm_table)(void *handle, uint32_t type, long *input, uint32_t size);
+	int (*odn_edit_dpm_table)(void *handle, enum PP_OD_DPM_TABLE_COMMAND type,
+				  long *input, uint32_t size);
 	int (*set_mp1_state)(void *handle, enum pp_mp1_state mp1_state);
 	int (*smu_i2c_bus_access)(void *handle, bool acquire);
 	int (*gfx_state_change_set)(void *handle, uint32_t state);
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index ec055858eb95..1159ae114dd0 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -838,7 +838,8 @@ static int pp_set_fine_grain_clk_vol(void *handle, uint32_t type, long *input, u
 	return hwmgr->hwmgr_func->set_fine_grain_clk_vol(hwmgr, type, input, size);
 }
 
-static int pp_odn_edit_dpm_table(void *handle, uint32_t type, long *input, uint32_t size)
+static int pp_odn_edit_dpm_table(void *handle, enum PP_OD_DPM_TABLE_COMMAND type,
+				 long *input, uint32_t size)
 {
 	struct pp_hwmgr *hwmgr = handle;
 
-- 
2.38.1

