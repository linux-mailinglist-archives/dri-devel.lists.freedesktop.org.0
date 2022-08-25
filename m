Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EA65A05FA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF08CD0A9C;
	Thu, 25 Aug 2022 01:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CC4D0880;
 Thu, 25 Aug 2022 01:35:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 05F01CE245C;
 Thu, 25 Aug 2022 01:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85C5C433D6;
 Thu, 25 Aug 2022 01:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391324;
 bh=yCoyTheYT8qpcJ15sxdjnDuOVcCdfCqJTt4MqmhGzWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S1L/8UzH+I+Wz+Pr6Zcke5Gn/D4qdfENRDkIM8zC1S4DtMEjI2lpsF0o8/CkR8y4A
 6TZA/fCg/MLq64Ve1hP6TF1cszmaoqG6NzOc2vRvhefqBBHrr08h3MrOzqNNEUrIRT
 CtCPeE/+spSnGK1tlGeWVEdVbmr70Nx+vISOFi6LFeHYjrptIL2WpAN2NTmnVRhArc
 bDztCwWSBKGbkiN6Vp0iqCf9cas9R79TFsozinW58E7HbZgHFMZG2+xzN3lVJfBLnp
 JJUT1KubWZqvHVpiYq+JwRUkz90QQc1yH84JODCYkLVhdINW1B/v6mPOCn9XazDC/A
 DpG1NcPCCE/HQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 14/38] drm/amd/pm: Fix a potential
 gpu_metrics_table memory leak
Date: Wed, 24 Aug 2022 21:33:37 -0400
Message-Id: <20220825013401.22096-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tim.huang@amd.com, yifan1.zhang@amd.com,
 Zhen Ni <nizhen@uniontech.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie, Perry.Yuan@amd.com,
 ray.huang@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 lang.yu@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhen Ni <nizhen@uniontech.com>

[ Upstream commit 5afb76522a0af0513b6dc01f84128a73206b051b ]

Memory is allocated for gpu_metrics_table in
smu_v13_0_4_init_smc_tables(), but not freed in
smu_v13_0_4_fini_smc_tables(). This may cause memory leaks, fix it.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Zhen Ni <nizhen@uniontech.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
index 5a17b51aa0f9..7df360c25d51 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
@@ -190,6 +190,9 @@ static int smu_v13_0_4_fini_smc_tables(struct smu_context *smu)
 	kfree(smu_table->watermarks_table);
 	smu_table->watermarks_table = NULL;
 
+	kfree(smu_table->gpu_metrics_table);
+	smu_table->gpu_metrics_table = NULL;
+
 	return 0;
 }
 
-- 
2.35.1

