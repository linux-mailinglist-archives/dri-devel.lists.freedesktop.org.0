Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05119474FBD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B8E10E12E;
	Wed, 15 Dec 2021 01:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACB410E128
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNRehPRvqbAz7jorwIu4ovYv1EOIx2oHB4aS1f6MxEE=;
 b=NFCIY7SbJTZjW9BLbxq51jxIXbUIt2h4jBDLlqYcq3sfcsl7uvBDxQKqVPC1M+f9HV5Uc+
 N3ku2z2xufNqhtd828mISgEkbnNiGgBOXPl1AAhEjFXiQH7IZAGonOTuij8Z0GAUt0By67
 PVNiaXbbsHAtX6qm7+5lpD4ZZinn7vA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-Y_aQJBOBP5K6IsS4Ua_mlQ-1; Tue, 14 Dec 2021 20:00:53 -0500
X-MC-Unique: Y_aQJBOBP5K6IsS4Ua_mlQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n31-20020a05600c3b9f00b0034440f99123so1379655wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fNRehPRvqbAz7jorwIu4ovYv1EOIx2oHB4aS1f6MxEE=;
 b=GbqN2CYvOa0WQHvkYyrQNoxaHrhFX08KoXx3M8ovqWtEAXJfTWxrkZQqJmVlILYhKl
 rA3PaHqb0jg7Eg/weT9YCDCfoqtYrx/BR2yBSPNnn+Y7aAQn26C4rZ7B2vusbbmWiNAk
 HXjSYp16fgLIKPXHtlGvknhqMKg5pu/f44POBXnf5d0JJl2iQbVRQItnivUpFIFUg95z
 AZrBoIxJANTIu1Khbncbbj5eeniRU/k7sVT7vfRL1NqbjItHhVIKvwHhmYAaDH+JmkFP
 SW0//1Ro5aqrKZXZb5Lo2C6UvONPGEKv5roxqFPYAPHoRJd+xVzor2iAcMuI61tmnpoA
 l9ng==
X-Gm-Message-State: AOAM5303kS8qUfv33JH63WgWUhHcZFWgbrCgJT2z7iCqYtPU0ey6sRNv
 fpCFOpCuEqeflc1d8k76LR7RhicDNRBHNOit2OyEJ4dlQHLuyOxE0YfD+I+IAIK/FKlPhGPxDSz
 D2obnlUDob7tFin7qFyf+JJs9gh5/
X-Received: by 2002:adf:fc83:: with SMTP id g3mr2136107wrr.255.1639530052403; 
 Tue, 14 Dec 2021 17:00:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQGzn5u1nUIMfMkZ/o2AJOuWVcRC6vL1ASLIqC9o5/dw9qAm/FfLvnARA79g0K7ZXGpeMHQQ==
X-Received: by 2002:adf:fc83:: with SMTP id g3mr2136094wrr.255.1639530052195; 
 Tue, 14 Dec 2021 17:00:52 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/60] drm/malidp: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:11 +0100
Message-Id: <20211215010008.2545520-4-javierm@redhat.com>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>,
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

 drivers/gpu/drm/arm/malidp_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 78d15b04b105..5da4168eb76d 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -938,6 +938,9 @@ static int malidp_platform_probe(struct platform_device *pdev)
 	struct device_node *port;
 	struct component_match *match = NULL;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-- 
2.33.1

