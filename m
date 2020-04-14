Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE32A1A7664
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 10:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB7E6E49D;
	Tue, 14 Apr 2020 08:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BAB6E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:47:42 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y4so5390541ljn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O4yhqsZxGdaw50if7skbF7fjv3gWtZqwgKBaPsWE2Y0=;
 b=QwVB1LkKw5002Vp8WtdaEgxRPq+TRh5Qah688q46q/66gaEfApC5Xpbh0gydMhXXDr
 KSenFMjsVFEmjE4GfCyS1Nj5DXJ9slySrt1XzwpTRV0F6z7QZEBRHRgwowHzGO5PRvHX
 KsY4SK0tiiXUko6DmO7YFUlgBc6kEA0jOJDVkXOucR+NZZPwOSVhC1w7PcerG8APsdAE
 E8nt85edK16u334DkYPI2ieFhiGyl5AlDIQB7nO9v0iYH4DOWG+XVM9Ai2UsgGgFOVKl
 KJD2PVwYEDmWKbcYivb1136JJjSkFLUMrDBXl9B0RdvY9BYhv+HZyEv3z5uMVSTGcD8m
 AJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O4yhqsZxGdaw50if7skbF7fjv3gWtZqwgKBaPsWE2Y0=;
 b=k/38OXLyY/wtaMiFTSud2sMthP8v7S9ywQ6DT6PuczbklLMY7wKsWHMlwuzxk6HwFk
 zzbe9uO771Rmkpghya0ujO2WE5Dvkq0yfp9acJ0B2695dYx34c2dRAwmxnZOIPZWMIxg
 QwNHbV7VNdhZcLbEBMm3S0KUvHkEYQCXoRNnZ8l2+0JpvGHsX2BvLxXOHD7deqNkdyUB
 FtV8qYNGWiKng1EiD2eWEdc9SEoUvtBarN4W8dvVkPv2iVJ/eeyuBLmAvHJpgxNts/PO
 j7gbFYg4zOJZmM6jECi3IqQS8fwFa/BvMqyC7s+oRJAo00B6Hz/K0MWR0a9Q+KJoz+7J
 2opA==
X-Gm-Message-State: AGi0PuYKI+sTzHif/aX0b1l8U0yQlPal6SMbea4RHHWs3OM80lGo7ZEa
 PRSog69Q4bxkCF+ZqnL4qNwoI1xJf38=
X-Google-Smtp-Source: APiQypLdwVZSiA0pRaJAozF9TIrE8Fs+FlkUy0bJ8c1rHrwKyibH4u+UtZxz6aph0f3D65rIaGiKeg==
X-Received: by 2002:a2e:9b07:: with SMTP id u7mr12739107lji.110.1586854060778; 
 Tue, 14 Apr 2020 01:47:40 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q10sm9834979lfa.29.2020.04.14.01.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 01:47:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v1 4/4] drm/bridge: tc358764: make connector creation optional
Date: Tue, 14 Apr 2020 10:47:27 +0200
Message-Id: <20200414084727.8326-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414084727.8326-1-sam@ravnborg.org>
References: <20200414084727.8326-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the connector creation optional to enable usage of the
tc358764 bridge with the DRM bridge connector helper.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358764.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index a5abf15e5c7f..4ebabea86040 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -337,10 +337,8 @@ static int tc358764_attach(struct drm_bridge *bridge,
 	if (ret < 0)
 		return ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	ret = drm_connector_init(drm, &ctx->connector,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
