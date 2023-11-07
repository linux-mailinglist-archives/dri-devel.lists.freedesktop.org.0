Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C0D7E3CD9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9AD10E546;
	Tue,  7 Nov 2023 12:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C687210E535;
 Tue,  7 Nov 2023 12:20:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 87B64B8169E;
 Tue,  7 Nov 2023 12:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE56C43391;
 Tue,  7 Nov 2023 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359646;
 bh=KUe+SD5Yyq27YTHMeOYW5lPKYrt2mIbOlaatWzmFmi4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OmALWaGgNSY/IAVJqfNuoPVvMobTsx0JezeqFdEgx9w+9YY57Pw2wBRiKv4ufkZ6U
 RaUI9YsfmsYDO8OEcXqpEJaLTyACrvl7LlUoNQW5emc4/Enq+FfB0bMCjFJeAsOwdY
 xrzdD1spqBj/g2ltpe57gJ1NDbPfu1fOaQ3C6ttUTHBsi7etl/p0t6xkNdX9+798KU
 a1ag+uJTMu9l5hGQ5eaaQihLoU4ax3Kmdw4rlCTiVDTB754z/ge0xagcIBriXs27H6
 olPPDj8PYub/5Z3mtTH0AKVHzOw/7NG49SiIj6TiJQsmRKW6SSPuEWFpF5WLLVbbKS
 V712/An5veSbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 29/40] drm/amdkfd: Fix shift out-of-bounds issue
Date: Tue,  7 Nov 2023 07:16:31 -0500
Message-ID: <20231107121837.3759358-29-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107121837.3759358-1-sashal@kernel.org>
References: <20231107121837.3759358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit 282c1d793076c2edac6c3db51b7e8ed2b41d60a5 ]

[  567.613292] shift exponent 255 is too large for 64-bit type 'long unsigned int'
[  567.614498] CPU: 5 PID: 238 Comm: kworker/5:1 Tainted: G           OE      6.2.0-34-generic #34~22.04.1-Ubuntu
[  567.614502] Hardware name: AMD Splinter/Splinter-RPL, BIOS WS43927N_871 09/25/2023
[  567.614504] Workqueue: events send_exception_work_handler [amdgpu]
[  567.614748] Call Trace:
[  567.614750]  <TASK>
[  567.614753]  dump_stack_lvl+0x48/0x70
[  567.614761]  dump_stack+0x10/0x20
[  567.614763]  __ubsan_handle_shift_out_of_bounds+0x156/0x310
[  567.614769]  ? srso_alias_return_thunk+0x5/0x7f
[  567.614773]  ? update_sd_lb_stats.constprop.0+0xf2/0x3c0
[  567.614780]  svm_range_split_by_granularity.cold+0x2b/0x34 [amdgpu]
[  567.615047]  ? srso_alias_return_thunk+0x5/0x7f
[  567.615052]  svm_migrate_to_ram+0x185/0x4d0 [amdgpu]
[  567.615286]  do_swap_page+0x7b6/0xa30
[  567.615291]  ? srso_alias_return_thunk+0x5/0x7f
[  567.615294]  ? __free_pages+0x119/0x130
[  567.615299]  handle_pte_fault+0x227/0x280
[  567.615303]  __handle_mm_fault+0x3c0/0x720
[  567.615311]  handle_mm_fault+0x119/0x330
[  567.615314]  ? lock_mm_and_find_vma+0x44/0x250
[  567.615318]  do_user_addr_fault+0x1a9/0x640
[  567.615323]  exc_page_fault+0x81/0x1b0
[  567.615328]  asm_exc_page_fault+0x27/0x30
[  567.615332] RIP: 0010:__get_user_8+0x1c/0x30

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Suggested-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Yifan Zhang <yifan1.zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 175090be3760c..84fbf1118d426 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -767,7 +767,7 @@ svm_range_apply_attrs(struct kfd_process *p, struct svm_range *prange,
 			prange->flags &= ~attrs[i].value;
 			break;
 		case KFD_IOCTL_SVM_ATTR_GRANULARITY:
-			prange->granularity = attrs[i].value;
+			prange->granularity = min_t(uint32_t, attrs[i].value, 0x3F);
 			break;
 		default:
 			WARN_ONCE(1, "svm_range_check_attrs wasn't called?");
-- 
2.42.0

