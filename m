Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6486AFE0E6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6889210E74D;
	Wed,  9 Jul 2025 07:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k/c+L04s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CB710E74A;
 Wed,  9 Jul 2025 07:07:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78BF75C6676;
 Wed,  9 Jul 2025 07:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B721C4CEF7;
 Wed,  9 Jul 2025 07:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752044867;
 bh=2MdHLI/kc3/sXkRraTSCSWVM2Sn/FBlCke7KGOlkVj0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k/c+L04sOc0MKjWtcSz7AvHMPOUcbH9BcbJy4JWwYwYXTxE3p1lzybhEhkJLX++af
 a+my1g9ygFOTa3xZR4GtPb8W8Nk4am6v5jRXVSU9AWBHT7KlKwWx9N1IoRKVhYrixp
 F3KnO14FwVXnzmuC1InCS9ronbphbrC/+Z4uA0AATnTbRqYGGfGFTAPyZSilI7gR/w
 geRdqj4W3Or+lYm1fSztBW1Q66zaI97BcziBljphYmv3vNiW2M31uxU/lDai9CbbGp
 XCYcr0Aj4cYC3brjB/JaSAvPNJeRR8k4blKr9O0E0cZL5/TNXT++ojjlrPGT54a7vd
 lZ+4m4KFctRmA==
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-40d1169ff43so2322437b6e.2; 
 Wed, 09 Jul 2025 00:07:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU8zrvaq/3e3dQQMZnYRpno84WXxymoa13qSV9SGfAINH7menhvaEfxSLhRH4AxTcTir+WCf6V9WIaA@lists.freedesktop.org,
 AJvYcCXrr5tuJN0fv1hhXs+NjZ8nhXkGsenterICUwO94iT2YycAIg9UlhsXs1Kudu0ThWnPEw54evvN@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh+oWNg5CtiwTsK8/pDeajkop3lxzOVhtxkEflJgpZqFLsHr3m
 0mzTgGjvcTDpO0pGaVSKRnKLgx/96y1iUsSypubElxSmlHxIC2Jkh8wDga3MFi7XAggUeAFfgcG
 No8p9KfJCbP+Oz1AZKAKR5WHqmj1BmDY=
X-Google-Smtp-Source: AGHT+IGp/NayOtRsLLSmbAURDrhYR2FbBuu38inQDiqYLYIswlKJVK/j/UGfnBdtwASkd+Ow+dv4iXafQ/2s9EKa99M=
X-Received: by 2002:a05:6808:309a:b0:408:fef8:9c95 with SMTP id
 5614622812f47-412bc00a9aemr825692b6e.24.1752044866209; Wed, 09 Jul 2025
 00:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250709064404.839975-1-guoqing.zhang@amd.com>
 <20250709064404.839975-5-guoqing.zhang@amd.com>
In-Reply-To: <20250709064404.839975-5-guoqing.zhang@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Jul 2025 09:07:34 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jPd1UPL8DvhWazmVod+_T7WnLNAqRDzFu_TgR0h01A+Q@mail.gmail.com>
X-Gm-Features: Ac12FXxcTQFO_UUbF4MOdTNwbGiNb201TkYOBWF7Xek2l7rMQeNnDteBDVBMvDo
Message-ID: <CAJZ5v0jPd1UPL8DvhWazmVod+_T7WnLNAqRDzFu_TgR0h01A+Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] PM: hibernate: add new api pm_transition_event()
To: Samuel Zhang <guoqing.zhang@amd.com>, mario.limonciello@amd.com
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, len.brown@intel.com, 
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com, matthew.auld@intel.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, lijo.lazar@amd.com, 
 victor.zhao@amd.com, haijun.chang@amd.com, Qing.Ma@amd.com, 
 Owen.Zhang2@amd.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Wed, Jul 9, 2025 at 8:44=E2=80=AFAM Samuel Zhang <guoqing.zhang@amd.com>=
 wrote:
