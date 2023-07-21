Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AE275CAAE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 16:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB3610E69B;
	Fri, 21 Jul 2023 14:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F7910E690;
 Fri, 21 Jul 2023 14:53:03 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-56352146799so1337251eaf.3; 
 Fri, 21 Jul 2023 07:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689951183; x=1690555983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxlgaC60bco0Cm1BalXqc8WdAEfbZykARIUfMKPLvhI=;
 b=fbrUOeUpu4cBkbiAZ8xkJRDFN1rcYnsMEErgzZd4XvEaBZaOATyGRd9L8p9FgGsbK8
 U+Zn+fktiRE3+uRA4yMihQ80YP4CxgZmjQta6n9UbHs0hNxDWLcNahKHgan1YZ3vaypO
 rjkhifUHytGH989tDbfhfJZAOjXBwXXf2xR1Ghwg/MH+kmbMiVQ2B7DK7XIjLCJBAUTJ
 I3huXU6GXAWeGmzh2OSV892nyKHbIl7WefxoXpNrhSVfQBS8FZZdapZDV93EyGhLxTw1
 05Clo3CyvPwJfKexVC7zk8Q+FkqVayvXRWiF18rdPm1I5eomz+HwkGYHFx47MX+E8rDh
 nwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689951183; x=1690555983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JxlgaC60bco0Cm1BalXqc8WdAEfbZykARIUfMKPLvhI=;
 b=XCy9jqLDDMl7tsIxOhkoao5hGQEBekZNa2h9Np4gBodGLskdQlBIHwmMacUZMDvIvw
 CZ+ILka+Gh+PqMlUF2gCo8OnS5HL+IBMw8g2Cij4PDNIZ4HIFOWxJqq3egZcYhsBz3q/
 fZLE9z2w11rDLdgpUVXCYjqQb4LUCsIC1rHbaUlWc4SKZmVRE558PYKflGl7tfmfCq0P
 iyvMP9OWJLZ4JxRiXrv+/UkBxh8Y6Ivqe25jAgi1jxCzM+VX8/6KY20jDjTadNWH8Lhp
 1LojtZcW/GGvN9ZJaF56MaeHlQlz+umlRv8C3ju2L9eoG8I1WrTiSUo/e+XfzMxCfP+r
 D7tg==
X-Gm-Message-State: ABy/qLZDJ0H0vmHu5VgwsFnQMtvuq/hJZnAs2aXkSaE/14pu7/35+0CU
 PhXhIrAca98ExcQ9Kqq/BXCv7wSScrWZeAMxbc0=
X-Google-Smtp-Source: APBJJlESC7Ai9Ycl0FQ+vntlvM+i6R3W0MWc3MK5MIQ1NKkGjXHAfFkEx56UUC7A/g25qJDMU+4MZ/Gil3pRk7P3MHM=
X-Received: by 2002:a4a:d1c3:0:b0:563:53fa:324f with SMTP id
 a3-20020a4ad1c3000000b0056353fa324fmr1890890oos.6.1689951182938; Fri, 21 Jul
 2023 07:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230720215550.GA554900@bhelgaas>
 <eff193b-31ea-5c36-cbc-6b15a477f3b1@linux.intel.com>
In-Reply-To: <eff193b-31ea-5c36-cbc-6b15a477f3b1@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Jul 2023 10:52:51 -0400
Message-ID: <CADnq5_MUyjAZoRBDvdBFDYdiA6nwsaup+MKM+ajo7HKTtez9DQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm/amdgpu: Use RMW accessors for changing LNKCTL
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
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
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, linux-pci@vger.kernel.org,
 =?UTF-8?Q?Jonas_Dre=C3=9Fler?= <verdre@v0yd.nl>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, amd-gfx@lists.freedesktop.org,
 Ken Wang <Qingqing.Wang@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 stable@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 4:18=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 20 Jul 2023, Bjorn Helgaas wrote:
