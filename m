Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2095C1FFE8E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 01:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F6F6E48D;
	Thu, 18 Jun 2020 23:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1F06E484;
 Thu, 18 Jun 2020 23:21:51 +0000 (UTC)
IronPort-SDR: Of7j82n7ywX+HP2Cc1LDtTt/TrcfBpRPtYskaBEjkFCvVQAXESKMn67/GbamUU38LddrmuC1x7
 Zg5TguXRI9sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="130136489"
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; d="scan'208";a="130136489"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 16:21:50 -0700
IronPort-SDR: d0RREbJANA5nmi/MaT59IThMUpkgu1qOmTmd+SAES1gl3lHyLVANSkNtlqVPNXfhCJKCAApIVY
 /UHKhKd+fnhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; d="scan'208";a="299866017"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2020 16:21:48 -0700
Date: Thu, 18 Jun 2020 16:23:03 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 1/3] drm/dp: DRM DP helper for reading Ignore MSA from
 DPCD
Message-ID: <20200618232303.GB32149@intel.com>
References: <20200612230444.10121-1-manasi.d.navare@intel.com>
 <20200612230444.10121-2-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612230444.10121-2-manasi.d.navare@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

@Jani N, could you give an ACK on this if this looks okay, addressed
your review comments regarding the name of the function.
Else I have a r-b functionality wise so good to get merged?

Regards
Manasi

On Fri, Jun 12, 2020 at 04:04:42PM -0700, Manasi Navare wrote:
> DP sink device sets the Ignore MSA bit in its
> DP_DOWNSTREAM_PORT_COUNT register to indicate its ability to
> ignore the MSA video timing parameters and its ability to support
> seamless video timing change over a range of timing exposed by
> DisplayID and EDID.
> This is required for the sink to indicate that it is Adaptive sync
> capable.
> =

> v3:
> * Fi the typo in commit message (Manasi)
> v2:
> * Rename to describe what the function does (Jani Nikula)
> =

> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  include/drm/drm_dp_helper.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> =

> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 1165ec105638..e47dc22ebf50 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1457,6 +1457,14 @@ drm_dp_alternate_scrambler_reset_cap(const u8 dpcd=
[DP_RECEIVER_CAP_SIZE])
>  			DP_ALTERNATE_SCRAMBLER_RESET_CAP;
>  }
>  =

> +/* Ignore MSA timing for Adaptive Sync support on DP 1.4 */
> +static inline bool
> +drm_dp_sink_can_do_video_without_timing_msa(const u8 dpcd[DP_RECEIVER_CA=
P_SIZE])
> +{
> +	return dpcd[DP_DOWN_STREAM_PORT_COUNT] &
> +		DP_MSA_TIMING_PAR_IGNORED;
> +}
> +
>  /*
>   * DisplayPort AUX channel
>   */
> -- =

> 2.19.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
