Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5491A62D8ED
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DEF10E5B3;
	Thu, 17 Nov 2022 11:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67E10E57F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 11:08:11 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id b62so1724164pgc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 03:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9adTC/kCnTAWZTCymBogkO2KVEPuyw81zYQPMZxxoSo=;
 b=RuLMYR/7GIUlRh1mNcPgSb0/ogtrlYZLLuQLzBZM/cfwz01+rqe0iqeUeS/oXZ2/n+
 VlevcOghg3lFqNrl7iEEHHgvKdDffYOe2ShXsXSylfV9oMoM105qreZo9uEPdaFVVVdR
 RbdlIxs2BBKDo1mqk5/u+LrdZ1Hxmxqmsp3mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9adTC/kCnTAWZTCymBogkO2KVEPuyw81zYQPMZxxoSo=;
 b=ppMyTnJV1ZSrk8lOIgFizeG1zO1HrhW502gYdzHe3tG9LOc/a1i2CDCqZgN1bpLcyq
 1EAqwrYyUZdTBCI0wAEMAVaCGq3ItW6/jeyAV4wucg300Sii8oynoyrEYa2F7pYdbAmW
 p6R1xqXZF4JkEtEx6FnChJxpU2IMfLvsRJZR2U6LbeJJxAgmBdTvS900xUbemKtWZhhJ
 pNHuUyMwhOscgyVgg5bU29w8Rt9lxQw1E05kKs8S0XniQfcYZiK3AA6xLQCz3cawOz5g
 qMsat16GAg7P+dcQQY6YUwiQTcWIRcwXHOCskt4RIK+wlMhMo8ymVW+YNOk+lvFxoSBz
 tnLA==
X-Gm-Message-State: ANoB5pnWCM2tsf8zlHJKWq+A3qGhcWRbw+4CZQc8vi836Cg7TjwD97aW
 0CjZH57AIhIXQKY8364FmI9zVQ==
X-Google-Smtp-Source: AA0mqf5UvhJh1+5BA+ftKIjgtSrH/nEpcIRbmgpRI80uU8ijBGEp1TdPaC/eD3sh7ZMlCOAopARHuQ==
X-Received: by 2002:a63:180a:0:b0:470:63e5:5c59 with SMTP id
 y10-20020a63180a000000b0047063e55c59mr1579787pgl.172.1668683291132; 
 Thu, 17 Nov 2022 03:08:11 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e678:c7f5:9cb3:1a06])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a170902ccd200b0017a032d7ae4sm1025540ple.104.2022.11.17.03.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 03:08:10 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v6 2/3] drm/bridge: anx7625: register content protect property
Date: Thu, 17 Nov 2022 19:08:03 +0800
Message-Id: <20221117110804.1431024-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221117110804.1431024-1-hsinyi@chromium.org>
References: <20221117110804.1431024-1-hsinyi@chromium.org>
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
v5->v6: no change.
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
2.38.1.431.g37b22c650d-goog

