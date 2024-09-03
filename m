Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08B969BC8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC3110E4D4;
	Tue,  3 Sep 2024 11:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HZ81H9nJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2148C10E4D2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dxxrRERlM1KKjx6cIQxxpxez8ndiAEATgkodVQZqsO4=;
 b=HZ81H9nJYyaqm3pbVMLDqYb0LTObz4ptkknwsrg591Xte8XqgZOf32eiHR5nVbCUAK9zWH
 Njt62bJmJu6pim6u3EBG/aTTidVoYYgStSvKNesa2LUDAFC8T6RgzpU35I/M6HDQNXV+Nr
 NIhACQpPEDgaTLRQ/JC6Z62Gm4kxsnA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-TxBho7LyMVyZ33mUcUNPqg-1; Tue, 03 Sep 2024 07:30:07 -0400
X-MC-Unique: TxBho7LyMVyZ33mUcUNPqg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42bbff6a0aeso33329995e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363006; x=1725967806;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxxrRERlM1KKjx6cIQxxpxez8ndiAEATgkodVQZqsO4=;
 b=Z23uGvPyZdV7xudjhVzauTWRATKwxiCKXHTVFV9tPU39blRLRvTJeLeSU5U4RTlwKD
 LvQA/599cUf4LCQQhoU2yeOC7wD3Mkkvld6dAosFWrCm/NPT1tNmZmmVpj67wFplN85s
 4H9cXkfqm7gpYfuhEvhMQvnx23VvyTUCux14S5+21HQAuDQHXfERjP7kBzxgtmJDaTxs
 a59mSxfAPPIitSYEc9O9poqUnNHWShbdbmHkl5hLTS+GXL9Px9jIKQp+go3zoqfiu6pF
 4Q5TkXepp6xv5jUOQJw+lsmGw4bIYdmxoRxAVbzQHyPJJUkkqIOAf6QoqTCgPEcQVoMC
 7rWQ==
X-Gm-Message-State: AOJu0YxKxV8/5HPubSVR9jIMkKdcsuX0PJmFVOZ6lPuBVWH8SKiubZBZ
 BvkUaKozmwJWbSP7P6g5hmxQbTPVeaiSK8KGaAB8bjc54RT5T4ZfpDNXeuPIICqDbvjhr2Mfxu5
 qkHwaeFtb8sa3zm5aWJW2+qPJ4AJk2ngVgbuY/iRzkLbz5UuqPgwYCXChfZJ/9U/PDw==
X-Received: by 2002:a05:600c:3c90:b0:428:1a48:d5cf with SMTP id
 5b1f17b1804b1-42c8de798b4mr4038945e9.9.1725363006018; 
 Tue, 03 Sep 2024 04:30:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdvAYpzgdPZsIwkrEWFvZvdn75hpa0fqZPHsIu48fvr3XJmd4Ap7A23CN95pFqKYIWUbhWWg==
X-Received: by 2002:a05:600c:3c90:b0:428:1a48:d5cf with SMTP id
 5b1f17b1804b1-42c8de798b4mr4038695e9.9.1725363005569; 
 Tue, 03 Sep 2024 04:30:05 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e27c70sm168136785e9.35.2024.09.03.04.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:30:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 33/81] drm/pl111: Run DRM default client setup
In-Reply-To: <20240830084456.77630-34-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-34-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:30:03 +0200
Message-ID: <8734mhf004.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup_with_color_mode() to run the kernel's default
> client setup for DRM. Set fbdev_probe in struct drm_driver, so that
> the client setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/pl111/pl111_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

