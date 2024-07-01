Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2228C91DA41
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 10:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF9C10E35B;
	Mon,  1 Jul 2024 08:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bzrZo2l1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E9210E35E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719823355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wxBMcfQawTvepZ9isb1t5DiSkHYBb8+hVQTKzwn+1QM=;
 b=bzrZo2l1KIRPDAyDAaETnVpm0mtF4D+c0x0p+dRVdF1t35LHIQTM2BWGDt7Jvi4CsJxEOG
 R5sdA0CVGj2dqjeIAU7e0L421Qziq3QqEjYynPTp/Ag2K2hRClbxv46pJ3roOMdJCrnZLE
 +gf4MpSxwgiAG88n7eR37WoorCzeVNQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-6ZcIjsTpNASEueZcN4bJjw-1; Mon, 01 Jul 2024 04:42:34 -0400
X-MC-Unique: 6ZcIjsTpNASEueZcN4bJjw-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-52e765bc03bso2716189e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 01:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719823352; x=1720428152;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxBMcfQawTvepZ9isb1t5DiSkHYBb8+hVQTKzwn+1QM=;
 b=Lh5I0IdZ03h05xRru/y3DSa4zCZuHa/r0IcQBq1nXbt9NW+ShXjGArYOBghYAULx3m
 uRqhIN96/l1/hAGYJlBZD43u2xJ9+OFVZVqdnqPwstoPTJPG0McJaMAXNghq+bP7GS3C
 9cKLOJ1VsXylrTEOfU/Im09vH4BOatdG04hyPZz7ed6btOjZvrqNmTN5p0xy0k2PxfAn
 YDupp62Lxp66tPh2TFpBzidtnTptJSebOA+XWLVqlVRsZr1TfR5gKSXPILeQxreWI8BU
 j6CghCAepMHf2S0UM8rkIpUHAKIoTDpoHEIC9qq9NuTx9bhrm2sTGjFSyQpJPGsOVpEZ
 e6qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJgISz/iCQNlzHvDdQhO2dqKKVUWeF2cNxHwZPH6E5ElKgVy8g4J7yhNxFyKocP1ZcEUbFEKRudXUmSYVO0WFLA1+4e9mW8zgVsSHFQxbP
X-Gm-Message-State: AOJu0Ywg1d1yEhYKxlCjP4vZy/05iIISDT5uInd05nPNNt0PgBNarEsn
 672x6656dDxQJBUKLtOucBW76mGMoAuZKFC53aAG6/JSSoRtnqt+6LoC9kwo6tq3kGxDWnix16M
 JEBEH5Ojy7lNcPG24bvZXj8HEKPTA2b0SbjO7VSbUpMfuidKW4pXWJRKwcZTKBN4qWQ==
X-Received: by 2002:a05:6512:acc:b0:52c:e180:4eac with SMTP id
 2adb3069b0e04-52e8264bbd4mr3400271e87.9.1719823352561; 
 Mon, 01 Jul 2024 01:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ7z12uNVwePurswH5jms5DvCy+bmF02fq4bpiz+pG8MwWiV4jXX3a02TcCzZpGLu9O29TFw==
X-Received: by 2002:a05:6512:acc:b0:52c:e180:4eac with SMTP id
 2adb3069b0e04-52e8264bbd4mr3400249e87.9.1719823352167; 
 Mon, 01 Jul 2024 01:42:32 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-177-66.web.vodafone.de.
 [109.43.177.66]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257d9c7f18sm55855185e9.40.2024.07.01.01.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:42:31 -0700 (PDT)
Message-ID: <2108ac92-e241-4507-a759-c23de90d041e@redhat.com>
Date: Mon, 1 Jul 2024 10:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-generic: Fix framebuffer on big endian devices
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20240627173530.460615-1-thuth@redhat.com>
 <571556ed-17d2-4bcc-bb1f-fd4f827829c6@suse.de>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <571556ed-17d2-4bcc-bb1f-fd4f827829c6@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 28/06/2024 08.07, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.06.24 um 19:35 schrieb Thomas Huth:
>> Starting with kernel 6.7, the framebuffer text console is not working
>> anymore with the virtio-gpu device on s390x hosts. Such big endian fb
>> devices are usinga different pixel ordering than little endian devices,
>> e.g. DRM_FORMAT_BGRX8888 instead of DRM_FORMAT_XRGB8888.
>>
>> This used to work fine as long as drm_client_buffer_addfb() was still
>> calling drm_mode_addfb() which called drm_driver_legacy_fb_format()
>> internally to get the right format. But drm_client_buffer_addfb() has
>> recently been reworked to call drm_mode_addfb2() instead with the
>> format value that has been passed to it as a parameter (see commit
>> 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to 
>> drm_mode_addfb2()").
>>
>> That format parameter is determined in drm_fbdev_generic_helper_fb_probe()
>> via the drm_mode_legacy_fb_format() function - which only generates
>> formats suitable for little endian devices. So to fix this issue
>> switch to drm_driver_legacy_fb_format() here instead to take the
>> device endianness into consideration.
>>
>> Fixes: 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to 
>> drm_mode_addfb2()")
>> Closes: https://issues.redhat.com/browse/RHEL-45158
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> 
>> ---
>>   drivers/gpu/drm/drm_fbdev_generic.c | 3 ++-
> 
> This file is now called drm_fbdev_ttm.c in drm-misc-next.

Oh, ok, shall I send a v2 that is adjusted to that change, or can it be 
fixed while applying my patch?

> And a similar patch might be necessary for drm_fbdev_dma.c.

Looks similar, indeed. Shall I send a patch for that one, too? ... I 
currently don't have a setup for testing that, though...

  Thomas


> The code in drm_fbdev_shmem.c 
> apparently has it already.
> 
> Best regards
> Thomas
> 
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c 
>> b/drivers/gpu/drm/drm_fbdev_generic.c
>> index 97e579c33d84..1e200d815e1a 100644
>> --- a/drivers/gpu/drm/drm_fbdev_generic.c
>> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
>> @@ -84,7 +84,8 @@ static int drm_fbdev_generic_helper_fb_probe(struct 
>> drm_fb_helper *fb_helper,
>>               sizes->surface_width, sizes->surface_height,
>>               sizes->surface_bpp);
>> -    format = drm_mode_legacy_fb_format(sizes->surface_bpp, 
>> sizes->surface_depth);
>> +    format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
>> +                         sizes->surface_depth);
>>       buffer = drm_client_framebuffer_create(client, sizes->surface_width,
>>                              sizes->surface_height, format);
>>       if (IS_ERR(buffer))
> 

