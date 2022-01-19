Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE3F4937D4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0824E10EC60;
	Wed, 19 Jan 2022 09:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4430B10EC67
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:58:13 +0000 (UTC)
X-UUID: 087ae5db9dc54b29966646a78aa513c7-20220119
X-UUID: 087ae5db9dc54b29966646a78aa513c7-20220119
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 421905681; Wed, 19 Jan 2022 17:58:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Jan 2022 17:58:09 +0800
Received: from mszswglt01 (10.16.20.20) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 17:58:08 +0800
Message-ID: <f09938519f1fcf51f20a0de5eb4063b0ff1a1e87.camel@mediatek.com>
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
From: Guangming.Cao <guangming.cao@mediatek.com>
To: John Stultz <john.stultz@linaro.org>
Date: Wed, 19 Jan 2022 17:59:07 +0800
In-Reply-To: <CALAqxLUSjHoLpgFLcvqmDfv7Uip2VwHS5d_5x2nzw=P3rA2NDA@mail.gmail.com>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com>
 <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
 <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
 <6b8182a1-7cdc-7369-5c34-e6d0c24efcca@amd.com>
 <82faa62f1bc946cf2f9ee2f7d15c567162238eab.camel@mediatek.com>
 <CALAqxLUSjHoLpgFLcvqmDfv7Uip2VwHS5d_5x2nzw=P3rA2NDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
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
Cc: "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>,
 "lmark@codeaurora.org" <lmark@codeaurora.org>,
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "libo.kang@mediatek.com" <libo.kang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Ruhl, 
 Michael J" <michael.j.ruhl@intel.com>,
 "yf.wang@mediatek.com" <yf.wang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "bo.song@mediatek.com" <bo.song@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>,
 "labbott@redhat.com" <labbott@redhat.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-01-14 at 17:17 -0800, John Stultz wrote:
> On Fri, Jan 14, 2022 at 4:04 AM Guangming.Cao
> <guangming.cao@mediatek.com> wrote:
> > 
> > On Fri, 2022-01-14 at 08:16 +0100, Christian König wrote:
> > > Am 14.01.22 um 00:26 schrieb John Stultz:
> > > > On Thu, Jan 13, 2022 at 5:05 AM Christian König
> > > > <christian.koenig@amd.com> wrote:
> > > > > Am 13.01.22 um 14:00 schrieb Ruhl, Michael J:
> > > > > > > -----Original Message-----
> > > > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org>
> > > > > > > On
> > > > > > > Behalf Of
> > > > > > > Ruhl, Michael J
> > > > > > > > -----Original Message-----
> > > > > > > > From: dri-devel <
> > > > > > > > dri-devel-bounces@lists.freedesktop.org>
> > > > > > > > On Behalf Of
> > > > > > > > guangming.cao@mediatek.com
> > > > > > > > +   /*
> > > > > > > > +    * Invalid size check. The "len" should be less
> > > > > > > > than
> > > > > > > > totalram.
> > > > > > > > +    *
> > > > > > > > +    * Without this check, once the invalid size
> > > > > > > > allocation
> > > > > > > > runs on a process
> > > > > > > > that
> > > > > > > > +    * can't be killed by OOM flow(such as "gralloc" on
> > > > > > > > Android devices), it
> > > > > > > > will
> > > > > > > > +    * cause a kernel exception, and to make matters
> > > > > > > > worse,
> > > > > > > > we can't find
> > > > > > > > who are using
> > > > > > > > +    * so many memory with "dma_buf_debug_show" since
> > > > > > > > the
> > > > > > > > relevant
> > > > > > > > dma-buf hasn't exported.
> > > > > > > > +    */
> > > > > > > > +   if (len >> PAGE_SHIFT > totalram_pages())
> > > > > > > 
> > > > > > > If your "heap" is from cma, is this still a valid check?
> > > > > > 
> > > > > > And thinking a bit further, if I create a heap from
> > > > > > something
> > > > > > else (say device memory),
> > > > > > you will need to be able to figure out the maximum
> > > > > > allowable
> > > > > > check for the specific
> > > > > > heap.
> > > > > > 
> > > > > > Maybe the heap needs a callback for max size?
> > 
> > Yes, I agree with this solution.
> > If dma-heap framework support this via adding a callback to support
> > it,
> > seems it's more clear than adding a limitation in dma-heap
> > framework
> > since each heap maybe has different limitation.
> > If you prefer adding callback, I can update this patch and add
> > totalram
> > limitation to system dma-heap.
> 
> If the max value is per-heap, why not enforce that value in the
> per-heap allocation function?
> 
> Moving the check to the heap alloc to me seems simpler to me than
> adding complexity to the infrastructure to add a heap max_size
> callback. Is there some other use for the callback that you envision?
> 
> thanks
> -john

Thanks for your comment.

If you think max the value is per-heap, why not add an optional
callback for dma-heap to solve this issue(prevent consuming too much
time for a doomed to fail allocation), if the dma-heap doesn't have a
special size check, just use the default value(totalram) in dma-heap 
framework to do the size check.

Yes, for linux dma-heaps, only system-heap needs it, so adding it in
system heap is the simplest. However, there are many vendor dma-heaps
like system-heap which won't be uploaded to linux codebase, and maybe
have same limitation, all these heaps need to add the same limitation.
I just think it's boring. However, If you think discussing these absent
cases based on current linux code is meaningless, I also agree to it.

So, to summarize, if you still think adding it in system_heap.c is
better, I also agree and I will update the patch to add it in
system_heap.c

Thanks~
Guangming

> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

