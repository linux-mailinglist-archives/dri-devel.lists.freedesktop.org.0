Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A418F7CEB88
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 00:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F6B10E460;
	Wed, 18 Oct 2023 22:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEDC10E460
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 22:59:35 +0000 (UTC)
Received: from [192.168.2.39] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 09A6266028F5;
 Wed, 18 Oct 2023 23:59:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697669974;
 bh=lBw0h8oiuOHIze8vfWS4Wcsm8DJIL2xNX93UcCVAElY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mrIMcLS+ol3uU1sy6vTpdo9P5PGDWEVllgNFFUFfz0wT3g5wkP+yUdbCf6qrYLPVg
 P80rS1E/Rynw56WTnW0UKMqh6xmZVq3f1CwARLxDcNzCjKy9Qd7Qnkj41yevJrZAjL
 kBAwTJOXwo6fyOWZFLnVSFkNwTTeJae6IWKZA4a+lTfLMckZIeuSAE2jY/5niMFo3h
 OR9wOhH4IdqvT5d8/IggDbSTX+e9rgKSqt7ffzmiJl7Yf5xS0/D1F9K7osaRj602Q6
 hZyhMtx+3xqlsMCsAt7JdlEvxK1wOaLXBe9QLJ1lnkAER6tXGgEULCsVHsECpCZq6M
 onjaaE/Y2umGA==
Message-ID: <c265ba42-f4fb-5239-4cf0-32e1abc503b8@collabora.com>
Date: Thu, 19 Oct 2023 01:59:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] drm/uapi: add explicit virtgpu context debug name
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20231018181727.772-1-gurchetansingh@chromium.org>
 <20231018181727.772-2-gurchetansingh@chromium.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231018181727.772-2-gurchetansingh@chromium.org>
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
Cc: josh.simonot@gmail.com, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/18/23 21:17, Gurchetan Singh wrote:
> There are two problems with the current method of determining the
> virtio-gpu debug name.
> 
> 1) TASK_COMM_LEN is defined to be 16 bytes only, and this is a
>    Linux kernel idiom (see PR_SET_NAME + PR_GET_NAME). Though,
>    Android/FreeBSD get around this via setprogname(..)/getprogname(..)
>    in libc.
> 
>    On Android, names longer than 16 bytes are common.  For example,
>    one often encounters a program like "com.android.systemui".
> 
>    The virtio-gpu spec allows the debug name to be up to 64 bytes, so
>    ideally userspace should be able to set debug names up to 64 bytes.
> 
> 2) The current implementation determines the debug name using whatever
>    task initiated virtgpu.  This is could be a "RenderThread" of a
>    larger program, when we actually want to propagate the debug name
>    of the program.
> 
> To fix these issues, add a new CONTEXT_INIT param that allows userspace
> to set the debug name when creating a context.
> 
> It takes a null-terminated C-string as the param value. The length of the
> string (excluding the terminator) **should** be <= 64 bytes.  Otherwise,
> the debug_name will be truncated to 64 bytes.
> 
> Link to open-source userspace:
> https://android-review.googlesource.com/c/platform/hardware/google/gfxstream/+/2787176
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Reviewed-by: Josh Simonot <josh.simonot@gmail.com>
> ---
> Fixes suggested by Dmitry Osipenko
> v2:
>     - Squash implementation and UAPI change into one commit
>     - Avoid unnecessary casts
>     - Use bool when necessary
> v3:
>     - Use DEBUG_NAME_MAX_LEN - 1 when copying string
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  5 ++++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 39 ++++++++++++++++++++++----
>  include/uapi/drm/virtgpu_drm.h         |  2 ++
>  3 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 96365a772f77..bb7d86a0c6a1 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -58,6 +58,9 @@
>  #define MAX_CAPSET_ID 63
>  #define MAX_RINGS 64
>  
> +/* See virtio_gpu_ctx_create. One additional character for NULL terminator. */
> +#define DEBUG_NAME_MAX_LEN 65
> +
>  struct virtio_gpu_object_params {
>  	unsigned long size;
>  	bool dumb;
> @@ -274,6 +277,8 @@ struct virtio_gpu_fpriv {
>  	uint64_t base_fence_ctx;
>  	uint64_t ring_idx_mask;
>  	struct mutex context_lock;
> +	char debug_name[DEBUG_NAME_MAX_LEN];
> +	bool explicit_debug_name;
>  };
>  
>  /* virtgpu_ioctl.c */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 8d13b17c215b..65811e818925 100644
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
> @@ -642,6 +652,23 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
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
> +						u64_to_user_ptr(value),
> +						DEBUG_NAME_MAX_LEN - 1);
> +
> +			if (ret < 0) {
> +				ret = -EFAULT;
> +				goto out_unlock;
> +			}
> +
> +			vfpriv->explicit_debug_name = true;
> +			break;
>  		default:
>  			ret = -EINVAL;
>  			goto out_unlock;
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> index b1d0e56565bc..c2ce71987e9b 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -97,6 +97,7 @@ struct drm_virtgpu_execbuffer {
>  #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
>  #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
>  #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
> +#define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name from userspace */
>  
>  struct drm_virtgpu_getparam {
>  	__u64 param;
> @@ -198,6 +199,7 @@ struct drm_virtgpu_resource_create_blob {
>  #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
>  #define VIRTGPU_CONTEXT_PARAM_NUM_RINGS       0x0002
>  #define VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK 0x0003
> +#define VIRTGPU_CONTEXT_PARAM_DEBUG_NAME      0x0004
>  struct drm_virtgpu_context_set_param {
>  	__u64 param;
>  	__u64 value;

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

