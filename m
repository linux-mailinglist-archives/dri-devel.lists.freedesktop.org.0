Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A665210B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD73810E060;
	Tue, 20 Dec 2022 12:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A133D10E37D;
 Tue, 20 Dec 2022 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671540726; x=1703076726;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0QemDQkdDAKHXd2XIV9clIYkoZTj2G9T8h0dCYHeG1I=;
 b=DCjJm2i/OOxrjOuc1xqb3o10khWIH9DHq9x8zVDlsn1dtMtoSuBl+w7I
 m2jDosNlXROYsoS5j+o01cK+wWkUJM+R2emm1MZ8thFhq7p5P5sWtgw7j
 KQt9MkFj3e+N1FOBHsrpjkSqzv8ds+DbLeMWYZ1xz50rnhjdzxZprdkwS
 SZFAUIW9acSqq2YDymjoKDvEMcoB4syijrwNeT4bMLKkjqVXp0nm2mFZ3
 jkvFiu1XxiP/QtAFHaVNOLeQtPanbEgeqfw5T3Q/l3F+Ur8BVxjvbYmTV
 ZdmZ524eNqSBGm91DoUHF26QQQdv3gIfdIquyKtubKPMXtHeRhhzUuWoY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="346706639"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="346706639"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:52:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="793288095"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="793288095"
Received: from spalapa-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.249])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:52:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 06/12] drm/edid: refactor
 _drm_edid_connector_update() and rename
In-Reply-To: <Y6GsQXvDKPKsHf30@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1671206131.git.jani.nikula@intel.com>
 <f35102562feb9ca63462a902a582c3494fccde4d.1671206131.git.jani.nikula@intel.com>
 <Y6GsQXvDKPKsHf30@intel.com>
Date: Tue, 20 Dec 2022 14:52:01 +0200
Message-ID: <87wn6m2q6m.fsf@intel.com>
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

On Tue, 20 Dec 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Dec 16, 2022 at 06:00:20PM +0200, Jani Nikula wrote:
>> By moving update_display_info() out of _drm_edid_connector_update() we
>> make the function purely about adding modes.
>
> I don't think that's quite true. The 4:2:0 stuff still updates
> various display_info things from the mode parsing functions.

Right. I meant the top level. Will amend the commit message.

BR,
Jani.


>
>> Rename accordingly.
>>=20
>> Cc: Imre Deak <imre.deak@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 25 ++++++++++++-------------
>>  1 file changed, 12 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 15f69c362fc3..4ebfd7212bce 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6575,19 +6575,12 @@ static int add_displayid_detailed_modes(struct d=
rm_connector *connector,
>>  	return num_modes;
>>  }
>>=20=20
>> -static int _drm_edid_connector_update(struct drm_connector *connector,
>> -				      const struct drm_edid *drm_edid)
>> +static int _drm_edid_connector_add_modes(struct drm_connector *connecto=
r,
>> +					 const struct drm_edid *drm_edid)
>>  {
>>  	const struct drm_display_info *info =3D &connector->display_info;
>>  	int num_modes =3D 0;
>>=20=20
>> -	/*
>> -	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
>> -	 * To avoid multiple parsing of same block, lets parse that map
>> -	 * from sink info, before parsing CEA modes.
>> -	 */
>> -	update_display_info(connector, drm_edid);
>> -
>>  	if (!drm_edid)
>>  		return 0;
>>=20=20
>> @@ -6692,7 +6685,9 @@ int drm_edid_connector_update(struct drm_connector=
 *connector,
>>  {
>>  	int count;
>>=20=20
>> -	count =3D _drm_edid_connector_update(connector, drm_edid);
>> +	update_display_info(connector, drm_edid);
>> +
>> +	count =3D _drm_edid_connector_add_modes(connector, drm_edid);
>>=20=20
>>  	_drm_update_tile_info(connector, drm_edid);
>>=20=20
>> @@ -6762,7 +6757,8 @@ EXPORT_SYMBOL(drm_connector_update_edid_property);
>>   */
>>  int drm_add_edid_modes(struct drm_connector *connector, struct edid *ed=
id)
>>  {
>> -	struct drm_edid drm_edid;
>> +	struct drm_edid _drm_edid;
>> +	const struct drm_edid *drm_edid;
>>=20=20
>>  	if (edid && !drm_edid_is_valid(edid)) {
>>  		drm_warn(connector->dev, "[CONNECTOR:%d:%s] EDID invalid.\n",
>> @@ -6770,8 +6766,11 @@ int drm_add_edid_modes(struct drm_connector *conn=
ector, struct edid *edid)
>>  		edid =3D NULL;
>>  	}
>>=20=20
>> -	return _drm_edid_connector_update(connector,
>> -					  drm_edid_legacy_init(&drm_edid, edid));
>> +	drm_edid =3D drm_edid_legacy_init(&_drm_edid, edid);
>> +
>> +	update_display_info(connector, drm_edid);
>> +
>> +	return _drm_edid_connector_add_modes(connector, drm_edid);
>>  }
>>  EXPORT_SYMBOL(drm_add_edid_modes);
>>=20=20
>> --=20
>> 2.34.1

--=20
Jani Nikula, Intel Open Source Graphics Center
