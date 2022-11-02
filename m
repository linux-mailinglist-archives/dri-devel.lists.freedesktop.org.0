Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C32616178
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 12:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7290210E479;
	Wed,  2 Nov 2022 11:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3425B10E479
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 11:11:55 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p21so12382917plr.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1OuwW2usJdNl/cGqK4nMOpD/moR27gN+SLRJ4Leuu4k=;
 b=dRw3oxn3H53aACjL3GYfw7dtwdvsMK1880QSOHc59/ENT8bkAlKRHZT/hOalamoG8/
 9lc50vfEbZWhSJJZjkhZLOmtLUSU31heslpkhmNAjYYxFkXjS8j/5WSP4db2CM/uG950
 Hl4ntpNuQxjSezhjmi+JIW4nge0sJbjJM0mrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1OuwW2usJdNl/cGqK4nMOpD/moR27gN+SLRJ4Leuu4k=;
 b=d1PTL4OEmWpVoQbzfMhfKX9cA+P8tJ3IlUJCW+fR1rp93nDm8XjSwLwgO/9TfyaK43
 PKlgBTj4O4hAE8tPpXL3N85K5JIj2PHXvSLmRKwWbPtcFeTVhaf4ctnagdrAy4pSVDA/
 mQ11ZDzpnW+79jTXGGXR+UjwPFNeOjJVh/MjaqGhirmvg79EDLiyMpeB6qNcWw/wJkmE
 rDd9D3kVZYDw3gA60TU7cUjo2YSN3btajOo3JVqjSgYSxE1mADqEsXcUlDsSkMa3cTer
 w2k6JcRr5z3rLUfAwyRRUq7HsaSEK1KyML/li/ZwwSPgLrcJoDC7IUcdA/+bdiDKOvwL
 q/cw==
X-Gm-Message-State: ACrzQf3URj5/7iY9+EVXDL/vHYnrrrS8FVd2N5/CYWwSlw3/Bi/muNeb
 hweVqsAIP+v/WthbkXANsEvUIA==
X-Google-Smtp-Source: AMsMyM5kCsXr8PIzvmvnr/4VaFllwoBCEHVIe32zo8K09x0XPU02eVQneRy/Zg3f6cB6QlU9qF/Exw==
X-Received: by 2002:a17:90a:ca13:b0:213:b85a:3bdb with SMTP id
 x19-20020a17090aca1300b00213b85a3bdbmr21181722pjt.97.1667387514709; 
 Wed, 02 Nov 2022 04:11:54 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c30f:38e9:6ba:158b])
 by smtp.gmail.com with ESMTPSA id
 z20-20020aa79f94000000b0056246403534sm8251048pfr.88.2022.11.02.04.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 04:11:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v3 2/2] drm/bridge: anx7625: register content protect property
Date: Wed,  2 Nov 2022 19:11:47 +0800
Message-Id: <20221102111148.1810314-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
In-Reply-To: <20221102111148.1810314-1-hsinyi@chromium.org>
References: <20221102111148.1810314-1-hsinyi@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set support_hdcp so the connector can register content protect proterty
when it's initializing.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b0ff1ecb80a50..0636ac59c7399 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2680,6 +2680,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	platform->bridge.type = platform->pdata.panel_bridge ?
 				    DRM_MODE_CONNECTOR_eDP :
 				    DRM_MODE_CONNECTOR_DisplayPort;
+	platform->bridge.support_hdcp = true;
 
 	drm_bridge_add(&platform->bridge);
 
-- 
2.38.0.135.g90850a2211-goog

