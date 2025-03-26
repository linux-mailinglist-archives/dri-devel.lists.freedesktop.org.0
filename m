Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B0A7102B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 06:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E2410E652;
	Wed, 26 Mar 2025 05:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C2so4mAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1D610E651
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 05:33:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2FF3B6112F;
 Wed, 26 Mar 2025 05:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EFC7C4CEE2;
 Wed, 26 Mar 2025 05:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742967220;
 bh=oKGOdDgxhAqNZ5oSM5iv/OnF2CxCH6tBHGl2VSB8qc8=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=C2so4mAkFdfZgTI5w7njInHi+EKOorVmxjIdp7Hct9OFYaF1ypELS+A5Fzob4l8Kh
 kEOdyJ2TgGcDXjQDO3dr0Qhke8GJRE5TNaRkQARzcRgRqi+BDEQJRenX+tiVbBgRtg
 qDouualJKx+3zWupUGxx0BmUjlF+ZN5iYV/xv79ZXE0YS8x5X0RgDWYvgbHrXDjO9R
 L8uabB8y75rNU7h/XzekN2LBdOTbggT6sd9MsFzJYptQlSnHyUqi0v8J7kEq7BWt4k
 WxeRvdVPCVsdE6TwFES1C82dBjosHiOw9foFfbti4ZI3aYw9AVpQLLpNHqo69+xcTo
 gjQItjhgdXang==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F3BD5C28B30;
 Wed, 26 Mar 2025 05:33:39 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v2 0/5] drm/bridge: it6505: fix DP link traning and improve
 compatibility
Date: Wed, 26 Mar 2025 13:34:12 +0800
Message-Id: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANSR42cC/x2MQQqAIBAAvxJ7bkFFBftKdIjabCm20IhA+nvSc
 WBmCmRKTBm6pkCimzMfUsG0DUzrKJGQ58pglHFKG40LP7izbHilkYUlovXaBmeD9c5B7c5EVfq
 f/fC+Hwia3E9jAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742967277; l=1323;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=oKGOdDgxhAqNZ5oSM5iv/OnF2CxCH6tBHGl2VSB8qc8=;
 b=82T34WmCkdjj6qSV8M4kPQjRl4ckK8npAAKkeembaXRcV/OIg3QCR0QAJk84CiH5zcAZGx/sb
 J4byaM9Mb6DBdb5KWK618gl/kTW7KBxDq/QAvZeg0xYHlDbedTFttC7
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

v1 -> v2:
	1. Split [PATCH 1/3] into 3 commits
	2. Drop non necessary variable auto_ttrain_retry
	v1 link: https://lore.kernel.org/all/20250318-fix-link-training-v1-0-19266711142c@ite.com.tw/

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Hermes Wu (5):
      drm/bridge: it6505: fix link training state HW register reset
      drm/bridge: it6505: check INT_LINK_TRAIN_FAIL while link auto training
      drm/bridge: it6505: modify DP link auto training
      drm/bridge: it6505: modify DP link training work
      drm/bridge: it6505: skip auto training when previous try fail

 drivers/gpu/drm/bridge/ite-it6505.c | 112 +++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 47 deletions(-)
---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250121-fix-link-training-461495494655

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


