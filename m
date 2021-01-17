Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0C2F9B34
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D6D6E17C;
	Mon, 18 Jan 2021 08:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D71689B49
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jan 2021 00:24:01 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id m10so14469660lji.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jan 2021 16:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pngCiC8UVrFmDGTkFK9zXDEQWbuDnES5IXJTMMZSYC4=;
 b=y7wUaE5uSs9/X1CgZ0TgeV+nYHROi8wXtaSQXaSFrr/YXaVn4ZkDx/z/CcIGc4aFhj
 yfVNJ9hRPzVVlnFeOKfOUWdYMiLz9LzYLYEAKKQ3zrd8q06qsc6M8pW99JyJeoZyuv7Q
 cjRJu7FsGE6ztp3WsT7fUi5dcaFxEtXEe/hj+l3kUoDAjmBD9G9G0bLlQqmUBSXOEFov
 wV+0IosGaHEy4YLwDUqbPWIT59zLJV2DNI6I8P7k5nqwjSfydOAgydT5n54AVIRR96sV
 zvNFcWy7ivZi9VH4WUnwO+emzrfy6nZbdocy20g3qHhDt2XzuG8HkyFQSWUXSDwhG71L
 rk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pngCiC8UVrFmDGTkFK9zXDEQWbuDnES5IXJTMMZSYC4=;
 b=FaNesa+JsQ2zE8zliKgnD0EvWeKSeGamNLeq8KmYMYsoy2/5ZjWSP2IfmQSVnWVDM0
 9057glNUXTm8Qf2uC79bIZTTDPEGEQYkCalaaBltKdzpnCyqAV/Q8f5AmtvCY2DZ+9oH
 r7dC+Bh83aMQO65GEdZvZ3S15N6rZfpYKhwFHGt2YcWfj71EdM4xrPokX28gzl7e0pqM
 RVh4Ly4PNKHDpfdozi274GajJlbzMZ0afXp404tLP+H4Rk0A3x4FVawTaUZqWYtDPUxt
 R6wwxlqg8LAjr9efCoVuvXVNZ2Nn5htlNrn48pSc8CcW2y4Mq6Vj/5vbMBotvuvOHAnN
 hylA==
X-Gm-Message-State: AOAM531Y3DFrIS7YomxoDauZU0qsCbnkdU4h/OmfFIjaUT3OcjjRwo9Z
 lywqnhQ3o7pOHElU1t8GB5lyswxtT+ua/8Of
X-Google-Smtp-Source: ABdhPJyLeADw2VKPRMAvtHVWtCOxRs38E8QehKF4XvsxxSU6wP3pWJnlkTEPqdMsIhPMrt4Htm5nxQ==
X-Received: by 2002:a2e:3c01:: with SMTP id j1mr7969902lja.258.1610843039706; 
 Sat, 16 Jan 2021 16:23:59 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.101])
 by smtp.gmail.com with ESMTPSA id q1sm962468lfu.48.2021.01.16.16.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 16:23:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/3] drm/bridge/lontium-lt9611uxc: fix get_edid return code
Date: Sun, 17 Jan 2021 03:23:54 +0300
Message-Id: <20210117002355.435860-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
References: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Jan 2021 08:25:29 +0000
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
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return NULL pointer from get_edid() callback rather than ERR_PTR()
pointer, as DRM code does NULL checks rather than IS_ERR(). Also while
we are at it, return NULL if getting EDID timed out.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index a59e811f1705..b708700e182d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -505,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
 	ret = lt9611uxc_wait_for_edid(lt9611uxc);
 	if (ret < 0) {
 		dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
-		return ERR_PTR(ret);
+		return NULL;
+	} else if (ret == 0) {
+		dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
+		return NULL;
 	}
 
 	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
