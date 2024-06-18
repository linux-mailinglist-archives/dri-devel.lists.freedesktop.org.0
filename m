Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ACE90D710
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 17:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EDA10E094;
	Tue, 18 Jun 2024 15:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KKbotQm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D999210E6E2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718724134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSdr0PvNcZKhG0c42uWYIcTy1KQstlzrNrYGP6pPSYQ=;
 b=KKbotQm+sFk8ZgY3hv9RmnMSuuEaHO0fFyPE2vJ0DRG50kbVhG0KdtSY7hnKj/12fA6Ar3
 YbGc+Y0LaDgG2LTub1OuxBhCAbz64TKfLP+KBQGz49c35Sw9iUqT/NoQYFGml3lxyYkLik
 P1a0sRUbHDJx2y91soidi/6qUk5ZH/Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-YtQCMuIcN6Wltwi_ztrIww-1; Tue, 18 Jun 2024 11:22:12 -0400
X-MC-Unique: YtQCMuIcN6Wltwi_ztrIww-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-36250205842so348994f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718724131; x=1719328931;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PSdr0PvNcZKhG0c42uWYIcTy1KQstlzrNrYGP6pPSYQ=;
 b=LGCQnA8645bpUSRKAjV+QSv8ZAJD6Zi7Ws/TjhpqLlxe+77Ps37XBuI5TkZ6qlQSPD
 QwbAV3W6BCFJYTvTaQQZX3JM9TWBGaSh2q5esvLQSJ7H4OuftGAov80Boj2S6rmq+txH
 M2u+n0Y1hjB5QAyNcolZyc3++Cu+05vnswqhyjgkFEam+1yHY8edq1Dw9BL2BrJFB49G
 R4O9lwjjY4SjhhKZ9hj+y3QUrZNKwey7ocuaCu7oZarCWA6arkXYDPr8vwlnz5B/vKS0
 vaKoHbsEqvf7LYIbtAOzjlQ6e1uxhPcDkMl1TUD4neIgzF0hrzfQTuFFBq5PxDKbGyvi
 5lfA==
X-Gm-Message-State: AOJu0YxnxYiJ0Lq8ReBg4wUmTcIHToOzYPeCQtKfYEPhGIASd1d84BEv
 ACOqNkdnhr0C2gnJV07EE5pBn748Mtbx7gg3d+ukUH05euVDW2i6M9scFmd6XL5B3I3madljNB3
 /tPHkkj0B2dr40NjotKJeBv4gRrEKMnreRZv+rh0xiZLnFREzQiWaI1dpkYuyKJQT4A==
X-Received: by 2002:a05:6000:1372:b0:360:9a30:568c with SMTP id
 ffacd0b85a97d-3630191cc95mr185050f8f.34.1718724131619; 
 Tue, 18 Jun 2024 08:22:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvoZNzhacG75ZZnWeiGHVmfGmNf17+b2nE2TXqQc8bumDIPru4H76W3a3QtY0Tjm27yuKdpg==
X-Received: by 2002:a05:6000:1372:b0:360:9a30:568c with SMTP id
 ffacd0b85a97d-3630191cc95mr185019f8f.34.1718724131162; 
 Tue, 18 Jun 2024 08:22:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c906sm14357419f8f.39.2024.06.18.08.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 08:22:10 -0700 (PDT)
Message-ID: <ff48b144-5920-4f5a-871f-b2e8adff7a0f@redhat.com>
Date: Tue, 18 Jun 2024 17:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: depends on !VT_CONSOLE
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20240613154041.325964-1-jfalempe@redhat.com>
 <87r0cxqcrc.fsf@minerva.mail-host-address-is-not-set>
 <4a324a2e-0daf-488e-a3d8-ed27089e6cb9@redhat.com>
 <CAMuHMdVPVvXBvFRJsRSWbXTf9UQzdExV2ncN2aEsHec06_f79Q@mail.gmail.com>
 <988e215f-4d95-4ba0-852c-880e6931dd76@redhat.com>
 <87le33rkam.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87le33rkam.fsf@minerva.mail-host-address-is-not-set>
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



On 17/06/2024 11:27, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
>> On 17/06/2024 10:25, Geert Uytterhoeven wrote:
>>> Hi Jocelyn,
>>>
>>> On Mon, Jun 17, 2024 at 10:16 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> On 16/06/2024 14:43, Javier Martinez Canillas wrote:
>>>>> Jocelyn Falempe <jfalempe@redhat.com> writes:
>>>>>> The race condition between fbcon and drm_panic can only occurs if
>>>>>> VT_CONSOLE is set. So update drm_panic dependency accordingly.
>>>>>> This will make it easier for Linux distributions to enable drm_panic
>>>>>> by disabling VT_CONSOLE, and keeping fbcon terminal.
>>>>>> The only drawback is that fbcon won't display the boot kmsg, so it
>>>>>> should rely on userspace to do that.
>>>>>> At least plymouth already handle this case with
>>>>>> https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224
>>>>>>
>>>>>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/Kconfig | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>>>> index a9df94291622..f5c989aed7e9 100644
>>>>>> --- a/drivers/gpu/drm/Kconfig
>>>>>> +++ b/drivers/gpu/drm/Kconfig
>>>>>> @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
>>>>>>
>>>>>>     config DRM_PANIC
>>>>>>        bool "Display a user-friendly message when a kernel panic occurs"
>>>>>> -    depends on DRM && !FRAMEBUFFER_CONSOLE
>>>>>> +    depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
>>>>>
>>>>> I thought the idea was to only make it depend on !VT_CONSOLE, so that
>>>>> distros could also enable fbcon / VT but prevent the race condition to
>>>>> happen due the VT not being a system console for the kernel to print
>>>>> messages ?
>>>>
>>>> Yes, but when writing the patch, I thought that if you have VT_CONSOLE=y
>>>> and FRAMEBUFFER_CONSOLE=n, then there won't be any race condition, and
>>>> drm_panic can be enabled safely.
>>>> I don't know if that really matters, and if VT_CONSOLE has any usage
>>>> apart from fbcon.
>>>
>>> It is used for any kind of virtual terminal, so also for vgacon.
>>
>> Ah thanks, but I think vgacon is safe to use with drm_panic.
>>
>> The problem with fbcon, is that it can also uses the fbdev emulation
>> from the drm driver, and in this case, drm_panic will write to the same
>> framebuffer as fbcon during a panic, leading to corrupted output.
>> This can't occur with other graphical console, so !(FRAMEBUFFER_CONSOLE
>> && VT_CONSOLE) is probably good.
>>
> 
> Yeah, I agre that !(FRAMEBUFFER_CONSOLE && VT_CONSOLE) as you have in your
> patch is what makes sense. !VT_CONSOLE alone as I argued in my first email
> isn't correct since as you pointed out, it shouldn't affect other consoles
> besides fbcon.
> 
> So please feel free to also add:
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Thanks all for your comments and reviews.

I just pushed it to drm-misc-next.

-- 

Jocelyn

