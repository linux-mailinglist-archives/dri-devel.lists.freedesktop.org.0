Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB766D11D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADF310E4EA;
	Mon, 16 Jan 2023 21:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB92010E4E9;
 Mon, 16 Jan 2023 21:53:49 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id v17so3137301oie.5;
 Mon, 16 Jan 2023 13:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R6Qj/cjxnMMGHZOFEQZ4yanfn40iQo0zh3vT2s+AI6E=;
 b=c9S/FIIY8mcDvAYuGjYpHGDq8HklIkgYhC8LdIDAgUmhp+vmlMnu5b0LfDHivn495F
 a4pWt9NF9+BZbQlGOgiWvGAGrKRT/U+PmwA64icxsXi607RY8w5X4MIHwYMkr+zHjBrh
 dNEMitm/xQIMnhq+TVP9j02eW9NIlrwkRGeAbJWCK3KsenBGNdGxmfd7HJymxwGleKdR
 Ag6BhHrqP1cA++QNAKt77u088VfqX3WmfHp7Q8z0BsJKrXryeiHvj2DzU+SekmHjXDYv
 Kg1aQYgdAi9geV4T/itNh6YqlQEGFMrdxryRfYCyFsURigyKgCaFPQhANPZvtAa5/IzJ
 hOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R6Qj/cjxnMMGHZOFEQZ4yanfn40iQo0zh3vT2s+AI6E=;
 b=JCaVPletObHtbCi/Zk20n64w+NpG647ZRpDOuSI6WJORFELinQr5Lxr9f1UFhnFNoY
 OGvahWIwvj8T6YB55lBzCjsuk7DHcUMo7UwX4A8avA9acz14kfEoBtzmHTNFbByM8aPw
 GUBi4Lqp2psMJo7AvAs424QxQUeRJT0zU2q0Grrf+YKeNckXaai0mDwX/cEe3TAmVKND
 lVtWzyvagAF3OVAKL5m1xPwvVC1zw7Ug2KPGTpepa74eXsLk66GFtkm41a2fLjq7adW5
 haKZ1/q3EnIiK3sDOzhM0jZoEWfDUPfCF7eapND090wY92JdOamMcZh9zaFQUHhv3Azh
 o7TQ==
X-Gm-Message-State: AFqh2kr2/jEh73Au7snQR8AKJ3iO6RHnwbDH5LKzkl3ybTXjHMKUagLj
 9JZLF4bUk5cNNmWPjNdHsMag5GdaRQD7om12OUQ=
X-Google-Smtp-Source: AMrXdXuPkHbNVdDxfT+LoXrVx2FOZ/5uKJ8tO7NecBJjn+VEsSPyWWZoOmQjpWA0nqvWI25n9EE0u/RjwOrnsesf4Jg=
X-Received: by 2002:a05:6808:4387:b0:35b:d93f:cbc4 with SMTP id
 dz7-20020a056808438700b0035bd93fcbc4mr49021oib.96.1673906029047; Mon, 16 Jan
 2023 13:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-2-gpiccoli@igalia.com>
 <CADnq5_M6z=BTvcspVsC_5YmZCwEP48e=6nvcr4ck4Q7KR126MA@mail.gmail.com>
 <MN0PR12MB6101142C0E3653D7DA57866EE2C19@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB6101142C0E3653D7DA57866EE2C19@MN0PR12MB6101.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 16:53:37 -0500
