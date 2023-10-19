Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5E7CF403
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 11:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5B210E4B0;
	Thu, 19 Oct 2023 09:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D50310E4B0;
 Thu, 19 Oct 2023 09:26:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB35861B4C;
 Thu, 19 Oct 2023 09:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B766EC433C7;
 Thu, 19 Oct 2023 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697707585;
 bh=OCDUlYLWKH4hPIGJgGmkgyAHhL7/848MWsrLLQz3nbQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q9FqAg7Z6b7b6Q+l58S5MAWVseQF0hpk4HZJmu/Hy2hgyt/hquWS//yFAFbJPXpcG
 X4hOWD8y7KfJVGQ/eQL4O5JNMKRj8HKmPlKLZX5i8buLhzX+9g7jHDRGrLj9JjUTPX
 DQrBMOOppV2i/G26YN4EKlDl3ibLcvVPJrTOGb4tYc3VFUZMCRBRlVqkw99uabprEt
 SY0NBKCLqyNNgfC5G2jzbL1q7AYVrU6c8WN/+g30iejbiE4ZvhdsbR67AfG22oI3Ym
 h0G4t60zOQjJPH4PS9JSY8nlfZC889dgSie0TKOnqdIF9FI+Fla58dEyHFqqmZUjZv
 r/6eOlbpmKpvg==
Date: Thu, 19 Oct 2023 11:26:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Message-ID: <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrote:
> The MIPI DSI links do not fully fall into the DRM callbacks model.

Explaining why would help

> The drm_bridge_funcs abstraction.

Is there a typo or missing words?

> Instead of having just two states (off and on) the DSI hosts have
> separate LP-11 state. In this state the host is on, but the video
> stream is not yet enabled.
>=20
> Introduce API that allows DSI bridges / panels to control the DSI host
> power up state.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 31 +++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 29 +++++++++++++++++++++++++----
>  2 files changed, 56 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index 14201f73aab1..c467162cb7d8 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -428,6 +428,37 @@ int devm_mipi_dsi_attach(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_mipi_dsi_attach);
> =20
> +bool mipi_dsi_host_power_control_available(struct mipi_dsi_host *host)
> +{
> +	const struct mipi_dsi_host_ops *ops =3D host->ops;
> +
> +	return ops && ops->power_up;
> +}
> +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_control_available);
> +
> +int mipi_dsi_host_power_up(struct mipi_dsi_host *host)
> +{
> +	const struct mipi_dsi_host_ops *ops =3D host->ops;
> +
> +	if (!mipi_dsi_host_power_control_available(host))
> +		return -EOPNOTSUPP;
> +
> +	return ops->power_up ? ops->power_up(host) : 0;
> +}
> +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_up);
> +
> +void mipi_dsi_host_power_down(struct mipi_dsi_host *host)
> +{
> +	const struct mipi_dsi_host_ops *ops =3D host->ops;
> +
> +	if (!mipi_dsi_host_power_control_available(host))
> +		return;
> +
> +	if (ops->power_down)
> +		ops->power_down(host);
> +}
> +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_down);
> +

If this API is supposed to be used by DSI devices, it should probably
take a mipi_dsi_device pointer as a parameter?

We should probably make sure it hasn't been powered on already too?

Maxime
