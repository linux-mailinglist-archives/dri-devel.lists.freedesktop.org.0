Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D34741AB3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 23:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A181510E3A1;
	Wed, 28 Jun 2023 21:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD81510E184
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 21:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687987375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L25XPrE4POZxEhhk2/19p0p2PCDX/k5AJ4PHMsFVmoI=;
 b=BoKSULVxguSud07235RLRctOhRwU9j0pClqh2sITAUxOHhh42fNvpFoxnpYw4ctAEjNPdC
 vHc1O+Xp6gtVWlxaLav/waAoMyiUVmBOe1mei+6CT3QAPln8snz2IXjahqqLV0mnMTQdUS
 lPGg3551CgOb7RerwVTgHCKl18iSE5k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-5BGTwETWPs-k8ksiE1BrtQ-1; Wed, 28 Jun 2023 17:22:52 -0400
X-MC-Unique: 5BGTwETWPs-k8ksiE1BrtQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fa982366acso7665e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 14:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987371; x=1690579371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L25XPrE4POZxEhhk2/19p0p2PCDX/k5AJ4PHMsFVmoI=;
 b=ikEvN6NWvj6CX/ckfSn4GFpEsUVgSe9d/xINxVmrUQwoXtBCaiVkU0Mn0CgZowW/6n
 Y/7mE6Pk8R5yo1kkGAQxKjrIdmj3vaPSR+GrRy4UHGLX6eTBLHeSM89qYk1dRpLCKCGs
 U5rTu9WO4esDm6qsDLbocBlKoT5ZSKWsKeYOQjitFC0uotUkWfYpkypTz3GOMPgtNOEA
 g0AHIQngr638QXRmgs7YvqdWlDOdLhxgYmkabArmP5sgMQCvT6hlCw5/FIqW+AfKYBDy
 pzhKqXnjZJTk/818S6oujW5qCCf4Hy3/VjbO+qxYqV1Sb4QYiakxQoUG/8HuByEe3tMd
 GcXg==
X-Gm-Message-State: AC+VfDzlhEcXvZ4YRcrznmGzFhIHWbLOiQ7froxHHbnJJRFIhuw8r/LX
 HVQM5hOFf1a9OkLXxXfk7bYOdiPdoZeqkrPJUEKPAAiHfGfo1TFieTkUeyCUSkJGR5VlsxF3z6j
 AlrKUtgNAUk+Rf0bVpHNYOwbIJTBM
X-Received: by 2002:adf:f990:0:b0:313:edaa:24f3 with SMTP id
 f16-20020adff990000000b00313edaa24f3mr9337089wrr.5.1687987371819; 
 Wed, 28 Jun 2023 14:22:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HubsUmqIJhwm4B7AbWuPZejQ5/Mr/9PKWcvbTsxn13ECBZOSCiJ2Y0q/28ms0yNC5JG/oVw==
X-Received: by 2002:adf:f990:0:b0:313:edaa:24f3 with SMTP id
 f16-20020adff990000000b00313edaa24f3mr9337087wrr.5.1687987371669; 
 Wed, 28 Jun 2023 14:22:51 -0700 (PDT)
Received: from kherbst.pingu ([95.90.48.30]) by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b0030ae3a6be4asm14294323wrl.72.2023.06.28.14.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:22:50 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/nouveau/disp: drop unused argument in
 nv50_dp_mode_valid
Date: Wed, 28 Jun 2023 23:22:47 +0200
Message-ID: <20230628212248.3798605-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628212248.3798605-1-kherbst@redhat.com>
References: <20230628212248.3798605-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 3 +--
 drivers/gpu/drm/nouveau/nouveau_encoder.h   | 3 +--
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1637e08b548c..6221eaaad1b7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1127,7 +1127,7 @@ nv50_mstc_mode_valid(struct drm_connector *connector,
 	 * MSTB's max possible PBN
 	 */
 
-	return nv50_dp_mode_valid(connector, outp, mode, NULL);
+	return nv50_dp_mode_valid(outp, mode, NULL);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index f75c6f09dd2a..22c42a5e184d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1079,7 +1079,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 	case DCB_OUTPUT_TV:
 		return get_slave_funcs(encoder)->mode_valid(encoder, mode);
 	case DCB_OUTPUT_DP:
-		return nv50_dp_mode_valid(connector, nv_encoder, mode, NULL);
+		return nv50_dp_mode_valid(nv_encoder, mode, NULL);
 	default:
 		BUG();
 		return MODE_BAD;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index d49b4875fc3c..6a4980b2d4d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -267,8 +267,7 @@ nouveau_dp_irq(struct work_struct *work)
  *   yet)
  */
 enum drm_mode_status
-nv50_dp_mode_valid(struct drm_connector *connector,
-		   struct nouveau_encoder *outp,
+nv50_dp_mode_valid(struct nouveau_encoder *outp,
 		   const struct drm_display_mode *mode,
 		   unsigned *out_clock)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 70c1ad6c4d9d..bcba1a14cfab 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -143,8 +143,7 @@ enum nouveau_dp_status {
 int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
 bool nouveau_dp_link_check(struct nouveau_connector *);
 void nouveau_dp_irq(struct work_struct *);
-enum drm_mode_status nv50_dp_mode_valid(struct drm_connector *,
-					struct nouveau_encoder *,
+enum drm_mode_status nv50_dp_mode_valid(struct nouveau_encoder *,
 					const struct drm_display_mode *,
 					unsigned *clock);
 
-- 
2.41.0

