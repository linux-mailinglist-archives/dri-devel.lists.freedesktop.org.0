Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1357E2A3E91
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFE76EC35;
	Tue,  3 Nov 2020 08:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7834E6E117
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 18:11:48 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x13so11800014pfa.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jzo759JCs+hkUHmUzy4qjJVeDEpQ0Z+8FQ1fuouLDxk=;
 b=iM+1k0pNvwtiMNWorpVtBF56YOoUons7TDKNvWb9/49+hO/z5MNa2g6jO4ty5rCQkl
 SHabv0L6pAyz8Euh020kJZyWW5bC4LcLP+NYjyWo/zY+b5C3edtW8Ak2UOkQbREd0bDi
 9G1GtDPvDDdgybbXj15ZhSzSmCTQ9qMU8alzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jzo759JCs+hkUHmUzy4qjJVeDEpQ0Z+8FQ1fuouLDxk=;
 b=eXnbWh5mFzIZiglOghkrcqZd5MMXg33/pIV7WLNMxMVT5g8z+ke9inRHudVY3+KYRX
 Lsw/S5BmBGuT75LLQy+xO4uJSlt9Sgsv+occYVVfZk46W1rVACx9VkW+zMqu38qq71oE
 OB62sfB2jn8+noGnqHVJlzWjH0bsa1BXP3qQiMgtdWTMsQEr4ClWI6T937kXgPe7gbsg
 lPPuBa33cJU2yYUth46zu60c8AKZKb7MWOUw3QdDhqPjZRyRBhv6pS8Z5nceWyH1tQfD
 JF5BRCaaj7WK4sp7TJFeMuESpR10mLy/NqZ1M+i8ARLU4F453ldB3Cs9t31QYSjr34R7
 n6AA==
X-Gm-Message-State: AOAM533/9NOljGZLm7VfOTAxaXxySNzJHB+y6rkrSa+Y2GcMTryNRm/b
 0/XryVlyKHdpNevBZXya/wJxmw==
X-Google-Smtp-Source: ABdhPJy5OcsMKElLBAN6aLLqJU5oBnQl6FCjXE5OLNRMXguBpYE6JEgrajDmOmQBzJ6sEwwftxxPbQ==
X-Received: by 2002:aa7:9207:0:b029:18a:ab6f:3a7a with SMTP id
 7-20020aa792070000b029018aab6f3a7amr11764734pfo.72.1604340708156; 
 Mon, 02 Nov 2020 10:11:48 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id b17sm13175640pgb.94.2020.11.02.10.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 10:11:47 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 1/4] drm/bridge: ti-sn65dsi86: Combine register accesses in
 ti_sn_aux_transfer()
Date: Mon,  2 Nov 2020 10:11:41 -0800
Message-Id: <20201102181144.3469197-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201102181144.3469197-1-swboyd@chromium.org>
References: <20201102181144.3469197-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These register reads and writes are sometimes directly next to each
other in the register address space. Let's use regmap bulk read/write
APIs to get the data with one transfer instead of multiple i2c
transfers. This helps cut down on the number of transfers in the case of
something like reading an EDID where we read in blocks of 16 bytes at a
time and the last for loop here is sending an i2c transfer for each of
those 16 bytes, one at a time. Ouch!

Changes in v3:
 - Undid changes in v2

Changes in v2:
 - Combined AUX_CMD register write

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 50 ++++++++++++---------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ecdf9b01340f..87726b9e446f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -17,6 +17,8 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include <asm/unaligned.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -72,6 +74,7 @@
 #define SN_AUX_ADDR_19_16_REG			0x74
 #define SN_AUX_ADDR_15_8_REG			0x75
 #define SN_AUX_ADDR_7_0_REG			0x76
+#define SN_AUX_ADDR_MASK			GENMASK(19, 0)
 #define SN_AUX_LENGTH_REG			0x77
 #define SN_AUX_CMD_REG				0x78
 #define  AUX_CMD_SEND				BIT(0)
@@ -841,11 +844,13 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	struct ti_sn_bridge *pdata = aux_to_ti_sn_bridge(aux);
 	u32 request = msg->request & ~DP_AUX_I2C_MOT;
 	u32 request_val = AUX_CMD_REQ(msg->request);
-	u8 *buf = (u8 *)msg->buffer;
+	u8 *buf = msg->buffer;
+	unsigned int len = msg->size;
 	unsigned int val;
-	int ret, i;
+	int ret;
+	u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];
 
-	if (msg->size > SN_AUX_MAX_PAYLOAD_BYTES)
+	if (len > SN_AUX_MAX_PAYLOAD_BYTES)
 		return -EINVAL;
 
 	switch (request) {
@@ -859,19 +864,14 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 		return -EINVAL;
 	}
 
-	regmap_write(pdata->regmap, SN_AUX_ADDR_19_16_REG,
-		     (msg->address >> 16) & 0xF);
-	regmap_write(pdata->regmap, SN_AUX_ADDR_15_8_REG,
-		     (msg->address >> 8) & 0xFF);
-	regmap_write(pdata->regmap, SN_AUX_ADDR_7_0_REG, msg->address & 0xFF);
-
-	regmap_write(pdata->regmap, SN_AUX_LENGTH_REG, msg->size);
+	BUILD_BUG_ON(sizeof(addr_len) != sizeof(__be32));
+	put_unaligned_be32((msg->address & SN_AUX_ADDR_MASK) << 8 | len,
+			   addr_len);
+	regmap_bulk_write(pdata->regmap, SN_AUX_ADDR_19_16_REG, addr_len,
+			  ARRAY_SIZE(addr_len));
 
-	if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE) {
-		for (i = 0; i < msg->size; i++)
-			regmap_write(pdata->regmap, SN_AUX_WDATA_REG(i),
-				     buf[i]);
-	}
+	if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE)
+		regmap_bulk_write(pdata->regmap, SN_AUX_WDATA_REG(0), buf, len);
 
 	/* Clear old status bits before start so we don't get confused */
 	regmap_write(pdata->regmap, SN_AUX_CMD_STATUS_REG,
@@ -895,21 +895,15 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 		 || (val & AUX_IRQ_STATUS_AUX_SHORT))
 		return -ENXIO;
 
-	if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE)
-		return msg->size;
+	if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE ||
+	    len == 0)
+		return len;
 
-	for (i = 0; i < msg->size; i++) {
-		unsigned int val;
-		ret = regmap_read(pdata->regmap, SN_AUX_RDATA_REG(i),
-				  &val);
-		if (ret)
-			return ret;
-
-		WARN_ON(val & ~0xFF);
-		buf[i] = (u8)(val & 0xFF);
-	}
+	ret = regmap_bulk_read(pdata->regmap, SN_AUX_RDATA_REG(0), buf, len);
+	if (ret)
+		return ret;
 
-	return msg->size;
+	return len;
 }
 
 static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
