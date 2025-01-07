Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E53CA0440F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D85E10E1CA;
	Tue,  7 Jan 2025 15:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GPeRg7eP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF72210E1CA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736263115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUplG4F0XeXedPiFUz73Lrgro3oMqYtlKZ5uOAi7unA=;
 b=GPeRg7ePia7CUyO84fFowknQN6P7mX743b0X+I6pNC4mKj1C0x0MApk5iSqsNpyMF4IzVo
 /IcbDXrtawemInNuKjt0Acs/I/SSQv9+ZAoBgyPJznKyKOo1YYP9zt7W+lR590xHHT1MnJ
 qXiyd1Ugu/zVYczBVZ5NkAULl3Gt7Ro=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-cQyK6W3AMC2loVbqwvl05w-1; Tue, 07 Jan 2025 10:18:34 -0500
X-MC-Unique: cQyK6W3AMC2loVbqwvl05w-1
X-Mimecast-MFC-AGG-ID: cQyK6W3AMC2loVbqwvl05w
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4362f893bfaso86638345e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 07:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736263113; x=1736867913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rUplG4F0XeXedPiFUz73Lrgro3oMqYtlKZ5uOAi7unA=;
 b=DXmaibA808o9J5WH7EQoG6r4s65ssnuc8CQS+OZM7+ADIBbi3vxmCfhPgaxGm4EYGO
 qKiaXXBZs7OWHHpvrH+6B7oQ0ymVDw5pOyHCAsBrlOxQVsJI2PaG+S569tTSWDs/ptPb
 b4vp4IX47/K5N+UJYwBIEZFB8e9YyZij96kPhpjeXyrKGRn4qmEJlkZYQiu4jZig7S9r
 UmFsAvIdvg5k2FtjipZz42a7HsABM0wjF+i8/zx5FGGjhiHLYDzDXeuK2JQn1OyTVpb1
 O4fgGo1a74wEq0+1aA8XqVZEOIbsDQpwkEOd5vdvgGKCcYty6jByB+tiY8wJXCQw17ui
 Kmbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLvyYjBSaMow7BiLZObA6aFT9fdweKpv6lz9Q1uqYrtNfKsdH8Ta5WeTwdxmbPiXc+1su5waLJ/Fc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8a0aCw3DKHCn8YZPOeFmpvg3gWWID8+1gQnlsmNvxS/LY3+PV
 dGI/d+Ox9IPoeUm72Fe9FNdX5aOcR/TUk7xxqq6eUU9F7A13BH6h2sJ767cUW+Xf4i1Nu9NbrPE
 hy9BLwlRVTa0aFylTNTbAZQ84FYK8c5N0v7vu550F4M3JH7JApoetZubHoV6XmlnZWA==
X-Gm-Gg: ASbGncv5yX9afcUhxnEROwGAHhE7vvpNWEG5Y3W6JVy7voDP3/wKdn2wPrKk3GH5jyb
 0MXn+uaC6E7sZksYuEPSzWV36dqj73MaD/ltLiN883h7YjEf/2vR44hY2HqdO/d3UEelOSxNce8
 OvwaNlLUgfLqF18j+bCW3JUWKyWLrCB9jGieyyV/aZRtFqHpwTtIeGB+AsxXpIIpuGFuqAW/yko
 olP3u+UR1W19Bzp1Jw7XdODGeijFXBBlKAi34KQl8ari5AbtIDo2cgzt7UdFydW/UHe8WNvA7FK
 GQcUMG4hS0IicEKzV2sE
X-Received: by 2002:a05:600c:1994:b0:435:306:e5dd with SMTP id
 5b1f17b1804b1-43668b5dfaamr501387205e9.22.1736263113457; 
 Tue, 07 Jan 2025 07:18:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHimNiTTdzzguuYHGQ8lf7oorYauE7LFqE/pVfbyw+CccfhbHiXVwvu0+s5XK8lqHt82lbpMg==
X-Received: by 2002:a05:600c:1994:b0:435:306:e5dd with SMTP id
 5b1f17b1804b1-43668b5dfaamr501386895e9.22.1736263113060; 
 Tue, 07 Jan 2025 07:18:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611fc762sm597842465e9.11.2025.01.07.07.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:18:32 -0800 (PST)
Message-ID: <6f46535b-1075-4ac7-8809-274dffada2c8@redhat.com>
Date: Tue, 7 Jan 2025 16:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/{i915,xe}: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20241212170913.185939-1-tzimmermann@suse.de>
 <20241212170913.185939-11-tzimmermann@suse.de>
 <8e175713-2762-4767-86c6-fe0c0b7e8cf2@redhat.com>
 <332ba13f-8dd8-4195-9af2-26b1f18cf1c8@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <332ba13f-8dd8-4195-9af2-26b1f18cf1c8@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ev6ElhUjHPzJVgndwGcPMgJWbXExPpFf08FBjWSwDEY_1736263114
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/01/2025 15:42, Thomas Zimmermann wrote:
> Hi Jocelyn
> 
> 
> Am 07.01.25 um 13:10 schrieb Jocelyn Falempe:
>> On 12/12/2024 18:08, Thomas Zimmermann wrote:
>>> Rework fbdev probing to support fbdev_probe in struct drm_driver
>>> and remove the old fb_probe callback. Provide an initializer macro
>>> that sets the callback in struct drm_driver according to the kernel
>>> configuration. Call drm_client_setup_with_color_mode() to run the
>>> kernel's default client setup for DRM.
>>>
>>> This commit also prepares support for the kernel's drm_log client
>>> (or any future client) in i915. Using drm_log will also require vmap
>>> support in GEM objects.
>>
>> I've tested this series on an Alderlake laptop, and it effectively 
>> breaks the boot with drm_log on i915. (I can still see the drm_log on 
>> simpledrm, but when it switches to i915, I get a blackscreen, and the 
>> laptop hard freezes).
>> Can we wait to have the proper vmap support in GEM objects, before 
>> merging this series?
>> Or at least prevent drm_log to load on i915, until it is fixed?
> 
> Did you add vmap support as advised here? i915 will not support drm_log 
> without and this series does not add it.
> 
> A patch for vmap functions is at [1], I think.

Thanks a lot, it works much better with this patch :)
That was the missing piece to have drm_log display something on i915.

Best regards,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
> [1] https://patchwork.freedesktop.org/series/135554/
> 
> 
>>
>> Best regards,
>>
> 

