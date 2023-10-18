Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D67CD790
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B694710E086;
	Wed, 18 Oct 2023 09:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD69E10E086
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697620179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUJES4xzz4OgYhBm0mkytoX+dUxjIQDJlTwNvCoMkHk=;
 b=WDAK0OmYoX46bcXifa2RzcsUUZYEsLNeXrsMUgvYuP1ZM1BXbQK4ONpmPvfXX815BLfTN8
 cfukrbI/LBwZ0mkc4R2vtpwDGv31lALGhR4J2iy2qIQJOJhk185yGHJ8s6Inr3HWvpsiv6
 DUbbsWiB5ocwyWUgq7DmIY0/PXOVSro=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-LwUjW0XrNf2zxZcTt-wb2w-1; Wed, 18 Oct 2023 05:09:38 -0400
X-MC-Unique: LwUjW0XrNf2zxZcTt-wb2w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9ae0bf9c0b4so499807466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 02:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697620177; x=1698224977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZUJES4xzz4OgYhBm0mkytoX+dUxjIQDJlTwNvCoMkHk=;
 b=oAFSYRDr6dCgMO7WVpMFtMctqEzN94Iso4hvdhyNScier5NdNohjNRa5Y5lYCH1f6o
 T8w3OkDtIisYP8NgeGwD8jRYzAb1BVXypefvzqT7IZIuGX/aajL4wcljr5RRbjwUFgcy
 8klNCBE1eOIC7Cyl9qLAacycqJ9AkiXwvl59SDRIOgpT1+JpKGHAL9pbZBEZgl12NzRM
 ozQ6R/11y75EAmk6Vtzzkg9A/urRJRw/D8rJvdTTxs6sAbbWEtoozM7lN4Ph5sQ5COBV
 PdGifiOb/d0MVzLEJHgM9aTt29CoI7nb5R9L4UZ7DUdpMXY08+Ofb46zTaTVvH+1wAdV
 +J6A==
X-Gm-Message-State: AOJu0YyEG/N+Uyd66SW0EfgWH7sQhwGJnsHLrqfdS8Aj+vMuWaEuEVAk
 nE/4FklCsJ8l+FGXDXdspwgwes0uEhjhbFvRJo3tO9a8G5XfUeQfFFSlICWfquy2+XTWWZ029+y
 IB9vxLWKm1KD6WP/7afe5FENPzl4o
X-Received: by 2002:a17:906:dc89:b0:9bd:7f40:caa5 with SMTP id
 cs9-20020a170906dc8900b009bd7f40caa5mr3528466ejc.77.1697620177542; 
 Wed, 18 Oct 2023 02:09:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKHi8O4GH1i87FLH4zCOBGCozeaNzeB8YR07/3Ub04FKBzLRHFthyISjh4iNR2VFpoqq1Z6w==
X-Received: by 2002:a17:906:dc89:b0:9bd:7f40:caa5 with SMTP id
 cs9-20020a170906dc8900b009bd7f40caa5mr3528452ejc.77.1697620177179; 
 Wed, 18 Oct 2023 02:09:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a1709060ac500b009b65a834dd6sm1229567ejf.215.2023.10.18.02.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 02:09:36 -0700 (PDT)
Message-ID: <0c88666a-ff36-b649-d244-ccce500b6c2f@redhat.com>
Date: Wed, 18 Oct 2023 11:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [rft, PATCH v1 0/2] drm/i915/dsi: An attempt to get rid of IOSF
 GPIO on VLV
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231018051052.1328852-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231018051052.1328852-1-andriy.shevchenko@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On 10/18/23 07:10, Andy Shevchenko wrote:
> DSI code for VBT has a set of ugly GPIO hacks, one of which is direct
> talking to GPIO IP behind the actual driver's back. An attempt to fix
> that is here.
> 
> If I understood correctly, my approach should work in the similar way as
> the current IOSF GPIO. 
> 
> Hans, I believe you have some devices that use this piece of code,
> is it possible to give a test run on (one of) them?

Yes I should be able to find a device or 2 which poke GPIOs from the
VBT MIPI sequences. Unfortunately I don't know from the top of my head
which devices actually use this, so I may need to try quite a few devices
before finding one which actually uses this.

I'll try to get this series tested sometime the coming weeks,
depending on when I can schedule some time for this.

Regards,

Hans




> 
> Andy Shevchenko (2):
>   drm/i915/dsi: Extract common soc_gpio_exec() helper
>   drm/i915/dsi: Replace poking of VLV GPIOs behind the driver's back
> 
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 150 +++++++------------
>  1 file changed, 58 insertions(+), 92 deletions(-)
> 

