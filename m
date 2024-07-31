Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F649439FD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6226110E6E5;
	Thu,  1 Aug 2024 00:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IJWMJZgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA93110E6E4;
 Thu,  1 Aug 2024 00:09:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 83AB0CE11E4;
 Thu,  1 Aug 2024 00:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F645C116B1;
 Thu,  1 Aug 2024 00:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722470953;
 bh=XwiusGyHFFWVp25IovLAQaq2emO6knPkUhXJV+qlmy0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IJWMJZgQhSQbrOcjFmgdjGDqvBGxxedoHyOLrDW5y+5qSEOtdIuju1fT7N8j8OpzH
 baLWFe7rAgodUVQzqzJXRbeDBPj5SFktQjvCuIl2784EQG27JbLYuNApGjcES1WmAy
 4xgBdldHIp/laaO22VbfeAOMFulAU0ZBafCbH6H7hgEelL55mDNz1N2NizXHG6TMzO
 rP9zNpyNNTXMDNbZzQkJLb+LyjqN8YSyrmSGCHTlAB1j+jgB4ZP+8IyaYAOalsZIS2
 bfFRcymo3n8eTLcpPZRZ/jXDf//OSuL4Wr+Zj3kJbiJJrfIHdWasGacsrio1wqolMY
 mscCgKvff5nLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tim Huang <Tim.Huang@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, lijo.lazar@amd.com, Zhigang.Luo@amd.com,
 Hawking.Zhang@amd.com, victorchengchi.lu@amd.com, victor.skvortsov@amd.com,
 Yunxiang.Li@amd.com, Vignesh.Chander@amd.com, surbhi.kakarya@amd.com,
 danijel.slivka@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 008/121] drm/amdgpu: fix uninitialized scalar
 variable warning
Date: Wed, 31 Jul 2024 19:59:06 -0400
Message-ID: <20240801000834.3930818-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tim Huang <Tim.Huang@amd.com>

[ Upstream commit 0fa4c25db8b791f79bc0d5a0cd58aff9ad85186b ]

Clear warning that field bp is uninitialized when
calling amdgpu_virt_ras_add_bps.

Signed-off-by: Tim Huang <Tim.Huang@amd.com>
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 54ab51a4ada77..b5fc0e1ad4357 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -395,6 +395,8 @@ static void amdgpu_virt_add_bad_page(struct amdgpu_device *adev,
 	else
 		vram_usage_va = adev->mman.drv_vram_usage_va;
 
+	memset(&bp, 0, sizeof(bp));
+
 	if (bp_block_size) {
 		bp_cnt = bp_block_size / sizeof(uint64_t);
 		for (bp_idx = 0; bp_idx < bp_cnt; bp_idx++) {
-- 
2.43.0

