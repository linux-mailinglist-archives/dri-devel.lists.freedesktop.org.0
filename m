Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953BA540787
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790010F13E;
	Tue,  7 Jun 2022 17:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0467F10F0E7;
 Tue,  7 Jun 2022 17:51:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72E2CB82368;
 Tue,  7 Jun 2022 17:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01635C3411C;
 Tue,  7 Jun 2022 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624316;
 bh=i2gqG+rvriNRy8tZ4tU5UoL257WJO3AT0OxukhJJBOo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CcV+WVGw7eoflsK8QJSxNLGjpx7bk/n/YlpGXXAJxpdxbaTlbyWu0/vFEUEMTbdRd
 BAAeX6THOSxpSnA91G4qyxI7tzwHUM/s4WOR8g7HoymrMwmnMm8EJEhqKMZClpDkDb
 xe06AWFkUp76NTJ6xLSSr9vOAtuy/v6gthljhGGT231WTLXT8eZkkOmslRrpLXl8pi
 ZfbnArrK51PhCGMq9QhDvlILYlUhBxAFsbvbFlX1jClpXC+I8Ikl9w5JooRVrK0dl1
 WEu3acCPBCwLCBHLz8Lw/QHLYTvajRDs3xZ3h8/Ak2cPglpYcJACDJAyqAo5yCeUGK
 PEHzoOkjCIEEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 48/68] drm/amd/pm: fix a potential
 gpu_metrics_table memory leak
Date: Tue,  7 Jun 2022 13:48:14 -0400
Message-Id: <20220607174846.477972-48-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607174846.477972-1-sashal@kernel.org>
References: <20220607174846.477972-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, sathishkumar.sundararaju@amd.com,
 lijo.lazar@amd.com, Xiaomeng.Hou@amd.com, yifan1.zhang@amd.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 aaron.liu@amd.com, amd-gfx@lists.freedesktop.org,
 Gong Yuanjun <ruc_gongyuanjun@163.com>, ray.huang@amd.com,
 mario.limonciello@amd.com, Perry.Yuan@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com
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
index e2d099409123..c66c39ccf19c 100644
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

