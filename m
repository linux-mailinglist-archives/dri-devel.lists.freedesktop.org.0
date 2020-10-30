Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6529FFD1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0804C6ECE7;
	Fri, 30 Oct 2020 08:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F6A6E946
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 01:17:43 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id e15so3856726pfh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 18:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bd9wyHuVLCFuoo+uR0VpYuko8KnuaddorUz56unAlSM=;
 b=Oe5wxWNnvQ9eFlBIuzDEJsO0w0uOadc2EQV2r7nsTQfk5AnTdC50fNEmA1X/7+fO+2
 j9UGXevXdEb9/Y1yqJCFvmM+a02Z/0tEgHEw0YKgLH7WKzWTy4pnvudB8vLUNs4NXaDe
 edxsHmzkVU5UOPtC+oWAtoJ5nLkpdGfvzzs8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bd9wyHuVLCFuoo+uR0VpYuko8KnuaddorUz56unAlSM=;
 b=gHlZy+aZa/WLeM1+UO7NJEw8UcT1sZ/e4AYsPxZ84c/YZ+pqRvKFYuQJwL6i+abhSh
 j5Ec6vwhvVM3NBuHyAD6sIERVbZ/2EQ4z8+vKZEcKC1Kl0kJS0O03nb80rMJFiSux+sM
 wrkDc8gCQn/NoFe0YwJ+CIpTwbmPL6A4Tfq2CfhVB9CCRZwWUPtnOi/4PfU+u6Fyjgfr
 Q/3jsEsvfZ341/X1Ia4Ug3S3gpShhHDx/GkM9kgEpYLJPiuorVEalQDsPUa3dRBdTEKz
 cu/HM8YxhyWB4gKWM5hN1K9150UtplzjB8XQbTsz61T6cXj/Rqjbux6M/mPnUADl9Kn8
 jgrw==
X-Gm-Message-State: AOAM530UvliHWzugvqFgEO5DadcYOOQDF2XQJsS2/RdEtopeMmLKvYhI
 K/fp6jbJHkwWXDN5zhH6JDn0iA==
X-Google-Smtp-Source: ABdhPJwZNGBc2+B0BGbpbZzFyHysHQxtULqVw9MiqUX8PQT5YzKL7R8AjHlHL79uwXnq5+xv0EWaXQ==
X-Received: by 2002:a63:595a:: with SMTP id j26mr18073pgm.37.1604020663485;
 Thu, 29 Oct 2020 18:17:43 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id z26sm4477854pfq.131.2020.10.29.18.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 18:17:42 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/4] drm/bridge: ti-sn65dsi86: Make polling a busy loop
Date: Thu, 29 Oct 2020 18:17:36 -0700
Message-Id: <20201030011738.2028313-3-swboyd@chromium.org>
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

There's no reason we need to wait here to poll a register over i2c. The
i2c bus is inherently slow and delays are practically part of the
protocol because we have to wait for the device to respond to any
request for a register. Let's rely on the sleeping of the i2c controller
instead of adding any sort of delay here in the bridge driver.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a1ebfa95088c..c77f46a21aae 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -881,9 +881,9 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 
 	regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val | AUX_CMD_SEND);
 
+	/* Zero delay loop because i2c transactions are slow already */
 	ret = regmap_read_poll_timeout(pdata->regmap, SN_AUX_CMD_REG, val,
-				       !(val & AUX_CMD_SEND), 200,
-				       50 * 1000);
+				       !(val & AUX_CMD_SEND), 0, 50 * 1000);
 	if (ret)
 		return ret;
 
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
