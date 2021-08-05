Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565B3E1BB4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 20:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FD66EB28;
	Thu,  5 Aug 2021 18:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6536EB28
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 18:50:44 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id e19so11164697ejs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2j8GypBg1lwZCMqPRAhi18yzlw9Dx0/0JNmaPl31yQU=;
 b=b1qrJ2Y8rC9hl0zvq833pleey9cWiSFC9YvFPyJEOA+ZtXN9LtLWJ1ecVsc4XzO2TR
 SB4PGR1wv3Nz4oC8TgvmygIqTDtvkFEDDOdITpiDo0YxXUzrcgziA+ExzIetkz0hH2EF
 3tRTaoQxNiyquFMUeWvgZU68E+MO9F9GnNviVDONNusnF8E7TpKiWlt36uKIxWkn98k4
 wxZOrJBw8SNNnNur95hMsuKw0OKs2LUubT0SfkaW7ZrQIT0Nt8ND08vjr4LosiPvJ6vy
 /JppNh8AEEpRUO+ICvx+wTiiubmXk8yettSIHw9v0oHD/z4rU1ccm+/qegPe3k+vhpCj
 TDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2j8GypBg1lwZCMqPRAhi18yzlw9Dx0/0JNmaPl31yQU=;
 b=W4Wi/QVNdnaKVl6HuI4EAIp9LYdpGVcyFEJm0OKX+VLF2AFnN54CETW+BvfOKFjJcA
 DWp/UpJbcUBJE36nnj5eliItgE2mDYtWxtU6rkokyUJp3lu7HXCXpY2/vHlVEzKOaXsa
 snnw1M4Rgew8LD4+TE1kMu62yc5SdQE0ucppyhtbYPjEbigq4qHH4gUGFQFiK9XvX6Hx
 5L0JpVTP1EzEgapCgwgW+C6AXzIADJ2dj0KEPMdJJ3jFtvuD3FC3ZJZMywpfKyb+2Jsi
 yJIqqnWHn21ZlglzxomChmpneaJpH4TcR3ESh3SoZaik8GEfghuPk1dN1gTKKufriP1X
 v7Hg==
X-Gm-Message-State: AOAM5326ekJTY+C0sqVUOc/0fKR10KSkhAWfBYgdMzDhGe8xrpBLySnr
 ix1hYJIaM78LQ4Sh6JygcsxXNbSrwz4o/0Ja
X-Google-Smtp-Source: ABdhPJw4OLpxupfMIMMTfPKVgRF1XjDBpxCm/kQiKX3LlE7aoBDcPj+kpiO7pBD/o2tqdncs+FTecg==
X-Received: by 2002:a17:907:2096:: with SMTP id
 pv22mr6371552ejb.443.1628189442820; 
 Thu, 05 Aug 2021 11:50:42 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:d36e:2c7:3619:687])
 by smtp.gmail.com with ESMTPSA id x42sm2716461edy.86.2021.08.05.11.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 11:50:42 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: ple@baylibre.com, narmstrong@baylibre.com, a.hajda@samsung.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v1] drm: bridge: it66121: Check drm_bridge_attach retval
Date: Thu,  5 Aug 2021 20:50:39 +0200
Message-Id: <20210805185039.402178-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return value of drm_bridge_attach() is ignored during
the it66121_bridge_attach() call, which is incorrect.

Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 7149ed40af83..2f2a09adb4bc 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -536,6 +536,8 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 
 	ret = drm_bridge_attach(bridge->encoder, ctx->next_bridge, bridge, flags);
+	if (ret)
+		return ret;
 
 	ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
 				IT66121_CLK_BANK_PWROFF_RCLK, 0);
-- 
2.30.2

