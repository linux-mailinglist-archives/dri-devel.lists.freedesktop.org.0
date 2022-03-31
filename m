Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39394EDE09
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7FB10E319;
	Thu, 31 Mar 2022 15:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381B010E319;
 Thu, 31 Mar 2022 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648742080; x=1680278080;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jeBEjokyYyOb/sPB0w8+LIxAGzVK5eKSgo4RN3Y+zWU=;
 b=WNZCCBjQ8YB8E18a4uXH8Gno2wFgISZRAZsDyQISyyZZ/hU48f8XKXOQ
 w5EJJ5Mv0GfleGkVpoudTFJ9dcMoBvBBgDacB9GKxOE84Bh+8Yieud4p9
 g7VFhSBUL1zHt4pc2fSnUnvHZzdrzbacPwzGsKgF9gOntiAIGkFQPgdr5
 oTa+FlBysKvGQ2HuZjqI0EvZaUDhFSAW1Ani35vz+Ac2ZlMdEsmq20jKw
 iO9Fya2cTGHqMkJQ6wGl0QaxrFhe/0q/dkz0w2nb2turlLpqX5EllWFb2
 9/cn19547A0rCz8BcBdb0ffK7+bsnY81FfUIICklaWSUFtMuM/OPshK9L w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259585690"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259585690"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 08:54:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="566592796"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 08:54:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 07/12] drm/edid: split drm_edid_block_valid() to check
 and act parts
In-Reply-To: <YkXAo2NceBUlGbE1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648578814.git.jani.nikula@intel.com>
 <296443a99ce907b11d08ddc88407aa35d9bdc5a3.1648578814.git.jani.nikula@intel.com>
 <YkXAo2NceBUlGbE1@intel.com>
Date: Thu, 31 Mar 2022 18:54:34 +0300
Message-ID: <87mth686dh.fsf@intel.com>
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

On Thu, 31 Mar 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Mar 29, 2022 at 09:42:14PM +0300, Jani Nikula wrote:
>> Add edid_block_check() that only checks the EDID block validity, without
>> any actions. Turns out it's simple and crystal clear.
>>=20
>> Rewrite drm_edid_block_valid() around it, keeping all the functionality
>> fairly closely the same, warts and all. Turns out it's incredibly
>> complicated for a function you'd expect to be simple, with all the
>> fixing and printing and special casing. (Maybe we'll want to simplify it
>> in the future.)
>>=20
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 150 ++++++++++++++++++++++---------------
>>  1 file changed, 88 insertions(+), 62 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 481643751d10..04eb6949c9c8 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1668,10 +1668,55 @@ bool drm_edid_are_equal(const struct edid *edid1=
, const struct edid *edid2)
>>  }
>>  EXPORT_SYMBOL(drm_edid_are_equal);
>>=20=20
>> +enum edid_block_status {
>> +	EDID_BLOCK_OK =3D 0,
>> +	EDID_BLOCK_NULL,
>> +	EDID_BLOCK_HEADER_CORRUPT,
>> +	EDID_BLOCK_HEADER_REPAIR,
>> +	EDID_BLOCK_HEADER_FIXED,
>> +	EDID_BLOCK_CHECKSUM,
>> +	EDID_BLOCK_VERSION,
>> +};
>> +
>> +static enum edid_block_status edid_block_check(const void *_block, bool=
 base)
>
> s/base/is_base_block/ or something?

Okay.

