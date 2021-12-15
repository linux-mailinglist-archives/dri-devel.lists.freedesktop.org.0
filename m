Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD1474FD2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6D710E155;
	Wed, 15 Dec 2021 01:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA4310E160
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XLGTzZR5SpObjnbZJCz+iRhH5vaorImXn0ahIouADE=;
 b=HWmszto+yu1AwaHt1doSoX+xmzoJ5ui5ndYet6kzkZb4mg/rqjKsrFrS2KYonD+/IBf7CA
 yeus7VsdhWL6BJoRiR8pFLcNhyZj9mQ++PDyMyJdOBow+zWn/aItihDqW7A5ool6jwF9LT
 QdzaRMeK3zE6t1S52BOrICgENRGsf08=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-Mv_GbATyP2u8hUp7jHbFhg-1; Tue, 14 Dec 2021 20:01:25 -0500
X-MC-Unique: Mv_GbATyP2u8hUp7jHbFhg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so5393063wrd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1XLGTzZR5SpObjnbZJCz+iRhH5vaorImXn0ahIouADE=;
 b=8Mi8kG9a8Aew6LyhvMYYGeSEiHP6uzFn/hQkqnNErX46szdbKTmSQCLKfyUtLH/BOM
 urGDoeUZQJCZqyViOVFYGilP9I8E1NYZ+vBrXQBds6To22aCl0vIoMgi6NIanW6A6M5c
 8Qs3DPkazSRDIp7W41+jhBPy3UFQSq5G/aamHo9Lnuxbt8pTa2OW9jE/+56HmzMvT63k
 P1rMUBKw8/Sm5LOUXrH1rEH1bkCv2UnupoQLT4q31ebsRfVJlhmCl3v4AT4+ZgkSo4Hq
 urZY6ZEAS2SVB61KKYfHQ9/EXs6kTOkrI03tJXbDWZoN33DLeW57n428au0XzlVHAgnR
 wapQ==
X-Gm-Message-State: AOAM532HghzI+OyByTJpUn9hecyWaKgehJ6VeB0e5fBhy81WBQWhPtP/
 TbFNLdMY+ydYkdZLUZDX2sRv8Udf7wL/uvKdRY7ZL80iIE0XgKsaUri01RXpvjuaHp/ZgVIo+vM
 vlbMgjNEiu8QTuDTVroxiMD75S7Ue
X-Received: by 2002:a05:600c:4fcc:: with SMTP id
 o12mr2464264wmq.110.1639530083863; 
 Tue, 14 Dec 2021 17:01:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwj9EYvx5qVp7UwgDZOdpKhwMxubh+UJgDB1lS5DDoN+p82jW7COF0RCzNGJqVYM/ugqhTVgg==
X-Received: by 2002:a05:600c:4fcc:: with SMTP id
 o12mr2464254wmq.110.1639530083696; 
 Tue, 14 Dec 2021 17:01:23 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:23 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 38/60] drm/sti: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:46 +0100
Message-Id: <20211215010008.2545520-39-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
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

 drivers/gpu/drm/sti/sti_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index c7efb43b83ee..860b2230aa08 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -287,6 +287,9 @@ static struct platform_driver * const drivers[] = {
 
 static int sti_drm_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
 }
 module_init(sti_drm_init);
-- 
2.33.1

