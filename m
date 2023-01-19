Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061B26734AB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 10:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C376410E8FB;
	Thu, 19 Jan 2023 09:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E9910E8F9;
 Thu, 19 Jan 2023 09:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674121490; x=1705657490;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=U3EqrDiAkrpvGPp19lKpBXSBAnqRZO17cVfx+J/OnfI=;
 b=PGffCXOadDgV7uhowGYdL4QdqEdqkVckLZaNJrtAjK82yPk/MgoMUKjP
 Dy6PKbRtCszg2WLf8w2fHN1/9rBoNar7GACnWoRgkMPYN6c7xOCPl7Rzv
 fWRTf3+hr+Xk/8uHP+TfQv6FX4yMA9m97XyD5d/xZdB7IuQajoyHEkVwV
 YZx89yh4LPqS06FHIaPIgB26v0ks8UxNabEKZt6eie8u+o3+VbiB6Qdse
 mJUwGUj8Zdf5TaSRBuXSCmEMeojG2qpCNwjBPhOpipDOLPg9gBKJNanLj
 OF6zI659p2sjLNr6UBFzLfCOVQMs+Ja7YLusn4HTi2ov/RMXBFPqXiJoS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304926344"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="304926344"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 01:44:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="653299927"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="653299927"
Received: from sarahgar-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.15.69])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 01:44:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v7 10/22] drm/edid: add helper for HDMI VSDB audio
 latency field length
In-Reply-To: <Y8gTdsLisZ5byN2d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1672826282.git.jani.nikula@intel.com>
 <da4293203ef2ddeb0bf66a2bfdbc129ab609c543.1672826282.git.jani.nikula@intel.com>
 <Y8gTdsLisZ5byN2d@intel.com>
Date: Thu, 19 Jan 2023 11:44:45 +0200
Message-ID: <875yd2dfjm.fsf@intel.com>
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

On Wed, 18 Jan 2023, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Jan 04, 2023 at 12:05:25PM +0200, Jani Nikula wrote:
>> Add a helper for skipping the HDMI VSDB audio latency fields.
>>=20
>> There's a functional change for HDMI VSDB blocks that do not respect the
>> spec: "I_Latency_Fields_Present shall be zero if Latency_Fields_Present
>> is zero". We assume this to hold when skipping the latency fields, and
>> ignore non-zero I_Latency_Fields_Present if Latency_Fields_Present is
>> zero.
>>=20
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks for the reviews so far, pushed up to and including this patch to
drm-misc-next.

BR,
Jani.


>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 847076b29594..93067b8dd9f6 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4695,6 +4695,16 @@ static bool hdmi_vsdb_i_latency_present(const u8 =
*db)
>>  	return hdmi_vsdb_latency_present(db) && db[8] & BIT(6);
>>  }
>>=20=20
>> +static int hdmi_vsdb_latency_length(const u8 *db)
>> +{
>> +	if (hdmi_vsdb_i_latency_present(db))
>> +		return 4;
>> +	else if (hdmi_vsdb_latency_present(db))
>> +		return 2;
>> +	else
>> +		return 0;
>> +}
>> +
>>  /*
>>   * do_hdmi_vsdb_modes - Parse the HDMI Vendor Specific data block
>>   * @connector: connector corresponding to the HDMI sink
>> @@ -4720,13 +4730,7 @@ do_hdmi_vsdb_modes(struct drm_connector *connecto=
r, const u8 *db, u8 len)
>>  	if (!(db[8] & (1 << 5)))
>>  		goto out;
>>=20=20
>> -	/* Latency_Fields_Present */
>> -	if (db[8] & (1 << 7))
>> -		offset +=3D 2;
>> -
>> -	/* I_Latency_Fields_Present */
>> -	if (db[8] & (1 << 6))
>> -		offset +=3D 2;
>> +	offset +=3D hdmi_vsdb_latency_length(db);
>>=20=20
>>  	/* the declared length is not long enough for the 2 first bytes
>>  	 * of additional video format capabilities */
>> --=20
>> 2.34.1

--=20
Jani Nikula, Intel Open Source Graphics Center
