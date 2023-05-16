Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB5704752
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E507510E319;
	Tue, 16 May 2023 08:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7709B10E319;
 Tue, 16 May 2023 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684224340; x=1715760340;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JX/rO9EYjjioyshFmAmFT+v4wyZknpIxjSnGXFmDjUQ=;
 b=RJ2DFhq2Ak0s/cewN43c+/4sC1a4G1Jf+PTM2ED6xLs0l+0HBrAFwYJO
 LgYg0zxl8sVQ2JEU5pX+cJ9fz0wOhiJfEJ2yVo3k2V5lzi2v5ewHNu7UL
 gvs1kgq2R2kcDRNMaBMS5vfFH951Ifxr8x/KvRt2zxZUgMisA7ePO+9sU
 dPi/SUwkhXGA/pVB4HgLTH1ZRPnoJwoAyXS/piTygfipOic//wOmskVzV
 vGrX23ZXqzb+bNwNumBOST9lPSA/L2pp24ctmz4yIkOzbbqCcYysFdMiK
 6XYW0o99RyDFoq+nWAqx5wf1wv4etIrHCtGvwf7WTl5UAN+jXgm/7aaVF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331775774"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331775774"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 01:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875521170"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="875521170"
Received: from khach-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.69])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 01:05:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ttm: let struct ttm_device_funcs be placed in rodata
In-Reply-To: <87bkl29jk0.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309123700.528641-1-jani.nikula@intel.com>
 <d844e8f4-dbfe-15a6-32db-4ab928fad77d@amd.com> <87bkl29jk0.fsf@intel.com>
Date: Tue, 16 May 2023 11:05:34 +0300
Message-ID: <875y8sitv5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 09 Mar 2023, Christian K=C3=B6nig <christian.koenig@amd.com> wrot=
e:
>> Am 09.03.23 um 13:37 schrieb Jani Nikula:
>>> Make the struct ttm_device_funcs pointers const so the data can be plac=
ed in rodata.
>>>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> Good idea, Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Thanks!
>
>> Should I push it to drm-misc-next or do you need it on some other branch?
>
> Go ahead, I'm not urgently depending on it.

Christian, I guess this fell between the cracks? Can I just push it to
drm-misc-next?

BR,
Jani.


>
> BR,
> Jani.
>
>>
>> Christian.
>>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>>>   include/drm/ttm/ttm_device.h     | 4 ++--
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm=
_device.c
>>> index ae2f19dc9f81..a71bb1362de4 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -190,7 +190,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
>>>    * Returns:
>>>    * !0: Failure.
>>>    */
>>> -int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *=
funcs,
>>> +int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_f=
uncs *funcs,
>>>   		    struct device *dev, struct address_space *mapping,
>>>   		    struct drm_vma_offset_manager *vma_manager,
>>>   		    bool use_dma_alloc, bool use_dma32)
>>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
>>> index 56e82ba2d046..c22f30535c84 100644
>>> --- a/include/drm/ttm/ttm_device.h
>>> +++ b/include/drm/ttm/ttm_device.h
>>> @@ -223,7 +223,7 @@ struct ttm_device {
>>>   	 * @funcs: Function table for the device.
>>>   	 * Constant after bo device init
>>>   	 */
>>> -	struct ttm_device_funcs *funcs;
>>> +	const struct ttm_device_funcs *funcs;
>>>=20=20=20
>>>   	/**
>>>   	 * @sysman: Resource manager for the system domain.
>>> @@ -287,7 +287,7 @@ static inline void ttm_set_driver_manager(struct tt=
m_device *bdev, int type,
>>>   	bdev->man_drv[type] =3D manager;
>>>   }
>>>=20=20=20
>>> -int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *=
funcs,
>>> +int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_f=
uncs *funcs,
>>>   		    struct device *dev, struct address_space *mapping,
>>>   		    struct drm_vma_offset_manager *vma_manager,
>>>   		    bool use_dma_alloc, bool use_dma32);
>>

--=20
Jani Nikula, Intel Open Source Graphics Center
