Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB893E629
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 17:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C876210E21B;
	Sun, 28 Jul 2024 15:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BYWTuo68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FA510E21F;
 Sun, 28 Jul 2024 15:44:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9D7DACE076E;
 Sun, 28 Jul 2024 15:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3333CC32782;
 Sun, 28 Jul 2024 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181466;
 bh=HCiyyTk+fYVJuNT17/mU8KRklt1r7jud0B/vUVSoIzQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BYWTuo68AgMhdkoqKLti+ywrFTjNRXjZbLqA0J15dWhZegVcV7IqYOELpgWnlxKdd
 PDBc7rkzVA74gtmYAtIzaDzzoN2U512HbzNF/dR+SA7bOojv+vXplhK/z91lPmt5b2
 5MZeFHWkXn5wboUimsz5FeXn2hZc6wjt4PCw56IhKXPuvM4EZu4x4tj4xnYRvHwdVo
 oum/vE+jqwRWW77QnbumDyU8bW5PgVA+LLEktyrViIsbK8x4LK1HpFGSPI+ePC7670
 kWeyV9cDRVnCpC9C9YfJCngapyIKBn1qHKnYJLb9cjsBfjpTqw5R+RTCjJ+sWpla1r
 aRxr1n9KYcT2w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wayne Lin <wayne.lin@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alex.hung@amd.com, roman.li@amd.com, hersenxs.wu@amd.com,
 mario.limonciello@amd.com, agustin.gutierrez@amd.com,
 hamza.mahfooz@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 19/34] drm/amd/display: Don't refer to dc_sink in
 is_dsc_need_re_compute
Date: Sun, 28 Jul 2024 11:40:43 -0400
Message-ID: <20240728154230.2046786-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Wayne Lin <wayne.lin@amd.com>

[ Upstream commit fcf6a49d79923a234844b8efe830a61f3f0584e4 ]

[Why]
When unplug one of monitors connected after mst hub, encounter null pointer dereference.

It's due to dc_sink get released immediately in early_unregister() or detect_ctx(). When
commit new state which directly referring to info stored in dc_sink will cause null pointer
dereference.

[how]
Remove redundant checking condition. Relevant condition should already be covered by checking
if dsc_aux is null or not. Also reset dsc_aux to NULL when the connector is disconnected.

Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index a5e1a93ddaea2..025938409145a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -182,6 +182,8 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
 		dc_sink_release(dc_sink);
 		aconnector->dc_sink = NULL;
 		aconnector->edid = NULL;
+		aconnector->dsc_aux = NULL;
+		port->passthrough_aux = NULL;
 	}
 
 	aconnector->mst_status = MST_STATUS_DEFAULT;
@@ -494,6 +496,8 @@ dm_dp_mst_detect(struct drm_connector *connector,
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
 		aconnector->edid = NULL;
+		aconnector->dsc_aux = NULL;
+		port->passthrough_aux = NULL;
 
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID | MST_ALLOCATE_NEW_PAYLOAD | MST_CLEAR_ALLOCATED_PAYLOAD,
@@ -1233,14 +1237,6 @@ static bool is_dsc_need_re_compute(
 		if (!aconnector || !aconnector->dsc_aux)
 			continue;
 
-		/*
-		 *	check if cached virtual MST DSC caps are available and DSC is supported
-		 *	as per specifications in their Virtual DPCD registers.
-		*/
-		if (!(aconnector->dc_sink->dsc_caps.dsc_dec_caps.is_dsc_supported ||
-			aconnector->dc_link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_PASSTHROUGH_SUPPORT))
-			continue;
-
 		stream_on_link[new_stream_on_link_num] = aconnector;
 		new_stream_on_link_num++;
 
-- 
2.43.0