>
> > On Mon, Jul 17, 2023 at 03:04:57PM +0300, Ilpo J=C3=A4rvinen wrote:
> > > Don't assume that only the driver would be accessing LNKCTL. ASPM
> > > policy changes can trigger write to LNKCTL outside of driver's contro=
l.
> > > And in the case of upstream bridge, the driver does not even own the
> > > device it's changing the registers for.
> > >
> > > Use RMW capability accessors which do proper locking to avoid losing
> > > concurrent updates to the register value.
> > >
> > > Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
> > > Fixes: 62a37553414a ("drm/amdgpu: add si implementation v10")
> > > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > Cc: stable@vger.kernel.org
> >
> > Do we have any reports of problems that are fixed by this patch (or by
> > others in the series)?  If not, I'm not sure it really fits the usual
> > stable kernel criteria:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/stable-kernel-rules.rst?id=3Dv6.4
>
> I was on the edge with this. The answer to your direct question is no,
> there are no such reports so it would be okay to leave stable out I think=
.
> This applies to all patches in this series.
>
> Basically, this series came to be after Lukas noted the potential
> concurrency issues with how LNKCTL is unprotected when reviewing
> (internally) my bandwidth controller series. Then I went to look around
> all LNKCTL usage and realized existing things might alreary have similar
> issues.
>
> Do you want me to send another version w/o cc stable or you'll take care
> of that?
>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/cik.c | 36 +++++++++---------------------=
--
> > >  drivers/gpu/drm/amd/amdgpu/si.c  | 36 +++++++++---------------------=
--
> > >  2 files changed, 20 insertions(+), 52 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/a=
mdgpu/cik.c
> > > index 5641cf05d856..e63abdf52b6c 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/cik.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
> > > @@ -1574,17 +1574,8 @@ static void cik_pcie_gen3_enable(struct amdgpu=
_device *adev)
> > >                     u16 bridge_cfg2, gpu_cfg2;
> > >                     u32 max_lw, current_lw, tmp;
> > >
> > > -                   pcie_capability_read_word(root, PCI_EXP_LNKCTL,
> > > -                                             &bridge_cfg);
> > > -                   pcie_capability_read_word(adev->pdev, PCI_EXP_LNK=
CTL,
> > > -                                             &gpu_cfg);
> > > -
> > > -                   tmp16 =3D bridge_cfg | PCI_EXP_LNKCTL_HAWD;
> > > -                   pcie_capability_write_word(root, PCI_EXP_LNKCTL, =
tmp16);
> > > -
> > > -                   tmp16 =3D gpu_cfg | PCI_EXP_LNKCTL_HAWD;
> > > -                   pcie_capability_write_word(adev->pdev, PCI_EXP_LN=
KCTL,
> > > -                                              tmp16);
> > > +                   pcie_capability_set_word(root, PCI_EXP_LNKCTL, PC=
I_EXP_LNKCTL_HAWD);
> > > +                   pcie_capability_set_word(adev->pdev, PCI_EXP_LNKC=
TL, PCI_EXP_LNKCTL_HAWD);
> > >
> > >                     tmp =3D RREG32_PCIE(ixPCIE_LC_STATUS1);
> > >                     max_lw =3D (tmp & PCIE_LC_STATUS1__LC_DETECTED_LI=
NK_WIDTH_MASK) >>
> > > @@ -1637,21 +1628,14 @@ static void cik_pcie_gen3_enable(struct amdgp=
u_device *adev)
> > >                             msleep(100);
> > >
> > >                             /* linkctl */
> > > -                           pcie_capability_read_word(root, PCI_EXP_L=
NKCTL,
> > > -                                                     &tmp16);
> > > -                           tmp16 &=3D ~PCI_EXP_LNKCTL_HAWD;
> > > -                           tmp16 |=3D (bridge_cfg & PCI_EXP_LNKCTL_H=
AWD);
> > > -                           pcie_capability_write_word(root, PCI_EXP_=
LNKCTL,
> > > -                                                      tmp16);
> > > -
> > > -                           pcie_capability_read_word(adev->pdev,
> > > -                                                     PCI_EXP_LNKCTL,
> > > -                                                     &tmp16);
> > > -                           tmp16 &=3D ~PCI_EXP_LNKCTL_HAWD;
> > > -                           tmp16 |=3D (gpu_cfg & PCI_EXP_LNKCTL_HAWD=
);
> > > -                           pcie_capability_write_word(adev->pdev,
> > > -                                                      PCI_EXP_LNKCTL=
,
> > > -                                                      tmp16);
> > > +                           pcie_capability_clear_and_set_word(root, =
PCI_EXP_LNKCTL,
> > > +                                                              PCI_EX=
P_LNKCTL_HAWD,
> > > +                                                              bridge=
_cfg &
> > > +                                                              PCI_EX=
P_LNKCTL_HAWD);
> > > +                           pcie_capability_clear_and_set_word(adev->=
pdev, PCI_EXP_LNKCTL,
> > > +                                                              PCI_EX=
P_LNKCTL_HAWD,
> > > +                                                              gpu_cf=
g &
> > > +                                                              PCI_EX=
P_LNKCTL_HAWD);
> >
> > Wow, there's a lot of pointless-looking work going on here:
> >
> >   set root PCI_EXP_LNKCTL_HAWD
> >   set GPU  PCI_EXP_LNKCTL_HAWD
> >
> >   for (i =3D 0; i < 10; i++) {
> >     read root PCI_EXP_LNKCTL
> >     read GPU  PCI_EXP_LNKCTL
> >
> >     clear root PCI_EXP_LNKCTL_HAWD
> >     if (root PCI_EXP_LNKCTL_HAWD was set)
> >       set root PCI_EXP_LNKCTL_HAWD
> >
> >     clear GPU  PCI_EXP_LNKCTL_HAWD
> >     if (GPU  PCI_EXP_LNKCTL_HAWD was set)
> >       set GPU  PCI_EXP_LNKCTL_HAWD
> >   }
> >
> > If it really *is* pointless, it would be nice to clean it up, but that
> > wouldn't be material for this patch, so what you have looks good.
>
> I really don't know if it's needed or not. There's stuff which looks hw
> specific going on besides those things you point out and I've not really
> understood what all that does.
>
> One annoying thing is that this code has been copy-pasted to appear in
> almost identical form in 4 files.
>
> I agree it certainly looks there might be room for cleaning things up her=
e
> but such cleanups look a bit too scary to me w/o hw to test them.
>
> > >                             /* linkctl2 */
> > >                             pcie_capability_read_word(root, PCI_EXP_L=
NKCTL2,
> >
> > The PCI_EXP_LNKCTL2 stuff also includes RMW updates.  I don't see any
> > uses of PCI_EXP_LNKCTL2 outside this driver that look relevant, so I
> > guess we don't care about making the PCI_EXP_LNKCTL2 updates atomic?
>
> Currently no, which is why I left it out from this patchset.
>
> It is going to change soon though as I intend to submit bandwidth
> controller series after this series which will add RMW ops for LNKCTL2.
> The LNKCTL2 RMW parts are now in that series rather than in this one.
>
> After adding the bandwidth controller, this driver might be able to use
> it instead of tweaking LNKCTL2 directly to alter PCIe link speed (but I
> don't expect myself to be able to test these drivers and it feels too
> risky to make such a change without testing it, unfortunately).

Thanks for the background.  It was not clear what the point of this
patch set was.  This code and the similar code in radeon is just to
change the link speed of the GPU.  Some older platforms used default
to slower link on boot so we added this code to renegotiate the link
to a faster speed when the driver loaded.  If you are adding core
infrastructure to do that, we can switch to that.  This was just the
programming sequence I got from the hardware team back when this code
was written.  Most platforms I've seen these days come up at the max
supported speed of the platform and endpoint so I don't think the code
actually gets used much anymore.

Taking a step back, what is the end goal of the bandwidth controller
changes?  The reason I ask is that today, we look at the currently
negotiated speed of the link and use that for the baseline in the
driver.  The driver then enables PCIe dynamic power management where
the system management unit on the GPU dynamically adjusts the link
speed, width, and clock on demand based on the PCIe bandwidth
requirements of the currently executing GPU jobs to save power.  This
might conflict with software if the goal is for some software
component to do something similar.

Alex
