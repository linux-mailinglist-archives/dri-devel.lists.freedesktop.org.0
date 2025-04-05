Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7428AA7C74D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Apr 2025 03:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E6E10E32F;
	Sat,  5 Apr 2025 01:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hWWlWtw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A2F10E32F
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Apr 2025 01:57:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4393ee912e1so12625e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 18:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743818257; x=1744423057;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAoewxTDbadnGF1GAguojqOu/hTz+6xUWg05jevi4+Q=;
 b=hWWlWtw/Xom8F8eK/3tO0Uwf5qhCuVUjjYUQECu6IkLxwvV2df1jOyduzmM9W0KMtN
 lTuP09VRhKRxU1iZoCfSQtLGg4yHcGwzGRRmMFTsS8pv0F9j+gGrXeFF++SgG3T9PKxy
 bsiqRCb8yowoQVcyy+/HcnBJiG96TzdiH3/MFt5q4uwGicokaleHcElMPf8ft0E9a2xw
 zgnPs6ZA8pchu3Uw2XJWCVaS9/oP9yWChv2ATFBdvpxs96LDjLEooxNBVl8XFrq0R1JT
 lKY5A6AL7EZsx9siUKzAApr6Eruf12eoJ8yl/5Zp5AbZp7QVh+OX2TN56LWNbAyckMc0
 dOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743818257; x=1744423057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAoewxTDbadnGF1GAguojqOu/hTz+6xUWg05jevi4+Q=;
 b=WbrJKQEqtpHePX+lUfq3KUoOsvuMjtoInbFNUTQ3Mqcw9blICDYZCXzIsa9LF5fgfi
 SARJEa33ViV2cXwJSGD4z75fNp6jMAoc91uHJulWJzasDe7fp7Ub/cgLECik+HCVc3g/
 R/S37ByCq918af4Bj1U9Lh017gHbEBpHCDy36xTVOHsixDwUXIUiUNAP0dSi02pqc/WH
 nznOt2okwQge3WADQu/dSfk8tjPYKZ9C5ChCNLU3s4NM/ucT0BzoVOGYt0coUMDYkvQt
 grArSivMYcRE7zkNPOGiCIEfVj/Ws/hDxyh7Iai04sS0IG1gyB49zgd6qQJUs9sU9t81
 1d7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1O3EHj14TFwzUwxHxkdif7buiGicb4an/w18ikMOclGwG9VkXc7bJXv4rkFgKB4/oGiAsiDLM6As=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrKez8RfQ6Pjd3VSLjDffPWPsYkdRBqcZKviO8etIyPtbe9q/Q
 AyH6yIG7fK/leQFYKbDpKRnf4cVezBpM93EHPoF7DQ3xclX6TdvVl5supF2xYudhfoh8JEeFFNg
 1G0UcWUtuiET2MpwlL4HJKZBgoQHjopJ0HRkG
X-Gm-Gg: ASbGncuHZefe4Q5yw9sCfCN4D3VoSGbtPdAeZaboKKfd4pFbDUHpnbU0LcuHbiZkPYQ
 Evc9OSza19B8A/y+E4bZbNUsBJIv0XREIUuT8lZJHitreSRky/ZlVY1+cLHzxX/Mfkz7SrE0ybv
 TSU6PvAPEsdzmPcpVJiNbtu3a0
X-Google-Smtp-Source: AGHT+IEZgBBuLcDuNWx/jFE8YY2SlwYmrCbwtiJPDyDgjgoOsHULjpV/CWiTVdB4+NcESAdkrCw+xWEHlXEt9xlkY4M=
X-Received: by 2002:a05:600c:3548:b0:43d:409c:6142 with SMTP id
 5b1f17b1804b1-43ee0e84029mr527915e9.0.1743818256732; Fri, 04 Apr 2025
 18:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
 <20250310-eccentric-wonderful-puffin-ddbb26@houat>
 <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
 <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com>
 <CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com>
 <5ed87c80-6fe3-4f8c-bb98-ca07f1db8c34@amd.com>
 <20250403-quick-salamander-of-charisma-cab289@houat>
 <202c3a58-97a3-489c-b3f2-b1fd2735bd19@amd.com>
