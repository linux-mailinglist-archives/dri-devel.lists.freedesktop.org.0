Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1AAEB030
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A3510E972;
	Fri, 27 Jun 2025 07:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BkcEg0GZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B5A10E978
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751009814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FVuEhhjyA7keAVf5W7zxzhKnnDycVhUTSUeMLb8Dbz4=;
 b=BkcEg0GZgm0kJ+Syls0Pgis5rvaJPBxmw58p0Igxqg7lmpFibNPUEtclx286LMKHXdpy/D
 eTqstDv4p9TJFgDCQ26R4NYMwMtJuFs0wP7HgpIeqHTJORixh/kIoF1gYV2N9ChnysU83y
 5CpsuRRSGpkyGKc2l5pTmnDjyh6hGpg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-vgQyjKieP5uc-HfG8QN04w-1; Fri, 27 Jun 2025 03:36:52 -0400
X-MC-Unique: vgQyjKieP5uc-HfG8QN04w-1
X-Mimecast-MFC-AGG-ID: vgQyjKieP5uc-HfG8QN04w_1751009811
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-451d5600a54so14544095e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 00:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751009811; x=1751614611;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FVuEhhjyA7keAVf5W7zxzhKnnDycVhUTSUeMLb8Dbz4=;
 b=Gz6g2q1M9CNK+3UqCO/4Y6NYWIYh7Vh12IR3fSZZQoV+SXstVqZ5SpZN4QWZoF8HxC
 1NCG2Nw3KMWC+amHUA4BmXmdJUOgAYLzsuxacSCyKolBuI67M3rVDxnOaLqll9rQpTae
 EQ41rJX3UeTE8UpulJzt4dEI9URzFgHkO14o22r/WIV0fvSJs7Cw2EFWE95PEIgy7BXF
 hdug3qBIXVA5liWYe28nYbZ1/OSphLO5unEW+sVVtR2P79xXdfPjTQP4DYJHWgL1JQoS
 SSR11lP4tIMREM0SKMGm71gXYcyDO+gmC+0Up7NFmHSAHiXrEXstYTqnOjyT23EYPv+u
 h97A==
X-Gm-Message-State: AOJu0Ywol6WkL+f/sjeMXUCETF9gSpXqQxXq5ZTr/SD1LxfM18WvbwaI
 C4DUgS8MCDWwKkVeVbSllH1sXNV+AfID0Pdp6yGFxMK5KRrddicFoQhbqxyGJ30MRLFM7EKwVCg
 iZtk2+Cza/VtQHeCQEIebYFZjdydWVq0L4jnPSeGQFb2JKqbH7e7YMBKCS9Y7SnqQUj8YaA==
X-Gm-Gg: ASbGncuB4GVSxqkDToHifEIoeG6DMFe0t7bSAt8F/HDBm7Rz7RChm3scV+PTxPQ6jjl
 9wPbtcq21dmgQC27ZcY6Tii9s63sHFoAKHI5v43ihksnP8ptA/F4t0Fd2n5KupD3SofUs577tTH
 1Np4UOdCtr0hnNUlcvrTR49MR0oGckrF1i6AQKUFdtZlNsRXZCPdnpT48evmES4SGBxnnFq1Qji
 zb7V8TP2syeuDgzWjqeMP2SfjRtuf0QTZVogYZ6eM8g40l79tD+xSjDusFDvi94/rf7UWydDcVg
 t0SRSgHJ6BAh4Bh2CXgm+d2SHyueTMy7EAB5mI4isyUimHcowNCR0RdcHVuQlOgnMKgI5/YRBWC
 5nJ2N
X-Received: by 2002:a05:600c:64cd:b0:453:6150:de2f with SMTP id
 5b1f17b1804b1-453900dcfffmr11817545e9.1.1751009810946; 
 Fri, 27 Jun 2025 00:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaUmzslRsu8K78D6y+Af3JvgdJ8LUd6Da7VDYJDzshsxpOowMk1KrGJnlafeMJ+K2hr7RvaQ==
X-Received: by 2002:a05:600c:64cd:b0:453:6150:de2f with SMTP id
 5b1f17b1804b1-453900dcfffmr11817295e9.1.1751009810503; 
 Fri, 27 Jun 2025 00:36:50 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3fe0d6sm41751695e9.25.2025.06.27.00.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 00:36:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vesadrm: Avoid NULL-ptr deref in
 vesadrm_pmi_cmap_write()
In-Reply-To: <20250617140944.142392-1-tzimmermann@suse.de>
References: <20250617140944.142392-1-tzimmermann@suse.de>
Date: Fri, 27 Jun 2025 09:36:48 +0200
Message-ID: <87zfdtd4a7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pE6IueqXFS7smPqEz6Q9QvduMuoYrJcQQxWKopJXKfQ_1751009811
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

Hello Thomas,

> Only set PMI fields if the screen_info's Vesa PM segment has been
> set. Vesa PMI is the power-management interface. It also provides
> means to set the color palette. The interface is optional, so not
> all VESA graphics cards support it. Print vesafb's warning [1] if
> the hardware palette cannot be set at all.
>
> If unsupported the field PrimaryPalette in struct vesadrm.pmi is
> NULL, which results in a segmentation fault. Happens with qemu's
> Cirrus emulation.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 814d270b31d2 ("drm/sysfb: vesadrm: Add gamma correction")
> Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/video/fbdev/vesafb.c#L375 # 1
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

