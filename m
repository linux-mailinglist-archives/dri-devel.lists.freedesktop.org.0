Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA172004BD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 11:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7559F6EC4D;
	Fri, 19 Jun 2020 09:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895676EC4C;
 Fri, 19 Jun 2020 09:14:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21546831-1500050 for multiple; Fri, 19 Jun 2020 10:13:39 +0100
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHEwj6jiZkRZ5PaCUNWcuU9oE4KYm4XHZwHnFzEuChZ7w@mail.gmail.com>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-4-daniel.vetter@ffwll.ch>
 <159186243606.1506.4437341616828968890@build.alporthouse.com>
 <CAPM=9ty6r1LuXAH_rf98GH0R9yN3x8xzKPjZG3QyvokpQBR-Hg@mail.gmail.com>
 <CAPj87rM0S2OPssf+WA+pjanT-0Om3yuUM1zUJCv4qTx5VYE=Fw@mail.gmail.com>
 <159255511144.7737.12635440776531222029@build.alporthouse.com>
 <CAKMK7uHEwj6jiZkRZ5PaCUNWcuU9oE4KYm4XHZwHnFzEuChZ7w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/18] dma-fence: basic lockdep annotations
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <159255801588.7737.4425728073225310839@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Fri, 19 Jun 2020 10:13:35 +0100
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, linux-rdma <linux-rdma@vger.kernel.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, Thomas Hellstrom <thomas.hellstrom@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Mika Kuoppala <mika.kuoppala@intel.com>, Christian König <christian.koenig@amd.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-06-19 09:51:59)
> On Fri, Jun 19, 2020 at 10:25 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Forcing a generic primitive to always be part of the same global map is
> > horrible.
> 
> And  no concrete example or reason for why that's not possible.
> Because frankly it's not horrible, this is what upstream is all about:
> Shared concepts, shared contracts, shared code.
> 
> The proposed patches might very well encode the wrong contract, that's
> all up for discussion. But fundamentally questioning that we need one
> is missing what upstream is all about.

Then I have not clearly communicated, as my opinion is not that
validation is worthless, but that the implementation is enshrining a
global property on a low level primitive that prevents it from being
used elsewhere. And I want to replace completion [chains] with fences, and
bio with fences, and closures with fences, and what other equivalencies
there are in the kernel. The fence is as central a locking construct as
struct completion and deserves to be a foundational primitive provided
by kernel/ used throughout all drivers for discrete problem domains.

This is narrowing dma_fence whereby adding
	struct lockdep_map *dma_fence::wait_map
and annotating linkage, allows you to continue to specify that all
dma_fence used for a particular purpose must follow common rules,
without restricting the primitive for uses outside of this scope.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
