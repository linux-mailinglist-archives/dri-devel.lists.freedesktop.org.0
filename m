Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DA5AFBBA2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 21:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6F410E522;
	Mon,  7 Jul 2025 19:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kk9jQMZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F4710E33C;
 Mon,  7 Jul 2025 19:17:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 210F26111F;
 Mon,  7 Jul 2025 19:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9812C4CEE3;
 Mon,  7 Jul 2025 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751915864;
 bh=X58se4pufgFYDvpX4RDVuu3hHsO7uUWKHZToESh/FC0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kk9jQMZRKG2PlUf9xk+DjlJCYb6Z1Rue5IrSXQuoPOvCmE+GfB/OS/yZ6kugg8GOS
 fwz8iBbQpv0pCaFtfyyQCur4AAOtD23NFyylB55KYw6Bpi/c3k9v0z8eUutp7l1kvd
 K6IVV9QUIXvfropr19eM+gHliN13MC8o4L//VMUr2b+lab4uCWUWC8TneTKfJSOLc8
 gEhC1cC7Iw2joC8Ek8NSALgRkl2BDrSF4krThfqQnihmycYY6pc/8S6TlQP6/GWudx
 h6kQ6GsJjRP1+3dWVP7w7+fML73pu6tEPdqlHOyoKqx+Wp3977eWH5ooXWQwt19sIs
 n/BlpFgN7eurg==
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-6113e68da82so1736390eaf.1; 
 Mon, 07 Jul 2025 12:17:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU0U9Gt4ml7uj+Z9zs6Cz9VLmDj0H21Ii2ec7nJmf1PNvqmaYnxfmmt6B0OjyZbhw11OaD1SyDv@lists.freedesktop.org,
 AJvYcCVxLIgBR0ZfT4eJughS9HMFRPznSk06L6Ni7BNQAuyHBMTGIUNexoyt0y5QPa/v3jpaGB23mVUCa6L0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLf7V0v5/gWd58og74QCtj3zto9WXgCwlUhP0qZXkACKcdxPZH
 mZvZ0dEcTWP12hojBhbVxJpsgbsf3JULEzcpneA4lNuPYik/cpplTNZOukuOsszKJGIhF8rkbbV
 oFbymQ2zX/J3/x0vmv9Yz28+tEBVwg/g=
X-Google-Smtp-Source: AGHT+IFvvGre2qKtisDKi84+JIJG0BNJKCNho0uAzGYlxwaCn2fgCOqGP0+8tfw2ciOjUepnmH58MZ/QJmKYTv+DXoE=
X-Received: by 2002:a05:6820:4b07:b0:611:7385:77a0 with SMTP id
 006d021491bc7-613c10ca61dmr86938eaf.4.1751915864050; Mon, 07 Jul 2025
 12:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-5-guoqing.zhang@amd.com>
 <2c609512-ebe8-4a61-a666-44b308975d72@amd.com>
In-Reply-To: <2c609512-ebe8-4a61-a666-44b308975d72@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 7 Jul 2025 21:17:33 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0in0Qj5QR5GLNB+1JjOh3rbOR3YB91kr40OSy0ygOWLGg@mail.gmail.com>
X-Gm-Features: Ac12FXyry_ZMX4wIeZua_zevr27j-iIjf-OututexrSMWXUO4cFW0hY8Xsxad8c
Message-ID: <CAJZ5v0in0Qj5QR5GLNB+1JjOh3rbOR3YB91kr40OSy0ygOWLGg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] PM: hibernate: export variable pm_transition
To: Mario Limonciello <mario.limonciello@amd.com>,
 Samuel Zhang <guoqing.zhang@amd.com>
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com, 
 Qing.Ma@amd.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 alexander.deucher@amd.com, christian.koenig@amd.com, len.brown@intel.com, 
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com, matthew.auld@intel.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de
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

On Sun, Jul 6, 2025 at 10:40=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 7/4/2025 6:12 AM, Samuel Zhang wrote:
> > https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rs=
t?plain=3D1#L588
> > Per this kernel doc, dev_pm_ops.thaw() is called mainly for resume
>
> Proper way to do this is to put the URL in a 'Link' tag above your SoB.
> That being said I don't think we need to reference the rst file.  Just
> reference the html file.
>
> Something like this:
>
> Per the PCI power management documentation [1] dev_pm_ops.thaw() is
> called mainly for resume.
>
> .
> .
> .
>
> Link: https://docs.kernel.org/power/pci.html [1]
> S-o-b: Foo bar <foo@bar.com>
>
> > storage devices for saving the hibernation image. Other devices that no=
t
>
> that are not
>
> > involved in the image saving do not need to resume the device.
> >
> > But dev_pm_ops.thaw() is also called to restore devices when hibernatio=
n
> > is aborted due to some error in hibernation image creation stage.

This isn't factually correct.

dev_pm_ops.thaw() can be called in an error path in two cases: (1) the
"freeze" transition before the creation of a memory snapshot image
fails and (2) the "freeze" transition during restore (before jumping
back to the image kernel) fails.

> > So there need to be a way to query in thaw() to know if hibernation is
> > aborted or not and conditionally resume devices. Exported pm_transition
> > is such a way. When thaw() is called, the value is:
> > - PM_EVENT_THAW: normal hibernate, no need to resume non-storage device=
s.
> > - PM_EVENT_RECOVER: cancelled hibernation, need to resume devices.
>
> If these events are being exported out for driver use I think that we
> also need matching kernel doc exported too.
>
> That is the comments in include/linux/pm.h need to be converted into
> kernel doc.
>
> Before you make any changes like that though let's see what Rafael
> thinks of this approach.
>
> He might not want to export this symbol out and would prefer a new
> helper for drivers to use like:
>
> inline bool pm_aborted_hibernate();
>
> If that's the direction he prefers you'll need to make kernel doc for
> that instead.

I would prefer a wrapper around pm_transition returning pm_transition.event=
.

It can be called pm_transition_event() even as far as I'm concerned.

Thanks!
