Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3572D17AB7C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 18:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D3C6E364;
	Thu,  5 Mar 2020 17:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712F56E347;
 Thu,  5 Mar 2020 17:15:06 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 760B621744;
 Thu,  5 Mar 2020 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583428506;
 bh=5+O+YWwnsvBINmW4iAXC6psifakgha+pK7uZe9OAMiw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UvVQeF9IMDOlakia11hIqh2+QXBJs30CmO+dkNki5q18x8CmaHQyIyxpT9HXxyfQU
 p6nVLCNGlHr3tWdffbfCzVPx5SL1fSCHQu4Y103mc0CPvuIyCwWEwDvy+LN0D4H4DB
 au4aO5h7w8BwbUQqVk5rQdxy4kZSyG0hDlPlPOGw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 36/58] drm/amdgpu: fix memory leak during TDR
 test(v2)
Date: Thu,  5 Mar 2020 12:13:57 -0500
Message-Id: <20200305171420.29595-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305171420.29595-1-sashal@kernel.org>
References: <20200305171420.29595-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Monk Liu <Monk.Liu@amd.com>

[ Upstream commit 4829f89855f1d3a3d8014e74cceab51b421503db ]

fix system memory leak

v2:
fix coding style

Signed-off-by: Monk Liu <Monk.Liu@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
index c5257ae3188a3..0922d9cd858a0 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -988,8 +988,12 @@ static int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
 	struct smu_11_0_max_sustainable_clocks *max_sustainable_clocks;
 	int ret = 0;
 
-	max_sustainable_clocks = kzalloc(sizeof(struct smu_11_0_max_sustainable_clocks),
+	if (!smu->smu_table.max_sustainable_clocks)
+		max_sustainable_clocks = kzalloc(sizeof(struct smu_11_0_max_sustainable_clocks),
 					 GFP_KERNEL);
+	else
+		max_sustainable_clocks = smu->smu_table.max_sustainable_clocks;
+
 	smu->smu_table.max_sustainable_clocks = (void *)max_sustainable_clocks;
 
 	max_sustainable_clocks->uclock = smu->smu_table.boot_values.uclk / 100;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
