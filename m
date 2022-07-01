Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC27563961
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 20:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C1D18ACB9;
	Fri,  1 Jul 2022 18:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F46218ACAE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 18:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656701609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N35X8EVl6N4eTj7vgsDHIfuc6TYftLr3sZ8XvRt4V9Q=;
 b=OW029XiGOIVIvG6C1mNaiKouMRJTLEADNcW9sLTp6sHtK5CGTEn442MtNip2H6yJ2EU54z
 T4uQRvqrrE3MwMz0vCprrF5Rx3ZFIxzIGp2H4YoE24orX4V5N+PtGn6+OAWctNfV3zHpop
 lv2v7URkUo9hsfLmttWRbQezDQwiNBs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-cQI_vZvUO0qBR9jds-SmAQ-1; Fri, 01 Jul 2022 14:53:18 -0400
X-MC-Unique: cQI_vZvUO0qBR9jds-SmAQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 g8-20020a056402090800b00433940d207eso2307089edz.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 11:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N35X8EVl6N4eTj7vgsDHIfuc6TYftLr3sZ8XvRt4V9Q=;
 b=Xd82ulvvEjAhzEzhhYf6quwN5zTlf0QDnM0ubaXUokAWHduCEKFEh0K9PcHZE+ZD2t
 huh+IaL1EUEo26c1FDcRMl8D15MiW1+AvaIwHGB1RzGq6EUn8TImKPc8ssQxE7nTdQE8
 V5TlVksx2IyKDBF0amo7VHYziF0M7XqX0iXgvWvQ11PQW7IcuSH4XtF5S4TPuKZg+CDp
 4OK5SgmyFg/Ee4IqJOasXJSkp+Q9/iysshy5fKoVLnHOzPYkZBNrKe8l2E0KBofTBLgN
 L3gX3LZZ6ZM1HJDn8eaFfChVA64VzhMos4vnpCQ6c5ogXLaA+jiaRUFqsD4COhKKr7v0
 /mpQ==
X-Gm-Message-State: AJIora/tlX5jBPprYkfg0XjMfWNW6uaR6PggAS7h9n7o0Iyjw0vax9/B
 CYx8a/k0DZrkcd9NKjIWOCX+o/twXM2mCUSFeH/+ts3sM/BUk5OeyncVXwOFG8g7goHa4zqe8ul
 xmhFlxeDYGmm96DTXyKRpr6aUGmrm
X-Received: by 2002:a17:907:c0a:b0:726:22b1:9734 with SMTP id
 ga10-20020a1709070c0a00b0072622b19734mr15870864ejc.195.1656701597029; 
 Fri, 01 Jul 2022 11:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v0XHDYfm4r0XmFgHtm8gNeedy8AUdmxbSBjIkcJqyzr9E+jWJqK2lf61vNX6ItKlHcWiTFng==
X-Received: by 2002:a17:907:c0a:b0:726:22b1:9734 with SMTP id
 ga10-20020a1709070c0a00b0072622b19734mr15870857ejc.195.1656701596880; 
 Fri, 01 Jul 2022 11:53:16 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a0564020b7900b004359dafe822sm15406658edb.29.2022.07.01.11.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 11:53:16 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 07/10] drm/sis: use idr_init_base() to initialize
 dev_priv->object_idr
Date: Fri,  1 Jul 2022 20:53:00 +0200
Message-Id: <20220701185303.284082-8-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701185303.284082-1-dakr@redhat.com>
References: <20220701185303.284082-1-dakr@redhat.com>
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
 drivers/gpu/drm/sis/sis_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sis/sis_drv.c b/drivers/gpu/drm/sis/sis_drv.c
index e35e719cf315..6173020a9bf5 100644
--- a/drivers/gpu/drm/sis/sis_drv.c
+++ b/drivers/gpu/drm/sis/sis_drv.c
@@ -50,7 +50,7 @@ static int sis_driver_load(struct drm_device *dev, unsigned long chipset)
 	if (dev_priv == NULL)
 		return -ENOMEM;
 
-	idr_init(&dev_priv->object_idr);
+	idr_init_base(&dev_priv->object_idr, 1);
 	dev->dev_private = (void *)dev_priv;
 	dev_priv->chipset = chipset;
 
-- 
2.36.1

