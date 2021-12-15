Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6113474FC7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE98010E128;
	Wed, 15 Dec 2021 01:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5291210E155
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfozKiCl9i5b6Wjh+/WfnlZcF51aFpSAEpGxrbt9SHg=;
 b=Tp0WaLNrWgUKp0PwUWWipitYRNVs6gYhWa0oWblgDcxje7grqvnJW/i5PVlVcb+BQY+Bok
 kYe3cqPYDcYz7dhWYvPssXs2eSqqnFB9W9xF9mbW//cpaR5N8VCduugFCR/W1w9NzgmTLq
 Zvgxdtc/mvNTyqDYhloG1H7ZyGXNhs0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-lzigXcNZNFmQ9WtqAETaJg-1; Tue, 14 Dec 2021 20:01:00 -0500
X-MC-Unique: lzigXcNZNFmQ9WtqAETaJg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso5381533wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vfozKiCl9i5b6Wjh+/WfnlZcF51aFpSAEpGxrbt9SHg=;
 b=nWpygf5yMFHh0vzFf0NzzBc9hg9ZzoGBMdAzdMywFwEieM1vHl7PYFUDshTCl95Wj5
 5lzSMNJ6oJ1Q3q5TT0iRkkZ8E80ytO8/DcaO94wo3IiJZi5kM0BNFEj8Rzgkx2GDdycP
 9UDV5tcM35yD5X1J4CvvoWXl0x0M5n8ZMluRasPLxZsgpFn3iwxeMKv9pZOFx60Inc6q
 3/fwSza9wtLJJM0abBV2VgRUf2QEMV/wwZZkUcJCVyaEdqiClL2lhp9r04A8jJgClUUT
 hu6p6SzRGbWoQ2oLvE01VFCThujb8f075ttCthWZSm+50X67RtAflqJ+PBqoRWOGC7vD
 dAig==
X-Gm-Message-State: AOAM530U1QNZcMPR1tE1CmkuG5OiDZu5xQIlFL1H+KQo/g6rhIVrMwjK
 u3OCNnBDUJmxM8AbgEzUNY+Ts9FfsPUNgbMdXkWkbI+LB5GiMVYuf7zfPoiGEGib4qhKpB+rTQX
 BksL8d4xWrZhDNc66uIw+8PhTyoek
X-Received: by 2002:a05:600c:3489:: with SMTP id
 a9mr2267786wmq.120.1639530059127; 
 Tue, 14 Dec 2021 17:00:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycF0xIVdPZqekNhrMVePm4bcOD/E2H+0Br7VxiwcZsdiBitbJa4ePZ5blk/QLmIBgqU4Wg3w==
X-Received: by 2002:a05:600c:3489:: with SMTP id
 a9mr2267775wmq.120.1639530058937; 
 Tue, 14 Dec 2021 17:00:58 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:58 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/60] drm/gud: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:19 +0100
Message-Id: <20211215010008.2545520-12-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/gud/gud_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 3f9d4b9a1e3d..4d253d249512 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -446,6 +446,9 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	u32 *formats;
 	int ret, i;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ret = usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
 	if (ret)
 		return ret;
-- 
2.33.1

