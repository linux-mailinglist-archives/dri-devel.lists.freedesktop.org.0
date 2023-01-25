Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D234267BC03
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A7F10E867;
	Wed, 25 Jan 2023 20:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342F810E867
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 20:04:44 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id 129so20468654ybb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 12:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MtZUdD+8O7hxMGTcR1DMvNk+cmrcvsJPjaaxCUIim34=;
 b=fOjBWO27z2DRRtGxPdgxFPgp37eKG2B9PVK/K0KiaXIloz+AuZ38tULN6fcXWxzCXe
 tU2hdkFiNRDubvDFYYKIraSWMsmgZB5TrENA6ESEOPBjPR/dQpPpkMJl5TsP7oaNQBaU
 TxPNiWcr87ZC110sXUh6RSZVcOchas4NTyfHWTxoFZ1DzEOO9gAxP0Yd2EzEp0fULRzI
 KH11tad7CESbeI0SS36cVhoreBuXewlt8xttyfZyHJv8HTgUAkB8genFUrpEvMtBNPp0
 +Cp+2h8ohoZFxIl3/0g98E+3IWq3CPHCxOoXQqQtkHA1Zm+a4/B25A6qnkeflqA4pUuK
 /J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MtZUdD+8O7hxMGTcR1DMvNk+cmrcvsJPjaaxCUIim34=;
 b=ysoPemNKkGkMKymQbYf/gfMtI/tSumiqUjQGl3m+2BUZJ7ONY+DlzhyyqSVXfYReF7
 i1mlyvMoQqzVWJ7GLj3suUjRtfYli1c937QiBr5JbsZnzgx0Cb9ig8mQqb7sXJAQM0mU
 jH7ColVV9sp2Nq6v5oLZrt9KBlMWkkCxU722H9xfZRfkOECYta+/KZDCvw2mquWN/dX7
 qg90ktTbpasCqw/3DHGrKRuy0GmLCFP81gTtieT07eHsmX9VPgJo9gRFB4sCn1wkjYlx
 miQTXxyfYK3gyGfAm39EZ2ToamjBP9xdKBD720Amy77Palien+ER8M4peaA+YYZnMpvZ
 H8hA==
X-Gm-Message-State: AO0yUKXwo2cmr1OwLfF5HZTcfHdtZj8LYJDtV5jG+tJRWaSDqjMqkVm6
 48jsOGq2uyhGlSOrYbvUQu8SJShujdVmgY6NPca16Q==
X-Google-Smtp-Source: AK7set/0yo0srPljd82kRg54UhHAn9kAcoGNmLhg0Ao5vhrkKbvYpqMk0gx/CzAceT8L+J/HB1ohTrPmB4dI55xwr6c=
X-Received: by 2002:a25:341:0:b0:80b:96cc:310d with SMTP id
 62-20020a250341000000b0080b96cc310dmr522771ybd.117.1674677083118; Wed, 25 Jan
 2023 12:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
 <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
 <CABdmKX1c_8LdJJboENnZhwGjrszDWOOVt-Do93-sJW46mZMD6A@mail.gmail.com>
 <Y9EbHW84ydBzpTTO@dhcp22.suse.cz>
In-Reply-To: <Y9EbHW84ydBzpTTO@dhcp22.suse.cz>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Jan 2023 12:04:32 -0800
Message-ID: <CABdmKX0TEf_18UC0_pt1BumB9vDdJW2Ntv5bo0wh_CMOEcAEdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
To: Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 Roman Gushchin <roman.gushchin@linux.dev>, cmllamas@google.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jstultz@google.com,
 Zefan Li <lizefan.x@bytedance.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 android-mm@google.com, Jonathan Corbet <corbet@lwn.net>, jeffv@google.com,
 linux-media@vger.kernel.org, selinux@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 cgroups@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 4:05 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 24-01-23 10:55:21, T.J. Mercier wrote:
