Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94192943A5B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F8F10E72D;
	Thu,  1 Aug 2024 00:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RkuS71ff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147D010E72D;
 Thu,  1 Aug 2024 00:13:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7AD6F61362;
 Thu,  1 Aug 2024 00:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3048C4AF0C;
 Thu,  1 Aug 2024 00:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471226;
 bh=E11NoQtMWvw9g841WtLwQ9Dl6yQseE7DaZT9UW5opmk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RkuS71ffpIswoSEa0OCP9y3YQWw/8HuMtaBimce/QMWs6n2kxC7awKJiQTj9FFF6J
 yd/GLKMcCdUhJJ2mfAnKstGCcQUMlxCBeUlWgzdcjrj3QWf72n0N+g/EZsCq0T52rg
 g2NVgMruD6J1ITCzEnlIPKSqoSbPu6z5uUy4E1Zm+6E6rF5FUeHV0tIyj9mGxHjUTx
 qVYjUdsJ3yIRdhMJ0E0uKjQ/RXKV87mAdJWru9YtoqQCTqbwcMLJbdP5MwaYfHvHmJ
 NdAsopYlVEzjiXHcQ3po0Tqe1MrXoUctXepw8IGnBQ+5LXY7t4vGJXkP06nKMALEhC
 aSVizFQksNthA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, lijo.lazar@amd.com, mario.limonciello@amd.com,
 candice.li@amd.com, Jun.Ma2@amd.com, victorchengchi.lu@amd.com,
 andrealmeid@igalia.com, hamza.mahfooz@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 045/121] drm/amdgpu: fix dereference after null
 check
Date: Wed, 31 Jul 2024 19:59:43 -0400
Message-ID: <20240801000834.3930818-45-sashal@kernel.org>
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

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit b1f7810b05d1950350ac2e06992982974343e441 ]

check the pointer hive before use.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b151effc55dab..0829a264007c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5726,7 +5726,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 * to put adev in the 1st position.
 	 */
 	INIT_LIST_HEAD(&device_list);
-	if (!amdgpu_sriov_vf(adev) && (adev->gmc.xgmi.num_physical_nodes > 1)) {
+	if (!amdgpu_sriov_vf(adev) && (adev->gmc.xgmi.num_physical_nodes > 1) && hive) {
 		list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head) {
 			list_add_tail(&tmp_adev->reset_list, &device_list);
 			if (adev->shutdown)
-- 
2.43.0

