Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDC978719
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 19:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323CB10ED61;
	Fri, 13 Sep 2024 17:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Z4X/RjV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788F510ED5E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 17:47:58 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-206aee4073cso26628355ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 10:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726249678; x=1726854478;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8IH/fKZ7WlUWd6MAHGKHHDTF08xKH8CLIu/uq2juW/g=;
 b=Z4X/RjV1X2fDp5lNKIDBE9glDI4LQqiAPsS5MurSLXcvjX5s6LJW/6wpUqzQw0emT1
 zHBY8ku/2U59yLgX3KdAo9UMJZQJWwxnqPzJe4Iy0PBBOaPAS8YbtL4EU4m9jC99kl8s
 CxcdWN1+C1+JjbYiNYQ3o38hspMmoD17YKnnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726249678; x=1726854478;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8IH/fKZ7WlUWd6MAHGKHHDTF08xKH8CLIu/uq2juW/g=;
 b=w/dqE+HH8LBKEZKgeAOpPSnLuD49RGCGu9cYt/FE4pM+L8IKW5roVabG/897nCsmXW
 ckXNbGF7vMs+/Y770j4HXiBYcwwTGwEjOqYjHSGDsYy8J0YiMhR6vfUOa1nhAwlNqABu
 fT0vRkyjY9fdFRVQEMYC0sGTjoJvDhytmWLMo0UpSsrL9Lv4N101vrmxjCFrH1+ygYcB
 RWukIUQ/TL02NPLxj3V5NZREeGqyYM0/IREfNG/5XuQtdLuIk8wBABHGEzRBKfoex98U
 94XIl5MMkXUDoyLi8y1OWraKusryqqw6+6tsoSn2cpwMK3oukrNvkU49xhr3DjlLZ5BV
 +jDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJchZlnmp6K+2XAs3XLKRIyzHAsBBFOP1Z4ZAlY7UYnp/aBQ4nGbQeaa7nBHDl1EpFNdWwCUoMoXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqUjGSqybSROBnWsqk6IOeg1GLu1Ot9irGk7yfaEbhJVaT4AUM
 WrjCTp4YjEsRAbW9pjuzyPiwm1e7tR2kedYpnX3uko7O6uJJlq04mwoBSLrOOA==
X-Google-Smtp-Source: AGHT+IF/Z83uZ5DKsWYI6BIBnszLvyBcxjjxnEpt4x8DvN82ruG8ZaQekEMAasgPQ7k4gkSjUIiGcg==
X-Received: by 2002:a17:902:c946:b0:207:850c:2548 with SMTP id
 d9443c01a7336-207850c26e1mr44249585ad.22.1726249677812; 
 Fri, 13 Sep 2024 10:47:57 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:8bb7:9bdd:6697:b2f7])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2076b01a742sm30385035ad.259.2024.09.13.10.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 10:47:57 -0700 (PDT)
Date: Fri, 13 Sep 2024 10:47:54 -0700
From: Brian Norris <briannorris@chromium.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Julius Werner <jwerner@chromium.org>, Borislav Petkov <bp@alien8.de>,
 Hugues Bruant <hugues.bruant@gmail.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Tony Luck <tony.luck@intel.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [NOT A REGRESSION] firmware: framebuffer-coreboot: duplicate
 device name "simple-framebuffer.0"
Message-ID: <ZuR6yvqpCiV4Cjqf@google.com>
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
 <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>
 <ZuCGkjoxKxpnhEh6@google.com>
 <87jzfhayul.fsf@minerva.mail-host-address-is-not-set>
 <CAODwPW8P+jcF0erUph5XyWoyQgLFbZWxEM6Ygi_LFCCTLmH89Q@mail.gmail.com>
 <87mskczv9l.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mskczv9l.fsf@minerva.mail-host-address-is-not-set>
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

Hi Javier,

