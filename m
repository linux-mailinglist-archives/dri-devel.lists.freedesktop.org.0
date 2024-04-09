Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094CE89D905
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 14:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7005C112D22;
	Tue,  9 Apr 2024 12:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u902tTqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A9F112C1B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 12:14:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DB364CE122C;
 Tue,  9 Apr 2024 12:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDB2C43390;
 Tue,  9 Apr 2024 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712664877;
 bh=b6JwoQx9iqUWXaUmbAB3ya+MdSagj6m7QwNqt/Lxn+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u902tTqa9EOdqFofkXIH03QWbKFlfzdl79ctoI6PXU2cx/k7Vw+be+EmYpYeTUrUt
 ccjnEo8OLYsrdcWQCASKWCOdiddtPXPYptPTRTmYncwtUObdct1DS/WtYd7v7utmQa
 anctvW8YG0B3/n3nD5YB/4lWA+In/P+Rtb/85p0k=
Date: Tue, 9 Apr 2024 14:14:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pascal FONTAIN <Pascal.FONTAIN@bachmann.info>
Cc: linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 afd@ti.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 2/2] misc: sram: Add DMA-BUF Heap exporting of SRAM
 areas
Message-ID: <2024040944-flashcard-tribune-6a8e@gregkh>
References: <20240409120605.4138472-1-Pascal.FONTAIN@bachmann.info>
 <20240409120605.4138472-3-Pascal.FONTAIN@bachmann.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409120605.4138472-3-Pascal.FONTAIN@bachmann.info>
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

On Tue, Apr 09, 2024 at 02:06:05PM +0200, Pascal FONTAIN wrote:
> From: Andrew Davis <afd@ti.com>
> 
> This new export type exposes to userspace the SRAM area as a DMA-BUF
> Heap,
> this allows for allocations of DMA-BUFs that can be consumed by various
> DMA-BUF supporting devices.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> Tested-by: Pascal Fontain <pascal.fontain@bachmann.info>

When sending on a patch from someone else, you too must sign off on it
as per our documenation.  Please read it and understand what you are
agreeing to when you do that for a new version please.

> ---
>  drivers/misc/Kconfig         |   7 +
>  drivers/misc/Makefile        |   1 +
>  drivers/misc/sram-dma-heap.c | 246 +++++++++++++++++++++++++++++++++++
>  drivers/misc/sram.c          |   6 +
>  drivers/misc/sram.h          |  16 +++
>  5 files changed, 276 insertions(+)
>  create mode 100644 drivers/misc/sram-dma-heap.c
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 9e4ad4d61f06..e6674e913168 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -448,6 +448,13 @@ config SRAM
>  config SRAM_EXEC
>  	bool
>  
> +config SRAM_DMA_HEAP
> +	bool "Export on-chip SRAM pools using DMA-Heaps"
> +	depends on DMABUF_HEAPS && SRAM
> +	help
> +	  This driver allows the export of on-chip SRAM marked as both pool
> +	  and exportable to userspace using the DMA-Heaps interface.

What will use this in userspace?

thanks,

greg k-h
