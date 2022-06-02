Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C6B53BCFD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8FD112A64;
	Thu,  2 Jun 2022 17:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE811112A91;
 Thu,  2 Jun 2022 17:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654189698; x=1685725698;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OkIDSHit5Ilg6bKpU9ipmBuB29nGA7wLBX0ps9tDeso=;
 b=BOwhj8Ez+VrYXzsbZz9qFJM7liodipFjsYbBL8jKZvMsOdFkLgIIP/Ly
 bJmeA/JBFFQfmLcHIe1xXfiOHeMutX94Nwc26COVA9AtaxlaSJ2lUILod
 82Qu6004diXU7Wvi5oEoQn8DTwmeFEivsXCXhyayYYbMpmALULdZ6ya+y
 qC98PjouGzyBX7UCexJ+MLtLOo1P9QadPgrTnrYf94le06Fk1KH5vYsHe
 +AbpS57QtDkgxg8OaNFB1a8kuq01T7rSuKDHyxy+aXni4z5xzzaFn01WM
 01svFEGef//TLqj96tLIEH8s7CxQ4fjLPze6//n992Tds2VLmkbM1mRNI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="301379214"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="301379214"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 10:08:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="757079297"
Received: from fbackhou-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.46.4])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 10:08:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v1 01/13] drm/edid: add block count and data helper
 functions for drm_edid
In-Reply-To: <YpjrYx13Bh6Gwj68@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1653381821.git.jani.nikula@intel.com>
 <a08352924ad49a32213d8979d43d480f3f7b4a11.1653381821.git.jani.nikula@intel.com>
 <YpjrYx13Bh6Gwj68@intel.com>
Date: Thu, 02 Jun 2022 20:08:14 +0300
Message-ID: <871qw7ouwx.fsf@intel.com>
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

On Thu, 02 Jun 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, May 24, 2022 at 01:39:23PM +0300, Jani Nikula wrote:
>> Add drm_edid based block count and data access helper functions that
>> take the EDID allocated size into account.
>>=20
>> At the moment, the allocated size should always match the EDID size
>> indicated by the extension count, but this will change in the future.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 42 +++++++++++++++++++++++++++++++-------
>>  1 file changed, 35 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 929fc0e46751..682d954a9e42 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1613,6 +1613,35 @@ static const void *edid_extension_block_data(cons=
t struct edid *edid, int index)
>>  	return edid_block_data(edid, index + 1);
>>  }
>>=20=20
>> +static int drm_edid_block_count(const struct drm_edid *drm_edid)
>> +{
>> +	int num_blocks;
>> +
>> +	/* Starting point */
>> +	num_blocks =3D edid_block_count(drm_edid->edid);
>> +
>> +	/* Limit by allocated size */
>> +	num_blocks =3D min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
>
> Hmm. Is there a particular reason we couldn't just always
> return drm_edid->size/EDID_LENGTH here? That is, why would we not
> set drm_edid->size to always reflect the actual size of the EDID?

Basically playing it safe for obscure cases and the future. For example
EDIDs originating from firmware, debugfs or i915 opregion could have a
bigger size than indicated by the extension count, if we want to go to a
direction where it's really just a blob with size.

BR,
Jani.

>
>> +
>> +	return num_blocks;
>> +}
>> +
>> +static int drm_edid_extension_block_count(const struct drm_edid *drm_ed=
id)
>> +{
>> +	return drm_edid_block_count(drm_edid) - 1;
>> +}
>> +
>> +static const void *drm_edid_block_data(const struct drm_edid *drm_edid,=
 int index)
>> +{
>> +	return edid_block_data(drm_edid->edid, index);
>> +}
>> +
>> +static const void *drm_edid_extension_block_data(const struct drm_edid =
*drm_edid,
>> +						 int index)
>> +{
>> +	return edid_extension_block_data(drm_edid->edid, index);
>> +}
>> +
>>  /*
>>   * Initializer helper for legacy interfaces, where we have no choice bu=
t to
>>   * trust edid size. Not for general purpose use.
>> @@ -1665,8 +1694,8 @@ static const void *__drm_edid_iter_next(struct drm=
_edid_iter *iter)
>>  	if (!iter->drm_edid)
>>  		return NULL;
>>=20=20
>> -	if (iter->index < edid_block_count(iter->drm_edid->edid))
>> -		block =3D edid_block_data(iter->drm_edid->edid, iter->index++);
>> +	if (iter->index < drm_edid_block_count(iter->drm_edid))
>> +		block =3D drm_edid_block_data(iter->drm_edid, iter->index++);
>>=20=20
>>  	return block;
>>  }
>> @@ -3574,22 +3603,21 @@ static int add_detailed_modes(struct drm_connect=
or *connector,
>>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>  				  int ext_id, int *ext_index)
>>  {
>> -	const struct edid *edid =3D drm_edid ? drm_edid->edid : NULL;
>>  	const u8 *edid_ext =3D NULL;
>>  	int i;
>>=20=20
>>  	/* No EDID or EDID extensions */
>> -	if (!edid || !edid_extension_block_count(edid))
>> +	if (!drm_edid || !drm_edid_extension_block_count(drm_edid))
>>  		return NULL;
>>=20=20
>>  	/* Find CEA extension */
>> -	for (i =3D *ext_index; i < edid_extension_block_count(edid); i++) {
>> -		edid_ext =3D edid_extension_block_data(edid, i);
>> +	for (i =3D *ext_index; i < drm_edid_extension_block_count(drm_edid); i=
++) {
>> +		edid_ext =3D drm_edid_extension_block_data(drm_edid, i);
>>  		if (edid_block_tag(edid_ext) =3D=3D ext_id)
>>  			break;
>>  	}
>>=20=20
>> -	if (i >=3D edid_extension_block_count(edid))
>> +	if (i >=3D drm_edid_extension_block_count(drm_edid))
>>  		return NULL;
>>=20=20
>>  	*ext_index =3D i + 1;
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
