Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7700E483597
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291EC89C9D;
	Mon,  3 Jan 2022 17:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671A089BF6;
 Mon,  3 Jan 2022 17:28:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B60B6119B;
 Mon,  3 Jan 2022 17:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A285C36AED;
 Mon,  3 Jan 2022 17:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641230936;
 bh=o5kFP8oQmTF+hd+jHzzz40Ex04sUdxCwM94ZL0yWrWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nuAplQGKG8tfugNv8dx6iWBh3+9KaqvMjr4uJWFckrUtSpF4o6kXLS4YYwoiJLRBm
 bLFPaL2uAuES8Uizdg5AVqz6G07cYul2jgowmYN3ZHtV+gNwKnx2XEo6T7rmRx6mFO
 0HlVgcSGnUqBb6Rc7IqQuAvMsJLVvqwMVGcXElBbCc8JTzihZnU+HaUT228RizQeGb
 4UoXOt+39SglQ9DUtd6kmSQLxo2gqhX5y8saI4z29KvYDlIIq6x2nekb9CPMxQp7Dn
 BsCZsi0OPJCMiIAZgJciAX0K11It52GSaYa367qtMMPUEUE1BqvWZKvgHme6lBVuoa
 UjAapbVNgIN8w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 02/16] drm/amdgpu: fix dropped backing store
 handling in amdgpu_dma_buf_move_notify
Date: Mon,  3 Jan 2022 12:28:35 -0500
Message-Id: <20220103172849.1612731-2-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103172849.1612731-1-sashal@kernel.org>
References: <20220103172849.1612731-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, tzimmermann@suse.de,
 shashank.sharma@amd.com, airlied@linux.ie,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 Ramesh.Errabolu@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <ckoenig.leichtzumerken@gmail.com>

[ Upstream commit fc74881c28d314b10efac016ef49df4ff40b8b97 ]

bo->tbo.resource can now be NULL.

Signed-off-by: Christian König <christian.koenig@amd.com>
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1811
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20211210083927.1754-1-christian.koenig@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index ae6ab93c868b8..7444484a12bf8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -384,7 +384,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	struct amdgpu_vm_bo_base *bo_base;
 	int r;
 
-	if (bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
+	if (!bo->tbo.resource || bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
 		return;
 
 	r = ttm_bo_validate(&bo->tbo, &placement, &ctx);
-- 
2.34.1

