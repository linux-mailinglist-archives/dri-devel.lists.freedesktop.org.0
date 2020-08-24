Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA323250B17
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 23:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A756E172;
	Mon, 24 Aug 2020 21:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06B06E172;
 Mon, 24 Aug 2020 21:48:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so280606wmi.3;
 Mon, 24 Aug 2020 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IKGobvxaA/gQH5FvPl8bNON5VaaRXAXqQ/5bge/ZH1g=;
 b=f7/xUIsUw/8m9YrHT02sZyzo8f2bTxYLOgRM4j2hgYiaiRydKn3u8Iuy00SUMslgBT
 GAt/iSwTDod/+67c1Hk74YgdIOuirAlnAcYOPltWxUm/z1Il7Ubnf7Z8Jnm7PvMPm9SK
 hDcY3LhrYtX+sY+g/Jb7SHUI92KlGpXWp27i8dfUlWzE6ccbzQrP3Hq+/H56KdUQYa9A
 ED4W8aG8s17X+dEYYF9z7GnRgDrRn9ZWDkucAf0IsS3dMWPRDlr6ZMJ53Y/iQ4uYKPhr
 fJe9k8B+1MfFuNpcK8zgSZH1nGiuEkFCLa30+chb8vWzVfja4rKGWwCiaFjrsztD/AjB
 U2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IKGobvxaA/gQH5FvPl8bNON5VaaRXAXqQ/5bge/ZH1g=;
 b=M4HNVAHrFwoGTGDAk1whog590PgBg5IYQLp/QeFO59EWyP1IQCRUMN6j7E3ll1Aqe1
 PPYfUI0SpBfov3LpoWDYwy1lie9+9bSf8MPa2xGYNb/S/45od9MpDKATKizuKq87g2A4
 day9UTGxgSqIbQ0MHGEMln/SxnLejBSsLH/+yTPQRfjbCplHKfp3xKqzPFmoS4xDJERb
 7UqtHMpcf+HM3LUsFcqk6Zc7HxBG0YfPdagQgdXaeomIsR2YJQAfAoMWRsejT4ltiBLE
 r8VZqCINvRR0Kze9PXBIcGAoREHawBdtrWjz+2w3i+gGj3Uu8zEX/+LkuCSFiuFG+3/f
 6fQw==
X-Gm-Message-State: AOAM530omtala6ivXkpO98BMfwai5bSVY3F1aJ69cqgBO7ZNyX3SAkKL
 u6BBxAFLCJ0hEmDybw4SG3tPdLKkJFTAOQjn5+ZKXQkm
X-Google-Smtp-Source: ABdhPJzvbRqXE4aOjJ+Upj4kAcDfNhVQ6DX5jAEDdbGkNWmHv9/zBG0JWgNxWNsqwfLo2NnfeSEr8f4TtzLfve8pduw=
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr1138157wmh.39.1598305693567; 
 Mon, 24 Aug 2020 14:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200824211530.592909-1-alex.dewar90@gmail.com>
In-Reply-To: <20200824211530.592909-1-alex.dewar90@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Aug 2020 17:48:02 -0400
Message-ID: <CADnq5_P2-6oHOtEa7zs0PVSJUQbpZBLgiNR2Dp+_CFG1-kKzqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: use kmemdup() rather than kmalloc+memcpy
To: Alex Dewar <alex.dewar90@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Li Heng <liheng40@huawei.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Aug 24, 2020 at 5:33 PM Alex Dewar <alex.dewar90@gmail.com> wrote:
>
> Issue identified with Coccinelle.
>
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c   | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
> index f56a3cbdfa3b..1f9082539457 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
> @@ -890,14 +890,12 @@ static int init_powerplay_table_information(
>                                 power_saving_clock_count);
>         }
>
> -       pptable_information->smc_pptable = kmalloc(sizeof(PPTable_t), GFP_KERNEL);
> +       pptable_information->smc_pptable = kmemdup(&(powerplay_table->smcPPTable),
> +                                                  sizeof(PPTable_t),
> +                                                  GFP_KERNEL);
>         if (pptable_information->smc_pptable == NULL)
>                 return -ENOMEM;
>
> -       memcpy(pptable_information->smc_pptable,
> -                       &(powerplay_table->smcPPTable),
> -                       sizeof(PPTable_t));
> -
>
>         result = append_vbios_pptable(hwmgr, (pptable_information->smc_pptable));
>         if (result)
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
