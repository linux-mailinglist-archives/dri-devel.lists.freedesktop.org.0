Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7954EC9A8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 18:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C383010E716;
	Wed, 30 Mar 2022 16:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D43710E5B2;
 Wed, 30 Mar 2022 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648657741; x=1680193741;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=AlWtY6dwNvMArAaRyo/dt9LhAFT+VtF7jyN3K55banY=;
 b=OrQqnQx+h+wumXKxScB/NInenrJHDb43wuVW/dX80ZDd0YcRZn7C/qqb
 X8U3Z8EfjC0O/7YLyoLaXj2hQhQG9SdTgOe0voKNR7yhzYey48y6S5YzZ
 wqTMZZyunv669ycIZiaSSEv3kwS6/W2KAbGuNZTRgzj4k5QXZoYQIpjry
 /J69BFegp+DYmmAAPLKI1VccOIB9uKLd7lbLMQU0HClc3DB5V1nGTD/ec
 qeAumP93Br0fuH0eR/oD6w4HNosFrAjQOwxv4lrfnveDUBvZnutOWh/GA
 k7+OAH+5lEPXECVt/WlcXpELemcu3b/FBYATZcHLaDs37/czxn1wpXSAM w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259301004"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="259301004"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 09:29:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="565626125"
Received: from nhanus-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 09:28:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 01/12] drm/edid: use struct edid * in drm_do_get_edid()
In-Reply-To: <YkR5pPQViri6nIep@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648578814.git.jani.nikula@intel.com>
 <380b903fb91b1e20a1a7af61db40b6c7c5617005.1648578814.git.jani.nikula@intel.com>
 <YkRViiFfSOJQnsoI@intel.com> <87r16jbhdq.fsf@intel.com>
 <YkR5pPQViri6nIep@intel.com>