> > On Tue, Jan 24, 2023 at 7:00 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
> > > > When a buffer is exported to userspace, use memcg to attribute the
> > > > buffer to the allocating cgroup until all buffer references are
> > > > released.
> > >
> > > Is there any reason why this memory cannot be charged during the
> > > allocation (__GFP_ACCOUNT used)?
> >
> > My main motivation was to keep code changes away from exporters and
> > implement the accounting in one common spot for all of them. This is a
> > bit of a carryover from a previous approach [1] where there was some
> > objection to pushing off this work onto exporters and forcing them to
> > adapt, but __GFP_ACCOUNT does seem like a smaller burden than before
> > at least initially. However in order to support charge transfer
> > between cgroups with __GFP_ACCOUNT we'd need to be able to get at the
> > pages backing dmabuf objects, and the exporters are the ones with that
> > access. Meaning I think we'd have to add some additional dma_buf_ops
> > to achieve that, which was the objection from [1].
> >
> > [1] https://lore.kernel.org/lkml/5cc27a05-8131-ce9b-dea1-5c75e994216d@amd.com/
> >
> > >
> > > Also you do charge and account the memory but underlying pages do not
> > > know about their memcg (this is normally done with commit_charge for
> > > user mapped pages). This would become a problem if the memory is
> > > migrated for example.
> >
> > Hmm, what problem do you see in this situation? If the backing pages
> > are to be migrated that requires the cooperation of the exporter,
> > which currently has no influence on how the cgroup charging is done
> > and that seems fine. (Unless you mean migrating the charge across
> > cgroups? In which case that's the next patch.)
>
> My main concern was that page migration could lose the external tracking
> without some additional steps on the dmabuf front.
>
I see, yes that would be true if an exporter moves data around between
system memory and VRAM for example. (I think TTM does this sort of
thing, but not sure if that's actually within a single dma buffer.)
VRAM feels like it maybe doesn't belong in memcg, yet it would still
be charged there under this series right now. I don't really see a way
around this except to involve the exporters directly in the accounting
(or don't attempt to distinguish between types of memory).

> > > This also means that you have to maintain memcg
> > > reference outside of the memcg proper which is not really nice either.
> > > This mimicks tcp kmem limit implementation which I really have to say I
> > > am not a great fan of and this pattern shouldn't be coppied.
> > >
> > Ah, what can I say. This way looked simple to me. I think otherwise
> > we're back to making all exporters do more stuff for the accounting.
> >
> > > Also you are not really saying anything about the oom behavior. With
> > > this implementation the kernel will try to reclaim the memory and even
> > > trigger the memcg oom killer if the request size is <= 8 pages. Is this
> > > a desirable behavior?
> >
> > It will try to reclaim some memory, but not the dmabuf pages right?
> > Not *yet* anyway. This behavior sounds expected to me.
>
> Yes, we have discussed that shrinkers will follow up later which is
> fine. The question is how much reclaim actually makes sense at this
> stage. Charging interface usually copes with sizes resulting from
> allocation requests (so usually 1<<order based). I can imagine that a
> batch charge like implemented here could easily be 100s of MBs and it is
> much harder to define reclaim targets for. At least that is something
> the memcg charging hasn't really considered yet.  Maybe the existing
> try_charge implementation can cope with that just fine but it would be
> really great to have the expected behavior described.
>
> E.g. should be memcg OOM killer be invoked? Should reclaim really target
> regular memory at all costs or just a lightweight memory reclaim is
> preferred (is the dmabuf charge failure an expensive operation wrt.
> memory refault due to reclaim).

Ah, in my experience very large individual buffers like that are rare.
Cumulative system-wide usage might reach 100s of megs or more spread
across many buffers. On my phone the majority of buffer sizes are 4
pages or less, but there are a few that reach into the tens of megs.
But now I see your point. I still think that where a memcg limit is
exceeded and we can't reclaim enough as a result of a new dmabuf
allocation, we should see a memcg OOM kill. Sounds like you are
looking for that to be written down, so I'll try to find a place for
that.

Part of the motivation for this accounting is to eventually have a
well defined limit for applications to know how much more they can
allocate. So where buffer size or number of buffers is a flexible
variable, I'd like to see an application checking this limit before
making a large request in an effort to avoid reclaim in the first
place. Where there is heavy memory pressure and multiple competing
apps, the status-quo today is a kill for us anyways (typically LMKD).




> --
> Michal Hocko
> SUSE Labs
