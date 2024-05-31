Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C5F8D6AE2
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C315910E38E;
	Fri, 31 May 2024 20:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s09IE9TH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27EC10E35B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:37:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0B1A2CE1A9F;
 Fri, 31 May 2024 20:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C342C116B1;
 Fri, 31 May 2024 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717187866;
 bh=3TZNScVbrXSoesw2SWXp2AE9mBMjCfX0SRtPx+bRQhs=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=s09IE9TH7+7NX4fGYwfR697ra4WjhBGjhumR15erT2ntA3kBRBxfo8cwZBp9izirt
 rLPvAZ75ChCKH6G4Dh2hC33YUb08V5Q+LHgXn3Za+QLufN0UoGRIUHCKQKIQboF+5Z
 OJ6enNV/jsSDVMUDATB9Unothn2vdobk2AUPDeE9fLvjDwfXAH8bdDVV2Pq3M7y9Z+
 c2NSjSnwQhP9I6c/wTlfPOM/hIgC3fOykjWtuh/0M/hjlsh/ER8YdvUIMOIBRYthcA
 Fk2XwDSoIZYhctH1hKcW1iP5zuc3Ug7sF/bCs84AFLV5o1sL5mWhnMNTTvdl2qWT9e
 04IEI24/H0NyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2319CC25B75;
 Fri, 31 May 2024 20:37:46 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Subject: [PATCH 0/2] drm bridge: drop drm_bridge_chain_mode_fixup.
Date: Fri, 31 May 2024 22:37:44 +0200
Message-Id: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABg1WmYC/x2MUQqAIBAFrxL7nWBWoF0lIqp92X5koRBBdPekz
 2GYeSghChJ1xUMRlyQ5QoaqLGjZpuChhDOT0abRbV2pOQp7jFlKGPeDoRzYtsbCmYUpd2fEKvf
 /7If3/QDT/D+mYwAAAA==
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717187864; l=888;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=3TZNScVbrXSoesw2SWXp2AE9mBMjCfX0SRtPx+bRQhs=;
 b=RJEgq3whBcLtGPUqO61RcGUeDm3zjIZl6CXwG2rw8fjT9OIY0boyiUXJaUSs/arIEDMtutVOk/RW
 0rYZJj4HBkh7CmMlGVs/q7tOwueKNcbyRkN/Pl8QH21RCSMlvz61
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I had a few bridge related patches in an old branch.

They were last posted here almost one year ago:
https://lore.kernel.org/dri-devel/20220717174454.46616-1-sam@ravnborg.org/

The following two patches gets rid of drm_bridge_chain_mode_fixup.
The patches was already rb / ab - but due to the age a repost is
due before applying the patches.

	Sam

---
Sam Ravnborg (2):
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup

 drivers/gpu/drm/drm_bridge.c        | 37 -------------------------------------
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 -----------
 include/drm/drm_bridge.h            |  3 ---
 3 files changed, 51 deletions(-)
---
base-commit: c9402efe492bb46ccbf94fedc4783eb8f8747567
change-id: 20240531-bridge_chain_mode-9ed8528e92cd

Best regards,
-- 
Sam Ravnborg <sam@ravnborg.org>


