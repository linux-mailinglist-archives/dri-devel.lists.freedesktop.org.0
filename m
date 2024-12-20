Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B19809F977C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 18:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA5610E2CF;
	Fri, 20 Dec 2024 17:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k95uDSul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9053610E123;
 Fri, 20 Dec 2024 17:11:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1DA3DA420BD;
 Fri, 20 Dec 2024 17:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53177C4CECD;
 Fri, 20 Dec 2024 17:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734714702;
 bh=PLM039DLz37oDRMNqlZelRLhS5jnRg0yYCkicMyTONI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k95uDSulMiWzUHXTgUU99oF6jw17RnDNj0ZToaqjtUgyHmAGIJ9kgwfelY1o0VJci
 rE0JmMygrtiPxkFO9EJBbBHxFWZ+muY2juPAk0K6aGjrnKXy++sQris1Jj2eCkT/kk
 KaA062L7bT8XbSQAyhndHj0GnnxEHynlzuPBZMK7NOD2/4h+e+n+1731Cdv8lqkHlz
 0XsqrkAzL0dkKL13JbetrFON5DvrZq7QljTKeYPLV8rqIOVfV7V6Qqkp3MLIcO6Di1
 5QpAIL7vj1LeWJl+S37/hcu6Js7cBA7HqPQ3qzHm/5JjRP6GBdlxp+cwYCh6nw2jb7
 1ooh7sjGw6oCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Victor Zhao <Victor.Zhao@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, lijo.lazar@amd.com,
 Hawking.Zhang@amd.com, srinivasan.shanmugam@amd.com, Prike.Liang@amd.com,
 Jiadong.Zhu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 05/29] drm/amdgpu: use sjt mec fw on gfx943 for
 sriov
Date: Fri, 20 Dec 2024 12:11:06 -0500
Message-Id: <20241220171130.511389-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220171130.511389-1-sashal@kernel.org>
References: <20241220171130.511389-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.6
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

From: Victor Zhao <Victor.Zhao@amd.com>

[ Upstream commit 9a4ab400f1fad0e6e8686b8f5fc5376383860ce8 ]

Use second jump table in sriov for live migration or mulitple VF
support so different VF can load different version of MEC as long
as they support sjt

Signed-off-by: Victor Zhao <Victor.Zhao@amd.com>
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index c100845409f7..ffdb966c4127 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -45,6 +45,8 @@ MODULE_FIRMWARE("amdgpu/gc_9_4_3_mec.bin");
 MODULE_FIRMWARE("amdgpu/gc_9_4_4_mec.bin");
 MODULE_FIRMWARE("amdgpu/gc_9_4_3_rlc.bin");
 MODULE_FIRMWARE("amdgpu/gc_9_4_4_rlc.bin");
+MODULE_FIRMWARE("amdgpu/gc_9_4_3_sjt_mec.bin");
+MODULE_FIRMWARE("amdgpu/gc_9_4_4_sjt_mec.bin");
 
 #define GFX9_MEC_HPD_SIZE 4096
 #define RLCG_UCODE_LOADING_START_ADDRESS 0x00002000L
@@ -574,8 +576,12 @@ static int gfx_v9_4_3_init_cp_compute_microcode(struct amdgpu_device *adev,
 {
 	int err;
 
-	err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw,
-				   "amdgpu/%s_mec.bin", chip_name);
+	if (amdgpu_sriov_vf(adev))
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw,
+				"amdgpu/%s_sjt_mec.bin", chip_name);
+	else
+		err = amdgpu_ucode_request(adev, &adev->gfx.mec_fw,
+				"amdgpu/%s_mec.bin", chip_name);
 	if (err)
 		goto out;
 	amdgpu_gfx_cp_init_microcode(adev, AMDGPU_UCODE_ID_CP_MEC1);
-- 
2.39.5

