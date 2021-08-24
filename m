Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E683F545F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 02:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3179F89D44;
	Tue, 24 Aug 2021 00:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8702489D44;
 Tue, 24 Aug 2021 00:54:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 766896141B;
 Tue, 24 Aug 2021 00:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766487;
 bh=XFi6cA/Q/hPW4JHtHpkD+8ah60OgiCKtUl0ylHe1CM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LMQzftsOdidQ/N7ygIF/Cj+gdxKpXWIJvLY0k2+K48xfsoDPk4a5sVgmKLl9ZR9mR
 UF3oLRMf4MIcdH96n0MvHpKFCsDilhps4n87xx6q5/qh5Bz/szfN3q0NY3p23DcvE5
 x+iJIG33BiN7y6mE/g9hRmZqCVe/PycxmeXJYqcuCz9MAc2TxeUcdwNE92N44TUrdG
 6uG5Xk8IDO7wCFOunS1B9XtMZVpsbCu0G9sXanFxQH0Dd6Izr/JQ+WnH/k2GTOlJyM
 V8lnpIjdoTBSV3TSpMYKZbxh68dhBLBlMXcuzwsf4y2ETRjMWpnWdX4En0qosBpQYL
 r1Mc8lY7dSn7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 11/18] Revert "drm/amd/pm: fix workload mismatch
 on vega10"
Date: Mon, 23 Aug 2021 20:54:25 -0400
Message-Id: <20210824005432.631154-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005432.631154-1-sashal@kernel.org>
References: <20210824005432.631154-1-sashal@kernel.org>
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

From: Kenneth Feng <kenneth.feng@amd.com>

[ Upstream commit 2fd31689f9e44af949f60ff4f8aca013e628ab81 ]

This reverts commit 0979d43259e13846d86ba17e451e17fec185d240.
Revert this because it does not apply to all the cards.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 132c269c7c89..ed4eafc744d3 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -5159,7 +5159,7 @@ static int vega10_set_power_profile_mode(struct pp_hwmgr *hwmgr, long *input, ui
 
 out:
 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetWorkloadMask,
-						(!power_profile_mode) ? 0 : 1 << (power_profile_mode - 1),
+						1 << power_profile_mode,
 						NULL);
 	hwmgr->power_profile_mode = power_profile_mode;
 
-- 
2.30.2

