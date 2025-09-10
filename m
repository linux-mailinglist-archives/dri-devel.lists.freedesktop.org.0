Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DC8B51F0D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 19:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601FA10E990;
	Wed, 10 Sep 2025 17:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fu/xfUkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDBE10E98D;
 Wed, 10 Sep 2025 17:36:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 46DBD43C10;
 Wed, 10 Sep 2025 17:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2592DC4CEFA;
 Wed, 10 Sep 2025 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757525769;
 bh=FA4UCgBFAqpptgI6K6i1JTSsVOvQMM2hst5UCjHh9g4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fu/xfUkbgE34Fd2/E910IqX7omjoyicBz6RDbf58O2XQQ1gLhNRNMAwKzhAEdcBBi
 Ivryfx9p2FDsTa9GEKCsGo2KdVg4rCSvnk2ZnsC9Q+ubtaDY9i1CePDkM8UNXRKIPi
 qhMCez0u61bwaeGd0riAod/zhecM5KPPW8AnEGwEFDEfX7d2KHECa6EnXB6brIQVK8
 CVhiC+kOvCOcC5VSim0gg/cKtv4oUYdeVmYYCNpin6SiofjSXjw+9VWsDZf4ZiJxv7
 uYUuvPqMpzuOS69Ew1Uju4XJOh+AtHLc5dAnvay+6pu27G1+RCg4+JYe+t1iAxds7H
 IL3rY1/CJs83Q==
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-62177052206so2190063eaf.1; 
 Wed, 10 Sep 2025 10:36:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUjOr9ZfljQurWtMOnCMkOPwvjwyNHITnWzGxeeaLbHRvLsJg+lUmrhYQwLvEWOTdxe5zW7XNnsdOVP@lists.freedesktop.org,
 AJvYcCVSr+K60Yn+fzAlfJS8ivuoOJ1o2bfsydfutF7gLrkFrXJkaa/GOhMyK23S0RSZ+ONqpauohz6n@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5/lkphPJJOabEYQqsYZJma/PitV8Pyq/vTlUgDs0xsPbuNEcf
 BMUiGz3Ivz53HYsAaH1sY1EdIkLN+gm74BRLi5QOl7CLTtgeYX74t9sFR3XOW92Uoa3l7EUYEfS
 vRZ4flKX+HPriFVK1VOqb4j/OgLfmP1Y=
X-Google-Smtp-Source: AGHT+IGqRDSNbWbYnkbSbxdVN3DMQjV/YyqRZRbIFNwtq9fMgeLfUQYHbLnAVcBuexhHKoy0HWJ6kgMj3bmeFA8AHIY=
X-Received: by 2002:a05:6820:2289:b0:61f:f4fa:6d1 with SMTP id
 006d021491bc7-62178a9cffcmr6797601eaf.8.1757525768372; Wed, 10 Sep 2025
 10:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250909191619.2580169-1-superm1@kernel.org>
 <20250909191619.2580169-7-superm1@kernel.org>
In-Reply-To: <20250909191619.2580169-7-superm1@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 10 Sep 2025 19:35:57 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jZ7hhAY99VmkFwAOdh__qEJF8DJnsz5c1L2vq5yo11bQ@mail.gmail.com>
X-Gm-Features: Ac12FXyxUagwTReSbqlVJ9A9fdbWKaPIeI6ktCaW0WEPYN3USXhrTzbLXvzoC7g
Message-ID: <CAJZ5v0jZ7hhAY99VmkFwAOdh__qEJF8DJnsz5c1L2vq5yo11bQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] PCI/PM: Split out code from
 pci_pm_suspend_noirq() into helper
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>, 
 "open list:HIBERNATION (aka Software Suspend,
 aka swsusp)" <linux-pm@vger.kernel.org>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>, 
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, 
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, 
 Kai-Heng Feng <kaihengf@nvidia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>, 
 Eric Naim <dnaim@cachyos.org>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>
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

On Tue, Sep 9, 2025 at 9:16=E2=80=AFPM Mario Limonciello (AMD)
<superm1@kernel.org> wrote:
>
> In order to unify suspend and hibernate codepaths without code duplicatio=
n
> the common code should be in common helpers.  Move it from
> pci_pm_suspend_noirq() into a helper.  No intended functional changes.

You should say why you need/want to unify the suspend and hibernate
codepaths because this is kind of relevant for this patch.

It isn't entirely valid to use suspend-specific code in the
hibernate/power down code paths.

Also, I'd consider reordering the series so that this patch goes
immediately before patch [9/12] in which the new function is used for
the first time.

