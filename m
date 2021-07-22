Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3E13D2373
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 14:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16766EB1F;
	Thu, 22 Jul 2021 12:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7DC6EB1F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:41:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso2884106wmm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 05:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQ87wOwH9xOd6jFHhuQOQ/bBNNUz8U9SO0pUyg9uERw=;
 b=kvaN9Vix7vlJStvH0NKIF+CaxL99XOM1hrpRf+Vor3wL2hi9O5iEyxoEGIPSQSYaOR
 B4ew8jvf1jcGtgr3zeWkb9R87/jfU211JXNJ7JX4GzCoiYTNgu0R0M6aESZxpPVRSkEl
 D0vwRL9GqV52mibZfkpiJd49iwf5zIgxiQIfHu/gAAUH5ohrjFcimiQLLVwKXxc6k+eK
 IZIoMskwNa4QuOETYfda9vVMuCcdjFdmy+sWTuy1LUCfblmn9oiz40ExiD8LIHnuBLzD
 CWa49ZQ+7Q4DQpIDsGx4jG1ycKR2Ua9VeCckv7YWDwpnW1NAgDY8M4B6mre+1nKQQx71
 0dEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQ87wOwH9xOd6jFHhuQOQ/bBNNUz8U9SO0pUyg9uERw=;
 b=Y8pok5UbUsS4fvkUFTqLcxPAjgOcbyZoKWRdWoB0Neum2P5KZj2K9Pm6waerXRv4wH
 wfodFbg9bnE3C+IJ9H2jHMmbzfOq34z1u4kTG78RCmEIfJyhVVv+frG6Bfd0uO6WJP1Z
 EnmpWDUKDHhcL07ZEV6KS/EbgzkEWORvoTncyN2UI06rwG7o1dugD0ecVV4e5oi4CSPZ
 S/UAMsWvf+X2Xh5I319cCYOh2OmKmrgxc8qYiRhOQGqjCSZRNsFfJYW/UnXFw4pQ1fda
 D2/dJqQOFkjJa5RnYb6QpbLA01URnWeA/5UQ6dO25LsNSS7tbW2l9UbtSyMKlaDZZAvy
 A/Yg==
X-Gm-Message-State: AOAM530P8nFBPDNcNmxYvlwDIv+Gukh2DljVxURPSRIki45X3p2Yu8iA
 8qH0rS1PduOgUlt/9bk4HIJE1ayorFE=
X-Google-Smtp-Source: ABdhPJymRsQalmmJP+os+oR4BmTS0SBWxSrtkVZksHPgOEMe2uOBLvII7x+EkvvEBKjLetU/t1d/1A==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr8882192wma.73.1626957689119; 
 Thu, 22 Jul 2021 05:41:29 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6c5:784c:9ce7:760b])
 by smtp.gmail.com with ESMTPSA id w8sm18545133wrk.10.2021.07.22.05.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 05:41:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
Date: Thu, 22 Jul 2021 14:41:23 +0200
Message-Id: <20210722124127.17901-1-christian.koenig@amd.com>
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

Doing this in vmw_ttm_destroy() is to late.

It turned out that this is not a good idea at all because it leaves pointers
to freed up system memory pages in the GART tables of the drivers.

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

