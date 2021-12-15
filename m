Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E81474FDE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2778810E1AF;
	Wed, 15 Dec 2021 01:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A8110E163
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uVXvqerQ3mIROsnwK4gbzNANyt6XjHgGbuV6EWNXUo=;
 b=C6eljFCKCyd+JsjY5XgPq/Eo/uE/qevKfI8GeiM8jIT/d3TuRVXA//45+K7aW32UcC101a
 4s5ychj4Vhu2hl4hGj7T18UIZy7qHtMLWn8Tp/2zYm+NH4UILodldU7NMIkqoHgeylECcJ
 ZMdDG4qJ/P71QBTwVOXA8iLEyYRcbfU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-xUmxxyf3NCiyXcDbRDiFvA-1; Tue, 14 Dec 2021 20:01:37 -0500
X-MC-Unique: xUmxxyf3NCiyXcDbRDiFvA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso5382277wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uVXvqerQ3mIROsnwK4gbzNANyt6XjHgGbuV6EWNXUo=;
 b=u5ycp5tZZT/u1H5MbxX9STiXXvyfUhYH1tFgdaRJBF7pKqc++Z5Ls07EIngE/k8iHe
 pHKgZ/OCaMFFVIoOgRfzXxTULpD6/XATfPo8UqInzB7/eCBBHm6SGLX4fdrqa6724YH/
 V71xVGx/VpM9RdbCsE2z1OiEB0jgqTba0fTKd5c0kJsABz6j3gix1n28sdeTqS+/ZICD
 RbWgd93zvI6/Gosh/VGSwzHni9lF3Fgw6v8Q/0MBWevSkO2fRe8My2u8hzlsXyf4AbM0
 XUbLbD5Rk2FBYU5YJprsIvPncHZa92I9hZEpXgYTW8dsUy/ZJnXbZXf8HLMIovbmqGd1
 24LQ==
X-Gm-Message-State: AOAM530hKDSRquaSjF/9fBiyjICkKrIulX65KNJigJiDZ16DEvC4VA09
 ntBLlU+0SOCf+x9SorJv7dmH3aPe9o5KiU+JCFD6GJX5d/o5EIvJs/cqX3Q2bWL/kVwSjsl9fhK
 i5ZyaJzgeIvVPcKhyhLolDgHGy2OK
X-Received: by 2002:a05:600c:1e26:: with SMTP id
 ay38mr2330196wmb.14.1639530095999; 
 Tue, 14 Dec 2021 17:01:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeOncOXUCZ6JUkydTsueQefbGvxmSVfS7725K9mjCeMZVVnN66la0zjp9Cmek/Nd65/4Y6iA==
X-Received: by 2002:a05:600c:1e26:: with SMTP id
 ay38mr2330182wmb.14.1639530095786; 
 Tue, 14 Dec 2021 17:01:35 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 53/60] drm/repaper: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 02:00:01 +0100
Message-Id: <20211215010008.2545520-54-javierm@redhat.com>
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

 drivers/gpu/drm/tiny/repaper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 97a775c48cea..ea97b8c06157 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -968,6 +968,9 @@ static int repaper_probe(struct spi_device *spi)
 	const void *match;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	match = device_get_match_data(dev);
 	if (match) {
 		model = (enum repaper_model)match;
-- 
2.33.1

