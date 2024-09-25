Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E1A985884
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C1310E7F9;
	Wed, 25 Sep 2024 11:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eQcqV81c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7075A10E7F9;
 Wed, 25 Sep 2024 11:44:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9F378A43F61;
 Wed, 25 Sep 2024 11:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F214C4CEC3;
 Wed, 25 Sep 2024 11:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264665;
 bh=rtPOrVSzv56Du78saVp74sOxBaoeG+hVGrm0JUALDCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eQcqV81cN8LFZtwtnvBjQmAXXrFcC7oWXBMbNZgdNeTzPQk6SuZSvpEKn0cnjO2a8
 wl3q8yKULfCpnnYKTNvuMNXK1nVgmNle3TVtSVSpg3XdCnGcde8ak4EMUptmrnz6Dn
 ZpaNFxaBQAi6RNy+P+kO5Icy9E05OYtcy1/jM0Nhc/ZBAM1MMsFFfBXtMxA1hzZGn2
 9VOV8nRrmGFeXRlHvGCo1TrZ7m6mnOWnMAzBnAiOX8gjeWldUA5jYCaxBhEEI/5YPV
 m3IFo71INpPc9jHxh1sSFyBn6/8W2OlS17ncC3JVM9lnxLSQSbg8OpDoJWIHZvjTKp
 uiJ45Wmqswheg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 felix.kuehling@amd.com, srinivasan.shanmugam@amd.com, David.Wu3@amd.com,
 robdclark@chromium.org, YuanShang.Mao@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 134/244] drm/amdgpu: disallow multiple BO_HANDLES
 chunks in one submit
Date: Wed, 25 Sep 2024 07:25:55 -0400
Message-ID: <20240925113641.1297102-134-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

[ Upstream commit fec5f8e8c6bcf83ed7a392801d7b44c5ecfc1e82 ]

Before this commit, only submits with both a BO_HANDLES chunk and a
'bo_list_handle' would be rejected (by amdgpu_cs_parser_bos).

But if UMD sent multiple BO_HANDLES, what would happen is:
* only the last one would be really used
* all the others would leak memory as amdgpu_cs_p1_bo_handles would
  overwrite the previous p->bo_list value

This commit rejects submissions with multiple BO_HANDLES chunks to
match the implementation of the parser.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 6dfdff58bffd1..78b3c067fea7e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -263,6 +263,10 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 			if (size < sizeof(struct drm_amdgpu_bo_list_in))
 				goto free_partial_kdata;
 
+			/* Only a single BO list is allowed to simplify handling. */
+			if (p->bo_list)
+				ret = -EINVAL;
+
 			ret = amdgpu_cs_p1_bo_handles(p, p->chunks[i].kdata);
 			if (ret)
 				goto free_partial_kdata;
-- 
2.43.0

