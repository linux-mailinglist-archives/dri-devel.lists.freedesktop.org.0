Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45EA3DFEF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B41E10E1EA;
	Thu, 20 Feb 2025 16:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="EduweB5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4091610E174;
 Thu, 20 Feb 2025 16:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740067826; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fK0hgpnSc7wHdnScZwsvHvmbOkyWb03c01zpIeu3IanN4S/24IADwzwMmHCxMzZh69e0QFLKw+VJlDSQ5aln/0YB2RDSXVsVBcOmmHiTso9hMIalmUv2v2fkpsh2ReLVgNiLiHMfkoe1PZI015y2wn/sO3WfP5mg6mjLzsr/2s8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740067826;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZELLhyNrX/AMU/X/XLHluCd0loXd+7aqRfqJaYVGOoE=; 
 b=ViwEYwSYLaplLiRRebA+EavTbgXaGFDif39tG9l0dYzvRf0ts/sv5Zr3fKIj0Tpa2mXGglvmOEcv8ZzesWzbD/NQRcb1JjyqPZqc3wMYU5+EunyG9GZcm9+M2YI1x2DBHIaTHIgSZWttgVwQS7+aK1fAp99vFS8yjuL3nyBC814=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740067826; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZELLhyNrX/AMU/X/XLHluCd0loXd+7aqRfqJaYVGOoE=;
 b=EduweB5KBkR0ccyYBTaR71kHlB+Cm2C1+uOYpnAGhP8fsVCU4dd1oLWvb0mZNeiJ
 5LPdG3Z1MweoTCjWRid30oQ6iHV9OeNchE42cx4IMeeJ1b4OBPQ5wC3b9rSZ5Fztbc0
 7ra/K4+6kLD4/HJUfSiWtBOZSIxhWfXx8uvFMDg0=
Received: by mx.zohomail.com with SMTPS id 1740067825336681.7729656180264;
 Thu, 20 Feb 2025 08:10:25 -0800 (PST)
Message-ID: <d2bd8baf-e1f7-4e8a-9e33-259051d6f97a@collabora.com>
Date: Thu, 20 Feb 2025 19:10:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/25] drm/virtio: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-22-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250109150310.219442-22-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 1/9/25 17:57, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch to a multiple of 4.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 5aab588fc400..22cf1cd2fdfd 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -23,6 +23,7 @@
>   * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_fourcc.h>
>  
> @@ -66,15 +67,14 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
>  	struct virtio_gpu_object_params params = { 0 };
>  	struct virtio_gpu_device *vgdev = dev->dev_private;
>  	int ret;
> -	uint32_t pitch;
> +
> +	ret = drm_mode_size_dumb(dev, args, SZ_4, 0);

Nit: I'd keep using PAGE_SIZE instead of 0 for more clarity, but that's
an optional wish.

> +	if (ret)
> +		return ret;
>  
>  	if (args->bpp != 32)
>  		return -EINVAL;
>  
> -	pitch = args->width * 4;
> -	args->size = pitch * args->height;
> -	args->size = ALIGN(args->size, PAGE_SIZE);
> -
>  	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
>  	params.width = args->width;
>  	params.height = args->height;
> @@ -92,7 +92,6 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
>  	if (ret)
>  		goto fail;
>  
> -	args->pitch = pitch;
>  	return ret;
>  
>  fail:

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

