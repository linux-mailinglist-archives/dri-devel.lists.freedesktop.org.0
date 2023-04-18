Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8BB6E6655
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7442610E7B6;
	Tue, 18 Apr 2023 13:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE60D10E341;
 Tue, 18 Apr 2023 13:49:33 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 k13-20020a4ad98d000000b00542416816b1so1927510oou.7; 
 Tue, 18 Apr 2023 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681825772; x=1684417772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hd36n+jQH5c5I2DyX/yhPuiWCfBseqSQIandCTyCQ84=;
 b=etCSQZyuM+8nr1/0tPEywqCeuLGR0niJ5jFgmWR1pgFLlTgF82WkQVObKdxkC+x8Ij
 6/8+0vCT7JWtxkdN/k7HDfhi271GpiiIaH011VaOVpMO6thzSHa/bd6a1C1N42tfX4EM
 07NJ4+I921PPfKuBw5NhehqhKrlL8BmCkzyYwNwSpZRLGPoFrOBgPim0lrW5ejNQ7Ubb
 8EGiJbqMVQVqhzITbHAlGuWDw1Kiu81Di+PQnZZdJZNpWk9MNO55CWRtzAapZCjSCPge
 /KjxAbDjD1a6w5kFTJ5Gzv9vkVzfe6mt61MvE2t5tUB5uhk7qL07VRqP2w8rQSMk3tkv
 sXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681825772; x=1684417772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hd36n+jQH5c5I2DyX/yhPuiWCfBseqSQIandCTyCQ84=;
 b=In/zTpg3MwK+IXdOdI/45hVe+rOuK48eeVTzFVVoREwgN1+HsWu/72gPJdYCKvmG48
 Pf1Nxc5vFY1L22FRgByeNEhxLXAe6JcWCLhXMrBmy7+PxmWd39HDtrfG6z+XThwypMuK
 5sxeQ0TFRkbbA1xtzHbo8mCLeRzfoDEQ5Y5X/qbYaKMXSZF7K37kLjCyyp2OBNGnzFiL
 sovyAlvoZ00JxGRAuSFJU59278CZ5N0KRUt3e741Gv3jYQs80Tq8Igaz89EE0z/1ODWv
 z0tbypoa7OlnVWqfNFMPQhHBxcoErCWHUEXqChaiNazVE32ISqJjxyr4AmyaTrU8ey/y
 JgKQ==
X-Gm-Message-State: AAQBX9cExFCOTZaYY7ZgLjLd/tbP9dg9U9a3/Xuyab5f0XpnlCHs2jdS
 xVR599CAV6gC8O9Ah5f27B5ppAzpRTXeJm/pUic=
X-Google-Smtp-Source: AKy350ZcENNlnCLgJl8nnh0TKfeDlyxJn7JA3MYQF0E0iJYD5NlQvDMep0wtukby5EaZK2PJDCECVrVjymyzHVtT5Tg=
X-Received: by 2002:a05:6820:1aa0:b0:546:e85c:8bba with SMTP id
 bt32-20020a0568201aa000b00546e85c8bbamr1850063oob.1.1681825772423; Tue, 18
 Apr 2023 06:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGu3oagVYqBcgqKFO6-gbLbVdFn51fKeV7CfWTJXJjTNYA@mail.gmail.com>
 <fca966cf-df17-a937-8330-b2353f1a352c@linux.intel.com>
