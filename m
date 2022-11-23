Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132616358FE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 11:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1208D10E20D;
	Wed, 23 Nov 2022 10:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C72510E20D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 10:05:40 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id f9so12151128pgf.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 02:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UErsT04ZyvPQZD/GWA3SjRANjv/mY45ZrGViPWOUsZw=;
 b=YQq1OWP/rreUbf1JZWHTsvWDnRHZ6KDDSG+laL8s//K8YlvbE0jQAQGaPqUVd5uZ5X
 GxuAkR4sMWfwTX7XUtuQ92Pcgzw8Y568clN2ihAvwMYHUdzCDxRqQNHrF6EDm2pcadEa
 pbJhY8JmZrX52GI+i4lNgbrQ7ndJmKw0OQ4Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UErsT04ZyvPQZD/GWA3SjRANjv/mY45ZrGViPWOUsZw=;
 b=i2oUtYmDtb1JtseiW8nLO6EEUQxWvCR2HVEiAU41nsNimQ1vAlZYHoZzHcMK7TA6QU
 +qFBcA1ltSpKc97F4vDTVkwx1uDW3EYD1a1m6lUd+Je0YPv5nmThog+aaNkCrM2xdGzE
 1pvQLjPoqpKCefvu8BqqCIpkqx2cKvhwF643hPojlXc7ZjlrmCX1KHiBnHd6+1eaUidw
 jtsBCP7NoJ4eqGcoTv8/LYoewUszW303U1+MUTockERb34xxNh5IfyRs8vLUxJjBfbcA
 /jtOuvh/T5XmmMYRVvLXDmDFcMYp/7TdYWVXM7pKhE+uOjbPxnqE/9KV0fRxBCnXgEjF
 r1eA==
X-Gm-Message-State: ANoB5pk1uo1ugBQnmGKeRP6L7EkybgF2FSl58dPl28zF9muNaDKg5VKk
 /KXUPfZy5EgDgtICo8HGvqKfLw==
X-Google-Smtp-Source: AA0mqf4iGLyvjqwcvqsDaTaBWJ5NMnuRcCiESpIdGRGtMm/3xkawyZ5j9M5XKfTjRoZez7bimdIEsg==
X-Received: by 2002:a63:195:0:b0:442:c653:677d with SMTP id
 143-20020a630195000000b00442c653677dmr25713206pgb.43.1669197939853; 
 Wed, 23 Nov 2022 02:05:39 -0800 (PST)
Received: from hsinyi.c.googlers.com.com
 (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
 by smtp.gmail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1020138pfb.218.2022.11.23.02.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 02:05:39 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v7 2/3] drm/bridge: anx7625: register content protect property
Date: Wed, 23 Nov 2022 10:05:28 +0000
Message-Id: <20221123100529.3943662-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221123100529.3943662-1-hsinyi@chromium.org>
References: <20221123100529.3943662-1-hsinyi@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set support_hdcp so the connector can register content protect proterty
when it's initializing.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---
v6->v7: no change
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b0ff1ecb80a5..0636ac59c739 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2680,6 +2680,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	platform->bridge.type = platform->pdata.panel_bridge ?
 				    DRM_MODE_CONNECTOR_eDP :
 				    DRM_MODE_CONNECTOR_DisplayPort;
+	platform->bridge.support_hdcp = true;
 
 	drm_bridge_add(&platform->bridge);
 
-- 
2.38.1.584.g0f3c55d4c2-goog

