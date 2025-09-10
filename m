Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654FB51886
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D8410E300;
	Wed, 10 Sep 2025 13:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P9FWv5d5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333E010E300;
 Wed, 10 Sep 2025 13:58:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BA9CA449B2;
 Wed, 10 Sep 2025 13:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93871C4CEFE;
 Wed, 10 Sep 2025 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757512733;
 bh=3519NgJS5af1Ajj9Vhlr8KZ7E/Y4HYs8va70a7vghxc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P9FWv5d5a8NYpbSbgR7Ik8dp74uUr4fNWCQpXBHcctk/mkG0E1DvOINiwc1soE4jg
 +BAa7Ud7DObaRmnvBvmQzi0/kpjzlbK2hW9oN9n0vpFM9L5xQ9djr2wuE921sodxEx
 WgA0plNJGmVfalbNkjdqpQGLM54PiOIikmBPUA/6lcJa+k/PegVPG6Tstzawxbxcym
 +JfOZale0lcvdD1/9K4pK4rksymUyVQ2WLCvpaM2g1bKSmlxq3S2mGA+3oTUDDgPKN
 o2H2tmjphxvcy4BVnlh43b3VDrX4EC2Y8ORT05YlhsB98jGNErvFFjT3LDyTRVT1nj
 nXGjYQ6RsCMbw==
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-74595f3852cso4259625a34.0; 
 Wed, 10 Sep 2025 06:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUQU+7WxMGVOeR1VkDuPEG+PozSxRwytmUgLUK55AFag+4usQLE0qbqRcmLds5HflKH1GDqAGLKjrxy@lists.freedesktop.org,
 AJvYcCVG8vbBPTioQVUjIvlIfR2kk1FLrUwwql8XcRArrtDZ4z4ej8dsGGNDxcpBw3Ix0cQT4EbwmowZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6t7xPdnAuHwFU52BrwhmZq8GjOmEGUNajQ9RuGV/gY5X3IN4l
 tv8LfH1nncV/nQ5jMvj4fWzBGtcuZYJ4zxRVscB7YKSKl2JlGDDCr0FHa464PwhquNjVT79K4oo
 41XWGwzLzU2Qf0H36t5FbtL2Ja3yNf/I=
X-Google-Smtp-Source: AGHT+IH7BCb6LYGInN6fRifU1PN2pCzvvU+aj27/RQrKYfBGkk+A//ewx0ANkkYnwGiqVgrG/auhpbNo5qaSgs9mrTo=
X-Received: by 2002:a05:6830:67fb:b0:746:d9af:6664 with SMTP id
 46e09a7af769-74c74ec0cb2mr7381703a34.20.1757512732743; Wed, 10 Sep 2025
 06:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250909191619.2580169-1-superm1@kernel.org>
 <20250909191619.2580169-2-superm1@kernel.org>
In-Reply-To: <20250909191619.2580169-2-superm1@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 10 Sep 2025 15:58:41 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0i6+UaTHDnJE6z-VFuJrXbmfiAr7Gs=z9-xaX9mS7NqGA@mail.gmail.com>
X-Gm-Features: Ac12FXxslvL9eXXrmgBCzhpzNxr-VzxsKkb6k4uN3mry0ap06Tvs7qCSO374gMM
Message-ID: <CAJZ5v0i6+UaTHDnJE6z-VFuJrXbmfiAr7Gs=z9-xaX9mS7NqGA@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] PM: Introduce new PMSG_POWEROFF event
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
> PMSG_POWEROFF will be used for the PM core to allow differentiating betwe=
en
> a hibernation or shutdown sequence when re-using callbacks.
>
> This event should not have wakeups enabled

Why?

It surely is valid to wake up the system while it is being powered
off, especially in the hibernation case.

The "poweroff" transition is generally not recoverable, however, so it
may be better to complete it and trigger a reboot if wakeup has been
signaled.

> so update PMSG_NO_WAKEUP() to match it as well.

No, please.

