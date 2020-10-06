Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73799285225
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 21:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C7E6E4F9;
	Tue,  6 Oct 2020 19:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF31E6E4F9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 19:12:35 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id f37so9797978otf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 12:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fCIfoJAZ+jiQxFSl+5D9pcqkBA3Y1Ql0g4Uee0McBIk=;
 b=G1vXKn64D3OOFK2M56oIAdvhZKlWIlTQYNeDpJiOLKOfcj8tv/waNPtHp3ZkUJjFmV
 J3xLwX3fPjlbuMRdsHHv2tnKJsaBFtHU8wTIjkSlB8JceGk4bNd/cfBZ4/pmJBaf+TDy
 dMnAkKO7fHNOE9msbmtNuwmiWYoRCLXVq/dTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fCIfoJAZ+jiQxFSl+5D9pcqkBA3Y1Ql0g4Uee0McBIk=;
 b=Ug3uxyi0k3xbDCvTetNpqnwSASUzoWqkX1nx7a4QZcgK39TvOR0cy8mwMfRcpcxZFG
 LNWBRAJ86SGHSHEuL3B5vxRWe7hZyxSYemR3brYycGjgT1L5Fta1QNyCxxydCsWhhmQI
 qF4cC9Gm1XRymc9WeHr7qOzzndOGSYOENQM2sGY0TwXPAfgyvDb32j63kHU1nvSV4+6M
 wO5E71B22FT/slTbucuWmlD/e+FE4F4qmRJdAplXgfyZNWg9XXfjEEwSxT3B2oKfeQZj
 mDcCRSErcZ0CYrkqsLhPcVD3Ht0iiEDyvGZb48SWtmZDtef3vlWdUgGe+Ok1MlvckBE/
 T6zA==
X-Gm-Message-State: AOAM5318Xc4mRTd4X5HWppclRELZ29epC8bJiCYzfhi5taVw8AiqYtz2
 kyQDdxtlmNrpgTOXgcRW90Ni7gCBtqLxlsdGLDAQ6A==
X-Google-Smtp-Source: ABdhPJw8N9qi+q7TpVwsBtTmI76YyxXY6gMvbjyUpoMtOXLbjvtxsrG7phc9dhTGSc8HPxYZ8ilO5e0VmyvPx6mPMKQ=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr4129940ote.188.1602011555293; 
 Tue, 06 Oct 2020 12:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
 <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201006092214.GX438822@phenom.ffwll.local> <20201006154956.GI5177@ziepe.ca>
 <20201006163420.GB438822@phenom.ffwll.local>
 <CAKMK7uG1RpDQ9ZO=VxkNuGjGPqkAzMQDgi89eSjDoMerMQ4+9A@mail.gmail.com>
 <20201006180244.GJ5177@ziepe.ca>
 <CAKMK7uEN7=QGOJMMf5UwR5Azsk+3-apFjn_hFmoSUTDOh1f85g@mail.gmail.com>
 <20201006183834.GK5177@ziepe.ca>
In-Reply-To: <20201006183834.GK5177@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 6 Oct 2020 21:12:24 +0200
Message-ID: <CAKMK7uG_gFdyMTQetx56NqPommTu3EgVQ2eQUW_K8x=WmxPZyg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 6, 2020 at 8:38 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Oct 06, 2020 at 08:17:05PM +0200, Daniel Vetter wrote:
>
> > So on the gpu we pipeline this all. So step 4 doesn't happen on the
> > cpu, but instead we queue up a bunch of command buffers so that the
> > gpu writes these pagetables (and the flushes tlbs and then does the
> > actual stuff userspace wants it to do).
>
> mlx5 HW does basically this as well.
>
> We just apply scheduling for this work on the device, not in the CPU.
>
> > just queue it all up and let the gpu scheduler sort out the mess. End
> > result is that you get a sgt that points at stuff which very well
> > might have nothing even remotely resembling your buffer in there at
> > the moment. But all the copy operations are queued up, so rsn the data
> > will also be there.
>
> The explanation make sense, thanks
>
> > But rdma doesn't work like that, so it looks all a bit funny.
>
> Well, I guess it could, but how would it make anything better? I can
> overlap building the SGL and the device PTEs with something else doing
> 'move', but is that a workload that needs such agressive optimization?

The compounding issue with gpus is that we need entire lists of
buffers, atomically, for our dma operations. Which means that the
cliff you jump over with a working set that's slightly too big is very
steep, so that you have to pipeline your buffer moves interleaved with
dma operations to keep the hw busy. Having per page fault handling and
hw that can continue in other places while that fault is repaired
should smooth that cliff out enough that you don't need to bother.

I think at worst we might worry about unfairness. With the "entire
list of buffers" workload model gpus might starve out rdma badly by
constantly moving all the buffers around. Installing a dma_fence in
the rdma page fault handler, to keep the dma-buf busy for a small
amount of time to make sure at least the next rdma transfer goes
through without more faults should be able to fix that though. Such a
keepalive fence should be in the shared slots for dma_resv, to not
blocker other access. This wouldn't even need any other changes in
rdma (although delaying the pte zapping when we get a move_notify
would be better), since an active fence alone makes that buffer a much
less likely target for eviction.

> > This is also why the precise semantics of move_notify for gpu<->gpu
> > sharing took forever to discuss and are still a bit wip, because you
> > have the inverse problem: The dma api mapping might still be there
>
> Seems like this all makes a graph of operations, can't start the next
> one until all deps are finished. Actually sounds a lot like futures.
>
> Would be clearer if this attach API provided some indication that the
> SGL is actually a future valid SGL..

Yeah I think one of the things we've discussed is whether dma_buf
should pass around the fences more explicitly, or whether we should
continue to smash on the more implicit dma_resv tracking. Inertia won
out, at least for now because gpu drivers do all the book-keeping
directly in the shared dma_resv structure anyway, so this wouldn't
have helped to get cleaner code.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
