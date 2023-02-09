Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A95690671
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9C310E99E;
	Thu,  9 Feb 2023 11:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EDA10E99E;
 Thu,  9 Feb 2023 11:17:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C523BB82105;
 Thu,  9 Feb 2023 11:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E312C433EF;
 Thu,  9 Feb 2023 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675941430;
 bh=YNLyIVRVxLzZjl2teEsz55uXci79wNQmkekQSx3mLAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZXbBIXrOCbEEjUG915Aro1WvPkZi20dvyYUKUoklyHMJKAwqRjXrled0E06B6OrIF
 k5p7/rt+F3qUhyVIcB19Fo4JjI6UcmQEcQ3YSPswwr1Ajijnst4j4dBUo/fzDg9Wu8
 Gz9ZDP66cxcnkYOO/2niBT63ENrl+0fCMeKPizAYWdnhNqRhYgZIXHckcE+M9Weuvl
 ekfCCorlaZBYJlX32wwHZTz3B0ACJdQUGAGnk3pvACLT0yBmMHyJoex2laUlMWezak
 MZnv7BW3kR/WCLY8VAx5R1f9qDzvLwYI1cBR05l0aeEvTelnO8khbq3pCbYp3hV/FO
 MRdpbaC/WUyNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 32/38] drm/amd/display: Reset DMUB mailbox SW
 state after HW reset
Date: Thu,  9 Feb 2023 06:14:51 -0500
Message-Id: <20230209111459.1891941-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Hansen Dsouza <hansen.dsouza@amd.com>,
 Alex Hung <alex.hung@amd.com>, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit 154711aa5759ef9b45903124fa813c4c29ee681c ]

[Why]
Otherwise we can be out of sync with what's in the hardware, leading
to us rerunning every command that's presently in the ringbuffer.

[How]
Reset software state for the mailboxes in hw_reset callback.
This is already done as part of the mailbox init in hw_init, but we
do need to remember to reset the last cached wptr value as well here.

Reviewed-by: Hansen Dsouza <hansen.dsouza@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index 4a122925c3ae9..92c18bfb98b3b 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -532,6 +532,9 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 	if (dmub->hw_funcs.reset)
 		dmub->hw_funcs.reset(dmub);
 
+	/* reset the cache of the last wptr as well now that hw is reset */
+	dmub->inbox1_last_wptr = 0;
+
 	cw0.offset.quad_part = inst_fb->gpu_addr;
 	cw0.region.base = DMUB_CW0_BASE;
 	cw0.region.top = cw0.region.base + inst_fb->size - 1;
@@ -649,6 +652,15 @@ enum dmub_status dmub_srv_hw_reset(struct dmub_srv *dmub)
 	if (dmub->hw_funcs.reset)
 		dmub->hw_funcs.reset(dmub);
 
+	/* mailboxes have been reset in hw, so reset the sw state as well */
+	dmub->inbox1_last_wptr = 0;
+	dmub->inbox1_rb.wrpt = 0;
+	dmub->inbox1_rb.rptr = 0;
+	dmub->outbox0_rb.wrpt = 0;
+	dmub->outbox0_rb.rptr = 0;
+	dmub->outbox1_rb.wrpt = 0;
+	dmub->outbox1_rb.rptr = 0;
+
 	dmub->hw_init = false;
 
 	return DMUB_STATUS_OK;
-- 
2.39.0

