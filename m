Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582EC8D8869
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 20:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2B010E331;
	Mon,  3 Jun 2024 18:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hSmY5FpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0205E10E331
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 18:07:05 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-57a16f4b8bfso1530a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 11:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717438024; x=1718042824;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lxEtH6ksqOT/HFLTQs72uRkOcc2agItJ6FV9YxsG9ic=;
 b=hSmY5FpOvXM92Gdps1k1SI/MbFcBC2L6btu64gaMPCTnjgkCicObe/oNg1VWs+UbX9
 MCkG1+nobCk9fuRl078Iqddsw9TOrQI5tEQbDZMEFStqeKAAdiHScx4OQPyiP46/T1cL
 A8fqTQbW66SwvXXLgY1evKc60wNolywCFhdS35Rk99pyxnEJo8JeeoGH0Qols0O+esKR
 jB1+FJJxG3HUPK0iqPG0o6Hoo7+Xx8SIerT6c9sbrOwmSjz3SuMi5wFdti/O1O4habCE
 vK89Jgn4vlY8XW9HSD15hPbhO2/OqzcZMflePmHpMZs74bWZ6gHgmFZIbORSV+PLLes3
 FMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717438024; x=1718042824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxEtH6ksqOT/HFLTQs72uRkOcc2agItJ6FV9YxsG9ic=;
 b=vTmHvKDCTAY7yIFXF1jrRqa5+BmIS5+iI3bmqAtXXQG7aogcxoYy1pFfWetylofQuH
 Gu7nFR995DiwekVWIUv+suzM83/KlKm9APzK2TqYRKJeJb6WAIee+sqP9k7OuujEBHwY
 FNow/mlG2aoJwMBwyLM1QjO7M4CpfLBBnSwWRT7OwzqZuxgAzjWkKkUHkCKOOP14qb9g
 7VA7UwK1Bu22xD7CBwcttIgZC20VeeuKso7ntLKhJUkB22aaONzsJHz63oaqyCZU8lJd
 XGkCdcD1kItzKYHOLwoLFNaxBV7XS44MgmlayS2bq3KiTZYyZKhZFrdHpaaAKazDckVu
 j0Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvxiDaQGD4XvZ6QBTvWamyFrOF18V5dIFcK2AbMfYcz7DeQdlynQyA8C8mocqShs3EBrKpeYDhHnUh8sYNWX631gkVvdHeIpHzCQj9pBtP
X-Gm-Message-State: AOJu0YxCIbkcsyuoaPG7CXxnIhwnowvfJ8qu5Q6BOXUre68X/KFH9x7g
 QsKq/O714ytTEgKClYfkWFiKYzrKwgv9pptZ9ypM92yZEg/si3TWNVTRIr+xfEG+HMG7EzpRwzh
 /+9eIMCYd0vlyA1qNIIF3l+RmgX0i8CIrVuE=
X-Google-Smtp-Source: AGHT+IHh/FTn18V927nX7mLu4AOxZc/5TfIty1nDwy6MfFqeiSDSbjo6v1NtdviT15GPtNUFxHU2jnhiN9DQRoaPf/Q=
X-Received: by 2002:a05:6402:12ca:b0:57a:2276:2a86 with SMTP id
 4fb4d7f45d1cf-57a7dad73dbmr6429a12.4.1717438023960; Mon, 03 Jun 2024 11:07:03
 -0700 (PDT)
MIME-Version: 1.0
References: <20240603114008.16235-1-hailong.liu@oppo.com>
 <CANDhNCq50zPB+TS+_Oo0HY0aUuBAdik2KrC8eJRTygbis293sw@mail.gmail.com>
 <20240603172148.gb7txpg2ya43jyxn@oppo.com>
