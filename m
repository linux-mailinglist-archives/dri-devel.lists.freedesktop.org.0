Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A048A6AD1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B6510E4C3;
	Tue, 16 Apr 2024 12:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cVlJIpo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B0010E4C3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713270185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tEDYzTJZLPP5KChkZiTTbiufy8jdzN3WLrTioTKBrxM=;
 b=cVlJIpo978XRs0VmraPq8ZYDvpQ+ICQ5VL17SfGoRfYO2Wm3HtKWfov8FxNeuupko5GPrX
 JavoxiAiTLGLmplUiO7kS18HQ8XDFHztfW6HyLKYxvLMG9olVcoiAzjH7EAtvCg/nkEsIN
 bqbzaAzpAU9Up56A9Lj+OmtdhowmtcE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-LYIGXUdkNSO33ZJbM-Bl8A-1; Tue, 16 Apr 2024 08:23:04 -0400
X-MC-Unique: LYIGXUdkNSO33ZJbM-Bl8A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-34954c03af1so283956f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713270183; x=1713874983;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tEDYzTJZLPP5KChkZiTTbiufy8jdzN3WLrTioTKBrxM=;
 b=FcSn9i4sijCZ+x3Ct9Dunkq/dtvGGTpo2Fy/Fb+R5ZERzqFv8Mz3NLpZA4yWPWRa/o
 1PufuSUF99H581dgNjjMTEAT8SyyUXRh0bVW7Znrvi/yk6pRxDLayo3rDZjKUGg39Gs5
 fu5vwsI+mKVUA5gD3mj4Y31rk/E4A5qFQCfKJpijmVOQRGOXZMceI7JT422KTo2D/ERx
 rwn/znDQKwvfIMXobFHLd1F9d2tf0i6ewaZJ+TBLZHPOcX6bZJBGM9xZfQAEyZg0a+Sj
 Jxey0slzPr2gC1B57UBaLECe8HSwiekhHcx4NGfpjt3C2w4X4ZVlNIz8WtXNQrSBLFPr
 IBJw==
X-Gm-Message-State: AOJu0Yw0656PkYuOKiWb3i05WrtzmAeN8hdHT/sVNRX2gzCZxvzYYDYx
 oeNLLZIV42lpMEp6k5YIMHonI+fNgf8V29ddJcuP/ryBWEWGc/HudY6nnLZnC6o/IjtFKcyCT/Z
 HjfSZLwFktR1xkHpAOuZytSyQQpWso9cUcjf1oaxyaY3mCjazDmiEyXP7xbmtRuZpyg==
X-Received: by 2002:a5d:4842:0:b0:346:407a:a2d7 with SMTP id
 n2-20020a5d4842000000b00346407aa2d7mr8119511wrs.71.1713270183321; 
 Tue, 16 Apr 2024 05:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQETyZGkr3zNvPiiskHfwVE8JtadFYNoQLFHO5x2CPEx0WHJkHTgGo6tl9Ypq1n5XapvvE+g==
X-Received: by 2002:a5d:4842:0:b0:346:407a:a2d7 with SMTP id
 n2-20020a5d4842000000b00346407aa2d7mr8119495wrs.71.1713270182944; 
 Tue, 16 Apr 2024 05:23:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i4-20020a5d6304000000b003437ad152f9sm14755120wru.105.2024.04.16.05.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:23:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 08/43] drm/fbdev: Add fbdev-shmem
In-Reply-To: <6cdccec9-e1a1-477b-a41a-4fb9d94d3238@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-9-tzimmermann@suse.de>
 <87r0f54kir.fsf@minerva.mail-host-address-is-not-set>
 <6cdccec9-e1a1-477b-a41a-4fb9d94d3238@suse.de>
Date: Tue, 16 Apr 2024 14:23:00 +0200
Message-ID: <87y19d5wez.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>>
>> I guess is OK because is_vmalloc_addr() is always true for this case ?
>
> It's not a vmalloc'ed address, but see patch 7. Fbdev-shmem uses a new 
> get_page callback in fb_defio. It provides the necessary page directly 
> to fb_defio.
>

Thanks! That was the missing piece of the puzzle.  I didn't look at that
patch because I noticed that already had a r-b. It makes more sense now :)

>
>>
>> This also made me think why info->fix.smem_len is really needed. Can't we
>> make the fbdev core to only look at that if info->screen_size is not set ?
>
> The fbdev core doesn't use smem_len AFAICT. But smem_len is part of the 
> fbdev UAPI, so I set it. I assume that programs use it to go to the end 
> of the framebuffer memory.
>

I see. Makes sense.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

