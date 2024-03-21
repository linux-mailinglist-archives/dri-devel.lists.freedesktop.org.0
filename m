Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0758B881C50
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 07:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1147310FB6A;
	Thu, 21 Mar 2024 06:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmoJ7SJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DAB10FB6A;
 Thu, 21 Mar 2024 06:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711001121; x=1742537121;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ctcrEUwdAthwIMhmcIqSXWkBtM128PMVqDHBAD2Hpww=;
 b=BmoJ7SJ9xCC70MqslqL5i+bZk4bgamIU/ITknHWCW9EBfzBPWhia7Mwa
 3eZccfZYytc7ps9fMRuF8L57N5BVoBkkygAUQ82EYKe0WH/zzluGD/rqZ
 2sdFRTBAIJ0T85/NKM4uki3gFKW+c/OxBTw1Fj3I33OEjlBNntPXAgtoS
 Glc8TShF2QrIwHm293qwxSEzBJkSc/kYLGl0YChl6qvGzkl3w/85DQ2cl
 xpWz+2E++D7Hig5KqqYPQlcVml+x4zG1E12Nae+XIdEXYZI+jRVyht1lf
 vjoaPA3aBWXapWt4m5IUtSQBlJVuLe297h5+xB0pLSeWPEljRlICOzSJX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5855428"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5855428"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 23:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19123040"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 23:05:19 -0700
Message-ID: <59514a7a-fbf7-45fa-b205-b4e1ffd019ac@linux.intel.com>
Date: Thu, 21 Mar 2024 11:38:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] drm: add devm release action
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
 <20240320104426.1592959-2-aravind.iddamsetty@linux.intel.com>
 <ZftMw_911HrrzJTj@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ZftMw_911HrrzJTj@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/03/24 02:23, Rodrigo Vivi wrote:
> On Wed, Mar 20, 2024 at 04:14:25PM +0530, Aravind Iddamsetty wrote:
>> In scenarios where drm_dev_put is directly called by driver we want to
>> release devm_drm_dev_init_release action associated with struct
>> drm_device.
>>
>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>>  include/drm/drm_drv.h     | 4 ++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 243cacb3575c..b23c5081812b 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
>>  					devm_drm_dev_init_release, dev);
>>  }
>>  
>> +void __devm_drm_dev_release_action(struct drm_device *dev)
>> +{
>> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
>> +}
>> +EXPORT_SYMBOL(__devm_drm_dev_release_action);
>> +
>>  void *__devm_drm_dev_alloc(struct device *parent,
>>  			   const struct drm_driver *driver,
>>  			   size_t size, size_t offset)
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 8878260d7529..a1d12cb72088 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -444,6 +444,8 @@ struct drm_driver {
>>  	const struct file_operations *fops;
>>  };
>>  
>> +void __devm_drm_dev_release_action(struct drm_device *dev);
>> +
>>  void *__devm_drm_dev_alloc(struct device *parent,
>>  			   const struct drm_driver *driver,
>>  			   size_t size, size_t offset);
>> @@ -477,6 +479,8 @@ void *__devm_drm_dev_alloc(struct device *parent,
>>  #define devm_drm_dev_alloc(parent, driver, type, member) \
>>  	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
>>  				       offsetof(type, member)))
>> +#define devm_drm_release_action(drm_dev) \
>> +	__devm_drm_dev_release_action(drm_dev)
> why not simply renaming the original function?

didn't get you which function are you referring to?

Thanks,
Aravind.
>
>>  
>>  struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
>>  				 struct device *parent);
>> -- 
>> 2.25.1
>>