In-Reply-To: <fca966cf-df17-a937-8330-b2353f1a352c@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Apr 2023 06:49:21 -0700
Message-ID: <CAF6AEGswZZZxwRTOXbCVKmhUYwz8BSu-GDVCJ=FfyJ-w=e4dLQ@mail.gmail.com>
Subject: Re: [RFC 3/6] drm: Add fdinfo memory stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 2:00=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 17/04/2023 20:39, Rob Clark wrote:
> > On Mon, Apr 17, 2023 at 8:56=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> Add support to dump GEM stats to fdinfo.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> ---
> >>   Documentation/gpu/drm-usage-stats.rst | 12 +++++++
> >>   drivers/gpu/drm/drm_file.c            | 52 +++++++++++++++++++++++++=
++
> >>   include/drm/drm_drv.h                 |  7 ++++
> >>   include/drm/drm_file.h                |  8 +++++
> >>   4 files changed, 79 insertions(+)
> >>
> >> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu=
/drm-usage-stats.rst
> >> index 2ab32c40e93c..8273a41b2fb0 100644
> >> --- a/Documentation/gpu/drm-usage-stats.rst
> >> +++ b/Documentation/gpu/drm-usage-stats.rst
> >> @@ -21,6 +21,7 @@ File format specification
> >>
> >>   - File shall contain one key value pair per one line of text.
> >>   - Colon character (`:`) must be used to delimit keys and values.
> >> +- Caret (`^`) is also a reserved character.
> >
> > this doesn't solve the problem that led me to drm-$CATEGORY-memory... ;=
-)
>
> Could you explain or remind me with a link to a previous explanation?

How is userspace supposed to know that "drm-memory-foo" is a memory
type "foo" but drm-memory-foo^size is not memory type "foo^size"?

BR,
-R

> What tool barfs on it and how? Spirit of drm-usage-stats.pl is that for
> both drm-engine-<str>: and drm-memory-<str>: generic userspace is
> supposed to take the whole <std> as opaque and just enumerate all it find=
s.
>
> Gputop manages to do that with engines names it knows _nothing_ about.
> If it worked with memory regions it would just show the list of new
> regions as for example "system^resident", "system^active". Then tools
> can be extended to understand it better and provide a sub-breakdown if
> wanted.
>
> Ugly not, we can change from caret to something nicer, unless I am
> missing something it works, no?
>
> Regards,
>
> Tvrtko
>
> >
> > (also, it is IMHO rather ugly)
> >
> > BR,
> > -R
> >
> >>   - All keys shall be prefixed with `drm-`.
> >>   - Whitespace between the delimiter and first non-whitespace characte=
r shall be
> >>     ignored when parsing.
> >> @@ -105,6 +106,17 @@ object belong to this client, in the respective m=
emory region.
> >>   Default unit shall be bytes with optional unit specifiers of 'KiB' o=
r 'MiB'
> >>   indicating kibi- or mebi-bytes.
> >>
> >> +- drm-memory-<str>^size:      <uint> [KiB|MiB]
> >> +- drm-memory-<str>^shared:    <uint> [KiB|MiB]
> >> +- drm-memory-<str>^resident:  <uint> [KiB|MiB]
> >> +- drm-memory-<str>^purgeable: <uint> [KiB|MiB]
> >> +- drm-memory-<str>^active:    <uint> [KiB|MiB]
> >> +
> >> +Resident category is identical to the drm-memory-<str> key and two sh=
ould be
> >> +mutually exclusive.
> >> +
> >> +TODO more description text...
> >> +
> >>   - drm-cycles-<str> <uint>
> >>
> >>   Engine identifier string must be the same as the one specified in th=
e
> >> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> >> index 37b4f76a5191..e202f79e816d 100644
> >> --- a/drivers/gpu/drm/drm_file.c
> >> +++ b/drivers/gpu/drm/drm_file.c
> >> @@ -42,6 +42,7 @@
> >>   #include <drm/drm_client.h>
> >>   #include <drm/drm_drv.h>
> >>   #include <drm/drm_file.h>
> >> +#include <drm/drm_gem.h>
> >>   #include <drm/drm_print.h>
> >>
> >>   #include "drm_crtc_internal.h"
> >> @@ -871,6 +872,54 @@ void drm_send_event(struct drm_device *dev, struc=
t drm_pending_event *e)
> >>   }
> >>   EXPORT_SYMBOL(drm_send_event);
> >>
> >> +static void
> >> +print_stat(struct drm_printer *p, const char *stat, const char *regio=
n, u64 sz)
> >> +{
> >> +       const char *units[] =3D {"", " KiB", " MiB"};
> >> +       unsigned int u;
> >> +
> >> +       if (sz =3D=3D ~0ull) /* Not supported by the driver. */
> >> +               return;
> >> +
> >> +       for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> >> +               if (sz < SZ_1K)
> >> +                       break;
> >> +               sz =3D div_u64(sz, SZ_1K);
> >> +       }
> >> +
> >> +       drm_printf(p, "drm-memory-%s^%s:\t%llu%s\n",
> >> +                  region, stat, sz, units[u]);
> >> +}
> >> +
> >> +static void print_memory_stats(struct drm_printer *p, struct drm_file=
 *file)
