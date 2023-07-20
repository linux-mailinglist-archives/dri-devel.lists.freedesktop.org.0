Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985875B58D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 19:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F77F10E132;
	Thu, 20 Jul 2023 17:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843A810E132
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 17:22:16 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-cfcebc33d04so920427276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689873735; x=1690478535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L4W19Rq7Ca9BnGs3UJklJGGdyG9VNKHd12EY1ouH9jY=;
 b=fW12T36hBmhsTl3F+2AJcD3Kq/F1zNHeq6TigDxt8MEDb4RMlIz/ihvConANiWo1WN
 jcYZELZh+KSww4orrU5JBKEyPLhgz+iycwX6a/ILAdVXujEz3sHhhJwy+vg0ar//PX1H
 aS9LEK7WzM/EvRYKtEmoiex50+Hp5YMX+a7Hd/YIjNgI1KRwMUZIbE52WmTrUiTTPacj
 DJ/CbHMIcKrbWqQ5TA1jqnsr2FHM6i3dBWsP2vjM9Nc9F35H2vG3nhtonJRTI2IA8MAO
 JQLWyb+dbc38fH5ARQQ/PLgf43+xQGWWCuxi7QnHoMFIlqYMFM7Tx+SOIgrPQrQ68p6s
 I74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689873735; x=1690478535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L4W19Rq7Ca9BnGs3UJklJGGdyG9VNKHd12EY1ouH9jY=;
 b=fhECABfhZIexIF13TacxXYK3W9KwNbNC7MpaZ0fongI9egPD9xi+s2PZN5wp9pVJ0D
 iDTz6jvAIIVInWCIaEZa88OX7oLyPXfwzHUXqRDGGEDW10ibSi8q4kZqZ6bM7Phi8FgA
 z96YjX3frt1IvtsifKg57kCyKJijA/90bo1Qwg6RUqz104XsKdKXOwh/sOI2h635oRmN
 0au2wsS1cJGeJTGwhgpQFc5UFS5KIeOdrxJLr1TNsFdhDoCoEraMXad6GCH6ozMnx980
 3UsJnPaKFtRoMltQTzYMixsQxz72CVqP/UKCkfdF/KigJXO8uVClHLZLdFF5SGMsmLDV
 6VZA==
X-Gm-Message-State: ABy/qLZW2WaTxdPKCwo2hqWlxcwEMA1tE/KqOBIIaz0FP1797DJz6ye5
 7zmpoJtDOen+YbZQiKEibGgvLyc6f0auYF15mXCj8g==
X-Google-Smtp-Source: APBJJlF8ReEOr4wxfNmDgZ4tUYVmHo1/SF/9DmeFOOoNhJUfz/WniPudZca8GWvgm/c2I8sJYu7ncnc4RgavkJT5LnM=
X-Received: by 2002:a5b:d0e:0:b0:cea:eac3:362f with SMTP id
 y14-20020a5b0d0e000000b00ceaeac3362fmr5165945ybp.65.1689873735463; Thu, 20
 Jul 2023 10:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <CABdmKX1PUF+X897ZMOr0RNiYdoiL_2NkcSt+Eh55BfW-05LopQ@mail.gmail.com>
 <95de5c1e-f03b-8fb7-b5ef-59ac7ca82f31@linux.intel.com>
In-Reply-To: <95de5c1e-f03b-8fb7-b5ef-59ac7ca82f31@linux.intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 20 Jul 2023 10:22:03 -0700
Message-ID: <CABdmKX0M2z0H74D7Pj1qt5HZgG1LhBKU4YDqgTUaOk8UvXb28A@mail.gmail.com>
Subject: Re: [RFC v5 00/17] DRM cgroup controller with scheduling control and
 memory stats
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 3:55=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> Hi,
>
> On 19/07/2023 21:31, T.J. Mercier wrote:
> > On Wed, Jul 12, 2023 at 4:47=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>    drm.memory.stat
> >>          A nested file containing cumulative memory statistics for the=
 whole
