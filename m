Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B3BF2D8C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B6E10E4A8;
	Mon, 20 Oct 2025 18:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mNPwndc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F5C10E4A8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 18:00:55 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b67cd5d88ddso138471a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760983255; x=1761588055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1wP0YScjpmhemQhhKBFvsHAuPXG/i9Tw9/Vc2eaGjQ=;
 b=mNPwndc8R51HoqHTeYtKZsX/ow4HHg72LaQy+P6iDBL7VyEzKAjp0coIm56Vs8TXpJ
 5hsU2pjhGmO2hcvcrc7KwHe/2bfTRj5OU5rBYZGcV9dkMGgMekclzUmCtq74E9/cQOxt
 GUa4a9tsMY5Hh6c9L+KYMNiwKwrf9cQtnhCWI7qrpzR7UE7GfzFiFUQne7Axvb9fcsOF
 MpSbNRXWNaSp3QJsV2OKhJ74qGk3Ntx9I/MWcZITJV5Pp2G6yy6ytqH2pAUiuBpqVrIm
 vFkCnvEumJycD7NNrxNfs25Mr56g2KqteD7T70QC+xAG1ln+U/sbAT9sRArMVKmeKWp6
 FL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760983255; x=1761588055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1wP0YScjpmhemQhhKBFvsHAuPXG/i9Tw9/Vc2eaGjQ=;
 b=PBQ2oFSqk9aGWNczzruPQooeSAi4oMQJv9pC6uLkxopqTJ+yJAVGutyZsqm/yS8xf/
 lXJ1hEk11m/GRhWawLPGN9vTx08hlVfQqMW3Yt5AK3pTV/t+B+L5mCR3WETn2EhXXO7k
 HJBYlVXB06x/nIlakoYb6TsxkCC+gadRJXyBcG5oqPRbe0JcOLzBXpq+eyrnvZushhn+
 LclGBANH6dpIqoCmGjiJeKoF3gACNBJ2apRfeUr1LoawhRnhX2FyjRkSaQNsCNKR5lXL
 c4A37/F2N2x2oWbyLfPveMUpRI3rpgJszyrdsy5qQbWUmmf2mthnH8qjNSAnOh+k0lso
 ExWw==
X-Gm-Message-State: AOJu0Yz2KMGApXNSMAHPvydPrRuCR5Dud1VDlVQI5B/XAviYoTkBzJ1D
 Yrmd1gMy/ptA6xW3be5RePVhNJ1QDBmULYYEupGggZKtdRnaq+eUBiJGrEAMq1n17PSZK+gDI76
 rguvM/E7YETKxxoDPwqAQ3BHoASFZxlczMUBl
X-Gm-Gg: ASbGncvjx1sj4x4CcAuZBYRcKVgHrwLuzk6Ie8BRaaUt1DoTlVJAV4y8MA78Dysb2I2
 6eip35xFFKbGq3z97bdtEUDERWLoQZV4wnNVSwi+5StpIsKutQEQV+sLRIjH95LivOL46It6nxS
 sEZ9j9klEBIQzk8nab/uumVKiynjWzbTsVIjaEjbNGXCJIb2w8Wz5cLKbMmqDu2l6MJem8UXEky
 xFIR1mKC1vPFIyAdcDN2jGjUnJL5xK0F+u8Bu2idY4/l7m9rKVPpt2mcUhs4jZy67ZMZwU=
X-Google-Smtp-Source: AGHT+IFgn8jvTInktfa2hK0cJWK/SznmD5DKUi93rxKLi9zN9kfFx7OIQmKgAfkpfs9vS2h8Y4gA8TN9xuI2+z73SNc=
X-Received: by 2002:a17:903:2c04:b0:27e:e96a:4bf with SMTP id
 d9443c01a7336-292d3e508ebmr2285525ad.2.1760983255263; Mon, 20 Oct 2025
 11:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkpkRXO35=pmEZLJ4efTzaUytu6GURwogPdv3hroOYmHWg4JQ@mail.gmail.com>
In-Reply-To: <CAGkpkRXO35=pmEZLJ4efTzaUytu6GURwogPdv3hroOYmHWg4JQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Oct 2025 14:00:43 -0400
X-Gm-Features: AS18NWDnpBSs5ITPPa8pCFgeS0hh5wuOWsE-YY9rrj4-28LgcL-aKXaqZGPxIzI
Message-ID: <CADnq5_MO7=jx4qbzsHW8=M4jyYgmLxc+QT78qbv00POuBbtxuw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value
 on Fiji
To: John Smith <itistotalbotnet@gmail.com>
Cc: dri-devel@lists.freedesktop.org
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

On Mon, Oct 20, 2025 at 10:21=E2=80=AFAM John Smith <itistotalbotnet@gmail.=
com> wrote:
>
> Fiji seems to have difficulty with switching PCIe generations
> including on my Instinct MI8, where it is basically stuck at Gen 1
> unless manually switched by using a different PowerPlay profile.
> (using the pp_dpm_pcie sysfs does not work)
>
> 18edef19ea44 introduced support for Fiji's SMU, which included setting
> the PCIeBootLinkLevel value to zero which is equal to PCI Express Gen
> 1.
>
> By copying what Tonga and other generations of AMD GPUs do, which is
> to use the maximum value from the speed table, fixes the issue.
>
> (p.s. I believe Topaz's SMU also has the same issue, I can send in an
> additional patch if needed)

It would be good to switch both of these for consistency with the
other chips, but the rationale for this is not quite correct.
PCIeBootLinkLevel is supposed to represent the level the link was
trained at when the system booted.  We should read the current level
from PCI config space, however, it was changed to
pcie_speed_table.count because after a driver unload and reload, the
PCIe level will end up at gen 1 because the firmware will put it there
when the driver was previously loaded.  I don't think the boot link
level affects PCIe at runtime.  IIRC, the PCIe gen levels are
determined based on PCIe caps and whether the platform supports
dynamic PCIe gen switching.  If this does make a difference for you,
then you may have a platform which does not support dynamic gen
switching in which case, you'd be stuck at the boot level.  Please
send this patch along with the patch for iceland and I'll apply them.

Thanks!

Alex

>
> Fixes: 18edef19ea44 ("drm/amd/powerplay: implement fw image related
> smu interface for Fiji.")
> Signed-off-by: John Smith <itistotalbotnet@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> index d2dbd90bb427..0a876c840c79 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> @@ -2024,7 +2024,7 @@ static int fiji_init_smc_table(struct pp_hwmgr *hwm=
gr)
>   table->VoltageResponseTime =3D 0;
>   table->PhaseResponseTime =3D 0;
>   table->MemoryThermThrottleEnable =3D 1;
> - table->PCIeBootLinkLevel =3D 0;      /* 0:Gen1 1:Gen2 2:Gen3*/
> + table->PCIeBootLinkLevel =3D (uint8_t) (data->dpm_table.pcie_speed_tabl=
e.count);
>   table->PCIeGenInterval =3D 1;
>   table->VRConfig =3D 0;
