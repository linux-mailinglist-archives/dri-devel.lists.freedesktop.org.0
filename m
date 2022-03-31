Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E354F4ED786
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 12:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9AA10E2E2;
	Thu, 31 Mar 2022 10:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5039610E2E2;
 Thu, 31 Mar 2022 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648721168; x=1680257168;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=aZH18WlKteagod8GE5IzIYHI6n60sWnHWRzTrCt7cSM=;
 b=G0+e6BVHgTga/mxjaiF0zdaSSaD0b1/3AmWtd08GYoBGpnQo+04sipPs
 fY8FHdzVwDooO+5gxaewMQ/zWeKDp50kaU1RT3/KqY9Z69wycvN5r3LEM
 4HVeDKu5IuvW1Ri1S+aj8OPlDJr84rNGp47WtpnjgR8HQKShS8/yXjREL
 QxB83wxkWZmIXLKArOGnOvFixd0Xqh8fmAseL8o5/i+y7YoJ7+9ThGyUg
 PUlwDZICABY+EV5051cuoAP+3vTNY3ktSNeQ9JaZbdp18j+PO+qHYvj8A
 hdfB3XWCQMXWIrOz4fRmGE8y4esWTzRH8kL16oCeu/IDOpa6tDILok3pO A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322964364"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="322964364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 03:06:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="566337395"
Received: from cgarnier-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.62.224])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 03:06:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/edid: fix invalid EDID extension block filtering
In-Reply-To: <YkSQBaW8swA7LY9M@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220330170426.349248-1-jani.nikula@intel.com>
 <YkSQBaW8swA7LY9M@intel.com>
Date: Thu, 31 Mar 2022 13:06:03 +0300
Message-ID: <87r16ia12s.fsf@intel.com>
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

On Wed, 30 Mar 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Mar 30, 2022 at 08:04:26PM +0300, Jani Nikula wrote:
>> The invalid EDID block filtering uses the number of valid EDID
>> extensions instead of all EDID extensions for looping the extensions in
>> the copy. This is fine, by coincidence, if all the invalid blocks are at
>> the end of the EDID. However, it's completely broken if there are
>> invalid extensions in the middle; the invalid blocks are included and
>> valid blocks are excluded.
>>=20
>> Fix it by modifying the base block after, not before, the copy.
>>=20
>> Fixes: 14544d0937bf ("drm/edid: Only print the bad edid when aborting")
>> Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed to drm-misc-next. I didn't bother with -fixes, because
the bug is ancient and rare, and that would only cause conflicts for me.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index d79b06f7f34c..8829120470ab 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -2031,9 +2031,6 @@ struct edid *drm_do_get_edid(struct drm_connector =
*connector,
>>=20=20
>>  		connector_bad_edid(connector, edid, edid[0x7e] + 1);
>>=20=20
>> -		edid[EDID_LENGTH-1] +=3D edid[0x7e] - valid_extensions;
>> -		edid[0x7e] =3D valid_extensions;
>> -
>>  		new =3D kmalloc_array(valid_extensions + 1, EDID_LENGTH,
>>  				    GFP_KERNEL);
>>  		if (!new)
>> @@ -2050,6 +2047,9 @@ struct edid *drm_do_get_edid(struct drm_connector =
*connector,
>>  			base +=3D EDID_LENGTH;
>>  		}
>>=20=20
>> +		new[EDID_LENGTH - 1] +=3D new[0x7e] - valid_extensions;
>> +		new[0x7e] =3D valid_extensions;
>> +
>>  		kfree(edid);
>>  		edid =3D new;
>>  	}
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
