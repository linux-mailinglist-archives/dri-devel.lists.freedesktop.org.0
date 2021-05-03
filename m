Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD50D3719B6
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0296F6E932;
	Mon,  3 May 2021 16:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4399D6E935;
 Mon,  3 May 2021 16:36:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 072FF613EB;
 Mon,  3 May 2021 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059796;
 bh=PMZe4y1Pv49clBBjyLBWLR9jo+5UWMwd1nvz/TZA390=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SRPv/P3skeNBVNLSzrVwMqfKoNXd6bFxYK1TC4Bg5IpuT4By6b/hk6i2wNLRsrAV/
 9IIHmMKru6Fx+pYdUbvF9ITB70BzJib7ROqTlp7HF6/0XRI1t3Cjf471CVW+qEIlzO
 u9pbHnAMu6cOPMTISy5J1SLy6P69BiswA8GGfM6xMLiKlL63ebKC83IZ1oYHZXjsLi
 L0RunjFMZf70bzZehKdgkI5tLAlZOM/8PZiEsOg/OpJsGUOwDsZCCloxtOQeNORyXW
 5PgSi1v6PY9Dq3qR1jA7SmJORSw9gzd+ClmUwzgEPxTtr3HRApXhsX+OKkZUs5NvhC
 gdFLSCq0bxg8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 053/134] drm/amd/pm: fix workload mismatch on
 vega10
Date: Mon,  3 May 2021 12:33:52 -0400
Message-Id: <20210503163513.2851510-53-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163513.2851510-1-sashal@kernel.org>
References: <20210503163513.2851510-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Wang <kevin1.wang@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kenneth Feng <kenneth.feng@amd.com>

[ Upstream commit 0979d43259e13846d86ba17e451e17fec185d240 ]

Workload number mapped to the correct one.
This issue is only on vega10.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 599ec9726601..959143eff651 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -5160,7 +5160,7 @@ static int vega10_set_power_profile_mode(struct pp_hwmgr *hwmgr, long *input, ui
 
 out:
 	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetWorkloadMask,
-						1 << power_profile_mode,
+						(!power_profile_mode) ? 0 : 1 << (power_profile_mode - 1),
 						NULL);
 	hwmgr->power_profile_mode = power_profile_mode;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
