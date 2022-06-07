Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B839D540819
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDBE10EAD6;
	Tue,  7 Jun 2022 17:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6BE10EAD6;
 Tue,  7 Jun 2022 17:54:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4751761794;
 Tue,  7 Jun 2022 17:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3572FC3411F;
 Tue,  7 Jun 2022 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624492;
 bh=QPi9gTEDBtbnh4IrGry16SvcsyQzH/63P+jQ5n+dKRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LLnO8PqRPVONsHyNrgs5mT7Ts74FxlK9BfGBDsWsOpWUplIod8BjBdvzMxKB3qEs6
 8l9+enweCadTAKTy9Rjts73M/3TKJcPGvn0d5hGDcLvULWYt3qi1HgJkB2GmI+lSwR
 fOqul7cg1sn7sGlyou03WbDmHGWyNc9qWiPdT06vXCwEjwTQ7QzyLvT9Fv6Sa0gUFp
 G5R5i9nFv1Sw9XttaoTfMBGZSQ0uEyBZCYO1Yb/CxX+Kl/TPBWFT1fdeFDNn5bYsuo
 JaCROauYz+L2JAtkR8EcWgv80gRE5uXt1woIYBZLdvCy8gyAvDV01mctOuhWrZ6D7a
 A2PRwzUPXGocQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 43/60] drm/amd/pm: fix a potential
 gpu_metrics_table memory leak
Date: Tue,  7 Jun 2022 13:52:40 -0400
Message-Id: <20220607175259.478835-43-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175259.478835-1-sashal@kernel.org>
References: <20220607175259.478835-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Perry.Yuan@amd.com, lijo.lazar@amd.com,
 Xiaomeng.Hou@amd.com, yifan1.zhang@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, aaron.liu@amd.com,
 amd-gfx@lists.freedesktop.org, sathishkumar.sundararaju@amd.com,
 Gong Yuanjun <ruc_gongyuanjun@163.com>, ray.huang@amd.com,
 mario.limonciello@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gong Yuanjun <ruc_gongyuanjun@163.com>

[ Upstream commit d2f4460a3d9502513419f06cc376c7ade49d5753 ]

gpu_metrics_table is allocated in yellow_carp_init_smc_tables() but
not freed in yellow_carp_fini_smc_tables().

Signed-off-by: Gong Yuanjun <ruc_gongyuanjun@163.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
index 0bc84b709a93..6f7d123702bd 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
@@ -190,6 +190,9 @@ static int yellow_carp_fini_smc_tables(struct smu_context *smu)
 	kfree(smu_table->watermarks_table);
 	smu_table->watermarks_table = NULL;
 
+	kfree(smu_table->gpu_metrics_table);
+	smu_table->gpu_metrics_table = NULL;
+
 	return 0;
 }
 
-- 
2.35.1

