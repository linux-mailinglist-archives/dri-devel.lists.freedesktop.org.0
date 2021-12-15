Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C45A474FED
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD08210E191;
	Wed, 15 Dec 2021 01:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44E810E188
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=If0/Rf9Wm5tTSQlPAKpGzbiBM/4txD6ayzOYSnTn4nc=;
 b=Xn0tIs/Rw9DZiXmOBnn+VcKE7mtOFzAoUloMdqtSgUVHxgy00rL+Nbp8anMeGkrQdp2oEI
 PLX/VxzrFqq8GO96UE7kKVrIWbaCyc5u6trEmqL6tvUvQ4cT1K45ALI21Yc2edu8xiWQT2
 XT2LQ83MWJHtWxugn86mEJeVF4IMeJA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-FzOBqKnTP-G-o-8ZrgPemA-1; Tue, 14 Dec 2021 20:01:41 -0500
X-MC-Unique: FzOBqKnTP-G-o-8ZrgPemA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j20-20020a05600c1c1400b00343ad0c4c40so1929306wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=If0/Rf9Wm5tTSQlPAKpGzbiBM/4txD6ayzOYSnTn4nc=;
 b=YQrjYKaH9g/APAElzkFXoWtd1JIJbZUQLDEDTJryo4CYscjqWgTJxHPVnXi92HLkJJ
 zrNSzQ0n73oPSzwaxndAk72REJcCGYMRJLEJGHFwV04Ihrn+WFEk9TQPVvRomICvXvO7
 t3rbdoj46bblS6Ba14mhOGWvAWjD3xyGjXbBoM+YQoZ+kMFY35Lho1/DlsSfVWnPDIXY
 N5oMY9vOhIcomqF3IBILHrwe2oVkMvR8BwtpJwZv4VFoyfn1J7Y1lirwbx2JY1uSQFa0
 71jNZXfkdtGuYSJ6UM9Vv4eQ6LwWCkamlS8JqOJa5aljwxrCaWd8xVH5n0zWpE/n+4zg
 SxuA==
X-Gm-Message-State: AOAM5335c/7jtfF1eD/LNKNtepywL/KCOb9+78/fce6+AfgBxMmiIIZA
 1DvYaC2NQb8kA9vyP8+4pRUZZ6G+jVU9nxy/Jux1QQlQfdPx4zkLqah5EdoV655PjWvRG8BdKYb
 9rmDGFVJivaTT1ugYFOSwu+0yHgjW
X-Received: by 2002:a5d:4883:: with SMTP id g3mr2182486wrq.590.1639530099923; 
 Tue, 14 Dec 2021 17:01:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDseigahROS0KmkmjXTnhvtROBpPvhKmvaS4LRmNphhZDojYZ2ZPoPBDEcYQbylIv7aDz6CQ==
X-Received: by 2002:a5d:4883:: with SMTP id g3mr2182473wrq.590.1639530099756; 
 Tue, 14 Dec 2021 17:01:39 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 58/60] drm/via: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 02:00:06 +0100
Message-Id: <20211215010008.2545520-59-javierm@redhat.com>
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

 drivers/gpu/drm/via/via_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_drv.c
index 5da38082821f..57d63514f812 100644
--- a/drivers/gpu/drm/via/via_drv.c
+++ b/drivers/gpu/drm/via/via_drv.c
@@ -106,6 +106,9 @@ static struct pci_driver via_pci_driver = {
 
 static int __init via_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	driver.num_ioctls = via_max_ioctl;
 	via_init_command_verifier();
 	return drm_legacy_pci_init(&driver, &via_pci_driver);
-- 
2.33.1

