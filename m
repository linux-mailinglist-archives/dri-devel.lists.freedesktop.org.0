Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A56E49F4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 15:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10D10E4F1;
	Mon, 17 Apr 2023 13:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608DF10E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 13:33:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 795ED624C2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 13:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6AAC433A7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681738378;
 bh=YnO373PW8kFPYYEga0WKpnzfKPRu65AqgaMNSJcVERc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K+tF1m4CWen8Pb45l6Ofuvy5jJZrWa5OkbOtta7j9xSL9G6y1gPoqts4Q7UuO4GIY
 vhukENSBwvZtBPGFtgwEl245KEawE/4qE3mlVHVJgDb5sUOUiYCAcJVEk/c6neLYTl
 gWZ+D5r+BhCMIH3FySxEc1RlW1VGUGCUhFO1J3cCv6Ok5U5Dk2R4prsB113sohqUqt
 nqBChqzzQf2rpWp0MJuiPL2aaKMhVj/aTsoWw5SNZn052dMEKL77RG5Ft0cQV0OkaG
 n8EkRY3W4SuI9QX8da2TQcMPdtePDgCAt7XK27g20SCvea4ea8RyHM4+SgxBlXm0Eq
 map3H+TcMyv/Q==
Received: by mail-pl1-f182.google.com with SMTP id p8so25695929plk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 06:32:58 -0700 (PDT)
X-Gm-Message-State: AAQBX9fW3ISBxqPikXebsup5NNLa+T38zosvAbVF80Xe3X0j5FG+ZX4H
 0Umx++5EtOSP6/0WUzooY6BLAFY10KzrDddqz0rklg==
X-Google-Smtp-Source: AKy350Y5U4Z/dfv+AvSqZXRHfVhVpKBzwMX3b9aXK5doLIcEmW2NRnzfpKko53ahGbE+qIVjBzucEnKmTK75Bh9acDc=
X-Received: by 2002:a17:90a:2944:b0:247:2c8e:9911 with SMTP id
 x4-20020a17090a294400b002472c8e9911mr3535372pjf.5.1681738378299; Mon, 17 Apr
 2023 06:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-3-jernej.skrabec@gmail.com>
In-Reply-To: <20230415104613.61224-3-jernej.skrabec@gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 17 Apr 2023 15:32:47 +0200
X-Gmail-Original-Message-ID: <CAN6tsi72CP+DO-MG0=7Ajmqnd-q7r4bw_rxnvya-e4wUVEeujg@mail.gmail.com>
Message-ID: <CAN6tsi72CP+DO-MG0=7Ajmqnd-q7r4bw_rxnvya-e4wUVEeujg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: dw_hdmi: Handle snps, disable-cec property
To: Jernej Skrabec <jernej.skrabec@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, samuel@sholland.org, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 15, 2023 at 12:47=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> New DT property allows to skip CEC initialization.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 603bb3c51027..e7e8199d2fb1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3615,7 +3615,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_devic=
e *pdev,
>                 hdmi->audio =3D platform_device_register_full(&pdevinfo);
>         }
>
> -       if (!plat_data->disable_cec && (config0 & HDMI_CONFIG0_CEC)) {
> +       if (!plat_data->disable_cec &&
> +           !of_property_read_bool(np, "snps,disable-cec") &&
> +           (config0 & HDMI_CONFIG0_CEC)) {
>                 cec.hdmi =3D hdmi;
>                 cec.ops =3D &dw_hdmi_cec_ops;
>                 cec.irq =3D irq;
> --
> 2.40.0
>


Reviewed-by: Robert Foss <rfoss@kernel.org>
