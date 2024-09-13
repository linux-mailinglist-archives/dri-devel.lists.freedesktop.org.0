Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9614C97791A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F93D10E084;
	Fri, 13 Sep 2024 07:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iYtVYiPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030AB10E084
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726211157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JUxInk0S7cxq8bV5NiblehkhBP73tYJxMaYlFtxjxPg=;
 b=iYtVYiPF9uMOm77EGJcIB5gEXPIi/PE6fLK99xfp+SIilWrvPxVSi8Hdx07z7uPD44QpWN
 6feAjg4Bb/FgBkrC2TIQeUFwc32YJUgTtkuYa7wv22lp0RaLD9eOefzo5X25fyPTcBNvKt
 fUrBCyBUbu08oJatwAOXkugNjzR5cK4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-Fp0xS2p7NKK65KDE8XfuPQ-1; Fri, 13 Sep 2024 03:05:54 -0400
X-MC-Unique: Fp0xS2p7NKK65KDE8XfuPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb2c5d634so4196915e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726211153; x=1726815953;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JUxInk0S7cxq8bV5NiblehkhBP73tYJxMaYlFtxjxPg=;
 b=RMfY/oiePzD5MRT82VtUFZA9Z2PFiaHbU7nMeLluhK2r4zqra5z5s3WQZAl/m1ftPF
 Pn0Bo4S/LwQgSTI+GjlLfn2q6RlAaARKJa4+r/5C5s9UrD3sS5OFqFEk4Bu0o4oV2XPH
 oOShY/tK/rXlkNKigMp7f7ucVSirvns7XauFvgi1n0NiIKKdunsIGDKQ1BvKVWUDH7tC
 D8GcjbvNSAn+Hiz8u50yWfsS/977FLHyZA2Tt2wVFXMvoVBzgI5HlHGDewt3GCyC2Fvb
 T/+neTFY7QEAZXviX1DuIEy/RjENIvOmc/4VkglhuBsdt1CHIDGrr0J8yxX5bPYdLhtW
 b0GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ91UWFlsrQk6TU7Bgx58pfDkSE3Lx5KNpWvlM/67vb+ErRYld3uUPUiP6KGQjnrv9QVVb+fhgF4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9NjmZDqlH/miKSgDZRztwv0WNPWnQnxIcEqDgfg4i1YephXeu
 7RXjpdcGapfmbfr1077UKRBNhQeGMDoggYMoQPIMmA6HVGK/rJF2dN4Jr0oVW3ckgnnWZZq5LOu
 08fkqM7GlPpR+F+009ulJCKmS4CwZgP2f08iGP5z32O6aVj0eWFko61P9wqojNoX1yw==
X-Received: by 2002:a05:600c:3490:b0:42c:cd88:d0f7 with SMTP id
 5b1f17b1804b1-42d9072211bmr12409565e9.10.1726211152895; 
 Fri, 13 Sep 2024 00:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7ixvDig6mKPxUj06bVVHzX7pqCmSzpaF/KDzUc+5ujBIqwcPkJ/QygFJDl0Ehw9m+hB1r+A==
X-Received: by 2002:a05:600c:3490:b0:42c:cd88:d0f7 with SMTP id
 5b1f17b1804b1-42d9072211bmr12409095e9.10.1726211152304; 
 Fri, 13 Sep 2024 00:05:52 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d37a1sm15945167f8f.77.2024.09.13.00.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:05:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Julius Werner
 <jwerner@chromium.org>
Cc: Brian Norris <briannorris@chromium.org>, Borislav Petkov <bp@alien8.de>,
 Hugues Bruant <hugues.bruant@gmail.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org, Fenghua Yu
 <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Tony
 Luck <tony.luck@intel.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [NOT A REGRESSION] firmware: framebuffer-coreboot: duplicate
 device name "simple-framebuffer.0"
In-Reply-To: <6bf656e0-e0b6-4b97-b7a2-ff0bdc86b098@suse.de>
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
 <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>
 <ZuCGkjoxKxpnhEh6@google.com>
 <87jzfhayul.fsf@minerva.mail-host-address-is-not-set>
 <CAODwPW8P+jcF0erUph5XyWoyQgLFbZWxEM6Ygi_LFCCTLmH89Q@mail.gmail.com>
 <87mskczv9l.fsf@minerva.mail-host-address-is-not-set>
 <6bf656e0-e0b6-4b97-b7a2-ff0bdc86b098@suse.de>
Date: Fri, 13 Sep 2024 09:05:50 +0200
Message-ID: <87jzfgyqwh.fsf@minerva.mail-host-address-is-not-set>
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

Hello Thomas,

> Hi Javier,
>
> thanks for the patch.
>

Thanks for your feedback.

> Am 12.09.24 um 18:33 schrieb Javier Martinez Canillas:
>> Julius Werner <jwerner@chromium.org> writes:

[...]

>> ---
>>   drivers/firmware/google/framebuffer-coreboot.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
>> index daadd71d8ddd..4e50da17cd7e 100644
>> --- a/drivers/firmware/google/framebuffer-coreboot.c
>> +++ b/drivers/firmware/google/framebuffer-coreboot.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/module.h>
>>   #include <linux/platform_data/simplefb.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/screen_info.h>
>>   
>>   #include "coreboot_table.h"
>>   
>> @@ -27,6 +28,7 @@ static int framebuffer_probe(struct coreboot_device *dev)
>>   	int i;
>>   	u32 length;
>>   	struct lb_framebuffer *fb = &dev->framebuffer;
>> +	struct screen_info *si = &screen_info;
>
> Probably 'const'.
>

Ok.

>>   	struct platform_device *pdev;
>>   	struct resource res;
>>   	struct simplefb_platform_data pdata = {
>> @@ -36,6 +38,20 @@ static int framebuffer_probe(struct coreboot_device *dev)
>>   		.format = NULL,
>>   	};
>>   
>> +	/*
>> +	 * If the global screen_info data has been filled, the Generic
>> +	 * System Framebuffers (sysfb) will already register a platform
>> +	 * and pass the screen_info as platform_data to a driver that
>> +	 * could scan-out using the system provided framebuffer.
>> +	 *
>> +	 * On Coreboot systems, the advertise LB_TAG_FRAMEBUFFER entry
>> +	 * in the Coreboot table should only be used if the payload did
>> +	 * not set video mode info and passed it to the Linux kernel.
>> +	 */
>> +	if (si->orig_video_isVGA == VIDEO_TYPE_VLFB ||
>> +            si->orig_video_isVGA == VIDEO_TYPE_EFI)
>
> Rather call screen_info_video_type(si) [1] to get the type. If it

Indeed. I missed that helper, I'll change it.

> returns 0, the screen_info is unset and the corebios code can handle the 
> framebuffer. In any other case, the framebuffer went through a 
> bootloader, which might have modified it. This also handles awkward 
> cases, such as if the bootloader programs a VGA text mode.
>
> [1] 
> https://elixir.bootlin.com/linux/v6.10.10/source/include/linux/screen_info.h#L92
>
> With these changes:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks. I'll wait for others in this thread to comment and if all agree
with the solution, I'll post a proper patch (addressing your comments).

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

