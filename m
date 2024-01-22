Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB218365F8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAB910EF48;
	Mon, 22 Jan 2024 14:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D6010EA8B;
 Mon, 22 Jan 2024 14:57:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1531E61532;
 Mon, 22 Jan 2024 14:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2486BC433C7;
 Mon, 22 Jan 2024 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935405;
 bh=hE+07rdXTV9JCX+fPOGzqBtAVm5A/aZWznuYlnLdIQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gxmNuXHntukY1ZGrBtieHyDQc7MgorBCh/xs1SVTkJD0A6KhFKGYfo9c+/gsOlfY3
 EspRs7C+eSYNEhiOw3cIamgc1X+rergqbmGoIS12W769e2n9UGxuJwKGq8FFtUaiSm
 QZkasVHOzmLMBokn53CxVEd0ycRsKrcyegtlZi2WCn9skvF+GCEjKzn68kMzOEtxGN
 JLfVuBQ9p0Gu0bvz6zVHuQVGhyHiVq/MGmfAh0c2h9PuhECWFpUb+kSln9MjeJfvqM
 No3fhuXq2AF7LAPZsLfyaY+7m7CNt+bLN1arUgK/dYiOvuNpYAO7GEzvNRSC9W6zWp
 nh4yzPN+Y4G2w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 13/88] drm/amd/display: Fix tiled display
 misalignment
Date: Mon, 22 Jan 2024 09:50:46 -0500
Message-ID: <20240122145608.990137-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, dillon.varone@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, airlied@gmail.com, Qingqing.Zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, samson.tam@amd.com,
 christian.koenig@amd.com,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 wenjing.liu@amd.com, Hamza Mahfooz <hamza.mahfooz@amd.com>, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, jun.lei@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, alvin.lee2@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>

[ Upstream commit c4b8394e76adba4f50a3c2696c75b214a291e24a ]

[Why]
When otg workaround is applied during clock update, otgs of
tiled display went out of sync.

[How]
To call dc_trigger_sync() after clock update to sync otgs again.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 5c1185206645..220f05975c0d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1964,6 +1964,10 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 		wait_for_no_pipes_pending(dc, context);
 		/* pplib is notified if disp_num changed */
 		dc->hwss.optimize_bandwidth(dc, context);
+		/* Need to do otg sync again as otg could be out of sync due to otg
+		 * workaround applied during clock update
+		 */
+		dc_trigger_sync(dc, context);
 	}
 
 	if (dc->hwss.update_dsc_pg)
-- 
2.43.0

