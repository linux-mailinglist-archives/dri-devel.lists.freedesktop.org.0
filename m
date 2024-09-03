Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E1969B66
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84D610E491;
	Tue,  3 Sep 2024 11:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ejoP8Bsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CC010E48E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lu/6aZPR74FxU7wZQSrTIGkEEK1/dFpwVam92HFQefM=;
 b=ejoP8BsuD/NABxqgkDBohW4/+Zs5iYFmFNiEGZs6i3dSZJgqzzWyaWaRijyvfRitClSPNj
 fQz/DqGgfV4Oct46D9SyX2m2XfhEclKLcLkRr85DKTq83XVL/u6QdLz7YDgNOw6QYWgHuy
 HVn4dkU9TezH+6B+LTweFCU9T0neCs8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-wuduj1HoPZyBLaVcJ0c47A-1; Tue, 03 Sep 2024 07:18:26 -0400
X-MC-Unique: wuduj1HoPZyBLaVcJ0c47A-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374b981dd62so2094308f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362305; x=1725967105;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JYln+Dk1CxPuIFT9nQAYkDdbOtHtYjWzqkI/DFHLmL8=;
 b=CzQLerbyZJmKsCg1qx0KA5piPszL0mSeh/yLS//ngPTikGCkgShx9C+nh+Hd9fT0jd
 og0OpYAHfko9b5LGnPJKnPXdF7wt1VHJL8NrYL4TW/9Vb/kNg6DL5Y7H/c/F3yLuTLpi
 6rTODBXWPvURMs9U0NLIhJE4spRepqcfiqNqPwYm6Jdsvl9azPRUcLhNALOkt1Wn8jTi
 uBBBG9kdhWdAPjMVcBb8wuaNpciEyDjn4SlEZQA9P6wjR52WJYhfJKqflkJfKTqCBdZN
 ZLCAc8fgkPE/VTci9rvGgeJuQVF0fV3NXQhXitybNnq6B/sNQMiFw0gAEbFeFj0hCfuU
 A3NQ==
X-Gm-Message-State: AOJu0YwWkXyp4Uuw6MDbsrCqWELCc3thSgXZft0fzXEiagE7GfxqHH3g
 WNeFeSbSTR4GS+6zp2eMGSbYVSy1nzAdWbJ3UB2h/R3smWcISGI/4Ysz+e+2UQ+U7INNf8Mwe6e
 aAFPBe3rMhySsC/bzfNiRP0S47evQMDVLNZrOr8U6i5gCrvF6+c0ow+mYDOpDJjkRuUy01t+2DQ
 ==
X-Received: by 2002:a5d:55ca:0:b0:371:a60e:a821 with SMTP id
 ffacd0b85a97d-374bcfe5e16mr6207449f8f.38.1725362305030; 
 Tue, 03 Sep 2024 04:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd1nPuEohgtSEIEfR2z/0XsQdMeEva2V8nu8Gqav90r1D8COSicdJj0mvJBGAc+tsxWuuh4A==
X-Received: by 2002:a5d:55ca:0:b0:371:a60e:a821 with SMTP id
 ffacd0b85a97d-374bcfe5e16mr6207428f8f.38.1725362304537; 
 Tue, 03 Sep 2024 04:18:24 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c07eed5dsm8769520f8f.116.2024.09.03.04.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:18:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 02/81] drm/fbdev-helper: Set and clear VGA switcheroo
 client from fb_info
In-Reply-To: <82eb3305-4643-40df-aae6-2b57c3eb2c4b@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-3-tzimmermann@suse.de>
 <87mskpghvm.fsf@minerva.mail-host-address-is-not-set>
 <82eb3305-4643-40df-aae6-2b57c3eb2c4b@suse.de>
Date: Tue, 03 Sep 2024 13:18:23 +0200
Message-ID: <875xrdgf40.fsf@minerva.mail-host-address-is-not-set>
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier
>
> Am 03.09.24 um 12:18 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas,
>>
>>> Call vga_switcheroo_client_fb_set() with the PCI device from the
>>> instance of struct fb_info. All fbdev clients now run these calls.
>>> For non-PCI devices or drivers without vga-switcheroo, this does
>>> nothing. For i915 and radeon, it allows these drivers to use a
>>> common fbdev client.
>>>
>>> The device is the same as the one stored in struct drm_client and
>>> struct drm_fb_helper, so there is no difference in behavior. Some
>>> NULL-pointer checks are being removed, where those pointers cannot
>>> be NULL.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/drm_fb_helper.c | 15 +++++++++++----
>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
>>> index af1fe79c701d..13095d38aa42 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -562,8 +562,12 @@ EXPORT_SYMBOL(drm_fb_helper_release_info);
>>>    */
>>>   void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
>>>   {
>>> -=09if (fb_helper && fb_helper->info)
>>> -=09=09unregister_framebuffer(fb_helper->info);
>> I'm not sure if we can assume these won't be NULL... AFAICT some drivers
>> still have their own struct drm_client_funcs vtable and could potentiall=
y
>> pass a NULL struct drm_fb_helper ?
>
> I did a
>
>  =C2=A0 git grep -B4 drm_fb_helper_unregister_info
>
> on drm-tip and all callers, such as [1], test fb_helper->info before=20
> calling the function. So it's safe to remove the test.
>

Yes, I also noticed that all callers were already checking if is not NULL
but still is more robust for the function to check it in case there is a
bug in a driver.

But as a said, I'm OK with dropping it as long as it is mentioned in the
kernel-doc that the parameter must not be NULL.

> [1]=20
> https://elixir.bootlin.com/linux/v6.10/source/drivers/gpu/drm/drm_fbdev_d=
ma.c#L162
>
>>
>> If you think that's safe to do this and the function semantics should be
>> changed, then I think that the kernel-doc needs to be updated:
>>
>> - * @fb_helper: driver-allocated fbdev helper, can be NULL
>> + * @fb_helper: driver-allocated fbdev helper, must not be NULL
>
> Ok.
>
>>
>> Other than that, the patch looks good to me:
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thanks.
>
> Best regards
> Thomas
>
>>
>
> --=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

