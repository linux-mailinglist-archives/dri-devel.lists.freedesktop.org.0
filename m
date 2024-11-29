Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D19DE6F4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7914310E17E;
	Fri, 29 Nov 2024 13:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/OozXmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AEB10E17E;
 Fri, 29 Nov 2024 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732885670; x=1764421670;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=49dxjDB/tmnNrlY5WUmvW+n7+3jGSA88yJhe3KI58Z4=;
 b=h/OozXmM0JQW2gNd4VSLxc5xANpDg4vnoils/LzE9IH2RzO1me6fqUp7
 ZN1Q/3QXhgFt2rfEt8/bHg6lnVoYMsbdYzuaG7HojCSmHI8LvsmZBakle
 ZdaX9NEYD5k5eFIjG3B8/G4L+WvYdkkEnXgZXiJs0kYWTQgO4skpvio7T
 BEJLKgKoZwGxvETZMV0AiYwZR9L5jjUJr8IMM4EUwGQI+EP3hGQPCQh9h
 HgaKU+rqmiOGrQi9oD/l0fVGYtLiFWjaLEf7IRgB9f/9FVNcT90TJDXk7
 KfbdCU57ShHdXIzORE9iykCVL0WZkXa0r6leQ+IJSvVpveduJjwSATX15 Q==;
X-CSE-ConnectionGUID: JImu2BdLTOOnblrJSCIGJw==
X-CSE-MsgGUID: 8Smoq4tCQ2uDM1Wi9FW9Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33175433"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="33175433"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 05:07:50 -0800
X-CSE-ConnectionGUID: vVRCUsPJSlWyOb1n/SZi+Q==
X-CSE-MsgGUID: Q39pckRRQk2U7VA3nTXX6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="96567334"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.241])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 05:07:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] drm/modes: Avoid divide by zero harder in
 drm_mode_vrefresh()
In-Reply-To: <09913faf-f70f-4deb-bc24-295796c8d0ca@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241129042629.18280-1-ville.syrjala@linux.intel.com>
 <20241129042629.18280-2-ville.syrjala@linux.intel.com>
 <09913faf-f70f-4deb-bc24-295796c8d0ca@intel.com>
Date: Fri, 29 Nov 2024 15:07:41 +0200
Message-ID: <87cyie6vdu.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Nov 2024, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> On 11/29/2024 9:56 AM, Ville Syrjala wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>
>> drm_mode_vrefresh() is trying to avoid divide by zero
>> by checking whether htotal or vtotal are zero. But we may
>> still end up with a div-by-zero of vtotal*htotal*...
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3D622bba18029bcde672e1
>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/drm_modes.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index 6ba167a33461..71573b85d924 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -1287,14 +1287,11 @@ EXPORT_SYMBOL(drm_mode_set_name);
>>    */
>>   int drm_mode_vrefresh(const struct drm_display_mode *mode)
>>   {
>> -	unsigned int num, den;
>> +	unsigned int num =3D 1, den =3D 1;
>>=20=20=20
>>   	if (mode->htotal =3D=3D 0 || mode->vtotal =3D=3D 0)
>>   		return 0;
>>=20=20=20
>> -	num =3D mode->clock;
>> -	den =3D mode->htotal * mode->vtotal;
>> -
>>   	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>>   		num *=3D 2;
>>   	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
>> @@ -1302,6 +1299,12 @@ int drm_mode_vrefresh(const struct drm_display_mo=
de *mode)
>>   	if (mode->vscan > 1)
>>   		den *=3D mode->vscan;
>>=20=20=20
>> +	if (check_mul_overflow(mode->clock, num, &num))
>> +		return 0;
>> +
>> +	if (check_mul_overflow(mode->htotal * mode->vtotal, den, &den))
>
> Can mode->htotal * mode->vtotal result in overflow?

u16 * u16 will always fit in an unsigned int (at least where the kernel
runs).

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> and we should add:
>
> if (check_mul_overflow(mode->htotal, mode->vtotal, &prod))
> 	return 0;
>
> Regards,
>
> Ankit
>
>> +		return 0;
>> +
>>   	return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
>>   }
>>   EXPORT_SYMBOL(drm_mode_vrefresh);

--=20
Jani Nikula, Intel
