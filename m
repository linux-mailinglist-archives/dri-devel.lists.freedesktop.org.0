Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B774E5788
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 18:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47A010E11F;
	Wed, 23 Mar 2022 17:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FED010E0E9;
 Wed, 23 Mar 2022 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648056727; x=1679592727;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mV2DAlwhb/5qQHufYQwBshFE+0EE7QDFgtz8YfV4P24=;
 b=ehNWlY98Tm3omnqErsWcd0KSHz6HkyU6VI4nR0zb5NUq83fITM45vUA0
 Ysc/D5X/M2UKDM09sN3L0nMsHuExHux15BXq3oL9NYChoOkDKoa1x5uzD
 /cEZclvtmmUH/z9HztAo2Hur7YfB0BhiBfmyW1YaKlQT4MNZ5dj/5pTV1
 BNEvFeDhTnCjJyBaY7tsWbGLEZUQ0QCFJQVrJ7j9cubV/bvEdrb0F2m5K
 ozIq3jaHpyaXA1xGe8/FX8Etvl5SkNGiSluZg0apshIrizWPe3k0qosO2
 GSG3C8XMny0vRV5KfSFHE78nV5X7bhV5lF5KDrNmNIihX4S9y2xLIxcmv Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="240343394"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="240343394"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 10:26:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="544289994"
Received: from caliyanx-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.57.47])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 10:26:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 06/19] drm/edid: clean up cea_db_is_*() functions
In-Reply-To: <YjtANOJjTC4Q4T3m@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1647985054.git.jani.nikula@intel.com>
 <a9b83af4adfbc10296933958a057dddbb42bf769.1647985054.git.jani.nikula@intel.com>
 <YjtANOJjTC4Q4T3m@intel.com>
Date: Wed, 23 Mar 2022 19:26:16 +0200
Message-ID: <87czicinrb.fsf@intel.com>
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

On Wed, 23 Mar 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Mar 22, 2022 at 11:40:35PM +0200, Jani Nikula wrote:
>> Abstract helpers for matching vendor data blocks and extended tags, and
>> use them to simplify all the cea_db_is_*() functions.
>>=20
>> Take void pointer as parameter to allow transitional use for both u8 *
>> and struct cea_db *.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 113 ++++++++++++-------------------------
>>  1 file changed, 37 insertions(+), 76 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index c12c3cbab274..a0a5a7271658 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4196,12 +4196,6 @@ do_hdmi_vsdb_modes(struct drm_connector *connecto=
r, const u8 *db, u8 len,
>>  	return modes;
>>  }
>>=20=20
>> -static int
>> -cea_db_extended_tag(const u8 *db)
>> -{
>> -	return db[1];
>> -}
>> -
>>  static int
>>  cea_revision(const u8 *cea)
>>  {
>> @@ -4313,6 +4307,22 @@ static const void *cea_db_data(const struct cea_d=
b *db)
>>  	return db->data;
>>  }
>>=20=20
>> +static bool cea_db_is_extended_tag(const struct cea_db *db, int tag)
>> +{
>> +	return (cea_db_tag(db) =3D=3D CEA_DB_EXTENDED_TAG &&
>> +		cea_db_payload_len(db) >=3D 1 &&
>> +		db->data[0] =3D=3D tag);
>> +}
>
> nit: not a huge fan of the redundant parens in all of these

I guess that's something I've picked up from Python, makes the
subsequent lines align nicely. Otherwise it's less pretty.

>
>> +
>> +static bool cea_db_is_vendor(const struct cea_db *db, int vendor_oui)
>
> I'd probably make the tag/oui unsigned.

Only chose int because the oui() function returns an int; maybe that
should eventually be turned into unsigned int.

