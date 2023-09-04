Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656F791A98
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 17:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7077A10E378;
	Mon,  4 Sep 2023 15:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584B010E0BE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693841191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3w9m5Kyek9McC6DIqWL/AU9aeKuaClRRwuI23BVEZVQ=;
 b=Xa8FHV6bm0p1zaUL9qk1FEHxbPPpBViCfftbLqkgTiyON9g3C1UobNHZj1rJgIXOEKf2rO
 qEsqSWUfzlkVc7MCBBajc92yiZfQLl51zNbYpA/Zx8wtntRAdbgBvMmhxwBlBlrY4oq11q
 8/K28Hb/eDlGTwmz+EnEATCfUlLPETA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-qX4RsfUROcGKaxIbX4bpuw-1; Mon, 04 Sep 2023 11:26:28 -0400
X-MC-Unique: qX4RsfUROcGKaxIbX4bpuw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-402c46c4a04so10186235e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 08:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693841187; x=1694445987;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3w9m5Kyek9McC6DIqWL/AU9aeKuaClRRwuI23BVEZVQ=;
 b=dmBhWvobvVSyzpcq9WQEZ7tmtjGkqWAnEOkpFRoZzwFO2E8QmyrieChOiKny4m/u2g
 aQ52iedbF1tB1/pwv89gmoL+2FKRWdGVqIZmvqiodvRJgT1e5gX882FuDzgGdPE5ZN2V
 uAXYhu/dsQIOonGZJKIaNGnstxfqGRTWuPZ5yL9dm6E89WVzRVWrla97lKdgYhGXUTRK
 PJLExuF+WVXSMmrM/39fgXFSHSbTDszUAuhdVLO9j/zETcU2olwoZLU3mlaahofHcmwS
 ukODMvfOJkHtoS6mvugy7EYTiNitcl0vtgo0zW4BEpckVJ9/c+k1MbTjjjsBB1dCXkCS
 LUjQ==
X-Gm-Message-State: AOJu0Yw55wFgiBqEYPe+RSgRdTsqghFrd6q0xDKYZoSv9E+9waveoUpR
 +B2KOnwq0KusuF3gedwPOiwtoFf49wvEjT47oB2gEiwC9WMCyPhoicIWOMGJ4ZsXvZmOLeE0nVS
 5yUDmuUSaHQl2OlTMfH8sqp2uxJOA
X-Received: by 2002:a05:600c:230a:b0:401:aa8f:7566 with SMTP id
 10-20020a05600c230a00b00401aa8f7566mr7184364wmo.26.1693841187210; 
 Mon, 04 Sep 2023 08:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/QgrG9ZZeCMMajoiNwd74ytk48aIpSmfM9Lf3C5BkHGpRWOhGbvtZxEvbd/m0qpvgeZC8gA==
X-Received: by 2002:a05:600c:230a:b0:401:aa8f:7566 with SMTP id
 10-20020a05600c230a00b00401aa8f7566mr7184357wmo.26.1693841186846; 
 Mon, 04 Sep 2023 08:26:26 -0700 (PDT)
Received: from localhost (156.pool92-189-221.dynamic.orange.es.
 [92.189.221.156]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d68cf000000b0031416362e23sm14937968wrw.3.2023.09.04.08.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 08:26:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
In-Reply-To: <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-2-tzimmermann@suse.de>
 <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
 <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>
Date: Mon, 04 Sep 2023 17:26:25 +0200
Message-ID: <871qfe6jtq.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier
>
> Am 04.09.23 um 14:59 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>> Hello Thomas,
>> 
>>> Generate callback functions for struct fb_ops with the fbdev macro
>>> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
>>> the generated functions with fbdev initializer macros.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Steve Glendinning <steve.glendinning@shawell.net>
>>> ---
>> 
>> The patch looks good to me, but I've a question below.
>> 
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>>>   drivers/video/fbdev/smscufx.c | 85 +++++++++--------------------------
>>>   1 file changed, 22 insertions(+), 63 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
>> 
>> [...]
>> 
>>>   static const struct fb_ops ufx_ops = {
>>>   	.owner = THIS_MODULE,
>>> -	.fb_read = fb_sys_read,
>>> -	.fb_write = ufx_ops_write,
>>> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(ufx_ops),
>>>   	.fb_setcolreg = ufx_ops_setcolreg,
>>> -	.fb_fillrect = ufx_ops_fillrect,
>>> -	.fb_copyarea = ufx_ops_copyarea,
>>> -	.fb_imageblit = ufx_ops_imageblit,
>>> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(ufx_ops),
>>>   	.fb_mmap = ufx_ops_mmap,
>> 
>> There are no generated functions for .fb_mmap, I wonder what's the value
>> of __FB_DEFAULT_DEFERRED_OPS_MMAP() ? Maybe just removing that macro and
>> setting .fb_mmap = fb_deferred_io_mmap instead if there's no custom mmap
>> handler would be easier to read ?
>
> At least two drivers could use __FB_DEFAULT_DEFERRED_OPS_MMAP: 
> picolcd-fb and hyperv_fb. At some point, we might want to set/clear 
> fb_mmap depending on some Kconfig value. Having 
> __FB_DEFAULT_DEFERRED_OPS_MMAP might be helpful then.
>

Got it, thanks for the explanation.

>> 
>> Alternatively, __FB_DEFAULT_DEFERRED_OPS_MMAP() could still be left but
>> not taking a __prefix argument since that is not used anyways ?
>
> The driver optionally provides mmap without deferred I/O, hence the mmap 
> function. That makes no sense, as these writes to the buffer would never 
> make it to the device memory. But I didn't want to remove the code 
> either. So I just left the existing function as-is. Usually, the 
> deferred-I/O mmap is called immediately. [1]
>

Makes sense.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

