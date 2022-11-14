Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A187562770B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEC110E270;
	Mon, 14 Nov 2022 08:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A4010E26E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:04:36 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id y4so9385548plb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 00:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJDRhD+by6ePLMyu0jFNF0DA5otbXQzM82G9QXM16+g=;
 b=iNyUdIcLjrR/mqWwLs/KmivHxLDyDcgVMh73gXOXYAq/IkDPCGsH/9skjnoPBo8gG6
 dVsG+Nyz//OyLV9sBaU+LDku2PU2tznUw3oQfZcEDdJTg3TXSasC9ANQUJ8O9rAfDnu3
 HYFZQvEswdMHQT0j1ewSY0yDMwKNsygZtxCdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bJDRhD+by6ePLMyu0jFNF0DA5otbXQzM82G9QXM16+g=;
 b=NLjMozJ6eriZ1+3xHEwnEbp406rYQFYLGEN2u0Aq3zHgfYERJ33DdZMa+uDDzHmJeS
 yWIkp+ZO84J1NyNHk9+p+j5BDRs/MlReupcwd1p6W5qREzcBxciq/AL9UajMMRik1gAo
 yKQHJQ0OttIc2YdIwCqLQccbiijZX9Ip/rpUsTJnAZ/pIa5zNVPdh7fKTIIdd7IxaKD+
 GRSiiwb78oiwUWTj5GVx13HnlzjgPnQviIKPA5dGl4FrQi/t6fkARH/ro6AC9Q6awjy5
 BFSFZWIVmkDpJmYzhwoERHkqklLUjv/lpPihwaxZaOV3R0Hv/hI4iqyvv6D9ZrKRX/Ze
 fC4g==
X-Gm-Message-State: ANoB5pnc+o3CkoPHCuaJaLCM7Kr13Q7TiJ5Oq3FwLVz77pO8kk3zLEos
 spZ9KR5W+IqLjRgXy1v+9JJ2sg==
X-Google-Smtp-Source: AA0mqf688Sv1eNxrH8zO0KEumgyIdk7+CrlCUx/YBZCPZDBo0HdDgxOmFWwMZNEwJYoy+Gal0QQx/Q==
X-Received: by 2002:a17:90a:f18f:b0:218:8f4:bad5 with SMTP id
 bv15-20020a17090af18f00b0021808f4bad5mr12851400pjb.55.1668413075989; 
 Mon, 14 Nov 2022 00:04:35 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40f1:682:170b:f25a])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b00186fb8f931asm6696799plf.206.2022.11.14.00.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 00:04:35 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 2/3] drm/bridge: anx7625: register content protect property
Date: Mon, 14 Nov 2022 16:04:06 +0800
Message-Id: <20221114080405.2426999-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221114080405.2426999-1-hsinyi@chromium.org>
References: <20221114080405.2426999-1-hsinyi@chromium.org>
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
v3->v4: no change.
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

