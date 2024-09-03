Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7164969BBA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5061B10E17D;
	Tue,  3 Sep 2024 11:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bhla3hDH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0DF10E17D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LWaiVxUDn5x4EDUb0RXQKucUIM8lh/m7gazYhUKWNcw=;
 b=bhla3hDHMY8MnruSNc8/u/w/nyr/nPa/Sm0fhEXgwrDWfoiZv47UDmYTMs2HGvdijRK78v
 XzhPFoohN1Txqtk3xft9Dh8Nl35xP8VChAafIsbD/8ONaLpEke0H7mC7bb4yc74sJWa6v/
 ulFwOUbCAmr1W36QHSqk9ygha/PKi20=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-4jOIy8L6ND-NBa4E1gFLhg-1; Tue, 03 Sep 2024 07:28:37 -0400
X-MC-Unique: 4jOIy8L6ND-NBa4E1gFLhg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42c7aa6c13cso24968685e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362916; x=1725967716;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LWaiVxUDn5x4EDUb0RXQKucUIM8lh/m7gazYhUKWNcw=;
 b=gW3PvU8bj7dSauYr0KmZCaq2oGQIDur7gtVP8ZJMeAu2jxwzU0yxmKfYmh5gplsiAO
 KOcWfmg/aHWQjVtSU+naKioNZS14p0pL5vtRkhuEtArOduMpiHVGP8bw9dKIC2dcLfLz
 31aWNYfPQZzOQIVb+wjFTzxBcFYQp3aBh2v8A8Zch5mVsUSpbn6+aVAUajjmr7HENBoN
 34QzcsdCZ4CzTlhVeCPRp7Yz8bpRFa0KiY/zol9tuCge5ObfrCtK8pHMUXBssOQCtWAU
 UI+RzSusZFLbKywykhxXBecjM+9QlQ+GAleIpPiOAZLPvoLRxjmd7Gs9SMffHb1aHBGs
 3szA==
X-Gm-Message-State: AOJu0Yxj0MwSkcjrgTFHiOnd/kv1v7fy3s/yXt1XmaqHqtnrSG+IptA6
 5up2juq0E9+Gng5UcSPVNqYjSswlwZxGBBE5O+XtMJ3v7DXcY1QHC1fII4T8+ZBnekczcA8kncB
 x91RrdUk7ozbT0Tgg+X+tJwFgdGQZG2CwweJn0f2Lff0XdglZJYBCINqXtwHtTDUJbw==
X-Received: by 2002:a5d:6446:0:b0:368:445e:91cc with SMTP id
 ffacd0b85a97d-374c2659badmr6645348f8f.21.1725362916413; 
 Tue, 03 Sep 2024 04:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOC1T6h6rVXlfVpjA/pVe7KOeoA4/WKcQU1WD4uFO7ri9zXFh51Y6FFr5rxsYl8wc+Lnpi4g==
X-Received: by 2002:a5d:6446:0:b0:368:445e:91cc with SMTP id
 ffacd0b85a97d-374c2659badmr6645326f8f.21.1725362915923; 
 Tue, 03 Sep 2024 04:28:35 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c5ba7027sm7134412f8f.19.2024.09.03.04.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:28:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 29/81] drm/mxsfb/lcdif: Run DRM default client setup
In-Reply-To: <20240830084456.77630-30-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-30-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:28:34 +0200
Message-ID: <878qw9f02l.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The lcdif driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

