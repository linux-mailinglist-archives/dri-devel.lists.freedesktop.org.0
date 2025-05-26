Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA8AC4449
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 22:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25EA10E3A2;
	Mon, 26 May 2025 20:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iZtQoxyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B995C10E3EB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 20:13:13 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ad88105874aso101236266b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748290392; x=1748895192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5QVxUxZwHwg4uTuTfEDeJdtWwn5qD8fnwcw3GYkwYxQ=;
 b=iZtQoxyItioiAR13gUdO14+3hkhpNkpujZJwm3+xvZ+fNMMCnWCKHWcMpkC7FSADnZ
 GHIKNj975cUGDKEH6yTsKv+M6MywRh1RhXq4Q3gJKnn5s1H5kFQpw048tk46rBdR+bZO
 sR2Bxgd3PfnJ87UsVT+9qsRFo9NcWa0x2OyOO51ntJsr1ZBiWlZsjcSjPESHLmc09led
 SjnNBr9j6T3ITq3p18bjPwxS1jiEaqOqsTBkp65UuR0TDJq7c/HIONBc5j8HNOxbbfSw
 jpfgukW6FuxGxKR1QyDL2aHBWKH7nv8Nhii9w+QYoSUYXUGXQpuP7xrP63LcClJm99LE
 dVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748290392; x=1748895192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5QVxUxZwHwg4uTuTfEDeJdtWwn5qD8fnwcw3GYkwYxQ=;
 b=gPCq/gkDJ9+IAggETA007oeSR3BTpAiJdkAdcGYlPbo5YzikM/b9ByjXvofT7iENnc
 T+WU9S+bUjYEdRdtIr4lvIfLQoIY9DPqm/3JpjkjPkQlbojELHw4Igy5ey9MBfUK3BAU
 rsZGI3/7OJgdPUiwm5bmzu5GWByABGgHXClS2oBHFzthIbnZrWJQpZorxuejm3bGAb5r
 6aTXuFZjSjJM0qhFXJh3v9UP54JbDYNRBEQ4q2ut8k0ix0WIR7EdJ4LfokZJGHNIAyaH
 sf2kDW7mBBbPGOF8TDPVd3fLUr8RdCLkHrqOqxJI2axaK4Dh5/cuM+y/A1pUVGWuDLkL
 vPnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVASDu99BCkXX61srE253srQt/mCG1iNzUv0kShgiNlbxV6Z1/S11tmgP7HFdwfroDwi3Z5iMH8Hew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLlhW5I6fDzMcfsOmAk9Y5+FUKeElL0Lyw58d8K1HZtx5TcyWD
 40t7aRJ7oNmnpo8Gz17qJvpoPW4o112tbmwV1ifYwOr0i+gXAZH8Z5HnC65HCxUznY9GX6BYFCE
 HGB6U7Hg9p/Oa34jqQmORcdW3rQAbcDU=
X-Gm-Gg: ASbGncvnDlN/E2G0yCdQySkpEF+opnmEOzVkxH/JBxnWubxwHD8M9rR/uH6T5p1Tm9S
 +fkMrDNgutdKgdmXARq1LOeoW5kYlkFrgH5JvRb7zhrg0BytUv1fL34eDekRf04ZqlYl/rlIQDP
 aHE8f57ESlXo65ZD+PWR3fTbovWvdGft0=
X-Google-Smtp-Source: AGHT+IEsLYMgdQaUEnxvSZpAzIznC3EYpmZakrcUwGrnSFgON5g1rgCn/LiPfFkI7A+TmLHbAEO0IfoL89+CqOhsa+s=
X-Received: by 2002:a17:907:1b2a:b0:ad6:53a8:32ad with SMTP id
 a640c23a62f3a-ad85b338a28mr943470966b.57.1748290391718; Mon, 26 May 2025
 13:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
 <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
 <aC-ALtcs8RF1yZ1y@slm.duckdns.org>
 <de476962-194f-4c77-aabb-559a74caf5ac@amd.com>
 <aDCrLTNoWC8oSS7Z@slm.duckdns.org>
 <d21be860-9cb2-4c21-af30-2c724ab58756@amd.com>
In-Reply-To: <d21be860-9cb2-4c21-af30-2c724ab58756@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 27 May 2025 06:13:00 +1000
X-Gm-Features: AX0GCFvvHdd7Hcm15H2tyzhV0DazUrjPKTrGJfpLMdSyHMJpn-ef4wjs0ccd16c
Message-ID: <CAPM=9txhOq9NvTJ9sYpntQ5ajSXrCPAKwkPqBssycwAxqn05dg@mail.gmail.com>
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel@lists.freedesktop.org, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
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

