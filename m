Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3317CB4DA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 22:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D4110E17F;
	Mon, 16 Oct 2023 20:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A94A10E17F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 20:43:21 +0000 (UTC)
Received: from [192.168.2.39] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EA84660708F;
 Mon, 16 Oct 2023 21:43:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697489000;
 bh=h1z55IQAW1yGCN+cMgq/Yvh4GJ6Mfo0y1TJyG0h3V24=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M2enQ38Ak8hos/2nAVCjzcmPjGFlNI2oqbXLNUTXMm1cpAVpJRMOQyDCB7c+A8XwG
 t6kgIUFsxSJaGqvD0GZGpghvcyFPA0k3uZwEMvnHR0ooI2BHwG/IL4TRryt3dfmsOI
 gJUTWa9SIFvi/6iDJZrpggzHi525kjTq8M7phRsxDEhXmPyigSu0Zy9nWMsyhhWt9T
 UvpFTUxTN1mIXKB/A2+V4V/oqfPfClvw1vreWfG9nLvtSNPPMWrAk6crueEFAidoBl
 hhn0QuXOCg+LKkuOmUhswnz8z7QeIOGInlPuKA+foxaLXBzvzZkqDr/KM+CJKYx09a
 u28qUvgQtuRVA==
Message-ID: <3ace88b1-4d90-70ed-2b49-1412743f0b6c@collabora.com>
Date: Mon, 16 Oct 2023 23:43:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] drm/virtio: use uint64_t more in
 virtio_gpu_context_init_ioctl
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20231016184200.639-1-gurchetansingh@chromium.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231016184200.639-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16/23 21:41, Gurchetan Singh wrote:
> drm_virtgpu_context_set_param defines both param and
> value to be u64s.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index b24b11f25197..8d13b17c215b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -565,8 +565,8 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>  					 void *data, struct drm_file *file)
>  {
>  	int ret = 0;
> -	uint32_t num_params, i, param, value;
> -	uint64_t valid_ring_mask;
> +	uint32_t num_params, i;
> +	uint64_t valid_ring_mask, param, value;
>  	size_t len;
>  	struct drm_virtgpu_context_set_param *ctx_set_params = NULL;
>  	struct virtio_gpu_device *vgdev = dev->dev_private;

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

