Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD7D41A76A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 07:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F89589DAB;
	Tue, 28 Sep 2021 05:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228E189D7F;
 Tue, 28 Sep 2021 05:55:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D12C1611CC;
 Tue, 28 Sep 2021 05:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632808533;
 bh=3j7cRuwX8oE8k8wLA4cpV+B/YSxYbRpiZh1fi63kOl0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EgFde5imkdbL72IzCgqkmyXpYey+cqvYOdZ1lHBtyA/3h7WGljMEzlFngdtAz7Q7E
 JNgzAbY+Zk1PerxAVcFNgv7W043k7XVBx6aKSa6eyGw/L4MvaZjs0jD4Z47qkz9NhK
 IUltPtuLWzgh+k5JUMj6MFKGBLTBksiid4UKp6AeDQrawAUqacK3Kl3BDJLjgN4LxJ
 HJ9ebrvt3zK5xTiGxvZBJ29pXiraj6OL+Z7WYdh3GqdHwKSRLPspSzReHmfzMu3J0g
 csXTgvAVdTvpan21+vvQfA7pH+QlcJRs3zyU6AOFVs1/RNEh9ZmYEQBaSok8UhQLlv
 z9NZwahl+ZpbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.14 14/40] drm/amdkfd: handle svm migrate init error
Date: Tue, 28 Sep 2021 01:54:58 -0400
Message-Id: <20210928055524.172051-14-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928055524.172051-1-sashal@kernel.org>
References: <20210928055524.172051-1-sashal@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 7d6687200a939176847090bbde5cb79a82792a2f ]

If svm migration init failed to create pgmap for device memory, set
pgmap type to 0 to disable device SVM support capability.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index dab290a4d19d..165e0ebb619d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -894,6 +894,9 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
+
+		/* Disable SVM support capability */
+		pgmap->type = 0;
 		devm_release_mem_region(adev->dev, res->start,
 					res->end - res->start + 1);
 		return PTR_ERR(r);
-- 
2.33.0

