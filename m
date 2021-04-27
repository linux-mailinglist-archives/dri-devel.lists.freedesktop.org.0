Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D736BF06
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 07:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93C26E8F8;
	Tue, 27 Apr 2021 05:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074726E8F8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 05:53:26 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id z16so686917pga.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 22:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ahbz/au3UbZNosIsF6EFm5aomtTD02orvpaKrCQHc40=;
 b=LWUJHbOKgdtJ6oX6D83nOjdlgK4s7GNJtDAuLp8ylGAzyCM6UBb/jzFgeJ7DGAbpJP
 DNd4vPaxPeiZXGX2WcIkffpVjQzwZ0a+WdyQspUanrHBH9B3DQvKHXAFXog1GY+Jg+I4
 4uTRNikVtyX498tn5gK2eSioOe9mcDzsmfo+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ahbz/au3UbZNosIsF6EFm5aomtTD02orvpaKrCQHc40=;
 b=FJIfj1qQiROY8kv/k3rIVnJAQTfdNLnPUiXKrCOoxVFExALUNoiQ+wnDkhwa88EpWQ
 CzwAXDhRiG4dFxvgX1RgxrOCcmWcgLHf2VoXTSEePqXaYLfmwOOG2aSYVexn7DrtmUjE
 vJQ+XwlGHo6fCT1Gtjvs0cTwRWkWU0yaddWSbkBRdL8O3vNnaJL9LrEt/m7DwalbkEuz
 +jrSWqfeRs80rPKTPXPS9A4CMJL7clpP19rruMJxXfcPBGsTF9nB+T5gK1QDAZ1XnPqw
 P63s6UUrKd/fV/TK2YvO2a5aAkqkhmuB2EqgFlQxrPEvd8YFPlOKkSNpk7JQNFB/zdEU
 fVag==
X-Gm-Message-State: AOAM533Yx6dTlbDfwpIAUcGgQEPUgzfOz10/6SsYbEgbqXSb4VuZKAeG
 7WLRh4i8VWCZX/0PSbk+nhH92A==
X-Google-Smtp-Source: ABdhPJzrGiIV8MdRDA3kGoxL5uIu6D4c5p2fXonC3FcGnjrTM+5T9wK9n28nao14b4ww4VXQLrSlMw==
X-Received: by 2002:aa7:864b:0:b029:272:947e:85d7 with SMTP id
 a11-20020aa7864b0000b0290272947e85d7mr13782076pfo.45.1619502806391; 
 Mon, 26 Apr 2021 22:53:26 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
 by smtp.gmail.com with ESMTPSA id b25sm1367457pfd.7.2021.04.26.22.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 22:53:25 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm/bridge: anx7625: Fix power on delay
Date: Tue, 27 Apr 2021 13:53:20 +0800
Message-Id: <20210427055320.32404-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From anx7625 spec, the delay between powering on power supplies and gpio
should be larger than 10ms.

Fixes: 6c744983004e ("drm/bridge: anx7625: disable regulators when power off")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 23283ba0c4f9..0a8db745cfd5 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -893,7 +893,7 @@ static void anx7625_power_on(struct anx7625_data *ctx)
 		usleep_range(2000, 2100);
 	}
 
-	usleep_range(4000, 4100);
+	usleep_range(10000, 11000);
 
 	/* Power on pin enable */
 	gpiod_set_value(ctx->pdata.gpio_p_on, 1);
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
