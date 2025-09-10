Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0627DB51F6B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 19:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2D910E9A4;
	Wed, 10 Sep 2025 17:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d6NDtd5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8CF10E9A5;
 Wed, 10 Sep 2025 17:48:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3E36660254;
 Wed, 10 Sep 2025 17:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996E3C4CEFC;
 Wed, 10 Sep 2025 17:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757526531;
 bh=JWkrCD/pUkyX9wjEhNii7+JjAOcFy0ueHFktHUQ0t80=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d6NDtd5AvkZ3cAyHiBAlhsfdUR3l9P2CxyKtdFH5/bGkhOLVPbOeOSka+H44aAKBn
 K/b1NClF/FVpo7KBFx/V6Lm5W5MqD3jLJcAVwJCwgIma8vkBVngnmL3Rjg5giNXbss
 GcsrEwC0wzJF6OlEkbBWdmv+S0xN55czfk1SKsmU5/bbzGwquE1FQ5KxZoNXHh5bV3
 DhGcyt2/rm+pcCmSKnhUsCXHRHPuR077rJpQCJTHoPfmo/sQQB/OcdvpLSzJcPI+M4
 51KrcuUa7vVoDJFlhhzMvuXO6Gnwfuyuu9tRoBj4EhQG7+YAxu+jIXI6IOdaSG5+ac
 HAEB2JxbRjDDg==
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-621a3c43df3so1005597eaf.0; 
 Wed, 10 Sep 2025 10:48:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUG2j4D5ehsA5gDnD8ITAxNdCuIbK2jw/QYPKHixyXztbp1576IIL26Gj0FmpqvHpxrur5f93Ca@lists.freedesktop.org,
 AJvYcCUfD8Hxskv8vsZyIvxjA8sjkB8WLoSHXXSOTl1DGbUGmzuLcLBRtQj5wXrTkquURjvLMpLAoNzAARcl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeLyjZNJrxw3pm5tooUUKIi7v0Y1wKFH2eWJyEo6lH44Wp9GL8
 KYKSG4c9ErCn4c1zwIh/XgruiLIVY6F353KLw3fXbJW3vYMf//I/dnP/Nm/ITk7oRGInwyofD/n
 VlCji+zNBCZqVru4TzGH49ghiZTzZKwo=
X-Google-Smtp-Source: AGHT+IHIQIF5cP+OhlL3KucdzEwULKP8UbyHlNW3Z/2yYgUbnpkKJtfuorEsV1W09cBVlr7j0fot96/NnMtI6HNTGd4=
X-Received: by 2002:a05:6820:221c:b0:621:75a2:6791 with SMTP id
 006d021491bc7-6217897ccc2mr7019038eaf.0.1757526530846; Wed, 10 Sep 2025
 10:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250909191619.2580169-1-superm1@kernel.org>
 <20250909191619.2580169-8-superm1@kernel.org>
In-Reply-To: <20250909191619.2580169-8-superm1@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 10 Sep 2025 19:48:39 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g8Hq4nfrkEPKByesAZ7SmKz4N8Cm9H_AmK_fez=0QtWw@mail.gmail.com>
X-Gm-Features: Ac12FXyd_vL1lzVAXI-I3rJHVcPaSI6vkfuoiTOhlX1EtvOyF4XzkNpq89iEtOs
Message-ID: <CAJZ5v0g8Hq4nfrkEPKByesAZ7SmKz4N8Cm9H_AmK_fez=0QtWw@mail.gmail.com>
Subject: Re: [PATCH v7 07/12] PCI/PM: Run bridge power up actions as part of
 restore phase
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
> Suspend resume actions will check the state of the device and whether
> bus PM should be skipped.  These same actions make sense during hibernati=
on
> image restore.

Not really (see below).

They kind of would have made sense in the error code path attempting
to roll back the power-off transition, but I'm not sure if this is
worth the hassle because it would require ->restore() to be able to
handle two different cases without knowing which case it is handling.

>  Apply them there as well.
>
> Tested-by: Eric Naim <dnaim@cachyos.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
> v7:
>  * Reword title
> v5:
>  * Split out patch
> ---
>  drivers/pci/pci-driver.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 571a3809f163a..fb6f1f60b2f1f 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -1246,10 +1246,15 @@ static int pci_pm_restore_noirq(struct device *de=
v)
>  {
>         struct pci_dev *pci_dev =3D to_pci_dev(dev);
>         const struct dev_pm_ops *pm =3D dev->driver ? dev->driver->pm : N=
ULL;
> +       pci_power_t prev_state =3D pci_dev->current_state;

In the hibernation restore case, pci_dev->current_state is irrelevant
because the system has gone through the entire init in the BIOS and
boot loader, and the boot (restore) kernel before the control goes
back to the image kernel which runs the ->restore() callbacks.  It may
have changed three times since it was set during power-off.

> +       bool skip_bus_pm =3D pci_dev->skip_bus_pm;

This one is irrelevant either in that case.

>
>         pci_pm_default_resume_early(pci_dev);
>         pci_fixup_device(pci_fixup_resume_early, pci_dev);
>
> +       if (!skip_bus_pm && prev_state =3D=3D PCI_D3cold)
> +               pci_pm_bridge_power_up_actions(pci_dev);
> +
>         if (pci_has_legacy_pm_support(pci_dev))
>                 return 0;
>
> --
