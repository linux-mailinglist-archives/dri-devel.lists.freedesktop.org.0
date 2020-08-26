Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C682534D0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 18:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E093F6E983;
	Wed, 26 Aug 2020 16:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183016E1A2;
 Wed, 26 Aug 2020 16:25:19 +0000 (UTC)
IronPort-SDR: zliNbioQJCuCXB+izY1+Y/kgkPhDeFf69CuXjKj8yNiixI5wwNYjbegVHs3d/CjZPrgBNNvZzI
 VxpaqunWrUhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="135876679"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="135876679"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 09:25:04 -0700
IronPort-SDR: 6lt9+j4eGT0v5tDACuVd3B8bxb9Q1oeuYvvvqx15jOzrfAwovc5udQTe/+x3iWHyqTR74WnxUj
 xV5hGEGnYrBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="336877690"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 26 Aug 2020 09:24:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 26 Aug 2020 19:24:58 +0300
Date: Wed, 26 Aug 2020 19:24:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] drm/i915/lspcon: Limits to 8 bpc for RGB/YCbCr444
Message-ID: <20200826162458.GP6112@intel.com>
References: <20200826052143.17607-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826052143.17607-1-kai.heng.feng@canonical.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 26, 2020 at 01:21:15PM +0800, Kai-Heng Feng wrote:
> LSPCON only supports 8 bpc for RGB/YCbCr444.
> =

> Set the correct bpp otherwise it renders blank screen.

Hmm. Does =

git://github.com/vsyrjala/linux.git dp_downstream_ports_5
work?

Actually better make that dp_downstream_ports_5^^^^^^^^^^^ aka.
54d846ce62a2 ("drm/i915: Do YCbCr 444->420 conversion via DP protocol
converters") to avoid the experiments and hacks I have sitting on top.

> =

> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2195
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_lspcon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/dr=
m/i915/display/intel_lspcon.c
> index b781bf469644..c7a44fcaade8 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -196,7 +196,8 @@ void lspcon_ycbcr420_config(struct drm_connector *con=
nector,
>  		crtc_state->port_clock /=3D 2;
>  		crtc_state->output_format =3D INTEL_OUTPUT_FORMAT_YCBCR444;
>  		crtc_state->lspcon_downsampling =3D true;
> -	}
> +	} else
> +		crtc_state->pipe_bpp =3D 24;
>  }
>  =

>  static bool lspcon_probe(struct intel_lspcon *lspcon)
> -- =

> 2.17.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
