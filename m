Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6FA58EAF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 09:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FA510E3B8;
	Mon, 10 Mar 2025 08:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VS2GD8mC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7A310E3B8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 08:56:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52351A45182;
 Mon, 10 Mar 2025 08:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF69EC4CEEC;
 Mon, 10 Mar 2025 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741596996;
 bh=C12mkxyY7Tuz4k36lFMWBiBskfY3UsSgTUDwu4ymK5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VS2GD8mC3KF67GsqwrZolL2PJC5nV8QLxQyAj07n3f39prZtkH1iJvEM60yAG3gQD
 V6plRwhAVbOW7QKUgyQAJHRX8KqkzSNYtqJVSaCbMIZFHBfrzwotEzdTyBf7nahb1F
 ulw5xmNt1ZS0/aH3skbKsPmqAglFS17CXESwCPnsNYfVvt5TieC74ADPeUyUBP34F1
 pDsXpTVlIpEGb5v1s3vkFszlbLMYeyG2K7k5dPXep0ShufS8ewpYY5j+8DCkBkiobB
 dcRrEG7RKtdyu/gY2i+79yqPKgi/ec7BtqCYNCz/r78UnJa0FdyBemgkAxkJvqs9vk
 pVW7xYFBa9f3g==
Date: Mon, 10 Mar 2025 14:26:26 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 01/10] tee: tee_device_alloc(): copy dma_mask from
 parent device
Message-ID: <Z86pOi874jfJJSOv@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-2-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-2-jens.wiklander@linaro.org>
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

On Wed, Mar 05, 2025 at 02:04:07PM +0100, Jens Wiklander wrote:
> If a parent device is supplied to tee_device_alloc(), copy the dma_mask
> field into the new device. This avoids future warnings when mapping a
> DMA-buf for the device.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@kernel.org>

-Sumit

> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..685afcaa3ea1 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
>  	teedev->dev.class = &tee_class;
>  	teedev->dev.release = tee_release_device;
>  	teedev->dev.parent = dev;
> +	if (dev)
> +		teedev->dev.dma_mask = dev->dma_mask;
>  
>  	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
>  
> -- 
> 2.43.0
> 
