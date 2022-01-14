Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABFC48E998
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 13:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1766D10E13A;
	Fri, 14 Jan 2022 12:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA1510E19E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:04:59 +0000 (UTC)
X-UUID: e5208be35f204fa3ab74d54ddbb1e62a-20220114
X-UUID: e5208be35f204fa3ab74d54ddbb1e62a-20220114
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 282408363; Fri, 14 Jan 2022 20:04:54 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Jan 2022 20:04:53 +0800
Received: from mszswglt01 (10.16.20.20) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 20:04:52 +0800
Message-ID: <82faa62f1bc946cf2f9ee2f7d15c567162238eab.camel@mediatek.com>
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
From: Guangming.Cao <guangming.cao@mediatek.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "John
 Stultz" <john.stultz@linaro.org>
Date: Fri, 14 Jan 2022 20:05:48 +0800
In-Reply-To: <6b8182a1-7cdc-7369-5c34-e6d0c24efcca@amd.com>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com>
 <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
 <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
 <6b8182a1-7cdc-7369-5c34-e6d0c24efcca@amd.com>
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
 "yf.wang@mediatek.com" <yf.wang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "bo.song@mediatek.com" <bo.song@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>,
 "labbott@redhat.com" <labbott@redhat.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-01-14 at 08:16 +0100, Christian König wrote:
> Am 14.01.22 um 00:26 schrieb John Stultz:
> > On Thu, Jan 13, 2022 at 5:05 AM Christian König
> > <christian.koenig@amd.com> wrote:
> > > Am 13.01.22 um 14:00 schrieb Ruhl, Michael J:
> > > > > -----Original Message-----
> > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > > Behalf Of
> > > > > Ruhl, Michael J
> > > > > > -----Original Message-----
> > > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org>
> > > > > > On Behalf Of
> > > > > > guangming.cao@mediatek.com
> > > > > > +   /*
> > > > > > +    * Invalid size check. The "len" should be less than
> > > > > > totalram.
> > > > > > +    *
> > > > > > +    * Without this check, once the invalid size allocation
> > > > > > runs on a process
> > > > > > that
> > > > > > +    * can't be killed by OOM flow(such as "gralloc" on
> > > > > > Android devices), it
> > > > > > will
> > > > > > +    * cause a kernel exception, and to make matters worse,
> > > > > > we can't find
> > > > > > who are using
> > > > > > +    * so many memory with "dma_buf_debug_show" since the
> > > > > > relevant
> > > > > > dma-buf hasn't exported.
> > > > > > +    */
> > > > > > +   if (len >> PAGE_SHIFT > totalram_pages())
> > > > > 
> > > > > If your "heap" is from cma, is this still a valid check?
> > > > 
> > > > And thinking a bit further, if I create a heap from something
> > > > else (say device memory),
> > > > you will need to be able to figure out the maximum allowable
> > > > check for the specific
> > > > heap.
> > > > 
> > > > Maybe the heap needs a callback for max size?
Yes, I agree with this solution.
If dma-heap framework support this via adding a callback to support it,
seems it's more clear than adding a limitation in dma-heap framework
since each heap maybe has different limitation.
If you prefer adding callback, I can update this patch and add totalram
limitation to system dma-heap.

Thanks!
Guangming
> > > 
> > > Well we currently maintain a separate allocator and don't use
> > > dma-heap,
> > > but yes we have systems with 16GiB device and only 8GiB system
> > > memory so
> > > that check here is certainly not correct.
> > 
> > Good point.
> > 
> > > In general I would rather let the system run into -ENOMEM or
> > > -EINVAL
> > > from the allocator instead.

For system dma-heap, it doesn't know how memory is avaliable when
allocating memory, so, use totalram_pages() just to prevent cases which
will cause oom definitely.

Just like PAGE align, this check is can be used for all heaps since
there is no dma-heap can alloc memory larger than totalram. Futhermore,
if vendors implement a variety of dma-heap like system heap for special
usages, seems need to add this check to each dma-heap, and I think this
is unnecessary.
If the dma-heap has it's own special limitations for size, and add it
into heap implementation is good.

Thanks!
Guangming
> > 
> > Probably the simpler solution is to push the allocation check to
> > the
> > heap driver, rather than doing it at the top level here.
> > 
> > For CMA or other contiguous heaps, letting the allocator fail is
> > fast
> > enough. For noncontiguous buffers, like the system heap, the
> > allocation can burn a lot of time and consume a lot of memory
> > (causing
> > other trouble) before a large allocation might naturally fail.
> 
> Yeah, letting a alloc_page() loop run for a while is usually not nice
> at 
> all :)
> 
> You can still do a sanity check here, e.g. the size should never
> have 
> the most significant bit set for example.
> 
Yes, this is a good solution. But if this a positive value, larger than
totalram, it can also pass this check, and cause OOM after some time.

From dicussion above, seems finding a proper solution that can judge
the size is valid or not for each dma-heap is more important.

Thanks!
Guangming

> Regards,
> Christian.
> 
> > 
> > thanks
> > -john
> 
> 

