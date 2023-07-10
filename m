Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE474D38C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 12:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD7A10E26D;
	Mon, 10 Jul 2023 10:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B890A10E264
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688985130; x=1720521130;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tz2zZQ8f/yg7gZP7NI81aF7OXMQPyUOJOe7LMRyGsrg=;
 b=mZiJt/QjqLetTNdLaaMvfxe56A13iocCZeSuFDdysBey2RgZ9X9ILu96
 1oIrzTn2IoVP0iYVm3u8w42a7VvekI3x9LAxxZ4K73qvOSEZ5+k5XYN/F
 uu6CxDs35lv2lTyDwJsfOwWFv0mVuMt4wPdG1EpseltiuIrIYmoXHWEzC
 atVNuI8wsHkcRNrKDsgwg/UjfS0vu1wMftMWYWOWV7mYNld/9ZAFJmPkx
 NuqLsUfd5BbON7W5s3G08p54KKT4EZCvvMP+wcWeysiH+vzBsDFg5cHDF
 bBU9HYWJyiBdOdTPNrVNTS9RRjk3JH7NhzSTfJrPFnngiaPSMImZwMXp5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="349110579"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="349110579"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="723960814"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="723960814"
Received: from stoicaan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.170])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:32:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH RESEND] drm/bridge: anx7625: Use common macros for DP
 power sequencing commands
In-Reply-To: <20230710090929.1873646-1-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230710090929.1873646-1-wenst@chromium.org>
Date: Mon, 10 Jul 2023 13:32:03 +0300
Message-ID: <87edlgjbvg.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> The DRM DP code has macros for the DP power sequencing commands. Use
> them in the anx7625 driver instead of raw numbers.
>
> Fixes: 548b512e144f ("drm/bridge: anx7625: send DPCD command to downstrea=
m")
> Fixes: 27f26359de9b ("drm/bridge: anx7625: Set downstream sink into norma=
l status")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Collected tags and rebased on v6.5-rc1.
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 8b985efdc086..9db3784cb554 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -931,8 +931,8 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
>=20=20
>  	dev_dbg(dev, "set downstream sink into normal\n");
>  	/* Downstream sink enter into normal mode */
> -	data =3D 1;
> -	ret =3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
> +	data =3D DP_SET_POWER_D0;
> +	ret =3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POWER, 1, &d=
ata);

So you have code to implement the drm dp aux abstractions, why aren't
you using drm_dp_dpcd_writeb() and friends here?

BR,
Jani.


>  	if (ret < 0)
>  		dev_err(dev, "IO error : set sink into normal mode fail\n");
>=20=20
> @@ -971,8 +971,8 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
>=20=20
>  	dev_dbg(dev, "notify downstream enter into standby\n");
>  	/* Downstream monitor enter into standby mode */
> -	data =3D 2;
> -	ret |=3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data=
);
> +	data =3D DP_SET_POWER_D3;
> +	ret |=3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POWER, 1, &=
data);
>  	if (ret < 0)
>  		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");

--=20
Jani Nikula, Intel Open Source Graphics Center
