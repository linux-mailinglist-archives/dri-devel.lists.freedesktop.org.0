Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523C590099
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3820B4734;
	Thu, 11 Aug 2022 15:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35918B0857;
 Thu, 11 Aug 2022 15:44:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D98A9B82150;
 Thu, 11 Aug 2022 15:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D87C43141;
 Thu, 11 Aug 2022 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232694;
 bh=xLtHnm8micGLNicVMjboefOx/JO/OJlkNNbj8JJtSvw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dKoCiRo+R6szgxiWbTDverN6Z3O6+k9MC6oPg0mrrGEojcyic0HnJ2rtawLQCarjC
 A39iWP7Cd4xJnuQMwHCBmhRTY5Z+xvNqX4rW1ofDryK/KbIBcTTXV/yjmjD23HCHrf
 rhuOiDL8xhTU9YMjGzBA7AyDKLL+m1FK6ub/JqYP0kyyupjJTJ7Xyy9yCpQY7r5jU6
 vfcXwt4WXtKnnRs6bMyWQnkMO0JBFnitNmJxQAZdQmS+EBgBrV8kFtmcHOfKfMMD8l
 +Y/fiPDwYejSsl2CzwtqJONlouOyavwWe4ceb/R+BzwzHneUpExbdwpTqmo6kIQq/2
 tM0PzwuGHn1Ng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 19/93] drm/radeon: Initialize fences array
 entries in radeon_sa_bo_next_hole
Date: Thu, 11 Aug 2022 11:41:13 -0400
Message-Id: <20220811154237.1531313-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>

[ Upstream commit 0381ac3ca2e727d4dfb7264d9416a8ba6bb6c18b ]

Similar to the handling of amdgpu_sa_bo_next_hole in commit 6a15f3ff19a8
("drm/amdgpu: Initialize fences array entries in amdgpu_sa_bo_next_hole"),
we thought a patch might be needed here as well.

The entries were only initialized once in radeon_sa_bo_new. If a fence
wasn't signalled yet in the first radeon_sa_bo_next_hole call, but then
got signalled before a later radeon_sa_bo_next_hole call, it could
destroy the fence but leave its pointer in the array, resulting in
use-after-free in radeon_sa_bo_new.

Signed-off-by: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_sa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sa.c b/drivers/gpu/drm/radeon/radeon_sa.c
index 310c322c7112..0981948bd9ed 100644
--- a/drivers/gpu/drm/radeon/radeon_sa.c
+++ b/drivers/gpu/drm/radeon/radeon_sa.c
@@ -267,6 +267,8 @@ static bool radeon_sa_bo_next_hole(struct radeon_sa_manager *sa_manager,
 	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
 		struct radeon_sa_bo *sa_bo;
 
+		fences[i] = NULL;
+
 		if (list_empty(&sa_manager->flist[i])) {
 			continue;
 		}
@@ -332,10 +334,8 @@ int radeon_sa_bo_new(struct radeon_device *rdev,
 
 	spin_lock(&sa_manager->wq.lock);
 	do {
-		for (i = 0; i < RADEON_NUM_RINGS; ++i) {
-			fences[i] = NULL;
+		for (i = 0; i < RADEON_NUM_RINGS; ++i)
 			tries[i] = 0;
-		}
 
 		do {
 			radeon_sa_bo_try_free(sa_manager);
-- 
2.35.1