> >> +{
> >> +       struct drm_device *dev =3D file->minor->dev;
> >> +       struct drm_fdinfo_memory_stat *stats;
> >> +       unsigned int num, i;
> >> +       char **regions;
> >> +
> >> +       regions =3D dev->driver->query_fdinfo_memory_regions(dev, &num=
);
> >> +
> >> +       stats =3D kcalloc(num, sizeof(*stats), GFP_KERNEL);
> >> +       if (!stats)
> >> +               return;
> >> +
> >> +       dev->driver->query_fdinfo_memory_stats(file, stats);
> >> +
> >> +       for (i =3D 0; i < num; i++) {
> >> +               if (!regions[i]) /* Allow sparse name arrays. */
> >> +                       continue;
> >> +
> >> +               print_stat(p, "size", regions[i], stats[i].size);
> >> +               print_stat(p, "shared", regions[i], stats[i].shared);
> >> +               print_stat(p, "resident", regions[i], stats[i].residen=
t);
> >> +               print_stat(p, "purgeable", regions[i], stats[i].purgea=
ble);
> >> +               print_stat(p, "active", regions[i], stats[i].active);
> >> +       }
> >> +
> >> +       kfree(stats);
> >> +}
> >> +
> >>   /**
> >>    * drm_show_fdinfo - helper for drm file fops
> >>    * @seq_file: output stream
> >> @@ -900,6 +949,9 @@ void drm_show_fdinfo(struct seq_file *m, struct fi=
le *f)
> >>
> >>          if (dev->driver->show_fdinfo)
> >>                  dev->driver->show_fdinfo(&p, file);
> >> +
> >> +       if (dev->driver->query_fdinfo_memory_regions)
> >> +               print_memory_stats(&p, file);
> >>   }
> >>   EXPORT_SYMBOL(drm_show_fdinfo);
> >>
> >> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> >> index 89e2706cac56..ccc1cd98d2aa 100644
> >> --- a/include/drm/drm_drv.h
> >> +++ b/include/drm/drm_drv.h
> >> @@ -35,6 +35,7 @@
> >>   #include <drm/drm_device.h>
> >>
> >>   struct drm_file;
> >> +struct drm_fdinfo_memory_stat;
> >>   struct drm_gem_object;
> >>   struct drm_master;
> >>   struct drm_minor;
> >> @@ -408,6 +409,12 @@ struct drm_driver {
> >>           */
> >>          void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f=
);
> >>
> >> +       char ** (*query_fdinfo_memory_regions)(struct drm_device *dev,
> >> +                                              unsigned int *num);
> >> +
> >> +       void (*query_fdinfo_memory_stats)(struct drm_file *f,
> >> +                                         struct drm_fdinfo_memory_sta=
t *stat);
> >> +
> >>          /** @major: driver major number */
> >>          int major;
> >>          /** @minor: driver minor number */
> >> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> >> index 7d9b3c65cbc1..00d48beeac5c 100644
> >> --- a/include/drm/drm_file.h
> >> +++ b/include/drm/drm_file.h
> >> @@ -375,6 +375,14 @@ struct drm_file {
> >>   #endif
> >>   };
> >>
> >> +struct drm_fdinfo_memory_stat {
> >> +       u64 size;
> >> +       u64 shared;
> >> +       u64 resident;
> >> +       u64 purgeable;
> >> +       u64 active;
> >> +};
> >> +
> >>   /**
> >>    * drm_is_primary_client - is this an open file of the primary node
> >>    * @file_priv: DRM file
> >> --
> >> 2.37.2
> >>
