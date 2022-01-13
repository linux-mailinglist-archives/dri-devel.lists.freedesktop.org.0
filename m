Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D448E0D8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 00:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2182E10E7B7;
	Thu, 13 Jan 2022 23:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E009E10E7B7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 23:27:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id p27so13222378lfa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 15:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Br5WfYiTc37TH3IA3cWwwQvBdeV/BPdpfjqxoTbjUg8=;
 b=W5TpqtMMfX5D0g3MqtnYghqkOFySoHX8V7Y3CDIEk/QzE1qbCwAEJgPpiJrTJPckV+
 6N2Vqv9WJ3XylOrXOadOYeXgV1y464f5VNQVaG+8o2Glkx36tVcTGtTSSygXE9SjYxv1
 RnoyaBK5nCwB6EOFL7/mwCLnckkE1s60MGfxHeQCmCJhhJZOBIv+VRduC1HOrb6bkNsL
 FVwFtXFQXUD8Gx/cQQ5XhZOwds/VF/zUQ0OARSiZM0Xy9Ppb3w6T0wwLrYPxiySAyUbE
 20XLOCa+lmlXMZ8C2ul6MEW+k28ADcena2T1vx5h/MaIhRGddm0bLJivZ074kU2ydzvf
 0q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Br5WfYiTc37TH3IA3cWwwQvBdeV/BPdpfjqxoTbjUg8=;
 b=KGH8YcKOnD0645iYEDE2l7Zzyxw8fzYfO3bL6WyJh0Q1TXiWKMFk5tXM1q3RNr+B8j
 RljkI2i0VwlznyXHohAPc8t5oUocaig6dC8Vmr9DIXWeMkQDjGGd8pAS/ycxj22dz/BD
 jR8SiUEwxCDyLj4sVzpfdPbVl/AYykv/elX0iblzb36qNaPowk5Hl53XFDpABHUBStGk
 ThR2qkJgcNPBX+5hNfwEqCNHW56FNuWIg/6LaOFgi0objgkZUnoav+liV7ktOm1ctIgN
 h7F+bnaK8DCcs6AmeJBFdeivuiIDNi92P73sC+DjrHTHwlbXcbCmWpi4M763UrftHbm1
 u+yA==
X-Gm-Message-State: AOAM533V/x2ZUnsBttMOssArPCnEO2NCtxahQmq/mLuOCZjZEu9MwJ8X
 H0NaF7ZBgZQXdj0HpdhCklbLu/Dpo35qMRjZMYoauQ==
X-Google-Smtp-Source: ABdhPJxQ6vukwqgYAso2HtDl4olPJlAPhHEDkugkY9sHGK03iZx+0X4RXJF67ZQjXjdGFfz53L/S+5nppyW0SRY2Ae4=
X-Received: by 2002:a2e:9346:: with SMTP id m6mr4880056ljh.130.1642116419137; 
 Thu, 13 Jan 2022 15:26:59 -0800 (PST)
MIME-Version: 1.0
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com>
 <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
In-Reply-To: <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 13 Jan 2022 15:26:47 -0800
Message-ID: <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "labbott@redhat.com" <labbott@redhat.com>,
 "guangming.cao@mediatek.com" <guangming.cao@mediatek.com>,
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "libo.kang@mediatek.com" <libo.kang@mediatek.com>,
 "yf.wang@mediatek.com" <yf.wang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>,
 "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "bo.song@mediatek.com" <bo.song@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>,
 "lmark@codeaurora.org" <lmark@codeaurora.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 5:05 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 13.01.22 um 14:00 schrieb Ruhl, Michael J:
> >> -----Original Message-----
> >> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> >> Ruhl, Michael J
> >>> -----Original Message-----
> >>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf O=
f
> >>> guangming.cao@mediatek.com
> >>> +   /*
> >>> +    * Invalid size check. The "len" should be less than totalram.
> >>> +    *
> >>> +    * Without this check, once the invalid size allocation runs on a=
 process
> >>> that
> >>> +    * can't be killed by OOM flow(such as "gralloc" on Android devic=
es), it
> >>> will
> >>> +    * cause a kernel exception, and to make matters worse, we can't =
find
> >>> who are using
> >>> +    * so many memory with "dma_buf_debug_show" since the relevant
> >>> dma-buf hasn't exported.
> >>> +    */
> >>> +   if (len >> PAGE_SHIFT > totalram_pages())
> >> If your "heap" is from cma, is this still a valid check?
> > And thinking a bit further, if I create a heap from something else (say=
 device memory),
> > you will need to be able to figure out the maximum allowable check for =
the specific
> > heap.
> >
> > Maybe the heap needs a callback for max size?
>
> Well we currently maintain a separate allocator and don't use dma-heap,
> but yes we have systems with 16GiB device and only 8GiB system memory so
> that check here is certainly not correct.

Good point.

> In general I would rather let the system run into -ENOMEM or -EINVAL
> from the allocator instead.

Probably the simpler solution is to push the allocation check to the
heap driver, rather than doing it at the top level here.

For CMA or other contiguous heaps, letting the allocator fail is fast
enough. For noncontiguous buffers, like the system heap, the
allocation can burn a lot of time and consume a lot of memory (causing
other trouble) before a large allocation might naturally fail.

thanks
-john
