Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCB2B382DD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 14:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8587110E116;
	Wed, 27 Aug 2025 12:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="DMYsvwG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A333010E116
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756299133; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ez5iLcyAm0TWoQPpxjCYo0iJcmkpcbg0lKZxD43EkLggZqkKz9UPPcnRpSFzAEFnX55zbP6pQLKW1T80J/WunhglFi33mqIaZOlYrsU9bC1hfUXo4OmoX3awC7NTKCU2P32O03MAcoOFk8CKtAkSq/dGW/9rq6Gj69E8/xfpieo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756299133;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Q9sEhWFWjO3Q+Hf3t/P42wG/ICyoqfqPOOvnA17tG0I=; 
 b=nBsqJGmniSYeDOKBpfQjaEro1cJwC/UkXUKS32h1VOs4ukB/6aZFnCKdRTFOorHX8tbZS0AFaL5LqxurGkOlCIsBGNV6LCKmF6bsftq9yUuSXMxcy+ukDmy3duDszuVYAZPShUX0UTgFOO6QVVREYftalJcKYkG4ZWdm7roMmL8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756299133; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Q9sEhWFWjO3Q+Hf3t/P42wG/ICyoqfqPOOvnA17tG0I=;
 b=DMYsvwG5BLwt/NoeQPUSUOt5Sfyoya1XhAeF4WpM2dcaJme8pE9WvqSvUzIx++SQ
 O1y2eeEwfRhS3GzCR8NZFOPQusKCtYD9wu8x31nQPk0s8jWvKw4XpQG+Fot1yViDaIR
 pMLx3wSDLtk3jB6M9gc5+0c2qJSiBwTSMSC1kBXo=
Received: by mx.zohomail.com with SMTPS id 1756299131644721.8061253320444;
 Wed, 27 Aug 2025 05:52:11 -0700 (PDT)
Message-ID: <9ecf015d-d96a-40ac-a7fb-50e46c4f6e00@collabora.com>
Date: Wed, 27 Aug 2025 15:52:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: fix host visible memory detection in
 virtio-gpu
To: Honglei Huang <honglei1.huang@amd.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250827081231.1878248-1-honglei1.huang@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827081231.1878248-1-honglei1.huang@amd.com>
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

On 8/27/25 11:12, Honglei Huang wrote:
> From: Honglei Huang <Honglei1.Huang@amd.com>
> 
> Commit 206cc44588f7 ("virtio: reject shm region if length is zero")
> enhanced the validation in virtio_get_shm_region() by adding a check
> for a zero-length shared memory region.
> 
> It is performed before the underlying transport's .get_shm_region()
> implementation is called. This creates an issue in the virtio-gpu
> driver, where the `region` struct is part of a larger structure
> that is zero-initialized by drmm_kzalloc().
> 
> Consequently, the `len` field is 0 at the time of the check, causing
> virtio_get_shm_region() to return false prematurely. This prevents the
> host visible memory feature from being enabled, even when the device
> supports it.
> 
> To resolve this, this patch bypasses the inline helper and calls the
> underlying vdev->config->get_shm_region() function pointer directly.
> This ensures that the region's parameters are checked only after they
> have been populated by the transport, aligning with the intended logic.
> 
> Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_kms.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 7dfb2006c561..ed5981248302 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -174,8 +174,10 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
>  		vgdev->has_resource_blob = true;
>  	}
> -	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
> -				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
> +	if (vgdev->vdev->config->get_shm_region &&
> +	    vgdev->vdev->config->get_shm_region(
> +		    vgdev->vdev, &vgdev->host_visible_region,
> +		    VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
>  		if (!devm_request_mem_region(&vgdev->vdev->dev,
>  					     vgdev->host_visible_region.addr,
>  					     vgdev->host_visible_region.len,

Hi, virtio_get_shm_region() change has been reverted by [1]. Don't think
anything else needs to be done.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250827&id=ced17ee32a9988b8a260628e7c31a100d7dc082e

+cc Michael Tsirkin

Might be only good to send a stable kernel PR with that revert. I see
patch available only in linux-next, while stable kernels need to be
fixed sooner.

-- 
Best regards,
Dmitry
