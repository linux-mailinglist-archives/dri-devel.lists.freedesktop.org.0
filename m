Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025A34BF4A1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 10:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A87110E71B;
	Tue, 22 Feb 2022 09:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F8C10E713
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645521932; x=1677057932;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ptReJQaCxW9thJSusiIPCM2n+ua6zR69qm7iSpPweb4=;
 b=A5Q2mdJjqVx/W4E6rTkivSnSs7EHjJpuMaJFEv6KiesdF/sG1GWHXX0w
 b/W1owDNtlv5Ts9jcASzru6CtQVGUj1sD33v0oJGub8240RcDp9tJIv+K
 cYPY2vv8RkKl4sROTzk3wmD9u5cSjADVlHsiqcnirF3XraQEdluUV8VVz
 Wol52lGgy6QhvLWH/3sSdS1Wt8dVwKJXk6jfCsgCs1uXaLRRdMkrxG+W1
 JQOKCJsYJN0sFQCeMz23vf0ZrQx8/v025pKzBFF+5oByRVppr+4TBR13l
 j2XrVWjg7r3YUOC//+qR82h8LfjvN4noYe0QImPiILSYYHCK1PjdCa3VM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="276250158"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="276250158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 01:19:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="547657683"
Received: from torta-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.49.14])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 01:19:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Lee Shawn C
 <shawn.c.lee@intel.com>
Subject: Re: [PATCH 1/3] drm/edid: parse multiple CEA extension block
In-Reply-To: <YhSQgtQp7Ou2WqNB@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220222063819.5279-1-shawn.c.lee@intel.com>
 <YhSQgtQp7Ou2WqNB@intel.com>
Date: Tue, 22 Feb 2022 11:19:15 +0200
Message-ID: <87czjf8dik.fsf@intel.com>
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Feb 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Feb 22, 2022 at 02:38:17PM +0800, Lee Shawn C wrote:
>> Try to find and parse more CEA ext blocks if edid->extensions
>> is greater than one.
>>=20
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 75 +++++++++++++++++++++++---------------
>>  1 file changed, 45 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 12893e7be89b..3d5dbbeca7f9 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4313,43 +4313,58 @@ add_cea_modes(struct drm_connector *connector, s=
truct edid *edid)
>>  	const u8 *cea =3D drm_find_cea_extension(edid);
>>  	const u8 *db, *hdmi =3D NULL, *video =3D NULL;
>>  	u8 dbl, hdmi_len, video_len =3D 0;
>> -	int modes =3D 0;
>> +	int modes =3D 0, j;
>>=20=20
>> -	if (cea && cea_revision(cea) >=3D 3) {
>> -		int i, start, end;
>> +	if (!cea)
>> +		return 0;
>>=20=20
>> -		if (cea_db_offsets(cea, &start, &end))
>> -			return 0;
>> +	for (j =3D (cea - (u8 *)edid) / EDID_LENGTH; j <=3D edid->extensions;)=
 {
>
> That looks rather illegible. I think we want a
> drm_find_cea_extension(const struct edid *edid, int *ext_index)
> and then just loop until it stops giving us stuff.

Neither approach takes multiple CEA blocks within DisplayID extension
into account. Or some blocks outside and some inside DisplayID
extension.

I think we're going to need abstracted EDID iteration similar to what
I've done for DisplayID iteration. We can't have all places
reimplementing the iteration like we have now.

BR,
Jani.

>
> There are also several other callers of drm_find_cea_extension().
> Why don't they require the same treatment?
>
>> +		if (cea && cea_revision(cea) >=3D 3) {
>> +			int i, start, end;
>>=20=20
>> -		for_each_cea_db(cea, i, start, end) {
>> -			db =3D &cea[i];
>> -			dbl =3D cea_db_payload_len(db);
>> +			if (cea_db_offsets(cea, &start, &end))
>> +				continue;
>>=20=20
>> -			if (cea_db_tag(db) =3D=3D VIDEO_BLOCK) {
>> -				video =3D db + 1;
>> -				video_len =3D dbl;
>> -				modes +=3D do_cea_modes(connector, video, dbl);
>> -			} else if (cea_db_is_hdmi_vsdb(db)) {
>> -				hdmi =3D db;
>> -				hdmi_len =3D dbl;
>> -			} else if (cea_db_is_y420vdb(db)) {
>> -				const u8 *vdb420 =3D &db[2];
>> -
>> -				/* Add 4:2:0(only) modes present in EDID */
>> -				modes +=3D do_y420vdb_modes(connector,
>> -							  vdb420,
>> -							  dbl - 1);
>> +			for_each_cea_db(cea, i, start, end) {
>> +				db =3D &cea[i];
>> +				dbl =3D cea_db_payload_len(db);
>> +
>> +				if (cea_db_tag(db) =3D=3D VIDEO_BLOCK) {
>> +					video =3D db + 1;
>> +					video_len =3D dbl;
>> +					modes +=3D do_cea_modes(connector, video, dbl);
>> +				} else if (cea_db_is_hdmi_vsdb(db)) {
>> +					hdmi =3D db;
>> +					hdmi_len =3D dbl;
>> +				} else if (cea_db_is_y420vdb(db)) {
>> +					const u8 *vdb420 =3D &db[2];
>> +
>> +					/* Add 4:2:0(only) modes present in EDID */
>> +					modes +=3D do_y420vdb_modes(connector,
>> +								  vdb420,
>> +								  dbl - 1);
>> +				}
>>  			}
>>  		}
>> -	}
>>=20=20
>> -	/*
>> -	 * We parse the HDMI VSDB after having added the cea modes as we will
>> -	 * be patching their flags when the sink supports stereo 3D.
>> -	 */
>> -	if (hdmi)
>> -		modes +=3D do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
>> -					    video_len);
>> +		/*
>> +		 * We parse the HDMI VSDB after having added the cea modes as we will
>> +		 * be patching their flags when the sink supports stereo 3D.
>> +		 */
>> +		if (hdmi) {
>> +			modes +=3D do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
>> +						    video_len);
>> +			hdmi  =3D NULL;
>> +			video =3D NULL;
>> +			hdmi_len =3D 0;
>> +			video_len =3D 0;
>> +		}
>> +
>> +		/* move to next CEA extension block */
>> +		cea =3D drm_find_edid_extension(edid, CEA_EXT, &j);
>> +		if (!cea)
>> +			break;
>> +	}
>>=20=20
>>  	return modes;
>>  }
>> --=20
>> 2.17.1

--=20
Jani Nikula, Intel Open Source Graphics Center
