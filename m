Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E67CA43D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5DF10E172;
	Mon, 16 Oct 2023 09:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D064310E172
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:35:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2EDB260E55
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA1AC433CA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697448903;
 bh=08RwPAFhQQBR9+3+vaVem7ZmyE7yfKR9t3dZ0nlmlLA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VtidlM8bhrWfVfNvoVEavs56QAuGGCcJScFneh+wKyM8oke/sc2WmNqg6X7e/lIBO
 8Kn0mSn9NUzNp+WLXGlgRZdKiUUWGBxebPgTx6wo3n+AUgTPhxddc8zfL+Cz+fVnBR
 6qOstadMKPLahmjKKVufB4baqSrlYcpg58QKH1MddSVR+Eegn1N9/liVZNUXf8I68F
 g3Q1OBP4F70OrmUJ0XnX/4TAo2wzgRZZSb4UOGeXyAxisT510XKw0jsomjQo+Mmp7V
 MUUfL7HplVC31M/WcEroj4YoudpPVQeCfsXVbtRcIl7XhBkfYaA1ixtHSZfApWx+a1
 63eGGLq5nl3pA==
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-27d129e2e7cso3110422a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 02:35:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YzCkeki7nljV44q1Y2MUo/8/neqCBW9FTT8sPXokxlj8wqx5sar
 rdLshf8x34Zm27mj5wU6kic8AcgM1p0mOB9Sajjn1A==
X-Google-Smtp-Source: AGHT+IGefl17f6qJBS8qDFsxfojkSaw79hdfyllsWak5ERJVinwnC95MX1CvWzd4k2vxMREYAqa52ejo7aacKnpx9JI=
X-Received: by 2002:a17:90a:319:b0:27d:3a2a:1e2c with SMTP id
 25-20020a17090a031900b0027d3a2a1e2cmr5620329pje.15.1697448903498; Mon, 16 Oct
 2023 02:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230821034008.3876938-1-victor.liu@nxp.com>
 <20230821034008.3876938-2-victor.liu@nxp.com>
In-Reply-To: <20230821034008.3876938-2-victor.liu@nxp.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 16 Oct 2023 11:34:52 +0200
X-Gmail-Original-Message-ID: <CAN6tsi41uBqS-H3hadVU2r_+26R1JHrFDZK4yjAXUocurNGSEg@mail.gmail.com>
Message-ID: <CAN6tsi41uBqS-H3hadVU2r_+26R1JHrFDZK4yjAXUocurNGSEg@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 1/9] drm/bridge: synopsys: dw-mipi-dsi: Add
 dw_mipi_dsi_get_bridge() helper
To: Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, zyw@rock-chips.com, sam@ravnborg.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, linux-imx@nxp.com,
 jagan@amarulasolutions.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 raphael.gallais-pou@foss.st.com, s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 yannick.fertre@foss.st.com, hjc@rock-chips.com, philippe.cornu@foss.st.com,
 kernel@pengutronix.de, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 5:37=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Add dw_mipi_dsi_get_bridge() helper so that it can be used by vendor
> drivers which implement vendor specific extensions to Synopsys DW MIPI DS=
I.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v3:
> * No change.
>
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 6 ++++++
>  include/drm/bridge/dw_mipi_dsi.h              | 2 ++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/=
drm/bridge/synopsys/dw-mipi-dsi.c
> index 04d4a1a10698..ba3cd2a3e339 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -1211,6 +1211,12 @@ void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi=
, struct dw_mipi_dsi *slave)
>  }
>  EXPORT_SYMBOL_GPL(dw_mipi_dsi_set_slave);
>
> +struct drm_bridge *dw_mipi_dsi_get_bridge(struct dw_mipi_dsi *dsi)
> +{
> +       return &dsi->bridge;
> +}
> +EXPORT_SYMBOL_GPL(dw_mipi_dsi_get_bridge);
> +
>  /*
>   * Probe/remove API, used from platforms based on the DRM bridge API.
>   */
> diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mip=
i_dsi.h
> index 5286a53a1875..f54621b17a69 100644
> --- a/include/drm/bridge/dw_mipi_dsi.h
> +++ b/include/drm/bridge/dw_mipi_dsi.h
> @@ -11,6 +11,7 @@
>
>  #include <linux/types.h>
>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_modes.h>
>
>  struct drm_display_mode;
> @@ -68,5 +69,6 @@ void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi);
>  int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encode=
r);
>  void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi);
>  void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *=
slave);
> +struct drm_bridge *dw_mipi_dsi_get_bridge(struct dw_mipi_dsi *dsi);
>
>  #endif /* __DW_MIPI_DSI__ */
> --
> 2.37.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