On Mon, 26 May 2025 at 18:19, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Hi Tejun,
>
> On 5/23/25 19:06, Tejun Heo wrote:
> > Hello, Christian.
> >
> > On Fri, May 23, 2025 at 09:58:58AM +0200, Christian K=C3=B6nig wrote:
> > ...
> >>> - There's a GPU workload which uses a sizable amount of system memory=
 for
> >>>   the pool being discussed in this thread. This GPU workload is very
> >>>   important, so we want to make sure that other activities in the sys=
tem
> >>>   don't bother it. We give it plenty of isolated CPUs and protect its=
 memory
> >>>   with high enough memory.low.
> >>
> >> That situation simply doesn't happen. See isolation is *not* a require=
ment
> >> for the pool.
> > ...
> >> See the submission model of GPUs is best effort. E.g. you don't guaran=
tee
> >> any performance isolation between processes whatsoever. If we would st=
art
> >> to do this we would need to start re-designing the HW.
> >
> > This is a radical claim. Let's table the rest of the discussion for now=
. I
> > don't know enough to tell whether this claim is true or not, but for th=
is to
> > be true, the following should be true:
> >
> >  Whether the GPU memory pool is reclaimed or not doesn't have noticeabl=
e
> >  performance implications on the GPU performance.
> >
> > Is this true?
>
> Yes, that is true. Today the GPUs need the memory for correctness, not fo=
r performance anymore.
>
> The performance improvements we have seen with this approach 15 or 20 yea=
rs ago are negligible by todays standards.
>
> It's just that Windows still offers the functionality today and when you =
bringup hardware on Linux you sometimes run into problems and find that the=
 engineers who designed the hardware/firmware relied on having this.
>
> > As for the scenario that I described above, I didn't just come up with =
it.
> > I'm only supporting from system side but that's based on what our ML fo=
lks
> > are doing right now. We have a bunch of lage machines with multiple GPU=
s
> > running ML workloads. The workloads can run for a long time spread acro=
ss
> > many machines and they synchronize frequently, so any performance drop =
on
> > one GPU lowers utiliization on all involved GPUs which can go up to thr=
ee
> > digits. For example, any scheduling disturbances on the submitting thre=
ad
> > propagates through the whole cluster and slows down all involved GPUs.
>
> For the HPC/ML use case this feature is completely irrelevant. ROCm, Cuda=
, OpenCL, OpenMP etc... don't even expose something like this in their high=
er level APIs as far as I know.

What do we consider higher level here btw? HIP and CUDA both expose
something like hipHostMallocWriteCombined, there is also
hipHostMallocCoherent which may or may not have an effect.

>
> Where this here matters is things like scanout on certain laptops, digita=
l rights management in cloud gaming, hacks for getting high end GPUs to wor=
k on ARM boards (e.g. rasberry pie etc...).
>
> > Also, because these machines are large on the CPU and memory sides too =
and
> > aren't doing whole lot other than managing the GPUs, people want to put=
 on a
> > significant amount of CPU work on them which can easily create at least
> > moderate memory pressure. Is the claim that the combined write memory p=
ool
> > doesn't have any meaningful impact on the GPU workload performance?
>
> When the memory pool is active on such systems I would strongly advise to=
 question why it is used in the first place.
>
> The main reason why we still need it for business today is cloud gaming. =
And for this particular use case you absolutely do want to share the pool b=
etween cgroups or otherwise the whole use case breaks.

I'm still not convinced on this being totally true, which means either
I'm misunderstanding how cloud gaming works or you are underestimating
how cgroups work,

My model for cloud gaming is, you have some sort of orchestrator
service running that spawns a bunch of games in their own cgroups and
those games would want to operate as independently as possible.

Now if the toplevel cgroup or if none the root cgroup exists and the
game cgroups are all underneath it, then I think this would operate
more optimally for each game, since

a) if a game uses uncached memory continuously it will have it's own
pool of uncached memory that doesn't get used by anyone else, thus
making that game more consistent.
b) if and when the game exits, the pool will be returned to the parent
cgroup to use, this memory should then be reused by other games the
are started subsequently.

The only thing I'm not sure is how the parent pool gets used once it's
built up for new children, need to spend more time reading list_lru
code.

The list_lru change might actually be useful for us without cgroups as
it might be able to hide some of our per-numa stuff.

Dave.
