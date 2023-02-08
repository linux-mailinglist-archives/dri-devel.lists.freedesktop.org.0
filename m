Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC4268F7DF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 20:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF65510E805;
	Wed,  8 Feb 2023 19:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C07A10E805
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 19:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oyXacrmyVLS6f4Pi8k/VwmtxnczOkBeVP+8/sJiR50E=; b=qDbekjOm+YAogk9/ns0cYquyLA
 JqDvMge9vpKnrlDphjQ1sYoj7daSUKAkmgv/X3cfRnt/CpADRmA4bdIJOVp1sw3cVfFt+db5eOQzX
 Ej/sIZmpVsuqBQJN6K2Uz92DTS4iNIRmfrCPFEVff2GOJdzyB8CIxDC1lc92fukOXN7V2GS/hzC04
 DICCR7L/2LqwNbT04gqpVvBYSkdHWi8qSopRsOtnLLkoWICs72SUTEcIGWqcKg83dHkgUMUJLVSzj
 n3GDmr2bW3XCl0OdFbvlJxoanN8sBKrJ7wdOWyEKKUWn3rkjFIWSb0vgN16QzFiKX7F0/lqwcbUI4
 gBPjMFrw==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pPpw9-00DBVF-U2; Wed, 08 Feb 2023 20:16:58 +0100
Message-ID: <56d47cb0-de37-51af-8361-13ba3391da7e@igalia.com>
Date: Wed, 8 Feb 2023 16:16:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/6] drm/debugfs: Make the show callback pass the
 pointer to the right object
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230131195825.677487-1-mcanal@igalia.com>
 <20230131195825.677487-6-mcanal@igalia.com>
 <Y+PmBtbUx8joWOJa@phenom.ffwll.local> <Y+PnS/4n5wSqEa4Y@phenom.ffwll.local>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <Y+PnS/4n5wSqEa4Y@phenom.ffwll.local>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/23 15:17, Daniel Vetter wrote:
> On Wed, Feb 08, 2023 at 07:12:22PM +0100, Daniel Vetter wrote:
>> On Tue, Jan 31, 2023 at 04:58:25PM -0300, Maíra Canal wrote:
>>> Currently, the drivers need to access the struct drm_debugfs_entry to
>>> get the proper device on the show callback. There is no need for such
>>> thing, as you can wrap the show callback in order to provide to the
>>> driver the proper parameters: the struct seq_file, the struct drm_device
>>> and the driver-specific data stored in the struct drm_debugfs_info.
>>>
>>> Therefore, make the show callback pass the pointer to the right object
>>> in the parameters, which makes the API more type-safe.
>>>
>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>> ---
>>>   drivers/gpu/drm/arm/hdlcd_drv.c       |  8 ++------
>>>   drivers/gpu/drm/drm_atomic.c          |  4 +---
>>>   drivers/gpu/drm/drm_client.c          |  5 ++---
>>>   drivers/gpu/drm/drm_debugfs.c         | 25 ++++++++++++-------------
>>>   drivers/gpu/drm/drm_framebuffer.c     |  4 +---
>>>   drivers/gpu/drm/drm_gem_vram_helper.c |  5 ++---
>>>   drivers/gpu/drm/gud/gud_drv.c         |  5 ++---
>>>   drivers/gpu/drm/v3d/v3d_debugfs.c     | 16 ++++------------
>>>   drivers/gpu/drm/vc4/vc4_bo.c          |  4 +---
>>>   drivers/gpu/drm/vc4/vc4_debugfs.c     |  6 ++----
>>>   drivers/gpu/drm/vc4/vc4_hdmi.c        |  6 ++----
>>>   drivers/gpu/drm/vc4/vc4_hvs.c         |  8 ++------
>>>   drivers/gpu/drm/vc4/vc4_v3d.c         |  4 +---
>>>   drivers/gpu/drm/vkms/vkms_drv.c       |  4 +---
>>>   include/drm/drm_debugfs.h             | 14 ++++++++------
>>>   15 files changed, 43 insertions(+), 75 deletions(-)
>>>

