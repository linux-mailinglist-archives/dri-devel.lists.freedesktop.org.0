Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3653CDA55A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 20:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C726910E02A;
	Tue, 23 Dec 2025 19:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IxKV102a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB3D10E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 19:20:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4779a4fb9bfso266875e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 11:20:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766517624; cv=none;
 d=google.com; s=arc-20240605;
 b=CyZSRKgBWGZ1UC+sVZXCJJbp2PiqeILWnu5X//w9Us81pBsYCKALah/rbgBI/8DIYg
 fbJFATAX/pjm13M3RosQFUskL0RgpeYLy0Of2XQuAeruaYbDqjoCVLFO9OCA95eZoKOu
 XHW5k6yn/Dtwn36zE0HOS5av4XszY4yVytAmzg2ARPLMaX5QDJoeO+yh7SN6cAX1EJQk
 H/6QNXMokiR46wOrYy2LUu7K17DmXtZUSRDniVLXdktw7BjEgubiGHOl7DxuIo9VbsUV
 8OFxincKPtlwXxfjDUI8Q0pvnHpFRTjtDl2fXcWZg0tzeQ/Z8KkX6vL2zyARh52E3vzn
 GKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=a5+xgM/+DEzFbXxJOlaWSbNM7nqa8vatKp2y4g04VfM=;
 fh=rwd4pJuPU75RMuQPdLtT7pHqMAZCqUBzq3Qix0Fsodw=;
 b=eU5u4OBkpdjeGpaf4actGLza8KBd8bbApgeDrO6OvWIbrKZ0kJHI4SAutQ/2l1oWtu
 p1vbi1t1J2Q2Po6v48PIUNGxvDDhLYafsb/Ehby+vG6BX10X32Y+Ofze4irg3bJyARcU
 X7rCcDrsSk8MBonjRj3SlFEbjL1pIH8dZ1SDmk8981oK7cNAR4FkLE6FcWyntXakJYV7
 8sH7CPNja38fpFchWjhjNIUZzHRTBNgaHGRJxCdAccA+8QnlP9I1S4WO++KlZvOHQ+uk
 dhpXGhUGWsrKZ9QTvD9iawGBuBFwhucWgIR+jMKoMUMTy3RMDGXQ0Llt95y+2JLdp7Lm
 IPUQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766517624; x=1767122424;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5+xgM/+DEzFbXxJOlaWSbNM7nqa8vatKp2y4g04VfM=;
 b=IxKV102aRhaW1XRVI0YWu8iTjAxMwMgLuaTzKNFn2mN1d7iid4p54noHmcpZKCsDOe
 cu9tJFOsml/Cy9wpjErdbPwohsUt4ckip7AmYQhiRAdUCeVeXYqTseyqpKAWzVZklFOA
 hYZT20leUngEKAQw2a2PKuGSHHuK8QYb64l7o6Lftt+Y1d5nZnRlW/FP3TB8XlIgN6o0
 aUlT5xBB+hJEe3ZcrosKWRT+qVfkj46UCo6PxQQ7J0pA5OhVcFsUAt/vGp4ZKUyozkcZ
 XxTwCa9VxBIgm/YZ0oGhKC2HuIA02PAqIrxFHM+XGYDbnrzTUkfs0EMmNNE9dgstXwZA
 D5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766517624; x=1767122424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a5+xgM/+DEzFbXxJOlaWSbNM7nqa8vatKp2y4g04VfM=;
 b=CxAN0AprHxRf0AnUKyOG+F+KQRRlvQh4+M2NNQPU7lxeN8SfwSCDbxOv085MOY/vJn
 Tch4xaT/+5fYldfzaQ2PVYu/VwSOhv1ywqyz514sA3YkkmHFZtBH5hikZHquagyNks6b
 J/yf8+Hn7KhNS50Ax/HGVGz2J/DJSDrlM+lyI/tGCECzcc9LgRxUo2gp6BFGJ4fLzVuU
 lokvRK9uECnoYwe+//wc5yj47Ebq0JDrVXAIuipS/7i5w1vdn7hSLMsrDg3FMWqisN+i
 KFJvtk12D1dZus8tNPTW5pRXojSl4OQkX7VX5CAeLqrOmcu8BdAuwVpo/79PEuND8fbF
 2c+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+fUizmDZ3wVZWRclQgXglxuuVyTJtpmdtHoTCE1++x+zUcNC/jzYtSdVMWzF2+E8ZAXyfZvdS0RA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSl3DBZLLS5Nt0PMDPkyhQEaTbl6F+Yk+PHM3sc09SYoPbWzGg
 OC6rNaG40/Cqm0ZsgnCPD3elRdoASTPuSbpHctr+8BtppZAcmhNQ31nJKdf9/9/ZDeUC/kSARfP
 NBJh+uTd/YsIzdufEugsJ5+9UCqbvwrZS/bAmaFp/
X-Gm-Gg: AY/fxX4bp0vVlB8sWKqw6tQ0mvRW8LUTDkJFDaddwcA1c7ABnmBzIxi1RXtqlFSEr6m
 2CRTQuDkj2GJ/lNz7wwwYnWR6WorHk1cVu79p+fZCVdE/CkE7hV5jQZCz4PjZowwiVQzRjDwTum
 /es/xUVRFq8IQ+LAwjrVh69cLVACcWSjtYOpSO2ZGl6DlNRiQsF3L81Zwx55FOwCJfP5mBmI3f5
 MO+Ks0l58efVAo9zL30n39BdpB2v/NOi3jaOUv54f4k7CMzxlgsSSuo3OotAzi3uuhMuMyaKzV6
 nOCHGAZP8nOtudoHU4Oo37x7u6YtR5avHmRqdA==
