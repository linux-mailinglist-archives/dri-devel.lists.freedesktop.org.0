Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FCB1A94E5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC2D6E8CD;
	Wed, 15 Apr 2020 07:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD19189113
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v8so14257434wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bRo5nnYVjQqUFDXALZZ8AWPrX15JFoOTAWWiUZPvoHU=;
 b=UeUH8xtoWK03WW9cgtVtUf7jjExZorCMNdrtJD3JM8aArNbhnXCUQzK1dXs96Cu4Xp
 6D4VA7smjFJRDiK2DW4vE9pqWV68L2kWDThjuyN1aDCdSBqakXK+oO2ZkVyQEDUGVVdw
 U21Thd/EfXiNVYOyvCfBZ7AVmoALJxWR3IIS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bRo5nnYVjQqUFDXALZZ8AWPrX15JFoOTAWWiUZPvoHU=;
 b=d1C/JRAOFvnk+xJsuTFv5fmN0Zf/6bVYfBhLqjtPPTwmB7XHlZ1L317qnzfnvN0yOj
 K3PTUyTOrhvKIGRogwNRhKbUUB+sHEN8CYBQ750uDFrmeVxb7QVv9J2azKRmco2JnWfH
 LFZAMGIvXrMIItRJTMsYrW7RZF7beJh8boRgr9vd3ppXa/XQfrssaEbCQZ5zeKE4Oh6+
 jM4qk79S1Tj193pQUjHJcw4cIhxSW0PbRA3RZ9TfCvl5XwVvSzdrNagLoOac3Gd626Pq
 /dN2FtxZwSw0y5UutSiaz+Nt9h8dlZS7SniVW8kcoxQbxGT+gLEduBu9TNmOzG+MKq2w
 g1qQ==
X-Gm-Message-State: AGi0PuatPApFcX3UwqxthbGIs+yHuXfbPKYWN+oM4ENVBGvKEKug8yBj
 YwXGYa/aBIVavrHX5UJz1L5eHg==
X-Google-Smtp-Source: APiQypJCyVoc+uOonOx78MUzc0MyyQ0zz28obMi0VrDQtpefH8pWjrYOCniQ5/J7ZtET42keTJUd2A==
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr3566826wmc.64.1586936486545; 
 Wed, 15 Apr 2020 00:41:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:25 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 44/59] drm/arc: Drop surplus connector registration
Date: Wed, 15 Apr 2020 09:40:19 +0200
Message-Id: <20200415074034.175360-45-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_register does nothing before drm_dev_register(), it
is meant for hotpluggable connectors only. Same for the unregister side.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
