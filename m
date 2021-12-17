Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FDA478187
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B4710E254;
	Fri, 17 Dec 2021 00:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53ED10E22A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9Kdv1BnC84e2FlVjxnWyfJZeNCXcvPbc+pBmSsvwjo=;
 b=ULSFpqxX+IDQNUXTEwix5dLmfOavMvteorrtF+9gP96fKhxve5Fi/ejDCt9m5okEwtARmf
 E9TPp8kwbq7mvv+1pEoqPUHPMLz9rj4ADkUrRw2wxz7n7Qb5rINOsVjdo6eQ67Ax+lMfsZ
 X77bTrax+CG6yNceWK0DzreHW0ECK98=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610--fd1zYvJN-WZ7iGlOZUs4w-1; Thu, 16 Dec 2021 19:38:15 -0500
X-MC-Unique: -fd1zYvJN-WZ7iGlOZUs4w-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso2075061wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9Kdv1BnC84e2FlVjxnWyfJZeNCXcvPbc+pBmSsvwjo=;
 b=7kyXbGcR/ZdN+rMhJVw1QthkIzdC3jElhLw0A580kVeoLW/lbyIrrcPaJFnO/CkoVv
 KO4AWRBqqXnghq7KLbsvJ6TfPNNquMKceQCzUQwyLXQEa5wIkvT8bzhoOd+2R0L3U7mY
 FheNeg/24LJNOnhbnACMMUytQju5ujdg7o7WaSakqtwG4SXjRwTxjzkWA3hN364UjA5t
 2MyhVE7oRGihuIDSq3/KXPeBCa5OMwaMAii5CAnA/NCGjNXhrVtR+yYNpVZU8VXH1fCY
 v77Bw/K0++nWX/PXxIaJXApVIn9SaB0cLgKYGxD2ebkJTuE1xErq2vfPy9tdoR9xEvQz
 IfOg==
X-Gm-Message-State: AOAM5317sNj4vnMJ8Kjkd9Fp/6dZ72862ydXRoaSdiwMGkOLljrK+WDA
 dSNcxFf3Zn85Patu/xC9HrnObbfrpbhlnQ3WOW2n14nhW/zTFldIGZL0t5aKb4r1vCcxAwy7/Pi
 lWP4I7fNComwk/lVVWXfMErizvb/h
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr380960wmh.26.1639701494577;
 Thu, 16 Dec 2021 16:38:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0aQVRZeEw66cSjF08xLNomjEmR4MO0MznUe6JE7kwn91N5Yo6B9M66D/DXIcmCuZ5gFpJ6g==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr380950wmh.26.1639701494362;
 Thu, 16 Dec 2021 16:38:14 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:14 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 16/37] drm/sun4i: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:31 +0100
Message-Id: <20211217003752.3946210-17-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Chen-Yu Tsai <wens@csie.org>, Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun4i_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index b630614b3d72..4a2555509e7d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -441,7 +441,7 @@ static struct platform_driver sun4i_drv_platform_driver = {
 		.pm = &sun4i_drv_drm_pm_ops,
 	},
 };
-module_platform_driver(sun4i_drv_platform_driver);
+drm_module_platform_driver(sun4i_drv_platform_driver);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@free-electrons.com>");
 MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
-- 
2.33.1

