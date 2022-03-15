Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D671C4D9ACC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6A910E5CD;
	Tue, 15 Mar 2022 12:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCC910E588
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647345601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EfHwLZ6WtwFkxJceJihq9t4icqNtwFmMvMop7qIav68=;
 b=bXv6wqA4rVgQgqFNdGVTdjaIc0mh7ZJWPaH5C/AqXuTMszh3TnITsn6iAKZh/qqntBcbE0
 tP+RebvngWIz7/Te1LwT00ZP93Q9EJUd+hkL36UhE+TvPvel8S7B/eOoHPgu8CnuFtnmfr
 TD7dI8J1yhYvTczs4HDdLzdC+OCt7Mc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-J28Bn_6dPdy9Nmd2JnEI9A-1; Tue, 15 Mar 2022 07:59:59 -0400
X-MC-Unique: J28Bn_6dPdy9Nmd2JnEI9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 z9-20020a7bc7c9000000b00389bd375677so1069985wmk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 04:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EfHwLZ6WtwFkxJceJihq9t4icqNtwFmMvMop7qIav68=;
 b=rt1VozvTzE6J1de4G4heIjR8iRjDzt9tH8TgAA3o6IcnPG5JYKcKT/p9MjDx3s0Mrv
 eSL4SkauLzknoVuxbam7MXbhSvQNy8tgY8o/IRorXNDvN3dWbBf7ySvIug19HK/XhMqT
 Sni218Puu1KLNPJqgv14jb5NuDkf9CjJynt5cTljSmnwC3rGNKW01WZaso5HWsPISBZs
 DEnUvI98vgPvuqIkkHG91hCE5mBS8d33MQhNKVK+Zl5KMqlIZtqYxWTyjFKiXqihnaKr
 F1hh5jH78KzVjmdgb9OLVDdbC5YznBMETV8bBryb0eVDRJpz5KrG1odYV61+aj9mdyO9
 VjJw==
X-Gm-Message-State: AOAM5324ybaVMUvKy0pUVui3q116+Q5Y+qFKUuzjEFSjMSuNfIyUxsEF
 HB3U1tS0mvjy8JS+a9xcdZ8gka3l8afxstZUTylO8ArRIs49Bxw2CtTjDi6tNlOGzjjYDRLBbDz
 N9JbDqWki5sgNdRjYk/MebVZnEJ7W
X-Received: by 2002:adf:f18f:0:b0:1f0:761:491d with SMTP id
 h15-20020adff18f000000b001f00761491dmr19493112wro.505.1647345597812; 
 Tue, 15 Mar 2022 04:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3q7Jx4Hf6PlL7mAci9EOXtUzatt6VVmdN2f4A2ddwH+xm8/PGXivwu6Wk/5IPV5J/w+aB6Q==
X-Received: by 2002:adf:f18f:0:b0:1f0:761:491d with SMTP id
 h15-20020adff18f000000b001f00761491dmr19493097wro.505.1647345597567; 
 Tue, 15 Mar 2022 04:59:57 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a1c5408000000b00389bf11ba0csm2079941wmb.38.2022.03.15.04.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 04:59:57 -0700 (PDT)
Message-ID: <8d672df4-0078-2777-bde7-89f65b1e60c0@redhat.com>
Date: Tue, 15 Mar 2022 12:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] drm/format-helper: Rename
 drm_fb_xrgb8888_to_mono_reversed()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-2-geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220315110707.628166-2-geert@linux-m68k.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

Thanks for your patch.

On 3/15/22 12:07, Geert Uytterhoeven wrote:
> There is no "reversed" handling in drm_fb_xrgb8888_to_mono_reversed():
> the function just converts from color to grayscale, and reduces the
> number of grayscale levels from 256 to 2 (i.e. brightness 0-127 is
> mapped to 0, 128-255 to 1).  All "reversed" handling is done in the
> repaper driver, where this function originated.
> 
> Hence make this clear by renaming drm_fb_xrgb8888_to_mono_reversed() to
> drm_fb_xrgb8888_to_mono(), and documenting the black/white pixel
> mapping.
> 
> Fixes: bcf8b616deb87941 ("drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
As you mentioned the function originally came from the repaper driver
(that uses white-on-black) and I wrongly assumed that the destination
buffer for the OLED panels were also monochrome reversed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

