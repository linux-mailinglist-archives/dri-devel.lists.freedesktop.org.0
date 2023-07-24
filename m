Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC48175EC13
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 08:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3CF10E275;
	Mon, 24 Jul 2023 06:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D45910E184
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 06:57:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 917E36606FC0;
 Mon, 24 Jul 2023 07:57:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690181845;
 bh=DDr7h7mny8AZCBOnyjGhWJoPL9V0rTYC+Qaptxd3CCo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RJTdfn8B2N0JPy1aeTMf8a1BAbSMK5ufX/7M+lc3rm6jzAkWeoQOYASLD20RBzTqR
 rgnIP9f9YRgsJegVdPLFUMp2wD11//O4nxujlfOo05BirgcsCpp7urh04qIbT1LYss
 VxMzycv22QzBSV9rfpXbd7lLiMiM3fqSxMoQPYAZ35VYKPwYscPgvoa0N9wjy/fYEG
 k+I0NzQRRbjv2AwdUKGnhKYk5H1bv/5A4zmYPTNkliAEX5Ho3BSiqMZQAiwLL/lfEh
 o16Xo7XqSuMz+rpJQVYbWTxG6ggC98lQZd/AwEci+r3CBTl9ZqLvTyKhr4o3bbBTUT
 J21QIlsffBN1Q==
Date: Mon, 24 Jul 2023 08:57:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v2] drm/panfrost: Sync IRQ by job's timeout handler
Message-ID: <20230724085723.5e574bff@collabora.com>
In-Reply-To: <20230723000142.206908-1-dmitry.osipenko@collabora.com>
References: <20230723000142.206908-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jul 2023 03:01:42 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Panfrost IRQ handler may stuck for a long time, for example this happens
> when there is a bad HDMI connection and HDMI handler takes a long time to
> finish processing, holding Panfrost. Make Panfrost's job timeout handler
> to sync IRQ before checking fence signal status in order to prevent
> spurious job timeouts due to a slow IRQ processing.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
> 
> Changelog:
> 
> v2: - Moved synchronize_irq() after first signal-check to avoid unnecessary
>       blocking on syncing.
> 
>     - Added warn message about high interrupt latency.
> 
>  drivers/gpu/drm/panfrost/panfrost_job.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..a7663d7847a2 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -720,6 +720,13 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>  	if (dma_fence_is_signaled(job->done_fence))
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
>  
> +	synchronize_irq(pfdev->js->irq);

Can we add a comment here explaining why we're doing that?

> +
> +	if (dma_fence_is_signaled(job->done_fence)) {
> +		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
> +		return DRM_GPU_SCHED_STAT_NOMINAL;
> +	}
> +
>  	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
>  		js,
>  		job_read(pfdev, JS_CONFIG(js)),

