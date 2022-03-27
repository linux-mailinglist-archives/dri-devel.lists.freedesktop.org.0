Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D144E863A
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 08:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6974E10E1A2;
	Sun, 27 Mar 2022 06:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0910E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 06:15:23 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id t4so6723431pgc.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Mar 2022 23:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=zQojn1+l5AZVyTtTxvOBeZeYl0iCp/EsKmxH0UlfEcs=;
 b=Hibwc5S0U7wcL6DejpbxHFA4lwtNZXXluK5w0lQDctDdwmhutQeqQBn0No39o26MwV
 gJG5BJCw1+UelUqn/tGXf3SFwVIPDpmpiPRSZ+u1sY3f6iqKckD719pRDZc973b4EXde
 R/a3pJSpYS6ro2qo3aZVIvSxfLYGAYktqScZAeFd0+/KnFt80DQVgCDhTtNBLGxmyS5T
 wgahD66mgtdWO8inc+hftRU9X4Zks5RVn+SEKX/vKLDEW+TKTNipJOxRacru4iMCdTcJ
 LKDDpszpxqgA1TWeikNnHOoZGSRFkAxqIpLH9InpiH+8DcW/Xg321+8hqxml1LWEvNuG
 298Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zQojn1+l5AZVyTtTxvOBeZeYl0iCp/EsKmxH0UlfEcs=;
 b=t9LJIbYJUGGKC4jXzAoQG6lVN0bzAYKqPxx6nPI9CgNPSHhJKX8ptS0REMOYzs4pyl
 GX2uoQmdJ8wCV0jAi5LdUDQ8NJ/Dd4mBMTQSCW499a2Jy/AViaHt+pRN5Uhx8usBsiDt
 Cm8d2GFS31SN0vgP9YCeXZeNVnNnsTGBqn9mIUhJVuCfho0WKsMOVAEDf5y00NkSBcnT
 7uoSuPz3U98XkQ3lVdneWiXmYGOC9F39NWSSLDhsYzLfyJBW3KTxe9CiKKRyIecB55wl
 QkpvYdG1UL7EjuYUjNQPNUy7SyozbU8T5PV6G54jg0nRGgIbm/wQYWaxbHEGTQ+R9iOS
 /Xog==
X-Gm-Message-State: AOAM531k0cw43hw2TrDjJpTxwh3oHV3rcjZT9Dtk3Ki4UXO6G73wEp31
 C3IiRN+T11o77B1ZTCgp+f4=
X-Google-Smtp-Source: ABdhPJwA+6yTY8xKsO78Xv/GnGsfLJkWH/TmLye/R0ryZxaUbH2KjgQoftfUHWRZJBP0X7DIXlyr1g==
X-Received: by 2002:a62:5583:0:b0:4fa:c74c:7eaa with SMTP id
 j125-20020a625583000000b004fac74c7eaamr17732239pfb.23.1648361722864; 
 Sat, 26 Mar 2022 23:15:22 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
 by smtp.googlemail.com with ESMTPSA id
 u204-20020a6279d5000000b004fa58625a80sm11650684pfc.53.2022.03.26.23.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 23:15:22 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: jyri.sarha@iki.fi
Subject: [PATCH] tilcdc: tilcdc_external: fix an incorrect NULL check on list
 iterator
Date: Sun, 27 Mar 2022 14:15:16 +0800
Message-Id: <20220327061516.5076-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: tomba@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bug is here:
	if (!encoder) {

The list iterator value 'encoder' will *always* be set and non-NULL
by list_for_each_entry(), so it is incorrect to assume that the
iterator value will be NULL if the list is empty or no element
is found.

To fix the bug, use a new variable 'iter' as the list iterator,
while use the original variable 'encoder' as a dedicated pointer
to point to the found element.

Cc: stable@vger.kernel.org
Fixes: ec9eab097a500 ("drm/tilcdc: Add drm bridge support for attaching drm bridge drivers")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 7594cf6e186e..3b86d002ef62 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -60,11 +60,13 @@ struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 int tilcdc_add_component_encoder(struct drm_device *ddev)
 {
 	struct tilcdc_drm_private *priv = ddev->dev_private;
-	struct drm_encoder *encoder;
+	struct drm_encoder *encoder = NULL, *iter;
 
-	list_for_each_entry(encoder, &ddev->mode_config.encoder_list, head)
-		if (encoder->possible_crtcs & (1 << priv->crtc->index))
+	list_for_each_entry(iter, &ddev->mode_config.encoder_list, head)
+		if (iter->possible_crtcs & (1 << priv->crtc->index)) {
+			encoder = iter;
 			break;
+		}
 
 	if (!encoder) {
 		dev_err(ddev->dev, "%s: No suitable encoder found\n", __func__);
-- 
2.17.1

