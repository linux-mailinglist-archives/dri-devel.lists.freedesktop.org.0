Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D851793995
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE3910E5EF;
	Wed,  6 Sep 2023 10:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6136610E5EF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693995162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xy4eWyuN+rU6FwER3ViJST19W+Gl/EjN/zwdPzrORYw=;
 b=dsLsZyqnHeOkEgL5LhaEmcmBBnMtNZXzoI4QLegtQ/hG5tvRj5ey57DQVV/+B7PIxqXICG
 SxGh/B3v/Or6bdrGnpywc1/nLX0IN32LaP9MidTktx/vqRUzMoZdUxhqszAap1+kKtt7W0
 X0IoeuhkQ/2X3XN7XNSUgM9RyQD1DYQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-PqV0lYLCPCe64A8UqvoHvA-1; Wed, 06 Sep 2023 06:12:41 -0400
X-MC-Unique: PqV0lYLCPCe64A8UqvoHvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fef3606d8cso22277845e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 03:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693995158; x=1694599958;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xy4eWyuN+rU6FwER3ViJST19W+Gl/EjN/zwdPzrORYw=;
 b=DmJBvuqopa0znsvjIZbfwBXPrJ/ty1i4Z/PSrC6oBarWDYieItfg0pxnq+CX+9ZUPM
 UE2hO/gEEIfTCF4NuIre4C3mTVXpil40EcXr2gLVvK2dqzSLW/O9UL4m7dZjOpK6GBtS
 zV5BlS/WAxSQR7bYOIh7FneSRIpYFhdY6qZv9P77jstH3O5OpODK8Kg7bOc3qWiHCrNk
 fTbbPu8WxCVOQkPvkP4hy3sui5bRi0UwpdTp+R1p5xRxVvhNb2MjE4mQ9ctlkzEb7ZR4
 kj5oNg2WYBJ3eja96yBrO2abuHRUSxqyHYxsG8axRfbfg+PLfeOaxZQhdcjZhFZyam0Z
 Zl6g==
X-Gm-Message-State: AOJu0Yy/gOrosZs6f+IcEKcwaXsdQrjQ8h6AkdY1uczybWd6WNqLWpYz
 B8/RQdXcPqtDnkssdZnWwdNeXYKpOpjMDg6vV1jd1RHdRYzn2hSRbCK46erPqmEM3aNEMKOX4ik
 ifEJb37pE9NCHytsIyYp5w4cItz3ftIQ0Lf32
X-Received: by 2002:a05:600c:21cd:b0:3fe:22a9:910 with SMTP id
 x13-20020a05600c21cd00b003fe22a90910mr1909279wmj.14.1693995158618; 
 Wed, 06 Sep 2023 03:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcggVqQOJrShKfnNaPe4sc3f0Ds8yksigPQVjo0N6T3K/Fdg/hTediwZLUXkfmqjeXlqBpsQ==
X-Received: by 2002:a05:600c:21cd:b0:3fe:22a9:910 with SMTP id
 x13-20020a05600c21cd00b003fe22a90910mr1909265wmj.14.1693995158375; 
 Wed, 06 Sep 2023 03:12:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v16-20020a5d4b10000000b0031981c500aasm20073022wrq.25.2023.09.06.03.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 03:12:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/7] fbdev/core: Build fb_logo iff CONFIG_LOGO has been
 selected
In-Reply-To: <20230829142109.4521-6-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-6-tzimmermann@suse.de>
Date: Wed, 06 Sep 2023 12:12:37 +0200
Message-ID: <87cyyv4nl6.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Only build fb_logo.c if CONFIG_LOGO has been selected. Otherwise
> provide empty implementations of the contained interfaces and avoid
> using the exported variables.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Ah! You are doing in this patch exactly what I mentioned in my previous
email :)

I would just squash this patch with #4, but up to you.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

