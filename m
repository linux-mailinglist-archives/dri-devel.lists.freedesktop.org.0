Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36C0B948C6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 08:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4277110E56C;
	Tue, 23 Sep 2025 06:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I+ZhD3Pj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E95410E0A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 06:23:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 37D5760055;
 Tue, 23 Sep 2025 06:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6D27C4CEF5;
 Tue, 23 Sep 2025 06:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758608598;
 bh=9oATPAFMFbNOY3q+HNbanR09rpolCzA8waFpW+Uyp0g=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=I+ZhD3PjIzP0esbDsGIiRFvW5QHgYK/J6WaTeWJZ9QLSvlyHyhUwCPqlZMjMe9WAc
 5fdyZ836v6F9Dx90jBUJRt6Qz5n6BO/ylaonhwsjOc644fsHpV85SmMx4bL7RV6MJU
 emr1qMt8z5WTiUN/l4R0SRMhfjS1k8SRSh6lkPM5k+SFttz5FSiw/+QptnMrzjkJCl
 F+zhBMtAlY12708SxHC5d1txfig57psKT0iITeGX8RmFrXZ5BOFT17C75fM0fv/Rsk
 AgXk7zLXJ5TmsAYHRxsPQkqBmcN5N3xB0NYxMxOUwR3obJJgTKJ9QAeDxbqPOJlW7j
 tTBCs2Lg4MswQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C21EECAC5AC;
 Tue, 23 Sep 2025 06:23:18 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v4 0/4] drm/bridge: it6505: fix DP link traning and improve
 compatibility
Date: Tue, 23 Sep 2025 14:23:40 +0800
Message-Id: <20250923-fix-link-training-v4-0-7c18f5d3891e@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOw80mgC/23OTQ6CMBAF4KuYri0Z+ge48h7GBdQWJmoxbVM1h
 LtbcGFMWL7JvG9mIsF4NIEcdhPxJmHA0eUg9juih9b1huIlZ8KASShZSS2+6A3dlUbfokPXU6F
 K0UjRCCUlyb2HN3lpNU/nnAcMcfTv9URiy/SrcaY2tMQo0EoqXXNQVgIcMZpCj/ciPsnCJf4jB
 Gw9lPhCWAWWtV3V1fqPmOf5A6rX9Ar2AAAA
X-Change-ID: 20250121-fix-link-training-461495494655
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Allen Chen <allen.chen@ite.com.tw>, Hermes Wu <hermes.wu@ite.com.tw>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758608643; l=1902;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=9oATPAFMFbNOY3q+HNbanR09rpolCzA8waFpW+Uyp0g=;
 b=wHIq8EUBuZOvVR4jV7Es/0lJD6k2t6JNy6Vk2Ab7mjFsM1+Jt1PJyn+Hp1LJp+rakpU4QTRpt
 Ff6aNwR3yKBBGow22VDh/zuYWbvdBkY/mVC+JSSZ6qgWSjeAGqFcV8P
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
Changes in v4:
- squash patch 2/5 and 3/5, which do two different error check in same
  palce.
- edit commit message that warp at 70-77 boundary
- Link to v3: https://lore.kernel.org/r/20250401-fix-link-training-v3-0-7f60f2ab7b8c@ite.com.tw

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
Hermes Wu (4):
      drm/bridge: it6505: fix link training state HW register reset
      drm/bridge: it6505: add INT status check  while link auto training
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


