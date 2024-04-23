Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329518AE04E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 10:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA5C10E4D4;
	Tue, 23 Apr 2024 08:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQz0gDaj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE7310E4D4;
 Tue, 23 Apr 2024 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713862358; x=1745398358;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/t6KE7ScICcQM3sBCh8BmbK5jFxNnxjjf2uufyOwDFc=;
 b=LQz0gDajjSmZNgE+2r8kaerYFpDUi0NaMVNUeCN7lS3CkIvEbJJitr9/
 aeJh1ZVea0k5tKq3oaR4hGQHKvMydxK4sK0BJ6W79xWoCskPefdBgYIR6
 g7fDWrZXN8CZhk1Iiq5KXVY2UbGQBsmr3nVD0cSqpddwHQNCKSZS4vfJr
 piHWk30thq/ZgSpAAAid4TSjPP3lmuDeKZ95ig6m/u83GZrAoPbJJcTEc
 AMAPnsqAF+bW/ApQqnlKyOLjf5aQ/K729n2hapmwpBUwPuDbvFSIM90Ss
 dxuaGyxqJzUffpL7w690386xPNRrt8R2MRlaZjO0K5FwDXG/P3tzOB4aJ g==;
X-CSE-ConnectionGUID: EJ4wDVWpS3CdTeLvrE/h8w==
X-CSE-MsgGUID: k4IvjZm7TEmhenhrQTxGOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9353494"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9353494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:52:20 -0700
X-CSE-ConnectionGUID: v6TDgEunS/2GS7FkCkTHQg==
X-CSE-MsgGUID: rm86MI/GRJiaPcm7T2sBRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28973413"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:52:17 -0700
Message-ID: <c899f2a5-e4f8-421f-ba87-8e8c15a6f665@linux.intel.com>
Date: Tue, 23 Apr 2024 14:25:06 +0530
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
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ZibOmWPr3pZXdoNM@intel.com>
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


On 23/04/24 02:24, Rodrigo Vivi wrote:
> On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrote:
>> In scenarios where drm_dev_put is directly called by driver we want to
>> release devm_drm_dev_init_release action associated with struct
>> drm_device.
>>
>> v2: Directly expose the original function, instead of introducing a
>> helper (Rodrigo)
>>
>> v3: add kernel-doc (Maxime Ripard)
>>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
> please avoid these empty lines here.... cc, rv-b, sign-offs, links,
> etc are all in the same block.
ok.
>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
>>  include/drm/drm_drv.h     |  2 ++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 243cacb3575c..9d0409165f1e 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *parent,
>>  					devm_drm_dev_init_release, dev);
>>  }
>>  
>> +/**
>> + * devm_drm_dev_release_action - Call the final release action of the device
> Seeing the doc here gave me a second thought....
>
> the original release should be renamed to _devm_drm_dev_release
> and this should be called devm_drm_dev_release without the 'action' word.
i believe, was suggested earlier to directly expose the main function, is 
there any reason to have a __ version ?
>
>> + * @dev: DRM device
>> + *
>> + * In scenarios where drm_dev_put is directly called by driver we want to release
>> + * devm_drm_dev_init_release action associated with struct drm_device.
> But also, this made me more confusing on why this is needed.
> Why can't we call put and get back?
IIUC, the ownership of drm_dev_get is with devm_drm_dev_alloc
and the release is tied to a devm action hence we needed this.

>
> The next needs to make it clear on why we need to release in these
> scenarios regarless of the number of counters. But do we really
> want this?
in our case post tFLR we need to reprobe the device, but the previousdrm instance
is not destroyed with just calling pci_remove as it is tied to PDEV lifetime
which is not destroyed hence we need to call the last release action ourself
so that the final release is called.
>
> Can we block the flr if we have users? Perhaps this is the reason
> that on my side the flr was not that clean? beucase I had display
> so I had clients connected?
the display side error is due to power wells, post FLR the power wells are already
disabled while we try to disable them from driver again it is throwing warnings.

Thanks,

Aravind.
>
>> + */
>> +void devm_drm_dev_release_action(struct drm_device *dev)
>> +{
>> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
>> +}
>> +EXPORT_SYMBOL(devm_drm_dev_release_action);
>> +
>>  void *__devm_drm_dev_alloc(struct device *parent,
>>  			   const struct drm_driver *driver,
>>  			   size_t size, size_t offset)
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 8878260d7529..fa9123684874 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -444,6 +444,8 @@ struct drm_driver {
>>  	const struct file_operations *fops;
>>  };
>>  
>> +void devm_drm_dev_release_action(struct drm_device *dev);
>> +
>>  void *__devm_drm_dev_alloc(struct device *parent,
>>  			   const struct drm_driver *driver,
>>  			   size_t size, size_t offset);
>> -- 
>> 2.25.1
>>