> Tested-by: Eric Naim <dnaim@cachyos.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
> v7:
>  * Reword title
> v5:
>  * Split from earlier patches
>  * Add tags
> v4:
>  * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@ker=
nel.org/
> ---
>  drivers/pci/pci-driver.c | 81 +++++++++++++++++++++++++---------------
>  1 file changed, 51 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index f201d298d7173..571a3809f163a 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -762,6 +762,54 @@ static void pci_pm_complete(struct device *dev)
>
>  #endif /* !CONFIG_PM_SLEEP */
>
> +#if defined(CONFIG_SUSPEND)
> +/**
> + * pci_pm_suspend_noirq_common
> + * @pci_dev: pci device
> + * @skip_bus_pm: pointer to a boolean indicating whether to skip bus PM
> + *
> + * Prepare the device to go into a low power state by saving state and
> + * deciding whether to skip bus PM.
> + *
> + */
> +static void pci_pm_suspend_noirq_common(struct pci_dev *pci_dev, bool *s=
kip_bus_pm)

I guess you want to propagate pci_dev->skip_bus_pm to the parent
bridge if set for pci_dev in the hibernation code path so that bridges
can go into D3hot/cold in that case.

Fair enough, but I'd give the common function a somewhat less neutral
name, like for example pci_pm_noirq_prepare_to_sleep().

> +{
> +       if (!pci_dev->state_saved) {
> +               pci_save_state(pci_dev);
> +
> +               /*
> +                * If the device is a bridge with a child in D0 below it,
> +                * it needs to stay in D0, so check skip_bus_pm to avoid
> +                * putting it into a low-power state in that case.
> +                */
> +               if (!pci_dev->skip_bus_pm && pci_power_manageable(pci_dev=
))
> +                       pci_prepare_to_sleep(pci_dev);
> +       }
> +
> +       pci_dbg(pci_dev, "PCI PM: Sleep power state: %s\n",
> +               pci_power_name(pci_dev->current_state));
> +
> +       if (pci_dev->current_state =3D=3D PCI_D0) {
> +               pci_dev->skip_bus_pm =3D true;
> +               /*
> +                * Per PCI PM r1.2, table 6-1, a bridge must be in D0 if =
any
> +                * downstream device is in D0, so avoid changing the powe=
r state
> +                * of the parent bridge by setting the skip_bus_pm flag f=
or it.
> +                */
> +               if (pci_dev->bus->self)
> +                       pci_dev->bus->self->skip_bus_pm =3D true;
> +       }
> +
> +       if (pci_dev->skip_bus_pm && pm_suspend_no_platform()) {

And pm_suspend_no_platform() is suspend-specific and in the
hibernation/power down cases it is always false because the platform
is going to take over.

This means that *skip_bus_pm will not be updated in those cases, so
why do you need it in this function in the first place?

> +               pci_dbg(pci_dev, "PCI PM: Skipped\n");
> +               *skip_bus_pm =3D true;
> +               return;
> +       }
> +
> +       pci_pm_set_unknown_state(pci_dev);

So this should stay outside the common part I think.

> +}
> +#endif /* CONFIG_SUSPEND */
> +
>  #ifdef CONFIG_SUSPEND
>  static void pcie_pme_root_status_cleanup(struct pci_dev *pci_dev)
>  {
> @@ -851,6 +899,7 @@ static int pci_pm_suspend_noirq(struct device *dev)
>  {
>         struct pci_dev *pci_dev =3D to_pci_dev(dev);
>         const struct dev_pm_ops *pm =3D dev->driver ? dev->driver->pm : N=
ULL;
> +       bool skip_bus_pm =3D false;

And it doesn't look like this variable is necessary after all.

>
>         if (dev_pm_skip_suspend(dev))
>                 return 0;
> @@ -881,38 +930,10 @@ static int pci_pm_suspend_noirq(struct device *dev)
>                 }
>         }
>
> -       if (!pci_dev->state_saved) {
> -               pci_save_state(pci_dev);
> -
> -               /*
> -                * If the device is a bridge with a child in D0 below it,
> -                * it needs to stay in D0, so check skip_bus_pm to avoid
> -                * putting it into a low-power state in that case.
> -                */
> -               if (!pci_dev->skip_bus_pm && pci_power_manageable(pci_dev=
))
> -                       pci_prepare_to_sleep(pci_dev);
> -       }
> -
> -       pci_dbg(pci_dev, "PCI PM: Suspend power state: %s\n",
> -               pci_power_name(pci_dev->current_state));
> +       pci_pm_suspend_noirq_common(pci_dev, &skip_bus_pm);
>
> -       if (pci_dev->current_state =3D=3D PCI_D0) {
> -               pci_dev->skip_bus_pm =3D true;
> -               /*
> -                * Per PCI PM r1.2, table 6-1, a bridge must be in D0 if =
any
> -                * downstream device is in D0, so avoid changing the powe=
r state
> -                * of the parent bridge by setting the skip_bus_pm flag f=
or it.
> -                */
> -               if (pci_dev->bus->self)
> -                       pci_dev->bus->self->skip_bus_pm =3D true;
> -       }
> -
> -       if (pci_dev->skip_bus_pm && pm_suspend_no_platform()) {
> -               pci_dbg(pci_dev, "PCI PM: Skipped\n");
> +       if (skip_bus_pm)
>                 goto Fixup;
> -       }
> -
> -       pci_pm_set_unknown_state(pci_dev);
>
>         /*
>          * Some BIOSes from ASUS have a bug: If a USB EHCI host controlle=
r's
> --
