Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E31650092
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2F110E263;
	Sun, 18 Dec 2022 16:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC4D10E263;
 Sun, 18 Dec 2022 16:17:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 812B3B80BA8;
 Sun, 18 Dec 2022 16:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9332C433EF;
 Sun, 18 Dec 2022 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671380228;
 bh=3JIyISy8p5hbvOydf/XGcy0KPSvDf1VcjeoXMziTT7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o0hQSInx6thvKkP1sbPcxwtrGlMklqq3qBoGYeQQqdFSfBmeF/cjvYbDP/YKpwHse
 LIHuLr99zCbeQdtuH9f5BDRijlhXug5Lrrs51G291tT1PTGX+5dJ1AMfhc16q40PsN
 JB5f0mjo7YLI3Z10BvRFZ5+nCF10k75zA7AkoTu5u/qTRtonQigHvVIW43dO3zvEsA
 zyJK+f7RnKbOoLGal0Ea/PcTXF5XT/Fk0hJoxkgmxzVxFmORv17YSnp50zRxSNxffq
 a/ouQIgIXjMPhbK8cO3iSRqwVK/vJx99mlxgTWys4GI85QPHBE8kjvOBZ5/D/a7DLY
 RbzdUNb0xZ5yw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/39] drm/amdgpu: Fix type of second parameter
 in odn_edit_dpm_table() callback
Date: Sun, 18 Dec 2022 11:15:35 -0500
Message-Id: <20221218161559.932604-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218161559.932604-1-sashal@kernel.org>
References: <20221218161559.932604-1-sashal@kernel.org>
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
 Kees Cook <keescook@chromium.org>, kevinyang.wang@amd.com, guchun.chen@amd.com,
 kenneth.feng@amd.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 ndesaulniers@google.com, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, li.ma@amd.com,
 Sami Tolvanen <samitolvanen@google.com>, darren.powell@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com, floridsleeves@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit e4d0ef752081e7aa6ffb7ccac11c499c732a2e05 ]

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
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/include/kgd_pp_interface.h   | 3 ++-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
index 94132c70d7af..5e8876ad1a1b 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -282,7 +282,8 @@ struct amd_pm_funcs {
 	int (*get_power_profile_mode)(void *handle, char *buf);
 	int (*set_power_profile_mode)(void *handle, long *input, uint32_t size);
 	int (*set_fine_grain_clk_vol)(void *handle, uint32_t type, long *input, uint32_t size);
-	int (*odn_edit_dpm_table)(void *handle, uint32_t type, long *input, uint32_t size);
+	int (*odn_edit_dpm_table)(void *handle, enum PP_OD_DPM_TABLE_COMMAND type,
+				  long *input, uint32_t size);
 	int (*set_mp1_state)(void *handle, enum pp_mp1_state mp1_state);
 	int (*smu_i2c_bus_access)(void *handle, bool acquire);
 /* export to DC */
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index eab9768029c1..a98ea29b2fd5 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -924,7 +924,8 @@ static int pp_set_fine_grain_clk_vol(void *handle, uint32_t type, long *input, u
 	return hwmgr->hwmgr_func->set_fine_grain_clk_vol(hwmgr, type, input, size);
 }
 
-static int pp_odn_edit_dpm_table(void *handle, uint32_t type, long *input, uint32_t size)
+static int pp_odn_edit_dpm_table(void *handle, enum PP_OD_DPM_TABLE_COMMAND type,
+				 long *input, uint32_t size)
 {
 	struct pp_hwmgr *hwmgr = handle;
 
-- 
2.35.1

