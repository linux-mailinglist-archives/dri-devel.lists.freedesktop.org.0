Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DEE881C99
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 07:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680E810EDF1;
	Thu, 21 Mar 2024 06:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7Qffifr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED0710EDAB;
 Thu, 21 Mar 2024 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711003650; x=1742539650;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qi1uM7Z+gzyDieSRet4bS7owl5yoj//UEYVREl0Kw/Y=;
 b=J7Qffifr8wuVt2QbTeSr7pU8Cb0tsFC6pTu9MlSoQkw7mlRg9onC8y4s
 nkgPW9+ngKhrbu+YmhIrEb5qTt27nMFrbJkBiX7+U92+bdHImG4oAP3dO
 8h7/JZeiZT8hBKxNDnWXlBezBNb918rq5aG1GPgxbYdYYznx28WBHC0zv
 JEv00otOomPdZpPjXphLFj22y2igndlYnPIa0PBT4AcRWHliC/jbfcNWD
 z4ea8gYEnu2W6FWaFN9aL40Qni17L7OJM6t1LsVipOO8AImX38ozPMYIO
 xJAVH13VrBCkvJizvbAXR+iaOchUo+3Qj9Uq12590byfPxkQorh5VWNay w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5827231"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5827231"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 23:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14486606"
Received: from pgarraul-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 23:47:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [RFC 1/2] drm: add devm release action
In-Reply-To: <59514a7a-fbf7-45fa-b205-b4e1ffd019ac@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
 <20240320104426.1592959-2-aravind.iddamsetty@linux.intel.com>
 <ZftMw_911HrrzJTj@intel.com>
 <59514a7a-fbf7-45fa-b205-b4e1ffd019ac@linux.intel.com>
Date: Thu, 21 Mar 2024 08:47:23 +0200
Message-ID: <87plvom684.fsf@intel.com>
MIME-Version: 1.0
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

On Thu, 21 Mar 2024, Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com> wrote:
> On 21/03/24 02:23, Rodrigo Vivi wrote:
>> On Wed, Mar 20, 2024 at 04:14:25PM +0530, Aravind Iddamsetty wrote:
>>> In scenarios where drm_dev_put is directly called by driver we want to
>>> release devm_drm_dev_init_release action associated with struct
>>> drm_device.
>>>
>>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>> ---
>>>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>>>  include/drm/drm_drv.h     | 4 ++++
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 243cacb3575c..b23c5081812b 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
>>>  					devm_drm_dev_init_release, dev);
>>>  }
>>>  
>>> +void __devm_drm_dev_release_action(struct drm_device *dev)
>>> +{
>>> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
>>> +}
>>> +EXPORT_SYMBOL(__devm_drm_dev_release_action);
>>> +
>>>  void *__devm_drm_dev_alloc(struct device *parent,
>>>  			   const struct drm_driver *driver,
>>>  			   size_t size, size_t offset)
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index 8878260d7529..a1d12cb72088 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -444,6 +444,8 @@ struct drm_driver {
>>>  	const struct file_operations *fops;
>>>  };
>>>  
>>> +void __devm_drm_dev_release_action(struct drm_device *dev);
>>> +
>>>  void *__devm_drm_dev_alloc(struct device *parent,
>>>  			   const struct drm_driver *driver,
>>>  			   size_t size, size_t offset);
>>> @@ -477,6 +479,8 @@ void *__devm_drm_dev_alloc(struct device *parent,
>>>  #define devm_drm_dev_alloc(parent, driver, type, member) \
>>>  	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
>>>  				       offsetof(type, member)))
>>> +#define devm_drm_release_action(drm_dev) \
>>> +	__devm_drm_dev_release_action(drm_dev)
>> why not simply renaming the original function?
>
> didn't get you which function are you referring to?

Why add a function with double-underscores, and then wrap it in a macro
without the underscores?

devm_drm_dev_alloc() is that way only because it needs sizeof and
offsetof on the arguments, not to set a general example.

BR,
Jani.

>
> Thanks,
> Aravind.
>>
>>>  
>>>  struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
>>>  				 struct device *parent);
>>> -- 
>>> 2.25.1
>>>

-- 
Jani Nikula, Intel
