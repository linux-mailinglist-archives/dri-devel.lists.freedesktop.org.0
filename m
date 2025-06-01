Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B55ACA222
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AF910E40E;
	Sun,  1 Jun 2025 23:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ez3KhZ2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2E810E40D;
 Sun,  1 Jun 2025 23:34:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C031743C3B;
 Sun,  1 Jun 2025 23:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F878C4CEE7;
 Sun,  1 Jun 2025 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820867;
 bh=Zc6Qjt9/fsfqG6EKRy/duEQ3GdVhD0TlDznXQBtVFlk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ez3KhZ2/aranRPN7Ygqz8i1kmbT+ElkC6oSVcU4FUDCq/j1KYSXPtp0rJ4TcOzX02
 SjSMfw9JVKkEH9uUu1bmpXeiH+1xF00RYS+pp+/0zbDj31QbeF8nDvHSs6h7gCh4SL
 NiD/tskqD6s1BQ+ju8QbNdH+AlPkRZAw+95uPoFLq4t6Amyj0Rdkft2E9nmM8mS+1O
 azrov4txTjiOmXynGqTFuhG9W5D7KZfZnjfBqdrNaq+Ry3Qi8r95+VoO0FQAgsaO7A
 blSt0cWhPCtzi4KUTA78ncK7Oue2kAzTvOjJZBTl7/NLg5tgpgMsomlgVLK3EJvQ/B
 rYhMyAmAAB0fg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Jesse.Zhang" <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 "Shaoyun . liu" <Shaoyun.liu@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, Jack.Xiao@amd.com, srinivasan.shanmugam@amd.com,
 shaoyun.liu@amd.com, Jiadong.Zhu@amd.com, Hawking.Zhang@amd.com,
 michael.chen@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 08/93] drm/amdgpu: Fix API status offset for MES
 queue reset
Date: Sun,  1 Jun 2025 19:32:35 -0400
Message-Id: <20250601233402.3512823-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233402.3512823-1-sashal@kernel.org>
References: <20250601233402.3512823-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Type: text/plain; charset=UTF-8
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

From: "Jesse.Zhang" <Jesse.Zhang@amd.com>

[ Upstream commit ad7c088e31f026d71fe87fd09473fafb7d6ed006 ]

The mes_v11_0_reset_hw_queue and mes_v12_0_reset_hw_queue functions were
using the wrong union type (MESAPI__REMOVE_QUEUE) when getting the offset
for api_status. Since these functions handle queue reset operations, they
should use MESAPI__RESET union instead.

This fixes the polling of API status during hardware queue reset operations
in the MES for both v11 and v12 versions.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-By: Shaoyun.liu <Shaoyun.liu@amd.com>
Reviewed-by: Prike Liang <Prike.Liang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees based on
the following analysis: ## Bug Analysis The commit fixes a clear
functional bug where `mes_v11_0_reset_hw_queue()` and
`mes_v12_0_reset_hw_queue()` functions were using the wrong union type
(`MESAPI__REMOVE_QUEUE`) to get the API status offset for polling
completion. Since these functions handle **reset** operations, they
should use the `MESAPI__RESET` union instead. ## Code Changes Assessment
1. **Small and contained**: The fix changes only 2 lines across 2 files:
- `mes_v11_0.c:480`: `offsetof(union MESAPI__REMOVE_QUEUE, api_status)`
→ `offsetof(union MESAPI__RESET, api_status)` - `mes_v12_0.c:500`: Same
change 2. **Logical correctness**: The functions create `union
MESAPI__RESET mes_reset_queue_pkt` packets but were polling using the
wrong union offset. This is a clear mismatch that could cause incorrect
polling behavior. 3. **No architectural changes**: This is purely a bug
fix that aligns the API status polling with the correct packet type. ##
Impact Assessment - **Affects GPU queue management**: MES (Micro Engine
Scheduler) queue reset is a critical operation for AMD GPUs -
**Potential for silent failures**: Wrong offset polling could lead to
improper completion detection - **User-visible impact**: Could cause GPU
hangs or incorrect queue state management - **Low regression risk**: The
fix aligns the code with its intended design ## Comparison with Similar
Commits All 5 provided similar commits were marked "NO" for backporting
because they: - Added new APIs/features (commits #1, #2) - Made
functional changes to queue reset behavior (commits #3, #4, #5) In
contrast, this commit: - Fixes an existing bug without adding features -
Maintains existing behavior while correcting implementation - Follows
the stable tree rule of "important bugfixes with minimal risk" ## Stable
Tree Criteria Met ✅ **Important bugfix**: Fixes incorrect API status
polling in GPU queue reset ✅ **Minimal risk**: Two-line change with
clear logic ✅ **No new features**: Pure correctness fix ✅ **Contained
change**: Limited to MES driver subsystem ✅ **Clear side effects**:
Improves reliability of queue reset operations This commit represents
exactly the type of focused bug fix that stable trees are designed to
include.

 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 49113df8baefd..298d6a68d33c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -452,7 +452,7 @@ static int mes_v11_0_reset_hw_queue(struct amdgpu_mes *mes,
 
 	return mes_v11_0_submit_pkt_and_poll_completion(mes,
 			&mes_reset_queue_pkt, sizeof(mes_reset_queue_pkt),
-			offsetof(union MESAPI__REMOVE_QUEUE, api_status));
+			offsetof(union MESAPI__RESET, api_status));
 }
 
 static int mes_v11_0_map_legacy_queue(struct amdgpu_mes *mes,
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
index 459f7b8d72b4d..3a74d31909250 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
@@ -373,7 +373,7 @@ static int mes_v12_0_reset_hw_queue(struct amdgpu_mes *mes,
 
 	return mes_v12_0_submit_pkt_and_poll_completion(mes, pipe,
 			&mes_reset_queue_pkt, sizeof(mes_reset_queue_pkt),
-			offsetof(union MESAPI__REMOVE_QUEUE, api_status));
+			offsetof(union MESAPI__RESET, api_status));
 }
 
 static int mes_v12_0_map_legacy_queue(struct amdgpu_mes *mes,
-- 
2.39.5

