Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1783F84419E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 15:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC0910ECD2;
	Wed, 31 Jan 2024 14:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A349810ECD2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 14:16:27 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a350bfcc621so592813666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 06:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706710526; x=1707315326; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nNlIzsJJ/O803DqutNwmb0UTB7M/H8vgIySfsDe/068=;
 b=rl1PhlgsLoReYfbViy0StZDyKdI9LnFcnIEJIEAm9tYrYb00Fchs/PpTYlFSjTQ2KY
 mogE6uMS8i9aYgtB0kWllbMMdj3AB9Aywl4M8TA4ExE+Y55Cs4dKA1c2SYx9oMV2dRd6
 Q9Hf61mLu2DyhWa0reTsZf79y6qNoFu6ev3kNiPmmSlCi6Cqws6juXWIKf/+2pkbPiLN
 DXsKrB8hnDISVevFtwU0AOFu57ua9RYbbbqMKCaKHEbxrFR6gbF+gE5GDLMciPaqB/KK
 bw7htbhG9VjjqDPn0RxqCsjrDi5goYRRZOuCGwJ5KgftZnDUGvL4V7SZw7gNDNkv7h1n
 V+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706710526; x=1707315326;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nNlIzsJJ/O803DqutNwmb0UTB7M/H8vgIySfsDe/068=;
 b=Vqdo21OIUr8iPB7apcQYSlo6RLZRZfjfpxsXubdn0KeU5IFkzktRTomUxa1IgERL4D
 q6Qfxs9/ayLnnyJG3oWeX/WP7CvDKVc5y9rFHi2c5yNNuhfHPak1V4W923SwYQsQkePB
 wYpRURzSIFBIFvdL7WrIq2qz0xeKat+fHirmtEEI9hmxK3qT8vxM9jwGHWZlvOtbcErM
 XvYk+Iu/hv7A6n/o7f6GEM/NI4uHRORQpRObaqO1bwy9ZBMU61VK8dpvmedExHgKcXJG
 q6xSRuajQpqZZioHrCtTgrKU0IcOTzdGNJfH+wbZgTXoSbylr9xTimWwQGyNaxR8nDCg
 Rp5g==
X-Gm-Message-State: AOJu0YzdZcJ8MEjnd1k6bdDjJDktq8YF0dSiB2ypLCH0b/sWncogtRfN
 EtDyq5bHKCec6RBIFE/3F0pOIn6rc5ng4qgtYPKoGlWegKSR6b9FWfQo3x50zJY=
X-Google-Smtp-Source: AGHT+IHGSNrZrx8lhdfpuacSLRFgTdJ5NfMsSvc/CvwYDYgJxFvfWZNSFP+DAnXhOop8GVnRQDrb6A==
X-Received: by 2002:a17:906:6d8:b0:a31:3dc5:6bda with SMTP id
 v24-20020a17090606d800b00a313dc56bdamr1293250ejb.64.1706710526369; 
 Wed, 31 Jan 2024 06:15:26 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU6efCsWycPh1JAhTyNPAjNvnweXqD7LfOvLHeNnwv0SvdHIfC7xlCv5STV+33dO+lY6NYJYz4SAyhuS25W5HmIsKnF6IG7JdUB21pnh0QfOQ1lCcEwg8NWyt4e7a9vNb//fZPrFcLCq+mt6UfXnuYVq5RS8RnavneViDd5N6Su2aFK4whsxxRmJoif7dJWT+chAcUGwWlZxUbGvoOWMB3G8DV6VDnhGda0U96+67dma+Nv9E085BKS4tGcAovVwU7cgXUWywrg032CUiidKOXOU15Ran40Whooteb7Lk+RUuOmzz49sVTJwT/eI1hJVuiV1YSchMZ0NHwXYr6VjCNtQHOfBYpy5AmBEGhHJSSC3kgPn1HwSA52JP2g+oE2lN1hzC8o4Jo1Y8j6DU+PoPuR+FKrKBX0SwGcxLWfvq1CMFwwBVdkDj1fb5FSBa2TvRsV+KQx8ksmqvY3/bRSHobT0Bl+kbLmt0tTUm+R7Y9tHXnEz2tuNvmP5aHV+g6ZlruKt2lwSJfaPzujaeV5DSNv4+yyJnDLfBRUzCefUVy5aId4uCPDgO/JDcDDEegEi6k6RD2wfQFIK8X0HUkbHUt6YigPf5ZcLX+0X9ezZFfZ+0oInafUsOsICdEzpL4wIlsdXL9P1Vi443C3RLBTMEfR/u9yh61fxe3tVeJmfWxowtX9iage1AwJTiXHCvEDedDpY4omThjVx/SYLcBLMPk8Wi5Nen1zWtD6NsJIh8Y+WOxwQATkh/am6qDgLjdayMNiBblkaO9v7fj7mxybs0lRhqpVAYJEDXv++KavYBBKZWqp7kLnRMr0JlWmty201Js0Kj6EkatLZd2kDdGgUvp6ysOgjFO/IvCN7dmQ7wzBsKbPdxyTsC+X8CPg+XM3S5TT4t+qMOLotFHsEN+9geGbqdJYz0xGgVAbWzhxNWl8h6WZhk96k9pCCvsuvjwe6qpVQ5
 6Z0BQFdKikglYoMlYcES1SpehdgBV2xwU=
