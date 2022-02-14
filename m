Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CDB4B5598
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4B110E1BC;
	Mon, 14 Feb 2022 16:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC98F10E1BC;
 Mon, 14 Feb 2022 16:07:44 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id p63so20357008iod.11;
 Mon, 14 Feb 2022 08:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yx9dZuPcrLt3Jj+xgr3ullm7ftsWlVftIJw02v6qQ4Q=;
 b=SAXX84nlBGjG16fpNft33oh0Iz5U6vBcVuFQLPKgjlMPSHrM3AelvH1kBYknyG2qFK
 7khZu8sLJf7F3N+6FqEsMavJ+IFAOBcQUejNTP/5SPv4oZKYCUfv4rBar6EEDyG+mMZ+
 KSyDyDDcmsTTPt7qzYMr5XxBN1WMVfbXtwXPeFHZK8XzxukwGv3vRIv1rY6U0I2zRS0L
 SlwmxqVloQUmYi3Le7kP1d9bdA/7anOkg1r1b+MnEn8yLUGaYXFFb6ftp2wtREyYm2nH
 1/B88xWfHqJyZ84RUeMHYTrQEhbCLSudiOtvlJG9haTlnKjaOIpzYwieXQ3j5o35tk+9
 NR5g==
X-Gm-Message-State: AOAM533ARuL65xCKiEfQDhu/771hvXHfJ2M+c9rLne+z4H/u5iiMHRx9
 CpySEYozouRiGNLtTajMWIN/cWSsRvxr5ZstMeA=
X-Google-Smtp-Source: ABdhPJzvzoPpmI4kQbwahiXCjfk4KMpMCoZDBvGJc98Pl3kNpRh7Q0xtePotYf8bUDMNNdnPfe6LYIO3ObpZ4iZIWZ4=
X-Received: by 2002:a02:c916:: with SMTP id t22mr245398jao.300.1644854864060; 
 Mon, 14 Feb 2022 08:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20220214155518.2980270-1-icenowy@aosc.io>
In-Reply-To: <20220214155518.2980270-1-icenowy@aosc.io>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 14 Feb 2022 11:07:33 -0500
Message-ID: <CAKb7UvjRoS-z1f6a=p0TknPruZJBKmUEiAFOR9Ka5LgJ765Ybg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/bios: Use HWSQ entry 1 for PowerBook6,1
To: Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm not saying this is wrong, but could you file a bug at
gitlab.freedesktop.org/drm/nouveau/-/issues and include the VBIOS
(/sys/kernel/debug/dri/0/vbios.rom)? That would make it easier to
review the full situation.

On Mon, Feb 14, 2022 at 11:03 AM Icenowy Zheng <icenowy@aosc.io> wrote:
>
> On PowerBook6,1 (PowerBook G4 867 12") HWSQ entry 0 (which is currently
> always used by nouveau) fails, but the BIOS declares 2 HWSQ entries and
> entry 1 works.
>
> Add a quirk to use HWSQ entry 1.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bios.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index e8c445eb11004..2691d0e0cf9f1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -1977,6 +1977,13 @@ static int load_nv17_hw_sequencer_ucode(struct drm_device *dev,
>         if (!hwsq_offset)
>                 return 0;
>
> +#ifdef __powerpc__
> +       /* HWSQ entry 0 fails on PowerBook G4 867 12" (Al) */
> +       if (of_machine_is_compatible("PowerBook6,1"))
> +               return load_nv17_hwsq_ucode_entry(dev, bios,
> +                                                 hwsq_offset + sz, 1);
> +#endif
> +
>         /* always use entry 0? */
>         return load_nv17_hwsq_ucode_entry(dev, bios, hwsq_offset + sz, 0);
>  }
> --
> 2.30.2
>
