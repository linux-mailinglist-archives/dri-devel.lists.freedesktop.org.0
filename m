Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF04DABBEE6
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ADF10E20C;
	Mon, 19 May 2025 13:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZlwiaEIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422FB10E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747660583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t2ifl+DhAh3+IKlVta3rnMPgH4VEUb4mPmr0zBuodfM=;
 b=ZlwiaEIG35I9PakN8XTONjyUxWxdAOQxq81oe74heYcYbt2MXEyr3rzfne93dhCNeEofzC
 bijTyluGi1Urk1btSKHhDd1xs5zzzkaAublza2ZpSckzBSxcMZt9tiPMLcNPKxQ0hHr012
 zJy88hWghN10mmgIiDIfbzF4h0L4Kqw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-4krqLkPxMLO5wwO4rqHu_A-1; Mon, 19 May 2025 09:16:17 -0400
X-MC-Unique: 4krqLkPxMLO5wwO4rqHu_A-1
X-Mimecast-MFC-AGG-ID: 4krqLkPxMLO5wwO4rqHu_A_1747660576
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8dd95985dso15429586d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747660576; x=1748265376;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t2ifl+DhAh3+IKlVta3rnMPgH4VEUb4mPmr0zBuodfM=;
 b=p+oo/qZDx6DPLksrbt3evfIVhTQWasz5DWH/YlZF2w/vc/MSu/f2IwlC5qWEw5hoon
 sv6FjCVjfV8dQ9mmh1j7Q2RWAjhl52e+/qCjoh18vPRuc0cRlhtVzlrEa1TOXLaoJLdI
 jJrt7uA3XimS+aATzipS72exoITmZiiHM8fkWmv52roFBnIqk2UIRXdBsuMHJ57w1QWN
 PxJqNZInC3baXpwFKbjKZnFRZtuwn9HaR4yRBEPCCti98C4GTaVbOgQ7O9VE6cm02e0e
 s21MuLE+etWeDa52dnCz0KXW2GgR09u5Ns+GPG5TRZg83qKjIQYDPlmeDbQSnkG2VCIu
 FQyQ==
X-Gm-Message-State: AOJu0YxolU96uCrjPoK9Irk0ZyWtac6gKTb2DpAAvGxodEpyKccBpadB
 rAyC+3NCWlMXDwglyFD74fzGSVl5X2/eBK+twcf10YEw8/02kIjblSLc810dwdIYqt1zl7wofIu
 HfDaa9UHB5EXy09rGItwgTKh00nn2FQmp+BRmxOAJQwUsQOPFl6HBIsapPhv/0Gw8jOabUQ==
X-Gm-Gg: ASbGncvH/wA+HSUtC+jQt8zjTe/9HpeMYSGGt1YLcUuTQKhuU7srvBWiCpX0QJJ0U9v
 EDEfaFVYBw/iegecP2rd6+8+EsiEl/FWVwtN7DzcdGhhpR+4Sw/xsmdytwmuaXUZC9DnPfavogd
 OZbvg3nxddRdal/WsesddDpd9cPUnR04MVjaOR2wS0Hv5WGoLmS/fcRMb5Uc+MNHv+sO017RCZp
 st4Nn22+atXkAwGHePkWKD0v5Or+QASLN5cqChKdX0F9nHwF7dzye79XU/fU5e1TVaIB5IfHHuA
 cj4UBDwjuYdVvpkMsGZg/kp3wewADnQ4eu5MyWWk7A==
X-Received: by 2002:a05:6214:1c09:b0:6e8:9957:e705 with SMTP id
 6a1803df08f44-6f8b2d0d894mr231877546d6.34.1747660576118; 
 Mon, 19 May 2025 06:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsjP73o30Bjf4q6T71MmIbcTWtdvh62oUrf5UHySz5FIafK9VNGnWMnmQ3dVDWbcMpP+BpdQ==
X-Received: by 2002:a05:6214:1c09:b0:6e8:9957:e705 with SMTP id
 6a1803df08f44-6f8b2d0d894mr231877076d6.34.1747660575615; 
 Mon, 19 May 2025 06:16:15 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b097a93csm56052206d6.114.2025.05.19.06.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:16:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] drm/ofdrm: Use helpers for programming gamma ramps
In-Reply-To: <20250509083911.39018-5-tzimmermann@suse.de>
References: <20250509083911.39018-1-tzimmermann@suse.de>
 <20250509083911.39018-5-tzimmermann@suse.de>
Date: Mon, 19 May 2025 15:16:12 +0200
Message-ID: <87y0usoi5f.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rDTY1zCvFzfBR0dfcYsLSVNc4KIJHKeqhNrVClD_x5I_1747660576
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

> Replace ofdrm's code for programming the hardware gamma LUT with
> DRM helpers. Either load a provided gamma ramp or program a default.
> Set the individual entries with a callback.
>
> Each gamma value is given as 3 individual 16-bit values for red,
> green and blue. The driver reduces them to 8 bit to make them fit
> into hardware registers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sysfb/ofdrm.c | 78 +++++++++++++----------------------
>  1 file changed, 29 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
> index fddfe8bea9f7..96fafdc8dd5e 100644
> --- a/drivers/gpu/drm/sysfb/ofdrm.c
> +++ b/drivers/gpu/drm/sysfb/ofdrm.c
> @@ -8,6 +8,7 @@

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

