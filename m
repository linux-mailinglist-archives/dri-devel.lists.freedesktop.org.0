Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE12474FDB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115C689FED;
	Wed, 15 Dec 2021 01:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7DD10E160
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYrw2xnMNhg0U7YDzpGkI2ybQK75rWuBPObQ2p32zAk=;
 b=E22G52ySutTLI+sR93qGB/O3Nsx60Hzqqy1p8Ltt7lOBMmaAMX7lBnfK//CHwabhW32x6C
 xTRKuBHQWpMhpwa/ap0kpcb22rhshR6c3xz2KJPn7EmWwcjvhGHlBNj9ztRAnpKdAZ9a++
 i64EMkmBcOBgJZLrVMfktJfsupOiz/s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-8fNu1RA8PyKM_ULEo6Ixtw-1; Tue, 14 Dec 2021 20:01:26 -0500
X-MC-Unique: 8fNu1RA8PyKM_ULEo6Ixtw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so8325740wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYrw2xnMNhg0U7YDzpGkI2ybQK75rWuBPObQ2p32zAk=;
 b=flI/c2R719ZSjIML9Ld/8TgIO04zBMbsnwDTdVrGFbSK2cnNMve7QVF9qBpXzpD5m4
 7bxO9BqoN4iNgMTL6pvrmIX8TwVVtXgTaEnspvCKwK1aoC8baarak5U0LYfykKkOSakk
 7/9cJKBujsmKff0jHUBgdli0t+sIoLUkS7vTmYVRNy6EU08046YrBXTK88JXtcOuKK1n
 N4sB7EC8EZs2cu53I7sUU/gxFla69E3Q+CXI6Lvpx8rg7dcFr3oP3TEpXvb/hxjlCd1d
 2Jr/v7BPgX28RT1LBrqVhb+Vur1mspdve6a/E57ijh0QJhf1B6UoT4gomXWAv7DVu0Md
 OrKg==
X-Gm-Message-State: AOAM531XEKh41x/FrgwcQfkqgzsUDMuoozz0WA51P3rpDLVIJsokuqVd
 e7tIroJbsC5iUzego21f9oJaaX4RL7LYXjAIv8U/L1Ioa70H4IP2oba+c9IFGvdXY3PehVDtSWI
 lqhAegiH8oIHanlXR8wJqGkp3yU2O
X-Received: by 2002:a1c:1fd4:: with SMTP id f203mr2391801wmf.192.1639530084754; 
 Tue, 14 Dec 2021 17:01:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyctY+3KAnMi+t5k8OWYKYcTTCahTecObLK7WAOymKI941Rw3uPqfUXzoeePmIpfuvR3py5w==
X-Received: by 2002:a1c:1fd4:: with SMTP id f203mr2391795wmf.192.1639530084593; 
 Tue, 14 Dec 2021 17:01:24 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:24 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 39/60] drm/stm: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:47 +0100
Message-Id: <20211215010008.2545520-40-javierm@redhat.com>
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
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>
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

 drivers/gpu/drm/stm/drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 222869b232ae..91ac5437fa40 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -183,6 +183,9 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 
 	DRM_DEBUG("%s\n", __func__);
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
 
 	ddev = drm_dev_alloc(&drv_driver, dev);
-- 
2.33.1

