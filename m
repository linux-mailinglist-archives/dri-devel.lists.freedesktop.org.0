Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA334AFB36
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 19:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137D210E55F;
	Wed,  9 Feb 2022 18:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D519E10E53B;
 Wed,  9 Feb 2022 18:44:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74A40B82215;
 Wed,  9 Feb 2022 18:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77E0C340ED;
 Wed,  9 Feb 2022 18:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644432240;
 bh=68TEqlEr7oRnJi0vtYWnGuAH20gM7jHIJnUnx/9lt/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eH4LDAyEpu7X683H+Yf+tUrEaE1giN+0dXrzwBE1ggDvdkKJEkZ3Mg/7I744WkcFw
 FpZpPLa4QkkesduaJtHNEqo0p72bUOr35B746cxkqVTzlDdk34ugpYZg1MNiY1BN52
 7UvTlfK41dLjQILckKAG5UTYDtereKetGz4Ef8EOuPB7h8PmNxFfn5W2ZlGVxDAqi2
 NNKs1N9Qs/m2/IUQ9lSAD9B1JZ+CFKEpJuVI5mO15UdHnCnlDgMutReCvo2FajsrXQ
 f7jXpc5jOyVJCr8KWg23mNMN4bdCdub8/wqTp9bTfQZhN9ri1yWT39JcWPPVYzt7Nq
 +xX7R5oCmoMuw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 14/15] drm/amdgpu: fix logic inversion in check
Date: Wed,  9 Feb 2022 13:43:00 -0500
Message-Id: <20220209184305.47983-14-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209184305.47983-1-sashal@kernel.org>
References: <20220209184305.47983-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Philip.Yang@amd.com, Oak.Zeng@amd.com,
 tzimmermann@suse.de, kevin1.wang@amd.com, airlied@linux.ie,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

[ Upstream commit e8ae38720e1a685fd98cfa5ae118c9d07b45ca79 ]

We probably never trigger this, but the logic inside the check is
inverted.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 58e14d3040f03..870dd78d5a21a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1976,7 +1976,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	unsigned i;
 	int r;
 
-	if (direct_submit && !ring->sched.ready) {
+	if (!direct_submit && !ring->sched.ready) {
 		DRM_ERROR("Trying to move memory with ring turned off.\n");
 		return -EINVAL;
 	}
-- 
2.34.1

