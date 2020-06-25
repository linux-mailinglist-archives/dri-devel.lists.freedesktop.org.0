Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF12120A043
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 15:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D416E297;
	Thu, 25 Jun 2020 13:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086486E297;
 Thu, 25 Jun 2020 13:47:31 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21614223-1500050 for multiple; Thu, 25 Jun 2020 14:47:28 +0100
MIME-Version: 1.0
In-Reply-To: <c6f72d4d-c8a0-c484-7c31-761e9c37b85e@intel.com>
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <20200625123443.19680-2-lionel.g.landwerlin@intel.com>
 <159309113252.4527.2883585204850736358@build.alporthouse.com>
 <c6f72d4d-c8a0-c484-7c31-761e9c37b85e@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/2] dma-buf: fix dma-fence-chain out of order
 test
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159309284429.31486.10956987302705466275@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Thu, 25 Jun 2020 14:47:24 +0100
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
Cc: intel-gfx@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-06-25 14:23:25)
> On 25/06/2020 16:18, Chris Wilson wrote:
> > Quoting Lionel Landwerlin (2020-06-25 13:34:43)
> >> There was probably a misunderstand on how the dma-fence-chain is
> >> supposed to work or what dma_fence_chain_find_seqno() is supposed to
> >> return.
> >>
> >> dma_fence_chain_find_seqno() is here to give us the fence to wait upon
> >> for a particular point in the timeline. The timeline progresses only
> >> when all the points prior to a given number have completed.
> > Hmm, the question was what point is it supposed to wait for.
> >
> > For the simple chain of [1, 3], does 1 being signaled imply that all
> > points up to 3 are signaled, or does 3 not being signaled imply that all
> > points after 1 are not. If that's mentioned already somewhere, my bad.
> > If not, could you put the answer somewhere.
> > -Chris
> 
> In [1, 3], if 1 is signaled, the timeline value is 1. And find_seqno(2) 
> should return NULL.
> 
> 
> In the out_of_order selftest the chain was [1, 2, 3], 2 was signaled and 
> the test was expecting no fence to be returned by find_seqno(2).
> 
> But we still have to wait on 1 to complete before find_seqno(2) can 
> return NULL (as in you don't have to wait on anything).

* scratches head

I thought it was meant to be expecting fc.chain[1] to still be present
as the chain at that point was not yet signaled.

Oh well, a mistake compounded. :|
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
