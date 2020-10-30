Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECDC29FFD7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B93E6ECFC;
	Fri, 30 Oct 2020 08:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454706E948
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 01:17:46 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b12so2183912plr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 18:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GixG0AIp4K7aEPxnTMoVGo349E06hix+8APGiCAeVDg=;
 b=iwMP8439b+n/zanp2YSKeVm2e2FnXGqeUWQWVL6rDTBnQ6ZDMxsP46JOVZy3kVytvW
 PlBUV0FNHeHnwbMaSf6TrNY4GTuZ0jMBpg+PNxkFhORmf9Ms14sCxRlkzGfyipzDDUUc
 6eMaNyhn664iSTNGNXje17gI7xJ+vfdImlqCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GixG0AIp4K7aEPxnTMoVGo349E06hix+8APGiCAeVDg=;
 b=tjKblE391CZyVsG0vqm+5bSfm6oFWrZ8WbeM10b5OPZ+NGCo/6KqBWSD4IbwTIga7z
 ytBIjR5BRQIMwGQ9Cx7rCoh38d2iXUsY89Mw7cjRNeNhv+D0di2VK9/7BdLNta3YGWE+
 pXrLSxfHCEXBsjWvcM0atATOeJCxLM5QlrhGNkaHWduxjM58xNVZ80Mmxuc0IsOtuhgJ
 ZMmtSPp9ChkmdmogE659PXPnvAU3zvJK+xtQI8X1XtyFHLIe4j9iCkfHldvwn5udNCxX
 pwecUOk+rANiAn4krZH4lLeHvhdQV2F2b159zVSyI8gJiaDrJjeqnWloMVoiT7dB/5kN
 Lgcw==
X-Gm-Message-State: AOAM533yF6R9Xkgno16WbehHupdqXTKSRDsekG7JQVI8Je8wv7lEZ7nv
 NsvVpL9PQOqPIyKJFd6JmpZP0Q==
X-Google-Smtp-Source: ABdhPJxYudIQ2YVqBE67sdMqELFeQMtHqfxicmXnHIedGvx0yL8cZqg6wE6FyG3S/ifYAoRVHpQBgA==
X-Received: by 2002:a17:902:b7c2:b029:d6:f71:38d5 with SMTP id
 v2-20020a170902b7c2b02900d60f7138d5mr6341002plz.1.1604020665929; 
 Thu, 29 Oct 2020 18:17:45 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id z26sm4477854pfq.131.2020.10.29.18.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 18:17:45 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 4/4] drm/bridge: ti-sn65dsi86: Update reply on aux failures
Date: Thu, 29 Oct 2020 18:17:38 -0700
Message-Id: <20201030011738.2028313-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201030011738.2028313-1-swboyd@chromium.org>
References: <20201030011738.2028313-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
 - Handle WRITE_STATUS_UPDATE properly

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 36 ++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f86934fd6cc8..984ea41deca8 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -873,10 +873,16 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 		return -EINVAL;
 
 	switch (request) {
+	case DP_AUX_I2C_WRITE_STATUS_UPDATE:
+		/* WRITE_STATUS_UPDATE only matters for request_val */
+		request &= ~DP_AUX_I2C_WRITE_STATUS_UPDATE;
+		fallthrough;
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:
 	case DP_AUX_NATIVE_READ:
 	case DP_AUX_I2C_READ:
+		/* Assume it's good */
+		msg->reply = 0;
 		break;
 	default:
 		return -EINVAL;
@@ -909,10 +915,32 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
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
