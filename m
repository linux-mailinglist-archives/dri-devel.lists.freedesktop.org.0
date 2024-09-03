Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE33969B94
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0340F10E4A4;
	Tue,  3 Sep 2024 11:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C++C/lUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD94510E4A4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a0gkkLunGIQ2kaDQMdtHzMdkTGKuWZFk1+nOKDyR4as=;
 b=C++C/lUZCpJra5VyFEI40es7q3E9VGRtkxggP1muIbjsj046nUcmAIFa2ExTrGR8d6m4iR
 /cqktcpDOkTtstMvivF4NN8/aWsNhDg9k1CtDQ/PJnJ1asD1XEF+QofX+eAywtaCsuuODK
 AAXgXUS7sutgsUT8MvS3eeOQjLsBcjk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-sGbDw4xRNCCaAo2t4xWlOw-1; Tue, 03 Sep 2024 07:24:44 -0400
X-MC-Unique: sGbDw4xRNCCaAo2t4xWlOw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-53350003ef9so6359143e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362683; x=1725967483;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0gkkLunGIQ2kaDQMdtHzMdkTGKuWZFk1+nOKDyR4as=;
 b=uDfWiRbrxFszTvgcLYdnYmGoX2aEsqAuymP+GmMwSq0gBB/ZxP+94nXvyWWnBJN0x9
 Jy+nnu7PP5tLYB2wI6EzvDRv3Xe3hiouIe9rSqM0aXYbrmJoPRHAx+6I66roxZ9DbtO7
 M9u0LNJvY88OoF6igcz7Ksq4Afzn05Syitv4Y9fWXtrPRBUNYXJ2gXAZ+u7hVmJZmzy/
 NfPjTpBiT53sLmCRdSIXwU7q6I0WsKYeKKVZNmSt4qUF9EtI3CuYO8tqni9F8HdKkFuc
 wy7JsnqtJWalCSid8uTkBpU3xm3m3xqrTJpFBJsd50FJR0a9H0RHn4VHfB9oDEOV5kRY
 Bj0Q==
X-Gm-Message-State: AOJu0YwgtHby5cOdjo83VxkPfUV/ozHciaqGUqOAk2O+oRmOSvZa6elu
 qY9MyCNMSPQMqODPRWAypjfQoDhH370tSjjYEBStS+FpQLt+JGwfIGSRwcQOBRs7ec90dpBJswq
 HFExVcFjziBFU1VQVDS6KYaG74tteG8O/3NkaiuUnkgC5fmeTVxH+OPu37cQUQNYu1w==
X-Received: by 2002:a05:6512:3b99:b0:535:3ca5:daa with SMTP id
 2adb3069b0e04-53546b167famr9189244e87.7.1725362683187; 
 Tue, 03 Sep 2024 04:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV4RoPHMRrjPOqT1ox2wOnC/TMkJttXZQfXhIXmK0ZwIW9dx/0UkvKvAIAwP3zEiWjbdgR2g==
X-Received: by 2002:a05:6512:3b99:b0:535:3ca5:daa with SMTP id
 2adb3069b0e04-53546b167famr9189216e87.7.1725362682612; 
 Tue, 03 Sep 2024 04:24:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b9d54f98sm10542803f8f.69.2024.09.03.04.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:24:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 19/81] drm/imx/dcss: Run DRM default client setup
In-Reply-To: <20240830084456.77630-20-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-20-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:24:41 +0200
Message-ID: <87r0a1f092.fsf@minerva.mail-host-address-is-not-set>
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
> The dcss driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

