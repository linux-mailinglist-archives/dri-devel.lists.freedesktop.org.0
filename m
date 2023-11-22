Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C538B7F4AC8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 16:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01D910E66E;
	Wed, 22 Nov 2023 15:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FFA10E66E;
 Wed, 22 Nov 2023 15:36:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C39CB61C5A;
 Wed, 22 Nov 2023 15:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488C8C4339A;
 Wed, 22 Nov 2023 15:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700667389;
 bh=FoIw5VvJHDv7aQ+BhGyZIk95Ir5doh8KqK4oFhz2+mU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UgbVXxuYcz6WgsHHSqePN4gL/pYq+yb0tgDCYjAZ+Cb1PH9m9ifmJ/MbQR3f6YkUf
 pBpo+7O0CE2WYVWv8K5MQTioyaJwGtYZIvCtxGW7pxlc+Q5j1LcKSw5YjD4E4rsPKm
 mc70epm+GQAyl4bMLN7Fx1xgdva1dId9ElEl57NG9B+hP0g7jeQnyGzR399sdNFcDv
 uNP//3uUYLxVNLzrABsiCABkeLc3LgJbKZFdrlzMpzXPr7p4AAjWbhMh4YkcYdo/Ti
 PUulALkrySp3RKxOmmxCKqRitf78LaYq6mJTwJNJ5g626GKFKdMSr3L2U9Psd8N+jL
 HR53z2wd4ljtg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 6/6] drm/amdgpu: correct chunk_ptr to a pointer to
 chunk.
Date: Wed, 22 Nov 2023 10:36:05 -0500
Message-ID: <20231122153610.853350-6-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153610.853350-1-sashal@kernel.org>
References: <20231122153610.853350-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.261
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
Cc: Sasha Levin <sashal@kernel.org>, srinivasan.shanmugam@amd.com,
 guchun.chen@amd.com, YuanShang <YuanShang.Mao@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: YuanShang <YuanShang.Mao@amd.com>

[ Upstream commit 50d51374b498457c4dea26779d32ccfed12ddaff ]

The variable "chunk_ptr" should be a pointer pointing
to a struct drm_amdgpu_cs_chunk instead of to a pointer
of that.

Signed-off-by: YuanShang <YuanShang.Mao@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 1a83055211762..f9c725a8991b7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -141,7 +141,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
 	}
 
 	for (i = 0; i < p->nchunks; i++) {
-		struct drm_amdgpu_cs_chunk __user **chunk_ptr = NULL;
+		struct drm_amdgpu_cs_chunk __user *chunk_ptr = NULL;
 		struct drm_amdgpu_cs_chunk user_chunk;
 		uint32_t __user *cdata;
 
-- 
2.42.0

