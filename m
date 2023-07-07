Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975B774A922
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 04:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4656610E4FB;
	Fri,  7 Jul 2023 02:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA1310E4FB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 02:50:02 +0000 (UTC)
Received: from [192.168.2.30] (109-252-155-235.dynamic.spd-mgts.ru
 [109.252.155.235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C4CEF6606FD3;
 Fri,  7 Jul 2023 03:49:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688698200;
 bh=oEgYrbfxIjVaKeswd+6PJBfe0LZpJ/xiVwJjqP7fgOE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TcmImkU9I7K2/w1+dnTThDZOKbq/Dnz3+rlaG6gpS2jeetojJBFLqLb7eH166AK4b
 HRZZBct4OPL/FIcq39kKNuV9866nd0hdcGi+j+fP6M75HZBbELFfTWmXOG6s12XOP4
 kIHtgq17VUW+r9cxvtyi8Za/j8d/JiWUgxP0FDRHv64NGdnPISg0xW5T91dB33VfqH
 o/hj7lCE77LkinzIbnC75zXsgS1CmyjJlQVMFSgpiu/L9s03VU35C5NuOQ3GJESx1B
 MlwX1M1SqxfWU5WCCFcCwKRHhVeXwDdTwmvhITjjNZPGMDVUHZWuUk87V1pbjX1Atx
 AQaUBBOpUYyDg==
Message-ID: <0b96a5cc-1855-1d83-a559-f87a1556f137@collabora.com>
Date: Fri, 7 Jul 2023 05:49:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v2] drm/virtio: conditionally allocate virtio_gpu_fence
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20230628155838.589-1-gurchetansingh@chromium.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230628155838.589-1-gurchetansingh@chromium.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: kraxel@redhat.com, acourbot@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/28/23 18:58, Gurchetan Singh wrote:
> @@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
>  
>  	memset(submit, 0, sizeof(*submit));
>  
> -	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
> -	if (!out_fence)
> -		return -ENOMEM;
> +	if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
> +	    ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
> +	    (vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||

Looks like there is a problem here. The virtio_gpu_fence_event_create()
doesn't check whether VIRTGPU_EXECBUF_RING_IDX flag is set, so it's
possible to trigger NULL-deref in that function if userspace will set
ring_idx_mask=1. Perhaps virtio_gpu_fence_event_create() need to be
changed to check the flag presence.

-- 
Best regards,
Dmitry

