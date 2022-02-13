Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531564B3CEF
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 19:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E3210E175;
	Sun, 13 Feb 2022 18:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FAC10E175
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 18:51:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 911B661259;
 Sun, 13 Feb 2022 18:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B95C004E1;
 Sun, 13 Feb 2022 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644778262;
 bh=ajZGYvyhJa3wD0M5n+Jzb3hdgWrFy+cw5hwyaeUdVcg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Mo5Qq7v0KbYG7JASp6Ui4ZOYm01H43aZtdgy/gGmYOwP76CbNOGbVRD36yY5i8NOt
 QbKyBBg0o9XSsC6foLRZHnM9LSn+99rqQqJg5GiQIT+Ynu+LkwtNTmNJt/emVj3YxK
 6wo7hm0s+6N8m9up9Q/WrUoc8mHS93FTMuRELe5jzpifEalrZ7aHt416jWu0LCsmkD
 A+6FwVo2l3GxbEXD1JmRpzJy1nNymNMx74DnXnDcbaJgZggVN8Wf6y8dK8e9iiysbU
 nfG/YcNdFAxshgCK0BMSpgP54ju2d0Pvog9IcAgeANrsb2KEa1Rc3VdfnqXrhmkj3q
 eAGba/MMB+s/g==
Date: Sun, 13 Feb 2022 18:57:40 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 01/12] iio: buffer-dma: Get rid of outgoing queue
Message-ID: <20220213185740.0322a83d@jic23-huawei>
In-Reply-To: <20220207125933.81634-2-paul@crapouillou.net>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-2-paul@crapouillou.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  7 Feb 2022 12:59:22 +0000
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
> v2: - Only remove the outgoing queue, and keep the incoming queue, as we
>       want the buffer to start streaming data as soon as it is enabled.
>     - Remove IIO_BLOCK_STATE_DEQUEUED, since it is now functionally the
>       same as IIO_BLOCK_STATE_DONE.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Trivial process thing but change log should be here, not above as we don't
want it to end up in the main git log.


>  drivers/iio/buffer/industrialio-buffer-dma.c | 44 ++++++++++----------
>  include/linux/iio/buffer-dma.h               |  7 ++--
>  2 files changed, 26 insertions(+), 25 deletions(-)
> 
