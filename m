Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E19570A0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D068110E2ED;
	Mon, 19 Aug 2024 16:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eTwZhtxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DD610E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724085765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Md3KCJoK6feytlwXA33ydyo8XOfTQqPq8yxw0ziYE7M=;
 b=eTwZhtxnl1+oCWBqy4kUgEfusilsTBj+yljd0X2ZjDY/ONanQFWnWLFY9HIPAt/ZYjOD3o
 2A7WGukCOO//CBWn8p54kRGKwVKZbRIbIjnjo6Mk51EcYeKs1Xj6/SsPo/k73QX49+ws+l
 u2xqZpLsW3/n3JrC9tkTL6mCaV16f/Y=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-cHv1ZpARP7OS0xOctbtekw-1; Mon, 19 Aug 2024 12:42:42 -0400
X-MC-Unique: cHv1ZpARP7OS0xOctbtekw-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2cb5847ff53so5226000a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085761; x=1724690561;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Md3KCJoK6feytlwXA33ydyo8XOfTQqPq8yxw0ziYE7M=;
 b=k7baDhfrF57KD8aNZwvq343oucJ3VNRS3C1VDd5+5b0aow0M/EtKjTAaBGz0WX7639
 CKrLqnuAjabsyK/v4WLnyIz+dUiuPTuiBm3kB2VDTxFCq2CTB9+5AMbCb8FI6U41zAl8
 w6yl/rMPGB2c/m52hn4SVIGNDQ/7QG4uHod2BtH/f6BpByCeOqeqCLK/K3UhYD5KWmhd
 x2GXJjfZ1/oWBYbEFI7n3ZAYZcHvMVm7M1tfIbgmR3/uHVeh7hau/5sqNmu7EL1zuf6Q
 gIUq2WTqB0zgKYbtMBTNPBQ/rx06H7TdjxChr6+N9VGy7sC7R8ehy/IxkOlHgYnQzO18
 6NaA==
X-Gm-Message-State: AOJu0Yz4Gp/RsXSvLiJni5JPT9OOUDjGLWeiQ3b5goZPy/Meh6K6yQqy
 95Ds2t4rt8ZX3MENqU8UT1YKejdy4FN/AeNuVQI8PNa+EBU12AWQvEXCTiIotdshzUbDzQJ5IZc
 B8wi59gy21h98tO24R7RtZnRlRU+sJ7FLy3e0E8zXSBRj4nfB7fN9sjEEVLv5oL6f7Q==
X-Received: by 2002:a17:90a:fe93:b0:2cf:fe5d:ea12 with SMTP id
 98e67ed59e1d1-2d3dfc7b35bmr13719470a91.24.1724085761050; 
 Mon, 19 Aug 2024 09:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsNdEpvtSkAl5rzLqXEcAkgXsVKtNu15fJmALgqr6qS5TBLy4yzi6qcqcR03rEDCVVXij1Uw==
X-Received: by 2002:a17:90a:fe93:b0:2cf:fe5d:ea12 with SMTP id
 98e67ed59e1d1-2d3dfc7b35bmr13719449a91.24.1724085760670; 
 Mon, 19 Aug 2024 09:42:40 -0700 (PDT)
Received: from localhost ([2803:2a00:8:776f:3d96:6be:69c7:46c2])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3d32853f9sm8430017a91.30.2024.08.19.09.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:42:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 59/86] drm/solomon: Run DRM default client setup
In-Reply-To: <20240816125408.310253-60-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-60-tzimmermann@suse.de>
Date: Mon, 19 Aug 2024 18:42:36 +0200
Message-ID: <87ikvwa2gz.fsf@minerva.mail-host-address-is-not-set>
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
> The solomon driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

