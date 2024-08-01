Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43499943BC2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819BC10E7EE;
	Thu,  1 Aug 2024 00:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y2AJvXXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5D710E7EE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 00:30:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB40762436;
 Thu,  1 Aug 2024 00:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261C7C4AF0E;
 Thu,  1 Aug 2024 00:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472223;
 bh=4chBwmMyJL7Qdbgbo8S62+JLT0K73J4i/DP2CuMYtqA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y2AJvXXiXd4VbP5NY4XvznF6lJI5XNtkL/J2RrV9kSmQ5aE/R4Cq6vP11AfYUA6Kt
 UB/QT7kHfKOR6oQHUJXFWRyJaAr2tYlLWcjBI04rhGx3WgEEYi2pht/PuCvXfl2m+X
 NxhWmqFNlaq4gHcFxQjaWi/XaPYoSIQDrOk/+SUOEmrv5h44nPFP+xyPEWBBvhrqdu
 YfrTcXQWRsgvnzolB/oAb6TdclM9NS+Oz4yP9RayRmiB8mhDEbel8aB8Ss1yoxxNNZ
 uYfL3hlkmx8oa/35svY8jDcAeHGs7zVo258j30G/pXgHDSyqcs3J1Tc+LnItf5saof
 Qz8xzwoFKpeyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Robert Foss <rfoss@kernel.org>,
 Sasha Levin <sashal@kernel.org>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 35/61] drm/bridge: tc358767: Check if fully
 initialized before signalling HPD event via IRQ
Date: Wed, 31 Jul 2024 20:25:53 -0400
Message-ID: <20240801002803.3935985-35-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002803.3935985-1-sashal@kernel.org>
References: <20240801002803.3935985-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
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

From: Marek Vasut <marex@denx.de>

[ Upstream commit 162e48cb1d84c2c966b649b8ac5c9d4f75f6d44f ]

Make sure the connector is fully initialized before signalling any
HPD events via drm_kms_helper_hotplug_event(), otherwise this may
lead to NULL pointer dereference.

Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Signed-off-by: Robert Foss <rfoss@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240531203333.277476-1-marex@denx.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 926ab5c3c31ab..0af2bd8706e44 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1841,7 +1841,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 		dev_err(tc->dev, "syserr %x\n", stat);
 	}
 
-	if (tc->hpd_pin >= 0 && tc->bridge.dev) {
+	if (tc->hpd_pin >= 0 && tc->bridge.dev && tc->aux.drm_dev) {
 		/*
 		 * H is triggered when the GPIO goes high.
 		 *
-- 
2.43.0

