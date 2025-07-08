Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0DCAFCDE2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E4310E0B0;
	Tue,  8 Jul 2025 14:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s3O72sxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B8910E0B0;
 Tue,  8 Jul 2025 14:39:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 53E30A53EDD;
 Tue,  8 Jul 2025 14:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0158AC4CEEF;
 Tue,  8 Jul 2025 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751985580;
 bh=g7JNnaXSPMt+VqEG9a7P7H3phrBTW8jOu04WbuFibsU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s3O72sxg3nj0vXCiW+P7HVPpEje5HvkAMPnuzmWE7FHX8DLSeU2Diy6jU/2hGriOX
 VAat9E+ziM8nyzy9vkXNadkaajXVkwI5XwWy1tnrwmeob4SgnpkH7HxU3HcrmPyxdd
 2P/qTalhQJ/ByNmu8cfyYT9hICeNGjC/ZcWaIAZ7C73IZ4y8dDHG5tv7AICCCLkEQI
 mKuBVwNDVieoaJwXx05nu1aqXLoG0f2rQybj9as/KpVSOo/jnrJJL7UYKsaZZuo5fO
 E0n9ewrnxfGW7qfU7qR+3+kSKhMBG4i1gJ7KllGCRUqOUMh7A/CUyYfHjzJTSAyLP6
 OnILmV3ioYMeg==
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-40b71debe9aso1303127b6e.2; 
 Tue, 08 Jul 2025 07:39:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUDaK/Zy+k0luMOnd4pin6amDE9TySqXpasjO9JBUl+FJmZ2bCD6TOGgO5eKGX395AX9+d7vwLH8qrt@lists.freedesktop.org,
 AJvYcCUiFVAGfyaABJbOdappRUdBqO4l8IT4HfNF1Kw5oZ+WtMXnp95eC0wT0YhJCpli6bYX+lkZMmtH@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx29PBuBqQAR1INMPyEkczIoKKjdPsVsL4zSX8pxj5zn2uQUs8m
 XG1dKzE0M6mNT9/8UrzTt0dRvCenu62XGnAO6E+Yc9PvlJ6PkEGTZ52dlPSKmYIeEcr0pCZHL6F
 6+0+y4NMtg6tDK17McQMzIRkP1ZgD7Nc=
X-Google-Smtp-Source: AGHT+IHiTi+tK7OBKN3ciDaO2n9BCiXei6vti+iRh6w6s5ITlTagv0S3T9OaABT6TshT1h/8Lt9SWI8UCBcRgqIfg+A=
X-Received: by 2002:a05:6808:308c:b0:40a:f48f:2c10 with SMTP id
 5614622812f47-4125cd1b519mr20316b6e.10.1751985579249; Tue, 08 Jul 2025
 07:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-5-guoqing.zhang@amd.com>
 <1fa50a8e-9942-45c4-bef0-f31c23ef9923@amd.com>
In-Reply-To: <1fa50a8e-9942-45c4-bef0-f31c23ef9923@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Jul 2025 16:39:28 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j4BuFi_WPPvW64=42Ww=tM8xwpX6gPz8_HX8fJE_Wv1Q@mail.gmail.com>
X-Gm-Features: Ac12FXzvqGDKTtz6zV1G6dpp5vC1FXf7sqbpxq5Jl57O26uN2XAqE-cZGhzEN-A
Message-ID: <CAJZ5v0j4BuFi_WPPvW64=42Ww=tM8xwpX6gPz8_HX8fJE_Wv1Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] PM: hibernate: add new api pm_transition_event()
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com, 
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

On Tue, Jul 8, 2025 at 4:37=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 7/8/2025 3:42 AM, Samuel Zhang wrote:
> > dev_pm_ops.thaw() is called in following cases:
> > * normal case: after hibernation image has been created.
> > * error case 1: creation of a hibernation image has failed.
> > * error case 2: restoration from a hibernation image has failed.
> >
> > For normal case, it is called mainly for resume storage devices for
> > saving the hibernation image. Other devices that are not involved
> > in the image saving do not need to resume the device. But since there's
> > no api to know which case thaw() is called, device drivers can't
> > conditionally resume device in thaw().
> >
> > The new pm_transition_event() is such a api to query if thaw() is calle=
d
> > in normal case. The returned value in thaw() is:
> > * PM_EVENT_THAW: normal case, no need to resume non-storage devices.
> > * PM_EVENT_RECOVER: error case, need to resume devices.
> >
> > Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> > ---
> >   drivers/base/power/main.c |  5 +++++
> >   include/linux/pm.h        | 16 ++++++++++++++++
> >   2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > index 40e1d8d8a589..7e0982caa4d4 100644
> > --- a/drivers/base/power/main.c
> > +++ b/drivers/base/power/main.c
> > @@ -62,6 +62,11 @@ static LIST_HEAD(dpm_noirq_list);
> >
> >   static DEFINE_MUTEX(dpm_list_mtx);
> >   static pm_message_t pm_transition;
> > +int pm_transition_event(void)
> > +{
> > +     return pm_transition.event;
> > +}
> > +EXPORT_SYMBOL_GPL(pm_transition_event);
> >
> >   static int async_error;
> >
> > diff --git a/include/linux/pm.h b/include/linux/pm.h
> > index 78855d794342..d1cb77ede1a2 100644
> > --- a/include/linux/pm.h
> > +++ b/include/linux/pm.h
> > @@ -657,6 +657,22 @@ struct pm_subsys_data {
> >   #define DPM_FLAG_SMART_SUSPEND              BIT(2)
> >   #define DPM_FLAG_MAY_SKIP_RESUME    BIT(3)
> >
> > +/**
> > + * pm_transition_event() - Query the current pm transition event value=
.
> > + *
> > + * Used to query the reason why thaw() is called. It will be one of 2 =
values:
> > + *
> > + * PM_EVENT_THAW: normal case.
> > + *           hibernation image has been created.
> > + *
> > + * PM_EVENT_RECOVER: error case.
> > + *           creation of a hibernation image or restoration of the mai=
n memory
> > + *           contents from a hibernation image has failed.
>
> I don't believe this documentation is complete.  In the use in this
> series those are two events used, but as this is now exported this might
> be used by other callers later which could use it for other PM_EVENT_*.
>
> So because of this I think it's best to convert the comment in
> include/linux/pm.h to kdoc and then reference that from this kdoc.

+1

> > + *
> > + * Return: PM_EVENT_ messages
> > + */
> > +int pm_transition_event(void);
> > +
> >   struct dev_pm_info {
> >       pm_message_t            power_state;
> >       bool                    can_wakeup:1;
>
