Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80B6246CAC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 18:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129FF89E08;
	Mon, 17 Aug 2020 16:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E760989E08
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 16:24:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597681495; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=gfehkDHwbkMn5YmVHISLwPUHyk48V6qSvEEU/hXpyxo=;
 b=n5O0D14otMGTXs6CjU0f6eN3DF3FnGC62+kuTiy17m9w31p69PuSYWVbpBLc4OZ4/KdgpsZS
 IVSo2YvtenV4wtr2Zo43qWsvQa9r2wDCt1QjNFB1aEm9SKuGgiBzToPcD1Wv9Rl6bVb37dCM
 xFt5PG+GCuCJDpAs533EIikzBAo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f3aaf57f2b697637a874571 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 16:24:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F21E9C433CB; Mon, 17 Aug 2020 16:24:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 07EEEC433C6;
 Mon, 17 Aug 2020 16:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07EEEC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 17 Aug 2020 10:24:49 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [RFC PATCH v1] dma-fence-array: Deal with sub-fences that are
 signaled late
Message-ID: <20200817162449.GC3221@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Chris Wilson <chris@chris-wilson.co.uk>,
 linux-arm-msm@vger.kernel.org,
 Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
References: <20200812235544.2289895-1-jcrouse@codeaurora.org>
 <159730136458.14054.18114194663048046416@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159730136458.14054.18114194663048046416@build.alporthouse.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 07:49:24AM +0100, Chris Wilson wrote:
> Quoting Jordan Crouse (2020-08-13 00:55:44)
> > This is an RFC because I'm still trying to grok the correct behavior.
> > 
> > Consider a dma_fence_array created two two fence and signal_on_any is true.
> > A reference to dma_fence_array is taken for each waiting fence.
> > 
> > When the client calls dma_fence_wait() only one of the fences is signaled.
> > The client returns successfully from the wait and puts it's reference to
> > the array fence but the array fence still remains because of the remaining
> > un-signaled fence.
> > 
> > Now consider that the unsignaled fence is signaled while the timeline is being
> > destroyed much later. The timeline destroy calls dma_fence_signal_locked(). The
> > following sequence occurs:
> > 
> > 1) dma_fence_array_cb_func is called
> > 
> > 2) array->num_pending is 0 (because it was set to 1 due to signal_on_any) so the
> > callback function calls dma_fence_put() instead of triggering the irq work
> > 
> > 3) The array fence is released which in turn puts the lingering fence which is
> > then released
> > 
> > 4) deadlock with the timeline
> 
> It's the same recursive lock as we previously resolved in sw_sync.c by
> removing the locking from timeline_fence_release().

Ah, yep. I'm working on a not-quite-ready-for-primetime version of a vulkan
timeline implementation for drm/msm and I was doing something similar to how
sw_sync used to work in the release function. Getting rid of the recursive lock
in the timeline seems a better solution than this. Thanks for taking the time
to respond.

Jordan

> -Chris

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
