Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88819AAA0C3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFED210E500;
	Mon,  5 May 2025 22:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oAsILGlv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C2A10E503;
 Mon,  5 May 2025 22:38:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0A423A4CF98;
 Mon,  5 May 2025 22:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4BCC4CEEF;
 Mon,  5 May 2025 22:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484721;
 bh=cEw4GRPiyRF77vhM1EytheB+h9yphkcLAo3dRL84tfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oAsILGlvddD7HPbZiae2mzcOPukdjFg2b0pb1NmSPmEt0K0ybD8GTZjffO+FVvhQj
 5ctmWAKWCZv5j8ro6brpd/xqheseCTWsD+suKcmvHlvDLUMakZZGxU1bOJpU6YjwkM
 nm6OLGgKp1nfGB9/TMfAEmeClF0RAuMrgO5JvEqzYsMJzzGX6iruA5ZBnp0oX66rhy
 HbjUijeqFfjhOuUhNf6it201udsqTlfsMY6+d5LHfHxGH3aZ+SEHAiuFFfsXoZLl8h
 Q/aTVga+mIaPpySP1rTcq1GJ5gTsV54aP3A/H0LBUs5CdBzK8rYC42w/uMiiWHuohe
 +Q0Q8/T/hfpkw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Amber Lin <Amber.Lin@amd.com>,
 Harish Kasiviswanathan <Harish.Kasiviwanathan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Harish.Kasiviswanathan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 627/642] drm/amdkfd: Correct F8_MODE for gfx950
Date: Mon,  5 May 2025 18:14:03 -0400
Message-Id: <20250505221419.2672473-627-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Amber Lin <Amber.Lin@amd.com>

[ Upstream commit 0c7e053448945e5a4379dc4396c762d7422b11ca ]

Correct F8_MODE setting for gfx950 that was removed

Fixes: 61972cd93af7 ("drm/amdkfd: Set per-process flags only once for gfx9/10/11/12")
Signed-off-by: Amber Lin <Amber.Lin@amd.com>
Reviewed-by: Harish Kasiviswanathan <Harish.Kasiviwanathan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
index 3264509408bc8..d85eadaa1e11b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
@@ -69,8 +69,7 @@ static bool set_cache_memory_policy_v9(struct device_queue_manager *dqm,
 		qpd->sh_mem_config |= 1 << SH_MEM_CONFIG__RETRY_DISABLE__SHIFT;
 
 	if (KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 4, 3) ||
-		KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 4, 4) ||
-		KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 5, 0))
+		KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 4, 4))
 		qpd->sh_mem_config |= (1 << SH_MEM_CONFIG__F8_MODE__SHIFT);
 
 	qpd->sh_mem_ape1_limit = 0;
-- 
2.39.5