Date: Wed, 30 Mar 2022 19:28:56 +0300
Message-ID: <87lewrbe0n.fsf@intel.com>
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
> On Wed, Mar 30, 2022 at 06:16:17PM +0300, Jani Nikula wrote:
>> On Wed, 30 Mar 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
>> > On Tue, Mar 29, 2022 at 09:42:08PM +0300, Jani Nikula wrote:
>> >> Mixing u8 * and struct edid * is confusing, switch to the latter.
>> >>=20
>> >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/drm_edid.c | 31 +++++++++++++++----------------
>> >>  1 file changed, 15 insertions(+), 16 deletions(-)
>> >>=20
>> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> >> index d79b06f7f34c..0650b9217aa2 100644
>> >> --- a/drivers/gpu/drm/drm_edid.c
>> >> +++ b/drivers/gpu/drm/drm_edid.c
>> >> @@ -1991,29 +1991,28 @@ struct edid *drm_do_get_edid(struct drm_conne=
ctor *connector,
>> >>  	void *data)
>> >>  {
>> >>  	int i, j =3D 0, valid_extensions =3D 0;
>> >> -	u8 *edid, *new;
>> >> -	struct edid *override;
>> >> +	struct edid *edid, *new, *override;
>> >>=20=20
>> >>  	override =3D drm_get_override_edid(connector);
>> >>  	if (override)
>> >>  		return override;
>> >>=20=20
>> >> -	edid =3D (u8 *)drm_do_get_edid_base_block(connector, get_edid_block=
, data);
>> >> +	edid =3D drm_do_get_edid_base_block(connector, get_edid_block, data=
);
>> >>  	if (!edid)
>> >>  		return NULL;
>> >>=20=20
>> >>  	/* if there's no extensions or no connector, we're done */
>> >> -	valid_extensions =3D edid[0x7e];
>> >> +	valid_extensions =3D edid->extensions;
>> >>  	if (valid_extensions =3D=3D 0)
>> >> -		return (struct edid *)edid;
>> >> +		return edid;
>> >>=20=20
>> >>  	new =3D krealloc(edid, (valid_extensions + 1) * EDID_LENGTH, GFP_KE=
RNEL);
>> >>  	if (!new)
>> >>  		goto out;
>> >>  	edid =3D new;
>> >>=20=20
>> >> -	for (j =3D 1; j <=3D edid[0x7e]; j++) {
>> >> -		u8 *block =3D edid + j * EDID_LENGTH;
>> >> +	for (j =3D 1; j <=3D edid->extensions; j++) {
>> >> +		void *block =3D edid + j;
>> >>=20=20
>> >>  		for (i =3D 0; i < 4; i++) {
>> >>  			if (get_edid_block(data, block, j, EDID_LENGTH))
>> >> @@ -2026,13 +2025,13 @@ struct edid *drm_do_get_edid(struct drm_conne=
ctor *connector,
>> >>  			valid_extensions--;
>> >>  	}
>> >>=20=20
>> >> -	if (valid_extensions !=3D edid[0x7e]) {
>> >> -		u8 *base;
>> >> +	if (valid_extensions !=3D edid->extensions) {
>> >> +		struct edid *base;
>> >
>> > This one points to extension blocks too so using=20
>> > struct edid doesn't seem entirely appropriate.
>>=20
>> So I've gone back and forth with this. I think I want to get rid of u8*
>> no matter what, because it always requires casting. I've used void* here
>> and there to allow mixed use, internally in drm_edid.c while
>> transitioning, and in public interfaces due to usage all over the place.
>>=20
>> OTOH I don't much like arithmetics on void*. It's a gcc extension.
>>=20
>> struct edid * is useful for e.g. ->checksum and arithmetics. In many
>> places I've named it struct edid *block to distinguish. We could have a
>> struct edid_block too, which could have ->tag and ->checksum members,
>> for example, but then it would require casting or a function for "safe"
>> typecasting.
>>=20
>> I've also gone back and forth with the helpers for getting a pointer to
>> a block. For usage like this, kind of need both const and non-const
>> versions. And, with the plans I have for future, I'm not sure I want to
>> promote any EDID parsing outside of drm_edid.c, so maybe they should be
>> static.
>>=20
>> Undecided. C is a bit clunky here.
>>=20
>> >
>> >>=20=20
>> >> -		connector_bad_edid(connector, edid, edid[0x7e] + 1);
>> >> +		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
>> >>=20=20
>> >> -		edid[EDID_LENGTH-1] +=3D edid[0x7e] - valid_extensions;
>> >> -		edid[0x7e] =3D valid_extensions;
>> >> +		edid->checksum +=3D edid->extensions - valid_extensions;
>> >> +		edid->extensions =3D valid_extensions;
>> >>=20=20
>> >>  		new =3D kmalloc_array(valid_extensions + 1, EDID_LENGTH,
>> >>  				    GFP_KERNEL);
>> >> @@ -2040,21 +2039,21 @@ struct edid *drm_do_get_edid(struct drm_conne=
ctor *connector,
>> >>  			goto out;
>> >>=20=20
>> >>  		base =3D new;
>> >> -		for (i =3D 0; i <=3D edid[0x7e]; i++) {
>> >> -			u8 *block =3D edid + i * EDID_LENGTH;
>> >> +		for (i =3D 0; i <=3D edid->extensions; i++) {
>> >> +			void *block =3D edid + i;
>> >
>> > Hmm. This code seems very broken to me. We read each block
>> > into its expected offset based on the original base block extension
>> > count, but here we only iterate up to the new ext block count. So
>> > if we had eg. a 4 block EDID where block 2 is busted, we set=20
>> > the new ext count to 2, copy over blocks 0 and 1, skip block 2,
>> > and then terminate the loop. So instead of copying block 3 from
>> > the orignal EDID into block 2 of the new EDID, we leave the
>> > original garbage block 2 in place.
>>=20
>> Ugh. I end up fixing this in the series, in "drm/edid: split out invalid
>> block filtering to a separate function", but I don't mention it
>> anywhere.
>>=20
>> Looks like it's been broken for 5+ years since commit 14544d0937bf
>> ("drm/edid: Only print the bad edid when aborting").
>>=20
>> Which really makes you wonder about the usefulness of trying to "fix"
>> the EDID by skipping extension blocks. It was added in commit
>> 0ea75e23356f ("DRM: ignore invalid EDID extensions").
>>=20
>> > Also this memcpy() business seems entirely poinless in the sense
>> > that we could just read each ext block into the final offset
>> > directly AFAICS.
>>=20
>> This is how it was before commit 14544d0937bf.
>
> Hmm. This is actually even a bit worse than I though since it
> looks like we can leak uninitialized stuff from kmalloc_array().
> I originally thought it was a krealloc()+memmove() but that is
> not the case.
>
>> I guess the point is if
>> we decide the EDID is garbage, we want to print the original EDID, once,
>> not something we've already changed. I also kind of like the idea of
>> hiding the broken EDID path magic in a separate function.
>
> I'm wondering we should just stop with this bad block filtering
> entirely? Just let the block be all zeroes/crap if that is really
> what we got from the sink. And we could still skip known broken
> blocks during parsing to avoid getting too confused I guess.

I think by far the most common extension count must be 1. Especially
with older displays I think anything beyond 256 bytes is virtually
non-existent. Agreed?

With that, going from 1 to 0 extensions, it actually works by
coincidence, no leaks, no uninitialized stuff. (Looks like maybe any
scenario where it's the last N extensions that are invalid works just
fine, and it's the broken extensions in the middle that make this go
haywire.)

So maybe it's not so scary after all. I could fix that bit first, and
then proceed with the rest of the series. I'm a bit hesitant to make big
functional changes now, like stopping the filtering entirely, because
it's not just drm_edid.c parsing the returned EDIDs, parsing is all over
the place.

And on that note, my idea (also for HF-EEODB, my end goal) is to move
towards an opaque struct drm_edid, which is 1) generated and parsed
exclusively within drm_edid.c, nowhere else, 2) always valid to be
passed to drm_edid.c (i.e. always be able to handle what we've
generated, whatever that is). If you want the benefits of HF-EEODB or
new DisplayID 2.0 features or whatever, you switch your driver to struct
drm_edid. But you can keep rolling with the legacy struct edid crap ad
infinitum.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
