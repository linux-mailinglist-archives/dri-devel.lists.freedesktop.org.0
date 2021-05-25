Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1809390548
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1326EA5A;
	Tue, 25 May 2021 15:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB78F6E154
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 15:23:49 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id c3so30620915oic.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kTDVYERloXMatCyeiZprMdw+ZqqAF8U3vkXxwNviuhE=;
 b=hFRX90RiXmVdz6wOJEn4loBpHqSWMrMbjZynm/DxKGZsKMl+hkatktMc3cP5Dg0KJr
 +5P0ufkS0x1utRnP5TriCW9U7L1/m5IQfZM+WxrdUkGENWSrDCVDoYM5kqnhnHvtMqgA
 9OcrvouZwFc/e0+kT4i55+Ne4FK56XH6+uhfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kTDVYERloXMatCyeiZprMdw+ZqqAF8U3vkXxwNviuhE=;
 b=lCihCsl4Q3o2KPXPDCMAr8uD/pucmHGFPJ4w+VhedP3DWffy1sfpPKPROJaSboKWAf
 hos/OEe96N8D613lSJzxelbKG9ceog8R1iFYdgBD20v0AOnWxMkRZy+AezME3SM/cucc
 5Uz0yz2kptGIqd4uhhYrGbvnp7v/4fHxxM5Cr60mi0PSP/ifPMciQdSwhHFZT4LiSnrq
 HwcNjHYvX3pHb/2KRJQJw2MjnPBpdRNVTi6MabKc3iVwQ4vIevv5IZRP0z4lNTOO1iQL
 y1K/tXn55w4K+SZ8ADAjWds4UmWHkDxhCsKc40bEd1+NuP/OQ+kA22tL8PaDGWphT/z5
 0sxA==
X-Gm-Message-State: AOAM530zZec0OURvt/CJQp77v0X+9GqbqEtuzB6NuGKO+EmRgL5+tlJz
 lwOUjMtMakNbCLz2pW/cCKaAszFmv4KigwLptmExQw==
X-Google-Smtp-Source: ABdhPJxBtqznOER5ji1pe4q7zkzmZLFcts0wZUaXWwdx183bu9IvqBts79PXhAkKTw3Mm2nfiB5S2ymvDCJqaInJxj0=
X-Received: by 2002:a54:4809:: with SMTP id j9mr3145800oij.14.1621956228923;
 Tue, 25 May 2021 08:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
 <YKfFqrlLrikGMn4K@phenom.ffwll.local>
 <CAP+8YyG0o58dQt_tvnJ2ESbeqo02xxvFdifpMwnhz2VYNk8HUw@mail.gmail.com>
 <YKfOymXrB7O4cYVb@phenom.ffwll.local>
 <31467363-e936-879b-8b0d-5a2a92644221@gmail.com>
 <CAKMK7uFswfc96hS40uc0Lug=doYAcf-yC-eu96iWqNJnM65MJQ@mail.gmail.com>
 <ae13093e-c364-7b90-1f91-39de42594cd6@amd.com>
 <YKz2KVppVoYMxB5u@phenom.ffwll.local>
 <312b183f-8eb2-d9e2-24ad-b429b74c886c@gmail.com>
In-Reply-To: <312b183f-8eb2-d9e2-24ad-b429b74c886c@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 25 May 2021 17:23:37 +0200
Message-ID: <CAKMK7uG-JYieYvnc0R-FXJJDrCZfypvstYw2NrLPRt+J9=oe1g@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with implicit fencing
 rules
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 5:05 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi Daniel,
>
> Am 25.05.21 um 15:05 schrieb Daniel Vetter:
> > Hi Christian,
> >
> > On Sat, May 22, 2021 at 10:30:19AM +0200, Christian K=C3=B6nig wrote:
> >> Am 21.05.21 um 20:31 schrieb Daniel Vetter:
> >> This works by adding the fence of the last eviction DMA operation to B=
Os
> >> when their backing store is newly allocated. That's what the
> >> ttm_bo_add_move_fence() function you stumbled over is good for: https:=
//elixir.bootlin.com/linux/v5.13-rc2/source/drivers/gpu/drm/ttm/ttm_bo.c#L6=
92
> >>
> >> Now the problem is it is possible that the application is terminated b=
efore
> >> it can complete it's command submission. But since resource management=
 only
> >> waits for the shared fences when there are some there is a chance that=
 we
> >> free up memory while it is still in use.
> > Hm where is this code? Would help in my audit that I wanted to do this
> > week? If you look at most other places like
> > drm_gem_fence_array_add_implicit() I mentioned earlier, then we don't
> > treat the shared fences special and always also include the exclusive o=
ne.
>
> See amdgpu_gem_object_close():
>
> ...
>          fence =3D dma_resv_get_excl(bo->tbo.base.resv);
>          if (fence) {
>                  amdgpu_bo_fence(bo, fence, true);
>                  fence =3D NULL;
>          }
> ...
>
> We explicitly added that because resource management of some other
> driver was going totally bananas without that.
>
> But I'm not sure which one that was. Maybe dig a bit in the git and
> mailing history of that.

Hm I looked and it's

commit 82c416b13cb7d22b96ec0888b296a48dff8a09eb
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Thu Mar 12 12:03:34 2020 +0100

   drm/amdgpu: fix and cleanup amdgpu_gem_object_close v4

That sounded more like amdgpu itself needing this, not another driver?

But looking at amdgpu_vm_bo_update_mapping() it seems to pick the
right fencing mode for gpu pte clearing, so I'm really not sure what
the bug was that you worked around here?The implementation boils down
to amdgpu_sync_resv() which syncs for the exclusive fence, always. And
there's nothing else that I could find in public history at least, no
references to bug reports or anything. I think you need to dig
internally, because as-is I'm not seeing the problem here.

Or am I missing something here?
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
