Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921B77DCF6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 11:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6BC10E315;
	Wed, 16 Aug 2023 09:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD54510E22D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:08:08 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-58c531d9a4aso27275167b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf.com; s=google; t=1692176888; x=1692781688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4E6y+EsBZT+xa8sFtpV5pHAhyhxp/Z2XFWH1I0j3iY=;
 b=k2SpWvwJV96h7cjYIgbcAulHgYn/SeqI69Ta92U7nJxV/Rb2epbSBTK4byp3Rmssvy
 ei8z6iSXMVHSuo9TokjCpvjSPGSrbC84gYidM3i3g2t2yLwwqI0qSiIS5IREK77PLAPb
 JKNt6V7YGovc6cwJIsYByqMXtZP+eQ71Ncz/boUHrTWcDW0vrseG6ObaXC55iGJ3BvD2
 cCbgJSKNYm+8nN5DwbzLHiT6PrS43DOORmHJ6jQZmgT9DYcEHzk9+Mddz98cGsejuLB6
 v/Cj7qogF/GlfA7E8JYrq+Zx+JiQ3Ms3KjTm++H++s6mQB+KMUbKKtiu7aNL5ZUcuFiu
 YH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692176888; x=1692781688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4E6y+EsBZT+xa8sFtpV5pHAhyhxp/Z2XFWH1I0j3iY=;
 b=XwfyZdmi9rrddksz5MBsJCo0Ksx1AJagx1qxmNetH60gIPibOu7hub+ex9Ro8lg2N2
 GUd6HIm3Fli3Temx8a0q+sLz6ga4RHTj+ncZxYRjLxa7nZcvmc++ugtGtwBCJigFGDV/
 zdr6wRUPk3ZEs1DMDNL238WUSVkdcqLUDDe4ZumtnlQkXjuEhO1xvo04xfWATxSnUHGE
 LmGYTUUCCGz4VgQNG/MXZRMR5n+tfeIFReliNaezSD1oiIoG7cJWpnlcQ2wb2XvSTDnM
 f0Cterv0kRnfznnq0awPSPFLjNzshmAvgcIBYwMl6kLCaboggTSQ5LQqgk3d2dFHU891
 cCgA==
X-Gm-Message-State: AOJu0Yz3gC9XR2dynSSoHWuA3BEekJVEtiDNUFpuYX92rEkOP4H7ngbD
 ogUNcoQF2ChnFLxCro0pppj/cebJmaVQVpFns2OyVQ==
X-Google-Smtp-Source: AGHT+IHs3/3TrKxg3s9PVZt7PqVQ46mOv8b7b4u/wLYVkSAhu+ZR5b9bIvK6MhNsKqncE6TPb64oJar7x9WLjBTwuTA=
X-Received: by 2002:a0d:d649:0:b0:583:7564:49de with SMTP id
 y70-20020a0dd649000000b00583756449demr1616392ywd.3.1692176887862; Wed, 16 Aug
 2023 02:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230803092308.79197-1-lma@semihalf.com>
In-Reply-To: <20230803092308.79197-1-lma@semihalf.com>
From: Lukasz Majczak <lma@semihalf.com>
Date: Wed, 16 Aug 2023 11:07:56 +0200
Message-ID: <CAFJ_xbqoVjXQXJZ0krbsRqUOe3hLNubi12r_q=idSgkfeV=LRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Fix NULL deref in
 get_mst_branch_device_by_guid_helper()
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: stable@vger.kernel.org, upstream@semihalf.com,
 dri-devel@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

czw., 3 sie 2023 o 11:23 Lukasz Majczak <lma@semihalf.com> napisa=C5=82(a):
>
> Check mgr->mst_primary, before passing it to
> the get_mst_branch_device_by_guid_helper(), otherwise NULL dereference
> may occur in the call to memcpy() and cause:
>
> [12579.365869] BUG: kernel NULL pointer dereference, address: 00000000000=
00049
> [12579.365878] #PF: supervisor read access in kernel mode
> [12579.365880] #PF: error_code(0x0000) - not-present page
> [12579.365882] PGD 0 P4D 0
> [12579.365887] Oops: 0000 [#1] PREEMPT SMP NOPTI
> ...
> [12579.365895] Workqueue: events_long drm_dp_mst_up_req_work
> [12579.365899] RIP: 0010:memcmp+0xb/0x29
> [12579.365921] Call Trace:
> [12579.365927] get_mst_branch_device_by_guid_helper+0x22/0x64
> [12579.365930] drm_dp_mst_up_req_work+0x137/0x416
> [12579.365933] process_one_work+0x1d0/0x419
> [12579.365935] worker_thread+0x11a/0x289
> [12579.365938] kthread+0x13e/0x14f
> [12579.365941] ? process_one_work+0x419/0x419
> [12579.365943] ? kthread_blkcg+0x31/0x31
> [12579.365946] ret_from_fork+0x1f/0x30
>
> Similar check is done in e.g: drm_dp_mst_topology_get_mstb_validated().
>
> Fixes: 5e93b8208d3c ("drm/dp/mst: move GUID storage from mgr, port to onl=
y mst branch")
> Cc: <stable@vger.kernel.org> # 4.14+
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index ed96cfcfa304..703cd97b1d11 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2595,19 +2595,19 @@ static struct drm_dp_mst_branch *
>  drm_dp_get_mst_branch_device_by_guid(struct drm_dp_mst_topology_mgr *mgr=
,
>                                      const uint8_t *guid)
>  {
> -       struct drm_dp_mst_branch *mstb;
> +       struct drm_dp_mst_branch *mstb =3D NULL;
>         int ret;
>
>         /* find the port by iterating down */
>         mutex_lock(&mgr->lock);
> -
> -       mstb =3D get_mst_branch_device_by_guid_helper(mgr->mst_primary, g=
uid);
> -       if (mstb) {
> -               ret =3D drm_dp_mst_topology_try_get_mstb(mstb);
> -               if (!ret)
> -                       mstb =3D NULL;
> +       if (mgr->mst_primary) {
> +               mstb =3D get_mst_branch_device_by_guid_helper(mgr->mst_pr=
imary, guid);
> +               if (mstb) {
> +                       ret =3D drm_dp_mst_topology_try_get_mstb(mstb);
> +                       if (!ret)
> +                               mstb =3D NULL;
> +               }
>         }
> -
>         mutex_unlock(&mgr->lock);
>         return mstb;
>  }
> --
> 2.41.0.640.ga95def55d0-goog
>
Hi,

Is there anything more I should do regarding these changes?

Best regards,
Lukasz
