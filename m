Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F208A5E63
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 01:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9C51128C9;
	Mon, 15 Apr 2024 23:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="W1j9IjH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC511128C9;
 Mon, 15 Apr 2024 23:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713224104; x=1713828904; i=w_armin@gmx.de;
 bh=pmyP4CEy69Uj8iXjSnZkR04t7uBjJ8fSPa2KWueQbQ4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=W1j9IjH6rPw3vQO8G2QC+YvF7IpAOWhh/CyowQqwGUWGgcMhrcEm5ApdwwiKt+1I
 B+4CQYxiYB+S5ZiI4ZzgjOCYs1cH1fdcP8A9KlNV3Ry7f55C7roxyaNDs6P/twNjj
 T8Gx28ayYHIEgLpnugDJTOKnQqaMHAQsCrjVlZfbbGQJm0C44HpxaEKkFwYlI8OdX
 ou5GPQeNBCrVEGFPYp3FDW7Yz47kX3wd5vcP8e0ZMpMBXkJ1lCqzVOva4Y6idy53f
 rQ57YNWeX9WeydGHPC1IZEaQqOCHy/fwLlkGqPCJHRsZxDhOJfS88q7cyCG6E6fXU
 ZkgA4PuHcYkFDexOdw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mulm5-1snW4x1Ywt-00rs8c; Tue, 16
 Apr 2024 01:35:04 +0200
Message-ID: <020612d1-2e6b-4bd7-87a6-dbd31574fdd8@gmx.de>
Date: Tue, 16 Apr 2024 01:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/hwmon: Get rid of devm
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>, Andi Shyti
 <andi.shyti@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240415223612.738535-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240415223612.738535-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GhwclRSw6uw2wiE9i9/X26NsE6ctQeALOum9cO8peT7yGbZMg0/
 JpdGPYYjvOgyyHFWEAYlCrYuviHaIolXb1tCOHhNpevSpXk5eHbc2guPc/W2Z7A00LE/4lR
 KBvJvRIOWkqERqBbsJyZ5EkT1FnhI7hPW73hb2ZMy8pFcGAFlsGNhk/DmZP0IfCvBoQRIC5
 etLWABmwKUoY2sx1Tf/3w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:39UMfrACpkQ=;Nxvl/d83CXve9SVn4lI8ejM+FCx
 IDCTWvmOihpWpoooOYU5ed5+5XJhHlu7xM4OPN+NleSt4n1BRubRUT016ZFgDqO0EAQC8f3ig
 3HYJ0u9Ex01ongkbm6PKgDP/UyCOsXptjSzz243vSMg2kMXOZ4KPXyHNz85jB1dxT47TI0/sp
 4NV1TUK3AguiMLK/8B0/zAwKJAERykqQH7pnQr3p9EJG+F0KrBnGuC5ZIbcgwtCxZ7QBNqF7q
 JfHR5vdgDT496mOeFWgdX1b9J8snMGrCENCJzaC5xHas/lSgYnV0BUMm1rQ0i3JL8xWUpMPOS
 3HErTh9omTbHDKCMOTeLylwEZ1gRa6DpvpxJznr3Lq2vQOK/wAbDjU/Msu5QAROW4meYcjIfL
 SHGq04I2DCfkvx98okwzO7rr4pT9owKKIktxJqtBAIYu1OvGygaE+am+7nzPjaLgu9UJ1e7aC
 jbFtn6+7jQZm/2vmTxIYftD4OR4C9Scct6kBDh0y/XykJAELgJoAcrnsun+l1nr8KIJPIE3w+
 NjdlJRqHXdDfIgNWOQBGJDSoNtD4560clklZiM3ccitU046CTHV3APGTlK213+QOW8kyN9vvG
 ZS+d9RgcNByqUnGT5MS93tJAtRujBSRC70YkXcPGbppfqKj6DSucaRpxFNq1NQyCg8BL8sXhr
 BhCR8SujhXNrhpqsQpCKhtbJEKrkjkTXtg6UON8UO+xRDIkZcI8OsVyfu3Bjy3Rmonk5Qy+cK
 tuOiEuXWIOEPXCJ/pIoBUl3JU33T5B1JNvEECkaRE8pI1fiZLzZ1t/edEcglrIhDGOmXvEuAb
 JXJA7St151+xWeWopODEriri6PQvCIlpNBzYIaCwiEF6w=
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

Am 16.04.24 um 00:36 schrieb Ashutosh Dixit:

> When both hwmon and hwmon drvdata (on which hwmon depends) are device
> managed resources, the expectation, on device unbind, is that hwmon will=
 be