On Thu, Sep 12, 2024 at 06:33:58PM +0200, Javier Martinez Canillas wrote:
> That's a very good point. I'm actually not familiar with Coreboot and I
> used an educated guess (in the case of DT for example, that's the main
> source of truth and I didn't know if a Core table was in a similar vein).
> 
> Maybe something like the following (untested) patch then?

Julius is more familiar with the Coreboot + payload ecosystem than me,
but his explanations make sense to me, as does this patch.

> From de1c32017006f4671d91b695f4d6b4e99c073ab2 Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <javierm@redhat.com>
> Date: Thu, 12 Sep 2024 18:31:55 +0200
> Subject: [PATCH] firmware: coreboot: Don't register a pdev if screen_info data
>  is available
> 
> On Coreboot platforms, a system framebuffer may be provided to the Linux
> kernel by filling a LB_TAG_FRAMEBUFFER entry in the Coreboot table. But
> a Coreboot payload (e.g: SeaBIOS) could also provide this information to
> the Linux kernel.
> 
> If that the case, early arch x86 boot code will fill the global struct
> screen_info data and that data used by the Generic System Framebuffers
> (sysfb) framework to add a platform device with platform data about the
> system framebuffer.

Normally, these sorts of "early" and "later" ordering descriptions would
set alarm bells when talking about independent drivers. But I suppose
the "early arch" code has better ordering guaranteeds than drivers, so
this should be fine.

> But later then the framebuffer_coreboot driver will try to do the same
> framebuffer (using the information from the Coreboot table), which will
> lead to an error due a simple-framebuffer.0 device already registered:
> 
>     sysfs: cannot create duplicate filename '/bus/platform/devices/simple-framebuffer.0'
>     ...
>     coreboot: could not register framebuffer
>     framebuffer coreboot8: probe with driver framebuffer failed with error -17
> 
> To prevent the issue, make the framebuffer_core driver to not register a
> platform device if the global struct screen_info data has been filled.
> 
> Reported-by: Brian Norris <briannorris@chromium.org>
> Link: https://lore.kernel.org/all/ZuCG-DggNThuF4pj@b20ea791c01f/T/#ma7fb65acbc1a56042258adac910992bb225a20d2
> Suggested-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/firmware/google/framebuffer-coreboot.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
> index daadd71d8ddd..4e50da17cd7e 100644
> --- a/drivers/firmware/google/framebuffer-coreboot.c
> +++ b/drivers/firmware/google/framebuffer-coreboot.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
> +#include <linux/screen_info.h>
>  
>  #include "coreboot_table.h"
>  
> @@ -27,6 +28,7 @@ static int framebuffer_probe(struct coreboot_device *dev)
>  	int i;
>  	u32 length;
>  	struct lb_framebuffer *fb = &dev->framebuffer;
> +	struct screen_info *si = &screen_info;
>  	struct platform_device *pdev;
>  	struct resource res;
>  	struct simplefb_platform_data pdata = {
> @@ -36,6 +38,20 @@ static int framebuffer_probe(struct coreboot_device *dev)
>  		.format = NULL,
>  	};
>  
> +	/*
> +	 * If the global screen_info data has been filled, the Generic
> +	 * System Framebuffers (sysfb) will already register a platform

Did you mean 'platform_device'?

> +	 * and pass the screen_info as platform_data to a driver that
> +	 * could scan-out using the system provided framebuffer.
> +	 *
> +	 * On Coreboot systems, the advertise LB_TAG_FRAMEBUFFER entry

s/advertise/advertised/ ?

> +	 * in the Coreboot table should only be used if the payload did
> +	 * not set video mode info and passed it to the Linux kernel.

s/passed/pass/

> +	 */
> +	if (si->orig_video_isVGA == VIDEO_TYPE_VLFB ||
> +            si->orig_video_isVGA == VIDEO_TYPE_EFI)

This line is using spaces for indentation. It should use a tab, and then
spaces for alignment. But presumably this will change based on Thomas's
suggestions anyway.

> +		return -EINVAL;

Is EINVAL right? IIUC, that will print a noisier error to the logs. I
believe the "expected" sorts of return codes are ENODEV or ENXIO. (See
call_driver_probe().) ENODEV seems like a fine choice, similar to
several of the other return codes already used here.

Anyway, this seems along the right track. Thanks for tackling, and feel
free to carry a:

Reviewed-by: Brian Norris <briannorris@chromium.org>

> +
>  	if (!fb->physical_address)
>  		return -ENODEV;
>  
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 