>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
>> +{
>> +	const u8 *data =3D cea_db_data(db);
>> +
>> +	return (cea_db_tag(db) =3D=3D CEA_DB_VENDOR &&
>> +		cea_db_payload_len(db) >=3D 3 &&
>> +		oui(data[2], data[1], data[0]) =3D=3D vendor_oui);
>> +}
>> +
>>  static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_=
db_iter *iter)
>>  {
>>  	memset(iter, 0, sizeof(*iter));
>> @@ -4443,79 +4453,44 @@ static void cea_db_iter_end(struct cea_db_iter *=
iter)
>>  	memset(iter, 0, sizeof(*iter));
>>  }
>>=20=20
>> -static bool cea_db_is_hdmi_vsdb(const u8 *db)
>> +static bool cea_db_is_hdmi_vsdb(const void *db)
>>  {
>> -	if (cea_db_tag(db) !=3D CEA_DB_VENDOR)
>> -		return false;
>> -
>> -	if (cea_db_payload_len(db) < 5)
>> -		return false;
>> -
>> -	return oui(db[3], db[2], db[1]) =3D=3D HDMI_IEEE_OUI;
>> +	return (cea_db_is_vendor(db, HDMI_IEEE_OUI) &&
>> +		cea_db_payload_len(db) >=3D 5);
>>  }
>>=20=20
>> -static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
>> +static bool cea_db_is_hdmi_forum_vsdb(const void *db)
>>  {
>> -	if (cea_db_tag(db) !=3D CEA_DB_VENDOR)
>> -		return false;
>> -
>> -	if (cea_db_payload_len(db) < 7)
>> -		return false;
>> -
>> -	return oui(db[3], db[2], db[1]) =3D=3D HDMI_FORUM_IEEE_OUI;
>> +	return (cea_db_is_vendor(db, HDMI_FORUM_IEEE_OUI) &&
>> +		cea_db_payload_len(db) >=3D 7);
>>  }
>>=20=20
>> -static bool cea_db_is_microsoft_vsdb(const u8 *db)
>> +static bool cea_db_is_microsoft_vsdb(const void *db)
>>  {
>> -	if (cea_db_tag(db) !=3D CEA_DB_VENDOR)
>> -		return false;
>> -
>> -	if (cea_db_payload_len(db) !=3D 21)
>> -		return false;
>> -
>> -	return oui(db[3], db[2], db[1]) =3D=3D MICROSOFT_IEEE_OUI;
>> +	return (cea_db_is_vendor(db, MICROSOFT_IEEE_OUI) &&
>> +		cea_db_payload_len(db) =3D=3D 21);
>>  }
>>=20=20
>> -static bool cea_db_is_vcdb(const u8 *db)
>> +static bool cea_db_is_vcdb(const void *db)
>>  {
>> -	if (cea_db_tag(db) !=3D CEA_DB_EXTENDED_TAG)
>> -		return false;
>> -
>> -	if (cea_db_payload_len(db) !=3D 2)
>> -		return false;
>> -
>> -	if (cea_db_extended_tag(db) !=3D CEA_EXT_DB_VIDEO_CAP)
>> -		return false;
>> -
>> -	return true;
>> +	return (cea_db_is_extended_tag(db, CEA_EXT_DB_VIDEO_CAP) &&
>> +		cea_db_payload_len(db) =3D=3D 2);
>>  }
>>=20=20
>> -static bool cea_db_is_y420cmdb(const u8 *db)
>> +static bool cea_db_is_y420cmdb(const void *db)
>>  {
>> -	if (cea_db_tag(db) !=3D CEA_DB_EXTENDED_TAG)
>> -		return false;
>> -
>> -	if (!cea_db_payload_len(db))
>> -		return false;
>> -
>> -	if (cea_db_extended_tag(db) !=3D CEA_EXT_DB_420_VIDEO_CAP_MAP)
>> -		return false;
>> -
>> -	return true;
>> +	return cea_db_is_extended_tag(db, CEA_EXT_DB_420_VIDEO_CAP_MAP);
>>  }
>>=20=20
>> -static bool cea_db_is_y420vdb(const u8 *db)
>> +static bool cea_db_is_y420vdb(const void *db)
>>  {
>> -	if (cea_db_tag(db) !=3D CEA_DB_EXTENDED_TAG)
>> -		return false;
>> -
>> -	if (!cea_db_payload_len(db))
>> -		return false;
>> -
>> -	if (cea_db_extended_tag(db) !=3D CEA_EXT_DB_420_VIDEO_DATA)
>> -		return false;
>> +	return cea_db_is_extended_tag(db, CEA_EXT_DB_420_VIDEO_DATA);
>> +}
>>=20=20
>> -	return true;
>> +static bool cea_db_is_hdmi_hdr_metadata_block(const void *db)
>> +{
>> +	return (cea_db_is_extended_tag(db, CEA_EXT_DB_HDR_STATIC_METADATA) &&
>> +		cea_db_payload_len(db) >=3D 3);
>>  }
>>=20=20
>>  #define for_each_cea_db(cea, i, start, end) \
>> @@ -4651,20 +4626,6 @@ static void fixup_detailed_cea_mode_clock(struct =
drm_display_mode *mode)
>>  	mode->clock =3D clock;
>>  }
>>=20=20
>> -static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
>> -{
>> -	if (cea_db_tag(db) !=3D CEA_DB_EXTENDED_TAG)
>> -		return false;
>> -
>> -	if (db[1] !=3D CEA_EXT_DB_HDR_STATIC_METADATA)
>> -		return false;
>> -
>> -	if (cea_db_payload_len(db) < 3)
>> -		return false;
>> -
>> -	return true;
>> -}
>> -
>>  static uint8_t eotf_supported(const u8 *edid_ext)
>>  {
>>  	return edid_ext[2] &
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
