Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB14C80CAFC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 14:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2D510E10E;
	Mon, 11 Dec 2023 13:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D43A10E051;
 Mon, 11 Dec 2023 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702301289; x=1733837289;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wSWycREeIH2yUgdl0B6zT1fgxOfBJPGGgpeEBNkOR80=;
 b=BcN51iOlyczh93m3c3jvqB1seAfRXnNisuvIRWVvZ/MdA/UswfWOnA4F
 II4yWgEPCGLxiHVkc5dAJghsv4aTWqtg6t2fCWbsxV0Cdlkse7B0EwKTM
 oeGra94rfWisFnTERsdYFk6/VAN2w2s8OUTqh54qbzJ5zO2zl2+IOoIeO
 u9Xq2FcCCBJCYQ+QHlP3JW83Gphm1xFY6smoJ442UFDMQJnoRUTHwJ1r+
 NuS6WClnd4cESFOiPKOApouh3HnMo6xcxjq5duhfd6+WmUn/yaGbRFo/G
 bUs78reHkHilmPGM+9erLMTplMfAYOjsnkbOPV5Fx1r/3oDGEXU+WfowA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1714644"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1714644"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:28:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="946323337"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="946323337"
Received: from kbalak2x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.68])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:28:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/edid: also call add modes in EDID
 connector update fallback
In-Reply-To: <ZXNfu6zcBy3JvbGd@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231207093821.2654267-1-jani.nikula@intel.com>
 <ZXNfu6zcBy3JvbGd@intel.com>
Date: Mon, 11 Dec 2023 15:28:03 +0200
Message-ID: <87edfsyil8.fsf@intel.com>
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
Cc: bbaa <bbaa@bbaa.fun>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Dec 2023, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Dec 07, 2023 at 11:38:21AM +0200, Jani Nikula wrote:
>> When the separate add modes call was added back in commit c533b5167c7e
>> ("drm/edid: add separate drm_edid_connector_add_modes()"), it failed to
>> address drm_edid_override_connector_update(). Also call add modes there.
>>=20
>> Reported-by: bbaa <bbaa@bbaa.fun>
>> Closes: https://lore.kernel.org/r/930E9B4C7D91FDFF+29b34d89-8658-4910-96=
6a-c772f320ea03@bbaa.fun
>> Fixes: c533b5167c7e ("drm/edid: add separate drm_edid_connector_add_mode=
s()")
>> Cc: <stable@vger.kernel.org> # v6.3+
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed to drm-misc-fixes.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index cb4031d5dcbb..69c68804023f 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -2311,7 +2311,8 @@ int drm_edid_override_connector_update(struct drm_=
connector *connector)
>>=20=20
>>  	override =3D drm_edid_override_get(connector);
>>  	if (override) {
>> -		num_modes =3D drm_edid_connector_update(connector, override);
>> +		if (drm_edid_connector_update(connector, override) =3D=3D 0)
>> +			num_modes =3D drm_edid_connector_add_modes(connector);
>>=20=20
>>  		drm_edid_free(override);
>>=20=20
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
