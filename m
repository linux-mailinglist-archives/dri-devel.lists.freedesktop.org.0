Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF2650CAF5
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 16:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F34910FF79;
	Sat, 23 Apr 2022 14:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76E810FF79
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650722536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6PrprjwNGAWhYgrjZkK+UokhMmTgkjR3u0Og/Iue6j8=;
 b=RO2WWa1YQBIO+gfTykePKysicR00m3/hnUv/9VRWaJB5EYz/HOHNIP3FjKy+lVvlIgR58q
 T5o6THvxldT/5kDIcpzX4IygoOUuPq/WHDZ61hinOg13wCgP+RFthefsxI/CGiuSfHrnTD
 GpBB6xRwoxH0wbPBAx5RCTcp02wmK4E=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-6hyrPc0UMTOTsJUvViFPJQ-1; Sat, 23 Apr 2022 10:02:13 -0400
X-MC-Unique: 6hyrPc0UMTOTsJUvViFPJQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 u6-20020a05620a430600b0069c0f5ad4e2so7384439qko.2
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 07:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6PrprjwNGAWhYgrjZkK+UokhMmTgkjR3u0Og/Iue6j8=;
 b=yquDs4yOohoUg7fRkWzOPid3rWLh/9Xr/CeGGOdINQJ/54gdol7wD3pUeyuioMvSJx
 XhmGshy2xox629qzx8AjZnMH3U6lMSKjqFFZpoxCWGle0+WFExfU3dZkprrqrkU+NJgU
 ZC76RAFNR3ECe70s3+b1Fl//pV5LeWaL6FIj7OvvilMJ2wZgfQfmQGLD5aPSoE72VVsM
 J7Gm7q/fASQWqufhDSg4i+bNZDTOrbVSrK74elN+rxBqi95WzDzicS0AKCYjt3C7poon
 7R6x2HE7eRp+9WeCYdnjiEgXyhg6wYBE4cQn9MKvjnOETgjs7zWryZEyLw4K5I25Db2q
 QBXQ==
X-Gm-Message-State: AOAM5308HKQFC4ynpqaT6xZxtuyzCQQVKVnVA7sOEMrdMSLnDFOGExi7
 0TDfdfZ6lz00J9bKYmCMt94VCxuO3tl8pNVy/CygCwmXkvHAiT+eGq6zy0AI9prkzKEUf0wN07i
 8kk4xohdS1iv51ti+PhP+AMZF5R1o
X-Received: by 2002:a05:622a:5c7:b0:2e1:d599:9e0d with SMTP id
 d7-20020a05622a05c700b002e1d5999e0dmr6545939qtb.491.1650722533271; 
 Sat, 23 Apr 2022 07:02:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcg5oz2LjpPWSLb0omDfjmbtM63wn8mXV481F9hAK+F7Pn2tt2BhYD5iGuvkhmnzKkvKeS6A==
X-Received: by 2002:a05:622a:5c7:b0:2e1:d599:9e0d with SMTP id
 d7-20020a05622a05c700b002e1d5999e0dmr6545919qtb.491.1650722533084; 
 Sat, 23 Apr 2022 07:02:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a05620a27d200b0069ecf023d1asm2300543qkp.129.2022.04.23.07.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 07:02:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: anitha.chrisanthus@intel.com, edmund.j.dea@intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/kmb: remove layer_irqs variable
Date: Sat, 23 Apr 2022 10:02:05 -0400
Message-Id: <20220423140205.3371025-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse reports these issues
kmb_plane.c:21:11: warning: symbol 'layer_irqs' was not declared. Should it be static?

layer_irq in not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 2735b8eb3537..8fe93d149491 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -18,13 +18,6 @@
 #include "kmb_plane.h"
 #include "kmb_regs.h"
 
-const u32 layer_irqs[] = {
-	LCD_INT_VL0,
-	LCD_INT_VL1,
-	LCD_INT_GL0,
-	LCD_INT_GL1
-};
-
 /* Conversion (yuv->rgb) matrix from myriadx */
 static const u32 csc_coef_lcd[] = {
 	1024, 0, 1436,
-- 
2.27.0

