Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389BFBFD236
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9C610E812;
	Wed, 22 Oct 2025 16:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FGumm2YL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D507810E815
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:22:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B9BC448A3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68214C4CEF7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761150160;
 bh=YCov4x0BqOSH2/C6y9Fgj+4zowfsuwuCXjatGY7QUkY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FGumm2YLbqk2q5dVH7k9NbkHOlkzGKQ9m+2ARM6o5gptaxrA5N/6nKstvNDdTijmx
 XiZNNNo4BgrifPtpiZ98sumxspcln0bWzs5M/7nrJNf3zYclXeYtHjR64wb16zB7nc
 sEGHmfnI/GE6OqhqwFFCT/2sTUnTSxCh1SuaVzLCrGSqRataQf7UjPYfhu2QCHyU9R
 TK8t1f8W1xyvVJfBb2qFk/EczlY1D6aGQjHx87+qy2bhEKBm2JY6/b/+X93ktW7088
 CqUL5Y0YSg+AJ83T7D/vK6t2WCYRuacGg+Ga1HlI1oSJkhbT6EjC5AKwz//p1y1N6I
 2hkXFnWTinzZA==
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b6d345d7ff7so158155866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:22:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPuUxIsXuS1TaIHXvf9BRCIM1403fPeY7AW23uBaOMRwvz+psuFhF9DoA+RwdCs9ZLR41x0+uITBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzImWZ9R7JPZhClDIy+i0KTQXmlN8mOovfL/oQSiT2GzKGnESew
 7YZMEWsxiuzevcWaW7Z+p+H3Z9G7FoxTnNz9MV8X3nlvN0OghfhL3TOTgKV8icZ+0motOCriPLN
 sjkUhGG2l9wprEC34DzsGaff+fMH54w==
X-Google-Smtp-Source: AGHT+IGphdHfOqtuSMrfZHHKoMtu86beDx79AwnS5WmHT0uStu32DJJ/Ln6QYAVqoGfNCp7zAA/jO70wft27b2yZyjA=
X-Received: by 2002:a17:907:845:b0:b2a:47c9:8ff5 with SMTP id
 a640c23a62f3a-b6d2c71f62amr555812966b.10.1761150158929; Wed, 22 Oct 2025
 09:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251016-ethos-v5-0-ba0aece0a006@kernel.org>
 <20251016-ethos-v5-2-ba0aece0a006@kernel.org>
 <aPHhXl6qdU1mMCNt@lstrano-desk.jf.intel.com>
 <20251017153746.GA1579747-robh@kernel.org>
 <aPM3J2jZcct7ODIp@lstrano-desk.jf.intel.com>
 <aPNE5po45Umson5V@lstrano-desk.jf.intel.com>
 <aPf+ZLJ2KIsz+lZx@lstrano-desk.jf.intel.com>
