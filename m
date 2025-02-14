Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AD5A36427
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5023210E354;
	Fri, 14 Feb 2025 17:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="I7XGqFdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC87010E354
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:13:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739553200; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gjXqQx0PN9fIBRAdPXvG2V1D2iMEDJwYwHKwJ9gnYH6Zvmsgnw0M0i4WLydKUT9HumwYlmmRQb2DyEZUL+LPw+rGqlAI5nJNxPY5VrGTOy/vN6ZHWUDTGOR6EJJuJPf4eVWNHIuCyJabAgB2vei3ZJkPpJ0GityFpHocL0Hcx1g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739553200;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rx4zOK0jMB+T5gcNOQuTYR78srSh2K1r/cPK3FfxCyk=; 
 b=Sa+a6c5dqeuoHvB8lEbCj6yju8t8zBDSkaz4QRXOzKXJP4kQsg5VKvnkRVZfOkstICpfTo7iRasOCNy30lpVSsnZOmVwLp/LKlQpFQK8dOuMRNrF9aTeqpT+PHaOTZho3n5LJWblxKBXo/sCutwf9bEa23xeSnJb1qLGl1cJ4zs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739553200; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rx4zOK0jMB+T5gcNOQuTYR78srSh2K1r/cPK3FfxCyk=;
 b=I7XGqFdWjPA5IMCXORPkrrCfozZDdiB7wzF+9HUPf4nwda+xcdRyfF8zWAoIK6ed
 M/vLUcZ+VWgyUpW/HMpb+KMp2jj+3Wr9A3gmPR9WgzBDAmQye41+0D14jcXC92T2NZJ
 msJE1Z8V1FmP0FiPFYRdxBGMi73pHhoyWEqd5OW4=
Received: by mx.zohomail.com with SMTPS id 1739553198330678.3612859142831;
 Fri, 14 Feb 2025 09:13:18 -0800 (PST)
Message-ID: <f6d6de4d-1b87-4a53-a2eb-0d9ddfbc4311@collabora.com>
Date: Fri, 14 Feb 2025 20:13:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 5/5] drm/virtio: add
 VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE to params
To: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Verkamp <dverkamp@chromium.org>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 fnkl.kernel@gmail.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
 <20250214-virtio-shm-page-size-v2-5-aa1619e6908b@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250214-virtio-shm-page-size-v2-5-aa1619e6908b@redhat.com>
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

On 2/14/25 18:16, Sergio Lopez wrote:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index c33c057365f85a2ace536f91655c903036827312..4b49635b4fe1d4256f219823341cef8e5fa8f029 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -117,6 +117,11 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
>  	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
>  		value = vgdev->has_context_init ? 1 : 0;
>  		break;
> +	case VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE:
> +		if (!vgdev->has_host_visible)
> +			return -EINVAL;

Nit: virtio_gpu_getparam_ioctl() returns EINVAL for unsupported params.
While this is a supported param, but there is no hostmem available.
Hence, should a different error code, maybe ENOENT or ENXIO.

-- 
Best regards,
Dmitry
