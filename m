Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE34781A8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13E210E297;
	Fri, 17 Dec 2021 00:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B7810E318
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mtq9hJy4L+ZVvskxJioJNZiL+dpEFQcWZvYjYc3YgGo=;
 b=esl87gx59OVn0fCsjCyOl/5LIWJtgLmwUUY3ia3s52t6Px2oFIlZ2QW4UIw3OgAWN3vEK8
 z7dS3fAAp5I6pH7tGHo36couLF89uM3nK1uL+rgrfkqlpnFmf7TzMPvyZmlpChU4K+xohr
 FIV9IwEj9aOfx1dsd1QwcmKOxMIifSE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-PgT8W2cbN2KB5PJXTFy6bA-1; Thu, 16 Dec 2021 19:38:34 -0500
X-MC-Unique: PgT8W2cbN2KB5PJXTFy6bA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso2075397wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mtq9hJy4L+ZVvskxJioJNZiL+dpEFQcWZvYjYc3YgGo=;
 b=ZotYv85ogRk+AjLro/O2F4l7nmv7w4zvLTRND+ynkgqVadmR8r4zd+3sal8HFmO9Ed
 nqegUT+NmAJzlvvgz1BGYMcUGC4/Es0xvUIn2kKcdm6mLkeyvI7A8vCHQKdlv9bapFlA
 yDbl0/YapwmnRairfAzCe1jJg+1sa42TsRWt48ubC5XEmX6fGUj7TWQT2UXUcDQOIdj2
 32L9NAhq0Dbfi66RFW+WvThUdgt988UkMlgvpOfwqtcNNDkaKPU10CSy3R29j5sgB80L
 L2+97lhGcxoEZsnRbV0OIzlBRYn417DqEsjv/O7snFi5Jubl1Ecc1RsXXoITQUrCLVnA
 jcDw==
X-Gm-Message-State: AOAM532Oktr+CVpG1Cugeh3xrKUEe2Z7BDd/VuhRh77U/Mww9+WW21gR
 8z3yXqIBa5Mv1OMYFMT8QTAfHv+FHiDZcR1zQPdOCwTW8oLk1pfqtCMHFIlVppwSI9NE/3Gwp4Y
 uh2Ur6CEtgNKu8f331+c1+AAY8fiU
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr376746wrt.117.1639701513639;
 Thu, 16 Dec 2021 16:38:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZtlDEMwB4C73UbqOCIrjZQR5w2AX4DwoBRjCTOcB54Y0M6HuUoIkYjDPgo1wzkOWj15okeg==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr376740wrt.117.1639701513444;
 Thu, 16 Dec 2021 16:38:33 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 37/37] drm/xen: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:52 +0100
Message-Id: <20211217003752.3946210-38-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---

(no changes since v1)

 drivers/gpu/drm/xen/xen_drm_front.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index e63088c2121d..0d8e6bd1ccbf 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -495,6 +495,9 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
 	struct drm_device *drm_dev;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	DRM_INFO("Creating %s\n", xen_drm_driver.desc);
 
 	drm_info = kzalloc(sizeof(*drm_info), GFP_KERNEL);
-- 
2.33.1

