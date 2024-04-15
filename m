Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BD48A4FCE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6CC112542;
	Mon, 15 Apr 2024 12:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ygr+W3JA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFAE112542;
 Mon, 15 Apr 2024 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713185687; x=1744721687;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=WwDrSL3LVEw9S2ABgJBx3HlVFLcIKrqCSEi0SLj5CHk=;
 b=Ygr+W3JAm46103NevjobLuJSD5KzX2CF1jaDWyb6ISsvsUXtDL3HBiIl
 m5Fhi8FpGAiN0eydEe8DovjD5Bx2jEF+EEV6sBbhbIQB3N0rjnqCQIj05
 65Jow9Webt+AUJ3npC0gO9OmCLCBgCLXBkV/rgkBUSYNw35XXpe+PRPQH
 ux8UmTshNk3mK6BAtNml846MNWgDCG1fBr9yRnoK7QqTG88+lfe9wiMZW
 kBvDjjXZcIwHoTRSk5RfgeP82SEL8AXzH6NoO2KIdfhH6Ffv/1i8opbSC
 3X2a4vQQhE8SHEenkCy5B4eNPhG04D4hFohbXLnBgXu0nSeE90u59XQwX A==;
X-CSE-ConnectionGUID: Qt6BcWxXTCKHZg4h8qNoZQ==
X-CSE-MsgGUID: eJkyiNnZSeKTmVt3cFkGlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="9122865"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="9122865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 05:54:46 -0700
X-CSE-ConnectionGUID: c6Bky+7YSqSketutVa43Pg==
X-CSE-MsgGUID: H6cCeZERRZy5uXSHk+Ku0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22375747"
Received: from lcariou-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.121])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 05:54:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 3/4] drm/i915/bios: switch to struct drm_edid and
 struct drm_edid_product_id
In-Reply-To: <ZhVhf0snHrjPKZEi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1712655867.git.jani.nikula@intel.com>
 <ec5148dd43221b32cb2066bc7fd264a069c1188b.1712655867.git.jani.nikula@intel.com>
 <ZhVhf0snHrjPKZEi@intel.com>
Date: Mon, 15 Apr 2024 15:54:33 +0300
Message-ID: <87edb63hx2.fsf@intel.com>
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

On Tue, 09 Apr 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Apr 09, 2024 at 12:46:11PM +0300, Jani Nikula wrote:
>> To avoid accessing and parsing the raw EDID with drm_edid_raw(), switch
>> to the struct drm_edid based function to extract product id, and use the
>> drm printer function to debug log it.
>>=20
>> The underlying assumption is that struct drm_edid_product_id and struct
>> lvds_pnp_id describe identical data, albeit with slightly different
>> member definitions.
>>=20
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Acked-by: Melissa Wen <mwen@igalia.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_bios.c | 43 ++++++++++-------------
>>  1 file changed, 18 insertions(+), 25 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm=
/i915/display/intel_bios.c
>> index 2abd2d7ceda2..3d89e4b39fed 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -600,6 +600,9 @@ get_lvds_pnp_id(const struct bdb_lvds_lfp_data *data,
>>  		const struct bdb_lvds_lfp_data_ptrs *ptrs,
>>  		int index)
>>  {
>> +	/* These two are supposed to have the same layout in memory. */
>> +	BUILD_BUG_ON(sizeof(struct lvds_pnp_id) !=3D sizeof(struct drm_edid_pr=
oduct_id));
>> +
>>  	return (const void *)data + ptrs->ptr[index].panel_pnp_id.offset;
>>  }
>>=20=20
>> @@ -613,19 +616,6 @@ get_lfp_data_tail(const struct bdb_lvds_lfp_data *d=
ata,
>>  		return NULL;
>>  }
>>=20=20
>> -static void dump_pnp_id(struct drm_i915_private *i915,
>> -			const struct lvds_pnp_id *pnp_id,
>> -			const char *name)
>> -{
>> -	u16 mfg_name =3D be16_to_cpu((__force __be16)pnp_id->mfg_name);
>> -	char vend[4];
>> -
>> -	drm_dbg_kms(&i915->drm, "%s PNPID mfg: %s (0x%x), prod: %u, serial: %u=
, week: %d, year: %d\n",
>> -		    name, drm_edid_decode_mfg_id(mfg_name, vend),
>> -		    pnp_id->mfg_name, pnp_id->product_code, pnp_id->serial,
>> -		    pnp_id->mfg_week, pnp_id->mfg_year + 1990);
>> -}
>> -
>>  static int opregion_get_panel_type(struct drm_i915_private *i915,
>>  				   const struct intel_bios_encoder_data *devdata,
>>  				   const struct drm_edid *drm_edid, bool use_fallback)
>> @@ -664,21 +654,21 @@ static int pnpid_get_panel_type(struct drm_i915_pr=
ivate *i915,
>>  {
>>  	const struct bdb_lvds_lfp_data *data;
>>  	const struct bdb_lvds_lfp_data_ptrs *ptrs;
>> -	const struct lvds_pnp_id *edid_id;
>> -	struct lvds_pnp_id edid_id_nodate;
>> -	const struct edid *edid =3D drm_edid_raw(drm_edid); /* FIXME */
>> +	struct drm_edid_product_id product_id, product_id_nodate;
>> +	struct drm_printer p;
>>  	int i, best =3D -1;
>>=20=20
>> -	if (!edid)
>> +	if (!drm_edid)
>>  		return -1;
>>=20=20
>> -	edid_id =3D (const void *)&edid->mfg_id[0];
>> +	drm_edid_get_product_id(drm_edid, &product_id);
>
> I don't really like s/edid_id/product_id/ rename.
> The variable names were trying to convey the source of
> the data (EDID vs. VBT).
>
> But not a huge deal wither way. Series is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed the lot to drm-misc-next.

BR,
Jani.


--=20
Jani Nikula, Intel
