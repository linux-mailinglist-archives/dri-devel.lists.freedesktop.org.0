Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA064EC86B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 17:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DF589E5F;
	Wed, 30 Mar 2022 15:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6188810E931;
 Wed, 30 Mar 2022 15:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648654760; x=1680190760;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xIS8ZcMz9KwyrPAclvq+ZIx54KoPD5ZbqAdPoc42Cuo=;
 b=EbS417muAugBzslgBSVLqmGt93XkH2vQWbQVrS1cwl7pK8a04+0hk4NE
 kDP4DTYezvahyqzF5wKr0KcZSi5EQakhhUK9j86jNscMeZONA9S0zXFPv
 6YuZvpz1RHFmmV8ZxxBd172irb+PDHFsVJTPZjFGqnhqRoSFgCjJlhxPR
 II+AptRXU49DcwArIUhrVxV6SZikWqC58faXtcspyDnY+DmzbTeWUNnPS
 umZRNUodwK1MVvWW+7u31J7S/83MI/Reo46GCOgmZ7d0bU8tb5EpSmJ26
 7JEVcFjCjePrKRvuyTzJrmTqwFuzV9oJWFrDhRJKtspEnmj2xAwcI/r2i w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322754971"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322754971"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 08:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="605480803"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga008.fm.intel.com with SMTP; 30 Mar 2022 08:39:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 30 Mar 2022 18:39:16 +0300
Date: Wed, 30 Mar 2022 18:39:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 01/12] drm/edid: use struct edid * in drm_do_get_edid()
Message-ID: <YkR5pPQViri6nIep@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
 <380b903fb91b1e20a1a7af61db40b6c7c5617005.1648578814.git.jani.nikula@intel.com>
 <YkRViiFfSOJQnsoI@intel.com> <87r16jbhdq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r16jbhdq.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Wed, Mar 30, 2022 at 06:16:17PM +0300, Jani Nikula wrote:
