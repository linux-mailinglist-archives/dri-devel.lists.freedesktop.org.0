Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03FE3BEBD4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 18:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D296E059;
	Wed,  7 Jul 2021 16:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145906E059
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 16:14:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209376504"
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="209376504"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 09:14:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="487018553"
Received: from rvanakke-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.40.173])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 09:14:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/dp: follow DP link CTS spec to read link status
 back
In-Reply-To: <20210707153318.13903-1-shawn.c.lee@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210707150042.6376-1-shawn.c.lee@intel.com>
 <20210707153318.13903-1-shawn.c.lee@intel.com>
Date: Wed, 07 Jul 2021 19:14:31 +0300
Message-ID: <87pmvu6qzc.fsf@intel.com>
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
Cc: Cooper Chiou <cooper.chiou@intel.com>,
 William Tseng <william.tseng@intel.com>, Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Jul 2021, Lee Shawn C <shawn.c.lee@intel.com> wrote:
> Refer to DP link CTS 1.2/1.4 spec, the following test case request
> source read DPCD 200h - 205h to get latest link status from sink.
>
> (4.3.2.4) Handling of IRQ HPD Pulse with No Error Status Bits Set
> (400.3.2.1) Successful Link Re-training After IRQ HPD Pulse
>             Due to Loss of Symbol Lock: HBR2 Extension
> (400.3.2.2) Successful Link Re-training After IRQ HPD Pulse Due
>             to Loss of Clock Recovery Lock: HBR2 Extension
> (400.3.2.3) Successful Link Re-training After IRQ HPD Pulse Due
>             to Loss of Inter-lane Alignment Lock: HBR2 Extension
>
> So far, DRM DP driver just read back the link status from 202h
> to 207h. DPR-120 would judge source can't pass these cases and
> shows below error messages.
>
> "Test FAILED, Source DUT does not read DPCD registers 200h-205h
> within 100 ms".

Acked-by: Jani Nikula <jani.nikula@intel.com>

for making the test pass iff everything else seems to work.

The underlying question is, though, should we look at 0x200-0x201 for
some status we don't look at?


>
> v2: Use sizeof() to retrieve array size.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Cooper Chiou <cooper.chiou@intel.com>
> Cc: William Tseng <william.tseng@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_hel=
per.c
> index 24bbc710c825..4f03df317d62 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -410,17 +410,19 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_=
aux *aux,
>  				     u8 link_status[DP_LINK_STATUS_SIZE])
>  {
>  	int ret;
> +	u8 full_link_stat[DP_LINK_STATUS_SIZE + 2];
>=20=20
>  	if (dp_phy =3D=3D DP_PHY_DPRX) {
>  		ret =3D drm_dp_dpcd_read(aux,
> -				       DP_LANE0_1_STATUS,
> -				       link_status,
> -				       DP_LINK_STATUS_SIZE);
> +				       DP_SINK_COUNT,
> +				       full_link_stat,
> +				       sizeof(full_link_stat));
>=20=20
>  		if (ret < 0)
>  			return ret;
>=20=20
> -		WARN_ON(ret !=3D DP_LINK_STATUS_SIZE);
> +		memcpy(link_status, full_link_stat + 2, DP_LINK_STATUS_SIZE);
> +		WARN_ON(ret !=3D DP_LINK_STATUS_SIZE + 2);
>=20=20
>  		return 0;
>  	}

--=20
Jani Nikula, Intel Open Source Graphics Center
