Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913639858D6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABEE10E93A;
	Wed, 25 Sep 2024 11:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="khi01GGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAB210E93A;
 Wed, 25 Sep 2024 11:47:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E48D5C5985;
 Wed, 25 Sep 2024 11:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49370C4CEC3;
 Wed, 25 Sep 2024 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264859;
 bh=V6jOduApBvp+peAJ+82yTBPUNJPELsT1Zqt3JA7JYXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=khi01GGQ0bHKIHsH0IFhfpIiXGdcTrmLSmiQTT/yAGNulPynry5Be1n4dOk+AZM+K
 3ArfPHGKBPsneNS5Od/VKN1qApfxbTUmCnztBVgAUFEAjuQBtWX6mgcmvaK2w1ehRU
 yEFharU/qWuekj9avj9iqb47PtdGN5EIxFNfk+VYpznjiWLiE0uJfurpf9eL1zbCg1
 rVlmm93xWCwCWP9trKPrnnoVioGDRmwGKRjRb2b3GBkAaH0dEKFvNFG1+WGWL2VOn/
 AD3k2b5Fi4zyi/c9+pDn9jKSHqzPu38R2g5XRSfnYNYQXpd57ZzG8SLuOt7vS3aGkn
 k73MU5k2aSh6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yang Wang <kevinyang.wang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 162/244] drm/amdgpu: add list empty check to
 avoid null pointer issue
Date: Wed, 25 Sep 2024 07:26:23 -0400
Message-ID: <20240925113641.1297102-162-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
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

From: Yang Wang <kevinyang.wang@amd.com>

[ Upstream commit 4416377ae1fdc41a90b665943152ccd7ff61d3c5 ]

Add list empty check to avoid null pointer issues in some corner cases.
- list_for_each_entry_safe()

Signed-off-by: Yang Wang <kevinyang.wang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
index 19158cc30f31f..43f3e72fb247a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
@@ -80,6 +80,9 @@ static void aca_banks_release(struct aca_banks *banks)
 {
 	struct aca_bank_node *node, *tmp;
 
+	if (list_empty(&banks->list))
+		return;
+
 	list_for_each_entry_safe(node, tmp, &banks->list, node) {
 		list_del(&node->node);
 		kvfree(node);
@@ -562,9 +565,13 @@ static void aca_error_fini(struct aca_error *aerr)
 	struct aca_bank_error *bank_error, *tmp;
 
 	mutex_lock(&aerr->lock);
+	if (list_empty(&aerr->list))
+		goto out_unlock;
+
 	list_for_each_entry_safe(bank_error, tmp, &aerr->list, node)
 		aca_bank_error_remove(aerr, bank_error);
 
+out_unlock:
 	mutex_destroy(&aerr->lock);
 }
 
@@ -680,6 +687,9 @@ static void aca_manager_fini(struct aca_handle_manager *mgr)
 {
 	struct aca_handle *handle, *tmp;
 
+	if (list_empty(&mgr->list))
+		return;
+
 	list_for_each_entry_safe(handle, tmp, &mgr->list, node)
 		amdgpu_aca_remove_handle(handle);
 }
-- 
2.43.0

