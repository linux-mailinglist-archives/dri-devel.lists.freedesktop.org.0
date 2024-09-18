Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596CB97B85F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 09:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8D510E090;
	Wed, 18 Sep 2024 07:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TiUelxl7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A2710E090;
 Wed, 18 Sep 2024 07:18:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 268B85C59B8;
 Wed, 18 Sep 2024 07:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4040C4CEC3;
 Wed, 18 Sep 2024 07:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726643882;
 bh=Y9jbd4JWFQB6z2sA5iWC4S4FUg6AOW2guJLi3l2dohY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TiUelxl7xtEQ2ZWSMgLoBN5lh7gFpTd/whJLm9+KQWphDIDiHsBtPoFlPSjc0m9oi
 3gYwcl34kVAMDQokyLDl3TH59bFq0k6vO4lo7fNB2QiAl5n9opSkkppaORbV9zRXpG
 RvhC19xj4RblcFkkXyWn7qhCjWEiU8lboen5aoJuGH6jNqRihAi1ikH+8g+63qxmnn
 cZJXdDCzUlX+2++Ce56lJlSFWjj4R9jtWupSoVRpOGBAsvh6uV5CwYM7crSYG0Er3E
 RaDdO1F5wVi8traFKW3k5cOaBcCRq0YJtGnAiqB3oGyHATztZsP0Bl1Zf/YBRaT51R
 /dqkUZi0MyX7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 evan.quan@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 3/3] drm/amd/pm: fix the pp_dpm_pcie issue on smu
 v14.0.2/3
Date: Wed, 18 Sep 2024 02:36:11 -0400
Message-ID: <20240918063614.238807-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240918063614.238807-1-sashal@kernel.org>
References: <20240918063614.238807-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.10
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

From: Kenneth Feng <kenneth.feng@amd.com>

[ Upstream commit 7a0982523cf3ff00f35b210fc3405c528a2ce7af ]

fix the pp_dpm_pcie issue on smu v14.0.2/3 as below:
0: 2.5GT/s, x4 250Mhz
1: 8.0GT/s, x4 616Mhz *
2: 8.0GT/s, x4 1143Mhz *
the middle level can be removed since it is always skipped on
smu v14.0.2/3

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit fedf6db3ea9dc5eda0b78cfbbb8f7a88b97e5b24)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
index 06b65159f7b4..33c7740dd50a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
@@ -672,6 +672,9 @@ static int smu_v14_0_2_set_default_dpm_table(struct smu_context *smu)
 		pcie_table->clk_freq[pcie_table->num_of_link_levels] =
 					skutable->LclkFreq[link_level];
 		pcie_table->num_of_link_levels++;
+
+		if (link_level == 0)
+			link_level++;
 	}
 
 	return 0;
-- 
2.43.0

