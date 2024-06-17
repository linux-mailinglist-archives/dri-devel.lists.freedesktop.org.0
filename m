Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA690A988
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE7710E172;
	Mon, 17 Jun 2024 09:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OfdzuswI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8182710E172
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718616453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9BYQ+emGQtvvTrawOA+9/Vuh9iuGPmjRcPtVmIqeAk=;
 b=OfdzuswInxzxUKuv5nverbPdSgAUKhxJRRu5ORcVp99KyKsaZVejbCTQFXCAfjTO+Vu7+4
 3pKg8rnNGR83wOc84HDSvuLSW9P8wurZsZI8jkyoaP5GwowwGvQAdBQuPldyX9BZC+F199
 qf6i8XiPZJI/zFw5W2whofUyfBh1Pdo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-OFArJiaMPSWxNyzShut8kQ-1; Mon, 17 Jun 2024 05:27:32 -0400
X-MC-Unique: OFArJiaMPSWxNyzShut8kQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-35f1f29ccefso2187115f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 02:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718616451; x=1719221251;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+IHKlZSxWYy5+A6ifPrBUKHEqwLGyhyhed7YOr+ask=;
 b=UWLYmvAU7SZB6IpmgJ4f89lusmlJN9CTmbD76tsyvj807qL1oR1t3kVldi17OuEbsA
 k0jUVjUoZBz4RjWBwOEKBe6ykP+E1qPDROmoXUnN4G8PpZCTIMYFRjPrMGNwezzny3Ft
 WxG0/QJbLjCTBR+Ycq1DAYW3j297imMd5bCbIDzehyxGQgIOFGQRwlYruL0bbWfDL1gT
 5I8/UIFIk5KeaFCSOxGgtLH3Pfmp2Ik96qAbAFkyewebwChbehwCzUVeqGLG/CjGjqqR
 jKPKCXZJ0mjrRsmV6tGMpv8n5se9/Y8zdhUKZ5pT3o8q7qDCOs9pG9GEsff3l6QgIKTZ
 57kg==
X-Gm-Message-State: AOJu0Yx0Jb5R/ULKvD2CQitxadzChk4ayle3dKaddm3JCNGjpf/y7IF8
 aixh6e/RiEuEk2Ci/9O3LK3k51t6XinOEuVER4FT1602YdeLS3egUxBKedZWYAbcLn+JYlsh1RE
 EaAxC4tRq0tgcoO7uKBjPxk+Ok+hdu7J9bO+QV/zE/WQvyrdYCgHY0nRLw3l719YtZg==
X-Received: by 2002:adf:ec0b:0:b0:35f:2598:3709 with SMTP id
 ffacd0b85a97d-3607a7d9902mr6364356f8f.56.1718616451125; 
 Mon, 17 Jun 2024 02:27:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQbv6iJr3cAQkEKo26D6fbIwBJXrdqOn8faHtS0lzoLiPVallAIND5BxAlZyVaXGwbU+5IWg==
X-Received: by 2002:adf:ec0b:0:b0:35f:2598:3709 with SMTP id
 ffacd0b85a97d-3607a7d9902mr6364335f8f.56.1718616450604; 
 Mon, 17 Jun 2024 02:27:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3609a892324sm852823f8f.6.2024.06.17.02.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 02:27:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/panic: depends on !VT_CONSOLE
In-Reply-To: <988e215f-4d95-4ba0-852c-880e6931dd76@redhat.com>
References: <20240613154041.325964-1-jfalempe@redhat.com>
 <87r0cxqcrc.fsf@minerva.mail-host-address-is-not-set>
 <4a324a2e-0daf-488e-a3d8-ed27089e6cb9@redhat.com>
 <CAMuHMdVPVvXBvFRJsRSWbXTf9UQzdExV2ncN2aEsHec06_f79Q@mail.gmail.com>
 <988e215f-4d95-4ba0-852c-880e6931dd76@redhat.com>
Date: Mon, 17 Jun 2024 11:27:29 +0200
Message-ID: <87le33rkam.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> On 17/06/2024 10:25, Geert Uytterhoeven wrote:
>> Hi Jocelyn,
>>=20
>> On Mon, Jun 17, 2024 at 10:16=E2=80=AFAM Jocelyn Falempe <jfalempe@redha=
t.com> wrote:
>>> On 16/06/2024 14:43, Javier Martinez Canillas wrote:
>>>> Jocelyn Falempe <jfalempe@redhat.com> writes:
>>>>> The race condition between fbcon and drm_panic can only occurs if
>>>>> VT_CONSOLE is set. So update drm_panic dependency accordingly.
>>>>> This will make it easier for Linux distributions to enable drm_panic
>>>>> by disabling VT_CONSOLE, and keeping fbcon terminal.
>>>>> The only drawback is that fbcon won't display the boot kmsg, so it
>>>>> should rely on userspace to do that.
>>>>> At least plymouth already handle this case with
>>>>> https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224
>>>>>
>>>>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>>> ---
>>>>>    drivers/gpu/drm/Kconfig | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>>> index a9df94291622..f5c989aed7e9 100644
>>>>> --- a/drivers/gpu/drm/Kconfig
>>>>> +++ b/drivers/gpu/drm/Kconfig
>>>>> @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
>>>>>
>>>>>    config DRM_PANIC
>>>>>       bool "Display a user-friendly message when a kernel panic occur=
s"
>>>>> -    depends on DRM && !FRAMEBUFFER_CONSOLE
>>>>> +    depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
>>>>
>>>> I thought the idea was to only make it depend on !VT_CONSOLE, so that
>>>> distros could also enable fbcon / VT but prevent the race condition to
>>>> happen due the VT not being a system console for the kernel to print
>>>> messages ?
>>>
>>> Yes, but when writing the patch, I thought that if you have VT_CONSOLE=
=3Dy
>>> and FRAMEBUFFER_CONSOLE=3Dn, then there won't be any race condition, an=
d
>>> drm_panic can be enabled safely.
>>> I don't know if that really matters, and if VT_CONSOLE has any usage
>>> apart from fbcon.
>>=20
>> It is used for any kind of virtual terminal, so also for vgacon.
>
> Ah thanks, but I think vgacon is safe to use with drm_panic.
>
> The problem with fbcon, is that it can also uses the fbdev emulation=20
> from the drm driver, and in this case, drm_panic will write to the same=
=20
> framebuffer as fbcon during a panic, leading to corrupted output.
> This can't occur with other graphical console, so !(FRAMEBUFFER_CONSOLE=
=20
> && VT_CONSOLE) is probably good.
>

Yeah, I agre that !(FRAMEBUFFER_CONSOLE && VT_CONSOLE) as you have in your
patch is what makes sense. !VT_CONSOLE alone as I argued in my first email
isn't correct since as you pointed out, it shouldn't affect other consoles
besides fbcon.

So please feel free to also add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

