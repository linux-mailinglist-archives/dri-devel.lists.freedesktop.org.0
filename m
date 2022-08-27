Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600905A37AE
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 14:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D9A10EC8E;
	Sat, 27 Aug 2022 12:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C21E10EC8E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 12:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661604417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=inruV9tiW8qwXrnkVI+Ao+ITZBbbO5sFc1aw762dWrY=;
 b=da0ZpP84B948OI6WGi+WHFsOegSm52nV+3KC7gQr3qxelPAwPhc17VXIS+E4yMMv57Rf1N
 WF4CuseDc9/P3b4ETX3FcVgECrwymX7tAWd1MgF1BRhZQBR9nqUx85wG6d8Jlny5PkgJlt
 QdYneeLSY0KdAriv5/PNAaC1FR1zcbc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-yFV5lXp8PFCC9-4pIUW8Cg-1; Sat, 27 Aug 2022 08:46:49 -0400
X-MC-Unique: yFV5lXp8PFCC9-4pIUW8Cg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y20-20020a056402359400b00447a871c48fso2701527edc.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 05:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc;
 bh=inruV9tiW8qwXrnkVI+Ao+ITZBbbO5sFc1aw762dWrY=;
 b=KxuQj7Q4o07y3Et9i4hqngsEW17HRjhdTJEWXm9FzdH2hPhl/s6EOrNFUx0MRO0KXq
 HjW5TgWprDSpiCCk3KkgA2XrXOOOTT04MzQyXu7I4QBF1bZTlzx9SM+MUmWBX0GMhEGb
 sEqbClt1JhhPeSIVPpi1npD8kl6j7c0tiBjOZchDpsnSkQOKwc5aSnkw7F0nfud20Hg2
 oY46YHmSXzqULc/W66sRd7AigGU9f0gIO6XybhXTvJjo14SNoVKaVgcK+xbudQGiBcH3
 cuqdhul+5mBLUTQq1ZbMJ8vLj5ZfU0vDMd1PojkQipqOM6RcVbJ9dHZXmDf0AN2xQU2/
 iz0Q==
X-Gm-Message-State: ACgBeo030eypBfWh+aU+i8UY8+eEhAf5gNiPw4INUCtKINs2rdD3NDbQ
 wlXgwnak8ymcWgn8wlFHtwoCYF1G4FBa3II0oqDmuVj5DUI3tsozSZ7v+5KeYrWIX1e4eQRMm4L
 P9OA2qaoxSNv/5NKsLX5p7EsU0KXY
X-Received: by 2002:a17:907:6890:b0:73d:a567:568c with SMTP id
 qy16-20020a170907689000b0073da567568cmr8053183ejc.521.1661604408244; 
 Sat, 27 Aug 2022 05:46:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5TSxNxFhHIWUgDFGh6o2o5A2lHYsq2gKou43zUNTrXz2A2rDfHNazARFNTXYh+19y8woSsTQ==
X-Received: by 2002:a17:907:6890:b0:73d:a567:568c with SMTP id
 qy16-20020a170907689000b0073da567568cmr8053169ejc.521.1661604408027; 
 Sat, 27 Aug 2022 05:46:48 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 cb11-20020a0564020b6b00b0044841a78c70sm104257edb.93.2022.08.27.05.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 05:46:47 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] Drivers: hv: Never allocate anything besides
 framebuffer from framebuffer memory region
In-Reply-To: <SN6PR2101MB16935E50795FAE1FA352C416D7729@SN6PR2101MB1693.namprd21.prod.outlook.com>
References: <20220825090024.1007883-1-vkuznets@redhat.com>
 <20220825090024.1007883-4-vkuznets@redhat.com>
 <SN6PR2101MB16935E50795FAE1FA352C416D7729@SN6PR2101MB1693.namprd21.prod.outlook.com>
Date: Sat, 27 Aug 2022 14:46:46 +0200
Message-ID: <87k06tvop5.fsf@redhat.com>
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Deepak Rawat <drawat.floss@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Michael Kelley (LINUX)" <mikelley@microsoft.com> writes:

