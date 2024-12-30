Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7929FE567
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 11:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8588410E490;
	Mon, 30 Dec 2024 10:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UDBm/QUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A412F10E100
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:51:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0F460A40BB5;
 Mon, 30 Dec 2024 10:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A387C4CEDC;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735555861;
 bh=SuDEzxxGQ/ta1asAIHNz3x/IkkoMDrKwg/H261/ZP48=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=UDBm/QUFIjxEi2jqR8C7cp9g+dB2e3jcCccjKyHletEsILSSl7paq4TtMN3NLCCUA
 TxtCYUot4K82rDGwJKWS46wfYSJUWaOywLvX0G47yq4fj4ldQoXhbCeUG1f5Cm5byT
 D5gdAOVaAdalZYCqm6OH010Cyw0gFMsSN6CfXQ8xS1jN4dLXMJgA2cjotVUntrOGrZ
 rUVen6PmLVUTNVEtL8A1h0bBHn1uNcbl9noF95MiZ89VNA/KjucXN6bLbZrN5RFB5s
 A7IhwszRxOasVyrEWwtsdpkn85rmNVvUz72RL7yuCVDshj2Vxy+fjnfNV1spS1a3s7
 aUHC+GNRwj2rA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2871FE77196;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
From: Hermes Wu via B4 Relay
 <devnull+Hermes.wu.ite.corp-partner.google.com@kernel.org>
Date: Mon, 30 Dec 2024 18:51:20 +0800
Subject: [PATCH RESEND v7 02/10] drm/bridge: it6505: improve AUX operation
 for edid read
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-v7-upstream-v7-2-e0fdd4844703@ite.corp-partner.google.com>
References: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
In-Reply-To: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735555881; l=1532;
 i=Hermes.wu@ite.corp-partner.google.com; s=20241230;
 h=from:subject:message-id;
 bh=32P1BrTFeT18E3yzyJHILz0Ri1zpfzlb6udBE3GEmSs=;
 b=2dZOs9x4YkiBzmjSloW0X5EYKRnmDxVT6KNWOTd0csrkFpovHUYqftrT8v6xm/Se7wUElWlMn
 edmRGtwPVIuDmZdQSf2TK7/QUA6xmSHVmqpZSchvaSYEzMU//pmU+Nt
X-Developer-Key: i=Hermes.wu@ite.corp-partner.google.com; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for
 Hermes.wu@ite.corp-partner.google.com/20241230 with auth_id=307
X-Original-From: Hermes Wu <Hermes.wu@ite.corp-partner.google.com>
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
Reply-To: Hermes.wu@ite.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

The original AUX operation using data registers is limited to 4 bytes.
The AUX operation command CMD_AUX_I2C_EDID_READ uses AUX FIFO and
is capable of reading 16 bytes.
This improves the speed of EDID read.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 3272ca6951f2585f9592834869de23ac50ce41a4..9747d7ccf435d536da55c6a3ff79e504b7c724f0 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1076,10 +1076,13 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
 				      size_t size, enum aux_cmd_reply *reply)
 {
 	int i, ret_size, ret = 0, request_size;
+	int fifo_max_size = (cmd == CMD_AUX_I2C_EDID_READ) ? AUX_FIFO_MAX_SIZE : 4;
 
 	mutex_lock(&it6505->aux_lock);
-	for (i = 0; i < size; i += 4) {
-		request_size = min((int)size - i, 4);
+	i = 0;
+	do {
+		request_size = min_t(int, (int)size - i, fifo_max_size);
+
 		ret_size = it6505_aux_operation(it6505, cmd, address + i,
 						buffer + i, request_size,
 						reply);
@@ -1088,8 +1091,9 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
 			goto aux_op_err;
 		}
 
+		i += request_size;
 		ret += ret_size;
-	}
+	} while (i < size);
 
 aux_op_err:
 	mutex_unlock(&it6505->aux_lock);

-- 
2.34.1


