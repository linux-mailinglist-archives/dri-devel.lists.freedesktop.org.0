Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C229E5F6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC256E86B;
	Thu, 29 Oct 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888CF6E82B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 01:12:01 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 133so930936pfx.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 18:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HMnyM9hnGSWiflifnZ+155XlhVa/FPrVDuXugyYPm7I=;
 b=eaokMHoEbOulnBlsExgxoDER8Sx0r9k5So0QpAhfgL05Yq8mtvqSgL5dZm/FcxPiL9
 s+BVRN4TjdtfCGAJvZDotxU047Z+xD+eDZNsKFaGHmlvdSx+uyUKRIQ1x3nTZfCGoddK
 ADWgrvvKT1A4sadDfuogByLfDXV4liA2WAXuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HMnyM9hnGSWiflifnZ+155XlhVa/FPrVDuXugyYPm7I=;
 b=gg6yzhTHWFA9ZfQtvcxtTpX8iG+DnJasfGgLXlab7o5yB57vsPkIGr3Sx58DT4NO/j
 UcU9vCbC3s3oDpKQIzQj2XyNH7ADwSA1VmLsRtWaIox6LJ1OcaPO+5QQ7Bnwd0msF/kR
 ivzo5QQ3/IU84Ab8WQquIvEPZOYVq23xIp0IFeY+e+Rtj/qscWF1izNc/xF5Giix6ib3
 sIzSrorGUXOwPOvSPJ1QdopCNde+Ip3gamFmQ1qhxckOVCyAj7WRZOCRz3vhDj3NUgas
 U9DA/m4xhKjxflHjXwbrTUdmgDRHlqJqlQCnu3e+y3YZ19eohb+VQyV7DZphmOeNfnUk
 fmGQ==
X-Gm-Message-State: AOAM532IIHH3i0ZitfyguO5IhkVdmjBp96NsdcRo2EI1gRwawFPFzL1a
 Ez3f2b21wD9U1mod358LAJt3yw==
X-Google-Smtp-Source: ABdhPJz4OI5ZTi5XCi0Xrzs2vkKBHMG13FV4RyD3SOjJjLNExKzToETzT21lAu3EC12RVUiN04d3xQ==
X-Received: by 2002:a62:ddd4:0:b029:155:af54:3000 with SMTP id
 w203-20020a62ddd40000b0290155af543000mr1673370pff.64.1603933921240; 
 Wed, 28 Oct 2020 18:12:01 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e6sm781769pfn.190.2020.10.28.18.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 18:12:00 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Update reply on aux failures
Date: Wed, 28 Oct 2020 18:11:54 -0700
Message-Id: <20201029011154.1515687-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201029011154.1515687-1-swboyd@chromium.org>
References: <20201029011154.1515687-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 +++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6b6e98ca2881..19737bc01b8f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -878,6 +878,7 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	case DP_AUX_NATIVE_READ:
 	case DP_AUX_I2C_READ:
 		regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val);
+		msg->reply = 0; /* Assume it's good */
 		break;
 	default:
 		return -EINVAL;
@@ -909,10 +910,32 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
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
