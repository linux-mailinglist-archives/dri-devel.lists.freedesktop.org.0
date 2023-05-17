Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B5D706C4A
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 17:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965EE10E445;
	Wed, 17 May 2023 15:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B6E10E445
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 15:11:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 092FC648A9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 15:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDC2C433A7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684336265;
 bh=OSirOKrhPXRh6VEEmJ0sij2rwpLEMf0WmKZreOtHXfw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pVSLG+LybIiNZ8VCUGcyjFO+ltivcBHhQOGWd6cz/lcUSzYf/gY/uuNNi/fHWQ8mA
 PNN9SJMRgiGxaSeT3Aj0lrAVnrlfZz+WbxtRiWBeL9eJUlY7PjF3UP9MEpJRLZESF3
 b+k7ViMLZah9tIQknF9BmsEjsrDIo7cIKMs2wXCOFKTQoYScW0CBqDvg/zVpRk00vU
 OSgXaTjF0FIHXxnyY3yNDLeknYZxKLetgfPBnUG0/cDA+GSCu0j9J/gEeqGJxsRvzR
 QhUIEeLR2RIbApMN5rAmHWB6PqpPo4v7PV7hQsHCMFDbuC+gSRwfkt92FIndVdZ1+8
 BEMYwQO9M8Q+g==
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-25345ca8748so637499a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:11:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDxe+2yrqAByMqsp23wmCeOSUgQUivT0DrFlMys9dwCHqNwOGsOQ
 EIp5c8KIR4VFX3cOotGdknS+kgbG2V8qCOQM1Kei+Q==
X-Google-Smtp-Source: ACHHUZ6Wc87gHXXz9rL/1Zw05i1Nu75n2VEO7RXmIcUqDObdQwWFM0hm6XWtjDQ6hncv5w5WcrkSbaS8iTTAWL3yvog=
X-Received: by 2002:a17:90b:a13:b0:24d:ebfe:be93 with SMTP id
 gg19-20020a17090b0a1300b0024debfebe93mr40714167pjb.37.1684336264393; Wed, 17
 May 2023 08:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230517073654.1263973-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230517073654.1263973-1-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 17 May 2023 17:10:53 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4dB9e00wojd+P8pqc9dS=q1FvwVuBxbQDZ=tTSs25Kqg@mail.gmail.com>
Message-ID: <CAN6tsi4dB9e00wojd+P8pqc9dS=q1FvwVuBxbQDZ=tTSs25Kqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: tc358743: register v4l2 async device only
 after successful setup
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 9:37=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Ensure the device has been setup correctly before registering the v4l2
> async device, thus allowing userspace to access.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Change in v2:
> * New approach: Register async device as last step
>
> This superseeds the patch at [1], but has a different subject due to new
> solution.
>
> [1] https://lore.kernel.org/linux-media/20230502140612.2256850-1-alexande=
r.stein@ew.tq-group.com/
>
>  drivers/media/i2c/tc358743.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index ad6a72b2bcf5..9d4bd73469bf 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -2091,9 +2091,6 @@ static int tc358743_probe(struct i2c_client *client=
)
>         state->mbus_fmt_code =3D MEDIA_BUS_FMT_RGB888_1X24;
>
>         sd->dev =3D &client->dev;
> -       err =3D v4l2_async_register_subdev(sd);
> -       if (err < 0)
> -               goto err_hdl;
>
>         mutex_init(&state->confctl_mutex);
>
> @@ -2151,6 +2148,10 @@ static int tc358743_probe(struct i2c_client *clien=
t)
>         if (err)
>                 goto err_work_queues;
>
> +       err =3D v4l2_async_register_subdev(sd);
> +       if (err < 0)
> +               goto err_work_queues;
> +
>         v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
>                   client->addr << 1, client->adapter->name);
>
> --
> 2.34.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