> Tested-by: Eric Naim <dnaim@cachyos.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
> v7:
>  * Reword commit
> v5:
>  * Re-order and split
>  * Add tags
> v4:
>  * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@ker=
nel.org/
> ---
>  drivers/base/power/main.c    | 7 +++++++
>  include/linux/pm.h           | 5 ++++-
>  include/trace/events/power.h | 3 ++-
>  3 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 2ea6e05e6ec90..86661c94e8cef 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -99,6 +99,8 @@ static const char *pm_verb(int event)
>                 return "restore";
>         case PM_EVENT_RECOVER:
>                 return "recover";
> +       case PM_EVENT_POWEROFF:
> +               return "poweroff";
>         default:
>                 return "(unknown PM event)";
>         }
> @@ -369,6 +371,7 @@ static pm_callback_t pm_op(const struct dev_pm_ops *o=
ps, pm_message_t state)
>         case PM_EVENT_FREEZE:
>         case PM_EVENT_QUIESCE:
>                 return ops->freeze;
> +       case PM_EVENT_POWEROFF:
>         case PM_EVENT_HIBERNATE:
>                 return ops->poweroff;
>         case PM_EVENT_THAW:
> @@ -403,6 +406,7 @@ static pm_callback_t pm_late_early_op(const struct de=
v_pm_ops *ops,
>         case PM_EVENT_FREEZE:
>         case PM_EVENT_QUIESCE:
>                 return ops->freeze_late;
> +       case PM_EVENT_POWEROFF:
>         case PM_EVENT_HIBERNATE:
>                 return ops->poweroff_late;
>         case PM_EVENT_THAW:
> @@ -437,6 +441,7 @@ static pm_callback_t pm_noirq_op(const struct dev_pm_=
ops *ops, pm_message_t stat
>         case PM_EVENT_FREEZE:
>         case PM_EVENT_QUIESCE:
>                 return ops->freeze_noirq;
> +       case PM_EVENT_POWEROFF:
>         case PM_EVENT_HIBERNATE:
>                 return ops->poweroff_noirq;
>         case PM_EVENT_THAW:
> @@ -1370,6 +1375,8 @@ static pm_message_t resume_event(pm_message_t sleep=
_state)
>                 return PMSG_RECOVER;
>         case PM_EVENT_HIBERNATE:
>                 return PMSG_RESTORE;
> +       case PM_EVENT_POWEROFF:
> +               return PMSG_ON;
>         }
>         return PMSG_ON;
>  }
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index cc7b2dc28574c..892bd93f13dad 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -507,6 +507,7 @@ const struct dev_pm_ops name =3D { \
>   * RECOVER     Creation of a hibernation image or restoration of the mai=
n
>   *             memory contents from a hibernation image has failed, call
>   *             ->thaw() and ->complete() for all devices.
> + * POWEROFF    System will poweroff, call ->poweroff() for all devices.
>   *
>   * The following PM_EVENT_ messages are defined for internal use by
>   * kernel subsystems.  They are never issued by the PM core.
> @@ -537,6 +538,7 @@ const struct dev_pm_ops name =3D { \
>  #define PM_EVENT_USER          0x0100
>  #define PM_EVENT_REMOTE                0x0200
>  #define PM_EVENT_AUTO          0x0400
> +#define PM_EVENT_POWEROFF      0x0800
>
>  #define PM_EVENT_SLEEP         (PM_EVENT_SUSPEND | PM_EVENT_HIBERNATE)
>  #define PM_EVENT_USER_SUSPEND  (PM_EVENT_USER | PM_EVENT_SUSPEND)
> @@ -551,6 +553,7 @@ const struct dev_pm_ops name =3D { \
>  #define PMSG_QUIESCE   ((struct pm_message){ .event =3D PM_EVENT_QUIESCE=
, })
>  #define PMSG_SUSPEND   ((struct pm_message){ .event =3D PM_EVENT_SUSPEND=
, })
>  #define PMSG_HIBERNATE ((struct pm_message){ .event =3D PM_EVENT_HIBERNA=
TE, })
> +#define PMSG_POWEROFF  ((struct pm_message){ .event =3D PM_EVENT_POWEROF=
F, })
>  #define PMSG_RESUME    ((struct pm_message){ .event =3D PM_EVENT_RESUME,=
 })
>  #define PMSG_THAW      ((struct pm_message){ .event =3D PM_EVENT_THAW, }=
)
>  #define PMSG_RESTORE   ((struct pm_message){ .event =3D PM_EVENT_RESTORE=
, })
> @@ -568,7 +571,7 @@ const struct dev_pm_ops name =3D { \
>
>  #define PMSG_IS_AUTO(msg)      (((msg).event & PM_EVENT_AUTO) !=3D 0)
>  #define PMSG_NO_WAKEUP(msg)    (((msg).event & \
> -                               (PM_EVENT_FREEZE | PM_EVENT_QUIESCE)) !=
=3D 0)
> +                               (PM_EVENT_FREEZE | PM_EVENT_QUIESCE | PM_=
EVENT_POWEROFF)) !=3D 0)
>  /*
>   * Device run-time power management status.
>   *
> diff --git a/include/trace/events/power.h b/include/trace/events/power.h
> index 82904291c2b81..370f8df2fdb4b 100644
> --- a/include/trace/events/power.h
> +++ b/include/trace/events/power.h
> @@ -179,7 +179,8 @@ TRACE_EVENT(pstate_sample,
>                 { PM_EVENT_HIBERNATE, "hibernate" }, \
>                 { PM_EVENT_THAW, "thaw" }, \
>                 { PM_EVENT_RESTORE, "restore" }, \
> -               { PM_EVENT_RECOVER, "recover" })
> +               { PM_EVENT_RECOVER, "recover" }, \
> +               { PM_EVENT_POWEROFF, "poweroff" })
>
>  DEFINE_EVENT(cpu, cpu_frequency,
>
> --
> 2.43.0
>
