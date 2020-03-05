Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C906617AB63
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 18:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07856E36F;
	Thu,  5 Mar 2020 17:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25316E36F;
 Thu,  5 Mar 2020 17:14:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D379220870;
 Thu,  5 Mar 2020 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583428445;
 bh=qWd20iwAOFru1dkdrmNhZZetuO5TaElp0urtUJVUjOk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QW/vC0i71QL21BPfYO4tDVPWr4eSznLYsDGhGDmoSJdUj5+4ckzte+j1wrGIJpvXN
 5SKa+rwfFqa6GCoq8hsgzs5oY26Bn8mY5E++nZdlEHWnVwOT8ZHz7Ro2YQGlYBE/Me
 fD2BqX8sjHd1lvTOnN8NhgCNF/2XCJ/7ogjPEF7Y=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 41/67] drm/amdgpu: fix memory leak during TDR
 test(v2)
Date: Thu,  5 Mar 2020 12:12:42 -0500
Message-Id: <20200305171309.29118-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305171309.29118-1-sashal@kernel.org>
References: <20200305171309.29118-1-sashal@kernel.org>
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
index 8b13d18c6414c..e4149e6b68b39 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -948,8 +948,12 @@ int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
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
