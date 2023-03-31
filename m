Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DA26D1AB6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA3710F13C;
	Fri, 31 Mar 2023 08:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3CE10F13C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:48:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B267A625AE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDB4C4339C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680252520;
 bh=uOPIzovJQaN2uF3uCRFfcTfMui228WfnHJ8oPe20zeQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZCTbpWPMhYqpd++CTJoOKG+UybwN/OuqSGHgGJgjGO/4eJ1Cy4ofOmSB1IjLXjIm1
 oxTAid3k44j4vdfVOw22nT4C3SI7a4WtOwNgmHOpDho/mzdFPdQGfxBIfEndtSQSIg
 xFnhT6PZpCHV0U6lrY4uBcoYqsq3+WutRhNyl7QXfBLoprcjEzT/0dvBC61ugS5fP2
 vF+a8xUxC+yU5hCk4VFC8Kgct7635ohqqbbwOvobnYhPa907srZs3WzzUhwsxMmduP
 LVv1fX9FBc8u7E8YyVbPLNTO9JmtHXHqZKmdUe/MACGtGaVIkCTWG4Bt1elvVKLKeO
 lSyqVmpl8Jo7g==
Received: by mail-pf1-f169.google.com with SMTP id dw14so14314284pfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 01:48:40 -0700 (PDT)
X-Gm-Message-State: AAQBX9fpi5NTFbwL4FLnNDn6sDbmVJlNerbuYX5WbShMkgd7mroqxNxY
 8tg/KKPgH1/Z2jMWN7o1EW9SCzNke8X7n/8XyHN8cA==
X-Google-Smtp-Source: AKy350Y/MWkqiH7ijwIPbG8OO//iuA04N3BGZZ2M7G62QG2A4MpVvHeBi7S5bOepo2n+hR49zH/MKBuCzZcODRujn6Q=
X-Received: by 2002:a63:dd0f:0:b0:4fc:a80e:e6ec with SMTP id
 t15-20020a63dd0f000000b004fca80ee6ecmr7342372pgg.5.1680252520141; Fri, 31 Mar
 2023 01:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230331030204.1179524-1-treapking@chromium.org>
In-Reply-To: <20230331030204.1179524-1-treapking@chromium.org>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 31 Mar 2023 10:48:29 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4i+3H4-e7wCGTrpR+RCZy4OfgErn3bFmOWtWRkZy_whg@mail.gmail.com>
Message-ID: <CAN6tsi4i+3H4-e7wCGTrpR+RCZy4OfgErn3bFmOWtWRkZy_whg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Use constant sleep time for polling
 hpd
To: Pin-yen Lin <treapking@chromium.org>
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
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 5:02=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> The default hpd_wait_us in panel_edp.c is 2 seconds. This makes the
> sleep time in the polling of _ps8640_wait_hpd_asserted become 200ms.
> Change it to a constant 20ms to speed up the function.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index b823e55650b1..c3eb45179405 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -184,7 +184,7 @@ static int _ps8640_wait_hpd_asserted(struct ps8640 *p=
s_bridge, unsigned long wai
>          * actually connected to GPIO9).
>          */
>         ret =3D regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> -                                      status & PS_GPIO9, wait_us / 10, w=
ait_us);
> +                                      status & PS_GPIO9, 20000, wait_us)=
;
>
>         /*
>          * The first time we see HPD go high after a reset we delay an ex=
tra
> --
> 2.40.0.348.gf938b09366-goog
>

Snoozing for a few days before applying.

Reviewed-by: Robert Foss <rfoss@kernel.org>
