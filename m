Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96832DE12
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 00:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C59F6EA8F;
	Thu,  4 Mar 2021 23:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19C66EA8F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 23:53:11 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id j12so538943pfj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Mar 2021 15:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qnp/ZHTkSIkVYskvkrF513Ugb3dk9usGZrQyQUnFAEk=;
 b=Wgqw+87O9xoe5W14UsxraXU6NYwlrhsNsCGv+E1NklZkP4eYldm/NAWr8Ok9Xq3BER
 g8Y0zPvu/kMnEk1MY1x8XpDbNkzjleZeMkkwOlP1w9Rbj7/69N/r3SVOQC0Js0I6kCab
 CdiUXNPRZyk9gt0IpUp1JGWYqRVH1u09T5IjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qnp/ZHTkSIkVYskvkrF513Ugb3dk9usGZrQyQUnFAEk=;
 b=Mf1klbi9rI6D4Jt8/xtM2xboOUhvLmBuywOaL27IULtYfBy/qpRfeZHqk2sbdqJbmz
 lmTk/flbeenk60VbvmrK36CILmZJlnmz/Iu6JTb9g6xiTIUrBf8OGdrG7hsovNSIXmGW
 sISPPA82NtSRptgSbzXlnEWuFZLzps8YhWn3XNsmOj2gxZMHWCb7gvHW0tkG19xkkSI2
 SpzCnm4deDV3Qb0ufInKXiaR1g3Wdn+kJKELh0DXN2QdrnXqEwSRD7sUajacTl7OHIzr
 H0CEzGCQw1/7mrGol26goUuznBUieppnddoWWcv+kk3Hw96+2UWcBV1i9axhfgwlM5JV
 zeoA==
X-Gm-Message-State: AOAM532qpjMobCzEXcdD9BgIuhXItnjUFFgklX0Bgi6GBqKwZ+JHDvHp
 wLAtN9joi67HhGF7rUrSl25QAQ==
X-Google-Smtp-Source: ABdhPJy4x/gHMFUZGwtp7tcOp3lrs2YSyiDqqo8LnNYjXNY5rgKoSevRVezwQxVGQyGEYR1olzYgTQ==
X-Received: by 2002:aa7:9577:0:b029:1ee:ea22:5eeb with SMTP id
 x23-20020aa795770000b02901eeea225eebmr6177361pfq.33.1614901991316; 
 Thu, 04 Mar 2021 15:53:11 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:c4da:3a70:94aa:f337])
 by smtp.gmail.com with ESMTPSA id r4sm319449pjl.15.2021.03.04.15.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 15:53:10 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify refclk handling
Date: Thu,  4 Mar 2021 15:51:59 -0800
Message-Id: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clock framework makes it simple to deal with an optional clock.
You can call clk_get_optional() and if the clock isn't specified it'll
just return NULL without complaint. It's valid to pass NULL to
enable/disable/prepare/unprepare. Let's make use of this to simplify
things a tiny bit.

NOTE: this makes things look a tad bit asymmetric now since we check
for NULL before clk_prepare_enable() but not for
clk_disable_unprepare(). This seemed OK to me. We already have to
check for NULL in the enable case anyway so why not avoid the extra
call?

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f27306c51e4d..942019842ff4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1261,14 +1261,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	pdata->refclk = devm_clk_get(pdata->dev, "refclk");
-	if (IS_ERR(pdata->refclk)) {
-		ret = PTR_ERR(pdata->refclk);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-		DRM_DEBUG_KMS("refclk not found\n");
-		pdata->refclk = NULL;
-	}
+	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
+	if (IS_ERR(pdata->refclk))
+		return PTR_ERR(pdata->refclk);
 
 	ret = ti_sn_bridge_parse_dsi_host(pdata);
 	if (ret)
-- 
2.30.1.766.gb4fecdf3b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
