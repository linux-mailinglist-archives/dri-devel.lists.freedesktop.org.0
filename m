Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3392A3E78
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B186EC1C;
	Tue,  3 Nov 2020 08:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A10C6E145
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 18:11:52 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id r10so11457452pgb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65bWdgXbJUHSY9klg8B4g7EQCn2RPfl2U/2hJDHKOAE=;
 b=U5rpbbu/Wrv4XZAFMnegfITISy/o8wRmSAZfJOKn2097owuIhcuSadcJxcjRhHssNw
 uWobnKuds82uuRwIxhpeoRAIUz/L2h8mFs0pBKxMQMw3/H0kbLH/uzvxxw0BdJvQxvgt
 ubiXu+AQ4Ylqn8AHKEJgXa96iJHyoSqCZU0rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65bWdgXbJUHSY9klg8B4g7EQCn2RPfl2U/2hJDHKOAE=;
 b=pR8R4OVnpMDV1l8+Y2gyQPUA75p2kvCR9Z4n4K9g8L8xCFyxhiDxgMMo+KeSwkvOBi
 9Yi/Y64igm8Y19i4l9zAVAXq+C8K+qHnqmjNSqrREfrDvdnYQ54lJLC17IySCr2XzAny
 2OBC31tq5BA4zGuP+Q+6QbFb3neucruIx163se5wirYbKa/pQRyQZmS0Ojv/shbxHrsv
 qR/xxiMhbQQqEiR9G8LtfaSJOanOmVBHUI3pnaOeeVD2nD9elRNMOKp+7gfZfj4y6OKj
 +JOb3vpWXRixjZgD2bXUtUUYejJeY3QjLdMZ1DWQKtfW1SV0UE90qa9YMDFcESDhDEJv
 /apg==
X-Gm-Message-State: AOAM531VXoWZTXmDrzqqt3m3FIgerHmDfWNrF+WSVimBBMMh/eixaKeE
 aPBwnfI9WXlgyTyHnNmryR+7uw==
X-Google-Smtp-Source: ABdhPJyiqLw//JRe3xdwfiASEB6IO86bTA3ip32CFqcGAv0wzGc0q3Li+IksqOKphIfp6NeiyysU1w==
X-Received: by 2002:a62:d44b:0:b029:162:67f0:3c56 with SMTP id
 u11-20020a62d44b0000b029016267f03c56mr22037823pfl.55.1604340711929; 
 Mon, 02 Nov 2020 10:11:51 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id b17sm13175640pgb.94.2020.11.02.10.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 10:11:51 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 4/4] drm/bridge: ti-sn65dsi86: Update reply on aux failures
Date: Mon,  2 Nov 2020 10:11:44 -0800
Message-Id: <20201102181144.3469197-5-swboyd@chromium.org>
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

We should be setting the drm_dp_aux_msg::reply field if a NACK or a
SHORT reply happens. Update the error bit handling logic in
ti_sn_aux_transfer() to handle these cases and notify upper layers that
such errors have happened. This helps the retry logic understand that a
timeout has happened, or to shorten the read length if the panel isn't
able to handle the longest read possible.

Note: I don't have any hardware that exhibits these code paths so this
is written based on reading the datasheet for this bridge and inspecting
the code and how this is called.

Changes in v2:
 - Move WRITE_STATUS_UPDATE check from case to assignment

Changes in v2:
 - Handle WRITE_STATUS_UPDATE properly

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 35 +++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6b6e98ca2881..3a758c706b70 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -861,7 +861,7 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 				  struct drm_dp_aux_msg *msg)
 {
 	struct ti_sn_bridge *pdata = aux_to_ti_sn_bridge(aux);
-	u32 request = msg->request & ~DP_AUX_I2C_MOT;
+	u32 request = msg->request & ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
 	u32 request_val = AUX_CMD_REQ(msg->request);
 	u8 *buf = msg->buffer;
 	unsigned int len = msg->size;
@@ -878,6 +878,8 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	case DP_AUX_NATIVE_READ:
 	case DP_AUX_I2C_READ:
 		regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val);
+		/* Assume it's good */
+		msg->reply = 0;
 		break;
 	default:
 		return -EINVAL;
@@ -909,10 +911,33 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	ret = regmap_read(pdata->regmap, SN_AUX_CMD_STATUS_REG, &val);
 	if (ret)
 		return ret;
-	else if ((val & AUX_IRQ_STATUS_NAT_I2C_FAIL)
-		 || (val & AUX_IRQ_STATUS_AUX_RPLY_TOUT)
-		 || (val & AUX_IRQ_STATUS_AUX_SHORT))
-		return -ENXIO;
+
+	if (val & AUX_IRQ_STATUS_AUX_RPLY_TOUT) {
+		/*
+		 * The hardware tried the message seven times per the DP spec
+		 * but it hit a timeout. We ignore defers here because they're
+		 * handled in hardware.
+		 */
+		return -ETIMEDOUT;
+	}
+
+	if (val & AUX_IRQ_STATUS_AUX_SHORT) {
+		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
+		if (ret)
+			return ret;
+	} else if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
+		switch (request) {
+		case DP_AUX_I2C_WRITE:
+		case DP_AUX_I2C_READ:
+			msg->reply |= DP_AUX_I2C_REPLY_NACK;
+			break;
+		case DP_AUX_NATIVE_READ:
+		case DP_AUX_NATIVE_WRITE:
+			msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
+			break;
+		}
+		return 0;
+	}
 
 	if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE ||
 	    len == 0)
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
