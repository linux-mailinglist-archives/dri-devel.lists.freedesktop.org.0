Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C1B58CFC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 06:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B265610E641;
	Tue, 16 Sep 2025 04:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QU+GA/Pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39810E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:47:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1BD1B60054;
 Tue, 16 Sep 2025 04:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5F74C4CEEB;
 Tue, 16 Sep 2025 04:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757998063;
 bh=LP3b15IRlpCPLwb6oO8pnHVW44JCkcP1KqMqvoLVt8A=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=QU+GA/PlQHoG9D65VhVX9TlDhqmVA96dbRbOAzW6SSeieRGMwI9b7WVfkCaGoFrwp
 T7kzeznVQts0FL0aL69c99fYcE+V0dey5/9N05lOXzMm3HurWfUIHvkjrL9w2P+6zS
 gDH7HmPXUs6D3o8KOo/iJfwWoG/5ZyisiKQs3c+rhxZFdPHVe2ffdARDBzvUgaJVLY
 pvQwe3agTaL55WqyAG9EaMkb6zWdLOO9ehfgjojRU/15kZHPxX1+XNPAayEObmyVTU
 4YGyci/w40rsJvLOQ0aTNmE66LQKUBGifzxlMFqCCugo3Jle9JkNHkuRq4NrrGsD6q
 PEbnxSCopOZvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A2E2DCAC599;
 Tue, 16 Sep 2025 04:47:43 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH RESEND v3 0/5] drm/bridge: it6505: fix DP link traning and
 improve compatibility
Date: Tue, 16 Sep 2025 12:47:40 +0800
Message-Id: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757998107; l=1714;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=LP3b15IRlpCPLwb6oO8pnHVW44JCkcP1KqMqvoLVt8A=;
 b=AP9xBVy4Grz/aaWoIY78wzRPgq9P8kI4GFBwrGRiPE2p0gfeigdEO+ikv7Do8ljHH5NenMOtY
 1Wgznl48EzJDl30wRvMgrNOZ5OkHExxKhu/XSARggoFHBcn/Y8tzEEN
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IT6505 supports HW auto link training which will write DPCD and check
training status automatically. Some DP device can not pass
HW auto link training and must set link training step by step.

when HW auto link training fail, it may trigger video FIFO error,
and link training process will reset to beginning, and never try
step training method.

Modify training method improve compatibility to these DP devices.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v3:
- Patch 1/5 : add commit message for detial about changes
- Patch 2/5 : fix lost variable struct device *dev;
- Patch 3/5 : keep changes and remove refactoring
- Patch 5/5 : merge condition "it6505->step_train_only" check form if condiction into for loop.
- Link to v2: https://lore.kernel.org/r/20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw

Changes in v2:
- 1. Split [PATCH 1/3] into 3 commits
- 2. Drop non necessary variable auto_ttrain_retry
- Link to v1: https://lore.kernel.org/all/20250318-fix-link-training-v1-0-19266711142c@ite.com.tw/

---
Hermes Wu (5):
      drm/bridge: it6505: fix link training state HW register reset
      drm/bridge: it6505: check INT_LINK_TRAIN_FAIL while link auto training
      drm/bridge: it6505: modify DP link auto training
      drm/bridge: it6505: modify DP link training work
      drm/bridge: it6505: skip auto training when previous try fail

 drivers/gpu/drm/bridge/ite-it6505.c | 88 +++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 38 deletions(-)
---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250121-fix-link-training-461495494655

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


