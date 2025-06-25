Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE1AAE90EE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 00:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32CC10E803;
	Wed, 25 Jun 2025 22:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TOuy1yeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531CD10E803
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 22:17:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C3F4E40C2F;
 Wed, 25 Jun 2025 22:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C12C4CEEA;
 Wed, 25 Jun 2025 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750889870;
 bh=SOlW945FsEuU+z2VqRVH+3m+gzeJachd1rv/kOLBoD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TOuy1yeF9Ackritm8p/aX1omm/wZpCvVFwrZ3wESNTTLB9VHdquUbC99Mdt2qBsdZ
 N8/t9i6dnBeOa+dPtJFo6OOH31RuyxUJBKxpWR+xPF9hZnykWDiO+nUWow2SRBa5RN
 E7ctyqtCrksbpBdo3tCyfbMmLP12EdJY/OHMXSzpQghhpUQpIOlD5SXN5PQd2kh8OS
 bszr0EgASrf3/dqjEk4MSjbEjcvE/YRh9IIcB5J7N8QrejF5uIVXurarv63NJA3+/R
 gt3UcLcTEferpmtCxfAu7CjHV4xgXoZCoIn55s0VOhfb9RpXfwsykwUjC/NpK1XCYW
 MkLbLM82qkpiw==
Date: Thu, 26 Jun 2025 00:17:46 +0200
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
Subject: Re: [PATCH 0/3] Fix STM32 I2C dma operations
Message-ID: <cmxzc2slync7toacgqpng6u5nbxhp73foaacwqdkm3z7k7hesu@zc3mpbdrpiaz>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
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

Pierre-Yves, Alain,

On Mon, Jun 16, 2025 at 10:53:53AM +0200, Clément Le Goffic wrote:
> This patch series aims to fix some issues inside the driver's DMA
> handling.
> It also uses newer I2C DMA API.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
> Clément Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer
>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

any chance you can take a look at this series?

Thanks,
Andi

> 
>  drivers/i2c/busses/i2c-stm32.c   |  2 +-
>  drivers/i2c/busses/i2c-stm32f7.c | 40 +++++++++++++++++++++++++++++-----------
>  2 files changed, 30 insertions(+), 12 deletions(-)
> ---
> base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
> change-id: 20250527-i2c-upstream-e5b69501359a
> 
> Best regards,
> -- 
> Clément Le Goffic <clement.legoffic@foss.st.com>
> 
