Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAB474FD9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90D389FDB;
	Wed, 15 Dec 2021 01:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4136F10E160
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Vk2qnrhEf+Kai7YeRcT32BEinF6P94Q+jPpKbZkEq0=;
 b=K49YNpOPzIHlE+Mo5c6erdKdLZktGW1ESJpdzHzWxk+3imzNWKlpeEcIB5H/R8I9ygatjz
 VaPobaNLq6uiNMvV3a2kX3PyN1KlwmimmcL6v1k72DWR5iIhUOUCII+lO+RJ0p1KHBkjYl
 zmiuaQPWI8x7OB0vKKzAjwohHIrJUeY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-nj-PV0DwNReXj7FiRFk_vw-1; Tue, 14 Dec 2021 20:01:21 -0500
X-MC-Unique: nj-PV0DwNReXj7FiRFk_vw-1
Received: by mail-wr1-f72.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso5426887wrw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Vk2qnrhEf+Kai7YeRcT32BEinF6P94Q+jPpKbZkEq0=;
 b=nP2JlklEg9ABbi3tZbe1KsqMlVBwf4841QrHAQ+I5iDP0MTC4K9wjVyLya4faTZtA3
 RLiDlbxXlkDn9zZ4wcZ4HSH/UdkoFkm2fkHFU5o4M7op0F2BMM9Om+pFre5pSNtnKos2
 7D8XVsg3+ZgGTBCBxxmXXDV2ALMsPLrFlmLVvojwnNVwKUQHo1xO2BBM2Adm9kB1SUn1
 Q5Lj3wvqf5F5LddH5G+/NVsjvWYTcpgjhRHeKzOmSvXC68dALT96kK7Gw5WTabFcb61r
 13eaUBRxjDqEavVG5EF40nnuZVGLp8XI89ieyLmSe60N6t0gLgFiw39ek9C57zSgbGsy
 guBg==
X-Gm-Message-State: AOAM53220LXcKf8C3kD+XwbnuwU+lpJ+Zgut+19ngaGNbjpz4TQWUDI3
 LHipY04E+RezlOnef12ynxgwzm3IMlz8f+udDPe/q4X0VeolK3zZwkTKMXFolj2tCI+s+cnthqX
 yk3tsJpJcL2WWILNpTj82caKXfNat
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr2274518wri.6.1639530079925;
 Tue, 14 Dec 2021 17:01:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpgf/synfrDivMDCeU4Ykh/9ngl8VnGKCZ76Fqha4/HBFuKYtD61t4V9M6O1vIOzMH4S9syg==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr2274509wri.6.1639530079778;
 Tue, 14 Dec 2021 17:01:19 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:19 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 34/60] drm/savage: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:42 +0100
Message-Id: <20211215010008.2545520-35-javierm@redhat.com>
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

 drivers/gpu/drm/savage/savage_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/savage/savage_drv.c b/drivers/gpu/drm/savage/savage_drv.c
index 799bd11adb9c..bb3f12874178 100644
--- a/drivers/gpu/drm/savage/savage_drv.c
+++ b/drivers/gpu/drm/savage/savage_drv.c
@@ -74,6 +74,9 @@ static struct pci_driver savage_pci_driver = {
 
 static int __init savage_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	driver.num_ioctls = savage_max_ioctl;
 	return drm_legacy_pci_init(&driver, &savage_pci_driver);
 }
-- 
2.33.1

