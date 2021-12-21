Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A006E47B744
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 02:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC95310E3C6;
	Tue, 21 Dec 2021 01:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D72F10E3C6;
 Tue, 21 Dec 2021 01:59:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 906D86136A;
 Tue, 21 Dec 2021 01:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FC6C36AEB;
 Tue, 21 Dec 2021 01:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640051978;
 bh=lJMZ7yt2KlQZWAJLNT90cDxLGGtXv8IkwGq7Q0WsFa8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dlKwi7TCsiMybSkDMPp9EPiX7BJRanM8HIm+9wQE7YJaG2LXs6ZcuXhLjxbIXQJZ7
 GDGWfpP0D2RmTJPA3hUwkiNx8qTZ6IIS6QNrHEcRxQRAD8GNfv73+F+MptwuHy3rzk
 UthWD1FF0gifBbxnEUKN+VgvuK2HTovriBOCBnzAKxN8kDM6IEt5TtmAcudn6FnDIF
 RGGt2YN4jPCVeQEoqCnb9xsexH/yjcR8eoZ22MG5RpK7JoGUsJyybS/rRIMXUDMhjc
 IoSi6EUqPtYMhQEzStvVkRE8AHT8i/zTOBFF6fxcj5nTFRyzUMMsb+oJsat8dylQk4
 3cHlfEGiQ5Zsg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/19] drm/amd/display: Reset DMCUB before HW init
Date: Mon, 20 Dec 2021 20:59:08 -0500
Message-Id: <20211221015914.116767-13-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221015914.116767-1-sashal@kernel.org>
References: <20211221015914.116767-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com, sunpeng.li@amd.com,
 qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 Roman.Li@amd.com, amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 airlied@linux.ie, Daniel Wheeler <daniel.wheeler@amd.com>,
 aurabindo.pillai@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, nikola.cornij@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 791255ca9fbe38042cfd55df5deb116dc11fef18 ]

[Why]
If the firmware wasn't reset by PSP or HW and is currently running
then the firmware will hang or perform underfined behavior when we
modify its firmware state underneath it.

[How]
Reset DMCUB before setting up cache windows and performing HW init.

Reviewed-by: Aurabindo Jayamohanan Pillai <Aurabindo.Pillai@amd.com>
Acked-by: Pavle Kotarac <Pavle.Kotarac@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a5b6f36fe1d72..060d31db0c347 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -794,6 +794,11 @@ static int dm_dmub_hw_init(struct amdgpu_device *adev)
 		return 0;
 	}
 
+	/* Reset DMCUB if it was previously running - before we overwrite its memory. */
+	status = dmub_srv_hw_reset(dmub_srv);
+	if (status != DMUB_STATUS_OK)
+		DRM_WARN("Error resetting DMUB HW: %d\n", status);
+
 	hdr = (const struct dmcub_firmware_header_v1_0 *)dmub_fw->data;
 
 	fw_inst_const = dmub_fw->data +
-- 
2.34.1