Received: from pop-os.localdomain (81-231-61-187-no276.tbcn.telia.com.
 [81.231.61.187]) by smtp.gmail.com with ESMTPSA id
 vk8-20020a170907cbc800b00a352afd952fsm5396812ejc.43.2024.01.31.06.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 06:15:25 -0800 (PST)
Date: Wed, 31 Jan 2024 15:15:23 +0100
From: Joakim Bech <joakim.bech@linaro.org>
To: John Stultz <jstultz@google.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap
 ops
Message-ID: <20240131141523.yh74hsddtuooqfgi@pop-os.localdomain>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
 <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
 <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
 <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
 <CANDhNCrGxhHJLA2ct-iqemLAsQRt3C8m5=xAD3_dDdKH6Njrdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCrGxhHJLA2ct-iqemLAsQRt3C8m5=xAD3_dDdKH6Njrdg@mail.gmail.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 05:23:07PM -0800, John Stultz wrote:
> On Fri, Jan 12, 2024 at 4:13 PM Jeffrey Kardatzke <jkardatzke@google.com> wrote:
> > On Fri, Jan 12, 2024 at 3:51 PM John Stultz <jstultz@google.com> wrote:
> > >
> > > On Fri, Jan 12, 2024 at 3:27 PM Jeffrey Kardatzke <jkardatzke@google.com> wrote:
> > > > On Fri, Jan 12, 2024 at 2:52 PM John Stultz <jstultz@google.com> wrote:
> > > > > I know part of this effort here is to start to centralize all these
> > > > > vendor specific restricted buffer implementations, which I think is
> > > > > great, but I just worry that in doing it in the dmabuf heap interface,
> > > > > it is a bit too user-facing. The likelihood of encoding a particular
> > > > > semantic to the singular "restricted_heap" name seems high.
> > > >
> > > > In patch #5 it has the actual driver implementation for the MTK heap
> > > > that includes the heap name of "restricted_mtk_cm", so there shouldn't
> > > > be a heap named "restricted_heap" that's actually getting exposed. The
> > >
> > > Ah, I appreciate that clarification! Indeed, you're right the name is
> > > passed through. Apologies for missing that detail.
> > >
> > > > restricted_heap code is a framework, and not a driver itself.  Unless
> > > > I'm missing something in this patchset...but that's the way it's
> > > > *supposed* to be.
> > >
> > > So I guess I'm not sure I understand the benefit of the extra
> > > indirection. What then does the restricted_heap.c logic itself
> > > provide?
> > > The dmabuf heaps framework already provides a way to add heap implementations.
> >
> > So in the v1 patchset, it was done with just a Mediatek specific heap
> > with no framework or abstractions for another vendor to build on top
> > of. The feedback was to make this more generic since Mediatek won't be
> > the only vendor who wants a restricted heap..which is how it ended up
> > here. There was more code in the framework before relating to TEE
> > calls, but then that was moved to the vendor specific code since not
> > all restricted heaps are allocated through a TEE.
> 
> Yeah. I apologize, as I know how frustrating the contradictory
> feedback can be. I don't mean to demotivate. :(
> 
> I think folks would very much like to see consolidation around the
> various implementations, and I agree!
> I just worry that creating the common framework for this concept in a
> dmabuf heaps driver is maybe too peripheral/close to userland.
> 
> > This was also desirable for the V4L2 pieces since there's going to be
> > a V4L2 flag set when using restricted dma_bufs (and it wants to
> > validate that)....so in order to keep that more generic, there should
> > be a higher level concept of restricted dma_bufs that isn't specific
> > to a single vendor.  One other thing that would ideally come out of
> > this is a cleaner way to check that a dma_buf is restricted or not.
> 
> Yeah. If there is a clear meaning to "restricted" here, I think having
> a query method on the dmabuf is reasonable.
> My only fret is if the meaning is too vague and userland starts
> depending on it meaning what it meant for vendor1, but doesn't mean
> for vendor2.
> 
> So we need some clarity in what "restricted" really means.  For
> instance, it being not cpu mappable vs other potential variations like
> being cpu mappable, but not cpu accessible.  Or not cpu mappable, but
> only mappable between a set of 3 devices (Which 3 devices?! How can we
> tell?).
> 
Can we flip things around? I.e., instead of saying which devices are
allowed to use the restricted buffer, can we instead say where it's not
allowed to be used? My view has been that by default the contents of the
types of buffers where talking about here is only accessible to things
running on the secure side, i.e, typically S-EL3, S-EL1 and a specific
Trusted Application running in S-EL0. I guess that serves as some kind
of baseline. 

