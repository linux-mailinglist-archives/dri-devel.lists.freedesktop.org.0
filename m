Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AC69064B7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 09:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99FE10E967;
	Thu, 13 Jun 2024 07:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFd1Td4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E18810E967
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718262939; x=1749798939;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=86SiUaK7umXo0q9XlMNvDC0EA+anrmucsKIX31UwYqg=;
 b=FFd1Td4Tkz0bQj5rCKrzVtTeCjqP40mJV7jhQVcCrpY9by8t/J4mvBMc
 a3N+5Ebrpo84Ne+qoj0mm2UxPrG1VTW20LYsDFlDtcCpcwQKOrdYjPSTH
 Z+ua1IPvA7Xt6cRIjZFlOsw84krcd5ph6zKUWCyPPUqEVdmac1PAlfGZ2
 SylIpIeHf9R0+t7qafbWvU4RUgJ+FUDUUbz//Il3iZGZVh2vC4RhJ1I06
 cSewEet7f4kicJirVfCMigqunN/eLBMq0muzIU/KmP/4/2K9O3ESJ+5u7
 jYKJkDesbwD8Wj5ReAeEsCNMRwRPeWP6INco7dhpAG6asGEQIh+AF13Ku g==;
X-CSE-ConnectionGUID: pjjVvVLpSVq3r6IOvskWOQ==
X-CSE-MsgGUID: kr5lWhYiT2G+/XpmrMx99w==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26465961"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="26465961"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 00:15:28 -0700
X-CSE-ConnectionGUID: P844oO/hQ6eUOKxjKr+nYg==
X-CSE-MsgGUID: FY0jzUReTNKGmfdBWQP2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="71251354"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 00:15:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Inki Dae <daeinki@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 04/11] drm/exynos: hdmi: convert to struct drm_edid
In-Reply-To: <CAAQKjZNhUzyUO4rjPZGGrp=0MsTdQvT2ij3bVV91oDcYjk9EDg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715691257.git.jani.nikula@intel.com>
 <2fe0b4deb4f2ab255735cd6e1a657a17e0d45784.1715691257.git.jani.nikula@intel.com>
 <CAAQKjZNhUzyUO4rjPZGGrp=0MsTdQvT2ij3bVV91oDcYjk9EDg@mail.gmail.com>
Date: Thu, 13 Jun 2024 10:15:20 +0300
Message-ID: <87wmmtia9j.fsf@intel.com>
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

On Mon, 10 Jun 2024, Inki Dae <daeinki@gmail.com> wrote:
> Hi, Jani Nikula,
>
> Thanks for your contribution and sorry for being late. Below are my comme=
nts.
>
> 2024=EB=85=84 5=EC=9B=94 14=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:57,=
 Jani Nikula <jani.nikula@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>
>> Prefer the struct drm_edid based functions for reading the EDID and
>> updating the connector.
>>
>> The functional change is that the CEC physical address gets invalidated
>> when the EDID could not be read.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> ---
>>
>> Cc: Inki Dae <inki.dae@samsung.com>
>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Alim Akhtar <alim.akhtar@samsung.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-samsung-soc@vger.kernel.org
>> ---
>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 23 +++++++++++++----------
>>  1 file changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyn=
os/exynos_hdmi.c
>> index e968824a4c72..9033e8b66816 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -883,27 +883,30 @@ static const struct drm_connector_funcs hdmi_conne=
ctor_funcs =3D {
>>  static int hdmi_get_modes(struct drm_connector *connector)
>>  {
>>         struct hdmi_context *hdata =3D connector_to_hdmi(connector);
>> -       struct edid *edid;
>> +       const struct drm_display_info *info =3D &connector->display_info;
>> +       const struct drm_edid *drm_edid;
>>         int ret;
>>
>>         if (!hdata->ddc_adpt)
>>                 return 0;
>>
>> -       edid =3D drm_get_edid(connector, hdata->ddc_adpt);
>> -       if (!edid)
>> +       drm_edid =3D drm_edid_read_ddc(connector, hdata->ddc_adpt);
>
> drm_edid_read_ddc function can return NULL for an error. Could you add
> an exception handling?

If it returns NULL, the below code intentionally passes NULL to
drm_edid_connector_update() to reset the EDID. After that,
cec_notifier_set_phys_addr() also resets the source physical
address. And !drm_edid is handled after that.

>
>> +
>> +       drm_edid_connector_update(connector, drm_edid);
>
> Ditto. drm_edid_connector_update function can return a negative value
> for an error.

Okay.cg

>
>> +
>> +       cec_notifier_set_phys_addr(hdata->notifier, info->source_physica=
l_address);
>> +
>> +       if (!drm_edid)
>>                 return 0;
>>
>> -       hdata->dvi_mode =3D !connector->display_info.is_hdmi;
>> +       hdata->dvi_mode =3D !info->is_hdmi;
>
> Above change wouldn't be related to this patch.

Yeah, reuses info which is for info->source_physical_address which would
be too long otherwise. Can add another intermediate patch for that.

>
>>         DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>>                           (hdata->dvi_mode ? "dvi monitor" : "hdmi monit=
or"),
>> -                         edid->width_cm, edid->height_cm);
>> -
>> -       drm_connector_update_edid_property(connector, edid);
>> -       cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
>> +                         info->width_mm / 10, info->height_mm / 10);
>
> The purpose of this patch would be to replace edid with drm_edid so
> how about updating the above change like below?
>     drm_edid->edid->width_cm, erm_edid->edid->height_cm);

struct drm_edid is an opaque type and drm_edid->edid is not available
for drivers to look at.

BR,
Jani.

>
> Thanks,
> Inki Dae
>
>>
>> -       ret =3D drm_add_edid_modes(connector, edid);
>> +       ret =3D drm_edid_connector_add_modes(connector);
>>
>> -       kfree(edid);
>> +       drm_edid_free(drm_edid);
>>
>>         return ret;
>>  }
>> --
>> 2.39.2
>>
>>

--=20
Jani Nikula, Intel
