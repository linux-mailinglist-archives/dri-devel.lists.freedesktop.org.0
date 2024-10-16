Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A143A9A032F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 09:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B427910E6A9;
	Wed, 16 Oct 2024 07:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I9t2ekzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E5D10E6AA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 07:54:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E2423A416F6;
 Wed, 16 Oct 2024 07:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81E87C4CED0;
 Wed, 16 Oct 2024 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729065252;
 bh=byUvTUmBe3ucrhmaZKyE7qNvMWkXkPLvh0ygtdtnhrY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=I9t2ekzgFTdNaqnvl6XkfL1A9w82D6mPPCMsEhDaxJ6S3PuysprdfCfSzbdQIWD1c
 CsIe/SxM2arR2ftULtzWW0XT5JZAnXrmuq3u+UGzTjaqyKGYNjFBBaaoGCyTOqaW58
 +67ohwYq56c2qgxhZf1Dpg9WZc7vAWvxrCOacyVfscUoDXPOrAJ5Qf6JA0E1eVD705
 Ti8qCKC70xxxZKhlLW0qf4JZnHssYT89xxCPUUkIJp+jYyaDz4G0d2LrbHy5tu1HKj
 oD7madnZbf4Qd3cx90Kg9I12r1fqRQiQZH5HgIVwQni2sdQwWiDYQr0mnzLuRbWRU8
 jf7ODSQZyKdDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 784ADD20684;
 Wed, 16 Oct 2024 07:54:12 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 16 Oct 2024 15:54:14 +0800
Subject: [PATCH v6 02/10] drm/bridge: it6505: improve AUX operation for
 edid read
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-upstream-v6-v6-2-4d93a0c46de1@ite.com.tw>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
In-Reply-To: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729065263; l=1471;
 i=Hermes.wu@ite.com.tw; s=20241016; h=from:subject:message-id;
 bh=DsF7JOpVrJV3KlaD250GuWi9WoMmd/kBUwDp0jcn0es=;
 b=QsZmTaceZO+ah8EObq3Tqo04UxLpfWswspNydQZGRfnY4isMz45zI9fWxFm0UrWAqfCsk83y6
 7ePoxjJKBGqB8mf0ruv1m0C+TpLatDwpk3XrGL1xCItHSSnQRmhcd0p
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=kV18uQEXox+1WccdQceCbMlJKN+BBNUk3N8VsoULcQ0=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241016 with
 auth_id=250
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

From: Hermes Wu <Hermes.wu@ite.com.tw>

The original AUX operation using data registers is limited to 4 bytes.
The AUX operation command CMD_AUX_I2C_EDID_READ uses AUX FIFO and
is capable of reading 16 bytes.
This improves the speed of EDID read.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
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


