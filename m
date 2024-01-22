Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9B83666C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4695810F244;
	Mon, 22 Jan 2024 15:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DFA10F2CC;
 Mon, 22 Jan 2024 15:01:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3E185B80E6C;
 Mon, 22 Jan 2024 15:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A31C433A6;
 Mon, 22 Jan 2024 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935710;
 bh=ZsYhDRSMrBrkpdbxY5l+VFbJSu4rGbvydsbzY2yWMBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dasyUWBShZhR7APwOFg8w8yqjG9yLSohFK/DEKbt5owa+ZbXkkZPuelAY5YNHJ1ts
 4Bf98sQUdoPr/r3OzcBwcveNAFPVcPvYEvm2eOsy7g8F3RSkCMYwl1XpDLP3X767jZ
 wsaUkmfFKdzpGgZ88+bYdkLpoYwei/mLQQCNgkHGkaWCv38O3yxHHVlE9lnPM/qTaP
 zlHrCfmYD0aNRe+ew9SvKMaLBkAJvys3HtxEUdyQQE+zG2oniBecJ+CpaWju1KmVTx
 oeWNM3U12ZmJErYqukUTKSTUMwxAA/PxmgimrUl0/qHh+cvOtp0J6ryB6a2GevZkUl
 uBq+LM0/eFoAg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 78/88] drm/amdgpu: Fix possible NULL dereference
 in amdgpu_ras_query_error_status_helper()
Date: Mon, 22 Jan 2024 09:51:51 -0500
Message-ID: <20240122145608.990137-78-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, kevinyang.wang@amd.com,
 dri-devel@lists.freedesktop.org, Tao Zhou <tao.zhou1@amd.com>,
 asad.kamal@amd.com, lijo.lazar@amd.com, YiPeng.Chai@amd.com,
 Stanley.Yang@amd.com, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit b8d55a90fd55b767c25687747e2b24abd1ef8680 ]

Return invalid error code -EINVAL for invalid block id.

Fixes the below:

drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1183 amdgpu_ras_query_error_status_helper() error: we previously assumed 'info' could be null (see line 1176)

Suggested-by: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Tao Zhou <tao.zhou1@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 63fb4cd85e53..4a3726bb6da1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1174,6 +1174,9 @@ static int amdgpu_ras_query_error_status_helper(struct amdgpu_device *adev,
 	enum amdgpu_ras_block blk = info ? info->head.block : AMDGPU_RAS_BLOCK_COUNT;
 	struct amdgpu_ras_block_object *block_obj = NULL;
 
+	if (blk == AMDGPU_RAS_BLOCK_COUNT)
+		return -EINVAL;
+
 	if (error_query_mode == AMDGPU_RAS_INVALID_ERROR_QUERY)
 		return -EINVAL;
 
-- 
2.43.0

