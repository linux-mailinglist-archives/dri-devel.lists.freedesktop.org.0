Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD1E91D126
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 12:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBD410E16A;
	Sun, 30 Jun 2024 10:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mraqjYxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9181910E16A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 10:32:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ABBC6CE0A12;
 Sun, 30 Jun 2024 10:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04529C2BD10;
 Sun, 30 Jun 2024 10:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719743531;
 bh=gh1JxaEepJgrDqQlb2ujT5dF1NO1oXJ9/fTSjRKekGg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mraqjYxfRo+Upk60m5tv7fcpDsMVvTc64ODcth8JmTSp4NYpX19uuUc5hWyqNOGMj
 fkYy89YIFOvkD1cFbWaeIOEYHDVhhycmnDSIp6zXfAHBOQ+h6yE2/hHRalQJgcOS96
 hFbu2D/uiP18YiuUB597J/1hjNtJwbbLU0pw4s8ZfsR4f629iVgrC1gh4jDuDsvw7N
 H5sUsVzuFKPiqlHe4gbDnJZ8BULVaa1mRymkU0cZri2M/KMmio7Bj7iurnpOnPa9Q+
 7orEYL8kLkhyhf6MfZZUoilaizxXae6FwjVHkESPZMVvkLldwuYYofe1YnN6ATV6Ff
 lIi9PObMJJP7w==
Date: Sun, 30 Jun 2024 11:32:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Paul Cercueil <paul@crapouillou.net>, Jonathan
 Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: (subset) [PATCH v12 0/7] iio: new DMABUF based API v12
Message-ID: <20240630113203.719d1daf@jic23-huawei>
In-Reply-To: <171896438479.273533.11227587889239181030.b4-ty@kernel.org>
References: <20240620122726.41232-1-paul@crapouillou.net>
 <171896438479.273533.11227587889239181030.b4-ty@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jun 2024 15:36:24 +0530
Vinod Koul <vkoul@kernel.org> wrote:

> On Thu, 20 Jun 2024 14:27:19 +0200, Paul Cercueil wrote:
> > Here's the v12 of my patchset that introduces DMABUF support to IIO.
> > 
> > Apart from a small documentation fix, it reverts to using
> > mutex_lock/mutex_unlock in one particular place, which used cleanup
> > GOTOs (which don't play well with scope-managed cleanups).
> > 
> > Changelog:
> > - [3/7]:
> >     - Revert to mutex_lock/mutex_unlock in iio_buffer_attach_dmabuf(),
> >       as it uses cleanup GOTOs
> > - [6/7]:
> >     - "obtained using..." -> "which can be obtained using..."
> > 
> > [...]  
> 
> Applied, thanks!
> 
> [1/7] dmaengine: Add API function dmaengine_prep_peripheral_dma_vec()
>       commit: 5878853fc9389e7d0988d4b465a415cf96fd14fa
> [2/7] dmaengine: dma-axi-dmac: Implement device_prep_peripheral_dma_vec
>       commit: 74609e5686701ed8e8adc3082d15f009e327286d
> [7/7] Documentation: dmaengine: Document new dma_vec API
>       commit: 380afccc2a55e8015adae4266e8beff96ab620be

Merged Vinod's topic branch and applied, 3,4,5,6 to the togreg
branch of iio.git.  Thanks all for the hard work on this one.
Great to finally get there!

Jonathan

p.s. Last few weeks were about some complexities in the IIO tree
unrelated to this set.

> 
> Best regards,

