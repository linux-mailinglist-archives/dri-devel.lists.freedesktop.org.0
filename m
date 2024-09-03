Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BFF969B4B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD83210E139;
	Tue,  3 Sep 2024 11:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ICINzkNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6C910E139
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pdYvLK+Rh99QxPTllaFff6lfcZBjKvVWEKqFob5Jn+U=;
 b=ICINzkNiW3tIch9htWeUWBs06HvjfqsQIb5iNImkxmhZDB9W/z6lQAP5zMiBQlGuQt1fpW
 yrqS1YOOeOHgW7Cl6tAwXK16NGFWqG7mOky4SQ27QESmlOVqTdNmrnWFBV4Oj1DBj0B0/P
 9Mas5sXk67FuKGiYNrMP6xyXiN54tWs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-SxNwox9sNsmJdXnBhWUOQg-1; Tue, 03 Sep 2024 07:14:08 -0400
X-MC-Unique: SxNwox9sNsmJdXnBhWUOQg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374c9b0daf3so1280815f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362047; x=1725966847;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pdYvLK+Rh99QxPTllaFff6lfcZBjKvVWEKqFob5Jn+U=;
 b=c8wta9zt7sm4B4mnwUXrVHHb5iV4pExbJCDmMOR+Vl1+3+RZ+Jy2FvmZJAhJmNx09P
 fZtaVz0i7UTCxfCxkhtGk4nlOA7evhZYz9Gwvs9BjandeWlHhx8i6LREI5PcfRoBYv17
 cOTYFp50tK25yTHr8ysIzOwcijV7GMc828ArpFxAc3AIOh5/y35rB3+RM2BhpgeyqUU6
 5qY+z6P16lRqUZjs5gSMDhSEgC0uwvCo6Z4r18sBX3+MajlKQDvuhtV9gFV8qE+1O96i
 q2HJrLTssurqPttF0hZ6SzUy8I0CiSD8YXk+vrR7G9tw+dgc4NDE7rollAY2cKJ1DLoh
 pkIg==
X-Gm-Message-State: AOJu0Yxbn5eGq10qP+kLhINrP/c+G9jTbVQiCITIs5HklEm60V6nueBq
 B8ZVCyP+2nMas+sxTPThGZtq4coisSpTNEl0tNeLovqBKOZq8s3L7qgalXFDxPOTmdywYq3Mrda
 4CQWzQ/wSZM5COZlj44+0hnsGktn4nEcBJBEhnBfQ/LfJShIGKw9DIddDI1cNnM/c0w==
X-Received: by 2002:adf:9bde:0:b0:374:bd05:a074 with SMTP id
 ffacd0b85a97d-374bd05a0cemr5699415f8f.12.1725362046748; 
 Tue, 03 Sep 2024 04:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH58B10Y+zMIj05Ntjvj4TsORZDmCGRgoqT96GpUgWHC5vVRBWe2bAZAxHLAeIC6rm49Wp7yQ==
X-Received: by 2002:adf:9bde:0:b0:374:bd05:a074 with SMTP id
 ffacd0b85a97d-374bd05a0cemr5699378f8f.12.1725362046152; 
 Tue, 03 Sep 2024 04:14:06 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c90c6c06sm6188692f8f.84.2024.09.03.04.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:14:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v3 10/81] drm/aspeed: Run DRM default client setup
In-Reply-To: <20240830084456.77630-11-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-11-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:14:04 +0200
Message-ID: <87bk15gfb7.fsf@minerva.mail-host-address-is-not-set>
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
> The aspeed driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> v3:
> - add DRM_FBDEV_DMA_DRIVER_OPS macro
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

