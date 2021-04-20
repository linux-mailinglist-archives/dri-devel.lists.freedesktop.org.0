Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318EB365417
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA6D89EB7;
	Tue, 20 Apr 2021 08:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE8F89EB7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:28:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618907326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mr0hIV45HZyfj36zbs5xzzipJ3KnBhIuZDQPVZgMTZE=;
 b=dq/bpuXT3bF+hCrpYPqZY1xwAOCOUjyiFqC5wk/ykrf87PD9oZXdJAfr+mfXakUrhNKeMt
 36N6tLpRSUQgs/pHahy7NAI1Ycx70QdxQ5+BettDyKUFcQEONkPD3i0F94AIfqxmBSm7Kl
 iAZWSVV+28ze1kQL3raW38q8lpiC7EQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8BA77ADDC;
 Tue, 20 Apr 2021 08:28:46 +0000 (UTC)
Date: Tue, 20 Apr 2021 10:28:45 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH6QvSuz3hITr2iH@dhcp22.suse.cz>
References: <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
 <YH2a9YfRBlfNnF+u@dhcp22.suse.cz>
 <23aa041b-0e7c-6f82-5655-836899973d66@sony.com>
 <d70efba0-c63d-b55a-c234-eb6d82ae813f@amd.com>
 <YH2ru642wYfqK5ne@dhcp22.suse.cz>
 <07ed1421-89f8-8845-b254-21730207c185@amd.com>
 <YH59E15ztpTTUKqS@dhcp22.suse.cz>
 <b89c84da-65d2-35df-7249-ea8edc0bee9b@amd.com>
 <YH6GyThr2mPrM6h5@dhcp22.suse.cz>
 <2d0e3c44-832b-f297-90da-e2c3280eff32@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d0e3c44-832b-f297-90da-e2c3280eff32@amd.com>
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
Cc: willy@infradead.org, neilb@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Peter.Enderborg@sony.com,
 linaro-mm-sig@lists.linaro.org, shakeelb@google.com, rppt@kernel.org,
 samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com,
 guro@fb.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 20-04-21 10:00:07, Christian K=F6nig wrote:
> Am 20.04.21 um 09:46 schrieb Michal Hocko:
> > On Tue 20-04-21 09:32:14, Christian K=F6nig wrote:
> > > Am 20.04.21 um 09:04 schrieb Michal Hocko:
> > > > On Mon 19-04-21 18:37:13, Christian K=F6nig wrote:
> > > > > Am 19.04.21 um 18:11 schrieb Michal Hocko:
> > [...]
> > > > What I am trying to bring up with NUMA side is that the same proble=
m can
> > > > happen on per-node basis. Let's say that some user consumes unexpec=
tedly
> > > > large amount of dma-buf on a certain node. This can lead to observa=
ble
> > > > performance impact on anybody on allocating from that node and even
> > > > worse cause an OOM for node bound consumers. How do I find out that=
 it
> > > > was dma-buf that has caused the problem?
> > > Yes, that is the direction my thinking goes as well, but also even fu=
rther.
> > > =

> > > See DMA-buf is also used to share device local memory between process=
es as
> > > well. In other words VRAM on graphics hardware.
> > > =

> > > On my test system here I have 32GB of system memory and 16GB of VRAM.=
 I can
> > > use DMA-buf to allocate that 16GB of VRAM quite easily which then sho=
ws up
> > > under /proc/meminfo as used memory.
> > This is something that would be really interesting in the changelog. I
> > mean the expected and extreme memory consumption of this memory. Ideally
> > with some hints on what to do when the number is really high (e.g. mount
> > debugfs and have a look here and there to check whether this is just too
> > many users or an unexpected pattern to be reported).
> > =

> > > But that isn't really system memory at all, it's just allocated device
> > > memory.
> > OK, that was not really clear to me. So this is not really accounted to
> > MemTotal?
> =

> It depends. In a lot of embedded systems you only have system memory and =
in
> this case that value here is indeed really useful.
> =

> > If that is really the case then reporting it into the oom
> > report is completely pointless and I am not even sure /proc/meminfo is
> > the right interface either. It would just add more confusion I am
> > afraid.
> =

> I kind of agree. As I said a DMA-buf could be backed by system memory or
> device memory.
> =

> In the case when it is backed by system memory it does make sense to repo=
rt
> this in an OOM dump.
> =

> But only the exporting driver knows what the DMA-buf handle represents, t=
he
> framework just provides the common ground for inter driver communication.

Then those drivers need to account for meminfo/oom report purposes.

> > > > See where I am heading?
> > > Yeah, totally. Thanks for pointing this out.
> > > =

> > > Suggestions how to handle that?
> > As I've pointed out in previous reply we do have an API to account per
> > node memory but now that you have brought up that this is not something
> > we account as a regular memory then this doesn't really fit into that
> > model. But maybe I am just confused.
> =

> Well does that API also has a counter for memory used by device drivers?

I think that "memory used by device drivers" is immaterial. The only
important thing is to account that memory where it makes sense. So for
RAM based allocations to report them via meminfo and find other way to
report device memory allocations.
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
