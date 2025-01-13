Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA67A0C15E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 20:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A338010E7C5;
	Mon, 13 Jan 2025 19:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mg04oMsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDDF10E7C4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9YMxvb7VW2jhnF1T+i0976Z9UXN/OdAX9SWMqYlJ4k=; b=mg04oMsa6BK0jTEeWmWiWCHkfr
 T8bw53Vnm5mij98Jje8dKEfSpKJeYhXcRT9D0JcHuTIcvSNHk5wxA+y0RwqmIda/C9N+9ms8GslMK
 insOS1zqmDTTzlp+YDmUtw4MWJsPwo/w6Jm7Nz+5SCtXFkumUGc9fRD1Dp2u/Ncs4L0Ap6LlUsFM2
 MsfLYn1c19Pd0SvFVYH5EN/GpH/av87vPHSrgH1PUR2F8xoksmuY0rTCUHjTr8/kfwD3CbZcFAtZp
 qTjKkOXSRYcHxHxCok17fuX2rmFy+AIlst+F0ri0PEeqIcgIcbGHj10gM6PR4VgE5M3zDH/QstdzM
 o1eE24JA==;
Received: from [213.60.32.3] (helo=[192.168.50.165])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tXQ5K-00FJKA-4c; Mon, 13 Jan 2025 20:26:50 +0100
Message-ID: <3fc574d2-00d5-4c22-933c-8db7ed201465@igalia.com>
Date: Mon, 13 Jan 2025 20:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/v3d: Ensure job pointer is set to NULL after job
 completion
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250113154741.67520-1-mcanal@igalia.com>
From: Chema Casanova <jmcasanova@igalia.com>
Organization: Igalia
In-Reply-To: <20250113154741.67520-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

El 13/1/25 a las 16:47, Maíra Canal escribió:
> After a job completes, the corresponding pointer in the device must
> be set to NULL. Failing to do so triggers a warning when unloading
> the driver, as it appears the job is still active. To prevent this,
> assign the job pointer to NULL after completing the job and signaling
> the fence, indicating the job has finished.
>
> Fixes: 14d1d1908696 ("drm/v3d: Remove the bad signaled() implementation")

Just a question, should we add next commit to the Fixes tag:

Fixes: 79d94360d50f ("drm/v3d: wait for all jobs to finish before 
unregistering")

> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_irq.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index 20bf33702c3c..da203045df9b 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -108,6 +108,7 @@ v3d_irq(int irq, void *arg)
>   		v3d_job_update_stats(&v3d->bin_job->base, V3D_BIN);
>   		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
>   		dma_fence_signal(&fence->base);
> +		v3d->bin_job = NULL;
>   		status = IRQ_HANDLED;
>   	}
>   
> @@ -118,6 +119,7 @@ v3d_irq(int irq, void *arg)
>   		v3d_job_update_stats(&v3d->render_job->base, V3D_RENDER);
>   		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
>   		dma_fence_signal(&fence->base);
> +		v3d->render_job = NULL;
>   		status = IRQ_HANDLED;
>   	}
>   
> @@ -128,6 +130,7 @@ v3d_irq(int irq, void *arg)
>   		v3d_job_update_stats(&v3d->csd_job->base, V3D_CSD);
>   		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
>   		dma_fence_signal(&fence->base);
> +		v3d->csd_job = NULL;
>   		status = IRQ_HANDLED;
>   	}
>   
> @@ -165,6 +168,7 @@ v3d_hub_irq(int irq, void *arg)
>   		v3d_job_update_stats(&v3d->tfu_job->base, V3D_TFU);
>   		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
>   		dma_fence_signal(&fence->base);
> +		v3d->tfu_job = NULL;
>   		status = IRQ_HANDLED;
>   	}
>   

With or without my previous comment this is:

Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

Thanks for fixing this so fast.

Regards,

Chema

