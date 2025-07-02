Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BBBAF5F3C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A98010E750;
	Wed,  2 Jul 2025 16:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oRdRrBd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B2F10E750
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 16:57:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C1E06111F;
 Wed,  2 Jul 2025 16:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1317FC4CEEF;
 Wed,  2 Jul 2025 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751475425;
 bh=ocNwR/XXz0H6vYXtxoEREo6XhUYrxZeTqCH9xLXk4Dw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oRdRrBd4rqlB8P6ErGgt4dvwpJ1u94yU+jWyu49x4SA6gFJNM0mkK6DqYNPhRr2cx
 ASDxNstDubarmmecPdK72Xh7hjJPR7qRiDFqkILrbugZJAitqUdPhke+aIfhnm/oPj
 teu1773om9O6m6zKuBi0N2Cw7YHP0vtecXbXdaS0PtKUg+na4X229xfbyfv2rhQsJm
 stZy47lY2torkY8GlO5HjTfcWb2uIi08rf39WN2ywlh5BFuSnIwrG7TAhSQZtWrJC4
 RnVJ+LRovqcXfETHgEkNAFhWgnih5HrjuobsWNkhaISKTZFqlA6XMHBxFGsD5IgHpd
 zwtUHA+TAL1YA==
Date: Wed, 2 Jul 2025 18:57:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
 Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 1/3] i2c: stm32: fix the device used for the DMA map
Message-ID: <n4mx3xukr5zffajpwomuwp27fywmogm6nmv7hgkcwpghjaorwv@2mqmgg3u5far>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
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

Hi Clement,

...

> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>  	dma->dma_len = len;
>  	chan_dev = dma->chan_using->device->dev;
>  
> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>  				      dma->dma_data_dir);
>  	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
			      ^^^^^^^^

this one should be "dev" too, which renders the chan_dev variable
unused.

Thanks,
Andi

>  		dev_err(dev, "DMA mapping failed\n");
