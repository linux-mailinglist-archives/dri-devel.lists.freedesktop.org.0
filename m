Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B447AC8B2
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 15:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009B410E1A6;
	Sun, 24 Sep 2023 13:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CED110E19D;
 Sun, 24 Sep 2023 13:18:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A5CB960C38;
 Sun, 24 Sep 2023 13:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEEDC433C7;
 Sun, 24 Sep 2023 13:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695561517;
 bh=m8A5qV2svXzJAoVYad/DEMOjC6iKCTNtquyMarD5SsI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LsJz6OxNjgZ6Ges+Wq8rr8x2kklbDti+PSyQ+ZrmtYmUoLeEROxefnboCK3aNYy8M
 UhRX/S/5jQe+mExvqhkbY+yxkHwYknksTvW+vyXquSv2pz92N1J2pszpmkusdbYbZp
 5XaL8uCIEhD/3EPch6JqXasi3YIrGl8AbSnz84rc+xL/94UP+FYWn49o099OM60pqp
 Carde3CZkkJt1h+44VNFYO8jaSGENA4KKBP5W1DB5H3QE4kgoTDMroR2/YtV2jqe4F
 RYmaxHdXO/fyrsUFba6kn3xI+mgGoD/eirHkcTUFAdfobuYiddwWmk/HTLJ7gpYEZK
 u7MXBTPPhN8/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 21/28] drm/amdgpu/soc21: don't remap HDP registers
 for SR-IOV
Date: Sun, 24 Sep 2023 09:17:38 -0400
Message-Id: <20230924131745.1275960-21-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131745.1275960-1-sashal@kernel.org>
References: <20230924131745.1275960-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.55
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
Cc: Sasha Levin <sashal@kernel.org>, sunran001@208suo.com, Jane.Jian@amd.com,
 kenneth.feng@amd.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 aaron.liu@amd.com, amd-gfx@lists.freedesktop.org, shane.xiao@amd.com,
 sonny.jiang@amd.com, Timmy Tsai <timmtsai@amd.com>,
 veerabadhran.gopalakrishnan@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 1832403cd41ca6b19b24e9d64f79cb08d920ca44 ]

This matches the behavior for soc15 and nv.

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Timmy Tsai <timmtsai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/soc21.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index d150a90daa403..56af7b5abac14 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -755,7 +755,7 @@ static int soc21_common_hw_init(void *handle)
 	 * for the purpose of expose those registers
 	 * to process space
 	 */
-	if (adev->nbio.funcs->remap_hdp_registers)
+	if (adev->nbio.funcs->remap_hdp_registers && !amdgpu_sriov_vf(adev))
 		adev->nbio.funcs->remap_hdp_registers(adev);
 	/* enable the doorbell aperture */
 	soc21_enable_doorbell_aperture(adev, true);
-- 
2.40.1

