Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C548359C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F9289DE1;
	Mon,  3 Jan 2022 17:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BB989DD5;
 Mon,  3 Jan 2022 17:29:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85B18B80B4C;
 Mon,  3 Jan 2022 17:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688B4C36AEB;
 Mon,  3 Jan 2022 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641230953;
 bh=miwMnJgVOnR+9E9/tWDy+mlTU5eoEgWYT3bcqx54edA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nplP+ZcaX7xZ8JkUVpTvFFI0pPtcNxH78opvm7aBzShfLgb05tIjV6yjBocQwtE2H
 eFDbKg9Mbj6C0LEVjHytU5BMnCl7alvIilZq/n9WTm9F45lU/s62EFtDq2w+G9j5rd
 fo4JkQqEEg4cREPuoEJ3Con+jqHgqQBw6CBNaipZ1MCvgnPO2rP/Q+jr3jb2DXviPm
 9PikikKzkClkLu1C+xzZmWxbW6HXPyYz2kaSTJGP/LngyCTJY0rCLEICj0LEinbD8f
 2e8sTpME6dYCmO28Jqg2k2U54WnIqPcpWXbkI6d2h2SpRSWuqwnz9kkYE2xSvFafF9
 i7fWV+rGPhAdQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 03/16] drm/amd/pm: Fix xgmi link control on
 aldebaran
Date: Mon,  3 Jan 2022 12:28:36 -0500
Message-Id: <20220103172849.1612731-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103172849.1612731-1-sashal@kernel.org>
References: <20220103172849.1612731-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, kevin1.wang@amd.com,
 airlied@linux.ie, Feifei.Xu@amd.com, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 evan.quan@amd.com, john.clements@amd.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit 19e66d512e4182a0461530fa3159638e0f55d97e ]

Fix the message argument.
	0: Allow power down
	1: Disallow power down

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index 5019903db492a..c9cfeb094750d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1619,7 +1619,7 @@ static int aldebaran_allow_xgmi_power_down(struct smu_context *smu, bool en)
 {
 	return smu_cmn_send_smc_msg_with_param(smu,
 					       SMU_MSG_GmiPwrDnControl,
-					       en ? 1 : 0,
+					       en ? 0 : 1,
 					       NULL);
 }
 
-- 
2.34.1