> >>          sub-hierarchy, broken down into separate GPUs and separate me=
mory
> >>          regions supported by the latter.
> >>
> >>          For example::
> >>
> >>            $ cat drm.memory.stat
> >>            card0 region=3Dsystem total=3D12898304 shared=3D0 active=3D=
0 resident=3D12111872 purgeable=3D167936
> >>            card0 region=3Dstolen-system total=3D0 shared=3D0 active=3D=
0 resident=3D0 purgeable=3D0
> >>
> >>          Card designation corresponds to the DRM device names and mult=
iple line
> >>          entries can be present per card.
> >>
> >>          Memory region names should be expected to be driver specific =
with the
> >>          exception of 'system' which is standardised and applicable fo=
r GPUs
> >>          which can operate on system memory buffers.
> >>
> >>          Sub-keys 'resident' and 'purgeable' are optional.
> >>
> >>          Per category region usage is reported in bytes.
> >>
> >>   * Feedback from people interested in drm.active_us and drm.memory.st=
at is
> >>     required to understand the use cases and their usefulness (of the =
fields).
> >>
> >>     Memory stats are something which was easy to add to my series, sin=
ce I was
> >>     already working on the fdinfo memory stats patches, but the questi=
on is how
> >>     useful it is.
> >>
> > Hi Tvrtko,
> >
> > I think this style of driver-defined categories for reporting of
> > memory could potentially allow us to eliminate the GPU memory tracking
> > tracepoint used on Android (gpu_mem_total). This would involve reading
> > drm.memory.stat at the root cgroup (I see it's currently disabled on
>
> I can put it available under root too, don't think there is any
> technical reason to not have it. In fact, now that I look at it again,
> memory.stat is present on root so that would align with my general
> guideline to keep the two as similar as possible.
>
> > the root), which means traversing the whole cgroup tree under the
> > cgroup lock to generate the values on-demand. This would be done
> > rarely, but I still wonder what the cost of that would turn out to be.
>
> Yeah that's ugly. I could eliminate cgroup_lock by being a bit smarter.
> Just didn't think it worth it for the RFC.
>
> Basically to account memory stats for any sub-tree I need the equivalent
> one struct drm_memory_stats per DRM device present in the hierarchy. So
> I could pre-allocate a few and restart if run out of spares, or
> something. They are really small so pre-allocating a good number, based
> on past state or something, should would good enough. Or even total
> number of DRM devices in a system as a pessimistic and safe option for
> most reasonable deployments.
>
> > The drm_memory_stats categories in the output don't seem like a big
> > value-add for this use-case, but no real objection to them being
>
> You mean the fact there are different categories is not a value add for
> your use case because you would only use one?
>
Exactly, I guess that'd be just "private" (or pick another one) for
the driver-defined "regions" where
shared/private/resident/purgeable/active aren't really applicable.
That doesn't seem like a big problem to me since you already need an
understanding of what a driver-defined region means. It's just adding
a requirement to understand what fields are used, and a driver can
document that in the same place as the region itself. That does mean
performing arithmetic on values from different drivers might not make
sense. But this is just my perspective from trying to fit the
gpu_mem_total tracepoint here. I think we could probably change the
way drivers that use it report memory to fit closer into the
drm_memory_stats categories.

> The idea was to align 1:1 with DRM memory stats fdinfo and somewhat
> emulate how memory.stat also offers a breakdown.
>
> > there. I know it's called the DRM cgroup controller, but it'd be nice
> > if there were a way to make the mem tracking part work for any driver
> > that wishes to participate as many of our devices don't use a DRM
> > driver. But making that work doesn't look like it would fit very
>
> Ah that would be a challenge indeed to which I don't have any answers
> right now.
>
> Hm if you have a DRM device somewhere in the chain memory stats would
> still show up. Like if you had a dma-buf producer which is not a DRM
> driver, but then that buffer was imported by a DRM driver, it would show
> up in a cgroup. Or vice-versa. But if there aren't any in the whole
> chain then it would not.
>
Creating a dummy DRM driver underneath an existing driver as an
adaptation layer also came to mind, but yeah... probably not. :)

By the way I still want to try to add tracking for dma-bufs backed by
system memory to memcg, but I'm trying to get memcg v2 up and running
for us first. I don't think that should conflict with the tracking
here.

> > cleanly into this controller, so I'll just shut up now.
>
> Not all all, good feedback!
>
> Regards,
>
> Tvrtko
