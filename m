Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8911E563979
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 21:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D2818AD87;
	Fri,  1 Jul 2022 19:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF9918AD7C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656702160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrqIOUaKKQbWi9G365N+s7BAFB2QpummhvZ1Qj6rHlE=;
 b=JKoy+YCd2xVIq13MDcAFEdyNIZsnb0Oin9x6PU1ldGOX1Mb4OcllxtlL2sNt8tXrFTRO5K
 moeMvSDVPcVrIVYLNVmCL8ZIeppRxYXCQ4mVhDnK5l0VeAxD2ZzzRWvAGAXRzeZkU60+Bs
 LWVulp0QChtxgHCFxXo7iROJsX+dPqs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-Efyt-I2qN3-6HDnvG32VqA-1; Fri, 01 Jul 2022 15:02:39 -0400
X-MC-Unique: Efyt-I2qN3-6HDnvG32VqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m17-20020a05600c3b1100b003a04a2f4936so1758314wms.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 12:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jrqIOUaKKQbWi9G365N+s7BAFB2QpummhvZ1Qj6rHlE=;
 b=u0L1v3Eq1HHYcY0Bhm+LWOhJbvRk+tGMnIvCF/F0gAmS2OFVtK7z6cillgdDS88Fb0
 qk2R1ZpIuWkAcVVE3nE2fNPMaqq/k2eK/SNcHTjv1NKjcG9Cfba2mtAdN55+Hj570cFM
 G8iugXQ4qq/YZJJ83FwSuFdBfwIZ6elKDbGSiPELfA6CMyMbqHldzxHk/oULWveEqdRU
 9ixCjpSid9Fgify2EF2RXVcQrhY6EJIaKTLDkaydP7Dw2UmC7gvZ4em/apeNFMfZEv13
 GLXDiXbEnL7x2tvCgAwA9f25pqGhsoYgUIVi6xExUbSMw2x9jNOKZfBfcKKitCcmtWpe
 181w==
X-Gm-Message-State: AJIora9mSZysn1MjJHoT26skpkaLX5FTTosHU2fRYK4h3CI8iMAslHTQ
 YO5AICWVXAMEqPxoj9Q1VLm1W29VGlF+fO10Ay+XYD3NEKyFEtwPy1O3oACAP3kLdpO9Hyp1Vfx
 E89scOOwCuPEAOW8FK/wS24Fj8fuX
X-Received: by 2002:a05:600c:4f81:b0:39c:809c:8a9e with SMTP id
 n1-20020a05600c4f8100b0039c809c8a9emr20291077wmq.39.1656702158839; 
 Fri, 01 Jul 2022 12:02:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vV8/aKK46I0XwYmtYH6nEdafsMBLfquMnfV6l0ttdxxkjxJCItV0d0EK67aRhPcMUKsTmmuQ==
X-Received: by 2002:a05:600c:4f81:b0:39c:809c:8a9e with SMTP id
 n1-20020a05600c4f8100b0039c809c8a9emr20291062wmq.39.1656702158674; 
 Fri, 01 Jul 2022 12:02:38 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0039c5642e430sm12535470wmq.20.2022.07.01.12.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 12:02:38 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 09/10] drm/via: use idr_init_base() to initialize
 dev_priv->object_idr
Date: Fri,  1 Jul 2022 21:02:26 +0200
Message-Id: <20220701190227.284783-2-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701190227.284783-1-dakr@redhat.com>
References: <20220701185303.284082-1-dakr@redhat.com>
 <20220701190227.284783-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danilo Krummrich <dakr@redhat.com>

idr_init_base(), implemented by commit 6ce711f27500 ("idr: Make 1-based
IDRs more efficient"), let us set an arbitrary base other than
idr_init(), which uses base 0.

Since, for this IDR, no ID < 1 is ever requested/allocated, using
idr_init_base(&idr, 1) avoids unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/via/via_map.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/via/via_map.c b/drivers/gpu/drm/via/via_map.c
index a9f6b0c11966..c20bb20c0e09 100644
--- a/drivers/gpu/drm/via/via_map.c
+++ b/drivers/gpu/drm/via/via_map.c
@@ -106,7 +106,7 @@ int via_driver_load(struct drm_device *dev, unsigned long chipset)
 	if (dev_priv == NULL)
 		return -ENOMEM;
 
-	idr_init(&dev_priv->object_idr);
+	idr_init_base(&dev_priv->object_idr, 1);
 	dev->dev_private = (void *)dev_priv;
 
 	dev_priv->chipset = chipset;
-- 
2.36.1

