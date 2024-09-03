Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22426969BDA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2DD10E4E1;
	Tue,  3 Sep 2024 11:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fh0ht9fB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C9810E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G6Z3wxXNuqkdNQKBlR4V5hxpw8pNzMmDdZpwiBC57Mk=;
 b=fh0ht9fB0pQMTmaRFrBvqK2XzKzffcECjPe3O1FX8dBwoZ1ATDT34N+8nWqXyheQEV8HzU
 65JyTTSVUgt2uCrbTUWnh6klbphaob2IoqNEkyq0J6DEY1m9tSDCkCRTYQWZYnyV/bIcgT
 aFGgm29arWEWLxdTD1wesF80XyaLYl4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-KazLjSJ3MNyxGVfiHOoPCw-1; Tue, 03 Sep 2024 07:31:48 -0400
X-MC-Unique: KazLjSJ3MNyxGVfiHOoPCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42c82d3c7e5so19719875e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363107; x=1725967907;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G6Z3wxXNuqkdNQKBlR4V5hxpw8pNzMmDdZpwiBC57Mk=;
 b=OvYdhsYLvgp2yjFW9UNlD4p0+T2A7mLq/F/0NWs3WXiYQrnJLuAJxgO0nNH470S30l
 NhsD8D7S1M4i+53MhiMg/Uu96OGlK2SKlYmagX5zKXH+xvxcKjxWtPTq1X5DpLVw7Ap4
 L4VmCHbg/ybHxahKo8XMg5jB6+zhEgNWMAAWGXiD/AZWwE5/c6yQ78iKm0hHyuX+W8Kh
 /xCyDNcac8gZ+wGDHOgpfhONB8fVh4tzlXy4/fPZZgG66/qRVkpBDNmwB2jpVSRlIzEp
 oJuul0PG+oSrNnYCLD44gJXGsPkQTW5mxf45dJcoxHqcz2ZdL5n24pGx1AwQegfD4dCD
 fZNQ==
X-Gm-Message-State: AOJu0Yzvg1WKSW76UJj1Xw5IyzvaB5D3qrMF8MNTVkr6RVw7bAzaRFQB
 VTbo8fGT0IyZWfRcTQMaXCBBF92kj9FjMSPysRBWKGsGM0CMc43znukx1DkqWJqw6yxx7IQN+D3
 wyUtZy3GO3M26nVQtcoPAK19JW7oy6WZhOKINW9UfrGYwV3Idxc2l19osKz+mOZf9Sg==
X-Received: by 2002:a05:600c:4ed0:b0:426:654e:16da with SMTP id
 5b1f17b1804b1-42c7b517656mr67767415e9.0.1725363107480; 
 Tue, 03 Sep 2024 04:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeMOyjzQgizDJPCm6Kr9tFNsJyk2nqnC/B+gZS4uzByo92kWKPWlduCmztovidAzuV/DZW6g==
X-Received: by 2002:a05:600c:4ed0:b0:426:654e:16da with SMTP id
 5b1f17b1804b1-42c7b517656mr67767215e9.0.1725363106992; 
 Tue, 03 Sep 2024 04:31:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c7e62b1esm6705752f8f.36.2024.09.03.04.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:31:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 42/81] drm/tidss: Run DRM default client setup
In-Reply-To: <20240830084456.77630-43-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-43-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:31:45 +0200
Message-ID: <87ttexdlcu.fsf@minerva.mail-host-address-is-not-set>
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
> The tidss driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

