Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2B2A3E9E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4DE6EC3E;
	Tue,  3 Nov 2020 08:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F186E117
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 18:11:49 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g11so713557pll.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mucw0+S0CdtYt2MrRKtHgnlnbG3RdZ1CSuq3C9GPsWI=;
 b=JBUs/ATc6uaPEMghQ/X3xL58YiXfHxnNb2KJQlhhG6ZMIoCG6puCx17Mix5ZaIIktH
 O8MBOpsa+Hpbr+NJ90V/vYmzGqZcR3Q0grcapVGHvrG3pnQkz1VzWmLwRQbvoTUPMwS3
 IKqh/NbK43OMImI8cujYwv8KvNtR3igfTvoLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mucw0+S0CdtYt2MrRKtHgnlnbG3RdZ1CSuq3C9GPsWI=;
 b=ZueliEkzO681W+XCgUdj67rM5xJhEJOwqTmSt+gILJmuPYCLYN/2IkJBaIyMFuW3En
 7jDDZN09aHbkiIQ+s+nCbJF9qiQJZfzqIjL/c+1JDWSMnvsheKlYbcW8T34OJk4TgH7Z
 Ylo2wkC8kO3lZ2bRVRKDC8ViERrAD4O1fAukeQxUNdKPXGoMs5B8ookRkDnnQ7kYxily
 TN48OOUb3q+KZmOdxV/lqbdDEE1FkpB4PdFggbsiweeFjR5Jj/SOZRcSwYAmmFuzumcO
 okMbacWqZ4hXG9VKf03goRjflQB+5HHilESloz0G9HBalkxKk4K+A/VzFgb7N6Wm7LNF
 MkTA==
X-Gm-Message-State: AOAM533dv2IeiZfw2a97xw6ljVbUpbrxsTBjLDmHnQAgx6IucRukqXX1
 9zCSd+iAI7uyiAKnTXureaDvnQ==
X-Google-Smtp-Source: ABdhPJyHYVx0D/MimpLNF9meNsmXNCFBi0+HKgmBxtQQHUNbkMk9oc+WHbulYskfoB1/sI0kTUilQg==
X-Received: by 2002:a17:902:b689:b029:d5:e78f:65d1 with SMTP id
 c9-20020a170902b689b02900d5e78f65d1mr21923958pls.6.1604340709451; 
 Mon, 02 Nov 2020 10:11:49 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id b17sm13175640pgb.94.2020.11.02.10.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 10:11:48 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 2/4] drm/bridge: ti-sn65dsi86: Make polling a busy loop
Date: Mon,  2 Nov 2020 10:11:42 -0800
Message-Id: <20201102181144.3469197-3-swboyd@chromium.org>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 87726b9e446f..8276fa50138f 100644
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
