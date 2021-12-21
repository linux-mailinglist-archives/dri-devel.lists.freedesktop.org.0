Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F413147B727
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 02:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C71910E18C;
	Tue, 21 Dec 2021 01:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7CD10E143;
 Tue, 21 Dec 2021 01:58:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E882D61365;
 Tue, 21 Dec 2021 01:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35000C36AE5;
 Tue, 21 Dec 2021 01:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640051907;
 bh=lmeOJdPosyey6PSuVWhPHJ2SNeBDl1TEYMap3cbRQJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q8B36IiKrh8KVcgc+AR2Ph8vCvtQgLcFsCx3ozibhxsyGgnekKpAPp0sz62srvEU6
 OUtP/rmKjjbhhNmoQVQ7t0voL7wifZ9s1NRQf7vKoMMA0iWWvhZZMvEBc6yVEayOqM
 Rlhwb3Rj4Z5jLiQWlM0RkvIvM55Xd+s2wYEPm+lUuUuVdl1Bu6C2jsd4cDAeRfnXWp
 aofpLrPjnVoz/btYNSLcMd5KPmibE7qWdZJBOy8cntypR0bA/nSqBijEoxfyolm5hb
 xcIlVnkNU9j4KXvb7ldQeKY10hzSHihqvvT1v+RklzbdRbIqJlI6xW0xEJrbtdk+OX
 vP63o6awE/Beg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 18/29] drm/amd/display: Reset DMCUB before HW init
Date: Mon, 20 Dec 2021 20:57:39 -0500
Message-Id: <20211221015751.116328-18-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221015751.116328-1-sashal@kernel.org>
References: <20211221015751.116328-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com, Anson.Jacob@amd.com,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Roman.Li@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 nikola.cornij@amd.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
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
index fef13e93a99fd..bdc894bd66e31 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -900,6 +900,11 @@ static int dm_dmub_hw_init(struct amdgpu_device *adev)
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

