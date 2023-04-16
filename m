Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3F76E3934
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 16:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BAA10E136;
	Sun, 16 Apr 2023 14:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A3B10E127
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 14:24:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6856E61B79;
 Sun, 16 Apr 2023 14:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5246C433EF;
 Sun, 16 Apr 2023 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681655062;
 bh=DRmjqzj0vppDmwa+O86tDrM1feeK6o2CP6HsH/iSM5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wt/oOFIOb7ClzTlXeE51KP9dzjzQfnpaiY0WTAv4NobCq54yPwX5qV/qjjK/b0RrA
 cpavE5HEA9pj+xEdppDeLnD/JC67azwEuGpvp6wlEFOrandFtCm1FLhthsjnoARCsp
 XbNcXBC/3+tzrgybHGZg2B/Z5GdRPXfgWYT6g5oal0L863CtHpHi3Z6ZUIdoWsrG6H
 fvHFyV6Zl1d/K/RanvVcGEJV8WMozjP5AR1oxJ/JIAkgq8r2+bL3UVAVQGJocbYUZU
 2RxLvisVOdPSoWac6/WZtNAFJhHG2iDLOUYXsZ6B59lSpqZLjEIBxDfmVr42E/nhhT
 3e1p5nnM2kGlA==
Date: Sun, 16 Apr 2023 15:24:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 03/11] iio: buffer-dma: Get rid of outgoing queue
Message-ID: <20230416152422.477ecf67@jic23-huawei>
In-Reply-To: <20230403154800.215924-4-paul@crapouillou.net>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230403154800.215924-4-paul@crapouillou.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Vinod Koul <vkoul@kernel.org>, Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>,
 dmaengine@vger.kernel.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  3 Apr 2023 17:47:52 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> The buffer-dma code was using two queues, incoming and outgoing, to
> manage the state of the blocks in use.
> 
> While this totally works, it adds some complexity to the code,
> especially since the code only manages 2 blocks. It is much easier to
> just check each block's state manually, and keep a counter for the next
> block to dequeue.
> 
> Since the new DMABUF based API wouldn't use the outgoing queue anyway,
> getting rid of it now makes the upcoming changes simpler.
> 
> With this change, the IIO_BLOCK_STATE_DEQUEUED is now useless, and can
> be removed.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> ---
> v2: - Only remove the outgoing queue, and keep the incoming queue, as we
>       want the buffer to start streaming data as soon as it is enabled.
>     - Remove IIO_BLOCK_STATE_DEQUEUED, since it is now functionally the
>       same as IIO_BLOCK_STATE_DONE.

I'm not that familiar with this code, but with my understanding this makes
sense.   I think it is independent of the earlier patches and is a useful
change in it's own right.  As such, does it make sense to pick this up
ahead of the rest of the series? I'm assuming that discussion on the
rest will take a while.  No great rush as too late for the coming merge
window anyway.

Thanks,

Jonathan

