Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A916148AE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 12:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B1610E389;
	Tue,  1 Nov 2022 11:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9410E380;
 Tue,  1 Nov 2022 11:28:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3B97615E1;
 Tue,  1 Nov 2022 11:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4C0C433C1;
 Tue,  1 Nov 2022 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667302127;
 bh=xdh7G/bIiGGJA9u5xFJF/ax3tcZiKlc8bZPavpkA3MQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MToXO5PCTAOpwruuD+MifybG+/kXXHpi0H+DgudD695IGxp/aVeW3AXAmswM/Obuc
 nXX3M1NAOeuwzmX+M6s4itp66gWM8oKj0cUEWw4u0ISyP6WcsrbYFEtQhcr+7LIetX
 gmz6hwN1lv5rjBTPaClLiGa1Z+QP4vKlbTTTI7OcMgT+LV35WImj1MVN/3OAcSpTRI
 iwcVMmGcFSMf1wEpX1k+RYNM8vBd/lHHPx7/g3HaXkDgXB4IC+jhV4ADyQghkw8QJC
 jh9PLn2BlS74GqMW4N62JZQBjld9xy9TGxnyItryT9ywdR6InlsqK1KZmpZmsMAyYK
 ALghC+3A/BQKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 27/34] drm/amd/pm: skip loading pptable from
 driver on secure board for smu_v13_0_10
Date: Tue,  1 Nov 2022 07:27:19 -0400
Message-Id: <20221101112726.799368-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112726.799368-1-sashal@kernel.org>
References: <20221101112726.799368-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tim.huang@amd.com, lijo.lazar@amd.com,
 Guan Yu <Guan.Yu@amd.com>, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 tao.zhou1@amd.com, amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 Kenneth Feng <kenneth.feng@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kenneth Feng <kenneth.feng@amd.com>

[ Upstream commit f700486cd1f2bf381671d1c2c7dc9000db10c50e ]

skip loading pptable from driver on secure board since it's loaded from psp.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Guan Yu <Guan.Yu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 93f9b8377539..750d8da84fac 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -210,7 +210,8 @@ int smu_v13_0_init_pptable_microcode(struct smu_context *smu)
 		return 0;
 
 	if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 7)) ||
-	    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 0)))
+	    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 0)) ||
+	    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 10)))
 		return 0;
 
 	/* override pptable_id from driver parameter */
-- 
2.35.1

