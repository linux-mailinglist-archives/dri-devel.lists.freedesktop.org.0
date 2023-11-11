Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D387E8C29
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 19:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B7610E141;
	Sat, 11 Nov 2023 18:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A8710E2BA
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 18:40:28 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 54FD266073B7;
 Sat, 11 Nov 2023 18:40:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699728026;
 bh=C9hbg3YER1tfMUA7RGMlvBY2RFh6xu+gWcyDeKEN0+g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QlAlpCGJC/iWQOAh8N/vNSCmItef6nLYAYsCVVQ7qw4gff/MeeZLOrPy4uhOPsxvF
 QXI9Xhjf3wRj+LCiD/t3iQz79pkIUCdaqdCtSR/udXtDLg/gim017uLpQPQKxk+cy3
 QMROYWcaCO+bLI9xkj6zxLO0mB2cz8tBqbnFBX7mDOyy6tY75h3wDVu8Ml556vJWiB
 kLPhQ1QzFh8XN1UpQFsE7IAkPXoUadcBaQatMpg47FC7bw9qITEUjQnfXp57VrxDs8
 lmDxOCNkT07luTi5LNbwvFQ5zDZ9ql37l1N5g83wXrn2P9aHoYvkz2btN2XiSx+aWX
 CKEZwg3dntZsQ==
Message-ID: <77316c81-df8b-19f0-04a1-feca42f3943f@collabora.com>
Date: Sat, 11 Nov 2023 21:40:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] drm/uapi: add explicit virtgpu context debug name
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com
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
Cc: josh.simonot@gmail.com
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
...
> +			ret = strncpy_from_user(vfpriv->debug_name,
> +						u64_to_user_ptr(value),
> +						DEBUG_NAME_MAX_LEN - 1);
> +
> +			if (ret < 0) {
> +				ret = -EFAULT;
> +				goto out_unlock;
> +			}

The strncpy_from_user() itself returns -EFAULT. I changed code to return
the "ret" directly and applied to misc-next.

Gerd, let us know if have any objections to this patch.

-- 
Best regards,
Dmitry

