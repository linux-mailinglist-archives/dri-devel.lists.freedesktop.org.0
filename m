Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A400A66E43
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85610E1EC;
	Tue, 18 Mar 2025 08:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C6iahaJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888B910E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:31:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 762695C5844;
 Tue, 18 Mar 2025 08:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0604AC4CEDD;
 Tue, 18 Mar 2025 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742286695;
 bh=F4ufPEdkMCW4h084hlGUoc9xbvGlZkK0roqYJfiPmSg=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=C6iahaJa/g/cW7NRLaycSIrSj2YPduoiCgv7JEVyGeRLl6ZOZI5wg4swIxU8ho28y
 hZqRzCzlV2HwYDChklEaQYcqcVduyM4ERB9CzWYP6807s9FObjfhAX0DTfC1cNyW1Y
 lxy1CXwTk4tZkBsiuhst46PJMlqzu707UMzCuKD4Am8hAc45IlliS65PdagFYzkXv8
 hx2RJOYAR/bNoaKWHYDO9kTFQ8RH6QPj/6w6eYSYQ9zkSiPSbXJlH6dLcaxYvYCKy/
 5mZR/eWwgxg7hW3H7qpXVQFGX3rZLv/Rc6dYe8A5kcd5UCB2b2wyOJ3frkRQI686zW
 SJPSpla6OdHWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E6C34C282EC;
 Tue, 18 Mar 2025 08:31:34 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH RESEND 0/3] drm/bridge: it6505: fix DP link traning and
 improve compatibility
Date: Tue, 18 Mar 2025 16:32:08 +0800
Message-Id: <20250318-fix-link-training-v1-0-19266711142c@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742286741; l=978;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=F4ufPEdkMCW4h084hlGUoc9xbvGlZkK0roqYJfiPmSg=;
 b=i6LuwKIo0Z3uKz2VsZ1vNownlik5hHUj/56aGdTUSDfohorbjXi4NKMY+Csqr3qS09Vc7KTPI
 cF8NdKJGKzoCyiFu9yLkng4PdxNfIWdLap9yrimfOGu+avjC4UHGueZ
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


