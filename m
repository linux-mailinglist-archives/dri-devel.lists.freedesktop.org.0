Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E454BC7F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC0F112EC3;
	Tue, 14 Jun 2022 21:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9FA7112EC6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 21:06:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E52C1152B;
 Tue, 14 Jun 2022 14:06:21 -0700 (PDT)
Received: from [10.57.82.209] (unknown [10.57.82.209])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02BCC3F66F;
 Tue, 14 Jun 2022 14:06:20 -0700 (PDT)
Message-ID: <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>
Date: Tue, 14 Jun 2022 22:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, liviu.dudau@arm.com
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
 <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-14 14:48, Thomas Zimmermann wrote:
> Hi
> 
> Am 14.06.22 um 15:04 schrieb Robin Murphy:
>> The Arm Juno board EDK2 port has provided an EFI GOP display via HDLCD0
>> for some time now, which works nicely as an early framebuffer. However,
>> once the HDLCD driver probes and takes over the hardware, it should
>> take over the logical framebuffer as well, otherwise the now-defunct GOP
>> device hangs about and virtual console output inevitably disappears into
>> the wrong place most of the time.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/gpu/drm/arm/hdlcd_drv.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c 
>> b/drivers/gpu/drm/arm/hdlcd_drv.c
>> index af59077a5481..a5d04884658b 100644
>> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
>> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
>> @@ -331,6 +331,8 @@ static int hdlcd_drm_bind(struct device *dev)
>>           goto err_vblank;
>>       }
>> +    drm_fb_helper_remove_conflicting_framebuffers(NULL, "hdlcd", false);
>> +
> 
> In addition to what Javier said, it appears to be too late to call this 
> function. If anything her etouches hardware, you might accidentally 
> interfere with the EFI-related driver. Rather call it at the top of 
> ldlcd_drm_bind().

OK, thanks for the info. I mostly just copied the pattern from the 
simplest-looking other users (sun4i, tegra, vc4) who all seemed to call 
it fairly late, and indeed naively it seemed logical not to do it *too* 
early when there's more chance we might fail to bind and leave the user 
with no framebuffer at all. In particular, waiting until we've bound the 
HDMI encoder seems like a good idea in the case of the Juno board (which 
is the only real HDLCD user), as the I2C bus often gets stuck if the 
System Control Processor is having a bad day. I also don't believe 
there's anything here that would affect efifb more than the fact that 
once the DRM CRTC is alive we simply stop scanning out from the region 
of memory that efifb is managing, but if it's considered good practice 
to do this early then I can certainly make that change too.

Cheers,
Robin.
