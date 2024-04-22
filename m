Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000238AD9AF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 01:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B2B112E8A;
	Mon, 22 Apr 2024 23:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ICIJlkTZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA62112E89;
 Mon, 22 Apr 2024 23:57:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D93AECE0EB9;
 Mon, 22 Apr 2024 23:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5585C3277B;
 Mon, 22 Apr 2024 23:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713830219;
 bh=EXCJ+V8SmdEPBMqU6mG4n8sBBWp3gDKxqrjHcoHQGeI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ICIJlkTZAHiaFlIf7jJNeVExAnK/V7O8x8NBOblaXt9RAehnYdjBB7jcFQMK1lVJ1
 NnqMInHkUCxVxviUlMX/Z7pJzLBqXRgKaxFLnN0jbZLWQ74LY0Jx7az6gbw2LtBguX
 DN/3cfZnY7sCNdvnlQSaPRUKDZ1su14OnZ+FX4JjO50XvKHfWjAxDtsxiiSmGer7ex
 tGLfFM0Y3osEGZ81nBN5zGsT1lAt1eRzLedtgEPwFCuvZbgQw+3UomEWsDnu1Iv8gu
 OAkWD5WLOQWj4fnvQsy/BuDpJEXJpk5PBOr0bDWG/EtculgiQ2+k74PIwBwq6RbiAt
 j64AEotj+knVQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhigang Luo <Zhigang.Luo@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 21/29] amd/amdkfd: sync all devices to wait all
 processes being evicted
Date: Mon, 22 Apr 2024 19:17:02 -0400
Message-ID: <20240422231730.1601976-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231730.1601976-1-sashal@kernel.org>
References: <20240422231730.1601976-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.28
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

From: Zhigang Luo <Zhigang.Luo@amd.com>

[ Upstream commit d06af584be5a769d124b7302b32a033e9559761d ]

If there are more than one device doing reset in parallel, the first
device will call kfd_suspend_all_processes() to evict all processes
on all devices, this call takes time to finish. other device will
start reset and recover without waiting. if the process has not been
evicted before doing recover, it will be restored, then caused page
fault.

Signed-off-by: Zhigang Luo <Zhigang.Luo@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 93ce181eb3baa..913c70a0ef44f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -935,7 +935,6 @@ void kgd2kfd_suspend(struct kfd_dev *kfd, bool run_pm)
 {
 	struct kfd_node *node;
 	int i;
-	int count;
 
 	if (!kfd->init_complete)
 		return;
@@ -943,12 +942,10 @@ void kgd2kfd_suspend(struct kfd_dev *kfd, bool run_pm)
 	/* for runtime suspend, skip locking kfd */
 	if (!run_pm) {
 		mutex_lock(&kfd_processes_mutex);
-		count = ++kfd_locked;
-		mutex_unlock(&kfd_processes_mutex);
-
 		/* For first KFD device suspend all the KFD processes */
-		if (count == 1)
+		if (++kfd_locked == 1)
 			kfd_suspend_all_processes();
+		mutex_unlock(&kfd_processes_mutex);
 	}
 
 	for (i = 0; i < kfd->num_nodes; i++) {
@@ -959,7 +956,7 @@ void kgd2kfd_suspend(struct kfd_dev *kfd, bool run_pm)
 
 int kgd2kfd_resume(struct kfd_dev *kfd, bool run_pm)
 {
-	int ret, count, i;
+	int ret, i;
 
 	if (!kfd->init_complete)
 		return 0;
@@ -973,12 +970,10 @@ int kgd2kfd_resume(struct kfd_dev *kfd, bool run_pm)
 	/* for runtime resume, skip unlocking kfd */
 	if (!run_pm) {
 		mutex_lock(&kfd_processes_mutex);
-		count = --kfd_locked;
-		mutex_unlock(&kfd_processes_mutex);
-
-		WARN_ONCE(count < 0, "KFD suspend / resume ref. error");
-		if (count == 0)
+		if (--kfd_locked == 0)
 			ret = kfd_resume_all_processes();
+		WARN_ONCE(kfd_locked < 0, "KFD suspend / resume ref. error");
+		mutex_unlock(&kfd_processes_mutex);
 	}
 
 	return ret;
-- 
2.43.0

