Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C134A6D7B8F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC0410E8F4;
	Wed,  5 Apr 2023 11:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF6210E8F5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680694857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FMtfoXjFIQVrdCvOYQIUXDgwaN1CMspVz9VQYCn9+jg=;
 b=a5mTOogrOG01oqhA9XIsdrx7nwivuH3a9UIsiGdCVERDTKDYEBb6h9bSejSLiPKC84Yl3B
 zZiFphlBu7u3AGm2rm2Hn89iUFLA8vsvhtGwmG3X8aOMLJpqWItDhrC5iEyYdeSfK6G7RW
 WoD1ndmVRmlyG062bY4wVPfb0+mgYlo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-tyi7e6tdOdW9jDD_XT1dlw-1; Wed, 05 Apr 2023 07:40:56 -0400
X-MC-Unique: tyi7e6tdOdW9jDD_XT1dlw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z20-20020a05600c0a1400b003edcff41678so1097764wmp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680694853;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FMtfoXjFIQVrdCvOYQIUXDgwaN1CMspVz9VQYCn9+jg=;
 b=NYVUHFY3X557fm7WM91wHbqCqaUHG3eDH5U9/dOIqniWxHtkp+noHS/xy5iC/5fy5Z
 FuMCLTWdVCmDDYtEq4xUqpR3lyi+ty9AxNSZuVCCBH2GDGbqQnL3i+EkfCZO28AK+k5X
 dqrVG/5iqlbvwBkEebY+lN77LWCIUz2P8wA/pw4qw8iEqUqgDcYh3od7PaXxmfAst7zb
 ZT8Nv4URXMS2kJHeksa7nSn6TzFj0mKqJwcidWyWmK+Y8LtRoX0pV2KNIcqo7VJGmcxx
 q1m/YzeS2Bwt+WCLb7JKTqFGMMggQr9M/pxRRpkHxvEuiZEg5Clg7cckFYExcLVTI30e
 aZJw==
X-Gm-Message-State: AAQBX9eUtb3BtJe3HhVhwmvFW5vrMhKlYKoAwdHzfFZTjIVtIaLI06Hp
 ilb44Jv/n1x1pN5odqwydWuNwtlS5Qcl8DDhhFOAHmtBjKZ9zznzkjUjZAUapZBqbNZwfg4WjfP
 kExRHFbW4tVeolno7nYC8SLTo6Uc+
X-Received: by 2002:a5d:5145:0:b0:2d4:e666:cab4 with SMTP id
 u5-20020a5d5145000000b002d4e666cab4mr3875077wrt.30.1680694853766; 
 Wed, 05 Apr 2023 04:40:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350YRI/C35exI7PaTkklaXJEKQwXJQOY29/Mn3ZPywaIUFNmaLxIzI36isEe9GLJeCe7pAxVLeA==
X-Received: by 2002:a5d:5145:0:b0:2d4:e666:cab4 with SMTP id
 u5-20020a5d5145000000b002d4e666cab4mr3875063wrt.30.1680694853484; 
 Wed, 05 Apr 2023 04:40:53 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g22-20020a7bc4d6000000b003ed1f111fdesm1916150wmk.20.2023.04.05.04.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:40:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] fbdev: Simplify fb_is_primary_device for x86
In-Reply-To: <20230404201842.567344-8-daniel.vetter@ffwll.ch>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <20230404201842.567344-8-daniel.vetter@ffwll.ch>
Date: Wed, 05 Apr 2023 13:40:47 +0200
Message-ID: <87mt3mblq8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: x86@kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> vga_default_device really is supposed to cover all corners, at least
> for x86. Additionally checking for rom shadowing should be redundant,
> because the bios/fw only does that for the boot vga device.
>
> If this turns out to be wrong, then most likely that's a special case
> which should be added to the vgaarb code, not replicated all over.
>
> Patch motived by changes to the aperture helpers, which also have this
> open code in a bunch of places, and which are all removed in a
> clean-up series. This function here is just for selecting the default
> fbdev device for fbcon, but I figured for consistency it might be good
> to throw this patch in on top.
>
> Note that the shadow rom check predates vgaarb, which was only wired
> up in 88674088d10c ("x86: Use vga_default_device() when determining
> whether an fb is primary"). That patch doesn't explain why we still
> fall back to the shadow rom check.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> ---
>  arch/x86/video/fbdev.c | 13 +------------

[...]

> +	if (pci_dev == vga_default_device())
>  		return 1;
>  	return 0;

or just return pci_dev == vga_default_device() ;

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

