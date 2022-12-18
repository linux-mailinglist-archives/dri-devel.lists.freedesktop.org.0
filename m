Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D165005F
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C7310E252;
	Sun, 18 Dec 2022 16:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9A210E24D;
 Sun, 18 Dec 2022 16:13:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A0D260DDB;
 Sun, 18 Dec 2022 16:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A893C433F0;
 Sun, 18 Dec 2022 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379998;
 bh=9cMVz/7RUy1bBNQ+ZXNVi7CT5W2f04dwS8UO0J5cu94=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i02OmITmBri586SezchYlx5mE3yDYcGSNDaV8jTt2mBcAErqMxK2k8AnroNoAryV3
 x9lBCyQDoi+hvfKTH+sHAEQGsaVNWP6d3YN5MnD/IZ5DK9n4TKDlIn2b1ixq4OWal+
 ZRcIR4bTSrv94McXDRSXikuW8yFijVsf6ZFSrsdtW8tK4lscBb15ZAgarQRj0HX9vR
 9ptnQR1DOZf/ZROx+0KTUbUDsDyy+WIUXc4NKE3SO3X1Flo/KVIwMmSScQqBOYKTwc
 Kkj3srrhsmfsz0osWfmh/LXMXs7rn3EIXtQpn4A0t5i3dOt4bifVQhjRL0Ycbyff9e
 56nqwcOkXhAXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/46] drm/amd/display: prevent memory leak
Date: Sun, 18 Dec 2022 11:12:06 -0500
Message-Id: <20221218161244.930785-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218161244.930785-1-sashal@kernel.org>
References: <20221218161244.930785-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, HaoPing.Liu@amd.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 gehao <gehao@kylinos.cn>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: gehao <gehao@kylinos.cn>

[ Upstream commit d232afb1f3417ae8194ccf19ad3a8360e70e104e ]

In dce6(0,1,4)_create_resource_pool and dce80_create_resource_pool
the allocated memory should be released if construct pool fails.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: gehao <gehao@kylinos.cn>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c | 3 +++
 drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
index dcfa0a3efa00..bf72d3f60d7f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
@@ -1127,6 +1127,7 @@ struct resource_pool *dce60_create_resource_pool(
 	if (dce60_construct(num_virtual_links, dc, pool))
 		return &pool->base;
 
+	kfree(pool);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
@@ -1324,6 +1325,7 @@ struct resource_pool *dce61_create_resource_pool(
 	if (dce61_construct(num_virtual_links, dc, pool))
 		return &pool->base;
 
+	kfree(pool);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
@@ -1517,6 +1519,7 @@ struct resource_pool *dce64_create_resource_pool(
 	if (dce64_construct(num_virtual_links, dc, pool))
 		return &pool->base;
 
+	kfree(pool);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
index 725d92e40cd3..52d1f9746e8c 100644
--- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
@@ -1138,6 +1138,7 @@ struct resource_pool *dce80_create_resource_pool(
 	if (dce80_construct(num_virtual_links, dc, pool))
 		return &pool->base;
 
+	kfree(pool);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
@@ -1337,6 +1338,7 @@ struct resource_pool *dce81_create_resource_pool(
 	if (dce81_construct(num_virtual_links, dc, pool))
 		return &pool->base;
 
+	kfree(pool);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
-- 
2.35.1

