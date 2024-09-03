Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32780969CE2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F12110E523;
	Tue,  3 Sep 2024 12:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IAvP5xRM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF0210E523
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KYNG7ZSPE/elB3b9WkJzkds2S1MCd8qjtTvrXcJahJw=;
 b=IAvP5xRMhVcvwe0sjBDMOFG4jydUH0coT7F6AztcYwMEGSCKZwNI5doyaAnx+19y52glB5
 jl3qapcX15dkhM49VFo49HzgdZzbYvRjrwoDkCkade4ckTvn/L5ZFHZo6DInNv1TtHmHRE
 Vsbzn2L9yyqj0aMmjb1QZD4FU1dRiLM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-UqrxOHMfOuG0L5hEvXe_Xg-1; Tue, 03 Sep 2024 08:06:17 -0400
X-MC-Unique: UqrxOHMfOuG0L5hEvXe_Xg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a86f0c0af53so453236766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365177; x=1725969977;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYNG7ZSPE/elB3b9WkJzkds2S1MCd8qjtTvrXcJahJw=;
 b=ico04/sy8ZCQPpjYU/ee3x8nNv10YWVtTWK/Szwt0X66I+8okdVUjCnioYWl6DXS4r
 urntdW9ptim6G8mHpcE826osbRRVedWgCuM3H5FNjL0ixJMpEeAcTv6ObMWsSwrkMbPe
 XKXlAjf30FGadjuebdZ4DyjjxptK4Ca2dRgTnsXU3XxwlBnYIN+Fvl1YEthOx+w3CTux
 z2uxMnSv1ExARdizazCxR2Oy+wgw0hceakVGKTL2YDq03A+Ny/RWRNld6TBOLrO/ng8d
 GW+NXTQ08H2DF+kZnz9BC07qgmfh9rbW4HCGeNb2F7LS0ibB0QcanDb81U5mE1juCfp6
 +zqQ==
X-Gm-Message-State: AOJu0YxwR/6Nez0gilsYvkWyVNIaP57LfBKfDhfxLGZN4WbZG00KTZT2
 2BARkSWNCYw/XEqm4kEqMb0xEP7VUWPyTEZcmasrGnU5kE9Y2MqJ7qvuJkicvYXQEPYM8r1w0+j
 dKmwrZpQmbzSl4+9w4OeLy/bKc4EYWUTf1muZU531QRFypsZmLKMG/x5Sq6+qcN4msg==
X-Received: by 2002:a17:907:7250:b0:a79:fbf0:8106 with SMTP id
 a640c23a62f3a-a897f77eecdmr1349124466b.6.1725365176615; 
 Tue, 03 Sep 2024 05:06:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKHGdQu76q7cILNEki/LAIO6w7xbkB8ymwVL7bsW03a2bqt4zVKnQvFzb+qrennFW3Jt3aZg==
X-Received: by 2002:a17:907:7250:b0:a79:fbf0:8106 with SMTP id
 a640c23a62f3a-a897f77eecdmr1349122466b.6.1725365176148; 
 Tue, 03 Sep 2024 05:06:16 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892164f5sm672520766b.192.2024.09.03.05.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:06:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 66/81] drm/bochs: Run DRM default client setup
In-Reply-To: <20240830084456.77630-67-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-67-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:06:15 +0200
Message-ID: <87y149c56w.fsf@minerva.mail-host-address-is-not-set>
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
> The bochs driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/tiny/bochs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

