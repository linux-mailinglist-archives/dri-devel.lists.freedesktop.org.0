Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721384FCA8A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3799510FB2E;
	Tue, 12 Apr 2022 00:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D254310FB2A;
 Tue, 12 Apr 2022 00:52:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FB2E60C20;
 Tue, 12 Apr 2022 00:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB858C385A3;
 Tue, 12 Apr 2022 00:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724731;
 bh=N4oe4JkYZBbeeXFs6huyORVN6GlF6ckNaIQ+O7KQhT4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OA7VeqKKY+X9A6aWbzEloSJJwqbUhrQBE0dbmTAJGomE79yq0rs6T4pWEDw++P3mV
 Gaj0QLXOSY0rGjmgsPgz5gMcAOb6aQ8N92p9NSF5gBKWFFEb7HLgwFTdsNfY4HDnS5
 8dYDOwOl94gxErXe8cVQzymeMBLyVXriJ7wP2U12+OnPt8VfzafFyK/vKr7u0rxh5j
 vWJw9rEtJsbnEWI8jc5vqbqP54xQnZLmmlyC8AoalR3MxGIQprLkPbf2yepR6NGsny
 CFlMhCkL3047Lt3HY3eKvl6K8H7yMM1RT7ZanoHxMdhcf5svyUFNur4X4DXUgM4/UL
 WdGF6Odb2LhNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 10/12] drm/amd/display: Fix allocate_mst_payload
 assert on resume
Date: Mon, 11 Apr 2022 20:51:43 -0400
Message-Id: <20220412005148.351391-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412005148.351391-1-sashal@kernel.org>
References: <20220412005148.351391-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Alex Hung <alex.hung@amd.com>,
 airlied@linux.ie, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 qingqing.zhuo@amd.com, christian.koenig@amd.com, shenshih@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Li <Roman.Li@amd.com>

[ Upstream commit f4346fb3edf7720db3f7f5e1cab1f667cd024280 ]

[Why]
On resume we do link detection for all non-MST connectors.
MST is handled separately. However the condition for telling
if connector is on mst branch is not enough for mst hub case.
Link detection for mst branch link leads to mst topology reset.
That causes assert in dc_link_allocate_mst_payload()

[How]
Use link type as indicator for mst link.

Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Roman Li <Roman.Li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ed02bb6b2cd0..1d1183c47beb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -777,7 +777,8 @@ static int dm_resume(void *handle)
 		 * this is the case when traversing through already created
 		 * MST connectors, should be skipped
 		 */
-		if (aconnector->mst_port)
+		if (aconnector->dc_link &&
+		    aconnector->dc_link->type == dc_connection_mst_branch)
 			continue;
 
 		mutex_lock(&aconnector->hpd_lock);
-- 
2.35.1

