Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCBE26C658
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 19:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F95A89D8A;
	Wed, 16 Sep 2020 17:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784D889D8A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:46:43 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A973206E6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600278403;
 bh=T7fAAdGMEwmTUz3pfaivZhFKXEL+DDksEtd73K/d1go=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B5ESeMEUtj1Na7fmLooTO8GkHarnHss8zBYCfN/dmFbqoxSgiuinIyUxGXgDBiHRD
 wVyiSJIvR2essfm0M43MtG9+p1eZkTr/kBrVnLRsjPY6AVwDHkkeciV16Nwyt618Qi
 AQzbMGHh21c31NP/94SPiEy7qaTP3ohI6MHi7vzI=
Received: by mail-oi1-f170.google.com with SMTP id u126so9003038oif.13
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 10:46:43 -0700 (PDT)
X-Gm-Message-State: AOAM531C+DoKVVr8+GNsFsUzfUIbbs+te+g56kTVbl0sTvu53qumiSsc
 yBuSGEcdDqj2Hv5jGJo8C9Dnun7FlyOO/YXMOA==
X-Google-Smtp-Source: ABdhPJzrTvS63xEc/YGj1M1VvkjQrHbt5CCRuhwhSuLfTUE5WrBgivzbCA7OeSqMGDgazvs3cRxd8meuptTx472enRI=
X-Received: by 2002:aca:1711:: with SMTP id j17mr4051983oii.152.1600278402414; 
 Wed, 16 Sep 2020 10:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
 <20200916170409.GA2543@kevin>
In-Reply-To: <20200916170409.GA2543@kevin>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Sep 2020 11:46:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
Message-ID: <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 11:04 AM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> > So I get a performance regression with the dma-coherent approach, even if it's
> > clearly the cleaner.
>
> That's bizarre -- this should really be the faster of the two.

Coherency may not be free. CortexA9 had something like 4x slower
memcpy if SMP was enabled as an example. I don't know if there's
anything going on like that specifically here. If there's never any
CPU accesses mixed in with kmscube, then there would be no benefit to
coherency.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