> From: Vitaly Kuznetsov <vkuznets@redhat.com> Sent: Thursday, August 25, 2022 2:00 AM
>> 
>> Passed through PCI device sometimes misbehave on Gen1 VMs when Hyper-V
>> DRM driver is also loaded. Looking at IOMEM assignment, we can see e.g.
>> 
>> $ cat /proc/iomem
>> ...
>> f8000000-fffbffff : PCI Bus 0000:00
>>   f8000000-fbffffff : 0000:00:08.0
>>     f8000000-f8001fff : bb8c4f33-2ba2-4808-9f7f-02f3b4da22fe
>> ...
>> fe0000000-fffffffff : PCI Bus 0000:00
>>   fe0000000-fe07fffff : bb8c4f33-2ba2-4808-9f7f-02f3b4da22fe
>>     fe0000000-fe07fffff : 2ba2:00:02.0
>>       fe0000000-fe07fffff : mlx4_core
>> 
>> the interesting part is the 'f8000000' region as it is actually the
>> VM's framebuffer:
>> 
>> $ lspci -v
>> ...
>> 0000:00:08.0 VGA compatible controller: Microsoft Corporation Hyper-V virtual VGA
>> (prog-if 00 [VGA controller])
>> 	Flags: bus master, fast devsel, latency 0, IRQ 11
>> 	Memory at f8000000 (32-bit, non-prefetchable) [size=64M]
>> ...
>> 
>>  hv_vmbus: registering driver hyperv_drm
>>  hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] Synthvid Version major 3, minor 5
>>  hyperv_drm 0000:00:08.0: vgaarb: deactivate vga console
>>  hyperv_drm 0000:00:08.0: BAR 0: can't reserve [mem 0xf8000000-0xfbffffff]
>>  hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] Cannot request framebuffer, boot fb still active?
>> 
>> Note: "Cannot request framebuffer" is not a fatal error in
>> hyperv_setup_gen1() as the code assumes there's some other framebuffer
>> device there but we actually have some other PCI device (mlx4 in this
>> case) config space there!
>
> My apologies for not getting around to commenting on the previous
> version of this patch.  The function hyperv_setup_gen1() and the
> "Cannot request framebuffer" message have gone away as of
> commit a0ab5abced55.
>

True, will fix!

>> 
>> The problem appears to be that vmbus_allocate_mmio() can allocate from
>> the reserved framebuffer region (fb_overlap_ok), however, if the
>> request to allocate MMIO comes from some other device before
>> framebuffer region is taken, it can happily use framebuffer region for
>> it. 
>
> Interesting. I had never looked at the details of vmbus_allocate_mmio().
> The semantics one might assume of a parameter named "fb_overlap_ok"
> aren't implemented because !fb_overlap_ok essentially has no effect.   The
> existing semantics are really "prefer_fb_overlap".  This patch implements
> the expected and needed semantics, which is to not allocate from the frame
> buffer space when !fb_overlap_ok.
>
> If that's an accurate high level summary, maybe this commit message
> could describe it that way?  The other details you provide about what can
> go wrong should still be included as well.

That's acually a very good summary! Let me update the commit message,
I'll be sending out v3 shortly.

>
>> Note, Gen2 VMs are usually unaffected by the issue because
>> framebuffer region is already taken by EFI fb (in case kernel supports
>> it) but Gen1 VMs may have this region unclaimed by the time Hyper-V PCI
>> pass-through driver tries allocating MMIO space if Hyper-V DRM/FB drivers
>> load after it. Devices can be brought up in any sequence so let's
>> resolve the issue by always ignoring 'fb_mmio' region for non-FB
>> requests, even if the region is unclaimed.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  drivers/hv/vmbus_drv.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
>> index 536f68e563c6..3c833ea60db6 100644
>> --- a/drivers/hv/vmbus_drv.c
>> +++ b/drivers/hv/vmbus_drv.c
>> @@ -2331,7 +2331,7 @@ int vmbus_allocate_mmio(struct resource **new, struct
>> hv_device *device_obj,
>>  			bool fb_overlap_ok)
>>  {
>>  	struct resource *iter, *shadow;
>> -	resource_size_t range_min, range_max, start;
>> +	resource_size_t range_min, range_max, start, end;
>>  	const char *dev_n = dev_name(&device_obj->device);
>>  	int retval;
>> 
>> @@ -2366,6 +2366,14 @@ int vmbus_allocate_mmio(struct resource **new, struct
>> hv_device *device_obj,
>>  		range_max = iter->end;
>>  		start = (range_min + align - 1) & ~(align - 1);
>>  		for (; start + size - 1 <= range_max; start += align) {
>> +			end = start + size - 1;
>> +
>> +			/* Skip the whole fb_mmio region if not fb_overlap_ok */
>> +			if (!fb_overlap_ok && fb_mmio &&
>> +			    (((start >= fb_mmio->start) && (start <= fb_mmio->end)) ||
>> +			     ((end >= fb_mmio->start) && (end <= fb_mmio->end))))
>> +				continue;
>> +
>>  			shadow = __request_region(iter, start, size, NULL,
>>  						  IORESOURCE_BUSY);
>>  			if (!shadow)
>> --
>> 2.37.1
>
> Other than my musings on the commit message,
>
> Reviewed-by: Michael Kelley <mikelley@microsoft.com>
>

Thanks!

-- 
Vitaly

