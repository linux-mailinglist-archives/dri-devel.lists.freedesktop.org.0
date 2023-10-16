Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C77CB4D7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 22:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F43010E0D6;
	Mon, 16 Oct 2023 20:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1AC10E0D6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 20:40:35 +0000 (UTC)
Received: from [192.168.2.39] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0460A660708F;
 Mon, 16 Oct 2023 21:40:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697488834;
 bh=jvYdkIFcWGXbAc9C0Lau+wEAphcUGWFP6V/e7wuqR/s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Am712Ko5g/99573HB1ZzG4tQ5hOsN6Q0ymxRPuWF0PAjwUVFdzzVdOLstjqurZlXB
 c1u0rpvHS33xE+MGf7i1bFmbIGloNCOeQsJyzVwPSUD2XYN/bYhjmJ6qZzh8W2AEHk
 /9sP98A+xKOYFJt4mwHdJBHOIP7cfcuZ9mmssqH86kGf+5fQg5kxvGtIoGRH/cerEB
 BNeWM54MSV1yZw6LxpIsc1FCvsdYCx/L+2drVz7acaJC86BnbNaMh0X587UnDnwE7r
 KwQglEuhnJLL0bSEBhgioJuPXZG7j5Z6rXApaZGHw+/UDtJ1W1yTsKe/znmWik3VoQ
 dvX14ju7OBkkg==
Message-ID: <8ab3fdff-0950-6983-b33d-4ac8d6c7f81f@collabora.com>
Date: Mon, 16 Oct 2023 23:40:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] drm/uapi: add explicit virtgpu context debug name
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20231016184200.639-1-gurchetansingh@chromium.org>
 <20231016184200.639-2-gurchetansingh@chromium.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231016184200.639-2-gurchetansingh@chromium.org>
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
> It takes a null-terminated C-string as the param value.
> 
> Link to open-source userspace:
> https://android-review.googlesource.com/c/platform/hardware/google/gfxstream/+/2787176
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  include/uapi/drm/virtgpu_drm.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
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

Please squash it into the next patch. UAPI changes shouldn't be
separated from the code that uses this UAPI.

-- 
Best regards,
Dmitry