>
>> +{
>> +	const struct edid *block =3D _block;
>> +
>> +	if (!block)
>> +		return EDID_BLOCK_NULL;
>> +
>> +	if (base) {
>> +		int score =3D drm_edid_header_is_valid(block);
>> +
>> +		if (score < clamp(edid_fixup, 6, 8))
>
> That should clamp to 0-8?

Indeed, thanks!

> Might be nicer to just define a .set() op for the modparam
> and check it there, but that's clearly material for a separate patch.

Yes.

BR,
Jani.

>
>> +			return EDID_BLOCK_HEADER_CORRUPT;
>> +
>> +		if (score < 8)
>> +			return EDID_BLOCK_HEADER_REPAIR;
>> +	}
>> +
>> +	if (edid_block_compute_checksum(block) !=3D edid_block_get_checksum(bl=
ock))
>> +		return EDID_BLOCK_CHECKSUM;
>> +
>> +	if (base) {
>> +		if (block->version !=3D 1)
>> +			return EDID_BLOCK_VERSION;
>> +	}
>> +
>> +	return EDID_BLOCK_OK;
>> +}
>> +
>> +static bool edid_block_status_valid(enum edid_block_status status, int =
tag)
>> +{
>> +	return status =3D=3D EDID_BLOCK_OK ||
>> +		status =3D=3D EDID_BLOCK_HEADER_FIXED ||
>> +		(status =3D=3D EDID_BLOCK_CHECKSUM && tag =3D=3D CEA_EXT);
>> +}
>> +
>>  /**
>>   * drm_edid_block_valid - Sanity check the EDID block (base or extensio=
n)
>>   * @raw_edid: pointer to raw EDID block
>> - * @block: type of block to validate (0 for base, extension otherwise)
>> + * @block_num: type of block to validate (0 for base, extension otherwi=
se)
>>   * @print_bad_edid: if true, dump bad EDID blocks to the console
>>   * @edid_corrupt: if true, the header or checksum is invalid
>>   *
>> @@ -1680,88 +1725,69 @@ EXPORT_SYMBOL(drm_edid_are_equal);
>>   *
>>   * Return: True if the block is valid, false otherwise.
>>   */
>> -bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
>> +bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edi=
d,
>>  			  bool *edid_corrupt)
>>  {
>> -	u8 csum;
>> -	struct edid *edid =3D (struct edid *)raw_edid;
>> +	struct edid *block =3D (struct edid *)_block;
>> +	enum edid_block_status status;
>> +	bool base =3D block_num =3D=3D 0;
>> +	bool valid;
>>=20=20
>> -	if (WARN_ON(!raw_edid))
>> +	if (WARN_ON(!block))
>>  		return false;
>>=20=20
>> -	if (edid_fixup > 8 || edid_fixup < 0)
>> -		edid_fixup =3D 6;
>> -
>> -	if (block =3D=3D 0) {
>> -		int score =3D drm_edid_header_is_valid(raw_edid);
>> +	status =3D edid_block_check(block, base);
>> +	if (status =3D=3D EDID_BLOCK_HEADER_REPAIR) {
>> +		DRM_DEBUG("Fixing EDID header, your hardware may be failing\n");
>> +		edid_header_fix(block);
>>=20=20
>> -		if (score =3D=3D 8) {
>> -			if (edid_corrupt)
>> -				*edid_corrupt =3D false;
>> -		} else if (score >=3D edid_fixup) {
>> -			/* Displayport Link CTS Core 1.2 rev1.1 test 4.2.2.6
>> -			 * The corrupt flag needs to be set here otherwise, the
>> -			 * fix-up code here will correct the problem, the
>> -			 * checksum is correct and the test fails
>> -			 */
>> -			if (edid_corrupt)
>> -				*edid_corrupt =3D true;
>> -			DRM_DEBUG("Fixing EDID header, your hardware may be failing\n");
>> -			edid_header_fix(raw_edid);
>> -		} else {
>> -			if (edid_corrupt)
>> -				*edid_corrupt =3D true;
>> -			goto bad;
>> -		}
>> +		/* Retry with fixed header, update status if that worked. */
>> +		status =3D edid_block_check(block, base);
>> +		if (status =3D=3D EDID_BLOCK_OK)
>> +			status =3D EDID_BLOCK_HEADER_FIXED;
>>  	}
>>=20=20
>> -	csum =3D edid_block_compute_checksum(raw_edid);
>> -	if (csum !=3D edid_block_get_checksum(raw_edid)) {
>> -		if (edid_corrupt)
>> +	if (edid_corrupt) {
>> +		/*
>> +		 * Unknown major version isn't corrupt but we can't use it. Only
>> +		 * the base block can reset edid_corrupt to false.
>> +		 */
>> +		if (base && (status =3D=3D EDID_BLOCK_OK || status =3D=3D EDID_BLOCK_=
VERSION))
>> +			*edid_corrupt =3D false;
>> +		else if (status !=3D EDID_BLOCK_OK)
>>  			*edid_corrupt =3D true;
>> -
>> -		/* allow CEA to slide through, switches mangle this */
>> -		if (edid_block_tag(raw_edid) =3D=3D CEA_EXT) {
>> -			DRM_DEBUG("EDID checksum is invalid, remainder is %d\n", csum);
>> -			DRM_DEBUG("Assuming a KVM switch modified the CEA block but left the=
 original checksum\n");
>> -		} else {
>> -			if (print_bad_edid)
>> -				DRM_NOTE("EDID checksum is invalid, remainder is %d\n", csum);
>> -
>> -			goto bad;
>> -		}
>>  	}
>>=20=20
>> -	/* per-block-type checks */
>> -	switch (edid_block_tag(raw_edid)) {
>> -	case 0: /* base */
>> -		if (edid->version !=3D 1) {
>> -			DRM_NOTE("EDID has major version %d, instead of 1\n", edid->version);
>> -			goto bad;
>> +	/* Determine whether we can use this block with this status. */
>> +	valid =3D edid_block_status_valid(status, edid_block_tag(block));
>> +
>> +	/* Some fairly random status printouts. */
>> +	if (status =3D=3D EDID_BLOCK_CHECKSUM) {
>> +		if (valid) {
>> +			DRM_DEBUG("EDID block checksum is invalid, remainder is %d\n",
>> +				  edid_block_compute_checksum(block));
>> +			DRM_DEBUG("Assuming a KVM switch modified the block but left the ori=
ginal checksum\n");
>> +		} else if (print_bad_edid) {
>> +			DRM_NOTE("EDID block checksum is invalid, remainder is %d\n",
>> +				 edid_block_compute_checksum(block));
>>  		}
>> -
>> -		if (edid->revision > 4)
>> -			DRM_DEBUG("EDID minor > 4, assuming backward compatibility\n");
>
> This debug message seems to disappear. Intentional?
>
>> -		break;
>> -
>> -	default:
>> -		break;
>> +	} else if (status =3D=3D EDID_BLOCK_VERSION) {
>> +		DRM_NOTE("EDID has major version %d, instead of 1\n",
>> +			 block->version);
>>  	}
>>=20=20
>> -	return true;
>> -
>> -bad:
>> -	if (print_bad_edid) {
>> -		if (edid_is_zero(raw_edid, EDID_LENGTH)) {
>> +	if (!valid && print_bad_edid) {
>> +		if (edid_is_zero(block, EDID_LENGTH)) {
>>  			pr_notice("EDID block is all zeroes\n");
>>  		} else {
>>  			pr_notice("Raw EDID:\n");
>>  			print_hex_dump(KERN_NOTICE,
>>  				       " \t", DUMP_PREFIX_NONE, 16, 1,
>> -				       raw_edid, EDID_LENGTH, false);
>> +				       block, EDID_LENGTH, false);
>>  		}
>>  	}
>> -	return false;
>> +
>> +	return valid;
>>  }
>>  EXPORT_SYMBOL(drm_edid_block_valid);
>>=20=20
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
