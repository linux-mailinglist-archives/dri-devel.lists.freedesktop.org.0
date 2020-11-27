Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426D2C6BAA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 19:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF0F6EE9E;
	Fri, 27 Nov 2020 18:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AD06EE9E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 18:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606502377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ou0ihm1ZRJ4jAkiF1iCHhrbt5Qjc5Z5KkD4Hf0ZuyHI=;
 b=R9jNVanEJ1ezxkqvVWKoOZG/8PvzJnrDKOQBqSk2eU6aDBmI5n2sftbN7S1eDCKrQZdGXS
 Nj8vDL5gT1q75brvZ/YeRdY+8WicKNlffKfQDPEdpbyH+UNhOKs+1t23kYjVyj73UnaRIe
 FaeJa87kkV+fZ+jHuGdHuRxHu7zBAco=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-RPoDdt6AOqCh0g1q1hLVqw-1; Fri, 27 Nov 2020 13:39:33 -0500
X-MC-Unique: RPoDdt6AOqCh0g1q1hLVqw-1
Received: by mail-ej1-f71.google.com with SMTP id f21so2265730ejf.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 10:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ou0ihm1ZRJ4jAkiF1iCHhrbt5Qjc5Z5KkD4Hf0ZuyHI=;
 b=Q25JIYuo3MqqWyJs2FmC4CjftpRze+m1GeWgsJBbh5gpiN+1s47qnkE615Otrhk4vE
 Uo4tF0SM+H+fr+qmKrC2KHgsDXXrsSkh0sWzbb8UMxrrZjn1gWNyDyTB+QoAO4BxzZ3S
 Oj5zxiNhczdSloEsFr9wfwQ3UGie0EpJ5xfBe7nm6vbZo2fF6cBqI/3dca6gOc6TDB9p
 O0QcgONLvojbYjrk5Y+PrfQ0GA+F+Nth97LMXrG/4r/W9tibzBxMdYpkPNgXSZeo25WG
 GAQqWZ2lPAxH72wMcH02+4liT7AdD2CXW5Hkx6i34LmW1somql9VG35igHsoewbOcCkp
 mh9A==
X-Gm-Message-State: AOAM531UrAxX7JEazDWPf7ZpwwZ8L8UNhIP1BlSzoYiHv7TCDr6BmDZM
 aViCBqVGGDH6xnbcEXQvDtK/auXKsjTLzH8c9x22gcr+GOwNhNYUmwKqvCqu1d2W7aW9DWhalb5
 BxJ0GRWqLZj09qS6OlOcnZ0mE8HP4
X-Received: by 2002:aa7:c904:: with SMTP id b4mr6985023edt.172.1606502372244; 
 Fri, 27 Nov 2020 10:39:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkC3Xbd/F8jXTqnu8Pk3oYFYI/QqYutxzTOWWhOtVlAUxDjUzKUNCD5oqIgPKX1Dx8fwIt/A==
X-Received: by 2002:aa7:c904:: with SMTP id b4mr6985003edt.172.1606502372082; 
 Fri, 27 Nov 2020 10:39:32 -0800 (PST)
Received: from kherbst.pingu.com ([2a02:8308:b088:c000:e1c8:454f:b858:87a5])
 by smtp.gmail.com with ESMTPSA id l22sm1003900ejk.14.2020.11.27.10.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 10:39:31 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/kms: handle mDP connectors
Date: Fri, 27 Nov 2020 19:39:09 +0100
Message-Id: <20201127183909.2089734-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Mark Pearson <markpearson@lenovo.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In some cases we have the handle those explicitly as the fallback
connector type detection fails and marks those as eDP connectors.

Attempting to use such a connector with mutter leads to a crash of mutter
as it ends up with two eDP displays.

Information is taken from the official DCB documentation.

Cc: stable@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Reported-by: Mark Pearson <markpearson@lenovo.com>
Tested-by: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h | 1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
index f5f59261ea81..d1beaad0c82b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
@@ -14,6 +14,7 @@ enum dcb_connector_type {
 	DCB_CONNECTOR_LVDS_SPWG = 0x41,
 	DCB_CONNECTOR_DP = 0x46,
 	DCB_CONNECTOR_eDP = 0x47,
+	DCB_CONNECTOR_mDP = 0x48,
 	DCB_CONNECTOR_HDMI_0 = 0x60,
 	DCB_CONNECTOR_HDMI_1 = 0x61,
 	DCB_CONNECTOR_HDMI_C = 0x63,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 8b4b3688c7ae..4c992fd5bd68 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1210,6 +1210,7 @@ drm_conntype_from_dcb(enum dcb_connector_type dcb)
 	case DCB_CONNECTOR_DMS59_DP0:
 	case DCB_CONNECTOR_DMS59_DP1:
 	case DCB_CONNECTOR_DP       :
+	case DCB_CONNECTOR_mDP      :
 	case DCB_CONNECTOR_USB_C    : return DRM_MODE_CONNECTOR_DisplayPort;
 	case DCB_CONNECTOR_eDP      : return DRM_MODE_CONNECTOR_eDP;
 	case DCB_CONNECTOR_HDMI_0   :
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
