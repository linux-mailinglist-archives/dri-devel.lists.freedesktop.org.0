Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D240CB51FA0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 20:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9776B10E9AC;
	Wed, 10 Sep 2025 18:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XI5vXeh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD9110E9AA;
 Wed, 10 Sep 2025 18:00:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 175CB60252;
 Wed, 10 Sep 2025 18:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70D6C4CEFE;
 Wed, 10 Sep 2025 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757527228;
 bh=aEYVwK9M9QzWa1yd7+FmJ7xSwSWsDm24bHNlO3+ZDiI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XI5vXeh3E69iRJQ42zyvWPbQrQ039vWYrF+m6PVa3bxOeSwQNFvmLv1XXtZCBZ2aN
 A6d0Hq6Hv+wlKq3HN9gRmnKmeTuUdSxHDOd97iLsBvu1LfV6wiQilyy8A6vgummyk5
 b+DwOjmuQsJkGZfEBN+ITZwQwrko7Yu2ekNwlp+0pwSMKwJKS6jc9sJnDiYaRBahjR
 x+YCUAykJaiVzneSzOmp3MExpKfsJQj60xlIhm+GxKK3QB8BliXx5Y7nFIWCl+B0yj
 0e8ca1ohSrfrJAyxfet5z74xk4aj6avc9MYHe3bC3tN+Xd0IP3yAichjp3gBqGNUzs
 LHbNdR3JLGJBg==
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-74c7d98935eso2312371a34.1; 
 Wed, 10 Sep 2025 11:00:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWgG+okitNZBqzMZia9F9oxwMDRMZxJvLT2DdxyIFfT8JbQSj7vjFwGF8eUDcCdmNhjczeD8fxewHdr@lists.freedesktop.org,
 AJvYcCWgOuLosjf0Hr3UKOmpGLVlKLIFg7+CJx7NFGIHOFCkR0l0IU8QaaC8C4ZZZy/Rv47GHAAWOIZp@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB4j9Lai9R5Hhq2W9Fn4AtGyUZtJ7z8romGOip1THT4TvPzOr7
 3Z1ctkIYUlclys6h4LjpOEzTu2mapm0tF3m3Q2eaqTarMsNbd+CXVKKo3XKenaUcZAhw1VpXgmg
 nxBXQGRiqjDGRICCyECKV8JLmKpCOOo8=
X-Google-Smtp-Source: AGHT+IGS3DlLDZc5Hp9Wu7ymo9qCnnEjsWp392Wk609kXWdhdzzFbsXXgHOkn/CUlPsxX3QZUGBx4ariAoNkk9utRK4=
X-Received: by 2002:a05:6830:2695:b0:745:a0f0:25c6 with SMTP id
 46e09a7af769-74c702bca54mr7780880a34.10.1757527227849; Wed, 10 Sep 2025
 11:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250909191619.2580169-1-superm1@kernel.org>
 <20250909191619.2580169-2-superm1@kernel.org>
 <CAJZ5v0i6+UaTHDnJE6z-VFuJrXbmfiAr7Gs=z9-xaX9mS7NqGA@mail.gmail.com>
 <9332e17e-380b-42cc-b078-7c5d9d09d798@kernel.org>
In-Reply-To: <9332e17e-380b-42cc-b078-7c5d9d09d798@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 10 Sep 2025 20:00:16 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ga0sejxa6DyN_1aCuB-fVsa_w-G1U=RR6kmGVn48QR2Q@mail.gmail.com>
X-Gm-Features: Ac12FXwjW268LpbRAcls9flQhPZhEXycRZTW2tVrYiFw-ZH6X5s316VJMYfwl5Q
Message-ID: <CAJZ5v0ga0sejxa6DyN_1aCuB-fVsa_w-G1U=RR6kmGVn48QR2Q@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] PM: Introduce new PMSG_POWEROFF event
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
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

On Wed, Sep 10, 2025 at 7:48=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> On 9/10/25 8:58 AM, Rafael J. Wysocki wrote:
> > On Tue, Sep 9, 2025 at 9:16=E2=80=AFPM Mario Limonciello (AMD)
> > <superm1@kernel.org> wrote:
> >>
> >> PMSG_POWEROFF will be used for the PM core to allow differentiating be=
tween
> >> a hibernation or shutdown sequence when re-using callbacks.
> >>
> >> This event should not have wakeups enabled
> >
> > Why?
> >
> > It surely is valid to wake up the system while it is being powered
> > off, especially in the hibernation case.
>
> In the hibernation case - yes you want wakeups.
>
> But in what is perceived as powering off the machine it's not expected
> that you would have wakeups.
>
> If I have a USB mouse connected and set as a wakeup source, I can click
> the mouse and the machine wakes up.  A user wouldn't expect that happens
> with a powered off machine.
>
> That's certainly not how it works today at least.

Sure, but you want to use the same transition mechanism to handle
those two cases.  In one of them, you don't want wakeup events to be
disabled, so you cannot do that at the transition type level.

> >
> > The "poweroff" transition is generally not recoverable, however, so it
> > may be better to complete it and trigger a reboot if wakeup has been
> > signaled.
>
> Hmm, I'm not sure about that.  Back to hypothesizing on the USB mouse cas=
e:
> If I'm entering suspend, the mouse is an enabled wakeup source and I'm
> moving the mouse the suspend should be aborted.
>
> But if I requested the machine to be powered off and and I clicked the
> mouse while powering off that would be an "aborted power off?.
> Wouldn't that be really counterintuitive to reboot instead?

I was talking about the last stage of hibernation, sorry if that
wasn't clear enough.

So in the last stage of hibernation, which also carries out a
"power-off" transition (if run in the "platform" mode that is), you
want wakeups to be enabled, don't you?

But the "power-off" transition is not recoverable in general (IOW, it
cannot be reliably rolled back, at least as of today), it may be
better to complete it and make the kernel load the just created
hibernation image and restore from it in response to a wakeup event.
Something like the latter is already done in the "test_resume"
hibernation mode.

> IE as a user you expect that pressing the power button gets you an off
> machine, not a different result based on other activity.

That's a slightly different case, but if you press the power button
once while hibernation is in progress, you may actually expect to get
back to the pre-hibernation state (or at least hope that this is going
to happen).