In-Reply-To: <aPf+ZLJ2KIsz+lZx@lstrano-desk.jf.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Oct 2025 11:22:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+WUk-cs0ZgiQ-nEQTmdn=faCCnoPED2HnhKx0vJ=uCQ@mail.gmail.com>
X-Gm-Features: AS18NWCRsuFSavTaQ2ZXGKmNF4KE6LZuGI0Wke6UF8bHIQFS03d1VhZlH-NVkSw
Message-ID: <CAL_JsqK+WUk-cs0ZgiQ-nEQTmdn=faCCnoPED2HnhKx0vJ=uCQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] accel: Add Arm Ethos-U NPU driver
To: Matthew Brost <matthew.brost@intel.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Frank Li <Frank.li@nxp.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Tue, Oct 21, 2025 at 4:43=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> On Sat, Oct 18, 2025 at 12:42:30AM -0700, Matthew Brost wrote:
> > On Fri, Oct 17, 2025 at 11:43:51PM -0700, Matthew Brost wrote:
> > > On Fri, Oct 17, 2025 at 10:37:46AM -0500, Rob Herring wrote:
> > > > On Thu, Oct 16, 2025 at 11:25:34PM -0700, Matthew Brost wrote:
> > > > > On Thu, Oct 16, 2025 at 04:06:05PM -0500, Rob Herring (Arm) wrote=
:
> > > > > > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > > > > > relatively simple interface with single command stream to descr=
ibe
> > > > > > buffers, operation settings, and network operations. It support=
s up to 8
> > > > > > memory regions (though no h/w bounds on a region). The Ethos NP=
Us
> > > > > > are designed to use an SRAM for scratch memory. Region 2 is res=
erved
> > > > > > for SRAM (like the downstream driver stack and compiler). Users=
pace
> > > > > > doesn't need access to the SRAM.
> > > >
> > > > Thanks for the review.
> > > >
> > > > [...]
> > > >
> > > > > > +static struct dma_fence *ethosu_job_run(struct drm_sched_job *=
sched_job)
> > > > > > +{
> > > > > > +     struct ethosu_job *job =3D to_ethosu_job(sched_job);
> > > > > > +     struct ethosu_device *dev =3D job->dev;
> > > > > > +     struct dma_fence *fence =3D NULL;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     if (unlikely(job->base.s_fence->finished.error))
> > > > > > +             return NULL;
> > > > > > +
> > > > > > +     fence =3D ethosu_fence_create(dev);
> > > > >
> > > > > Another reclaim issue: ethosu_fence_create allocates memory using
> > > > > GFP_KERNEL. Since we're already in the DMA fence signaling path
> > > > > (reclaim), this can lead to a deadlock.
> > > > >
> > > > > Without too much thought, you likely want to move this allocation=
 to
> > > > > ethosu_job_do_push, but before taking dev->sched_lock or calling
> > > > > drm_sched_job_arm.
> > > > >
> > > > > We really should fix the DRM scheduler work queue to be tainted w=
ith
> > > > > reclaim. If I recall correctly, we'd need to update the work queu=
e
> > > > > layer. Let me look into that=E2=80=94I've seen this type of bug s=
everal times,
> > > > > and lockdep should be able to catch it.
> > > >
> > > > Likely the rocket driver suffers from the same issues...
> > > >
> > >
> > > I am not surprised by this statement.
> > >
> > > > >
> > > > > > +     if (IS_ERR(fence))
> > > > > > +             return fence;
> > > > > > +
> > > > > > +     if (job->done_fence)
> > > > > > +             dma_fence_put(job->done_fence);
> > > > > > +     job->done_fence =3D dma_fence_get(fence);
> > > > > > +
> > > > > > +     ret =3D pm_runtime_get_sync(dev->base.dev);
> > > > >
> > > > > I haven't looked at your PM design, but this generally looks quit=
e
> > > > > dangerous with respect to reclaim. For example, if your PM resume=
 paths
> > > > > allocate memory or take locks that allocate memory underneath, yo=
u're
> > > > > likely to run into issues.
> > > > >
> > > > > A better approach would be to attach a PM reference to your job u=
pon
> > > > > creation and release it upon job destruction. That would be safer=
 and
> > > > > save you headaches in the long run.
> > > >
> > > > Our PM is nothing more than clock enable/disable and register init.
> > > >
> > > > If the runtime PM API doesn't work and needs special driver wrapper=
s,
> > > > then I'm inclined to just not use it and manage clocks directly (as
> > > > that's all it is doing).
> > > >
> > >
> > > Yes, then you=E2=80=99re probably fine. More complex drivers can do a=
ll sorts of
> > > things during a PM wake, which is why PM wakes should generally be th=
e
> > > outermost layer. I still suggest, to future-proof your code, that you
> > > move the PM reference to an outer layer.
> > >
> >
> > Also, taking a PM reference in a function call =E2=80=94 as opposed to =
tying it
> > to a object's lifetime =E2=80=94 is risky. It can quickly lead to imbal=
ances in
> > PM references if things go sideways or function calls become unbalanced=
.
> > Depending on how your driver uses the DRM scheduler, this seems like a
> > real possibility.
> >
> > Matt
> >
> > > > >
> > > > > This is what we do in Xe [1] [2].
> > > > >
> > > > > Also, in general, this driver has been reviewed (RB=E2=80=99d), b=
ut it's not
> > > > > great that I spotted numerous issues within just five minutes. I =
suggest
> > > > > taking a step back and thoroughly evaluating everything this driv=
er is
> > > > > doing.
> > > >
> > > > Well, if it is hard to get simple drivers right, then it's a proble=
m
> > > > with the subsystem APIs IMO.
> > > >
> > >
> > > Yes, agreed. We should have assertions and lockdep annotations in pla=
ce
> > > to catch driver-side misuses. This is the second driver I=E2=80=99ve =
randomly
> > > looked at over the past year that has broken DMA fencing and reclaim
> > > rules. I=E2=80=99ll take an action item to fix this in the DRM schedu=
ler, but
> > > I=E2=80=99m afraid I=E2=80=99ll likely break multiple drivers in the =
process as misuess
> > > / lockdep will complain.
>
> I've posted a series [1] for the DRM scheduler which will complain about =
the
> things I've pointed out here.

Thanks. I ran v6 with them and no lockdep splats.

Rob
