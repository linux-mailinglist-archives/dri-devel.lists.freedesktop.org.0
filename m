Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8B77A7DD
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 17:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1217710E004;
	Sun, 13 Aug 2023 15:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48010E00E;
 Sun, 13 Aug 2023 15:52:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D4416329B;
 Sun, 13 Aug 2023 15:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4AEC433C7;
 Sun, 13 Aug 2023 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691941927;
 bh=s0QdHBomRFLyh8ndiu/Tmd6GY0v5OCbcJ9HPzEBj1mY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RBSLyBVI9FtUcPwJR1HLjfzbek+C6uG7/yfarRJ8ZzU5cI49UHg5+8MnWQPNlUvhe
 80D7S9LUEKCnQkgqXJVEHtqalXVYQSvnMdNAxPcggiyT7WlzFmTTehASZNCeuonIar
 6OhHXuSitH9j4kQyfwkfkJCgvF8Wn+0aEH8kJAy6kmukNWsHugw+L7lNkSeH1IHYC4
 N//F+Awf8euR7V80oVaFuZ7Adp0p4byPVDxvEee9zhelLkbS65hhjNbDrlnXdeUhKo
 vTjyCe6+mZWjbJVS03k3eOlTIfm2Ed03wTVAtfozVd73CrHCyALodH6Kqe6Yz7QEhx
 hK51wCHwFTeFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 42/54] drm/amd/smu: use AverageGfxclkFrequency* to
 replace previous GFX Curr Clock
Date: Sun, 13 Aug 2023 11:49:21 -0400
Message-Id: <20230813154934.1067569-42-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813154934.1067569-1-sashal@kernel.org>
References: <20230813154934.1067569-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.10
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com,
 Jane Jian <Jane.Jian@amd.com>, kenneth.feng@amd.com,
 Lijo Lazar <lijo.lazar@amd.com>, candice.li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Feifei.Xu@amd.com, Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jane Jian <Jane.Jian@amd.com>

[ Upstream commit 4a37c55b859a69f429bfa7fab4fc43ee470b60ed ]

Report current GFX clock also from average clock value as the original
CurrClock data is not valid/accurate any more as per FW team

Signed-off-by: Jane Jian <Jane.Jian@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 907cc43d16a90..7d284ee53818a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -1324,7 +1324,7 @@ static ssize_t smu_v13_0_0_get_gpu_metrics(struct smu_context *smu,
 	gpu_metrics->average_vclk1_frequency = metrics->AverageVclk1Frequency;
 	gpu_metrics->average_dclk1_frequency = metrics->AverageDclk1Frequency;
 
-	gpu_metrics->current_gfxclk = metrics->CurrClock[PPCLK_GFXCLK];
+	gpu_metrics->current_gfxclk = gpu_metrics->average_gfxclk_frequency;
 	gpu_metrics->current_socclk = metrics->CurrClock[PPCLK_SOCCLK];
 	gpu_metrics->current_uclk = metrics->CurrClock[PPCLK_UCLK];
 	gpu_metrics->current_vclk0 = metrics->CurrClock[PPCLK_VCLK_0];
-- 
2.40.1

