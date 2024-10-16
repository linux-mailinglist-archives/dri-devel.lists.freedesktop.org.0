Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A789A0337
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 09:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FB110E6B3;
	Wed, 16 Oct 2024 07:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fVDvWBAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFDB10E6AC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 07:54:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3CE84A429BF;
 Wed, 16 Oct 2024 07:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3123C4CECE;
 Wed, 16 Oct 2024 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729065252;
 bh=3/AamiyrIYhBdVOlu9ElIgKN5r16P+kbe+BSQtba8g4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=fVDvWBAmL9lqeIoSYZ8MvKNQhDaBIIm0guy62aZ1Zb4+LGNBNHS9BsagTOge+A4Dt
 2Te0bUV7pdyk4lz/JqdFEZp7R7wAMSOQwwc7sE0200CWYXIgN5bp5agOhIL23glNac
 h1HzZbtOZVm06/+FM22EZvli9NjVqZbSjcA5HVRsTWmAhijZRFsA350GmlbFHlUHQd
 SpXCWocv/Fb2e0YceiinLeDDuGm1s2QVaFFOL6W8zjHh9h4Q03rMabEGYeQj2gzC3S
 CoQJE+VwOqIgpEToP5KNYcAxV4MOYvCgrcllsTH+3o3x32CyzwXkmUeO67zJCeL2Pq
 Aa532HNfS7tNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CB8FFD206AB;
 Wed, 16 Oct 2024 07:54:12 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 16 Oct 2024 15:54:19 +0800
Subject: [PATCH v6 07/10] drm/bridge: it6505: fix HDCP CTS KSV list read
 with UNIGRAF DPR-100.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-upstream-v6-v6-7-4d93a0c46de1@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729065263; l=2956;
 i=Hermes.wu@ite.com.tw; s=20241016; h=from:subject:message-id;
 bh=+V21HG3VVxkOkslhvoDICqbbbWGD4xtrVrwwYpVZ5VE=;
 b=0bKDdOl3LcNCuPrzr4p1kkdxq7KZQG4I1H1BzDtHfhPR2nD+NFLiVuiQb+qzFMAjKnbqmH28M
 YPTcqnQby4uAdmjfHNJlcKglRmPOI4cSYu5wwYgZ0pkqyzu2/BAC2Oy
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

When running the HDCP CTS test with UNIGRAF DPR-100.
KSV list must be read from DP_AUX_HDCP_KSV_FIFO in an AUX request,
and can not separate with multiple read requests.

The AUX operation command "CMD_AUX_GET_KSV_LIST" reads the KSV list
with AUX FIFO and is able to read DP_AUX_HDCP_KSV_FIFO in an AUX request.

Add it6505_get_ksvlist() which uses CMD_AUX_GET_KSV_LIST operation
to read the KSV list.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 48 +++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 85626b49a048a1178676ed616130a522ca314152..40fb47f4954331d63681066fb3af19f0f57bb929 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1188,6 +1188,37 @@ static int it6505_get_edid_block(void *data, u8 *buf, unsigned int block,
 	return 0;
 }
 
+static int it6505_get_ksvlist(struct it6505 *it6505, u8 *buf, size_t len)
+{
+	struct device *dev = it6505->dev;
+	enum aux_cmd_reply reply;
+	int request_size, ret;
+	int i = 0;
+
+	do {
+		request_size = min_t(int, (int)len - i, 15);
+
+		ret = it6505_aux_do_transfer(it6505, CMD_AUX_GET_KSV_LIST,
+					     DP_AUX_HDCP_KSV_FIFO,
+					     buf + i, request_size, &reply);
+
+		DRM_DEV_DEBUG_DRIVER(dev, "request_size = %d, ret =%d", request_size, ret);
+		if (ret < 0)
+			return ret;
+
+		i += request_size;
+	} while (i < len);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "ksv read cnt = %d down_stream_cnt=%d ", i, i / 5);
+
+	for (i = 0 ; i < len; i += 5) {
+		DRM_DEV_DEBUG_DRIVER(dev, "ksv[%d] = %02X%02X%02X%02X%02X",
+				     i / 5, buf[i], buf[i + 1], buf[i + 2], buf[i + 3], buf[i + 4]);
+	}
+
+	return len;
+}
+
 static void it6505_variable_config(struct it6505 *it6505)
 {
 	it6505->link_rate_bw_code = HBR;
@@ -1969,7 +2000,7 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 {
 	struct device *dev = it6505->dev;
 	u8 binfo[2];
-	int down_stream_count, i, err, msg_count = 0;
+	int down_stream_count, err, msg_count = 0;
 
 	err = it6505_get_dpcd(it6505, DP_AUX_HDCP_BINFO, binfo,
 			      ARRAY_SIZE(binfo));
@@ -1994,18 +2025,11 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 			down_stream_count);
 		return 0;
 	}
+	err =  it6505_get_ksvlist(it6505, sha1_input, down_stream_count * 5);
+	if (err < 0)
+		return err;
 
-	for (i = 0; i < down_stream_count; i++) {
-		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_KSV_FIFO +
-				      (i % 3) * DRM_HDCP_KSV_LEN,
-				      sha1_input + msg_count,
-				      DRM_HDCP_KSV_LEN);
-
-		if (err < 0)
-			return err;
-
-		msg_count += 5;
-	}
+	msg_count += down_stream_count * 5;
 
 	it6505->hdcp_down_stream_count = down_stream_count;
 	sha1_input[msg_count++] = binfo[0];

-- 
2.34.1


