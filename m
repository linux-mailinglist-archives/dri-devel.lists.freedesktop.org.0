Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088E491197
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7205B10FF99;
	Mon, 17 Jan 2022 22:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F5B89B8E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 10:10:01 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so21677886pjp.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=GWAKRaqzcC+I3EL6268UUAjZ8aE+eDwCkX5smZz7T3c=;
 b=JGK/3h4tRw3PYRSfbFoo5v8I9I4+IvA2FviICIsZNb+8WlWjIGnRLL4aBXZEoStxA3
 CvYC/OcubraSa3HWR6G336eQZT4m9P9xHCiixBxCpHQlzq7CPqx9wvoJXzgNRrP/nUt4
 DBOQAq+99ceK+0mXlspYSoi0fgOrEo35ZH99kB3FdJGVzPQDwO1fJhmmvLih1C/j1J0P
 o4TbNn3n7hScYb2IauYOgBXm7MVy1E0gxgDO6Nc9dxvQTiB0biUL8kI8fpX47HMsPMcg
 GhBWMmVbTAV1/xJDVSKSe7jyG/trIIDY22ETDOX66B4xU2Dk3ZrR88ddiPTebBmKgVw9
 IdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GWAKRaqzcC+I3EL6268UUAjZ8aE+eDwCkX5smZz7T3c=;
 b=C9JsyXXBPhdcAGrFt335ddg93CMNZth8t4i737h4BtS2rIvCFJVmh3CkVoDw6y1+rN
 EANUxbkny8kUzuvSjea3pxOVKol859nHD5DTIYmD15TuCH4vyTas24xWuwA5WkS0bX/7
 0Gup6MLuexYB2jxDP828NePQkxRembQjly4G++FAWXGEGpjqVqZC0LPw3+WBw4GfqM79
 mHk6/trpcUeAFv9IP5ldrLqhJWCobrlssKt2cbDjAphl/DwH2L9TUlt+jiCPluGndhtW
 WjVermhBx/+CY1axyJxCvmhdLFX9W5snA+Cs2KBNDdZn+fL6RmSrLWiI/W/cPfhkFdXT
 0bnA==
X-Gm-Message-State: AOAM531/CqERevlOoFTvLDpz+69HEhrRUYNvHzPcIXva4vl03eCKqH+w
 B7BaJYD87I0Bw3xzg29HXBc=
X-Google-Smtp-Source: ABdhPJyz3g8fmREHazW3FlYjqMu/UTKaQlahsty8tV/piqCCRc/QGEzaWqfLmxeJSDufrJideLorSg==
X-Received: by 2002:a17:90b:3884:: with SMTP id
 mu4mr10493126pjb.133.1642414200940; 
 Mon, 17 Jan 2022 02:10:00 -0800 (PST)
Received: from owen.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id n42sm5401509pfv.147.2022.01.17.02.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 02:10:00 -0800 (PST)
From: owen <qwt9588@gmail.com>
X-Google-Original-From: owen <qwt9588@gamil.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Xin Ji <xji@analogixsemi.com>, Sam Ravnborg <sam@ravnborg.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v5] drm/bridge: anx7625: Return -EPROBE_DEFER if the dsi host
 was not found
Date: Mon, 17 Jan 2022 18:09:49 +0800
Message-Id: <20220117100949.9542-1-qwt9588@gamil.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 17 Jan 2022 22:07:45 +0000
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
Cc: owen <qwt9588@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: owen <qwt9588@gmail.com>

It will connect to the mipi dsi host and find the corresponding 
mipi dsi host node, but the node registered by the mipi dsi host 
has not been loaded yet. of_find_mipi_dsi_host_by_node() returns -EINVAL 
which causes the calling driver to fail.

If the anx7625 driver is loaded afterwards the driver requesting 
the mipi dsi host will not notice this.

Better approach is to return -EPROBE_DEFER in such case. 
Then when the anx7625 driver appears the driver requesting 
the mipi dsi host will be probed again.

Signed-off-by: owen <qwt9588@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 2346dbcc505f..297bbeb5aae0 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1660,7 +1660,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 	host = of_find_mipi_dsi_host_by_node(ctx->pdata.mipi_host_node);
 	if (!host) {
 		DRM_DEV_ERROR(dev, "fail to find dsi host.\n");
-		return -EINVAL;
+		return -EPROBE_DEFER;
 	}
 
 	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
-- 
2.31.0

