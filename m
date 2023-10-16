Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053E97CB4D3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 22:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190D010E0D3;
	Mon, 16 Oct 2023 20:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9CD10E0D3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 20:39:08 +0000 (UTC)
Received: from [192.168.2.39] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 79449660708F;
 Mon, 16 Oct 2023 21:39:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697488746;
 bh=hAnSwVVXyUGUwKHEaQ5Ee+PDNayUPjSmJouSjoW6YQs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CuKruugYfCJd0S7iCV4P5C8kCYKb0N8CzCFawn9TTh4PEDdmrXHY6PVdOjMmuQHgc
 lejr5o3bGcfK8MjFt0/vL8Q0vRtUAFla3LHmTcklamfszMcsEWkq97/8e+5LNe5lVB
 rGP1/Zkvgg7PGx0g1vvp56xyUSRNOlZv5syqFfjrniF55emxxkP/gtjnTFA/5IvW3x
 k9ktmDpfSRmu4BMUP95JJUn7wm/fVTvGImbEnB/iJgI5m/Sn0FXYhIM0SqeOO+O1Nz
 ema629ANKOpH0ya+KX+DsrCYLxutDJJIXnERLrHDBRkXH7U+tVxI4YOx7k1SVQlP0N
 3ef/hS+5UCUkA==
Message-ID: <20c9f801-0c83-7ba4-36fc-a2d18c3979e2@collabora.com>
Date: Mon, 16 Oct 2023 23:39:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] drm/virtio: implement debug name via CONTEXT_INIT
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20231016184200.639-1-gurchetansingh@chromium.org>
 <20231016184200.639-3-gurchetansingh@chromium.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231016184200.639-3-gurchetansingh@chromium.org>
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

On 10/16/23 21:42, Gurchetan Singh wrote:
> This allows setting the debug name during CONTEXT_INIT.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  4 +++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 38 ++++++++++++++++++++++----
>  2 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 96365a772f77..c0702d630e05 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -58,6 +58,8 @@
>  #define MAX_CAPSET_ID 63
>  #define MAX_RINGS 64
>  
> +#define DEBUG_NAME_MAX_LEN 64
> +
>  struct virtio_gpu_object_params {
>  	unsigned long size;
>  	bool dumb;
> @@ -274,6 +276,8 @@ struct virtio_gpu_fpriv {
>  	uint64_t base_fence_ctx;
>  	uint64_t ring_idx_mask;
>  	struct mutex context_lock;
> +	char debug_name[DEBUG_NAME_MAX_LEN];
> +	char explicit_debug_name;

bool

>  };
>  
>  /* virtgpu_ioctl.c */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 8d13b17c215b..4d6d44a4c899 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -42,12 +42,19 @@
>  static void virtio_gpu_create_context_locked(struct virtio_gpu_device *vgdev,
>  					     struct virtio_gpu_fpriv *vfpriv)
>  {
> -	char dbgname[TASK_COMM_LEN];
> +	if (vfpriv->explicit_debug_name) {
> +		virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> +					      vfpriv->context_init,
> +					      strlen(vfpriv->debug_name),
> +					      vfpriv->debug_name);
> +	} else {
> +		char dbgname[TASK_COMM_LEN];
>  
> -	get_task_comm(dbgname, current);
> -	virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> -				      vfpriv->context_init, strlen(dbgname),
> -				      dbgname);
> +		get_task_comm(dbgname, current);
> +		virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> +					      vfpriv->context_init, strlen(dbgname),
> +					      dbgname);
> +	}
>  
>  	vfpriv->context_created = true;
>  }
> @@ -107,6 +114,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
>  	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
>  		value = vgdev->capset_id_mask;
>  		break;
> +	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
> +		value = vgdev->has_context_init ? 1 : 0;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -580,7 +590,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>  		return -EINVAL;
>  
>  	/* Number of unique parameters supported at this time. */
> -	if (num_params > 3)
> +	if (num_params > 4)
>  		return -EINVAL;
>  
>  	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
> @@ -642,6 +652,22 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>  
>  			vfpriv->ring_idx_mask = value;
>  			break;
> +		case VIRTGPU_CONTEXT_PARAM_DEBUG_NAME:
> +			if (vfpriv->explicit_debug_name) {
> +				ret = -EINVAL;
> +				goto out_unlock;
> +			}
> +
> +			ret = strncpy_from_user(vfpriv->debug_name,
> +						(const char __user *)u64_to_user_ptr(value),

casting not needed

> +						DEBUG_NAME_MAX_LEN);

DEBUG_NAME_MAX_LEN - 1

-- 
Best regards,
Dmitry

