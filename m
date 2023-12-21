Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF0881B512
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 12:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCB710E67C;
	Thu, 21 Dec 2023 11:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7F610E67C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 11:40:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09C0A618EA;
 Thu, 21 Dec 2023 11:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7491AC433C7;
 Thu, 21 Dec 2023 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703158835;
 bh=0XVAbyt5Q2EdtCdnVgot+orUzg22qdyuWONYOCaOdvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EJjKfMIv+lEiqo5m5vpW/rQ70EOUNXbX2Lyc3QilwQXwY+cjKMEek8oJD0ypJ9pzZ
 0+YC8yJmimS0t+HDpBcAx65cpJ6QC2Y0GPWs+wRAYoPfWHPunk1hf+iQ+CvS1J5ey6
 hiIz/ea1PaZcIIXaXsIxFMuamU2vuqUISJ8dVXqvlGkjnByx/ajgecqSeOUokKCt2E
 TP2BmAsJIaIoW0Ld47zRAGl/pZ135pFhycy7N7bAS8AcruycCyRevpTOLA/1bTF0EF
 y97Yz2wffZPtPoqvXe2MLE89FsxWzie35kqvUH/9SeNTYQnwt/giyfHkAz5vG23+mO
 mzKPhMMX8Skig==
Date: Thu, 21 Dec 2023 11:40:20 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 3/8] dmaengine: Add API function
 dmaengine_prep_slave_dma_vec()
Message-ID: <20231221114020.2d1e6364@jic23-huawei>
In-Reply-To: <20231219175009.65482-4-paul@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-4-paul@crapouillou.net>
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

On Tue, 19 Dec 2023 18:50:04 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> This function can be used to initiate a scatter-gather DMA transfer,
> where the address and size of each segment is located in one entry of
> the dma_vec array.
> 
> The major difference with dmaengine_prep_slave_sg() is that it supports
> specifying the lengths of each DMA transfer; as trying to override the
> length of the transfer with dmaengine_prep_slave_sg() is a very tedious
> process. The introduction of a new API function is also justified by the
> fact that scatterlists are on their way out.
> 
> Note that dmaengine_prep_interleaved_dma() is not helpful either in that
> case, as it assumes that the address of each segment will be higher than
> the one of the previous segment, which we just cannot guarantee in case
> of a scatter-gather transfer.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

This and the next patch look fine to me as clearly simplify things for
our usecases, but they are really something for the dmaengine maintainers
to comment on.

Jonathan
