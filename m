Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CF2660C2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4816D6E956;
	Fri, 11 Sep 2020 13:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E706E956
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:56:40 +0000 (UTC)
IronPort-SDR: +HFog+SaVJ8DMbPcp591Kftx9MokrsM14lsbGQHl5QvVkBJ+fVKGPPRqXUkrgQ8suNsdLqS0oh
 mSCb+Y84J90w==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="159692724"
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; d="scan'208";a="159692724"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 06:56:39 -0700
IronPort-SDR: vmjohGXeCztnlk0HvpTJJd5IK/ylPkCfq+HKaYOu83Xe+UYZw4oOsfGeUHsoE/+XJ7K8FKmbE4
 ANMKFfA6LC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; d="scan'208";a="342306628"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 11 Sep 2020 06:56:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Sep 2020 16:56:34 +0300
Date: Fri, 11 Sep 2020 16:56:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH] drm/imx/dcss: fix 64-bit divisions
Message-ID: <20200911135634.GI6112@intel.com>
References: <20200911134827.32142-1-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911134827.32142-1-laurentiu.palcu@oss.nxp.com>
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 11, 2020 at 04:48:27PM +0300, Laurentiu Palcu wrote:
> Use div_s64() for the 64-bit divisions. This would allow the driver to co=
mpile
> on 32-bit architectures, if needed.
> =

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx=
/dcss/dcss-scaler.c
> index cd21905de580..7c1e0e461244 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> @@ -134,7 +134,7 @@ static int div_q(int A, int B)
>  	else
>  		temp -=3D B / 2;
>  =

> -	result =3D (int)(temp / B);
> +	result =3D (int)(div_s64(temp, B));
>  	return result;
>  }
>  =

> @@ -237,7 +237,7 @@ static void dcss_scaler_gaussian_filter(int fc_q, boo=
l use_5_taps,
>  			ll_temp =3D coef[phase][i];
>  			ll_temp <<=3D PSC_COEFF_PRECISION;
>  			ll_temp +=3D sum >> 1;
> -			ll_temp /=3D sum;

That looks like hand rolled DIV_ROUND_CLOSEST_ULL()

> +			ll_temp =3D div_s64(ll_temp, sum);
>  			coef[phase][i] =3D (int)ll_temp;
>  		}
>  	}
> -- =

> 2.17.1
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
