Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E7D81B4E5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 12:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C8E10E0B8;
	Thu, 21 Dec 2023 11:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEA710E0B8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 11:28:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4799C618E2;
 Thu, 21 Dec 2023 11:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D01C433C8;
 Thu, 21 Dec 2023 11:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703158138;
 bh=bn5TsZbZFAMzqugkbLLCAXDLCBCCddsOuTyKJNmW4j0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XzDgUtMIiyHvWufYrnuorriuX6ec0aKd75XvN4bvVRUU8h7RRq//v3hQxVZeIn26t
 DUfgKuHgBaG/HJamZr9h39OxZ2rPlqxn7ZQqwV8EbzYwFCvU6c/vR6aRYx1pngrWtm
 beBI35fawoXFmrakG6xJcSGxsszgy8mcmHJ2+25ZF+yJ7maIwhGu3MA2UGW3o0nQpm
 aLdOCtkcZ/FwpFUOsjWQBplirFA+rE0UXR7Z3lfqSiubbMx7FCsZ+vgu9IiqlwgUST
 YXW3Wg0+Xnf+lU3O0oRcaCI6LSrpv75aXN2tKalbPE6Aoxqmo9R9hGBBcGr+Wbymf7
 sCwalRVuuimSg==
Date: Thu, 21 Dec 2023 11:28:41 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/8] iio: buffer-dma: Get rid of outgoing queue
Message-ID: <20231221112841.1de85482@jic23-huawei>
In-Reply-To: <20231219175009.65482-2-paul@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-2-paul@crapouillou.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
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
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Dec 2023 18:50:02 +0100
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

I've applied this in interests in reducing the outstanding set of patches
and because it stands fine as on its own.

Applied to the togreg branch of iio.git and pushed out as testing.
Note this is now almost certainly 6.9 material given timing.

Jonathan