> released before drvdata. However, in i915 there are two separate code
> paths, which both release either drvdata or hwmon and either can be
> released before the other. These code paths (for device unbind) are as
> follows (see also the bug referenced below):
>
> Call Trace:
> release_nodes+0x11/0x70
> devres_release_group+0xb2/0x110
> component_unbind_all+0x8d/0xa0
> component_del+0xa5/0x140
> intel_pxp_tee_component_fini+0x29/0x40 [i915]
> intel_pxp_fini+0x33/0x80 [i915]
> i915_driver_remove+0x4c/0x120 [i915]
> i915_pci_remove+0x19/0x30 [i915]
> pci_device_remove+0x32/0xa0
> device_release_driver_internal+0x19c/0x200
> unbind_store+0x9c/0xb0
>
> and
>
> Call Trace:
> release_nodes+0x11/0x70
> devres_release_all+0x8a/0xc0
> device_unbind_cleanup+0x9/0x70
> device_release_driver_internal+0x1c1/0x200
> unbind_store+0x9c/0xb0
>
> This means that in i915, if use devm, we cannot gurantee that hwmon will
> always be released before drvdata. Which means that we have a uaf if hwm=
on
> sysfs is accessed when drvdata has been released but hwmon hasn't.
>
> The only way out of this seems to be do get rid of devm_ and release/fre=
e
> everything explicitly during device unbind.
>
> v2: Change commit message and other minor code changes
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_hwmon.c | 41 +++++++++++++++++++++++--------
>   1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i9=
15_hwmon.c
> index 8c3f443c8347..46c24b1ee6df 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -792,7 +792,7 @@ void i915_hwmon_register(struct drm_i915_private *i9=
15)
>   	if (!IS_DGFX(i915))
>   		return;
>
> -	hwmon =3D devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> +	hwmon =3D kzalloc(sizeof(*hwmon), GFP_KERNEL);
>   	if (!hwmon)
>   		return;
>
> @@ -818,10 +818,10 @@ void i915_hwmon_register(struct drm_i915_private *=
i915)
>   	hwm_get_preregistration_info(i915);
>
>   	/*  hwmon_dev points to device hwmon<i> */
> -	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, ddat->name,
> -							 ddat,
> -							 &hwm_chip_info,
> -							 hwm_groups);
> +	hwmon_dev =3D hwmon_device_register_with_info(dev, ddat->name,
> +						    ddat,
> +						    &hwm_chip_info,
> +						    hwm_groups);
>   	if (IS_ERR(hwmon_dev)) {
>   		i915->hwmon =3D NULL;

Hi,

you need to free hwmon here, since it is not managed by devres anymore.

>   		return;
> @@ -838,10 +838,10 @@ void i915_hwmon_register(struct drm_i915_private *=
i915)
>   		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0)=
)
>   			continue;
>
> -		hwmon_dev =3D devm_hwmon_device_register_with_info(dev, ddat_gt->name=
,
> -								 ddat_gt,
> -								 &hwm_gt_chip_info,
> -								 NULL);
> +		hwmon_dev =3D hwmon_device_register_with_info(dev, ddat_gt->name,
> +							    ddat_gt,
> +							    &hwm_gt_chip_info,
> +							    NULL);
>   		if (!IS_ERR(hwmon_dev))
>   			ddat_gt->hwmon_dev =3D hwmon_dev;
>   	}
> @@ -849,5 +849,26 @@ void i915_hwmon_register(struct drm_i915_private *i=
915)
>
>   void i915_hwmon_unregister(struct drm_i915_private *i915)
>   {
> -	fetch_and_zero(&i915->hwmon);
> +	struct i915_hwmon *hwmon =3D fetch_and_zero(&i915->hwmon);

Why is fetch_and_zero() necessary here?

Thanks,
Armin Wolf

> +	struct hwm_drvdata *ddat =3D &hwmon->ddat;
> +	struct intel_gt *gt;
> +	int i;
> +
> +	if (!hwmon)
> +		return;
> +
> +	for_each_gt(gt, i915, i) {
> +		struct hwm_drvdata *ddat_gt =3D hwmon->ddat_gt + i;
> +
> +		if (ddat_gt->hwmon_dev) {
> +			hwmon_device_unregister(ddat_gt->hwmon_dev);
> +			ddat_gt->hwmon_dev =3D NULL;
> +		}
> +	}
> +
> +	if (ddat->hwmon_dev)
> +		hwmon_device_unregister(ddat->hwmon_dev);
> +
> +	mutex_destroy(&hwmon->hwmon_lock);
> +	kfree(hwmon);
>   }
