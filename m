Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A0776AA48
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 09:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FBD10E315;
	Tue,  1 Aug 2023 07:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAED710E315
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 07:50:26 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 23EDA6607114;
 Tue,  1 Aug 2023 08:50:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690876225;
 bh=iODfF7XpW1EtsCvou+Devm/e/p/QPQYfgNk+Z1DVjng=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D/oZP2a5vFfgDDUfIzfF5DzBwrLULG3v1/Sezkd70rrwoX1vyCZzpTc9/f9pmnVct
 dwCjBNMmEwYbgc7qN6ubpng/JCYGyJ78yQTvAqcawXXJ8kCL/t56opiApGTX+XP3dU
 DHYmNOJOjSd2Nta4XyX7gZnbQBIdDrfhu+JHRlOYHtvLr5Gh44j3xBN/hOkrfjBNII
 4s43I8Hlff1HRwLq9Axi9PN24KENrjDgDJCSraSg7Omae63+qWlHKtixY9GZmQfQcl
 5NzI73Hn4xlaJ1gL2LO6jH/QCRCrN8sJzxwx3w98BLqoV1H+T1y3pQFzy9+nfGqQTu
 0diEgd1ZKon4g==
Date: Tue, 1 Aug 2023 09:50:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v3] drm/panfrost: Sync IRQ by job's timeout handler
Message-ID: <20230801095022.2c5e66d6@collabora.com>
In-Reply-To: <20230801001427.176981-1-dmitry.osipenko@collabora.com>
References: <20230801001427.176981-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  1 Aug 2023 03:14:27 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Panfrost IRQ handler may stuck for a long time, for example this happens
> when there is a bad HDMI connection and HDMI handler takes a long time to
> finish processing, holding Panfrost. Make Panfrost's job timeout handler
> to sync IRQ before checking fence signal status in order to prevent
> spurious job timeouts due to a slow IRQ processing.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # MediaTek MT8192 and MT8195 Chromebooks:
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Just a couple nits below.

> ---
> 
> Changelog:
> 
> v3: - Added comment to the code as was suggested by Boris
> 
>     - Added r-b/t-b from Steven and Angelo
> 
> v2: - Moved synchronize_irq() after first signal-check to avoid unnecessary
>       blocking on syncing.
> 
>     - Added warn message about high interrupt latency.
> 
>  drivers/gpu/drm/panfrost/panfrost_job.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..ea1149354f9d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -720,6 +720,21 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>  	if (dma_fence_is_signaled(job->done_fence))
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
>  
> +	/*
> +	 * Panfrost IRQ handler may take long time to process if there is

				^ may take a long time to process an
	interrupt if there is ...

> +	 * another IRQ handler hogging the processing. For example, HDMI
> +	 * may stuck in IRQ handler for a significant time in a case of bad

	For example, the HDMI encoder driver might be stuck in the IRQ
	handler ...

> +	 * cable connection. In order to catch such cases and not report
> +	 * spurious Panfrost job timeouts, synchronize the IRQ handler and
> +	 * re-check the fence status.
> +	 */



> +	synchronize_irq(pfdev->js->irq);
> +
> +	if (dma_fence_is_signaled(job->done_fence)) {
> +		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
> +		return DRM_GPU_SCHED_STAT_NOMINAL;
> +	}
> +
>  	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
>  		js,
>  		job_read(pfdev, JS_CONFIG(js)),

