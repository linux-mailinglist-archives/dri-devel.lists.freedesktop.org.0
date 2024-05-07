Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA28BE457
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BCC10F1B9;
	Tue,  7 May 2024 13:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QDkD+v9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2347110F1B9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:39:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-346407b8c9aso943356f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715089170; x=1715693970; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M/ueNO6VgphQOXA5uS4/0Wfhc/WsOURk1MmZZT9vU18=;
 b=QDkD+v9ArFWszlAWj9UVcMEQVJTXwvR3y2/wbu7VmF5I+tkppx/oCJvz037cTCG57C
 qJwHGCZI6VYVk5zemPXsrZsGcNL7H9BanFJQDv98B4hJu2seM6FoG0URLdcqYzJfhXuK
 2AtZBrfArpBfmESaDz96AYqqXNXrAMcMuZAOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715089170; x=1715693970;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M/ueNO6VgphQOXA5uS4/0Wfhc/WsOURk1MmZZT9vU18=;
 b=YmKLuY/F4QrJ2tUBJbnrAwxhNoEu/CYLz/P8AE1mHzWe2xp5DFdKhGJZ+Mwydz4BUb
 0WwixcmpjM6R+MSLKGZkNZtGWQ9/ehD9jp1fV8CIk8OskA+QbEK4dgkfMXF91xJD24Pf
 DvGM9BtNGY7iKAxG5hy7bWxlBu57ANjxgZFNvEOPmm1Gc+Iwd2V8QhxKJ12zOr+ezGru
 HsoN49xPDrUdhE8XmQaEPeRznHckGPKgHEqA1Jmn+/dV9jty1Rtiqro9cg8PBGCVT0BO
 gNgzVl6MyrsGh/a3InJIM55bv+EZx8WyUE8loR8V9zQyi48gVr+jyvf2AiZUKGr8ORSm
 7wBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmky4ZfBz5t91BfHZzlXQuTqex6nrihEW6lul67dVDnEmC0DSwShipoW81+ts1pvC0HLlMLPdoI66XWnCu8w7VBrBbW3SmcY18duA+QFJF
X-Gm-Message-State: AOJu0YxFsOC3m/xRNGz2PoD3p5fWWOXrbnBTrGuRH5b4gVtM/1z1Km2K
 i6lLh5HevECP+5UMzCLOM/eGpTxJAnK3J47CmOHD9bHkbZAUX4apaUjy0UfYFn8=
X-Google-Smtp-Source: AGHT+IFFkAJxLxOoCG8nFFCsSuXqv/YiZ7tcMHz5O7ctQR4tHzkmXOo+SmkFGR5DkNaIUKepBhk//Q==
X-Received: by 2002:a05:600c:5118:b0:418:9941:ca28 with SMTP id
 o24-20020a05600c511800b004189941ca28mr9213068wms.2.1715089170283; 
 Tue, 07 May 2024 06:39:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a056000001200b0034c78001f6asm12974839wrx.109.2024.05.07.06.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 06:39:29 -0700 (PDT)
Date: Tue, 7 May 2024 15:39:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 zhiguojiang <justinjiang@vivo.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
Message-ID: <ZjovD5WaWjknd-qv@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 zhiguojiang <justinjiang@vivo.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com>
 <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
 <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
 <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, May 07, 2024 at 12:10:07PM +0200, Christian König wrote:
> Am 06.05.24 um 21:04 schrieb T.J. Mercier:
> > On Mon, May 6, 2024 at 2:30 AM Charan Teja Kalla
> > <quic_charante@quicinc.com> wrote:
> > > Hi TJ,
> > > 
> > > Seems I have got answers from [1], where it is agreed upon epoll() is
> > > the source of issue.
> > > 
> > > Thanks a lot for the discussion.
> > > 
> > > [1] https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google.com/
> > > 
> > > Thanks
> > > Charan
> > Oh man, quite a set of threads on this over the weekend. Thanks for the link.
> 
> Yeah and it also has some interesting side conclusion: We should probably
> tell people to stop using DMA-buf with epoll.
> 
> The background is that the mutex approach epoll uses to make files disappear
> from the interest list on close results in the fact that each file can only
> be part of a single epoll at a time.
> 
> Now since DMA-buf is build around the idea that we share the buffer
> representation as file between processes it means that only one process at a
> time can use epoll with each DMA-buf.
> 
> So for example if a window manager uses epoll everything is fine. If a
> client is using epoll everything is fine as well. But if *both* use epoll at
> the same time it won't work.
> 
> This can lead to rather funny and hard to debug combinations of failures and
> I think we need to document this limitation and explicitly point it out.

Ok, I tested this with a small C program, and you're mixing things up.
Here's what I got

- You cannot add a file twice to the same epoll file/fd. So that part is
  correct, and also my understanding from reading the kernel code.

- You can add the same file to two different epoll file instaces. Which
  means it's totally fine to use epoll on a dma_buf in different processes
  like both in the compositor and in clients.

- Substantially more entertaining, you can nest epoll instances, and e.g.
  add a 2nd epoll file as an event to the first one. That way you can add
  the same file to both epoll fds, and so end up with the same file
  essentially being added twice to the top-level epoll file. So even
  within one application there's no real issue when e.g. different
  userspace drivers all want to use epoll on the same fd, because you can
  just throw in another level of epoll and it's fine again and you won't
  get an EEXISTS on EPOLL_CTL_ADD.

  But I also don't think we have this issue right now anywhere, since it's
  kinda a general epoll issue that happens with any duplicated file.

So I don't think there's any reasons to recommend against using epoll on
dma-buf fd (or sync_file or drm_syncobj or any of the sharing primitives
we have really).

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
