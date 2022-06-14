Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330A54B25F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 15:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F9E1120FC;
	Tue, 14 Jun 2022 13:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB17011210C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:36:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 535161650;
 Tue, 14 Jun 2022 06:36:48 -0700 (PDT)
Received: from [10.57.82.209] (unknown [10.57.82.209])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8703F73B;
 Tue, 14 Jun 2022 06:36:47 -0700 (PDT)
Message-ID: <f97d32f4-8391-cfdb-d1c7-2043634db83b@arm.com>
Date: Tue, 14 Jun 2022 14:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
Content-Language: en-GB
To: Javier Martinez Canillas <javierm@redhat.com>, liviu.dudau@arm.com
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
 <e0468244-f1bc-e593-0840-252a92a900dd@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <e0468244-f1bc-e593-0840-252a92a900dd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-14 14:26, Javier Martinez Canillas wrote:
> Hello Robin,
> 
> On 6/14/22 15:04, Robin Murphy wrote:
>> The Arm Juno board EDK2 port has provided an EFI GOP display via HDLCD0
>> for some time now, which works nicely as an early framebuffer. However,
>> once the HDLCD driver probes and takes over the hardware, it should
>> take over the logical framebuffer as well, otherwise the now-defunct GOP
>> device hangs about and virtual console output inevitably disappears into
>> the wrong place most of the time.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/gpu/drm/arm/hdlcd_drv.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
>> index af59077a5481..a5d04884658b 100644
>> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
>> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
>> @@ -331,6 +331,8 @@ static int hdlcd_drm_bind(struct device *dev)
>>   		goto err_vblank;
>>   	}
>>   
>> +	drm_fb_helper_remove_conflicting_framebuffers(NULL, "hdlcd", false);
>> +
> 
> Seems you are using an older base, since this function doesn't exist anymore
> after commit 603dc7ed917f ("drm/aperture: Inline fbdev conflict helpers into
> aperture helpers").

Ah, you got me! I'm having to work with a 5.10 kernel at the moment, but 
the randomly-disappearing console had finally sufficiently annoyed me 
into figuring out and fixing it.

> Instead, you should use the drm_aperture_remove_framebuffers() function, i.e:
> 
>   +	drm_aperture_remove_framebuffers(false, &hdlcd_driver);
> 
> If you do that and re-spin the patch, feel free to add:
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for the advice and review - I'll send a v2 later once I've had 
time to build and boot test 5.19-rc.

Cheers,
Robin.
