Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B88050DA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 11:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EECB10E4E1;
	Tue,  5 Dec 2023 10:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C7210E4E1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 10:42:43 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EF07C6602F1E;
 Tue,  5 Dec 2023 10:42:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701772961;
 bh=WXau+qpHnh6GYQPDtFMZ2/Fl7ub+SROjrL3fA0IaPnU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZV7y5ybOsqMlA8dMZo7tC8Kf+xgBN/h06E/pG48Emw4+18mdnPoDU51zHIUOIGmic
 8DsBoMKwy732LhXkIZTLD+mfdLuxw+pAYLLS+xS9hN7nSPT12PYCO/gPkDB3j3iPta
 UQow20cAs4+HP3PXCciFg0kYUg/Pp2S23Y8sXf5qcohFLhGcjXHEv9Lnn67MT2gPc2
 19ApZrFa1J5yJFwDWOB5RztvLMpxET1BEjzwRmJCdyPYYlOpP3LuCVeYkmKqTZaU1i
 Ku//MCdNeTx/fpzcw2JmvortSFSlzm8kmAao4tAIjP66AncCbGl572fZPf7ulWkYeB
 u1toXdc3eSI6g==
Date: Tue, 5 Dec 2023 11:42:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/3] drm/panfrost: Fix poweroff and sync IRQs for
 suspend
Message-ID: <20231205114237.72c69160@collabora.com>
In-Reply-To: <20231204114215.54575-1-angelogioacchino.delregno@collabora.com>
References: <20231204114215.54575-1-angelogioacchino.delregno@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  4 Dec 2023 12:42:12 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Changes in v4:
>  - Added checks for is_suspended bits in hardirqs
>  - Added GPU suspended bit (and handling of it)
>  - Reordered panfrost_drv_comp_bits entries
>  - Commit description fixes
> 
> Changes in v3:
>  - Removed useless GPU_INT_CLEAR write in suspend path
>  - Changed to clear suspend bits in job/mmu reset path
> 
> This series contains a fast fix for the basic GPU poweroff functionality
> and goes further by implementing interrupt masking and synchronization
> before suspend.
> 
> For more information, please look at the conversation at [1], which
> explains the regression seen with the poweroff commit and the initial
> approaches taken to solve that.
> 
> Cheers!
> 
> [1]: https://lore.kernel.org/all/20231123095320.41433-1-angelogioacchino.delregno@collabora.com/
> 
> AngeloGioacchino Del Regno (3):
>   drm/panfrost: Ignore core_mask for poweroff and disable PWRTRANS irq
>   drm/panfrost: Add gpu_irq, mmu_irq to struct panfrost_device
>   drm/panfrost: Synchronize and disable interrupts before powering off

Queued to drm-misc-next.

Thanks,

Boris

> 
>  drivers/gpu/drm/panfrost/panfrost_device.c |  3 ++
>  drivers/gpu/drm/panfrost/panfrost_device.h | 10 ++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 40 ++++++++++++++++------
>  drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 26 +++++++++++---
>  drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 32 ++++++++++++-----
>  drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
>  8 files changed, 91 insertions(+), 23 deletions(-)
> 

