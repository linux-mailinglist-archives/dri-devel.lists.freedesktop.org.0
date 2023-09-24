Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B35C7AC880
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 15:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A680F10E140;
	Sun, 24 Sep 2023 13:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC1210E10F;
 Sun, 24 Sep 2023 13:17:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 382A9B80909;
 Sun, 24 Sep 2023 13:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64386C433C8;
 Sun, 24 Sep 2023 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695561434;
 bh=vuLQUyedGq0x4DONjqzds8NBXv337ROtROrvDAx3/00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ky9W8XDsRcTESn7+oC0UPO87QWi6mV2nESEBfQcGVSQMzWZoYZEfdU6XmGH+Djmz/
 ez3Y2XpQtOX2Nng0tpB+4+5kl1Nj6ySvleWuCT3jf0A7FPzPhqcM/AgU3YOODERY/q
 AxKoKmFCp/IGDccqZU4lGLWECxhQ6131ZqkUt7NpdmBAqEpxTHo6Q3VmdAAHAClqV+
 xE01auskTFOiyEheunFyARMzGNMcxRIwM0KcRekK9h76fk16Rk1X0y/F3vFgqKToCN
 n+zzqn5cRt53W8qp7oQvfor4khrc6aJkeSc+L+9IH4PCooMj7Bh+FmGAL3GRdwPqKB
 ofswwaeH8Nizg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 29/41] drm/amdgpu/soc21: don't remap HDP registers
 for SR-IOV
Date: Sun, 24 Sep 2023 09:15:17 -0400
Message-Id: <20230924131529.1275335-29-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131529.1275335-1-sashal@kernel.org>
References: <20230924131529.1275335-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.5
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
Cc: Sasha Levin <sashal@kernel.org>, yifan1.zhang@amd.com, sunran001@208suo.com,
 Jane.Jian@amd.com, kenneth.feng@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, shane.xiao@amd.com, amd-gfx@lists.freedesktop.org,
 Timmy Tsai <timmtsai@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 saleemkhan.jamadar@amd.com, Hawking.Zhang@amd.com
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
index e5e5d68a4d702..1a5ffbf884891 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -786,7 +786,7 @@ static int soc21_common_hw_init(void *handle)
 	 * for the purpose of expose those registers
 	 * to process space
 	 */
-	if (adev->nbio.funcs->remap_hdp_registers)
+	if (adev->nbio.funcs->remap_hdp_registers && !amdgpu_sriov_vf(adev))
 		adev->nbio.funcs->remap_hdp_registers(adev);
 	/* enable the doorbell aperture */
 	adev->nbio.funcs->enable_doorbell_aperture(adev, true);
-- 
2.40.1

