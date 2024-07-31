Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28269943A2A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A70010E70D;
	Thu,  1 Aug 2024 00:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u1Y0O0ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D8110E70D;
 Thu,  1 Aug 2024 00:11:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F360CE122C;
 Thu,  1 Aug 2024 00:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2178BC116B1;
 Thu,  1 Aug 2024 00:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471105;
 bh=UhPUGOWV4cC+AFWhzXaxUNo0S/bf7kD05SXEQVu0oTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u1Y0O0ep5I2ECO93eK9mW0kkjPHF7+AtrhDyokKibsWaEgwF5u9/8Zi26cliNI49K
 FKH9TYPQKnZ3Y1pdT9rdHxL2z56MByHymq/awaNgdKdsST4yFQrR0kb738/jPIV9sv
 QPngS72atSCgdLUnppYCX+Cq+1Gw9kcmPAAnTqPCIoeCPg9qrn6SkWyJNzWeoKdv25
 kmbEUBp+jYbuZjhp+S48VNjfzzCfXR1vva7gf6HvcUYFuNo3vsIhx65eYquUCjThCO
 4MhZuwAgPBLRMHlTPj+fncIdbTM0GC2UNIndJ7O6MpOLogaiu6pIy23ziF7gjyVq92
 a4jvfFwlQJVsg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hersen Wu <hersenxs.wu@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 martin.leung@amd.com, moadhuri@amd.com, wayne.lin@amd.com,
 Bhawanpreet.Lakha@amd.com, wenjing.liu@amd.com, hamza.mahfooz@amd.com,
 mghaddar@amd.com, max.tseng@amd.com, nicholas.kazlauskas@amd.com,
 charlene.liu@amd.com, Qingqing.Zhuo@amd.com, ahmed.ahmed@amd.com,
 daniel.miess@amd.com, sungkim@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 026/121] drm/amd/display: Release clck_src memory
 if clk_src_construct fails
Date: Wed, 31 Jul 2024 19:59:24 -0400
Message-ID: <20240801000834.3930818-26-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
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

From: Hersen Wu <hersenxs.wu@amd.com>

[ Upstream commit 674704a5dabe4a434645fdd11e35437f4e06dfc4 ]

[Why]
Coverity reports RESOURCE_LEAK for some implemenations
of clock_source_create. Do not release memory of clk_src
if contructor fails.

[How]
Free clk_src if contructor fails.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c    | 1 +
 .../gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c    | 1 +
 .../gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c  | 4 ++--
 .../gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c    | 1 +
 .../gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c  | 1 +
 5 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
index 56ee45e12b461..a73d3c6ef4258 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
@@ -1538,6 +1538,7 @@ struct resource_pool *dce83_create_resource_pool(
 	if (dce83_construct(num_virtual_links, dc, pool))
 		return &pool->base;
 
+	kfree(pool);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index d4c3e2754f516..5d1801dce2730 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1864,6 +1864,7 @@ static struct clock_source *dcn30_clock_source_create(
 		return &clk_src->base;
 	}
 
+	kfree(clk_src);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index ff50f43e4c000..da73e842c55c8 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -1660,8 +1660,8 @@ static struct clock_source *dcn31_clock_source_create(
 		return &clk_src->base;
 	}
 
-	BREAK_TO_DEBUGGER();
 	kfree(clk_src);
+	BREAK_TO_DEBUGGER();
 	return NULL;
 }
 
@@ -1821,8 +1821,8 @@ static struct clock_source *dcn30_clock_source_create(
 		return &clk_src->base;
 	}
 
-	BREAK_TO_DEBUGGER();
 	kfree(clk_src);
+	BREAK_TO_DEBUGGER();
 	return NULL;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 2df8a742516c8..28c4599076989 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1716,6 +1716,7 @@ static struct clock_source *dcn35_clock_source_create(
 		return &clk_src->base;
 	}
 
+	kfree(clk_src);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index ddf9560ab7722..b7bd0f36125a4 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1696,6 +1696,7 @@ static struct clock_source *dcn35_clock_source_create(
 		return &clk_src->base;
 	}
 
+	kfree(clk_src);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
-- 
2.43.0

