Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3155C8756D6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 20:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E38610E797;
	Thu,  7 Mar 2024 19:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kmKgi4mi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607D410E6F9;
 Thu,  7 Mar 2024 19:14:25 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1dd6412da28so2362525ad.3; 
 Thu, 07 Mar 2024 11:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709838864; x=1710443664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2se7G0iGKIEtkLcBAFedZUHevjiz1To/PvhvMoYqSbM=;
 b=kmKgi4mictrjlAUxNqN8hLecmdJhDF/6F68tHR5QzQCyAQwCA1JDxXF3VNpE1xewFx
 XN9CMfp2G6mQzsrraf3qPjkWzv5z6CGJGNZVHcwqo9Az9lHUzchWrBMk3rOznoDsQKEs
 BfRpaQn2eGSl9C9Fl5XobYtiLGkdrYS84lN5FrQUcufM7gVAUFkiZqJKyQU8D75K5obV
 3Dil/c/++/nI8Dk3HBoPO/8DWhYAXMAmQga8Wg3KL91hbzTshP2IG5LFLK67gR+gZLv2
 z9ErsMci2gBNtaTDvYY8V8jDb9iFVYAtLLxY5RzT+O3qb8HX4mm6QW8XeFCoC0UOnOf9
 ym6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709838864; x=1710443664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2se7G0iGKIEtkLcBAFedZUHevjiz1To/PvhvMoYqSbM=;
 b=v0v1SoCnr03ScE5ny8Egf5vekkUlmIwjS/8j8QJ2RJvLHwpYrSbf2FjMhTL/6IGGT9
 b9G73WxXws8eZ1y8B38tspGVyRSkssqGvr3RgXC1zEWcaskQ5SsYa1Qa+fFdrRhbnBdl
 as2aMADZIY77ww/1DMF3z6BcxWQ+CHV5u9XQRgSzoBISW+v+SluX8RvqlMb17OUG7J9l
 Gnr+RITBG2AI3AaoX69u4uEHq+RjsA8iLHYfCFfE/VPJrbYWpUR6Pw2om9QGpR7t4aUU
 9D1epMvBSuDHj7sAHig9EsMoHrFD7uOgM02nqj0VISAG3V7FiajyDsPrz2M1zOQ9ufky
 evpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWf7mwqFaIkEA/lIFgKZC9kRDuMyAarCFestW7/ab1+48gBuQT+1DqvX6J5mkxksk8zcHMw95XnXDFFyo/mWatE6rZZfH7eFYls97jLjsrWFfdQsM7gagQ90DwvXDJqKgT2Y9Ewd4yupLjlGbRVw==
X-Gm-Message-State: AOJu0YyKGzV03gyP8LI9ZFrBdMFH9dNuUZPTBkdARyO+iYzyLxLUPQcs
 Xj656zCPCljrfoAsVMCoGVcnOBDPCaX4uwl8fV37DO9H3fLthp8fUJoIiCfCfAARCvl1D2qxyY1
 KTdq7uyeqKyrDxrVbegi5yEwk0wvNtLEE
X-Google-Smtp-Source: AGHT+IHRVNZAUpprQ4dXeszAr2p/sxRYdzvBxRpzG0DMC1RFVrho4mjcstm8PdLmMghCwTV/K39nXyPIHNPzQnu1L+4=
X-Received: by 2002:a17:90a:5986:b0:29a:e05f:3f55 with SMTP id
 l6-20020a17090a598600b0029ae05f3f55mr15893535pji.2.1709838864479; Thu, 07 Mar
 2024 11:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20240307165932.3856952-1-sunil.khatri@amd.com>
 <20240307165932.3856952-3-sunil.khatri@amd.com>
In-Reply-To: <20240307165932.3856952-3-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Mar 2024 14:14:12 -0500
Message-ID: <CADnq5_OaCRAjCZGOEpd1gTFSUHdNkVbDqDgx_LQKw_JR1Qtv3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: add vm fault information to devcoredump
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mukul Joshi <mukul.joshi@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
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

On Thu, Mar 7, 2024 at 12:00=E2=80=AFPM Sunil Khatri <sunil.khatri@amd.com>=
 wrote:
>
> Add page fault information to the devcoredump.
>
> Output of devcoredump:
> **** AMDGPU Device Coredump ****
> version: 1
> kernel: 6.7.0-amd-staging-drm-next
> module: amdgpu
> time: 29.725011811
> process_name: soft_recovery_p PID: 1720
>
> Ring timed out details
> IP Type: 0 Ring Name: gfx_0.0.0
>
> [gfxhub] Page fault observed
> Faulty page starting at address 0x0000000000000000

Do you want a : before the address for consistency?

> Protection fault status register:0x301031

How about a space after the : for consistency?

For parsability, it may make more sense to just have a list of key value pa=
irs:
[GPU page fault]
hub:
addr:
status:
[Ring timeout details]
IP:
ring:
name:

etc.

>
> VRAM is lost due to GPU reset!
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_reset.c
> index 147100c27c2d..dd39e614d907 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset,=
 size_t count,
>                            coredump->ring->name);
>         }
>
> +       if (coredump->adev) {
> +               struct amdgpu_vm_fault_info *fault_info =3D
> +                       &coredump->adev->vm_manager.fault_info;
> +
> +               drm_printf(&p, "\n[%s] Page fault observed\n",
> +                          fault_info->vmhub ? "mmhub" : "gfxhub");
> +               drm_printf(&p, "Faulty page starting at address 0x%016llx=
\n",
> +                          fault_info->addr);
> +               drm_printf(&p, "Protection fault status register:0x%x\n",
> +                          fault_info->status);
> +       }
> +
>         if (coredump->reset_vram_lost)
> -               drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> +               drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>         if (coredump->adev->reset_info.num_regs) {
>                 drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value=
:\n");
>
> --
> 2.34.1
>
