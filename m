Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D42CE29E60B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCAD6E89C;
	Thu, 29 Oct 2020 08:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105ED6E47A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 01:11:59 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 13so952844pfy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 18:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=43Z65rMPFX7c5zSWXhXV75KBPOJpzYr19A/FVKbG0kQ=;
 b=gaOJwxZk2SVJy0xnoCB5dJaUR2mO3wYx5WgvqbszDB+92yPQcR+9mAXUCZ37z0UeLK
 qn+adoLcNXZKQXVDF6Q2qBOgMMVrEIcfvQO2IFKoAr3uHfs5WbIakf8WIKWYfs5yXDFe
 a2FALBeE2ogDfGw4nVwVwqvUEVweX9YoNCC2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=43Z65rMPFX7c5zSWXhXV75KBPOJpzYr19A/FVKbG0kQ=;
 b=aS2QkAFZ7KVlMUovKJgITxJqXnZ63FdZwJpK4UpX5uP/BkPo5xqTMx/6tgh2/ypkmx
 Qr+8USYWf6a7JcaH2yUWuLqASV6keosBfJbJ+93w1rEHnudslk123ltay2kiyiyKehQI
 mFbiAov24bFRpLpBwq4Tb4PgaJqnJC9Udg+RrYNl6mBG8Au11BYont3rSfcrwA+Y4f5E
 MTvkP6irccMWW4oXfo1UB6bG7Xqg5SIgW68ghY60wTDMb/XzaekuHMBXcRFSlh+8sPV2
 IHImsrLPmDZOfdubuQDnSExmc1Xuvkvos58YCFL4CLfjYyhyreLDuumhMYCIh/I05Lif
 fy+Q==
X-Gm-Message-State: AOAM533et+y5OarVVgEC2DeU908+RbCz8a0vwMXr4ivQV21t4m36cu8H
 3Sy5SSYHLYNoRQP5xD5buSJRhA==
X-Google-Smtp-Source: ABdhPJwytjkLPYk5jIPzS5cqIs63+UiSyMI+LTRDpm9VkQgZeuEE+mrdjewTHVF7UHozLGy7FvTPrw==
X-Received: by 2002:a62:1e43:0:b029:164:9ac2:f54e with SMTP id
 e64-20020a621e430000b02901649ac2f54emr1562015pfe.61.1603933918770; 
 Wed, 28 Oct 2020 18:11:58 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e6sm781769pfn.190.2020.10.28.18.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 18:11:58 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/4] drm/bridge: ti-sn65dsi86: Make polling a busy loop
Date: Wed, 28 Oct 2020 18:11:52 -0700
Message-Id: <20201029011154.1515687-3-swboyd@chromium.org>
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

There's no reason we need to wait here to poll a register over i2c. The
i2c bus is inherently slow and delays are practically part of the
protocol because we have to wait for the device to respond to any
request for a register. Let's rely on the sleeping of the i2c controller
instead of adding any sort of delay here in the bridge driver.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>
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