In-Reply-To: <202c3a58-97a3-489c-b3f2-b1fd2735bd19@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 4 Apr 2025 18:57:25 -0700
X-Gm-Features: ATxdqUG3Y0HIBufABo7xowgVhlloVVBpkM4JhVkK9QLhPMspK9dsEIobBZzLpG8
Message-ID: <CABdmKX2LhrcyDM0r1tytt2vKLuCLGsxZaGHgN+u1hUmEMXuGtw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Fri, Apr 4, 2025 at 1:47=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Hi Maxime,
>
> Am 03.04.25 um 17:47 schrieb Maxime Ripard:
> > On Thu, Apr 03, 2025 at 09:39:52AM +0200, Christian K=C3=B6nig wrote:
> >>> For the UMA GPU case where there is no device memory or eviction
> >>> problem, perhaps a configurable option to just say account memory in
> >>> memcg for all allocations done by this process, and state yes you can
> >>> work around it with allocation servers or whatever but the behaviour
> >>> for well behaved things is at least somewhat defined.
> >> We can have that as a workaround, but I think we should approach that
> >> differently.
> >>
> >> With upcoming CXL even coherent device memory is exposed to the core
> >> OS as NUMA memory with just a high latency.
> >>
> >> So both in the CXL and UMA case it actually doesn't make sense to
> >> allocate the memory through the driver interfaces any more. With
> >> AMDGPU for example we are just replicating mbind()/madvise() within
> >> the driver.
> >>
> >> Instead what the DRM subsystem should aim for is to allocate memory
> >> using the normal core OS functionality and then import it into the
> >> driver.
> >>
> >> AMD, NVidia and Intel have HMM working for quite a while now but it
> >> has some limitations, especially on the performance side.
> >>
> >> So for AMDGPU we are currently evaluating udmabuf as alternative. That
> >> seems to be working fine with different NUMA nodes, is perfectly memcg
> >> accounted and gives you a DMA-buf which can be imported everywhere.
> >>
> >> The only show stopper might be the allocation performance, but even if
> >> that's the case I think the ongoing folio work will properly resolve
> >> that.
> > I mean, no, the showstopper to that is that using udmabuf has the
> > assumption that you have an IOMMU for every device doing DMA, which is
> > absolutely not true on !x86 platforms.
> >
> > It might be true for all GPUs, but it certainly isn't for display
> > controllers, and it's not either for codecs, ISPs, and cameras.
> >
> > And then there's the other assumption that all memory is under the
> > memory allocator control, which isn't the case on most recent platforms
> > either.
> >
> > We *need* to take CMA into account there, all the carved-out, device
> > specific memory regions, and the memory regions that aren't even under
> > Linux supervision like protected memory that is typically handled by th=
e
> > firmware and all you get is a dma-buf.
> >
> > Saying that it's how you want to workaround it on AMD is absolutely
> > fine, but DRM as a whole should certainly not aim for that, because it
> > can't.
>
> A bunch of good points you bring up here but it sounds like you misunders=
tood me a bit.
>
> I'm certainly *not* saying that we should push for udmabuf for everything=
, that is clearly use case specific.
>
> For use cases like CMA or protected carve-out the question what to do doe=
sn't even arise in the first place.
>
> When you have CMA which dynamically steals memory from the core OS then o=
f course it should be accounted to memcg.
>
> When you have carve-out which the core OS memory management doesn't even =
know about then it should certainly be handled by dmem.
>
> The problematic use cases are the one where a buffer can sometimes be bac=
ked by system memory and sometime by something special. For this we don't h=
ave a good approach what to do since every approach seems to have a draw ba=
ck for some use case.

This reminds me of memory.memsw in cgroup v1, where both resident and
swapped memory show up under the same memcg counter. In this dmem
scenario it's similar but across two different cgroup controllers
instead of two different types of system memory under the same
controller.

memsw doesn't exist in v2, and users are asking for it back. [1] I
tend to agree that a combined counter is useful as I don't see a great
way to apply meaningful limits to individual counters (or individual
controller limits in the dmem+memcg case) when multiple cgroups are
involved and eviction can cause memory to be transferred from one
place to another. Sorry I'm not really offering a solution to this,
but I feel like only transferring the charge between cgroups is a
partial solution since the enforcement by the kernel is independent
for each controller. So yeah as Dave and Sima said for accounting I
guess it works, and maybe that's good enough if you have userspace
enforcement that's smart enough to look in all the different places.
But then there are the folks asking for kernel enforcement. Maybe just
accounting as best we can is a good place to start?

[1] https://lore.kernel.org/all/20250319064148.774406-5-jingxiangzeng.cas@g=
mail.com/
