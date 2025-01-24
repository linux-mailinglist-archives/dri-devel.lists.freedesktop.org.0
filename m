Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876AA1AE8B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 03:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9650310E400;
	Fri, 24 Jan 2025 02:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uhF6VL7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBD710E05C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 02:29:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7F8F6A41613;
 Fri, 24 Jan 2025 02:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70293C4CED3;
 Fri, 24 Jan 2025 02:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737685764;
 bh=lkxo+9LVgxm6dhaHGk+NaX5zVVLdjBJs7FFXNg4RePk=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=uhF6VL7JX4MZ9Rvk+ILmReAPQYEWHmC+t4kXQ322KY1kkS5Dw89O3EAsKXWmP1rLl
 YIJ/TVhkO/IiQE2m2FPb+H6MqlbenShrHDbvGtWj7Fh09tmiHDr4SZSBEMzR4zCEKE
 dsFrUSz9CAnFXB+ytuSBO542RJN28Ge4C2O6WCj3nnb/yY06RyIDb35IgQzTQsMwkr
 6v9Ryg9nr/GeQ4oX0AhtZFe15z4NUfd5dI0GwyPopO5NDBoRtzUOAGbU22tFzV67ps
 G1Nr4w8waXdEa6dmGiYvWU9vDaumRCyiV+9MPVbDpHUoJNJCK0M5DX6bDo9+5qepvQ
 G1XqCXGUVF+xA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 523BCC02182;
 Fri, 24 Jan 2025 02:29:24 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH 0/3] drm/bridge: it6505: fix DP link traning and improve
 compatibility
Date: Fri, 24 Jan 2025 10:29:49 +0800
Message-Id: <20250124-fix-link-training-v1-0-09511050bb2c@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB37kmcC/x2MQQqAIBAAvxJ7biFFBftKdJDabCm20Igg/HvSc
 WBmXsiUmDL0zQuJbs58SAXVNjCtQSIhz5VBd9p2Sitc+MGdZcMrBRaWiMYp463xxlkLtTsTVel
 /DmMpH+7UTpBjAAAA
X-Change-ID: 20250121-fix-link-training-461495494655
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737685792; l=981;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=lkxo+9LVgxm6dhaHGk+NaX5zVVLdjBJs7FFXNg4RePk=;
 b=YhoywIYTs+NTolC/YyX01oo5IBV1HCVbm3ocMOHfnBlL5EoJ19rtp1w93+OXX6gkem6mrJEv+
 4bAYFEByIdjDLtB0DDeE/Hs3YES+mEqWMhmq9G+FYtHrmQbftX//uWc
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
Hermes Wu (3):
      drm/bridge: it6505: modify DP link auto training
      drm/bridge: it6505: modify DP link training work
      drm/bridge: it6505: skip auto training when previous try fail

 drivers/gpu/drm/bridge/ite-it6505.c | 106 ++++++++++++++++++++++--------------
 1 file changed, 66 insertions(+), 40 deletions(-)
---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250121-fix-link-training-461495494655

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


