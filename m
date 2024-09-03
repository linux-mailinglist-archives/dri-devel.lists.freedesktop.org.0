Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E9969B9E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEC410E4B0;
	Tue,  3 Sep 2024 11:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z6hB5u7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D8D10E4AC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zFn6JoF0nYLgSLX6ae98mppLG4Otb/JZ15e4mfDfaw0=;
 b=Z6hB5u7gwq7fLzFphOqb4z+4cQYVxyhFpzeSz7jBlOKFdAE4WvKYE8tE0TlNKQ3tbyHy8S
 lsSZAS1KwsgEXLxwzm0jzuuDmaYoAN32kh5OmZaBFnvbZ148KudTouVUM8okSNqaGZ1VrS
 oR3DLoCykpSY1NypIuPQfZIEH3LkWjY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-cLNSgZIyNmisHAb8Qh3TjA-1; Tue, 03 Sep 2024 07:25:09 -0400
X-MC-Unique: cLNSgZIyNmisHAb8Qh3TjA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42bb68e1706so48036655e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362708; x=1725967508;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zFn6JoF0nYLgSLX6ae98mppLG4Otb/JZ15e4mfDfaw0=;
 b=SfoKLf7fghAnWR7h3l4SqhKqCnbTI5XBzOlx3n+Ueks5s6n1qa1QTdpwD4TxMqLgCB
 YiMt7vK3WFc6GpcU9wktSdGgsddtFg88DOW3QH/1VdQtJ9TYBETqMFuVesNFO1SMDFuH
 xu45tox1Bw/ZOnDMJ1046QdP+bwta3nTQFwFxAF307aAEmOHqq8I3F3Wfq8aExRbhRZM
 faAXNG0qLs9TPQsZhOWqtSQHMldXzNSGe77jwOFcHltFK91vU0kBBIm54nGj7+eJf9Vr
 /5287GiPdCSd9dmqm2yt4vvtGqpoTOD0o4klf6JXXkl4BvRh+OaMFafAxyEMHKr6Jvke
 hFew==
X-Gm-Message-State: AOJu0YyZu9P25fpmOus3hjTuXZzTlHEfskOfFYI+DnTLarggYLyUhXV7
 xUI1uewji/vITM4SaFIK3KI3F6++SeUhjIeCSntFuIjZtRqwJVjVw2e2Oo6PdP4Xgi0YREysAYK
 5CFyfzGw9CzYGM7KeU2Blq8mtiotQ1KPDGzsWO5xSEgkQRVLJUwP239m4T6lndxg+mw==
X-Received: by 2002:a05:600c:5110:b0:426:6710:223c with SMTP id
 5b1f17b1804b1-42c880ef921mr26586315e9.9.1725362708109; 
 Tue, 03 Sep 2024 04:25:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3cH0MWc81rircp2ansVoCb3NK3NEk+umLvTdA45IVUNkVz9xLI+VziTu6VQR/1xOKKJstjw==
X-Received: by 2002:a05:600c:5110:b0:426:6710:223c with SMTP id
 5b1f17b1804b1-42c880ef921mr26586015e9.9.1725362707597; 
 Tue, 03 Sep 2024 04:25:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bc00877c4sm121472685e9.6.2024.09.03.04.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:25:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 20/81] drm/imx/ipuv3: Run DRM default client setup
In-Reply-To: <20240830084456.77630-21-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-21-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:25:06 +0200
Message-ID: <87o755f08d.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

