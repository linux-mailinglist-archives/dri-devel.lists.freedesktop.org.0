Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EC24E9F05
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 20:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E904310E069;
	Mon, 28 Mar 2022 18:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308ED10E069;
 Mon, 28 Mar 2022 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648492524; x=1680028524;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/wk4ZM7GbD3St1mwGOgCitIXOyDKEPXbnLT1xfJ99fQ=;
 b=a+oaIHq54aFnS4vf5hOcxacuwJDaf/l6iZ2AHAGwjqrpXhCpOQsQsIDI
 yIxsep4Y4GKJF6RKqXcALPpMQKKYmqj9zwDiZcSt9g8kCEjNTMc6Pa1Mg
 snEy5LM1b97QZCtg8Zq4lirDHaCI9uex0DxTTUWgmlxFOnX0WT5Rwbsxy
 9PaeKLOWg3fTN9g/38XB+meTeiAiBT0nUG0yEZYt8BqYp08stQvEG2zlu
 apJH0o2gx72cTspjmD3q8IcfYtI04B8yd5BfR2lLSw5kepaXCNLWM/Ziv
 uSyopr4r0RDeffKtfV+x4YEhYcgkDwe8xIrOtigZoMIr5pTHsuYLdlelK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="322264167"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="322264167"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 11:35:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563897238"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 11:35:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 12/12] drm/edid: split drm_add_edid_modes() to two
In-Reply-To: <YkH02F/kGQSBQDi+@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648477901.git.jani.nikula@intel.com>
 <437c3c79f68d1144444fb2dd18a678f3aa97272c.1648477901.git.jani.nikula@intel.com>
 <YkH02F/kGQSBQDi+@intel.com>
Date: Mon, 28 Mar 2022 21:35:13 +0300
Message-ID: <878rsudixq.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Mar 28, 2022 at 05:34:33PM +0300, Jani Nikula wrote:
>> Reduce the size of the function that actually modifies the EDID.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 42 ++++++++++++++++++++++----------------
>>  1 file changed, 24 insertions(+), 18 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index d1abaa517867..d79b06f7f34c 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -5561,18 +5561,8 @@ static int add_displayid_detailed_modes(struct dr=
m_connector *connector,
>>  	return num_modes;
>>  }
>>=20=20
>> -/**
>> - * drm_add_edid_modes - add modes from EDID data, if available
>> - * @connector: connector we're probing
>> - * @edid: EDID data
>> - *
>> - * Add the specified modes to the connector's mode list. Also fills out=
 the
>> - * &drm_display_info structure and ELD in @connector with any informati=
on which
>> - * can be derived from the edid.
>> - *
>> - * Return: The number of modes added or 0 if we couldn't find any.
>> - */
>> -int drm_add_edid_modes(struct drm_connector *connector, struct edid *ed=
id)
>> +static int drm_edid_connector_update(struct drm_connector *connector,
>> +				     const struct edid *edid)
>>  {
>>  	int num_modes =3D 0;
>>  	u32 quirks;
>> @@ -5581,12 +5571,6 @@ int drm_add_edid_modes(struct drm_connector *conn=
ector, struct edid *edid)
>>  		clear_eld(connector);
>>  		return 0;
>>  	}
>> -	if (!drm_edid_is_valid(edid)) {
>> -		clear_eld(connector);
>> -		drm_warn(connector->dev, "%s: EDID invalid.\n",
>> -			 connector->name);
>> -		return 0;
>> -	}
>>=20=20
>>  	drm_edid_to_eld(connector, edid);
>>=20=20
>> @@ -5638,6 +5622,28 @@ int drm_add_edid_modes(struct drm_connector *conn=
ector, struct edid *edid)
>>=20=20
>>  	return num_modes;
>>  }
>> +
>> +/**
>> + * drm_add_edid_modes - add modes from EDID data, if available
>> + * @connector: connector we're probing
>> + * @edid: EDID data
>> + *
>> + * Add the specified modes to the connector's mode list. Also fills out=
 the
>> + * &drm_display_info structure and ELD in @connector with any informati=
on which
>> + * can be derived from the edid.
>> + *
>> + * Return: The number of modes added or 0 if we couldn't find any.
>> + */
>> +int drm_add_edid_modes(struct drm_connector *connector, struct edid *ed=
id)
>> +{
>> +	if (edid && !drm_edid_is_valid(edid)) {
>
> drm_edid_is_valid() is very poorly named since it can mutate the EDID.
> Also calling it here is kinda crazy instead of just validating when we
> originally read the EDID. But those are things for to be fixed later.

I'm trying to wrap my head around all this, but this might be the only
validation for override or firmware EDIDs. Which really should happen
much earlier. There's a lot of technical debt here.

Thanks for the review!

BR,
Jani.


>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
>> +		drm_warn(connector->dev, "%s: EDID invalid.\n",
>> +			 connector->name);
>> +		edid =3D NULL;
>> +	}
>> +
>> +	return drm_edid_connector_update(connector, edid);
>> +}
>>  EXPORT_SYMBOL(drm_add_edid_modes);
>>=20=20
>>  /**
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
