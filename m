Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC4CA8DB7
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 19:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3726C10E279;
	Fri,  5 Dec 2025 18:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OW2NRRz5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2277110E279
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 18:45:40 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-787da30c50fso25760257b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 10:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764960339; x=1765565139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/yT5dCw/oU670dy6XZVUZ+wCgPPWQ+AZnclyUI85Nsk=;
 b=OW2NRRz5kbVNjCTTjOArKmesCR7AbZo4CIaZPrW/VeRMMb+R3NPStwUKTjkywmdvzN
 o5QFQM98irZUU1RQDjwyOXdmgKx1cAr8BQVh9B00FGjmBuiXtzUvqh52DQnZGTbWAP2D
 3MtVEAuBU/GOHNOpowflm/yMluqBgttsY/R/kfbU8Aqz5uhm//QLumHLb7KhRSl5eZm+
 5EPS6A+ztvoQRK6zHH+/jvYbIAUGNQ0kAkT1alGQzFOv5Vmr4ouvLO+d6OyeIyUrvz5z
 eHUx4ZkpyQriFNM1YF/xnMyDj3ZCYK+CnoKje4NbntI16Iemj6qz21477aUDCHh3GfUA
 qt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764960339; x=1765565139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/yT5dCw/oU670dy6XZVUZ+wCgPPWQ+AZnclyUI85Nsk=;
 b=BCFTe7yLXan9XCZQOKMDvxXpLqN+hCt+w4JiHQoKfTIRVktsDD9Erwbp7MfO91PcnT
 mC0PwWSylUM65z/dNhtnyRmc9wAMxuz8F4kqQW2yC5QJQrecojtFSBfguspDoyQldU6Y
 hyFd+2KBfbv1l3oRXSa270Mn5mw4ck6QgQGYJVRNbX9rg8SHorr0QrA50kOF+Zk5m8O8
 shA0HjZXhM17QrNjhDKBWRRR4zAyYJ8IDsfoM+wC+2O2OAZB2PkJMth2WHcniIndQlJB
 Je9hvzChD+r67hdoM3ddqL4FrwTmREWZ1t/EiEXv1PXn6zHRVr1586mVFTtpoKNZGaFs
 2yvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrIzhhHLlv2dt03CwjEeILHljUjg0hq3bQn7KXa29xzVAzwE/TQglSB+ykktz1PEGcz36sUx0yN1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOyba7HF7fQQFwjOCFWQSZP8QpJroihkEvFUjEEstzftBRZpb6
 1P3x+4HS6ulAGYeMMKm47zOfqFyLHWCAJNV/hvHT5SeOjZCuGVhIpwh+qHM34nxc7kQ2bSIT99d
 IcK9la77C9FpzMA8A0b2wF21mpxI0ku4=
X-Gm-Gg: ASbGncvmxHYH/lw5odRLHMCRWd3ayzb/eQWDg85W6C6RG0t0ST8y+deTfxhKX0Kh619
 lQsZq38cPDY99ipkEO7sQWQN+PMdPTxqNREcISs/e7nLV31O35ohjitrMQnCLOYhCfHeM/gsYPZ
 17RZjfJ+knXcfPQZDLww6Cl0cQ7mSCe9ZvHYHbMJuPq5Uh+qaIEeJByGvdSwmXYtR32i//6MIhM
 NCGhQIIFTLFjtcn306P+wuhiBxqnXV+qDjO15dLdM4ITOgmitEmIa14FTIjX5uHtgO9051mg7s4
 sFoDEIX+A9jQDZ+flB/EmY1z8WhB
X-Google-Smtp-Source: AGHT+IHTW2zFt5vxOgcDHw0rqigS6818viw63i6qOxdTcMGTatW05MNqFQesvaiw02AbMakYmk8j72SbS/3QUKsOCTU=
X-Received: by 2002:a05:690c:690c:b0:787:ca0f:2687 with SMTP id
 00721157ae682-78c33c16cf0mr1380647b3.34.1764960338950; Fri, 05 Dec 2025
 10:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20251204174545.399059-1-olvaffe@gmail.com>
 <20251205134307.6a06f9e1@fedora>
In-Reply-To: <20251205134307.6a06f9e1@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 5 Dec 2025 10:45:28 -0800
X-Gm-Features: AQt7F2oq8s9kOvRX3ejviSF023YPYYhWmuYGH35P5UxmHUPwX6N0yjeb7j5jTRw
Message-ID: <CAPaKu7RNOXSza-YP5cqnasPgs2E8HQ4yUzm4N2F649HgNxb18g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panthor: fix for dma-fence safe access rules
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 tvrtko.ursulin@igalia.com
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

On Fri, Dec 5, 2025 at 4:43=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu,  4 Dec 2025 09:45:45 -0800
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
> > the rules") details the dma-fence safe access rules. The most common
> > culprit is that drm_sched_fence_get_timeline_name may race with
> > group_free_queue.
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > Reviewed-by: Steven Price <steven.price@arm.com>
> >
> > ---
> > v2: collect R-bs and drop misleading Fixes: tag
>
> Should we at least
>
> Cc: stable@vger.kernel.org
>
> so this gets considered for backporting?
This can be considered a follow-up to commit 506aa8b02a8d6. I think

  Cc: stable@vger.kernel.org # v6.17+

is appropriate. (Not sure if I should send v3 or leave it to
maintainers, because I was once told to never add the line and always
leave it to maintainers).

To help make the decision, commit 506aa8b02a8d6 itself narrowed the
race window greatly. This follow-up closes the remaining case where
panthor signals the fence and destroys the group while the consumer
holds the rcu read lock.


>
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index 33b9ef537e359..a8b1347e4da71 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/rcupdate.h>
> >
> >  #include "panthor_devfreq.h"
> >  #include "panthor_device.h"
> > @@ -923,6 +924,9 @@ static void group_release_work(struct work_struct *=
work)
> >                                                  release_work);
> >       u32 i;
> >
> > +     /* dma-fences may still be accessing group->queues under rcu lock=
. */
> > +     synchronize_rcu();
> > +
> >       for (i =3D 0; i < group->queue_count; i++)
> >               group_free_queue(group, group->queues[i]);
> >
>
