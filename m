Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE024916F8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83B81128F4;
	Tue, 18 Jan 2022 02:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324901128F5;
 Tue, 18 Jan 2022 02:37:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A7D1B811CF;
 Tue, 18 Jan 2022 02:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352E7C36AE3;
 Tue, 18 Jan 2022 02:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473443;
 bh=vtWjHQg35ZYsG3cvoxDYlP7bz7YRDF4DFA/Z3UcxwWw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=InFRHjm59dc2eNa7HdL0UYgetFBd7Prk39lzU3HDeSCHdcxTR7onVA06309ReXa/G
 ngHXNXQGeSuijfw8WKGjBV5omGYEgKuguxxENvcwmUkBaxGzuX+pWWoQyziWTSSs3+
 HIpYWo5uGIjoskgPloKtwW6IXuzpOBiVWZiJwSesb3lxdpLwYWhmWihdwF9XLJ1DlW
 pO1cJQTaqvwbJFKrjmlm1U1MRJm8fjF9bdef/bHjPVUDNXu8Cefcj4ZXw3EkJyxoHI
 dmUEevkFvh/qUU6JDyBxQGnFjNeCJprr9TeUVlxFY33xPkO1b+bvDuQtsARI7WhLAQ
 f8XuS+nWsgujw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 119/188] drm/amd/amdgpu: fix psp tmr bo pin count
 leak in SRIOV
Date: Mon, 17 Jan 2022 21:30:43 -0500
Message-Id: <20220118023152.1948105-119-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, lijo.lazar@amd.com, Oak.Zeng@amd.com,
 airlied@linux.ie, lang.yu@amd.com, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 jonathan.kim@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, candice.li@amd.com,
 john.clements@amd.com, Horace Chen <horace.chen@amd.com>,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jingwen Chen <Jingwen.Chen2@amd.com>

[ Upstream commit 85dfc1d692c9434c37842e610be37cd4ae4e0081 ]

[Why]
psp tmr bo will be pinned during loading amdgpu and reset in SRIOV while
only unpinned in unload amdgpu

[How]
add amdgpu_in_reset and sriov judgement to skip pin bo

v2: fix wrong judgement

Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
Reviewed-by: Horace Chen <horace.chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 9b41cb8c3de54..86e2090bbd6e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2207,12 +2207,16 @@ static int psp_hw_start(struct psp_context *psp)
 		return ret;
 	}
 
+	if (amdgpu_sriov_vf(adev) && amdgpu_in_reset(adev))
+		goto skip_pin_bo;
+
 	ret = psp_tmr_init(psp);
 	if (ret) {
 		DRM_ERROR("PSP tmr init failed!\n");
 		return ret;
 	}
 
+skip_pin_bo:
 	/*
 	 * For ASICs with DF Cstate management centralized
 	 * to PMFW, TMR setup should be performed after PMFW
-- 
2.34.1

