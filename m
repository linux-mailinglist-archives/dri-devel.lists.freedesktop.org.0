Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081503D202E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD036E158;
	Thu, 22 Jul 2021 08:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5FE6E158
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 08:55:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id n4so2872728wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cfhR1I+S0S5V6bfdmLTBmaP7sTgk2vNuWGSnXX0P0FM=;
 b=sp/9IAgYQd64llZlKrMstnioulZwmVvegO6cOu6Pb+E65EsG7nXSGZHsqDuADuhCVV
 gX8GQmJ/Nuwvbj4qODHQdAFxe4OVroKowyicNtfWzzY4YKMos9smz48H8khcRU48bI6W
 AfIdHy0+S0Z14udelllZ+8vLgS8UbKbyRSs3g3V4YvXjyfMtNcW9tMpD0YGWxqONhWge
 PCr+5k75Ls8N43vEFXUiSbCFqlYES3sD+LDQJxpdNEgRZOt/DsXzHJ7TWUNctBZSgrwp
 iDOnV/CMI3u8yNP1IoZ8APAr5KIcikDToDhJ1DvDB9fR6mgpb2TKHKaozlJ34sdKs8JS
 m82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cfhR1I+S0S5V6bfdmLTBmaP7sTgk2vNuWGSnXX0P0FM=;
 b=cbOrTsIMVHQxxV/aaMSlGW5O28EBKuUe0CILlDlw7lek9plH99MS2+1bmcNq55vvdm
 msCzdV2B+4UCixlxDKSSbJMG459n9iZoTC6nHqicE2YJmSOkg8PBrSPzVGb41syVAvsu
 h5N9pRRKCZhqFg8M02YN3MB6nANTAqGYGjlqSRsUPSIejDqwK6AGUT2dhD0K3FstROHI
 UHD4aYr/uwYtMtuU6zGKbZrx+7pmOEYeQ+VkMnQaSzfyGJUZqO6LomJu2tCHpG4zK1gg
 95OtwmAABzAoy+Zyw2Z7aV5bfKBf9hpyvI4WO4D9k74V97J/NteoV4pcQh3WQg92wdM+
 C0TQ==
X-Gm-Message-State: AOAM5319I6TbgnW7f0WgoJa92RkmARdVfmzsU+ME8o8s/4wjVqDWIhk8
 SPhYrvn1gr8Ta/dRrIcLgsAcQRcOnzU=
X-Google-Smtp-Source: ABdhPJx9a+NdY+ezbggwqO+tlf/XbNVoA8M1U3afee+RAZkiBK+9i1IV7xd9E00d04m3Rcm7x+42xg==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr7838886wmc.43.1626944155790; 
 Thu, 22 Jul 2021 01:55:55 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:ee9:2117:be77:929c])
 by smtp.gmail.com with ESMTPSA id w3sm29130889wrt.55.2021.07.22.01.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 01:55:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com
Subject: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
Date: Thu, 22 Jul 2021 10:55:50 +0200
Message-Id: <20210722085554.1537-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Turned out that doing this in vmw_ttm_destroy() is to late.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index b0973c27e774..904031d03dbe 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -526,14 +526,9 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm);
 
-	vmw_ttm_unbind(bdev, ttm);
 	ttm_tt_destroy_common(bdev, ttm);
 	vmw_ttm_unmap_dma(vmw_be);
-	if (vmw_be->dev_priv->map_mode == vmw_dma_alloc_coherent)
-		ttm_tt_fini(&vmw_be->dma_ttm);
-	else
-		ttm_tt_fini(ttm);
-
+	ttm_tt_fini(ttm);
 	if (vmw_be->mob)
 		vmw_mob_destroy(vmw_be->mob);
 
@@ -578,6 +573,8 @@ static void vmw_ttm_unpopulate(struct ttm_device *bdev,
 						 dma_ttm);
 	unsigned int i;
 
+	vmw_ttm_unbind(bdev, ttm);
+
 	if (vmw_tt->mob) {
 		vmw_mob_destroy(vmw_tt->mob);
 		vmw_tt->mob = NULL;
-- 
2.25.1

