Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37CCF583B
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 21:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2413C10E40E;
	Mon,  5 Jan 2026 20:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cw1Y0U0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8151E10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 20:25:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38C5943288;
 Mon,  5 Jan 2026 20:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11E23C19422;
 Mon,  5 Jan 2026 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767644705;
 bh=O++W+XGALzh8MFUMgZfv9i2Z9xQlbx152lgCqyih+BQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=cw1Y0U0GH0buegMVh+JcBWk2hjLGpNShEgDEU6nQNeJU0bDAwsXL1OeSRWXMgl5CZ
 1fhuYXBb6ExrJj6ZvrjDBR41Yv8WZSMScYthfYigaZuVOZPJNeS1ekiwGEPczfAUlX
 XDsfpY85BBb4O5Wrqzj7gCXTcrUxcBS27X/qNdFcnoZzW5tPbfZ6o760Z9yVKDFCgv
 qrvftGw69RDzueJvbZ1MDJNADM8oEsTc68SlgNX0I/1nQgFh5J9x3SZILpUjst9izO
 E8w+MqcL5Y884JWZG9tno25lVJxqtd7FMUOVi10u4SEUsrNIr4Iqli8pkzpkHISU6G
 e0qRvj6WQG4dQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F358BCCF2C2;
 Mon,  5 Jan 2026 20:25:04 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay
 <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 21:24:40 +0100
Subject: [PATCH 1/5] drm/panel: mantix: Enable DSI LPM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-mantix-halo-fixes-v1-1-1ebc9b195a34@puri.sm>
References: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
In-Reply-To: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=ranr7EXhYO2dHs5BA4aYCo8Op/vp1BIUidKU26E9D+M=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXB4fO3h3CtAiFssxXnaLfy8p9UQeh2skVa7wq
 Pw6PiGUgfSJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVweHwAKCRDo8jXPO9vD
 /36nD/9ZEHP3wwbu7iRj/w4bPjdu7Akmd9Wsay+D5b/l4rEdvqdzdG1b7nbixPCPiO8vhHvyPBz
 385E/llSqbZjaK2J3SI5gZSHJ4gswJxTFjTktedOgvPFv4fZcHvFT4aqX8PA+EDo17bJOtMyOfV
 ExZ1xI8hw+Ot3ZPKS3f8yiFOYHskYv8M3OUt7ZJtLNXR0Ba5nL4e11wsA2zHLlyU7EgObCqZx5n
 VrYgQ4PKZST6jog3aM3aTacUNuJPD74zlW1FB116vrznUt0ikOoj6GMGWgyJ1SdLwMm6w8NliUP
 yybleFHCqTV1yL7Vz20/87thgnZv8E1Gwy5/QENfuCXC5XbSd+n+f65YdmP1heaFnNxaK7aYR4T
 hkXbH/P1UWA6m62Y38yzSK7qXUJhnN91P+6bO3ZBTLTNTha8kbtaKlBueW4p/6M75fq3+LE+djA
 DvMlL4k5eN7Q7YVLqUzoEvNvUaz0Hfq12y8RZ/kW/hYf1BtbN77+DIKtTJpAKpollaIHOD/45gL
 0OordlYds5ZIcga/3aXMCkeosBRpyMn7g2OO58xVqMDQNYxB3fhRcSVKc7cMpIk6IBnQCnkmvar
 WI+XRAy3oQ2qopxSx+3mtR5eL6pwZu6YUtWG8Zj8D+VvsihDqWNUcIa84B7Dq1/4ekLgQN2ZKbf
 hMJ8SPtJeBNliFw==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
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
Reply-To: sebastian.krzyszkowiak@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

This improves reliability of sending DSI commands.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 55664f5d5aa5..fafd80f3e952 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -258,7 +258,7 @@ static int mantix_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
 		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 
 	ctx->avdd = devm_regulator_get(dev, "avdd");

-- 
2.52.0


