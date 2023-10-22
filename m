Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9022E7D275D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 01:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F7D10E02F;
	Sun, 22 Oct 2023 23:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE5710E02F
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 23:50:45 +0000 (UTC)
Received: from [192.168.2.43] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 27C7E6606EE0;
 Mon, 23 Oct 2023 00:50:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698018643;
 bh=PjMRItJxznPws4vkCR9WmowG9fX3XVpQq2fVu9NQjCs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YxPpY7ToAXkiDbM0eZb/EWUpoRVX2m1BY+hhywWpb8xM2T8RFeIU/fP2iwBfad2Jn
 sFPeW+VtUwZAiCzuynPSbgVJJJjGdzr+ZUKxE0bciVKPTE/s1LWU66OLcw1jVB4kpZ
 e0jmeE4+QFOjvkF3cc+DCmoogtdi/dkvWl/vwq4ut5wEjNmDMpQ+/L2mWuwxDCToCN
 twmVJHWceVru+VrgIEqCVXrnD9+ckyDYFVwTiBTQTdy42rvuMQmLSvXYWIZyLKFxPP
 CkRTmgbDiOBZ0B/vOcMapxumurYhGRi+Q9kedc51rIQ/zz38HpCgfh6i8CpQlWJYcH
 OId+3nf++r9eQ==
Message-ID: <a5a51fde-ee38-ceb9-d5af-21135397f140@collabora.com>
Date: Mon, 23 Oct 2023 02:50:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] drm/uapi: add explicit virtgpu context debug name
To: kraxel@redhat.com
References: <20231018181727.772-1-gurchetansingh@chromium.org>
 <20231018181727.772-2-gurchetansingh@chromium.org>
Content-Language: en-US
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
Cc: josh.simonot@gmail.com, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>
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

Gerd, do you have objections to this UAPI change?

-- 
Best regards,
Dmitry

