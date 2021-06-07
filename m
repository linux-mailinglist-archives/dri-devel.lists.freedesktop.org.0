Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64639E1B4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 18:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8818C6E918;
	Mon,  7 Jun 2021 16:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DF86E913;
 Mon,  7 Jun 2021 16:14:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E66536145A;
 Mon,  7 Jun 2021 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623082443;
 bh=2fIwcSbLPYzttkG0EbSC7eMYdbZEukgqXk7iyFFVBHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aY+3EBUfyrkdOCtDNOofQwlFnkqzvr+nm5dUeI5A1B5ix/I1K8bGXruYvtH3TnMiI
 1/5sERh2WJ5zXJNRf+RICUDhft/GY4SCoYRNJVkDMKflFeJP0C6n32gJSGzR4Fg/w0
 ekkymM6F905B3BgEKY1d5mHD7LgiFrBIJv90q96SUYjDMIk57qsEz2q9edrxs9h6DJ
 gOht7LDXzFzN4FZhgum1+OzSWMIhwPBjJghc/F5JNCAiURchWXwUzUfoaV1ycAtAg2
 U3GqZLzgTsqKftEam4QS+IoPg74Lrq0ROLw7y6FLOQeaAgr6OK8fiL8Q6G3YGwiKjw
 IAYB34j+6nD1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 34/39] drm/amd/display: Fix potential memory leak
 in DMUB hw_init
Date: Mon,  7 Jun 2021 12:13:13 -0400
Message-Id: <20210607161318.3583636-34-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607161318.3583636-1-sashal@kernel.org>
References: <20210607161318.3583636-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Li <roman.li@amd.com>

[ Upstream commit c5699e2d863f58221044efdc3fa712dd32d55cde ]

[Why]
On resume we perform DMUB hw_init which allocates memory:
dm_resume->dm_dmub_hw_init->dc_dmub_srv_create->kzalloc
That results in memory leak in suspend/resume scenarios.

[How]
Allocate memory for the DC wrapper to DMUB only if it was not
allocated before.
No need to reallocate it on suspend/resume.

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4792228ed481..13588c46ae8e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -870,7 +870,8 @@ static int dm_dmub_hw_init(struct amdgpu_device *adev)
 		abm->dmcu_is_running = dmcu->funcs->is_dmcu_initialized(dmcu);
 	}
 
-	adev->dm.dc->ctx->dmub_srv = dc_dmub_srv_create(adev->dm.dc, dmub_srv);
+	if (!adev->dm.dc->ctx->dmub_srv)
+		adev->dm.dc->ctx->dmub_srv = dc_dmub_srv_create(adev->dm.dc, dmub_srv);
 	if (!adev->dm.dc->ctx->dmub_srv) {
 		DRM_ERROR("Couldn't allocate DC DMUB server!\n");
 		return -ENOMEM;
@@ -1755,7 +1756,6 @@ static int dm_suspend(void *handle)
 
 	amdgpu_dm_irq_suspend(adev);
 
-
 	dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D3);
 
 	return 0;
-- 
2.30.2

