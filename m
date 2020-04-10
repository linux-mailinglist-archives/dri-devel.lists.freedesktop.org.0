Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347321A435C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 10:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3996EC47;
	Fri, 10 Apr 2020 08:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5CC6EC47
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 08:11:14 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id f52so1176128otf.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hgf3DAUC4/KD19F9Gq5AGfjZOzS9LXWN/bbu/vFg+qA=;
 b=dFrk5z2BtMEmisYXExkZBismSlsWb5Q4k/3n94YDOvTZuh2CzIpH/i8KoNWzlv4bXk
 /+Bzn+RqlG2O4N1iciPqbf359lmAxRrY7woQmtsWzKRq9DFPU3AhxhJ6V+T7GDyl1tRC
 5xNRsfm5urzQ2GX3QtuJdU9JR4uI52qA4fFG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hgf3DAUC4/KD19F9Gq5AGfjZOzS9LXWN/bbu/vFg+qA=;
 b=qnk6dmrmSApa/hFuo5wE6FmUrZ7iIszrO91fRsiEg8zQ6S0OAhmRBzN3jzqdGOMad8
 9pAi5aYQelqFgFdA/gOlbKa/uhqT8X2QWV8HeqWuo5JRdX54RvZ4jEAA+//obh0kgM0T
 PuM976ZgblObraCxYUzD8rljE2XLefLirL8qMJm3a545wrw2vqzZ4Ap9NVSTN1yaF9vx
 J2yALNJvICGYR0BDATmqo2UpGqoPPcs6we/k4ChjIRe1c7kLfJkRHtV4GIorQ0vv6o/n
 urC3a2kcJIJPRJhsj8DZHAhdWjJONjyVqzIEodTbfcT1hF6FNKvlJLFgj3j+GJHS07se
 K0Wg==
X-Gm-Message-State: AGi0PuavnCdudxJStf1Pqee60y67Bb9zfVcwgRR4Gt/hSP5ilU7VPMZq
 8tISrYVbPe6AUKtNpVqtRKoPyfSFLLJkU4MGGjB6lQ==
X-Google-Smtp-Source: APiQypJumpZ6N8vscDAXJtrZPRakBWDA3qYtIErOA5tqj0XblmFZSMuMiwpkQHsTVZs7vae7PdjUGGhKyrX4Ng8eQNQ=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr3449972otr.188.1586506273249; 
 Fri, 10 Apr 2020 01:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-20-hch@lst.de>
 <20200408122504.GO3456981@phenom.ffwll.local>
 <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
 <CAKMK7uHtkLvdsWFGiAtkzVa5mpnDvXkn3CHZQ6bgJ_enbyAc8A@mail.gmail.com>
 <0f360b9cb72b80bae0d0db8150f65598c2776268.camel@kernel.crashing.org>
In-Reply-To: <0f360b9cb72b80bae0d0db8150f65598c2776268.camel@kernel.crashing.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 10 Apr 2020 10:11:02 +0200
Message-ID: <CAKMK7uHKyN+c5oTEYVursx4at9br7LSXRb8PMoNEAEBh0hfBLQ@mail.gmail.com>
Subject: Re: [PATCH 19/28] gpu/drm: remove the powerpc hack in
 drm_legacy_sg_alloc
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, X86 ML <x86@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 bpf <bpf@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 10, 2020 at 12:57 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Thu, 2020-04-09 at 11:41 +0200, Daniel Vetter wrote:
> > Now if these boxes didn't ever have agp then I think we can get away
> > with deleting this, since we've already deleted the legacy radeon
> > driver. And that one used vmalloc for everything. The new kms one does
> > use the dma-api if the gpu isn't connected through agp
>
> Definitely no AGP there.

Ah in that case I think we can be sure that this code is dead.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