Message-ID: <CADnq5_MrMLP35SSOQEgZWMzZW-uVRjCfiJaVLoGMyjM7mbr6SA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/amdgpu/vcn: Deduplicate indirect SRAM checking
 code
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 4:49 PM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [Public]
>
>
>
> > -----Original Message-----
> > From: Alex Deucher <alexdeucher@gmail.com>
> > Sent: Monday, January 16, 2023 15:42
> > To: Guilherme G. Piccoli <gpiccoli@igalia.com>
> > Cc: amd-gfx@lists.freedesktop.org; Jiang, Sonny <Sonny.Jiang@amd.com>;
> > kernel@gpiccoli.net; Pan, Xinhui <Xinhui.Pan@amd.com>; dri-
> > devel@lists.freedesktop.org; Lazar, Lijo <Lijo.Lazar@amd.com>; Limonciello,
> > Mario <Mario.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher,
> > Alexander <Alexander.Deucher@amd.com>; Zhu, James
> > <James.Zhu@amd.com>; Liu, Leo <Leo.Liu@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>
> > Subject: Re: [PATCH 2/3] drm/amdgpu/vcn: Deduplicate indirect SRAM
> > checking code
> >
> > On Mon, Jan 16, 2023 at 4:20 PM Guilherme G. Piccoli
> > <gpiccoli@igalia.com> wrote:
> > >
> > > Currently both conditionals checked to enable indirect SRAM are
> > > repeated for all HW/IP models. Let's just simplify it a bit so
> > > code is more compact and readable.
> > >
> > > While at it, add the legacy names as a comment per case block, to
> > > help whoever is reading the code and doesn't have much experience
> > > with the name/number mapping.
> > >
> > > Cc: James Zhu <James.Zhu@amd.com>
> > > Cc: Lazar Lijo <Lijo.Lazar@amd.com>
> > > Cc: Leo Liu <leo.liu@amd.com>
> > > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > > Cc: Sonny Jiang <sonny.jiang@amd.com>
> > > Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> > > ---
> > >
> > >
> > > Hi folks, first of all thanks in advance for reviews/comments!
> > >
> > > This work is based on agd5f/amd-staging-drm-next branch - there is this
> > > patch from Mario that refactored the amdgpu_vcn.c, and since it dropped
> > > the legacy names from the switch cases, I've decided to also include them
> > > here as comments.
> > >
> > > I'm not sure if that's a good idea, feels good for somebody not so
> > > used to the code read the codenames instead of purely numbers, but
> > > if you wanna move away from the legacy names for good, lemme know
> > > and I can rework without these comments.
> > >
> > > Cheers,
> > >
> > >
> > > Guilherme
> > >
> > >
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 84 +++++--------------------
> > >  1 file changed, 16 insertions(+), 68 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> > > index 1b1a3c9e1863..1f880e162d9d 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> > > @@ -111,78 +111,26 @@ int amdgpu_vcn_sw_init(struct amdgpu_device
> > *adev)
> > >                 atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
> > >
> > >         switch (adev->ip_versions[UVD_HWIP][0]) {
> > > -       case IP_VERSION(1, 0, 0):
> > > -       case IP_VERSION(1, 0, 1):
> > > -       case IP_VERSION(2, 5, 0):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(2, 2, 0):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(2, 6, 0):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(2, 0, 0):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(2, 0, 2):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(3, 0, 0):
> > > -       case IP_VERSION(3, 0, 64):
> > > -       case IP_VERSION(3, 0, 192):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(3, 0, 2):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(3, 0, 16):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(3, 0, 33):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(3, 1, 1):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > +       case IP_VERSION(1, 0, 0):       /* Raven (1/2) / Picasso */
> > > +       case IP_VERSION(1, 0, 1):       /* Raven (1/2) / Picasso */
> > > +       case IP_VERSION(2, 0, 0):       /* Navi10 */
> > > +       case IP_VERSION(2, 0, 2):       /* Navi12 / Navi14 */
> > > +       case IP_VERSION(2, 2, 0):       /* Renoir / Green Sardine */
> > > +       case IP_VERSION(2, 5, 0):       /* Arcturus */
> > > +       case IP_VERSION(2, 6, 0):       /* Aldebaran */
> > > +       case IP_VERSION(3, 0, 0):       /* Sienna Cichlid / Navy Flounder */
> > > +       case IP_VERSION(3, 0, 2):       /* Vangogh */
> > > +       case IP_VERSION(3, 0, 64):      /* Sienna Cichlid / Navy Flounder */
> > > +       case IP_VERSION(3, 0, 16):      /* Dimgray Cavefish */
> > > +       case IP_VERSION(3, 0, 33):      /* Beige Goby */
> > > +       case IP_VERSION(3, 0, 192):     /* Sienna Cichlid / Navy Flounder */
> > > +       case IP_VERSION(3, 1, 1):       /* Yellow Carp */
>
> The problem with adding a comment about which platform it's in is that
> this will probably go stale.  Some IP blocks are re-used in multiple ASICs.
>
> VCN 3, 1, 1 is a great example.  This is used in both Yellow Carp (Rembrandt) as well
> as Mendocino.   I would think a better approach would be to have a single point
> of documentation somewhere in the source tree that we can update after new
> ASICs launch that could act as a decoder ring.
>
> It's effort to remember to update it, but it's at least a single point of failure.


Maybe it would be better to just drop the case statement and just
always set this condition.  I don't think there is a case where we
don't set it?

Alex

>
> > >         case IP_VERSION(3, 1, 2):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > -       case IP_VERSION(4, 0, 0):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                       (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > > +       case IP_VERSION(4, 0, 0):       /* Vega10 */
> >
> > This comment is incorrect.  Vega10 does not have VCN (it has UVD and VCE).
> >
> > Alex
> >
> >
> > Alex
> >
> > >         case IP_VERSION(4, 0, 2):
> > > -               if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                       (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > -                       adev->vcn.indirect_sram = true;
> > > -               break;
> > >         case IP_VERSION(4, 0, 4):
> > >                 if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
> > > -                       (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > > +                   (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
> > >                         adev->vcn.indirect_sram = true;
> > >                 break;
> > >         default:
> > > --
> > > 2.39.0
> > >
