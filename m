Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5A998580
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 14:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC9910E094;
	Thu, 10 Oct 2024 12:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGaIbnTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D573C10E094
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728561870; x=1760097870;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=KYU12OC8X41jBEyB+kjk2nNGWMi9og3GFruUDP1QPqs=;
 b=HGaIbnTCgh4hxy9LpAYl6mUTPkPMNEZVK8NlawhDBWDQY+rfMT49/MAG
 Exsp+jP8Fo0jfaY9WyFghUYYvuF690/uOr5z7bLcyImbQlUl3xjUd6nNG
 3b4Z/hrHa6OreqeFo/S3B6b6AEHP6PfY31UW/9c0CaCOTJA7zaP0Q7pw1
 x7BGPkLSQyxdezQhLzbyl9rFT+4LTwz6zJWt2THsj443v9ZDzmhCmNKj+
 o9/A7whqb3RKYgY/kxEgg0QD4/k4irsdKgpEG9t0IzsxUz5BqRf3czr4C
 hrkmuL5QjnNgoXANxum0lAm9JrpB4jIQ8eald2Og7U0002S1t2wgQcr/K g==;
X-CSE-ConnectionGUID: 5HznKN9aRce3ihWerTau1g==
X-CSE-MsgGUID: lPMJ/uWBStm/F4nlgWpiMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38499982"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="38499982"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 05:04:30 -0700
X-CSE-ConnectionGUID: z2SHyoN/SnK0xHHB729IKQ==
X-CSE-MsgGUID: GcWo/58TTNimPB5Sa6A7vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76486963"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 05:04:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Brahmajit Das <brahmajit.xyz@gmail.com>
Cc: ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/display: Fix building with GCC 15
In-Reply-To: <871q0yvntz.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241002090703.919591-1-brahmajit.xyz@gmail.com>
 <20241002092311.942822-1-brahmajit.xyz@gmail.com>
 <871q0yvntz.fsf@intel.com>
Date: Thu, 10 Oct 2024 15:04:25 +0300
Message-ID: <87iku06u5y.fsf@intel.com>
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

On Wed, 02 Oct 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 02 Oct 2024, Brahmajit Das <brahmajit.xyz@gmail.com> wrote:
>> GCC 15 enables -Werror=3Dunterminated-string-initialization by default.
>> This results in the following build error
>>
>> drivers/gpu/drm/display/drm_dp_dual_mode_helper.c: In function =E2=80=98=
is_hdmi_adaptor=E2=80=99:
>> drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:164:17: error: initial=
izer-string for array of
>>  =E2=80=98char=E2=80=99 is too long [-Werror=3Dunterminated-string-initi=
alization]
>>   164 |                 "DP-HDMI ADAPTOR\x04";
>>       |                 ^~~~~~~~~~~~~~~~~~~~~
>>
>> After discussion with Ville, the fix was to increase the size of
>> dp_dual_mode_hdmi_id array by one, so that it can accommodate the NULL
>> line character. This should let us build the kernel with GCC 15.
>
> Still s/NULL line/NUL/ but this can be fixed while applying, no need to
> resend.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Pushed to drm-misc-next, and forgot to update the commit message. Oh
well. My bad.

Thanks for the patch.

BR,
Jani.

>
>
>>
>> Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
>> ---
>>  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers=
/gpu/drm/display/drm_dp_dual_mode_helper.c
>> index 14a2a8473682..c491e3203bf1 100644
>> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
>> @@ -160,11 +160,11 @@ EXPORT_SYMBOL(drm_dp_dual_mode_write);
>>=20=20
>>  static bool is_hdmi_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN=
])
>>  {
>> -	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] =3D
>> +	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN + 1] =
=3D
>>  		"DP-HDMI ADAPTOR\x04";
>>=20=20
>>  	return memcmp(hdmi_id, dp_dual_mode_hdmi_id,
>> -		      sizeof(dp_dual_mode_hdmi_id)) =3D=3D 0;
>> +		      DP_DUAL_MODE_HDMI_ID_LEN) =3D=3D 0;
>>  }
>>=20=20
>>  static bool is_type1_adaptor(uint8_t adaptor_id)

--=20
Jani Nikula, Intel
