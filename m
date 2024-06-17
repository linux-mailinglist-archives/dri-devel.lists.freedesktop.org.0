Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C7990A966
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A53310E087;
	Mon, 17 Jun 2024 09:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c2MWzG7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A812E10E087
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718616050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuBeNVzoXVN3yeMx0efPLjX4Y05ZjKpnKKdt+UZ/ka0=;
 b=c2MWzG7M+G1EAxq/63BtnSlnsOGqmvjJufZdBN7cFcxGuaZg2RRdHItm4hWUCEznjtClJr
 TPfDinXxJKNlQRL67r2FVx4B0xLyYbTx0pJw3aVTnw6ky4Bier+5H6uDApzF802Bvi2bMg
 NU78siaKU2QU0Cfndt1//xWweSxbbO8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-6qgQVB3mMleiVHAhh49j0g-1; Mon, 17 Jun 2024 05:20:48 -0400
X-MC-Unique: 6qgQVB3mMleiVHAhh49j0g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-423034c6119so22872145e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 02:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718616047; x=1719220847;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kuBeNVzoXVN3yeMx0efPLjX4Y05ZjKpnKKdt+UZ/ka0=;
 b=iHdoWI5Cr+g2jlnJX825PXVuWRhdZ25tY3W0dkDHTrE4ELQSbMY7GCMvYhrBX7aFGc
 1ozgvgA/AR2EjAWS4QvHVYC5Z4OvtfL+hb7pYre3Ehd3mg6zArSgY84CJbFlTTfCaGeV
 TCVqwOHwIQBFY2cqX+Zvco2QE/woJvhC7+4oaVo1M7YOJvHYIgu8tWoBRE67+PK9cBbN
 ydpzHno7oUXDeRm3ZRWsLo33J4T51O6Z9VBWCSyXpFP5OQ9e0zw6FbBW8VE+HF+EpE+F
 GOjbLG2eF0qGPufAUrEZnoRUgSajyGXFv1b8+qm8maNPVMTs27S7+8ipsZ3Mh24qfQK3
 E0nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXdU+EM7RgJLYloaUTnL9K58fnTZepeL70NP513tI0tQuDkeq5zJ5pFWDQW8FYKiu01ImwSoV7rn1Tnn1Sfrwbn1oroH0nSZdH6x8xKUk6
X-Gm-Message-State: AOJu0YzfTg6PG7LGO0Tw/gX+bj+1ZZHMIVfDiRerN7w3c7K34CyqHYmE
 3SfO5891/1jgy2R6JUKTZUZYNp94GFqzlwjpxU+4351nz8BVogtZG+x4rcVMPJL+/jizPz4KhM2
 T9sC9axZjitdbVzJHaPBDLiqpVv211/dKaqeR3eMRbxsfBVDWGt4JtIgSVH4TdBWE1w==
X-Received: by 2002:a05:600c:218b:b0:421:aace:7a94 with SMTP id
 5b1f17b1804b1-4230484b068mr59370635e9.40.1718616047752; 
 Mon, 17 Jun 2024 02:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR5ElXt3vac0OUQ4D1AKcbEze8xTxm8iB/H94tPa6YaUJqjEbRAhNyzU6RlBhsSHLQvCMUQA==
X-Received: by 2002:a05:600c:218b:b0:421:aace:7a94 with SMTP id
 5b1f17b1804b1-4230484b068mr59370425e9.40.1718616047352; 
 Mon, 17 Jun 2024 02:20:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286fe919bsm188444375e9.19.2024.06.17.02.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 02:20:46 -0700 (PDT)
Message-ID: <988e215f-4d95-4ba0-852c-880e6931dd76@redhat.com>
Date: Mon, 17 Jun 2024 11:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: depends on !VT_CONSOLE
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20240613154041.325964-1-jfalempe@redhat.com>
 <87r0cxqcrc.fsf@minerva.mail-host-address-is-not-set>
 <4a324a2e-0daf-488e-a3d8-ed27089e6cb9@redhat.com>
 <CAMuHMdVPVvXBvFRJsRSWbXTf9UQzdExV2ncN2aEsHec06_f79Q@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdVPVvXBvFRJsRSWbXTf9UQzdExV2ncN2aEsHec06_f79Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 17/06/2024 10:25, Geert Uytterhoeven wrote:
> Hi Jocelyn,
> 
> On Mon, Jun 17, 2024 at 10:16 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 16/06/2024 14:43, Javier Martinez Canillas wrote:
>>> Jocelyn Falempe <jfalempe@redhat.com> writes:
>>>> The race condition between fbcon and drm_panic can only occurs if
>>>> VT_CONSOLE is set. So update drm_panic dependency accordingly.
>>>> This will make it easier for Linux distributions to enable drm_panic
>>>> by disabling VT_CONSOLE, and keeping fbcon terminal.
>>>> The only drawback is that fbcon won't display the boot kmsg, so it
>>>> should rely on userspace to do that.
>>>> At least plymouth already handle this case with
>>>> https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224
>>>>
>>>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/Kconfig | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index a9df94291622..f5c989aed7e9 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
>>>>
>>>>    config DRM_PANIC
>>>>       bool "Display a user-friendly message when a kernel panic occurs"
>>>> -    depends on DRM && !FRAMEBUFFER_CONSOLE
>>>> +    depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
>>>
>>> I thought the idea was to only make it depend on !VT_CONSOLE, so that
>>> distros could also enable fbcon / VT but prevent the race condition to
>>> happen due the VT not being a system console for the kernel to print
>>> messages ?
>>
>> Yes, but when writing the patch, I thought that if you have VT_CONSOLE=y
>> and FRAMEBUFFER_CONSOLE=n, then there won't be any race condition, and
>> drm_panic can be enabled safely.
>> I don't know if that really matters, and if VT_CONSOLE has any usage
>> apart from fbcon.
> 
> It is used for any kind of virtual terminal, so also for vgacon.

Ah thanks, but I think vgacon is safe to use with drm_panic.

The problem with fbcon, is that it can also uses the fbdev emulation 
from the drm driver, and in this case, drm_panic will write to the same 
framebuffer as fbcon during a panic, leading to corrupted output.
This can't occur with other graphical console, so !(FRAMEBUFFER_CONSOLE 
&& VT_CONSOLE) is probably good.

-- 

Jocelyn
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