> On Wed, 30 Mar 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Mar 29, 2022 at 09:42:08PM +0300, Jani Nikula wrote:
> >> Mixing u8 * and struct edid * is confusing, switch to the latter.
> >> 
> >> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/drm_edid.c | 31 +++++++++++++++----------------
> >>  1 file changed, 15 insertions(+), 16 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >> index d79b06f7f34c..0650b9217aa2 100644
> >> --- a/drivers/gpu/drm/drm_edid.c
> >> +++ b/drivers/gpu/drm/drm_edid.c
> >> @@ -1991,29 +1991,28 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
> >>  	void *data)
> >>  {
> >>  	int i, j = 0, valid_extensions = 0;
> >> -	u8 *edid, *new;
> >> -	struct edid *override;
> >> +	struct edid *edid, *new, *override;
> >>  
> >>  	override = drm_get_override_edid(connector);
> >>  	if (override)
> >>  		return override;
> >>  
> >> -	edid = (u8 *)drm_do_get_edid_base_block(connector, get_edid_block, data);
> >> +	edid = drm_do_get_edid_base_block(connector, get_edid_block, data);
> >>  	if (!edid)
> >>  		return NULL;
> >>  
> >>  	/* if there's no extensions or no connector, we're done */
> >> -	valid_extensions = edid[0x7e];
> >> +	valid_extensions = edid->extensions;
> >>  	if (valid_extensions == 0)
> >> -		return (struct edid *)edid;
> >> +		return edid;
> >>  
> >>  	new = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH, GFP_KERNEL);
> >>  	if (!new)
> >>  		goto out;
> >>  	edid = new;
> >>  
> >> -	for (j = 1; j <= edid[0x7e]; j++) {
> >> -		u8 *block = edid + j * EDID_LENGTH;
> >> +	for (j = 1; j <= edid->extensions; j++) {
> >> +		void *block = edid + j;
> >>  
> >>  		for (i = 0; i < 4; i++) {
> >>  			if (get_edid_block(data, block, j, EDID_LENGTH))
> >> @@ -2026,13 +2025,13 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
> >>  			valid_extensions--;
> >>  	}
> >>  
> >> -	if (valid_extensions != edid[0x7e]) {
> >> -		u8 *base;
> >> +	if (valid_extensions != edid->extensions) {
> >> +		struct edid *base;
> >
> > This one points to extension blocks too so using 
> > struct edid doesn't seem entirely appropriate.
> 
> So I've gone back and forth with this. I think I want to get rid of u8*
> no matter what, because it always requires casting. I've used void* here
> and there to allow mixed use, internally in drm_edid.c while
> transitioning, and in public interfaces due to usage all over the place.
> 
> OTOH I don't much like arithmetics on void*. It's a gcc extension.
> 
> struct edid * is useful for e.g. ->checksum and arithmetics. In many
> places I've named it struct edid *block to distinguish. We could have a
> struct edid_block too, which could have ->tag and ->checksum members,
> for example, but then it would require casting or a function for "safe"
> typecasting.
> 
> I've also gone back and forth with the helpers for getting a pointer to
> a block. For usage like this, kind of need both const and non-const
> versions. And, with the plans I have for future, I'm not sure I want to
> promote any EDID parsing outside of drm_edid.c, so maybe they should be
> static.
> 
> Undecided. C is a bit clunky here.
> 
> >
> >>  
> >> -		connector_bad_edid(connector, edid, edid[0x7e] + 1);
> >> +		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
> >>  
> >> -		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
> >> -		edid[0x7e] = valid_extensions;
> >> +		edid->checksum += edid->extensions - valid_extensions;
> >> +		edid->extensions = valid_extensions;
> >>  
> >>  		new = kmalloc_array(valid_extensions + 1, EDID_LENGTH,
> >>  				    GFP_KERNEL);
> >> @@ -2040,21 +2039,21 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
> >>  			goto out;
> >>  
> >>  		base = new;
> >> -		for (i = 0; i <= edid[0x7e]; i++) {
> >> -			u8 *block = edid + i * EDID_LENGTH;
> >> +		for (i = 0; i <= edid->extensions; i++) {
> >> +			void *block = edid + i;
> >
> > Hmm. This code seems very broken to me. We read each block
> > into its expected offset based on the original base block extension
> > count, but here we only iterate up to the new ext block count. So
> > if we had eg. a 4 block EDID where block 2 is busted, we set 
> > the new ext count to 2, copy over blocks 0 and 1, skip block 2,
> > and then terminate the loop. So instead of copying block 3 from
> > the orignal EDID into block 2 of the new EDID, we leave the
> > original garbage block 2 in place.
> 
> Ugh. I end up fixing this in the series, in "drm/edid: split out invalid
> block filtering to a separate function", but I don't mention it
> anywhere.
> 
> Looks like it's been broken for 5+ years since commit 14544d0937bf
> ("drm/edid: Only print the bad edid when aborting").
> 
> Which really makes you wonder about the usefulness of trying to "fix"
> the EDID by skipping extension blocks. It was added in commit
> 0ea75e23356f ("DRM: ignore invalid EDID extensions").
> 
> > Also this memcpy() business seems entirely poinless in the sense
> > that we could just read each ext block into the final offset
> > directly AFAICS.
> 
> This is how it was before commit 14544d0937bf.

Hmm. This is actually even a bit worse than I though since it
looks like we can leak uninitialized stuff from kmalloc_array().
I originally thought it was a krealloc()+memmove() but that is
not the case.

> I guess the point is if
> we decide the EDID is garbage, we want to print the original EDID, once,
> not something we've already changed. I also kind of like the idea of
> hiding the broken EDID path magic in a separate function.

I'm wondering we should just stop with this bad block filtering
entirely? Just let the block be all zeroes/crap if that is really
what we got from the sink. And we could still skip known broken
blocks during parsing to avoid getting too confused I guess.

-- 
Ville Syrjälä
Intel
