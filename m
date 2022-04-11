Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD554FB829
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0472610F898;
	Mon, 11 Apr 2022 09:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC5B10F9B4;
 Mon, 11 Apr 2022 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670557; x=1681206557;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Xc8HJhx6TiFMEzj+nn9vz9BJf5t1MwI00mE9RmbVtaA=;
 b=AzcaS5Ve7UiNdYAJi6a18qjestnE8SMzyKqcfdmYNi+noOFOUPqhMgDM
 +0zUsVgMFptsU+9QYN8aory/9Ed27+iOU3wp74ZUqKdYSR5HzqlWvBDbx
 FFIbt55Xyp+et2+X3wgn+ZX0F7O5sz+OXXLr9+kcFb2BFxQshnXhSQuE2
 zuAboG0SKpW9k0qZ37FZVQjTjyZv2NhAQhQ/yY847e7cTV0JMVL5VQ3Xh
 LCAmuPHUR4/36zMTtshtTCM3VzbAPIiRb72m1cqZISpMDV2dBL8F2jG/6
 HFf6CZRQhwnnrnWa3z0GVpF0sdUFQEq6h4AiVUGk4lSpk0mBdq85G9HEU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="249359890"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="249359890"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:49:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="507045740"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:49:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 03/12] drm/edid: refactor EDID block status printing
In-Reply-To: <Yk7Q5fJoe7Dv/XOB@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1649322799.git.jani.nikula@intel.com>
 <012d5b007a6a3771540499fb1273882d631887b3.1649322799.git.jani.nikula@intel.com>
 <Yk7Q5fJoe7Dv/XOB@intel.com>
Date: Mon, 11 Apr 2022 12:49:12 +0300
Message-ID: <87ilrghrvr.fsf@intel.com>
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

On Thu, 07 Apr 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Apr 07, 2022 at 12:14:29PM +0300, Jani Nikula wrote:
>> Split out a function to log EDID block status. The printouts get changed
>> slightly.
>>=20
>> Unfortunately, not all users will have struct drm_device available, so
>> we convert to pr_* debug logging instead of drm device based logging.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 75 ++++++++++++++++++++++++++------------
>>  1 file changed, 51 insertions(+), 24 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index f062d1715ec3..3d04d63464ba 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1729,6 +1729,50 @@ static bool edid_block_valid(const void *block, b=
ool base)
>>  				       edid_block_tag(block));
>>  }
>>=20=20
>> +static void edid_block_status_print(enum edid_block_status status,
>> +				    const struct edid *block,
>> +				    int block_num)
>> +{
>> +	switch (status) {
>> +	case EDID_BLOCK_OK:
>> +		break;
>> +	case EDID_BLOCK_NULL:
>> +		pr_debug("EDID block %d pointer is NULL\n", block_num);
>> +		break;
>> +	case EDID_BLOCK_ZERO:
>> +		pr_notice("EDID block %d is all zeroes\n", block_num);
>> +		break;
>> +	case EDID_BLOCK_HEADER_CORRUPT:
>> +		pr_notice("EDID has corrupt header\n");
>> +		break;
>> +	case EDID_BLOCK_HEADER_REPAIR:
>> +		pr_debug("EDID corrupt header needs repair\n");
>> +		break;
>> +	case EDID_BLOCK_HEADER_FIXED:
>> +		pr_debug("EDID corrupt header fixed\n");
>> +		break;
>> +	case EDID_BLOCK_CHECKSUM:
>> +		if (edid_block_status_valid(status, edid_block_tag(block))) {
>> +			pr_debug("EDID block %d (tag 0x%02x) checksum is invalid, remainder =
is %d, ignoring\n",
>> +				 block_num, edid_block_tag(block),
>> +				 edid_block_compute_checksum(block));
>> +		} else {
>> +			pr_notice("EDID block %d (tag 0x%02x) checksum is invalid, remainder=
 is %d\n",
>> +				  block_num, edid_block_tag(block),
>> +				  edid_block_compute_checksum(block));
>> +		}
>> +		break;
>> +	case EDID_BLOCK_VERSION:
>> +		pr_notice("EDID has major version %d, instead of 1\n",
>> +			  block->version);
>> +		break;
>> +	default:
>> +		pr_debug("EDID block %d unknown edid block status code %d\n",
>> +			 block_num, status);
>
> Maybe this should complaing a bit more loudly. Indicates a bug in the
> code no?

Sent v2 with WARN().

Thanks,
Jani


>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
>> +		break;
>> +	}
>> +}
>> +
>>  /**
>>   * drm_edid_block_valid - Sanity check the EDID block (base or extensio=
n)
>>   * @raw_edid: pointer to raw EDID block
>> @@ -1775,33 +1819,16 @@ bool drm_edid_block_valid(u8 *_block, int block_=
num, bool print_bad_edid,
>>  			*edid_corrupt =3D true;
>>  	}
>>=20=20
>> +	edid_block_status_print(status, block, block_num);
>> +
>>  	/* Determine whether we can use this block with this status. */
>>  	valid =3D edid_block_status_valid(status, edid_block_tag(block));
>>=20=20
>> -	/* Some fairly random status printouts. */
>> -	if (status =3D=3D EDID_BLOCK_CHECKSUM) {
>> -		if (valid) {
>> -			DRM_DEBUG("EDID block checksum is invalid, remainder is %d\n",
>> -				  edid_block_compute_checksum(block));
>> -			DRM_DEBUG("Assuming a KVM switch modified the block but left the ori=
ginal checksum\n");
>> -		} else if (print_bad_edid) {
>> -			DRM_NOTE("EDID block checksum is invalid, remainder is %d\n",
>> -				 edid_block_compute_checksum(block));
>> -		}
>> -	} else if (status =3D=3D EDID_BLOCK_VERSION) {
>> -		DRM_NOTE("EDID has major version %d, instead of 1\n",
>> -			 block->version);
>> -	}
>> -
>> -	if (!valid && print_bad_edid) {
>> -		if (status =3D=3D EDID_BLOCK_ZERO) {
>> -			pr_notice("EDID block is all zeroes\n");
>> -		} else {
>> -			pr_notice("Raw EDID:\n");
>> -			print_hex_dump(KERN_NOTICE,
>> -				       " \t", DUMP_PREFIX_NONE, 16, 1,
>> -				       block, EDID_LENGTH, false);
>> -		}
>> +	if (!valid && print_bad_edid && status !=3D EDID_BLOCK_ZERO) {
>> +		pr_notice("Raw EDID:\n");
>> +		print_hex_dump(KERN_NOTICE,
>> +			       " \t", DUMP_PREFIX_NONE, 16, 1,
>> +			       block, EDID_LENGTH, false);
>>  	}
>>=20=20
>>  	return valid;
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
