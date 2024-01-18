Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0A831E05
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 17:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E60110E87B;
	Thu, 18 Jan 2024 16:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885B510E87B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 16:58:29 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dc25099b084so1072237276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705597049; x=1706201849;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmZn+BROv+sMREBkau20U4T/TQEgObsLAqinfuULAyg=;
 b=SZlWHouSZVj1kbhnRsgSYGBDDkgpfwg+9VTR0D7NOl6o0Otmg1wkQYN0EsNrkemD7N
 6JJIwikClPQD2j56gpKwchn+U/iJZGmWm/za6tul/wW3EmkQk7S/R3Q9reUUaSpYJ+Fb
 +sp8dBOB+otlOD09oGpnM7kBVPibx2xOTmeG8Py/c2JE2M99ex+feIOxDB5aHRvOzewZ
 y3MPxOMA8mIkxYiF0tqkwLU2/jW4X3Os9Chs8VWq3WkbEF1VPplVaa5DKfjaG/cIRii9
 sWSAts03f8WCLzQcak0HWlDwwGlu9OjTuJ3W8zgi4BIcU3iiPrPLb80DEE5AEkhemZI5
 166Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705597049; x=1706201849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cmZn+BROv+sMREBkau20U4T/TQEgObsLAqinfuULAyg=;
 b=jAitAopUDZIE/ddxIggipkvu25QSDtagPSLtxNh2Cey0UFIcYFRKfSTFK6+QlJgBOU
 MlXkLre++TlaBJgmb8kF2JDevLlnyst1zG6kJgNx1qNEEO1mDRCUVsglw9TguBJQZ+nL
 aKZDtCV7rIAKmOqJTj6MBQUf6JZ3NFlEveL7Zq5UB2bDg+8tzfvKVk2GU3w90mxCKizf
 v/96U+qIgxB7K1nEiApCqUxvjRqglVcqXQoVx9PuT0Uz93d7DArhurGkyymKoA+mRIgZ
 2GuH0cIf4eII/yoZww9BX56CphNqqZjImy1ij2RXdaS73IwxB40cn3Zd71G5OCf2s7qm
 M1ow==
X-Gm-Message-State: AOJu0Yy/FK+rLkJe3is6E0BmaRmwPrUS0D6prOrG4NZDWGuC3qB3G303
 DqYh7IUFn3MaJso0Rsp5orZ0ortnMHlbt/8NlGaoKwv00lsKBzw8mIO1clET/qPe+nx7KqXFh1H
 LS49tMn/8URx6dpjmbZXFFEBC+uCsgm5uqjwN
X-Google-Smtp-Source: AGHT+IGdm+3tzpwneR3Std891dkepC+HcM/F/QU4NLlUSQFVDjEWUf46RxO8DdQGNQYUp4EkO2YYs2e+Vx5E/WIMRrc=
X-Received: by 2002:a25:748c:0:b0:dbd:7743:77cb with SMTP id
 p134-20020a25748c000000b00dbd774377cbmr856586ybc.128.1705597048380; Thu, 18
 Jan 2024 08:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20240117181141.286383-1-tjmercier@google.com>
 <20a68f86-27f0-48f4-a066-7dcf0092858e@amd.com>
 <Zak6iW8lktml7f2H@phenom.ffwll.local>
In-Reply-To: <Zak6iW8lktml7f2H@phenom.ffwll.local>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 18 Jan 2024 08:57:16 -0800
Message-ID: <CABdmKX10zz6bk4VVDgsosJbA8_7WOxuCnkyYFiL1FPwtZ-C+WQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Don't track CMA dma-buf pages under
 RssFile
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Sandeep Patil <sspatil@android.com>, 
 Laura Abbott <labbott@redhat.com>, android-mm@google.com, minchan@google.com, 
 John Stultz <john.stultz@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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
Cc: daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 6:49=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Thu, Jan 18, 2024 at 11:02:22AM +0100, Christian K=C3=B6nig wrote:
> > Am 17.01.24 um 19:11 schrieb T.J. Mercier:
> > > DMA buffers allocated from the CMA dma-buf heap get counted under
> > > RssFile for processes that map them and trigger page faults. In
> > > addition to the incorrect accounting reported to userspace, reclaim
> > > behavior was influenced by the MM_FILEPAGES counter until linux 6.8, =
but
> > > this memory is not reclaimable. [1] Change the CMA dma-buf heap to se=
t
> > > VM_PFNMAP on the VMA so MM does not poke at the memory managed by thi=
s
> > > dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.
> > >
> > > The system dma-buf heap does not suffer from this issue since
> > > remap_pfn_range is used during the mmap of the buffer, which also set=
s
> > > VM_PFNMAP on the VMA.
> >
> > Mhm, not an issue with this patch but Daniel wanted to add a check for
> > VM_PFNMAP to dma_buf_mmap() which would have noted this earlier.
> >
> > I don't fully remember the discussion but for some reason that was neve=
r
> > committed. We should probably try that again.
>
> Iirc the issue is that dma_mmap is not guaranteed to give you a VM_SPECIA=
L
> mapping, at least on absolutely all architectures. That's why I defacto
> dropped that idea, but it would indeed be really great if we could
> resurrect it.

I actually had it in my head that it was a BUG_ON check for VM_PFNMAP
in dma_buf_mmap and it was merged, so I was surprised to discover that
it wasn't set for these CMA buffers.

> Maybe for x86 only? Or x86+armv8, I'm honestly not sure anymore which
> exact cases ended up with a VM_NORMAL mapping ... Would need a pile of
> digging.

Looking back at the patch, the CI email at the end of the thread lists
a bunch of now-broken links to DMESG-WARN test failures I assume
pointed at a large chunk of them.

https://lore.kernel.org/all/166919750173.15575.2864736980735346730@emeril.f=
reedesktop.org/

> >
> > > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/mm/vmscan.c?id=3Dfb46e22a9e3863e08aef8815df9f17d0f4b9aede
> > >
> > > Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
> > > Signed-off-by: T.J. Mercier<tjmercier@google.com>
> >
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks Christian.
