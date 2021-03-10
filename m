Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E0E334795
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 20:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC186E2B8;
	Wed, 10 Mar 2021 19:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474006E2A3;
 Wed, 10 Mar 2021 19:10:09 +0000 (UTC)
IronPort-SDR: PR2O6kyHi1ntSi0RsHFeigtmUe26txCqDUqQGrJBhf9NlulFAdQG9sNGl3XAvgYEAyCDoJk//D
 AzzO+cGxXmQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="249911963"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="249911963"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 11:10:08 -0800
IronPort-SDR: n5OPszd23y7QuDcILN2oQewmGm7has0qgLLqAttcGy7rX3J5VN4WxROqO08HdZrsB4RKrjMsEo
 SLpvflxwxhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="377087951"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 10 Mar 2021 11:10:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Mar 2021 21:10:04 +0200
Date: Wed, 10 Mar 2021 21:10:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC v1 3/6] drm/displayid: add new displayid section/block
 iterators
Message-ID: <YEkZjAzG0izQmN/A@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
 <d0fd3a830b0ebc082250fb6c1381bb8383715263.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0fd3a830b0ebc082250fb6c1381bb8383715263.1615297748.git.jani.nikula@intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 09, 2021 at 03:54:11PM +0200, Jani Nikula wrote:
> Iterating DisplayID blocks across sections (in EDID extensions) is
> unnecessarily complicated for the caller. Implement DisplayID iterators
> to go through all blocks in all sections.
> =

> Usage example:
> =

> 	const struct displayid_block *block;
> 	struct displayid_iter iter;
> =

> 	displayid_iter_edid_begin(edid, &iter);
> 	displayid_iter_for_each(block, &iter) {
> 		/* operate on block */
> 	}
> 	displayid_iter_end(&iter);
> =

> When DisplayID is stored in EDID extensions, the DisplayID sections map
> to extensions as described in VESA DisplayID v1.3 Appendix B: DisplayID
> as an EDID Extension. This is implemented here.
> =

> When DisplayID is stored in its dedicated DDC device 0xA4, according to
> VESA E-DDC v1.3, different rules apply for the structure. This is not
> implemented here, as we don't currently use it, but the idea is you'd
> have a different call for beginning the iteration, for example simply:
> =

> 	displayid_iter_begin(displayid, &iter);
> =

> instead of displayid_iter_edid_begin(), and everything else would be
> hidden away in the iterator functions.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_displayid.c | 74 +++++++++++++++++++++++++++++++++
>  include/drm/drm_displayid.h     | 18 ++++++++
>  2 files changed, 92 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displa=
yid.c
> index 908bbe6feb61..88070267aac9 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -57,3 +57,77 @@ const u8 *drm_find_displayid_extension(const struct ed=
id *edid,
>  =

>  	return displayid;
>  }
> +
> +void displayid_iter_edid_begin(const struct edid *edid,
> +			       struct displayid_iter *iter)
> +{
> +	memset(iter, 0, sizeof(*iter));
> +
> +	iter->edid =3D edid;
> +}
> +
> +static const struct displayid_block *
> +__displayid_iter_block(const struct displayid_iter *iter)
> +{
> +	const struct displayid_block *block;
> +
> +	if (!iter->section)
> +		return NULL;
> +
> +	block =3D (const struct displayid_block *)&iter->section[iter->idx];
> +
> +	if (iter->idx + sizeof(struct displayid_block) <=3D iter->length &&
> +	    iter->idx + sizeof(struct displayid_block) + block->num_bytes <=3D =
iter->length &&

sizeof(*block) perhaps

> +	    block->num_bytes > 0)
> +		return block;
> +
> +	return NULL;
> +}
> +
> +const struct displayid_block *
> +__displayid_iter_next(struct displayid_iter *iter)
> +{
> +	const struct displayid_block *block;
> +
> +	if (!iter->edid)
> +		return NULL;
> +
> +	if (iter->section) {
> +		/* current block should always be valid */
> +		block =3D __displayid_iter_block(iter);
> +		if (WARN_ON(!block)) {
> +			iter->section =3D NULL;
> +			iter->edid =3D NULL;
> +			return NULL;
> +		}
> +
> +		/* next block in section */
> +		iter->idx +=3D sizeof(struct displayid_block) + block->num_bytes;

ditto

Looks like this should do the same thing the current thing does,
or at least I couldn't immediately spot nay differences.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +
> +		block =3D __displayid_iter_block(iter);
> +		if (block)
> +			return block;
> +	}
> +
> +	for (;;) {
> +		iter->section =3D drm_find_displayid_extension(iter->edid,
> +							     &iter->length,
> +							     &iter->idx,
> +							     &iter->ext_index);
> +		if (!iter->section) {
> +			iter->edid =3D NULL;
> +			return NULL;
> +		}
> +
> +		iter->idx +=3D sizeof(struct displayid_hdr);
> +
> +		block =3D __displayid_iter_block(iter);
> +		if (block)
> +			return block;
> +	}
> +}
> +
> +void displayid_iter_end(struct displayid_iter *iter)
> +{
> +	memset(iter, 0, sizeof(*iter));
> +}
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 3c6db22a518a..27e06c98db17 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -108,4 +108,22 @@ const u8 *drm_find_displayid_extension(const struct =
edid *edid,
>  				       int *length, int *idx,
>  				       int *ext_index);
>  =

> +/* DisplayID iteration */
> +struct displayid_iter {
> +	const struct edid *edid;
> +
> +	const u8 *section;
> +	int length;
> +	int idx;
> +	int ext_index;
> +};
> +
> +void displayid_iter_edid_begin(const struct edid *edid,
> +			       struct displayid_iter *iter);
> +const struct displayid_block *
> +__displayid_iter_next(struct displayid_iter *iter);
> +#define displayid_iter_for_each(__block, __iter) \
> +	while (((__block) =3D __displayid_iter_next(__iter)))
> +void displayid_iter_end(struct displayid_iter *iter);
> +
>  #endif
> -- =

> 2.20.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
