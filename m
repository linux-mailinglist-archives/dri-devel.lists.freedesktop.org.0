Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16C6CFFF2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 11:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BC210ED78;
	Thu, 30 Mar 2023 09:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295B710ED78
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:40:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B907EB82752
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C77EC433AE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680169223;
 bh=TZ7+QJNcppwvyxngwgi947mNMBOSswS1rVlzdkVli48=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ap09+DK5stGHogCVd6LMMRWlwG1G77gDDgzJ3aPGy9zQUAUehwCmI8oUFQT19QGvY
 O4dmZmpsi9o+UqZL++MBID6nUK/SfPjGKrrvqcfDUfFIoWsPYtMbHFj4Ke5Qs2XmFE
 odcn/oI7Oz/tcYYnKlkTFl1yUxzufFID25UObVvqxrcVrD4LPnbvZJ2Rw8XBy6yLoV
 VVJOoN7KSKFs6R02onzG4w7zWZneSJrrrAeOaSRUJK371otmP/nUjsfxAjCO007T1b
 bNMo+7bp18ES0AaJOk99sNVoOj8KQSkULyL5zTD5kQ4EKARdWhb9NTZleopS9I6KGM
 81+gfz6w15n2Q==
Received: by mail-pl1-f171.google.com with SMTP id c18so17523391ple.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 02:40:23 -0700 (PDT)
X-Gm-Message-State: AAQBX9d6xXwbF67o4sqKhZQX5S+EcZK4MWYpDg/K3BzqvXbMcecSCbC0
 QE77CZygYj12IcDDeqp+/B5943LjWs8ALTN5gS3D7Q==
X-Google-Smtp-Source: AKy350Zc060ocRd8FeXDfv9ppwm12XZxKMuK6TCTjOSTZiTrlfJZ3EJN88IehlFDe/vgfu9DrYctMQcRdfywnEtBmxc=
X-Received: by 2002:a17:902:b18a:b0:1a1:8f72:e9b with SMTP id
 s10-20020a170902b18a00b001a18f720e9bmr8239215plr.7.1680169222352; Thu, 30 Mar
 2023 02:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230330093131.424828-1-francesco@dolcini.it>
In-Reply-To: <20230330093131.424828-1-francesco@dolcini.it>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 30 Mar 2023 11:40:11 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6DB4wsxAriDWimRE2-FW80LMOsX9DDkNQdifYFCUMjGg@mail.gmail.com>
Message-ID: <CAN6tsi6DB4wsxAriDWimRE2-FW80LMOsX9DDkNQdifYFCUMjGg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: lt8912b: Fix DSI Video Mode
To: Francesco Dolcini <francesco@dolcini.it>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, stable@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 11:31=E2=80=AFAM Francesco Dolcini <francesco@dolci=
ni.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> LT8912 DSI port supports only Non-Burst mode video operation with Sync
> Events and continuous clock on clock lane, correct dsi mode flags
> according to that removing MIPI_DSI_MODE_VIDEO_BURST flag.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index b40baced1331..13c131ade268 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -504,7 +504,6 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
>         dsi->format =3D MIPI_DSI_FMT_RGB888;
>
>         dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO |
> -                         MIPI_DSI_MODE_VIDEO_BURST |
>                           MIPI_DSI_MODE_LPM |
>                           MIPI_DSI_MODE_NO_EOT_PACKET;
>
> --
> 2.25.1
>

Letting this sleep for a few days before applying.

Reviewed-by: Robert Foss <rfoss@kernel.org>
