Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0B30F617
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 16:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449646ED8F;
	Thu,  4 Feb 2021 15:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B8B6ED8F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 15:23:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id a16so6153573wmm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=FOhHJFN1Uk3imxDHDCmlGLnl9VnriOFj98ccGjxS3EU=;
 b=F1sXbq67W/pxmK1zXgV072u16BTrlrCAVP0it0HAR2Fp+Zt8xtCTCV7y3dnPlv8saB
 C+cdlziGxcEaC41JXpDQHnBBFrlli0RiOpXwtfNzva6k49/rHVQWlo7T6bMUHbsWzn6Y
 S/kZWGhIJchjl7dG5v++X+mpllv4Fcml2LDrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=FOhHJFN1Uk3imxDHDCmlGLnl9VnriOFj98ccGjxS3EU=;
 b=CrocRx2dgifXU7D1wX2uZVSyFB4l2mg/mSbkbYXD9VB46WIOTCIppnMF5iLnMUCZHv
 OWAH07aca/8I4EF1bJioExZSCnSRe2HRiDXOA2HMPc6ER72xMEK8qv/PUMlzHsJ51nq/
 Qx7MhM3pqrJxjtQ/WfE994QKXalG6iLMuk0R/hQoDEWXz4mlCHo0jhgV9eN2RzqwffEl
 BCUB4+jBQWzjRBGMHZOnOnatEJRYMRQYhIhw4NusgR9x6DArmpMByfEm3Vd9whz7+Y3+
 nmi1AxLjxJ6KHM3QROMdHwXU6NePAP8SJ2vNPzEqp/5WBWdY4RTYD6foHBlypQlOxq/g
 T6Yg==
X-Gm-Message-State: AOAM5335GMiAzUEUNmm06MpqbFt8VTy2jBW/wHO1zKv9XasvCoYV4zNe
 Wah4abq/rWHc/X7E+YrlXJ7bFA==
X-Google-Smtp-Source: ABdhPJzWUE8+keCZMjDw4Qd96B14poTeso3FJmwHG+VBS+pVfTYio5MuASNi3L9GB8fNZbR908SB5g==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr6103154wmk.163.1612452183199; 
 Thu, 04 Feb 2021 07:23:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v6sm8776760wrx.32.2021.02.04.07.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:23:02 -0800 (PST)
Date: Thu, 4 Feb 2021 16:22:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
Message-ID: <YBwRU1nrE3mfYbWK@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Suren Baghdasaryan <surenb@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sandeep Patil <sspatil@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 James Jones <jajones@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Minchan Kim <minchan@kernel.org>, Linux MM <linux-mm@kvack.org>,
 John Stultz <john.stultz@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
 <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
 <CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com>
 <CAKMK7uETu_m+=MHyPmqBbEP__qjMF_wmr4c2BiVTPcwE8c+5Mg@mail.gmail.com>
 <CAJuCfpHC6P5cJh-1hv=vjGHCCkM6mA_p19H6tCZmCDxhTuASkQ@mail.gmail.com>
 <ced1c1be-e731-946e-e9ce-919520fe935a@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ced1c1be-e731-946e-e9ce-919520fe935a@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Christoph Hellwig <hch@infradead.org>,
 Android Kernel Team <kernel-team@android.com>,
 Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Minchan Kim <minchan@kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 09:16:32AM +0100, Christian K=F6nig wrote:
> Am 03.02.21 um 22:41 schrieb Suren Baghdasaryan:
> > [SNIP]
> > > > How many semi-unrelated buffer accounting schemes does google come =
up with?
> > > > =

> > > > We're at three with this one.
> > > > =

> > > > And also we _cannot_ required that all dma-bufs are backed by struct
> > > > page, so requiring struct page to make this work is a no-go.
> > > > =

> > > > Second, we do not want to all get_user_pages and friends to work on
> > > > dma-buf, it causes all kinds of pain. Yes on SoC where dma-buf are
> > > > exclusively in system memory you can maybe get away with this, but
> > > > dma-buf is supposed to work in more places than just Android SoCs.
> > > I just realized that vm_inser_page doesn't even work for CMA, it would
> > > upset get_user_pages pretty badly - you're trying to pin a page in
> > > ZONE_MOVEABLE but you can't move it because it's rather special.
> > > VM_SPECIAL is exactly meant to catch this stuff.
> > Thanks for the input, Daniel! Let me think about the cases you pointed =
out.
> > =

> > IMHO, the issue with PSS is the difficulty of calculating this metric
> > without struct page usage. I don't think that problem becomes easier
> > if we use cgroups or any other API. I wanted to enable existing PSS
> > calculation mechanisms for the dmabufs known to be backed by struct
> > pages (since we know how the heap allocated that memory), but sounds
> > like this would lead to problems that I did not consider.
> =

> Yeah, using struct page indeed won't work. We discussed that multiple tim=
es
> now and Daniel even has a patch to mangle the struct page pointers inside
> the sg_table object to prevent abuse in that direction.
> =

> On the other hand I totally agree that we need to do something on this si=
de
> which goes beyong what cgroups provide.
> =

> A few years ago I came up with patches to improve the OOM killer to inclu=
de
> resources bound to the processes through file descriptors. I unfortunately
> can't find them of hand any more and I'm currently to busy to dig them up.
> =

> In general I think we need to make it possible that both the in kernel OOM
> killer as well as userspace processes and handlers have access to that ki=
nd
> of data.
> =

> The fdinfo approach as suggested in the other thread sounds like the easi=
est
> solution to me.

Yeah for OOM handling cgroups alone isn't enough as the interface - we
need to make sure that oom killer takes into account the system memory
usage (ideally zone aware, for CMA pools).

But to track that we still need that infrastructure first I think.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
