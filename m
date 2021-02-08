Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B6E313BCF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FC06E984;
	Mon,  8 Feb 2021 17:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DBB6E982;
 Mon,  8 Feb 2021 17:58:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AF5C64EBC;
 Mon,  8 Feb 2021 17:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612807117;
 bh=sN/6ha34otOeEaBysqzwB3pj0rwepRQlUkw7Q+tX/U4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=peh4knKSyYrytYvXB0uQtLXbcOFgzQFmJ4ri4HeEPuwgCZr4dNbHTDVBwY65v476b
 GiaFivaMRW6eyzdqaKoK1T0OEp2orVj3LTClL/FBQcxjXBB8UECa7D0Xfle0vZup/G
 jmlBadcGrKuZYYwe8maTRzXNlneMPyB/79WznZpL1aqDfNGaLCvOjcsmEWpq9ZIqLE
 IYEaYZlnnr3Qb8nel8XlT8OteIsI3mdzhyAemZd1680QhH8CSjJ8BNBg32djkSHvpp
 F+3XZZvK/6n5xmqPo4Oq9rAmq64O7rD4KVgGbWFrPcs3XNjeFDmtsVjdWcKW81+OZn
 wf5A4DdvbLQDA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 22/36] drm/amd/display: Release DSC before
 acquiring
Date: Mon,  8 Feb 2021 12:57:52 -0500
Message-Id: <20210208175806.2091668-22-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175806.2091668-1-sashal@kernel.org>
References: <20210208175806.2091668-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Eryk Brol <Eryk.Brol@amd.com>,
 Anson Jacob <Anson.Jacob@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

[ Upstream commit 58180a0cc0c57fe62a799a112f95b60f6935bd96 ]

[why]
Need to unassign DSC from pipes that are not using it
so other pipes can acquire it. That is needed for
asic's that have unmatching number of DSC engines from
the number of pipes.

[how]
Before acquiring dsc to stream resources, first remove it.

Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
Reviewed-by: Eryk Brol <Eryk.Brol@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index eee19edeeee5c..1e448f1b39a18 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -828,6 +828,9 @@ bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
 		if (computed_streams[i])
 			continue;
 
+		if (dcn20_remove_stream_from_ctx(stream->ctx->dc, dc_state, stream) != DC_OK)
+			return false;
+
 		mutex_lock(&aconnector->mst_mgr.lock);
 		if (!compute_mst_dsc_configs_for_link(state, dc_state, stream->link)) {
 			mutex_unlock(&aconnector->mst_mgr.lock);
@@ -845,7 +848,8 @@ bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
 		stream = dc_state->streams[i];
 
 		if (stream->timing.flags.DSC == 1)
-			dc_stream_add_dsc_to_resource(stream->ctx->dc, dc_state, stream);
+			if (dc_stream_add_dsc_to_resource(stream->ctx->dc, dc_state, stream) != DC_OK)
+				return false;
 	}
 
 	return true;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
