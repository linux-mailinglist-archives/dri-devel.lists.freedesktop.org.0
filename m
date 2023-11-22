Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AA67F4A71
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 16:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D418910E658;
	Wed, 22 Nov 2023 15:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6A210E306;
 Wed, 22 Nov 2023 15:33:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 467CCCE1F39;
 Wed, 22 Nov 2023 15:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D966C433C7;
 Wed, 22 Nov 2023 15:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700667192;
 bh=tsfvs86aMqoPF1wuQaLY1UWqDFl9Q+xKTuDaoPAgxQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BfhvONRjUjf2nqK16BzmmGxTarYvY2GPim3lhQml90UR21RJ0y7+wYH77HpCiyvlu
 5cHpMfhUFQfIDnm8Uc9LM4xa6KZ20QuZPNRvD5Pqe5rVSVsHUH5kEPQl5BGkSSenNB
 bpTapWwsfstzJynBIUw4ilGpFsbi2qh2Rpnlaey6xL2hB0SQ79GJQWQ1Z2wiyvFefA
 DPViHpG3loIBW+5Z2Ns/61Fy6QIyfIBRlrcFO75HO8LynXFTMkSrfqflDi3REH+ayP
 BNnoms+Dr0AdQ47JI461/fOtPNStAtiL2N/C4TVz6Qb4cWPdoQwCJApy9XqdPcs2nh
 sm8VD/De53uZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 16/17] drm/amdgpu: correct chunk_ptr to a pointer
 to chunk.
Date: Wed, 22 Nov 2023 10:31:45 -0500
Message-ID: <20231122153212.852040-16-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153212.852040-1-sashal@kernel.org>
References: <20231122153212.852040-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.2
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
index d93a8961274c6..bfac7a93726ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -207,7 +207,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 	}
 
 	for (i = 0; i < p->nchunks; i++) {
-		struct drm_amdgpu_cs_chunk __user **chunk_ptr = NULL;
+		struct drm_amdgpu_cs_chunk __user *chunk_ptr = NULL;
 		struct drm_amdgpu_cs_chunk user_chunk;
 		uint32_t __user *cdata;
 
-- 
2.42.0

