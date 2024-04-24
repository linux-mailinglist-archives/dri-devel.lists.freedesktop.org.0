Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7719D8B09C3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 14:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2082C113AF5;
	Wed, 24 Apr 2024 12:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Knhl3ibX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4AE113AF5;
 Wed, 24 Apr 2024 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713962065; x=1745498065;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=399fJAKTNdblQ+vkov4pckQvCiUTTQZnwk7JIpvJO5E=;
 b=Knhl3ibXyyp7El1Rdl0SMlEtjNNOxjYBnpZsEwY9i1nxD0MP6NiqRj+C
 eGATYQ95l6m6NRnwMRQEruR26TsBQGrE8d0b4eokZbQT7kwW04dP5lm4Q
 DTUImpFBxNPzLPyLk75TD0+7v1X5kcvWTkVZQOy1/bnfeC1FI34Ep4TXV
 5/AdO9Q3zcUIPeahLmfNiEIS8RgasTsNFilnyBOZ7Ek5kOhWuV1f28IbK
 20VnT4tIVf1j1MXz6eqkFsFWOVDjYQ3mml/oeFt7YnZ8MHBkQ5Yrtzu+d
 rE2octRbwyednIE1sjtXwFKmBlGzSWK2OgoiQtIeKhimJQP/MAq2201ok w==;
X-CSE-ConnectionGUID: iNH7Z0ZKTFSSQPrWOrz3cA==
X-CSE-MsgGUID: pFuaTOiaSuOFu1AraoPzaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13424226"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="13424226"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:34:06 -0700
X-CSE-ConnectionGUID: 0AB+gT4LRWSHM2vC6QOp6w==
X-CSE-MsgGUID: LtPuLnuJSbyzXimORXtnyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="55648656"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:34:03 -0700
Message-ID: <e54a0551-9484-40c9-abf7-f2e39e101497@linux.intel.com>
Date: Wed, 24 Apr 2024 18:06:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: add devm release action
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
 <20240424-garrulous-realistic-pronghorn-fbfcd5@houat>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240424-garrulous-realistic-pronghorn-fbfcd5@houat>
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


On 24/04/24 17:21, Maxime Ripard wrote:
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
>> + * @dev: DRM device
>> + *
>> + * In scenarios where drm_dev_put is directly called by driver we want to release
>> + * devm_drm_dev_init_release action associated with struct drm_device.
>> + */
> I'm not entirely sure what you mean by that documentation. "In scenarios
> where drm_dev_put is directly called by the driver", we wouldn't need to
> consider that function at all, right?

the drm_dev_put is not being invoked by drivers directly but that is
associated with devres releases and the scenario here I meant if
drivers want to have that called by themselves.
>
> Also, we should reference it in drm_dev_put and devm_drm_dev_alloc too.

sorry I didn't get this can you please elaborate.

Thanks,
Aravind.
>
> Maxime