In-Reply-To: <20240603172148.gb7txpg2ya43jyxn@oppo.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 3 Jun 2024 11:06:51 -0700
Message-ID: <CANDhNCrwgce7G5_-4tNfgTHcdL12zt3JKBg=o3bHrzMmfFMctg@mail.gmail.com>
Subject: Re: [RFC PATCH v1] dma-buf: heaps: move the verification of
 heap_flags to the corresponding heap
To: Hailong Liu <hailong.liu@oppo.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 21cnbao@gmail.com, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Jun 3, 2024 at 10:21=E2=80=AFAM Hailong Liu <hailong.liu@oppo.com> =
wrote:
> On Mon, 03. Jun 09:01, John Stultz wrote:
> > On Mon, Jun 3, 2024 at 4:40=E2=80=AFAM <hailong.liu@oppo.com> wrote:
> > >
> > > From: "Hailong.Liu" <hailong.liu@oppo.com>
> > >
> > > This help module use heap_flags to determine the type of dma-buf,
> > > so that some mechanisms can be used to speed up allocation, such as
> > > memory_pool, to optimize the allocation time of dma-buf.
> >
> > This feels like it's trying to introduce heap specific flags, but
> > doesn't introduce any details about what those flags might be?
> >
> > This seems like it would re-allow the old opaque vendor specific heap
> > flags that we saw in the ION days, which was problematic as different
> > userspaces would use the same interface with potentially colliding
> > heap flags with different meanings. Resulting in no way to properly
> > move to an upstream solution.
> >
> > With the dma-heaps interface, we're trying to make sure it is well
> > defined. One can register a number of heaps with different behaviors,
> > and the heap name is used to differentiate the behavior. Any flags
> > introduced will need to be well defined and behaviorally consistent
> > between heaps. That way when an upstream solution lands, if necessary
> > we can provide backwards compatibility via symlinks.
> >
> > So I don't think this is a good direction to go for dma-heaps.
> >
> > It would be better if you were able to clarify what flag requirements
> > you need, so we can better understand how they might apply to other
> > heaps, and see if it was something we would want to define as a flag
> > (see the discussion here for similar thoughts:
> > https://lore.kernel.org/lkml/CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPW=
TyciVXMXQ@mail.gmail.com/
> > )
> >
> > But if your vendor heap really needs some sort of flags argument that
> > you can't generalize, you can always implement your own dmabuf
> > exporter driver with whatever ioctl interface you'd prefer.
>
> Thanks for your reply. Let=E2=80=99s continue our discussion here instead
> of on android-review. We aim to enhance memory allocation on each
> all heaps. Your pointer towards heap_flags used in /dev/ion for heap
> identification was helpful.
>
> We now aim to improve priority dma-buf allocation. Consider android
> animations scene:
>
> when device is in low memory, Allocating dma-buf as animation
> buffers enter direct_reclaimation, longer allocation time result in a
> laggy UI. But if we know the usage of the dma-buf, we can use some
> mechanisms to boost, e.g. animation-memory-pool.

Can you generalize this a bit further? When would userland know to use
this new flag?
If it is aware, would it make sense to just use a separate heap name instea=
d?

(Also: These other mechanisms you mention should probably also be
submitted upstream, however for upstream there's also the requirement
that we have open users and are not just enabling proprietary blob
userspace, which makes any changes to dma-buf heaps for out of tree
code quite difficult)

> However, dma-buf usage identification becomes a challenge. A potential
> solution could be heap_flags. the use of heap_flags seems ugly and
> contrary to the intended design as you said, How aboult extending
> dma_heap_allocation_data as follows?
>
> struct dma_heap_allocation_data {
>         __u64 len;
>         __u32 fd;
>         __u32 fd_flags;
>         __u64 heap_flags;
>         __u64 buf_flags: // buf usage
> };

This would affect the ABI (forcing a new ioctl number).  And it's
unclear what flags you envision as buffer specific (rather than heap
specific as this patch suggested).

I think we need more details about the specific problem you're seeing
and trying to resolve.

thanks
-john
