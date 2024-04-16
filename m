Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B888A6C7E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685FB10F06E;
	Tue, 16 Apr 2024 13:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AduxKibg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8010610F06E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:34:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5238CCE106B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78127C32786
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713274430;
 bh=y44+MXwINffl7FTl3NXZCF8gOj5eIknEcj0Cw0D79Fw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AduxKibg/vDcJqZusYFbU/zYf17VVlXSEFHn3n7QO/hCx88Ljde5kSw+tNICWDatO
 WmUe/X8pXd56vuO4c4NJE1vMjbcKr8U7jAIP/TomPMRWpK8CXnF9qxodnm3ur9Es9u
 H7WJyeDxrgks62NFh0ITi1mbvxsLomydGOle69YtFNokanT2uO//ukWLqTncHJuohQ
 fwM+sfVlGzrc7TcZN0NxDsJjtkcJBqOxQ7wTWuvq4rD1X3++4xy0zlGizYwQ66C3e2
 wyUyWQ5oBRXvNFlVO43OaiWbNcOes7TPP25yYojZ6E/VNZzKAl/A+hznbZ6QHF32v/
 XYezOy3HXHjMw==
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3c6fc350ccaso787563b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 06:33:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCULOBTzZ4BNp5V05Q4N+cmTQacCH7dyzTINZI6MR97V4t6jlr7sXfEUunvTJ5M7gvqfjBZOeGoXnn2vAEkflWjAwgZyoArD0IjKvq1kB2n6
X-Gm-Message-State: AOJu0Yw/ZGT+GqE0a9fko5IDGiTXtwmOqxARWzgo5/UlQucg3glX17cM
 Zo32hBNHQcviJf5xy3eJVM6NGOiU98smSk3xWd6eIasI6bO3qHh265jBFhIQUtsmPHZy/nWb3MG
 JvS48Zc8pcOcNlU1B6IZh07WUXrUgpMkbflghQg==
X-Google-Smtp-Source: AGHT+IG4v+6Or3Vouic5yjwN06PSJ/2CUtWhHztGEiynLqWQPPJkcyjNAFlV67Bmhg5GCxwfvftcKG0C7q8GH+b4z7g=
X-Received: by 2002:a25:c54f:0:b0:dd9:20d6:fd2 with SMTP id
 v76-20020a25c54f000000b00dd920d60fd2mr10893104ybe.27.1713274409056; Tue, 16
 Apr 2024 06:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240412083532.11540-1-amishin@t-argos.ru>
In-Reply-To: <20240412083532.11540-1-amishin@t-argos.ru>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 16 Apr 2024 15:33:18 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6kGCGU5_zQD17-tELy94w6W5hU0nzfeR2KPhEztCayNQ@mail.gmail.com>
Message-ID: <CAN6tsi6kGCGU5_zQD17-tELy94w6W5hU0nzfeR2KPhEztCayNQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: bridge: cdns-mhdp8546: Fix possible null pointer
 dereference
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Swapnil Jakhade <sjakhade@cadence.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nikhil Devshatwar <nikhil.nd@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 Rob Herring <robh@kernel.org>, Zhu Wang <wangzhu9@huawei.com>, 
 Yuti Amonkar <yamonkar@cadence.com>, Jyri Sarha <jsarha@ti.com>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Aleksandr,

On Fri, Apr 12, 2024 at 10:40=E2=80=AFAM Aleksandr Mishin <amishin@t-argos.=
ru> wrote:
>
> In cdns_mhdp_atomic_enable(), the return value of drm_mode_duplicate() is
> assigned to mhdp_state->current_mode, and there is a dereference of it in
> drm_mode_set_name(), which will lead to a NULL pointer dereference on
> failure of drm_mode_duplicate().
>
> Fix this bug by adding a check of mhdp_state->current_mode.
>
> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/D=
P bridge")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
> v2: Fix a mistake where the mutex remained locked
>
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index e226acc5c15e..5b831d6d7764 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2059,6 +2059,11 @@ static void cdns_mhdp_atomic_enable(struct drm_bri=
dge *bridge,
>         mhdp_state =3D to_cdns_mhdp_bridge_state(new_state);
>
>         mhdp_state->current_mode =3D drm_mode_duplicate(bridge->dev, mode=
);
> +       if (!mhdp_state->current_mode) {
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +

This chunk no longer applies on drm-misc-next.

I think the approach here is still better than what is in
drm-misc-next since it unlocks link_mutex.

Can you rebase + reword the commit message and send that out as v3?

>         drm_mode_set_name(mhdp_state->current_mode);
>
>         dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__, mode->name=
);
> --
> 2.30.2
>
