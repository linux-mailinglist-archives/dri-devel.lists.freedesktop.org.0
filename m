Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70428474FBE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFED10E13C;
	Wed, 15 Dec 2021 01:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E88610E12E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWbGxoeNjdbDmyKcp2OndXPUITxm5AAUodTQYAK1CmA=;
 b=XAV9bZ7fEWYk5FqgRyVFX2a8G9+SjNPs8BLyOngGYkHIqZ8p9BGqtRDs63gSt6LcGu1ClH
 6a8rVd5ojkYgqogIj+r8TsRgkBbmli7AftYnXZ7Xlyh2r3j2BXRDzJwYF01AdZ3RXnx7eI
 l8VNngidgSatYxJAGPfyGYNYLJUffaU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-nS3y1XYNNtuheS9uZvk6oA-1; Tue, 14 Dec 2021 20:00:56 -0500
X-MC-Unique: nS3y1XYNNtuheS9uZvk6oA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so5415818wrc.17
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tWbGxoeNjdbDmyKcp2OndXPUITxm5AAUodTQYAK1CmA=;
 b=NGDk3W26s5W6wiKLNH/n1Dtk+NRQgXe9oC3WyBFi31ZBMKjThYf4+8anukiCfswr/J
 RnViZ3M8xQZcI3PFXLE6HZszOOg1EFrbtdsnjNk7K5b2/tLzD9T11MHVjFZXN/obayCv
 IJtOW7b8JngU0MVqV1PzMw9Xc0Jb1momyItMGBRbBniJZTgeS+RBR7hGFOqnCJFxNB1i
 ZQz1/zj2Mf4aNxOLoFD318OmfKZerogg+iZ3PUG0gTxtZlVHCC0KpXQq94x58wqpx14E
 PsGRg/yAS1vji44ENn85BNg2rKOVC+wTUqMKoCpL9g+8JjVQg9npqMfoc4ttCWoDMSfk
 qwEw==
X-Gm-Message-State: AOAM530ZXhIIzi5Y6YvU0Q81qEd78nZzbSyQDVSdhmcvW0CLZmwZFMoG
 +ULWHxzRnPKi36Z/5lkAt4puKai2fntQqho23hrKptdW+oyBW3+SrueqIl9lpcVEP1bVyocu611
 8JYT6SXSyNEMR5KfWQ9pwEGwDpjFw
X-Received: by 2002:a5d:4690:: with SMTP id u16mr2171663wrq.321.1639530055076; 
 Tue, 14 Dec 2021 17:00:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwByjifmeznMHXNDjsmxy2X6/X9Po4NZarhy11WUEg5MGrKc9cEAhQBDaQMyUvnYgZ4LTTOfw==
X-Received: by 2002:a5d:4690:: with SMTP id u16mr2171646wrq.321.1639530054875; 
 Tue, 14 Dec 2021 17:00:54 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/60] drm/atmel-hlcdc: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:14 +0100
Message-Id: <20211215010008.2545520-7-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 1656d27b78b6..4637177184ce 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -747,6 +747,9 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 	struct drm_device *ddev;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ddev = drm_dev_alloc(&atmel_hlcdc_dc_driver, &pdev->dev);
 	if (IS_ERR(ddev))
 		return PTR_ERR(ddev);
-- 
2.33.1

