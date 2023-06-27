Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC773F8D4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 11:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3013210E14C;
	Tue, 27 Jun 2023 09:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74A010E14C;
 Tue, 27 Jun 2023 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687858431; x=1719394431;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=miyyH8ZXvzirBIz3gYwBp+NbJvC/YZZCmCcT4P24Xgw=;
 b=hXIL8rXpKbRNCNfNoM3HtRiNrvDYalZnQ60jNALKimIZB3HajsTAzHxP
 Td62xukjePJHIUSjkFnCdYuym70nS4f548zM+x+SyNQ98UippcXPCImgN
 HBqUrAzJB2bqAHF8aKbAJnD/NA3/WVR3jxlaCvLESztTMn99jnTBGh/li
 0br406QjzsuC1oVQGdM3tqTF2PkTS76pioce4OnhiUCGRVup6uw1w0WEi
 Fcavx2bl61tu+26DFB3+rA44dQIw17v8R0+BCtMqy+LVzNUaZqM/7uS7v
 awmpcexDgn/5VBRsLy6yJ928fHCt9vFopmudAWxpItQQLPGQHVouWu38M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364074054"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="364074054"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 02:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="840630346"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="840630346"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.48])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 02:33:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Pan Xinhui
 <Xinhui.Pan@amd.com>
Subject: Re: [PATCH] drm: Remove the deprecated drm_put_dev() function
In-Reply-To: <5aee218e-2e46-b929-f905-a28794caac8c@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230625050901.393055-1-suijingfeng@loongson.cn>
 <87jzvqy897.fsf@intel.com>
 <5aee218e-2e46-b929-f905-a28794caac8c@loongson.cn>
Date: Tue, 27 Jun 2023 12:33:30 +0300
Message-ID: <87bkh1tfkl.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Jun 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
> Hi,
>
> On 2023/6/26 15:48, Jani Nikula wrote:
>> On Sun, 25 Jun 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>> As this function can be replaced with drm_dev_unregister() + drm_dev_pu=
t(),
>>> it is already marked as deprecated, so remove it. No functional change.
>>>
>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>> ---
>>>   drivers/gpu/drm/drm_drv.c           | 28 ----------------------------
>>>   drivers/gpu/drm/drm_pci.c           |  3 ++-
>>>   drivers/gpu/drm/radeon/radeon_drv.c |  3 ++-
>>>   include/drm/drm_drv.h               |  1 -
>>>   4 files changed, 4 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 12687dd9e1ac..5057307fe22a 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -406,34 +406,6 @@ void drm_minor_release(struct drm_minor *minor)
>>>    * possibly leaving the hardware enabled.
>>>    */
>>>=20=20=20
>>> -/**
>>> - * drm_put_dev - Unregister and release a DRM device
>>> - * @dev: DRM device
>>> - *
>>> - * Called at module unload time or when a PCI device is unplugged.
>>> - *
>>> - * Cleans up all DRM device, calling drm_lastclose().
>>> - *
>>> - * Note: Use of this function is deprecated. It will eventually go away
>>> - * completely.  Please use drm_dev_unregister() and drm_dev_put() expl=
icitly
>>> - * instead to make sure that the device isn't userspace accessible any=
 more
>>> - * while teardown is in progress, ensuring that userspace can't access=
 an
>>> - * inconsistent state.
>> The last sentence is the crucial one. While the patch has no functional
>> changes,
>
> But my patch help to=C2=A0save a useless check(if (!dev))
>
> on where we found the check is not necessary.
>
> ```
>
> -	if (!dev) {
> -		DRM_ERROR("cleanup called no dev\n");
> -		return;
> -	}
>
> ```
>
>
>> I believe the goal never was to just mechanically replace one
>> call with the two.
>
> The DRM core lose nothing, just a function wrapper.
>
> Instead, this is probably a good chance to migrate the burden to the=20
> driver side.

The point is to *fix* this stuff while doing the conversion. Anyone can
replace one function call with two, but that's just brushing the problem
under the carpet.

The current state is that we have a function the use of which is
potentially problematic, it's documented, and we can trivially locate
all the call sites.

After your change, we've lost that information, and we haven't fixed
anything.


BR,
Jani.


>
> I think the device driver(drm/radeon, for example) have better understand=
ing
>
> about how to ensure that userspace can't access an inconsistent state=20
> than the DRM core.
>
>>
>> BR,
>> Jani.
>>
>>
>>> - */
>>> -void drm_put_dev(struct drm_device *dev)
>>> -{
>>> -	DRM_DEBUG("\n");
>>> -
>>> -	if (!dev) {
>>> -		DRM_ERROR("cleanup called no dev\n");
>>> -		return;
>>> -	}
>>> -
>>> -	drm_dev_unregister(dev);
>>> -	drm_dev_put(dev);
>>> -}
>>> -EXPORT_SYMBOL(drm_put_dev);
>>> -
>>>   /**
>>>    * drm_dev_enter - Enter device critical section
>>>    * @dev: DRM device
>>> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
>>> index 39d35fc3a43b..b3a68a92eaa6 100644
>>> --- a/drivers/gpu/drm/drm_pci.c
>>> +++ b/drivers/gpu/drm/drm_pci.c
>>> @@ -257,7 +257,8 @@ void drm_legacy_pci_exit(const struct drm_driver *d=
river,
>>>   					 legacy_dev_list) {
>>>   			if (dev->driver =3D=3D driver) {
>>>   				list_del(&dev->legacy_dev_list);
>>> -				drm_put_dev(dev);
>>> +				drm_dev_unregister(dev);
>>> +				drm_dev_put(dev);
>>>   			}
>>>   		}
>>>   		mutex_unlock(&legacy_dev_list_lock);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/rade=
on/radeon_drv.c
>>> index e4374814f0ef..a4955ae10659 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>>> @@ -357,7 +357,8 @@ radeon_pci_remove(struct pci_dev *pdev)
>>>   {
>>>   	struct drm_device *dev =3D pci_get_drvdata(pdev);
>>>=20=20=20
>>> -	drm_put_dev(dev);
>>> +	drm_dev_unregister(dev);
>>> +	drm_dev_put(dev);
>>>   }
>>>=20=20=20
>>>   static void
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index 89e2706cac56..289c97b12e82 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -511,7 +511,6 @@ void drm_dev_unregister(struct drm_device *dev);
>>>=20=20=20
>>>   void drm_dev_get(struct drm_device *dev);
>>>   void drm_dev_put(struct drm_device *dev);
>>> -void drm_put_dev(struct drm_device *dev);
>>>   bool drm_dev_enter(struct drm_device *dev, int *idx);
>>>   void drm_dev_exit(int idx);
>>>   void drm_dev_unplug(struct drm_device *dev);

--=20
Jani Nikula, Intel Open Source Graphics Center
