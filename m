Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D158A2948
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 10:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCC310F4E6;
	Fri, 12 Apr 2024 08:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWVe/pVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04CA10F4ED;
 Fri, 12 Apr 2024 08:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712910366; x=1744446366;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ulV0hDNZ1+YjugVVo9qryca5gjrsSvECiwW95TvIRWY=;
 b=bWVe/pVYKi9x7TnAgNnpPzl3sIpnILttWcqLoI4uLQPQjYVgBCMWLnBM
 5XaVMv/dSoBvuLzIhkFzBzY+xo18zsJ8Bdx9UnOT9QJ1ZqX6bWwdbgId1
 dkDQI1aheoD67ineY7QUrCncyB1bMd5SoNjrimf4N0jYpHpfAZtZzpepd
 eq07KC5eOcIWS9aEoeUxjpemR5ota5V7JIaPppyyvqk9tBp6g8DbpQjz7
 1+GzCorRuUoIPQRg9FrNOzhgz9Ef0ofN10Ro5M97MhR/j2xML0ZY42Wx/
 clFsY43nLpKKQFnkSFA1mY4i73z0JIC+yygvn4pHLrMroE4OojwsqU51+ Q==;
X-CSE-ConnectionGUID: qqGWk+vaS5aRMtvrVMyD8A==
X-CSE-MsgGUID: rfUifepmTaqAGacamef9Ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8527691"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8527691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 01:26:05 -0700
X-CSE-ConnectionGUID: JxcwGHgmTumVgXAsfsY8Fg==
X-CSE-MsgGUID: NAu4R6L6QvKbBtHjs5Hqmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21259506"
Received: from mohdaris-mobl1.gar.corp.intel.com (HELO localhost)
 ([10.252.61.65])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 01:26:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH] drm/edid: Parse topology block for all DispID structure
 v1.x
In-Reply-To: <20240410180139.21352-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410180139.21352-1-ville.syrjala@linux.intel.com>
Date: Fri, 12 Apr 2024 11:25:57 +0300
Message-ID: <87pluv3s2y.fsf@intel.com>
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

On Wed, 10 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> DisplayID spec v1.3 revision history notes do claim that
> the toplogy block was added in v1.3 so requiring structure
> v1.2 would seem correct, but there is at least one EDID in
> edid.tv with a topology block and structure v1.0. And
> there are also EDIDs with DisplayID structure v1.3 which
> seems to be totally incorrect as DisplayID spec v1.3 lists
> structure v1.2 as the only legal value.
>
> Unfortunately I couldn't find copies of DisplayID spec
> v1.0-v1.2 anywhere (even on vesa.org), so I'll have to
> go on empirical evidence alone.
>
> We used to parse the topology block on all v1.x
> structures until the check for structure v2.0 was added.
> Let's go back to doing that as the evidence does suggest
> that there are DisplayIDs in the wild that would miss
> out on the topology stuff otherwise.
>
> Also toss out DISPLAY_ID_STRUCTURE_VER_12 entirely as
> it doesn't appear we can really use it for anything.
>
> I *think* we could technically skip all the structure
> version checks as the block tags shouldn't conflict
> between v2.0 and v1.x. But no harm in having a bit of
> extra sanity checks I guess.

Our checks for the data block tags is pretty haphazard, and we should
clean this up across the board. For some things we check only the tag
for one version or the other, for some things we check both tags but
without the version check, and for some things (like this one here) we
do check version and tag. The CTA checks rely on the fact that
DATA_BLOCK_CTA =3D=3D DATA_BLOCK_2_CTA_DISPLAY_ID.

It's a mess.

I've thought about adding a helper that would check version & 0xf0 when
checking block tags, and where you could check for one or the other or
both versions.

Like, quickly drafting,

#define NOPE -1

bool is_block(int tag_to_check, int ver, int tag_v1, int tag_v2)
{
	if ((ver & 0xf0) =3D=3D 1 && tag_v1 !=3D NOPE && tag_v1 =3D=3D tag_to_chec=
k)
		return true;
	if ((ver & 0xf0) =3D=3D 2 && tag_v2 !=3D NOPE && tag_v2 =3D=3D tag_to_chec=
k)
		return true;
        return false;
}

And then something like:

	if (is_block(tag, version, DATA_BLOCK_FOO, DATA_BLOCK_2_FOO))
		...

or

	if (is_block(tag, version, NOPE, DATA_BLOCK_2_FOO))
		...

Or just pass iter and block like for displayid_is_tiled_block().

IDK if that becomes unwieldy at the call sites. Maybe we'll need
additional specific helpers like displayid_is_tiled_block() on top.

Anyway, on the patch at hand,

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> So far I'm not aware of any user reported regressions
> from overly strict check, but I do know that it broke
> igt/kms_tiled_display's fake DisplayID as that one
> gets generated with structure v1.0.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Fixes: c5a486af9df7 ("drm/edid: parse Tiled Display Topology Data Block f=
or DisplayID 2.0")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c  | 2 +-
>  include/drm/drm_displayid.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index ea77577a3786..f0948ab214b3 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -7405,7 +7405,7 @@ static void drm_parse_tiled_block(struct drm_connec=
tor *connector,
>  static bool displayid_is_tiled_block(const struct displayid_iter *iter,
>  				     const struct displayid_block *block)
>  {
> -	return (displayid_version(iter) =3D=3D DISPLAY_ID_STRUCTURE_VER_12 &&
> +	return (displayid_version(iter) < DISPLAY_ID_STRUCTURE_VER_20 &&
>  		block->tag =3D=3D DATA_BLOCK_TILED_DISPLAY) ||
>  		(displayid_version(iter) =3D=3D DISPLAY_ID_STRUCTURE_VER_20 &&
>  		 block->tag =3D=3D DATA_BLOCK_2_TILED_DISPLAY_TOPOLOGY);
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 566497eeb3b8..bc1f6b378195 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -30,7 +30,6 @@ struct drm_edid;
>  #define VESA_IEEE_OUI				0x3a0292
>=20=20
>  /* DisplayID Structure versions */
> -#define DISPLAY_ID_STRUCTURE_VER_12		0x12
>  #define DISPLAY_ID_STRUCTURE_VER_20		0x20
>=20=20
>  /* DisplayID Structure v1r2 Data Blocks */

--=20
Jani Nikula, Intel
