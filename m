Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8988F53FD73
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 13:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D27B10E096;
	Tue,  7 Jun 2022 11:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1585D10E037;
 Tue,  7 Jun 2022 11:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654601171; x=1686137171;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=L/FpLWe+fdC0cQoliUC5LbVjJHdeIJN9UW3RQv2mnVk=;
 b=LPWblPopX7LKLbUPjmYr73JujSTg5hjV328/iAY66ieGyXZwdfgSUD38
 uKWgGuuDurl4c140hxKQZIE19OEYFHJCaKCrh+ArRwOTLNc82uCqgKcbg
 PJE8ui3umoxOHHSpfuZAKVsrXUak81sCaTRfr+eQuVmwBA1OxGcDbqMTN
 10KAl0cBRXU7pnnoY1A2X4zhmf2keAhTHXrxQTFY7HliDz39avAiCuWUh
 ZOp99CByWGgrNdu1RjDDNDg/pOyLDoWjM3M0Kj+BEz8TiIdu8UfNoSQzD
 CKNYQufeYWe2QPM1JAT+Yk4FA1L6ZGbot8e55psjE0X/pwdrEtLGZMq5X g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="277464882"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="277464882"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 04:26:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="636086011"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.57.112])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 04:26:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v1 11/13] drm/edid: add HF-EEODB support to EDID read
 and allocation
In-Reply-To: <YppBTAFXSNgaoymG@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1653381821.git.jani.nikula@intel.com>
 <7451127fb889f9d2ed723a6d83e033d6a5196354.1653381821.git.jani.nikula@intel.com>
 <YppBTAFXSNgaoymG@intel.com>
Date: Tue, 07 Jun 2022 14:26:06 +0300
Message-ID: <87ilpcpve9.fsf@intel.com>
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

On Fri, 03 Jun 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, May 24, 2022 at 01:39:33PM +0300, Jani Nikula wrote:
>> HDMI 2.1 section 10.3.6 defines an HDMI Forum EDID Extension Override
>> Data Block, which may contain a different extension count than the base
>> block claims. Add support for reading more EDID data if available. The
>> extra blocks aren't parsed yet, though.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 81 ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 78 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 5e0a91da565e..ba0c880dc133 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -1581,6 +1581,15 @@ static bool version_greater(const struct drm_edid=
 *drm_edid,
