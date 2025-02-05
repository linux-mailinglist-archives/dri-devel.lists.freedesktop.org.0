Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530A3A28490
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 07:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A31F10E083;
	Wed,  5 Feb 2025 06:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oidpstfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83E510E083
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 06:40:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 984F9A426FF;
 Wed,  5 Feb 2025 06:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5626BC4CED1;
 Wed,  5 Feb 2025 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738737634;
 bh=gGvYZ6oXvm9dTs3/vqawO1m498fxu7l1N6ATj9ZnzCQ=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=oidpstfcT89mqG/kWnY+3GkxmjjhzlsfDDYFeYKQ/DPMRADlbU55sbAUnawc7fa39
 NiMxjEHvhGBZAh19Vbs4WfYig4uFdhfU9vu4vgZqkCYCFeYVadcYB1qvUTmlPVqP0E
 kuLwd7zYbAlMQDoDb7B4b07gpSLTX8Oj5ef7yLWPPCLhWy55rZLaoP270Wi3b234Pc
 nTR6Gcu4x7kIa8/4S75QAGXNdrSN2hlypGi6e1ngnJW75YXRR3r+CfY7aoiogXjIcf
 j/rSKmxTunEERB43mu4WgKJ9D88jMzCRGWDMxN1wgK11W2YdJvtKOQUvi34haVpgQs
 xBIQtI1BtAPzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8A3C02192;
 Wed,  5 Feb 2025 06:40:34 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v3 0/2] drm/bridge: it6505: add audio support with DRM HDMI
 codec framework
Date: Wed, 05 Feb 2025 14:41:02 +0800
Message-Id: <20250205-add-audio-codec-v3-0-26cfadb2d81f@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4Ho2cC/2XNyw6CMBCF4VchXVvSC1dXvodxUaaDzEJqWqwaw
 rtbiIkxLP+TzDczC+gJAztmM/MYKZAbU+hDxmAw4xU52dRMCVUKKQturOXmYclxcBaBN9Daoha
 VMhWwdHX32NNrE8+X1AOFyfn39iDKdf1aSu6sKLnkqPu+lp2GRrYnmjAHd8unJ1uxqH6AEnoPq
 ASU0ICtFWLZdX/AsiwfPFSDA/AAAAA=
X-Change-ID: 20250114-add-audio-codec-8c9d47062a6c
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: treapking@chromium.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738737663; l=1167;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=gGvYZ6oXvm9dTs3/vqawO1m498fxu7l1N6ATj9ZnzCQ=;
 b=l6pLDMUlMGqGOfQBULdVFZ/N+p9sCF1awqniFveTab/zyIbIrqqrNtBT+vpHS1QWQ7GOHDQFL
 BBTwhV+P3WFCEfi2hx9A2GQABDxd1gn6JPyRfS1a8u1txWOE/WV/OnB
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

For supporting audio form I2S to DP audio data sub stream.

Add hdmi_audio callbacks to drm_bridge_funcs for the HDMI codec 
framework.

The DRM_BRIDGE_OP_HDMI flag in bridge.ops must be set, 
and implement necessary callbacks for the drm_bridge_connector 
to enable the HDMI codec.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v3:
- Separate DRM_BRIDGE_OP_HDMI supports and audio callbacks into two commits.
- Link to v2: https://lore.kernel.org/r/20250203-add-audio-codec-v2-1-5c8cd72ee5bb@ite.com.tw

Changes in v2:
- Use DRM HDMI codec framewrok for audio stream setup.
- Link to v1: https://lore.kernel.org/r/20250121-add-audio-codec-v1-1-e3ff71b3c819@ite.com.tw

---
Hermes Wu (2):
      drm/bridge: it6505: add support DRM_BRIDGE_OP_HDMI to drm_bridge
      drm/bridge: it6505: add audio support to drm_bridge_funcs

 drivers/gpu/drm/bridge/ite-it6505.c | 231 +++++++++++++++++++++++++-----------
 1 file changed, 161 insertions(+), 70 deletions(-)
---
base-commit: fe003bcb69f7bff9ff2b30b659b004dbafe52907
change-id: 20250114-add-audio-codec-8c9d47062a6c

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