X-Google-Smtp-Source: AGHT+IEG4L2KtlFmlxwH8tyJw8U1LD9lfHo+uuj+XTeCuha19uVEvcigX9Mg2ksFjQLFcEDqzYU+ZZ2oCFS9tE7vZu8=
X-Received: by 2002:a05:600c:6013:b0:477:b358:c0cd with SMTP id
 5b1f17b1804b1-47d3c6f23e0mr76385e9.18.1766517623353; Tue, 23 Dec 2025
 11:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <CABdmKX1HgSzUPS1Ot93tpctgunfHt_F_XNROB6zzpu_u0oH2=A@mail.gmail.com>
 <20251219-precise-tody-of-fortitude-5a3839@houat>
In-Reply-To: <20251219-precise-tody-of-fortitude-5a3839@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 24 Dec 2025 04:20:11 +0900
X-Gm-Features: AQt7F2rw01H7QxvGsejUIuV_ynmYDaCiSn7pNjMDztmbKKwMiJ0pZlidXREqHoc
Message-ID: <CABdmKX2_UOENujpW0dXe0Z0x+4V3onfGDmHf1DMOXfDha6ddOA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: Maxime Ripard <mripard@redhat.com>
Cc: Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Christian Koenig <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
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

On Fri, Dec 19, 2025 at 7:19=E2=80=AFPM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> Hi,
>
> On Tue, Dec 16, 2025 at 11:06:59AM +0900, T.J. Mercier wrote:
> > On Mon, Dec 15, 2025 at 7:51=E2=80=AFPM Maxime Ripard <mripard@redhat.c=
om> wrote:
> > > On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> > > > On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@red=
hat.com> wrote:
> > > > >
> > > > > The system dma-buf heap lets userspace allocate buffers from the =
page
> > > > > allocator. However, these allocations are not accounted for in me=
mcg,
> > > > > allowing processes to escape limits that may be configured.
> > > > >
> > > > > Pass the __GFP_ACCOUNT for our allocations to account them into m=
emcg.
> > > >
> > > > We had a discussion just last night in the MM track at LPC about ho=
w
> > > > shared memory accounted in memcg is pretty broken. Without a way to
> > > > identify (and possibly transfer) ownership of a shared buffer, this
> > > > makes the accounting of shared memory, and zombie memcg problems
> > > > worse. :\
> > >
> > > Are there notes or a report from that discussion anywhere?
> >
> > The LPC vids haven't been clipped yet, and actually I can't even find
> > the recorded full live stream from Hall A2 on the first day. So I
> > don't think there's anything to look at, but I bet there's probably
> > nothing there you don't already know.
>
> Ack, thanks for looking at it still :)
>
> > > The way I see it, the dma-buf heaps *trivial* case is non-existent at
> > > the moment and that's definitely broken. Any application can bypass i=
ts
> > > cgroups limits trivially, and that's a pretty big hole in the system.
> >
> > Agree, but if we only charge the first allocator then limits can still
> > easily be bypassed assuming an app can cause an allocation outside of
> > its cgroup tree.
> >
> > I'm not sure using static memcg limits where a significant portion of
> > the memory can be shared is really feasible. Even with just pagecache
> > being charged to memcgs, we're having trouble defining a static memcg
> > limit that is really useful since it has to be high enough to
> > accomodate occasional spikes due to shared memory that might or might
> > not be charged (since it can only be charged to one memcg - it may be
> > spread around or it may all get charged to one memcg). So excessive
> > anonymous use has to get really bad before it gets punished.
> >
> > What I've been hearing lately is that folks are polling memory.stat or
> > PSI or other metrics and using that to take actions (memory.reclaim /
> > killing / adjust memory.high) at runtime rather than relying on
> > memory.high/max behavior with a static limit.
>
> But that's only side effects of a buffer being shared, right? (which,
> for a buffer sharing mechanism is still pretty important, but still)
>
> > > The shared ownership is indeed broken, but it's not more or less brok=
en
> > > than, say, memfd + udmabuf, and I'm sure plenty of others.
> >
> > One thing that's worse about system heap buffers is that unlike memfd
> > the memory isn't reclaimable. So without killing all users there's
> > currently no way to deal with the zombie issue. Harry's proposing
> > reparenting, but I don't think our current interfaces support that
> > because we'd have to mess with the page structs behind system heap
> > dmabufs to change the memcg during reparenting.
> >
> > Ah... but udmabuf pins the memfd pages, so you're right that memfd +
> > udmabuf isn't worse.
> >
> > > So we really improve the common case, but only make the "advanced"
> > > slightly more broken than it already is.
> > >
> > > Would you disagree?
> >
> > I think memcg limits in this case just wouldn't be usable because of
> > what I mentioned above. In our common case the allocator is in a
> > different cgroup tree than the real users of the buffer.
>
> So, my issue with this is that we want to fix not only dma-buf itself,
> but every device buffer allocation mechanism, so also v4l2, drm, etc.
>
> So we'll need a lot of infrastructure and rework outside of dma-buf to
> get there, and figuring out how to solve the shared buffer accounting is
> indeed one of them, but was so far considered kind the thing to do last
> last time we discussed.
>
> What I get from that discussion is that we now consider it a
> prerequisite, and given how that topic has been advancing so far, one
> that would take a couple of years at best to materialize into something
> useful and upstream.
>
> Thus, it blocks all the work around it for years.
>
> Would you be open to merging patches that work on it but only enabled
> through a kernel parameter for example (and possibly taint the kernel?)?
> That would allow to work towards that goal while not being blocked by
> the shared buffer accounting, and not affecting the general case either.
>
> Maxime

Hi Maxime,

A kernel param or a CONFIG sound like a good compromise to allow work
to progress. I'd be happy to add my R-B to that.
