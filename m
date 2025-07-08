Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D119EAFCDAF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406C910E674;
	Tue,  8 Jul 2025 14:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ORX8XU/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B091510E670;
 Tue,  8 Jul 2025 14:33:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 42E1046868;
 Tue,  8 Jul 2025 14:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F72BC4CEFD;
 Tue,  8 Jul 2025 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751985197;
 bh=utNLXH3cnocVF0s3DW7Irujgx/+GsETZteqLAdiCATo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ORX8XU/4HsmfXAu+ttwONyKDgmjdC/2adYuDv1LmNygWgYKxy+X93jrcYPn4UHHJR
 QdzUPSv/w+HRpAwNErdAWaNEISibVGOYAUIarv2Q6eqb0rXm5SoZxErzNTjJpMAn8k
 lepr9t4hl0dHHRobOFzu8V2usrOntKvBgi6cAl8G2afyPPNzHXYUUUd73fmrInkudC
 nD4wJu5x6TWcjmDt9Ca4o6G0iLcJOnY9t5CVZlj1JKPd0K4Rb2TVaRn5ruiPWVdDo+
 2UD7fxK5sJGFhJVf5BoP66BDxJvxdW86zFkCef/cPBlrXOfT+mSmfSXp31CYjJA0gM
 GRuDpEKafyGsw==
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-60bd30dd387so2252737eaf.3; 
 Tue, 08 Jul 2025 07:33:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW03RIBKylABe5VfvSosavydtn3GBxgbEbL8wlII6Thy+CDzIL+VjUN07Mo20klC2uzGjyCimew@lists.freedesktop.org,
 AJvYcCXlrroM6olzanjac6Sie4SMCtWjU1h0L3GxCpU2sBx/EO/3hfmweUOi6n/t7FRBzVgFLbGvhNoW374V@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy98OaAJLYeg6+s7/tUWijn3BRXuCJmlqUW+b4k6cU+pkB0zHCP
 pDbZ4URncfBIIZSAoZTtojvWRaiv0DL3RdyWuJtiTKSwbIdwGaeOs6iXXpHth75h/PhTHjgQEzt
 k6JMq19PR+dIh73Vh40FnBZSbynpshEs=
X-Google-Smtp-Source: AGHT+IHCtFxy18tJdbPmS1pdbD7qxFrPanLGCz9iVdkc5UtRxR8SWo8Sl8LWqp5eInHk3vhKRkBRibuDd8mYu3eHMZY=
X-Received: by 2002:a05:6820:1e82:b0:611:befc:38e5 with SMTP id
 006d021491bc7-6138fd6a38cmr13791192eaf.4.1751985196181; Tue, 08 Jul 2025
 07:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-4-guoqing.zhang@amd.com>
 <bd30f96b-44d2-4127-a019-f02bc2689aa2@amd.com>
In-Reply-To: <bd30f96b-44d2-4127-a019-f02bc2689aa2@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Jul 2025 16:33:04 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iscejFdRXQAPkzdN0xBdZDnx5LzVvsN2SGC0ByBku85A@mail.gmail.com>
X-Gm-Features: Ac12FXzc74rd4ki3qeGnaoyMnInARYYWD0QmmPi-iPQcAH4hz74nl4kC3IivriE
Message-ID: <CAJZ5v0iscejFdRXQAPkzdN0xBdZDnx5LzVvsN2SGC0ByBku85A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] PM: hibernate: shrink shmem pages after
 dev_pm_ops.prepare()
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

On Tue, Jul 8, 2025 at 4:28=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 7/8/2025 3:42 AM, Samuel Zhang wrote:
> > When hibernate with data center dGPUs, huge number of VRAM data will be
> > moved to shmem during dev_pm_ops.prepare(). These shmem pages take a lo=
t
> > of system memory so that there's no enough free memory for creating the
> > hibernation image. This will cause hibernation fail and abort.
> >
> > After dev_pm_ops.prepare(), call shrink_all_memory() to force move shme=
m
> > pages to swap disk and reclaim the pages, so that there's enough system
> > memory for hibernation image and less pages needed to copy to the image=
.
> >
> > This patch can only flush and free about half shmem pages. It will be
> > better to flush and free more pages, even all of shmem pages, so that
> > there're less pages to be copied to the hibernation image and the overa=
ll
> > hibernation time can be reduced.
> >
> > Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>
> AFAICT this didn't tangibly change and was just reordered in the series,
> I think you should carry Rafael's A-b tag forward.

Yes, please.

> > ---
> >   kernel/power/hibernate.c | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >
> > diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> > index 10a01af63a80..7ae9d9a7aa1d 100644
> > --- a/kernel/power/hibernate.c
> > +++ b/kernel/power/hibernate.c
> > @@ -370,6 +370,23 @@ static int create_image(int platform_mode)
> >       return error;
> >   }
> >
> > +static void shrink_shmem_memory(void)
> > +{
> > +     struct sysinfo info;
> > +     unsigned long nr_shmem_pages, nr_freed_pages;
> > +
> > +     si_meminfo(&info);
> > +     nr_shmem_pages =3D info.sharedram; /* current page count used for=
 shmem */
> > +     /*
> > +      * The intent is to reclaim all shmem pages. Though shrink_all_me=
mory() can
> > +      * only reclaim about half of them, it's enough for creating the =
hibernation
> > +      * image.
> > +      */
> > +     nr_freed_pages =3D shrink_all_memory(nr_shmem_pages);
> > +     pr_debug("requested to reclaim %lu shmem pages, actually freed %l=
u pages\n",
> > +                     nr_shmem_pages, nr_freed_pages);
> > +}
> > +
> >   /**
> >    * hibernation_snapshot - Quiesce devices and create a hibernation im=
age.
> >    * @platform_mode: If set, use platform driver to prepare for the tra=
nsition.
> > @@ -411,6 +428,15 @@ int hibernation_snapshot(int platform_mode)
> >               goto Thaw;
> >       }
> >
> > +     /*
> > +      * Device drivers may move lots of data to shmem in dpm_prepare()=
. The shmem
> > +      * pages will use lots of system memory, causing hibernation imag=
e creation
> > +      * fail due to insufficient free memory.
> > +      * This call is to force flush the shmem pages to swap disk and r=
eclaim
> > +      * the system memory so that image creation can succeed.
> > +      */
> > +     shrink_shmem_memory();
> > +
> >       suspend_console();
> >       pm_restrict_gfp_mask();
> >
>
