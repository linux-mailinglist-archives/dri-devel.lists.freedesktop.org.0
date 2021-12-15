Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398BB474FF6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395B10E203;
	Wed, 15 Dec 2021 01:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF4F10E166
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65UeodCdnbzrvXZ2QT+8bG67UPU5yAEJBkFAzKsuJLI=;
 b=EZDgLX2Ec1ntWVJSMIRsfFBE/B86frLSJ4bg9WX2Zph5Vw/EZ1Ycvx+K0d3WXM9+DCIwdC
 tgbBN09FQewFNFcMPv0/Ppbev5Exhjc2M8+i1gopdECNgm1RbzQCDIWQrfw3K7HdbQfS8Z
 88qToVLquAZDdGhc9YvnYNhHSrIVFeA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-Pjqoqr1YMJyzI29-0Uw6pg-1; Tue, 14 Dec 2021 20:01:27 -0500
X-MC-Unique: Pjqoqr1YMJyzI29-0Uw6pg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so13883946wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65UeodCdnbzrvXZ2QT+8bG67UPU5yAEJBkFAzKsuJLI=;
 b=kMoFiuG69LAQervNcqNmOLMJgNmqOplJeJ5RqQsNukWatE3FQjQ1yVH513kr2g3RmY
 YuUbCZWO+n/e40ygMHtiLwiG/Ze5TLVgPHWDGoltBnDcoUSX5bkD13P4X5lcqOb40MIM
 LnohUArGOh3F+3lQirNwvFZ0a2Rm6QEWnFQ8L5ZEq+bNHGfKaVHMvzEC/vcF9MpZVZrh
 id6BKsVtMiaLBNp8SCsAcbuLMz/HJ/nW8fvs7vj1EooASjFXsRH/wUWpiWNBdqvExWb4
 /dI5m4lqer8vZ8NfJGPSbtEixeYJ73V1ngT0AANB8CEI0sFZV7Ig37nvpdHLt7VR4W7E
 Epyw==
X-Gm-Message-State: AOAM5325GGOUHsOGd75QNVuuKXlP5o62LmF0mB0dLKV+GeOD/MBCBouR
 o5eCHFSiXKiHmRGY2inLp4+MVX31lhQM95U6y0kCzVIwrhXUFGJYhyehZ6YAMJnAx2KY8yQkhT4
 6vpTeZlrHs/hGTAmCTd+ZA8JHOnzB
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr2414491wmq.22.1639530086244; 
 Tue, 14 Dec 2021 17:01:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA43rTPiBgr4JWptMpZJQkcZxYc3fV7j9EkNvVTW3WS0T0i+Aaq2nD8sJghIjjakqEUKoQ+g==
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr2414483wmq.22.1639530086058; 
 Tue, 14 Dec 2021 17:01:26 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 41/60] drm/tdfx: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:49 +0100
Message-Id: <20211215010008.2545520-42-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/tdfx/tdfx_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/tdfx_drv.c
index 58c185c299f4..d0ae79ad437f 100644
--- a/drivers/gpu/drm/tdfx/tdfx_drv.c
+++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
@@ -74,6 +74,9 @@ static struct pci_driver tdfx_pci_driver = {
 
 static int __init tdfx_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	return drm_legacy_pci_init(&driver, &tdfx_pci_driver);
 }
 
-- 
2.33.1

