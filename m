Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1847F6BAEFE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 12:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94FE10E9B5;
	Wed, 15 Mar 2023 11:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E40210E9B5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 11:15:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6047A2F4;
 Wed, 15 Mar 2023 04:16:13 -0700 (PDT)
Received: from [10.57.53.168] (unknown [10.57.53.168])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87F663F67D;
 Wed, 15 Mar 2023 04:15:28 -0700 (PDT)
Message-ID: <c6d8c8b1-4c99-2816-62df-9398bbd707c6@arm.com>
Date: Wed, 15 Mar 2023 11:15:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/komeda: Take over EFI framebuffer properly
Content-Language: en-GB
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20230313102209.53966-1-patrik.berglund@arm.com>
 <a69442bd-a60a-9eb9-78ba-a3ea9b80c8a2@arm.com>
 <ZBGntBVkeVnzEG5W@e110455-lin.cambridge.arm.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <ZBGntBVkeVnzEG5W@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: patrik.berglund@arm.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/03/2023 11:10, Liviu Dudau wrote:
> On Wed, Mar 15, 2023 at 09:34:37AM +0000, Steven Price wrote:
>> On 13/03/2023 10:22, patrik.berglund@arm.com wrote:
>>> From: Patrik Berglund <patrik.berglund@arm.com>
>>>
>>> The Arm Morello board EDK2 port already provides an EFI GOP display for
>>> Ceti/Cetus (Komeda) with more boards incoming.
>>> However, once the Komeda driver probes and takes over the hardware,
>>> it should take over the logical framebuffer as well, otherwise,
>>> the now-defunct GOP device hangs around and virtual console output
>>> inevitably disappears into the wrong place most of the time.
>>>
>>> We'll do this right before doing the SRST because that is the point
>>> when the GOP will stop working.
>>> The GOP might also fail because the encoder driver do things but this
>>> is better than nothing.
>>>
>>> Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
>>
>> +CC the maintainers.
>>
>> Looks right to me, hdlcd has something very similar.
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Hi Steven,
> 
> Patrik contacted me privately and made me aware of the patch. I had a discussion
> with him about the layering violation (d71 knowing about kms) and we came to the
> conclusion that an additional patch is needed to re-order some code before this
> one can go in. Patrik and/or I need to revive a test environment to check that
> patch.

Ah right, fair enough. Patrik pinged me privately too to look at this
and so I did a brief review and this looks like it solves a real issue.
But I agree if this can be solved without d71 knowing about kms that
would be much better. It's good to know the conversation is happening!

Thanks,

Steve

> Best regards,
> Liviu
> 
>>
>>> ---
>>>  drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c | 12 ++++++++++++
>>>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c  |  6 ++++++
>>>  drivers/gpu/drm/arm/display/komeda/komeda_kms.h  |  1 +
>>>  3 files changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
>>> index 6c56f5662bc7..72035af9bc5f 100644
>>> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
>>> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
>>> @@ -8,6 +8,7 @@
>>>  #include <drm/drm_blend.h>
>>>  #include <drm/drm_print.h>
>>>  #include "d71_dev.h"
>>> +#include "komeda_kms.h"
>>>  #include "malidp_io.h"
>>>  
>>>  static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
>>> @@ -310,6 +311,17 @@ static int d71_reset(struct d71_dev *d71)
>>>  	u32 __iomem *gcu = d71->gcu_addr;
>>>  	int ret;
>>>  
>>> +	/*
>>> +	 * If we are already running, the most likely reason is that the EFI left
>>> +	 * us running (GOP), so make sure to take over from simple framebuffer
>>> +	 * drivers.
>>> +	 */
>>> +	if (malidp_read32(gcu, BLK_STATUS) & GCU_STATUS_ACTIVE) {
>>> +		ret = komeda_kms_remove_framebuffers();
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>>  	malidp_write32(gcu, BLK_CONTROL, GCU_CONTROL_SRST);
>>>  
>>>  	ret = dp_wait_cond(!(malidp_read32(gcu, BLK_CONTROL) & GCU_CONTROL_SRST),
>>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
>>> index 62dc64550793..12af409aeabb 100644
>>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
>>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
>>> @@ -7,6 +7,7 @@
>>>  #include <linux/component.h>
>>>  #include <linux/interrupt.h>
>>>  
>>> +#include <drm/drm_aperture.h>
>>>  #include <drm/drm_atomic.h>
>>>  #include <drm/drm_atomic_helper.h>
>>>  #include <drm/drm_drv.h>
>>> @@ -349,3 +350,8 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
>>>  	komeda_kms_cleanup_private_objs(kms);
>>>  	drm->dev_private = NULL;
>>>  }
>>> +
>>> +int komeda_kms_remove_framebuffers(void)
>>> +{
>>> +	return drm_aperture_remove_framebuffers(false, &komeda_kms_driver);
>>> +}
>>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
>>> index 3a872c292091..1a43707ed68f 100644
>>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
>>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
>>> @@ -187,5 +187,6 @@ void komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
>>>  
>>>  struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev);
>>>  void komeda_kms_detach(struct komeda_kms_dev *kms);
>>> +int komeda_kms_remove_framebuffers(void);
>>>  
>>>  #endif /*_KOMEDA_KMS_H_*/
>>
> 

