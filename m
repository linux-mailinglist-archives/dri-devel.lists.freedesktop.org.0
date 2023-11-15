Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB67EBAFD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 02:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C5C10E23C;
	Wed, 15 Nov 2023 01:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111C910E23C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 01:44:29 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 33DBE6602F2D;
 Wed, 15 Nov 2023 01:44:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700012667;
 bh=G2HdRE//PMPfIFvEPPpVcfoOz5Ri+WdmmDFy6ZQPcd8=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=ZYyq9jjXR57vMgRa1L3ebvcNwd2ChtruumeASWm94tRTii+hBpktDdzYPG+NvF2Pe
 Z+ppaB0fqRlDljPxqmo1I9Lu9FFTYvtzXW+XemLDRFghNa3t54x6xhJ0JI52u3tuY8
 isBV3MRDwq2TXC7jfAK0l6+BZWeSexm912HZxde03+8ibXJhzm9G0db99qfldiqeVK
 yLE4F0FtPZvEwa7UuLv7m558mslKGaiJRQCcJpl+pvpz7pl+zyg7M6AvHEw9uc2tBJ
 ikHrOXRIFzaPMS4pC3yHchiFzHtF5S2LDnkIh1Y8/iyUAb6sC/4ry0pb2ChLsrfcnJ
 ymu419nS3VJ+Q==
Message-ID: <3404c7ca-c0aa-cf23-a2ba-521dbc339780@collabora.com>
Date: Wed, 15 Nov 2023 04:44:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] drm/virtio: Fix return value for
 VIRTGPU_CONTEXT_PARAM_DEBUG_NAME
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20231111224236.890431-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20231111224236.890431-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/23 01:42, Dmitry Osipenko wrote:
> The strncpy_from_user() returns number of copied bytes and not zero on
> success. The non-zero return value of ioctl is treated as error. Return
> zero on success instead of the number of copied bytes.
> 
> Fixes: 7add80126bce ("drm/uapi: add explicit virtgpu context debug name")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 1e2042419f95..e4f76f315550 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -665,6 +665,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>  				goto out_unlock;
>  
>  			vfpriv->explicit_debug_name = true;
> +			ret = 0;
>  			break;
>  		default:
>  			ret = -EINVAL;

Applied to misc-next

-- 
Best regards,
Dmitry