[...]

>>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>>> index 423aa3de506a..0fb7ad5f6893 100644
>>> --- a/include/drm/drm_debugfs.h
>>> +++ b/include/drm/drm_debugfs.h
>>> @@ -36,6 +36,9 @@
>>>   #include <linux/mutex.h>
>>>   #include <linux/types.h>
>>>   #include <linux/seq_file.h>
>>> +
>>> +struct drm_device;
>>> +
>>>   /**
>>>    * struct drm_info_list - debugfs info list entry
>>>    *
>>> @@ -108,11 +111,10 @@ struct drm_debugfs_info {
>>>   	/**
>>>   	 * @show:
>>>   	 *
>>> -	 * Show callback. &seq_file->private will be set to the &struct
>>> -	 * drm_debugfs_entry corresponding to the instance of this info
>>> -	 * on a given &struct drm_device.
>>> +	 * Show callback. This callback will be casted in order to provide
>>> +	 * the &seq_file, the DRM object and the data stored in this struct.
>>>   	 */
>>> -	int (*show)(struct seq_file*, void*);
>>> +	void *show;
>>
>> The problem here is that with this we loose type-checking, and so all the
>> users of drm_debugfs_add_file() have been missed in the conversion. That's
>> not very good :-/
> 
> Correction, you didn't miss that, but it's the risk that could happen
> because the driver doesn't check things.
> 
>> I think the only way to sort this out is if we duplicate the driver-facing
>> functions/structs (maybe we don't need the add_files() functions in all
>> cases?), and only use the type-unsafe void* internally.
> 
> Since I didnt' spell it out: If you only keep the change to add the
> drm_device *dev pointer in this patch, but keep the full type everywhere,
> then struct drm_debugfs_entry becomes an implementation detail and you can
> move it into drm_debugfs.c. Once you have that you can throw out the
> driver api facing struct drm_debugfs_info and just put all the required
> pointers and things directly in there as void *, and it should work out
> with reasonable amounts of code sharing, while the driver api all stays
> type safe.

So basically, the idea is to make this patchset using
int (*show)(struct seq_file*, struct drm_device*, void*)? I'm not sure
how could we could reuse the struct drm_debugfs_info if we don't use
void * in the show callback, as add_files needs the struct.

The type-checking is handle by the add_file and the show wrapper.
Otherwise, we would have to duplicate the drm_debugfs_info and add_file
for each object. Or do you have any other idea on how to implement
it?

Anyway, I'll send a new version with
int (*show)(struct seq_file*, struct drm_device*, void*) and moving
the struct drm_debugfs_entry to drm_debugfs.c and we can keep working
on the API.

Thanks for all the feedback!

Best Regards,
- Maíra Canal

> -Daniel
> 
>> -Daniel
>>
>>>   
>>>   	/** @driver_features: Required driver features for this entry. */
>>>   	u32 driver_features;
>>> @@ -146,7 +148,7 @@ int drm_debugfs_remove_files(const struct drm_info_list *files,
>>>   			     int count, struct drm_minor *minor);
>>>   
>>>   void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>>> -			  int (*show)(struct seq_file*, void*), void *data);
>>> +			  int (*show)(struct seq_file*, struct drm_device*, void*), void *data);
>>>   
>>>   void drm_debugfs_add_files(struct drm_device *dev,
>>>   			   const struct drm_debugfs_info *files, int count);
>>> @@ -163,7 +165,7 @@ static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
>>>   }
>>>   
>>>   static inline void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>>> -					int (*show)(struct seq_file*, void*),
>>> +					int (*show)(struct seq_file*, struct drm_device*, void*),
>>>   					void *data)
>>>   {}
>>>   
>>> -- 
>>> 2.39.1
>>>
>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
> 
