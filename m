Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5461D943A59
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30CC10E72C;
	Thu,  1 Aug 2024 00:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jsfcIpFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0510E72B;
 Thu,  1 Aug 2024 00:13:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B3D3B61377;
 Thu,  1 Aug 2024 00:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF01C4AF0C;
 Thu,  1 Aug 2024 00:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471220;
 bh=s0cShORdRMOA69u4SPXLtsQO7L++wk/ue0mxtTkLzsc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jsfcIpFZsK05SsK4AoFqJBldyo8H6s+1SncTZWa4QnWDAf5yllHRr7Aid9d3NT8AX
 /prdI6x8CIC6dRiU3MzgXvP8lJ7aS4g/52XmKLMUte6CjUV4/0MNLISW9MbHfUUNe5
 ZDRWYI5WmXKnwpIuSsbebMetwGxqpjphAnIqAlm8MG/L2Z95C8c5BeH95zWqpP4kDo
 7+FvKY5uXcqCepUqDdch/ucWJhsjGu2Hh/RZaPGuSbCuENB+nYPajMvkXY3sqLjIJk
 FCaIESxdNkHe8UzamUjduu+QFWmQJPmn2c5IWg2g81m9kJdPur6T6KA1ClF+4tIiKv
 /MQ5dIwQea/rg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, asad.kamal@amd.com, rajneesh.bhardwaj@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 044/121] drm/amdgpu: Fix the warning division or
 modulo by zero
Date: Wed, 31 Jul 2024 19:59:42 -0400
Message-ID: <20240801000834.3930818-44-sashal@kernel.org>
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

[ Upstream commit 1a00f2ac82d6bc6689388c7edcd2a4bd82664f3c ]

Checks the partition mode and returns an error for an invalid mode.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
index d4e2aed2efa33..2c9a0aa41e2d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
+++ b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
@@ -501,6 +501,12 @@ static int aqua_vanjaram_switch_partition_mode(struct amdgpu_xcp_mgr *xcp_mgr,
 
 	if (mode == AMDGPU_AUTO_COMPUTE_PARTITION_MODE) {
 		mode = __aqua_vanjaram_get_auto_mode(xcp_mgr);
+		if (mode == AMDGPU_UNKNOWN_COMPUTE_PARTITION_MODE) {
+			dev_err(adev->dev,
+				"Invalid config, no compatible compute partition mode found, available memory partitions: %d",
+				adev->gmc.num_mem_partitions);
+			return -EINVAL;
+		}
 	} else if (!__aqua_vanjaram_is_valid_mode(xcp_mgr, mode)) {
 		dev_err(adev->dev,
 			"Invalid compute partition mode requested, requested: %s, available memory partitions: %d",
-- 
2.43.0