>>  		(edid->version =3D=3D version && edid->revision > revision);
>>  }
>>=20=20
>> +static int edid_hfeeodb_extension_block_count(const struct edid *edid);
>> +
>> +static int edid_hfeeodb_block_count(const struct edid *edid)
>> +{
>> +	int eeodb =3D edid_hfeeodb_extension_block_count(edid);
>> +
>> +	return eeodb ? eeodb + 1 : 0;
>> +}
>> +
>>  static int edid_extension_block_count(const struct edid *edid)
>>  {
>>  	return edid->extensions;
>> @@ -2026,6 +2035,11 @@ static struct edid *edid_filter_invalid_blocks(st=
ruct edid *edid,
>>  	struct edid *new;
>>  	int i, valid_blocks =3D 0;
>>=20=20
>> +	/*
>> +	 * Note: If the EDID uses HF-EEODB, but has invalid blocks, we'll reve=
rt
>> +	 * back to regular extension count here. We don't want to start
>> +	 * modifying the HF-EEODB extension too.
>> +	 */
>>  	for (i =3D 0; i < edid_block_count(edid); i++) {
>>  		const void *src_block =3D edid_block_data(edid, i);
>>=20=20
>> @@ -2235,7 +2249,7 @@ static struct edid *_drm_do_get_edid(struct drm_co=
nnector *connector,
>>  				     size_t *size)
>>  {
>>  	enum edid_block_status status;
>> -	int i, invalid_blocks =3D 0;
>> +	int i, num_blocks, invalid_blocks =3D 0;
>>  	struct edid *edid, *new;
>>  	size_t alloc_size =3D EDID_LENGTH;
>>=20=20
>> @@ -2277,7 +2291,8 @@ static struct edid *_drm_do_get_edid(struct drm_co=
nnector *connector,
>>  		goto fail;
>>  	edid =3D new;
>>=20=20
>> -	for (i =3D 1; i < edid_block_count(edid); i++) {
>> +	num_blocks =3D edid_block_count(edid);
>> +	for (i =3D 1; i < num_blocks; i++) {
>>  		void *block =3D (void *)edid_block_data(edid, i);
>>=20=20
>>  		status =3D edid_block_read(block, i, read_block, context);
>> @@ -2288,11 +2303,31 @@ static struct edid *_drm_do_get_edid(struct drm_=
connector *connector,
>>  			if (status =3D=3D EDID_BLOCK_READ_FAIL)
>>  				goto fail;
>>  			invalid_blocks++;
>> +		} else if (i =3D=3D 1) {
>> +			/*
>> +			 * If the first EDID extension is a CTA extension, and
>> +			 * the first Data Block is HF-EEODB, override the
>> +			 * extension block count.
>> +			 *
>> +			 * Note: HF-EEODB could specify a smaller extension
>> +			 * count too, but we can't risk allocating a smaller
>> +			 * amount.
>> +			 */
>> +			int eeodb =3D edid_hfeeodb_block_count(edid);
>> +
>> +			if (eeodb > num_blocks) {
>> +				num_blocks =3D eeodb;
>> +				alloc_size =3D edid_size_by_blocks(num_blocks);
>> +				new =3D krealloc(edid, alloc_size, GFP_KERNEL);
>> +				if (!new)
>> +					goto fail;
>> +				edid =3D new;
>> +			}
>>  		}
>>  	}
>>=20=20
>>  	if (invalid_blocks) {
>> -		connector_bad_edid(connector, edid, edid_block_count(edid));
>> +		connector_bad_edid(connector, edid, num_blocks);
>>=20=20
>>  		edid =3D edid_filter_invalid_blocks(edid, &alloc_size);
>>  	}
>> @@ -3825,6 +3860,7 @@ static int add_detailed_modes(struct drm_connector=
 *connector,
>>  #define CTA_EXT_DB_HDR_STATIC_METADATA	6
>>  #define CTA_EXT_DB_420_VIDEO_DATA	14
>>  #define CTA_EXT_DB_420_VIDEO_CAP_MAP	15
>> +#define CTA_EXT_DB_HF_EEODB		0x78
>>  #define CTA_EXT_DB_HF_SCDB		0x79
>>=20=20
>>  #define EDID_BASIC_AUDIO	(1 << 6)
>> @@ -4868,6 +4904,12 @@ static bool cea_db_is_hdmi_forum_vsdb(const struc=
t cea_db *db)
>>  		cea_db_payload_len(db) >=3D 7;
>>  }
>>=20=20
>> +static bool cea_db_is_hdmi_forum_eeodb(const void *db)
>> +{
>> +	return cea_db_is_extended_tag(db, CTA_EXT_DB_HF_EEODB) &&
>> +		cea_db_payload_len(db) >=3D 2;
>> +}
>> +
>>  static bool cea_db_is_microsoft_vsdb(const struct cea_db *db)
>>  {
>>  	return cea_db_is_vendor(db, MICROSOFT_IEEE_OUI) &&
>> @@ -4902,6 +4944,39 @@ static bool cea_db_is_hdmi_hdr_metadata_block(con=
st struct cea_db *db)
>>  		cea_db_payload_len(db) >=3D 3;
>>  }
>>=20=20
>> +/*
>> + * Get the HF-EEODB override extension block count from EDID.
>> + *
>> + * The passed in EDID may be partially read, as long as it has at least=
 two
>> + * blocks (base block and one extension block) if EDID extension count =
is > 0.
>> + *
>> + * References:
>> + * - HDMI 2.1 section 10.3.6 HDMI Forum EDID Extension Override Data Bl=
ock
>> + */
>> +static int edid_hfeeodb_extension_block_count(const struct edid *edid)
>> +{
>> +	const u8 *cta;
>> +
>> +	/* No extensions according to base block, no HF-EEODB. */
>> +	if (!edid_extension_block_count(edid))
>> +		return 0;
>> +
>> +	/* HF-EEODB is always in the first EDID extension block only */
>> +	cta =3D edid_extension_block_data(edid, 0);
>> +	if (edid_block_tag(cta) !=3D CEA_EXT || cea_revision(cta) < 3)
>> +		return 0;
>> +
>> +	/*
>> +	 * Sinks that include the HF-EEODB in their E-EDID shall include one a=
nd
>> +	 * only one instance of the HF-EEODB in the E-EDID, occupying bytes 4
>> +	 * through 6 of Block 1 of the E-EDID.
>> +	 */
>> +	if (!cea_db_is_hdmi_forum_eeodb(&cta[4]))
>> +		return 0;
>
> Still not a big fan of these hardcoded things. Not sure if there's any
> easy way to just use the normal iterators at this point when we don't
> really know the full composition of the EDID yet. If not then I guess
> we'll have to use some hardcoded stuff. What we definitely seem to be
> missing here are size checks, for both the whoe data block collection,
> and the specific data block payload.

I don't like it either, but it's a chicken and egg problem wrt how far
to iterate. Taking this into account in the iterators looks like making
the iterators harder to understand, so I prefer the hardcoded hack here
in one place. And the spec specifically says where this data block must
be.

The data block collection size check is an oversight, but
cea_db_is_hdmi_forum_eeodb() does check for minimum payload length.

BR,
Jani.

>
>> +
>> +	return cta[4 + 2];
>> +}
>> +
>>  static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>>  				      const u8 *db)
>>  {
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
