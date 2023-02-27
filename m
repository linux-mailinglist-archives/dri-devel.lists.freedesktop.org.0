Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83F6A371C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843C510E306;
	Mon, 27 Feb 2023 02:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793AC10E30E;
 Mon, 27 Feb 2023 02:06:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7F80FCE0F27;
 Mon, 27 Feb 2023 02:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A9FC4339B;
 Mon, 27 Feb 2023 02:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463610;
 bh=NdN166Culp60wILc1C7dFFLT6XE1dlj3cQL/FIUyu84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EAXVUJu1KlBNwTAod3ZfdilUs8mwOw2mgSOix79m8K42QAlteAsg0orT/17yxUbKm
 vHiV7G38SROfpU6reF1iLR/h88fmKZudaofL6vv9QEY7E9JQd6Kh96kqwVzmQ5zMiu
 EJkE/SI23UyH15PKw9B40nQ8YzEjThYts0MR2sNi+j01VmErW68LlFJM8hw+W7SYiY
 5cI9uJQ394NWxFtzgq3oqpwJA7fZUkjUfybRMBR3KUCNQTFqPp2BeHpAmKOIy7DBTb
 iGQT5eui2DLPfwXwonygMOjsTSXXU469nTCpdwJkLsxBVBHwbRZmNdt0jQ6hE5KwAc
 IGmfyxQpjs0dg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 28/58] drm/amd/display: Set hvm_enabled flag for
 S/G mode
Date: Sun, 26 Feb 2023 21:04:26 -0500
Message-Id: <20230227020457.1048737-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Sasha Levin <sashal@kernel.org>,
 stylon.wang@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 hersenxs.wu@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Li <roman.li@amd.com>

[ Upstream commit 40e9f3f067bc6fb47b878f8ba0a9cc7b93abbf49 ]

[Why]
After enabling S/G on dcn314 a screen corruption may be observed.
HostVM flag should be set in S/G mode to be included in DML calculations.

[How]
In S/G mode gpu_vm_support flag is set.
Use its value to init is_hvm_enabled.

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Alan Liu <HaoPing.Liu@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6028e332e35d9..ed74cc7403980 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1248,7 +1248,7 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
 	pa_config->gart_config.page_table_end_addr = page_table_end.quad_part << 12;
 	pa_config->gart_config.page_table_base_addr = page_table_base.quad_part;
 
-	pa_config->is_hvm_enabled = 0;
+	pa_config->is_hvm_enabled = adev->mode_info.gpu_vm_support;
 
 }
 
-- 
2.39.0

