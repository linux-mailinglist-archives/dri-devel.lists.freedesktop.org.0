Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C276DF975
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 17:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BF810E1B1;
	Wed, 12 Apr 2023 15:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF2010E1B1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 15:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681312425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XT3tPLbRZVK3wpb2TBfFgpIknWPV7WjRoLGVIKgtc1Q=;
 b=X+FhlZsxhG+vqIs1NkBzyu7srTaoxPassj9Wuuvdq+gnH55AUPALQcb1T0chorl3wazdZJ
 jYPhgOwyc0OJHgnx3FtV/zCxvUePP81jBM3tOUEUu1QCa8sP32cdDmR8M5bz55yrpdEfBq
 7x+IBWnmJ6oAIBVtqdjEq53EuWPvoII=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-OS4v1dQxPsW7t5b61Ch9Og-1; Wed, 12 Apr 2023 11:13:44 -0400
X-MC-Unique: OS4v1dQxPsW7t5b61Ch9Og-1
Received: by mail-wr1-f72.google.com with SMTP id
 o26-20020adfa11a000000b002dd3986083bso1983660wro.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681312423; x=1683904423;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XT3tPLbRZVK3wpb2TBfFgpIknWPV7WjRoLGVIKgtc1Q=;
 b=CdT/RfWx73rP2Z+CiEZ9nwKtTQBQ8YeFcBHhJN59J8YcKAavWYmssq03F4n/+VHkBR
 qnPV/AXhHUgJ/Y+hkRGTGfraYkGsFisX1PHqloKJhAmR734pTQvQaET/mCAd/w91EUud
 GkAsrgl5Wu7gbtzXAwhXzwlTRSgQogZZisRQYIaSecwE/HZmEOjOwczWNuyM1cgkNrC6
 9f67NyGrZFL2jYxo9Mhi1m45WSuBzr/dJWp7LqUXHRvEMNc9MDbk4FtPHeONzc3/nTFQ
 2nEmXeCytEBDzbVBpqClp2i6CLAyqNFtwPpS0eG3rnKevRLC21PsUYcHoka+5YkSXAYj
 234Q==
X-Gm-Message-State: AAQBX9eNdyhocHc8hZdUi9zLpySZ0Bk6P2GWaKsjP94DoxV/wIzTqImz
 ZAoyoPGznylpm/AwZjRLW0d4yKT/xDjG4tGOXFX6Z0PFqCNSxdwDXwrJm35w0Y6G9C6Z5RpuMD3
 Uf14Q0AKlbnyqCXZQWkwazBFZNpFjKSvXFfxr
X-Received: by 2002:a05:600c:507:b0:3f0:7eda:c19f with SMTP id
 i7-20020a05600c050700b003f07edac19fmr2243204wmc.11.1681312423283; 
 Wed, 12 Apr 2023 08:13:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350bLo3aJ8ql3dAsHfqG7jTW85m/W8BjK/jhizqZiL7kUawOK3lNMJ/JF7SE0516OIppkC8amNg==
X-Received: by 2002:a05:600c:507:b0:3f0:7eda:c19f with SMTP id
 i7-20020a05600c050700b003f07edac19fmr2243192wmc.11.1681312423034; 
 Wed, 12 Apr 2023 08:13:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcc88000000b003f072b22dbbsm2645972wma.16.2023.04.12.08.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:13:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, lyude@redhat.com
Subject: Re: [PATCH 2/2] drm/mgag200: Use 24bit format in VRAM
In-Reply-To: <20230412133912.610294-3-jfalempe@redhat.com>
References: <20230412133912.610294-1-jfalempe@redhat.com>
 <20230412133912.610294-3-jfalempe@redhat.com>
Date: Wed, 12 Apr 2023 17:13:41 +0200
Message-ID: <87mt3drv4q.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

> The bandwidth between system memory and VRAM is very limited
> on G200.
> So when using a 32bit framebuffer on system memory, convert it to 24bit
> when copying the frame to the VRAM, this allows to go 33% faster.
> Converting the format on the fly is negligible, even on low end CPU.
>
> small benchmark on my Dell T310:
> 1280x1024 32bits: ~125ms to transfert a single frame.
> 1280x1024 24bits: ~95ms
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

I assume that the alpha channel is unused on this display HW and is just
exposed to user-space to make the DRM driver more compatible ?

If so, probably has to be mentioned in the changelog but other than that:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