From there, things turns to a more dynamic nature, where firewalls etc,
can be configured to give access to various IPs, blocks and runtimes.

I understand that it's nice to be able to know all this from the Linux
kernel point of view, but does it have to be aware of this? What's the
major drawback if Linux doesn't know about it?

> And if there is variation, maybe we need to enumerate the types of
> "restricted" buffers so we can be specific when it's queried.
> 
> That's where maybe having the framework for this be more central or
> closer to the kernel mm code and not just a sub-type of a dmabuf heap
> driver might be better?
> 
> > The current V4L2 patchset just attaches the dma_buf and then checks if
> > the page table is empty....and if so, it's restricted. But now I see
> > there's other feedback indicating attaching a restricted dma_buf
> > shouldn't even be allowed, so we'll need another strategy for
> > detecting them. Ideally there is some function/macro like
> > is_dma_buf_restricted(struct dma_buf*) that can indicate that...but we
> > haven't come up with a good way to do that yet which doesn't involve
> > adding another field to dma_buf or to dma_buf_ops (and if such a thing
> > would be fine, then OK...but I had assumed we would get pushback on
> > modifying either of those structs).
> 
> If there's a need and the best place to put something is in the
> dma_buf or dma_buf_ops, that's where it should go.  Folks may
> reasonably disagree if it's the best place (there may be yet better
> spots for the state to sit in the abstractions), but for stuff going
> upstream, there's no reason to try to hack around things or smuggle
> state just to avoid changing core structures. Especially if core
> structures are internal only and have no ABI implications.
> 
> Sima's suggestion that attachments should fail if the device cannot
> properly map the restricted buffer makes sense to me. Though I don't
> quite see why all attachments should fail, and I don't really like the
> idea of a private api, but I need to look more at the suggested virtio
> example (but even they said that wasn't their preferred route).
> 
> My sense of attach was only that it was supposed to connect a device's
> interest in the buffer, allowing lazy allocation to satisfy various
> device constraints before first mapping - a design feature that I
> don't think anyone ever implemented.  So my sense was it didn't have
> much meaning otherwise (but was a requirement to call before map). But
> that may have evolved since the early days.
> 
> And I'm sure the method to figure out if the attachment can work with
> the device may be complicated/difficult, so it sounding reasonable can
> be far from it being reasonable to implement.
> 
> And again, I don't mean to frustrate or demotivate here. I'm really
> excited to see this effort being pushed upstream!
> 
> thanks
> -john

-- 
// Regards
Joakim
