Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBDD8B0848
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 13:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA95E10EBB8;
	Wed, 24 Apr 2024 11:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0i/BOwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C394010E684;
 Wed, 24 Apr 2024 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713958055; x=1745494055;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pM/426bJ6EjgcrpcMxiPElp5Km2aBiuN5yD5iQxuvyM=;
 b=N0i/BOwk9zpSGcvdpCa8iElNpRdQU/0Ue9o64Oz7k+9yaNFVZROBm5zL
 ELx7DYu9DBLcCuJH4yuhsuSWBaSX8sAAxPbSMjGNgoXs1y/N+KHSd1YRd
 mvzTVMF1kCT55DKbObTBXSPvy8aWFnGI8qAlnPFPZjN5xYDgsPMD/RY5j
 dT2X7J2R8Jb7D2NT8TnRopjJvgN29I7rr5tYPEHZk+2WGtdxH+wgV1edH
 mX7jr3wrS2v9MCU+13aq4aEgOytKh4A4KSheklQDkePxsiK98ZPvKRpHS
 Y11C+LNYfLxCEAmm2mIc+Z55whmS5y7ZNLiL6DEXTFTho0GKRKpaDPbmm w==;
X-CSE-ConnectionGUID: Mc5NGgG2Scy2eCbOvRkqLg==
X-CSE-MsgGUID: EWJC03KLRfuPGrJkaUPlpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="34984803"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="34984803"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 04:27:34 -0700
X-CSE-ConnectionGUID: awJiszu3Q7ySRpuhBmSScg==
X-CSE-MsgGUID: tPzD840LQkKMfNMaLOGDzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="55638279"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 04:27:31 -0700
Message-ID: <5f1f9bdb-a76a-4c83-b792-4fa558767f09@linux.intel.com>
Date: Wed, 24 Apr 2024 17:00:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: add devm release action
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
 <ZibOmWPr3pZXdoNM@intel.com>
 <c899f2a5-e4f8-421f-ba87-8e8c15a6f665@linux.intel.com>
 <Zify_rd1yV6ki7oR@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <Zify_rd1yV6ki7oR@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/04/24 23:12, Rodrigo Vivi wrote:
> On Tue, Apr 23, 2024 at 02:25:06PM +0530, Aravind Iddamsetty wrote:
>> On 23/04/24 02:24, Rodrigo Vivi wrote:
>>> On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrote:
>>>> In scenarios where drm_dev_put is directly called by driver we want to
>>>> release devm_drm_dev_init_release action associated with struct
>>>> drm_device.
>>>>
>>>> v2: Directly expose the original function, instead of introducing a
>>>> helper (Rodrigo)
>>>>
>>>> v3: add kernel-doc (Maxime Ripard)
>>>>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>
>>> please avoid these empty lines here.... cc, rv-b, sign-offs, links,
>>> etc are all in the same block.
>> ok.
>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>> ---
>>>>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
>>>>  include/drm/drm_drv.h     |  2 ++
>>>>  2 files changed, 15 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>> index 243cacb3575c..9d0409165f1e 100644
>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *parent,
>>>>  					devm_drm_dev_init_release, dev);
>>>>  }
>>>>  
>>>> +/**
>>>> + * devm_drm_dev_release_action - Call the final release action of the device
>>> Seeing the doc here gave me a second thought....
>>>
>>> the original release should be renamed to _devm_drm_dev_release
>>> and this should be called devm_drm_dev_release without the 'action' word.
>> i believe, was suggested earlier to directly expose the main function, is 
>> there any reason to have a __ version ?
> No no, just ignore me. Just remove the '_action' and don't change the other.
>
> I don't like exposing the a function with '__'. what would '__' that mean?
> This is what I meant on the first comment.
>
> Now, I believe that we don't need the '_action'. What does the 'action' mean?
action is taken from here devm_release_action, but unlike here there isn't
any direct action call
>
> the devm_drm_dev_release should be enough. But then I got confused and
> I thought it would conflict with the original released function name.
> But I misread it.
>
> This also made me ask myself if we really should use 'devm' prefix there
> as well.
similar to devm in devm_drm_dev_alloc as it releases the action registered by it.
>
>>>> + * @dev: DRM device
>>>> + *
>>>> + * In scenarios where drm_dev_put is directly called by driver we want to release
>>>> + * devm_drm_dev_init_release action associated with struct drm_device.
>>> But also, this made me more confusing on why this is needed.
>>> Why can't we call put and get back?
>> IIUC, the ownership of drm_dev_get is with devm_drm_dev_alloc
>> and the release is tied to a devm action hence we needed this.
> you are right, but it is just a refcount. you are putting that one
> back on behalf of the init path, to force the refcount to 0, and
> then grabbing it back on init behalf after the flr. So in the
> end it is the same.
>
> Then with this flow we also can check if we are really force the
> disconnection of eveybody before we are ready to put the last
> ref that would call the release fn.
>
> but well, I'm just brainstorming some thoughts on possibilities
> of a clear release without forcing that...  it would be good
> to run some experiments to see if that is possible. if not,
> then let's go with this forced one.
even if we close all clients we ought to call this as the ref taken
during alloc is released only when pdev is destroyed.But on the 
contrary can we expect the onus to be on admin to close all clients
before initiating a reset as this a manual trigger not an automatic one.
>
>>> The next needs to make it clear on why we need to release in these
>>> scenarios regarless of the number of counters. But do we really
>>> want this?
>> in our case post tFLR we need to reprobe the device, but the previousdrm instance
>> is not destroyed with just calling pci_remove as it is tied to PDEV lifetime
>> which is not destroyed hence we need to call the last release action ourself
>> so that the final release is called.
>>> Can we block the flr if we have users? Perhaps this is the reason
>>> that on my side the flr was not that clean? beucase I had display
>>> so I had clients connected?
>> the display side error is due to power wells, post FLR the power wells are already
>> disabled while we try to disable them from driver again it is throwing warnings.
> so we probably need to tell display that we are going to be disabled.
> probably the same patch that we need for d3cold:
>
> https://lore.kernel.org/all/20240227183725.505699-3-rodrigo.vivi@intel.com/

will try this one and get back.

Thanks,
Aravind.
>
>> Thanks,
>>
>> Aravind.
>>>> + */
>>>> +void devm_drm_dev_release_action(struct drm_device *dev)
>>>> +{
>>>> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
>>>> +}
>>>> +EXPORT_SYMBOL(devm_drm_dev_release_action);
>>>> +
>>>>  void *__devm_drm_dev_alloc(struct device *parent,
>>>>  			   const struct drm_driver *driver,
>>>>  			   size_t size, size_t offset)
>>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>> index 8878260d7529..fa9123684874 100644
>>>> --- a/include/drm/drm_drv.h
>>>> +++ b/include/drm/drm_drv.h
>>>> @@ -444,6 +444,8 @@ struct drm_driver {
>>>>  	const struct file_operations *fops;
>>>>  };
>>>>  
>>>> +void devm_drm_dev_release_action(struct drm_device *dev);
>>>> +
>>>>  void *__devm_drm_dev_alloc(struct device *parent,
>>>>  			   const struct drm_driver *driver,
>>>>  			   size_t size, size_t offset);
>>>> -- 
>>>> 2.25.1
>>>>