>
> dev_pm_ops.thaw() is called in following cases:
> * normal case: after hibernation image has been created.
> * error case 1: creation of a hibernation image has failed.
> * error case 2: restoration from a hibernation image has failed.
>
> For normal case, it is called mainly for resume storage devices for
> saving the hibernation image. Other devices that are not involved
> in the image saving do not need to resume the device. But since there's
> no api to know which case thaw() is called, device drivers can't
> conditionally resume device in thaw().
>
> The new pm_transition_event() is such a api to query if thaw() is called
> in normal case. The returned value in thaw() is:
> * PM_EVENT_THAW: normal case, no need to resume non-storage devices.
> * PM_EVENT_RECOVER: error case, need to resume devices.
>
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>  drivers/base/power/main.c |  5 +++
>  include/linux/pm.h        | 85 +++++++++++++++++++++++----------------
>  2 files changed, 56 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 40e1d8d8a589..7e0982caa4d4 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -62,6 +62,11 @@ static LIST_HEAD(dpm_noirq_list);
>
>  static DEFINE_MUTEX(dpm_list_mtx);
>  static pm_message_t pm_transition;
> +int pm_transition_event(void)
> +{
> +       return pm_transition.event;
> +}
> +EXPORT_SYMBOL_GPL(pm_transition_event);
>
>  static int async_error;
>
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index 78855d794342..7e7b843ba823 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -471,58 +471,59 @@ const struct dev_pm_ops name =3D { \
>  #define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))
>  #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
>
> -/*
> - * PM_EVENT_ messages
> +/**
> + * pm_transition_event() - Query the current pm transition event value.
> + *
> + * One example is used to query the reason why thaw() is called.
> + * It will return one of 2 values in this usage:
> + * * %PM_EVENT_THAW: normal case.
> + * * %PM_EVENT_RECOVER: error case.
> + *
> + * For other usage, it may return other values. See :ref:`PM_EVENT_ mess=
ages`
> + * for all possible values.
> + *
> + * Return: One of the %PM_EVENT_ messages
> + */
> +int pm_transition_event(void);

Please move the kerneldoc to where the function is defined (that is, main.c=
).

Now, I've changed my mind regarding this wrapper, sorry.

I'm thinking now that "thaw" is exceptional and no other callback will
ever need to check why it was called because it will always do the
same thing.

So this should be hibernation-specific and Mario was right.

Please make it return bool, and in particular return "true" if
pm_transition.event =3D=3D PM_EVENT_RECOVER and "false" otherwise.

Specifically

bool pm_hibernate_is_recovering(void)
{
        return pm_transition.event =3D=3D PM_EVENT_RECOVER;
}

And the changes below won't be necessary then.

> +
> +/**
> + * DOC: PM_EVENT_ messages
>   *
> - * The following PM_EVENT_ messages are defined for the internal use of =
the PM
> + * The possible return values of %pm_transition_event().
> + *
> + * The following PM_EVENT_ messages are defined for the use of drivers a=
nd PM
>   * core, in order to provide a mechanism allowing the high level suspend=
 and
>   * hibernation code to convey the necessary information to the device PM=
 core
>   * code:
>   *
> - * ON          No transition.
> + * %PM_EVENT_ON:               No transition.
>   *
> - * FREEZE      System is going to hibernate, call ->prepare() and ->free=
ze()
> - *             for all devices.
> + * %PM_EVENT_FREEZE:   System is going to hibernate, call ->prepare() an=
d
> + *             ->freeze() for all devices.
>   *
> - * SUSPEND     System is going to suspend, call ->prepare() and ->suspen=
d()
> - *             for all devices.
> + * %PM_EVENT_SUSPEND:  System is going to suspend, call ->prepare() and
> + *             ->suspend() for all devices.
>   *
> - * HIBERNATE   Hibernation image has been saved, call ->prepare() and
> + * %PM_EVENT_HIBERNATE:        Hibernation image has been saved, call ->=
prepare() and
>   *             ->poweroff() for all devices.
>   *
> - * QUIESCE     Contents of main memory are going to be restored from a (=
loaded)
> - *             hibernation image, call ->prepare() and ->freeze() for al=
l
> + * %PM_EVENT_QUIESCE:  Contents of main memory are going to be restored =
from
> + *             a (loaded) hibernation image, call ->prepare() and ->free=
ze() for all
>   *             devices.
>   *
> - * RESUME      System is resuming, call ->resume() and ->complete() for =
all
> - *             devices.
> + * %PM_EVENT_RESUME:   System is resuming, call ->resume() and ->complet=
e()
> + *             for all devices.
>   *
> - * THAW                Hibernation image has been created, call ->thaw()=
 and
> + * %PM_EVENT_THAW:             Hibernation image has been created, call =
->thaw() and
>   *             ->complete() for all devices.
>   *
> - * RESTORE     Contents of main memory have been restored from a hiberna=
tion
> - *             image, call ->restore() and ->complete() for all devices.
> + * %PM_EVENT_RESTORE:  Contents of main memory have been restored from a
> + *             hibernation image, call ->restore() and ->complete() for =
all devices.
>   *
> - * RECOVER     Creation of a hibernation image or restoration of the mai=
n
> - *             memory contents from a hibernation image has failed, call
> + * %PM_EVENT_RECOVER:  Creation of a hibernation image or restoration of=
 the
> + *             main memory contents from a hibernation image has failed,=
 call
>   *             ->thaw() and ->complete() for all devices.
> - *
> - * The following PM_EVENT_ messages are defined for internal use by
> - * kernel subsystems.  They are never issued by the PM core.
> - *
> - * USER_SUSPEND                Manual selective suspend was issued by us=
erspace.
> - *
> - * USER_RESUME         Manual selective resume was issued by userspace.
> - *
> - * REMOTE_WAKEUP       Remote-wakeup request was received from the devic=
e.
> - *
> - * AUTO_SUSPEND                Automatic (device idle) runtime suspend w=
as
> - *                     initiated by the subsystem.
> - *
> - * AUTO_RESUME         Automatic (device needed) runtime resume was
> - *                     requested by a driver.
>   */
> -
>  #define PM_EVENT_INVALID       (-1)
>  #define PM_EVENT_ON            0x0000
>  #define PM_EVENT_FREEZE                0x0001
> @@ -537,6 +538,22 @@ const struct dev_pm_ops name =3D { \
>  #define PM_EVENT_REMOTE                0x0200
>  #define PM_EVENT_AUTO          0x0400
>
> +/*
> + * The following PM_EVENT_ messages are defined for internal use by
> + * kernel subsystems.  They are never issued by the PM core.
> + *
> + * USER_SUSPEND        Manual selective suspend was issued by userspace.
> + *
> + * USER_RESUME Manual selective resume was issued by userspace.
> + *
> + * REMOTE_WAKEUP       Remote-wakeup request was received from the devic=
e.
> + *
> + * AUTO_SUSPEND        Automatic (device idle) runtime suspend was
> + *                     initiated by the subsystem.
> + *
> + * AUTO_RESUME Automatic (device needed) runtime resume was
> + *                     requested by a driver.
> + */
>  #define PM_EVENT_SLEEP         (PM_EVENT_SUSPEND | PM_EVENT_HIBERNATE)
>  #define PM_EVENT_USER_SUSPEND  (PM_EVENT_USER | PM_EVENT_SUSPEND)
>  #define PM_EVENT_USER_RESUME   (PM_EVENT_USER | PM_EVENT_RESUME)
> --
> 2.43.5
>
