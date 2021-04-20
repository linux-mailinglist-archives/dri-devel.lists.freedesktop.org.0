Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D72F365378
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 09:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE6F89C0A;
	Tue, 20 Apr 2021 07:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DB389A1E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 07:46:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618904785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKKvUHvInZtSl6fOY6WNFgQFeLocZJjqN5OxLOUVXKc=;
 b=WPBB95xBOuxAjCK++fJ0G3px9LAUkWSK+u2Xx9QDmRJZugf/lc4wkT7fjYqTDqj2iqV9pT
 DTRvT2GoUrskRPrEe2yFoWssk3ncDMA/M5jjyXji8T8cfiq+XutGshEBhaz08LgT4x3co5
 kbmYV7vdhrkRBwGeXjVX93SfJ0Y2YnI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09C98B2D9;
 Tue, 20 Apr 2021 07:46:25 +0000 (UTC)
Date: Tue, 20 Apr 2021 09:46:17 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH6GyThr2mPrM6h5@dhcp22.suse.cz>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <YH10s/7MjxBBsjVL@dhcp22.suse.cz>
 <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
 <YH2a9YfRBlfNnF+u@dhcp22.suse.cz>
 <23aa041b-0e7c-6f82-5655-836899973d66@sony.com>
 <d70efba0-c63d-b55a-c234-eb6d82ae813f@amd.com>
 <YH2ru642wYfqK5ne@dhcp22.suse.cz>
 <07ed1421-89f8-8845-b254-21730207c185@amd.com>
 <YH59E15ztpTTUKqS@dhcp22.suse.cz>
 <b89c84da-65d2-35df-7249-ea8edc0bee9b@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b89c84da-65d2-35df-7249-ea8edc0bee9b@amd.com>
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

On Tue 20-04-21 09:32:14, Christian K=F6nig wrote:
> Am 20.04.21 um 09:04 schrieb Michal Hocko:
> > On Mon 19-04-21 18:37:13, Christian K=F6nig wrote:
> > > Am 19.04.21 um 18:11 schrieb Michal Hocko:
[...]
> > What I am trying to bring up with NUMA side is that the same problem can
> > happen on per-node basis. Let's say that some user consumes unexpectedly
> > large amount of dma-buf on a certain node. This can lead to observable
> > performance impact on anybody on allocating from that node and even
> > worse cause an OOM for node bound consumers. How do I find out that it
> > was dma-buf that has caused the problem?
> =

> Yes, that is the direction my thinking goes as well, but also even furthe=
r.
> =

> See DMA-buf is also used to share device local memory between processes as
> well. In other words VRAM on graphics hardware.
> =

> On my test system here I have 32GB of system memory and 16GB of VRAM. I c=
an
> use DMA-buf to allocate that 16GB of VRAM quite easily which then shows up
> under /proc/meminfo as used memory.

This is something that would be really interesting in the changelog. I
mean the expected and extreme memory consumption of this memory. Ideally
with some hints on what to do when the number is really high (e.g. mount
debugfs and have a look here and there to check whether this is just too
many users or an unexpected pattern to be reported).

> But that isn't really system memory at all, it's just allocated device
> memory.

OK, that was not really clear to me. So this is not really accounted to
MemTotal? If that is really the case then reporting it into the oom
report is completely pointless and I am not even sure /proc/meminfo is
the right interface either. It would just add more confusion I am
afraid.
 =

> > See where I am heading?
> =

> Yeah, totally. Thanks for pointing this out.
> =

> Suggestions how to handle that?

As I've pointed out in previous reply we do have an API to account per
node memory but now that you have brought up that this is not something
we account as a regular memory then this doesn't really fit into that
model. But maybe I am just confused.
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
