Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C261243426
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 08:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800356E293;
	Thu, 13 Aug 2020 06:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61C6E293
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 06:49:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22112507-1500050 for multiple; Thu, 13 Aug 2020 07:49:25 +0100
MIME-Version: 1.0
In-Reply-To: <20200812235544.2289895-1-jcrouse@codeaurora.org>
References: <20200812235544.2289895-1-jcrouse@codeaurora.org>
Subject: Re: [RFC PATCH v1] dma-fence-array: Deal with sub-fences that are
 signaled late
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org
Date: Thu, 13 Aug 2020 07:49:24 +0100
Message-ID: <159730136458.14054.18114194663048046416@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Christian König <christian.koenig@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jordan Crouse (2020-08-13 00:55:44)
> This is an RFC because I'm still trying to grok the correct behavior.
> 
> Consider a dma_fence_array created two two fence and signal_on_any is true.
> A reference to dma_fence_array is taken for each waiting fence.
> 
> When the client calls dma_fence_wait() only one of the fences is signaled.
> The client returns successfully from the wait and puts it's reference to
> the array fence but the array fence still remains because of the remaining
> un-signaled fence.
> 
> Now consider that the unsignaled fence is signaled while the timeline is being
> destroyed much later. The timeline destroy calls dma_fence_signal_locked(). The
> following sequence occurs:
> 
> 1) dma_fence_array_cb_func is called
> 
> 2) array->num_pending is 0 (because it was set to 1 due to signal_on_any) so the
> callback function calls dma_fence_put() instead of triggering the irq work
> 
> 3) The array fence is released which in turn puts the lingering fence which is
> then released
> 
> 4) deadlock with the timeline

It's the same recursive lock as we previously resolved in sw_sync.c by
removing the locking from timeline_fence_release().
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
