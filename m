Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A7E62BF87
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 14:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C779810E4A8;
	Wed, 16 Nov 2022 13:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0362610E4A8;
 Wed, 16 Nov 2022 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668605527; x=1700141527;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HPL97wIoTrHzWCa0UIW8QpGefhVDiJRBrp7T53JjT5w=;
 b=inUr8M2ebBpeSv9BxOrrtxXXFxbR4ApoLd5MvBs6cEBIk1W+nt3XkPFC
 PVLbdmmkyNcsN7l7dbIeiVmFJZkjHn5toNtEoz6AYKAs0cz40Ws3aoHqe
 B181O8APOuQc8mddhAzDcCXpQ1Qv5aJbL/KbnV1eNnfWc73HIScIxscoV
 tavSulF3ebAxk7du1gExeiFMoWxmlok4q8JelRSpMciddLfLJV+RVLkPE
 XRKXO17g6mnkUlo6mFkTHffJaVytAL0YRvCkGKh8T1iIqfyPSoIOLd//0
 WXMSCi0gFFiQnqxl/1R6eUIBlr6YrXIvdqcpqLl65ifUsyNVkHcT2yLoJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="292932405"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="292932405"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 05:32:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="639358766"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="639358766"
Received: from dariofax-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.59.5])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 05:32:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [RESEND] drm/edid/firmware: stop using a throwaway platform device
In-Reply-To: <0422ebb6-d4ff-52b0-b773-c643489e8fe9@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221114111709.434979-1-jani.nikula@intel.com>
 <0422ebb6-d4ff-52b0-b773-c643489e8fe9@suse.de>
Date: Wed, 16 Nov 2022 15:32:01 +0200
Message-ID: <87wn7v10vi.fsf@intel.com>
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
Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Nov 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 14.11.22 um 12:17 schrieb Jani Nikula:
>> We've used a temporary platform device for firmware EDID loading since
>> it was introduced in commit da0df92b5731 ("drm: allow loading an EDID as
>> firmware to override broken monitor"), but there's no explanation why.
>>=20
>> Using a temporary device does not play well with CONFIG_FW_CACHE=3Dy,
>> which caches firmware images (e.g. on suspend) so that drivers can
>> request firmware when the system is not ready for it, and return the
>> images from the cache (e.g. during resume). This works automatically for
>> regular devices, but obviously not for a temporarily created device.
>>=20
>> Stop using the throwaway platform device, and use the drm device
>> instead.
>>=20
>> Note that this may still be problematic for cases where the display was
>> plugged in during suspend, and the firmware wasn't loaded and therefore
>> not cached before suspend.
>>=20
>> References: https://lore.kernel.org/r/20220727074152.43059-1-matthieu.ch=
arette@gmail.com
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2061
>> Reported-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
>> Tested-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> I looked through request_firmware() but did not see any signs that it=20
> somehow depends on a platform device. I assume that this might only=20
> affect the device name in the error message.

Thanks, pushed to drm-misc-next.

Matthieu, thanks for you patience and the report as well!

BR,
Jani.


>
> Best regards
> Thomas
>
>>=20
>> ---
>>=20
>> Resend with a proper commit message; patch itself is unchanged.
>> ---
>>   drivers/gpu/drm/drm_edid_load.c | 13 +------------
>>   1 file changed, 1 insertion(+), 12 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_=
load.c
>> index ef4ab59d6935..5d9ef267ebb3 100644
>> --- a/drivers/gpu/drm/drm_edid_load.c
>> +++ b/drivers/gpu/drm/drm_edid_load.c
>> @@ -172,20 +172,9 @@ static const struct drm_edid *edid_load(struct drm_=
connector *connector, const c
>>   		fwdata =3D generic_edid[builtin];
>>   		fwsize =3D sizeof(generic_edid[builtin]);
>>   	} else {
>> -		struct platform_device *pdev;
>>   		int err;
>>=20=20=20
>> -		pdev =3D platform_device_register_simple(connector->name, -1, NULL, 0=
);
>> -		if (IS_ERR(pdev)) {
>> -			drm_err(connector->dev,
>> -				"[CONNECTOR:%d:%s] Failed to register EDID firmware platform device=
 for connector \"%s\"\n",
>> -				connector->base.id, connector->name,
>> -				connector->name);
>> -			return ERR_CAST(pdev);
>> -		}
>> -
>> -		err =3D request_firmware(&fw, name, &pdev->dev);
>> -		platform_device_unregister(pdev);
>> +		err =3D request_firmware(&fw, name, connector->dev->dev);
>>   		if (err) {
>>   			drm_err(connector->dev,
>>   				"[CONNECTOR:%d:%s] Requesting EDID firmware \"%s\" failed (err=3D%=
d)\n",

--=20
Jani Nikula, Intel Open Source Graphics Center
