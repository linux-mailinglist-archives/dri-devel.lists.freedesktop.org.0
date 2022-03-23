Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008744E550D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD50C10E04E;
	Wed, 23 Mar 2022 15:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F08610E76D;
 Wed, 23 Mar 2022 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648048797; x=1679584797;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=SMBdZmZ570mnLhiMI9IlFDQAXa8938kaiujy1I1l7bs=;
 b=Xc83UlYlZS9vbqD7XLQvaNOqapKpqVj6oUn2CBSjQ058CmFVqJs0R6xt
 uETo9byq62eu7XQL0qOedht8ncg9wFEjb/6MtdyzvqVfuVt6XSQTRC3WX
 6Hf3KujQumSplfFWEgOCWkE5LCOcdsEd7BDR605cOLzWgBpK1hbOHDLaa
 r5D1cGP6VP+0J0UYqTdd0rKPxNQ7WuEj96woSvozTu85Wo1bL9stSx3k2
 gvzZUUq6eGyEMej5WoNdAe8Hf6JI/neaO3lQPi9pYaxMdiBmBO1Un61bA
 ebDt+aO62RqkmydbXFYw2BfMZWRsWW1tnuXyeKkF3sZKSTmG3Vs6z5jdc A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="240295860"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="240295860"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 08:19:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="544231903"
Received: from caliyanx-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.57.47])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 08:19:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/edid: fix CEA extension byte #3 parsing
In-Reply-To: <Yjs4E5gl3KZoUOBR@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220323100438.1757295-1-jani.nikula@intel.com>
 <Yjs4E5gl3KZoUOBR@intel.com>
Date: Wed, 23 Mar 2022 17:19:52 +0200
Message-ID: <87fsn8itlz.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Shawn C Lee <shawn.c.lee@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Mar 23, 2022 at 12:04:38PM +0200, Jani Nikula wrote:
>> Only an EDID CEA extension has byte #3, while the CTA DisplayID Data
>> Block does not. Don't interpret bogus data for color formats.
>
> I think what we might want eventually is a cleaner split between
> the CTA data blocks vs. the rest of the EDID CTA ext block. Only
> the former is relevant for DisplayID.

Well, I just abstracted it all away in the CEA data block iteration
series [1].

It'll be possible to add a different iteration initializer depending on
what you want to iterate and where.

BR,
Jani.


>
> But for a bugfix we want to keep it simple.
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
>>=20
>> For most displays it's probably an unlikely scenario you'd have a CTA
>> DisplayID Data Block without a CEA extension, but they do exist.
>>=20
>> Fixes: e28ad544f462 ("drm/edid: parse CEA blocks embedded in DisplayID")
>> Cc: <stable@vger.kernel.org> # v4.15
>> Cc: Shawn C Lee <shawn.c.lee@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> ---
>>=20
>> commit e28ad544f462 was merged in v5.3, but it has Cc: stable for v4.15.
>>=20
>> This is also fixed in my CEA data block iteration series [1], but we'll
>> want the simple fix for stable first.
>>=20
>> Hum, CTA is formerly CEA, I and the code seem to use both, should we use
>> only one or the other?
>
> And before CEA it was called EIA (IIRC). Dunno if we also use that name
> somewhere.
>
> If someone cares enough I guess we could rename everything to "cta".
>
>>=20
>> [1] https://patchwork.freedesktop.org/series/101659/
>> ---
>>  drivers/gpu/drm/drm_edid.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 561f53831e29..ccf7031a6797 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -5187,10 +5187,14 @@ static void drm_parse_cea_ext(struct drm_connect=
or *connector,
>>=20=20
>>  	/* The existence of a CEA block should imply RGB support */
>>  	info->color_formats =3D DRM_COLOR_FORMAT_RGB444;
>> -	if (edid_ext[3] & EDID_CEA_YCRCB444)
>> -		info->color_formats |=3D DRM_COLOR_FORMAT_YCBCR444;
>> -	if (edid_ext[3] & EDID_CEA_YCRCB422)
>> -		info->color_formats |=3D DRM_COLOR_FORMAT_YCBCR422;
>> +
>> +	/* CTA DisplayID Data Block does not have byte #3 */
>> +	if (edid_ext[0] =3D=3D CEA_EXT) {
>> +		if (edid_ext[3] & EDID_CEA_YCRCB444)
>> +			info->color_formats |=3D DRM_COLOR_FORMAT_YCBCR444;
>> +		if (edid_ext[3] & EDID_CEA_YCRCB422)
>> +			info->color_formats |=3D DRM_COLOR_FORMAT_YCBCR422;
>> +	}
>>=20=20
>>  	if (cea_db_offsets(edid_ext, &start, &end))
>>  		return;
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
