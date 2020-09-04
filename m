Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4506D25DC10
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122126EC22;
	Fri,  4 Sep 2020 14:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A756EC1F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:08 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so6281679wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=du/z75457y6KI1rsQmBRtEQ4cXiJI1WVzJRMvyz/O3E=;
 b=O0AR/e4rSWoS/mHwwcO30vgbZIBmW5cF2/mKIMzDpdw6TiG4uHSpWQE5Pik+5YQZmD
 N5AoPcHOaZyHd78CDcUFyPC5WOz7HnGmsiQbRfSvCiu9XJmV5dXdbsYI9WCwWNVKL86A
 1orrxZ9LdvOJMt7Mw2IROBnQgM+zRcZAVib9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=du/z75457y6KI1rsQmBRtEQ4cXiJI1WVzJRMvyz/O3E=;
 b=E6qdk5NRMellTMxrmQV/Ve8WNTCfav9sSNSvyUxNe4NUc6l597GmemjXF1HqEqpav9
 vLxsOTKNlz90+E309J2Z84fujp+HbJJySmbORsgMP7W4t9LUeAYsC2kBORw/2IYo86Ro
 D9trOqwWpgE7RfhBzz/rQFO9gEsDOQBczUbdFdw/HG5m7fVhOIHBlLZ4rEIAVvppZFKB
 3WZPvRKJubi1utsxAEwd8uJ3R2Dk85H9xaFXWP/MZtYLFcYB1O+OxOWy/SyNflAmrUfg
 OQw7ogTASsuXU65o2P27ZGAuMTSEHO3kYvLWPsI+lsikILOPSEs+4AzET1SXMdOCojx4
 LUBw==
X-Gm-Message-State: AOAM5337CRlfP2Q9S/TlViZoCOilBaCWyS2RS9SvUKTFAURlixyiH6ty
 6Xj9FcPSvQ7e1IRcVdp5pZ0sUPa2C5r0X4pC
X-Google-Smtp-Source: ABdhPJx2VS/zkTx2NmlxxniPZd3sxAnKtpQbp6GS47CjxR1z9nx1eqsz0p+ByDvUCPEQ/u4PbSbw7A==
X-Received: by 2002:a1c:e917:: with SMTP id q23mr7694766wmc.125.1599230406838; 
 Fri, 04 Sep 2020 07:40:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:06 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/24] drm/arc: Drop surplus connector registration
Date: Fri,  4 Sep 2020 16:39:32 +0200
Message-Id: <20200904143941.110665-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_register does nothing before drm_dev_register(), it
is meant for hotpluggable connectors only. Same for the unregister side.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_sim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
index e42fe5d05a3d..3772df1647aa 100644
--- a/drivers/gpu/drm/arc/arcpgu_sim.c
+++ b/drivers/gpu/drm/arc/arcpgu_sim.c
@@ -29,7 +29,6 @@ static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
 
 static void arcpgu_drm_connector_destroy(struct drm_connector *connector)
 {
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
 
@@ -80,7 +79,6 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
 		dev_err(drm->dev, "could not attach connector to encoder\n");
-		drm_connector_unregister(connector);
 		goto error_connector_cleanup;
 	}
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
