Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F624DF44
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 20:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29EF6EB9A;
	Fri, 21 Aug 2020 18:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C37E6E35F;
 Fri, 21 Aug 2020 18:17:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o21so2714190wmc.0;
 Fri, 21 Aug 2020 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e9mgWK2XGSNejzbIShlVyw9cGX/rfpxZBl6ecAIWVy4=;
 b=U1RMeYpO/R3D0KkHNbNBvdec2Ilv4X2DVT6cg7YWvJBJyr7LQEvHzb3ckqKq68DVFm
 RsRUGzqv/WxLZK3Ra8Ltsx0VpS9Nm2U4v36uz5Gdko+Ri25kYHv6U+um7ZdElR8K7Dw/
 HqzkCnPlQFRcCC7em/+xF+0lYKLncg4wtSXcbZGaf0FE8WPeaOt8vibrr629BbJmM61p
 qp7WtPK/yZNGKGnX1L1ZQioE7kTt0gsJkEepvSHdZdvSk0mvV1xNIoPESorbzRozFGbJ
 zX+7EPIlzni4Zo4T2cqRKpKyhby7lUTu0H6BRCyDJNUG4yxYqwlHdyDfKKFEQu+JnDUw
 Esjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e9mgWK2XGSNejzbIShlVyw9cGX/rfpxZBl6ecAIWVy4=;
 b=p/TYqeKKC6KLrv3CY7UZSDMuyrNZ0xbCbPNfVQNCTz+J18yePAFpCZAMtONFXnXeIE
 GLfmmhgvWD+xBEDkYZgeSCLUn+H6LUHcbot2yJO2tIZwurG9FpgTKon3y8Q1Kg7qRyVa
 Agsmj/EgzGfP6igNNfCnAoXzbWfwvVgg/jxahB2KB34IKkP3E98HKNCJlus7DjbOJ6dG
 80JKIxKt0OkeqJfA2yNsgG39Ld1MMBr6yHNG+bQOZ46YeFN1OxMQPEPEr+/8sDZWK7Bc
 wLSL2eRGPpEPtNpvpH8Ht0qij995nNICfiJWMamyLeBJB03CeBUvtPlkFxA2eVI/EcYi
 9ryw==
X-Gm-Message-State: AOAM53262Fzzmy6E/TmJPteozWf+if1kkLeY2jK6nI1blEaPnenC7th+
 mw0WAFPMRO3EmgN2pvHcOX0=
X-Google-Smtp-Source: ABdhPJx02d4XOG7VYqgRyJ3CXMYtjC4XDFgkKLRpCBjewDqHRTpYWKRwPvdZEbGLgWlAXvNJ0sGNnQ==
X-Received: by 2002:a1c:a9ce:: with SMTP id s197mr4753684wme.45.1598033855273; 
 Fri, 21 Aug 2020 11:17:35 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id 69sm7859719wmb.8.2020.08.21.11.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:17:34 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: fix external abort seen on GC600 rev 0x19
Date: Fri, 21 Aug 2020 20:17:27 +0200
Message-Id: <20200821181731.94852-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, josua.mayer@jm0.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like that this GPU core triggers an abort when
reading VIVS_HI_CHIP_PRODUCT_ID and/or VIVS_HI_CHIP_CUSTOMER_ID.

I looked at different versions of Vivante's kernel driver and did
not found anything about this issue or what feature flag can be
used. So go the simplest route and do not read these two registers
on the affected GPU core.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Reported-by: Josua Mayer <josua.mayer@jm0.eu>
Fixes: 815e45bbd4d3 ("drm/etnaviv: determine product, customer and eco id")
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index d5a4cd85a0f6..d3906688c2b3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -337,10 +337,17 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 
 		gpu->identity.model = gpu_read(gpu, VIVS_HI_CHIP_MODEL);
 		gpu->identity.revision = gpu_read(gpu, VIVS_HI_CHIP_REV);
-		gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
-		gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
 		gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
 
+		/*
+		 * Reading these two registers on GC600 rev 0x19 result in a
+		 * unhandled fault: external abort on non-linefetch
+		 */
+		if (!etnaviv_is_model_rev(gpu, GC600, 0x19)) {
+			gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
+			gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
+		}
+
 		/*
 		 * !!!! HACK ALERT !!!!
 		 * Because people change device IDs without letting software
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
