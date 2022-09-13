Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B2F5B7CE7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 00:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7390510E57F;
	Tue, 13 Sep 2022 22:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628C110E565
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 22:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663107316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsWBexLFDVqUOZMqbhy+SL8q312glCS9Mla/+vP6MEc=;
 b=TQbJpJEZrzx2X6HKpqf4JX2O3iKqQYePSwmV7ACSShWERY8heq89K2EcPINvSfqSpys+8X
 78y2fm7XfjZcouZha5aI0uvRKFaRyI1SZVEmcSLCcmoKkm41VxmAA9kCZf2aNyzaKcnp0f
 PSCq9CYkPYTJu/w+vBGwNvDo1uNdd8Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-148-dVciF-B2Nr2UFyAtJKUZxg-1; Tue, 13 Sep 2022 18:15:15 -0400
X-MC-Unique: dVciF-B2Nr2UFyAtJKUZxg-1
Received: by mail-ej1-f71.google.com with SMTP id
 ho13-20020a1709070e8d00b00730a655e173so5228228ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hsWBexLFDVqUOZMqbhy+SL8q312glCS9Mla/+vP6MEc=;
 b=EB3PtGvVzEGNSmBsqE3pPjvNLTHnpbD2dzAWOOxxN4bY2S9GkWMLaTUwi4UEjxv5wl
 GpozQ8O7HQbi1vnOh8tozgPczpwMk/Z9lqfxVNx3trvWBTLdERLdZPZyeS9Ij1m2w10d
 4hxG8bOya4DuKF0pa+9Z5tzCT+x1ZKjdS16a8Nxc6B4WhU9yHQ1NSFLRLbo4iX/EIwiz
 ckAP1+o2NwIiynR0o1daGn+Ja4Kw1RUtj8DzXDBBqx9P4iBQ5CNoPp4ACywCP/6LTexp
 U37rKiJ7pTnX7t3xG4ndmZ5GXXS0U/Jgwj29tH+/FEFNlxBxfPUYX6mgz3rGDIhVE+or
 ZLCw==
X-Gm-Message-State: ACgBeo1wGnczmfwqBx7qvTZ5hb9EG8QJVK2OsuiujrVboeUZnN33L+kD
 rhSdiYC9ZL+IipIH5BTBKZqALjm0oNXlDExYD06xi6wTk8EhAohfMF0aqgiDgFmlMrST69xwfUF
 GdN7jvxyHKXwePrmk3uqjYyVEsObr
X-Received: by 2002:aa7:da97:0:b0:452:bea2:5200 with SMTP id
 q23-20020aa7da97000000b00452bea25200mr68244eds.341.1663107314140; 
 Tue, 13 Sep 2022 15:15:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ZKIyEtvn0ZdttQsylhb4+4lRtAhpLE6jDAvGHN/+GdIEgTPcQEnfQ2XrRN4o9j3qVCy3eiw==
X-Received: by 2002:aa7:da97:0:b0:452:bea2:5200 with SMTP id
 q23-20020aa7da97000000b00452bea25200mr68238eds.341.1663107314001; 
 Tue, 13 Sep 2022 15:15:14 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a50d618000000b0044e01e2533asm8720076edi.43.2022.09.13.15.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 15:15:13 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 4/6] drm/arm/hdlcd: use drm_dev_unplug()
Date: Wed, 14 Sep 2022 00:14:54 +0200
Message-Id: <20220913221456.147937-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913221456.147937-1-dakr@redhat.com>
References: <20220913221456.147937-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the driver is unbound, there might still be users in userspace
having an open fd and are calling into the driver.

While this is fine for drm managed resources, it is not for resources
bound to the device/driver lifecycle, e.g. clocks or MMIO mappings.

To prevent use-after-free issues we need to protect those resources with
drm_dev_enter() and drm_dev_exit(). This does only work if we indicate
that the drm device was unplugged, hence use drm_dev_unplug() instead of
drm_dev_unregister().

Protecting the particular resources with drm_dev_enter()/drm_dev_exit()
is handled by subsequent patches.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 120c87934a91..e41def6d47cc 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -325,7 +325,7 @@ static void hdlcd_drm_unbind(struct device *dev)
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 
-	drm_dev_unregister(drm);
+	drm_dev_unplug(drm);
 	drm_kms_helper_poll_fini(drm);
 	component_unbind_all(dev, drm);
 	of_node_put(hdlcd->crtc.port);
-- 
2.37.3

