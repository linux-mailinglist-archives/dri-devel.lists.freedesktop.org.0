Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99DFA7AB67
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1D910EB32;
	Thu,  3 Apr 2025 19:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cNOILNGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204CB10EB31;
 Thu,  3 Apr 2025 19:20:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 951C15C6C6A;
 Thu,  3 Apr 2025 19:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5CAC4CEE3;
 Thu,  3 Apr 2025 19:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743708022;
 bh=n4B88VHlunu5YI/4JvYHzG5RGiUvxA9A5zq3LCDfcnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cNOILNGIgE3WENJGaAJApmNc3i+osbv9JAwMJfjdImV6sKJs4kGNYP9KC3GHa0Bee
 Ap3eLZfybLCTnLjlvDh+/iMm0qYMPCid8VgsfuS5d82XQocP9rPUmHFoiU3Ogv90uL
 YEGu4yjMEdPFXE1fq/BfOdx+sw7WTUx8jndd08UZjrcfevbnx/TXTXveviIPDFuYNW
 iJmEqy3JOIjD9p0m/2pnqZhknoIY3KX1FTYtSd4JncJ6Dzk5hICHasbmUNGNGXi4CO
 VU64WDiohEThcAI4QqKojkkt6V03UW3Wv6uToib3O+tDiP7aWvs71AX0obFYznc3Ns
 WcOWOx7Sg7S7g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.15 08/12] drm/amdkfd: Fix pqm_destroy_queue race
 with GPU reset
Date: Thu,  3 Apr 2025 15:19:57 -0400
Message-Id: <20250403192001.2682149-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403192001.2682149-1-sashal@kernel.org>
References: <20250403192001.2682149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.179
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

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 7919b4cad5545ed93778f11881ceee72e4dbed66 ]

If GPU in reset, destroy_queue return -EIO, pqm_destroy_queue should
delete the queue from process_queue_list and free the resource.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 243dd1efcdbf5..7a298158ed11a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -384,7 +384,7 @@ int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid)
 			pr_err("Pasid 0x%x destroy queue %d failed, ret %d\n",
 				pqm->process->pasid,
 				pqn->q->properties.queue_id, retval);
-			if (retval != -ETIME)
+			if (retval != -ETIME && retval != -EIO)
 				goto err_destroy_queue;
 		}
 
-- 
2.39.5

