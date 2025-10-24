Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE113C044E0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 06:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2C310E9C4;
	Fri, 24 Oct 2025 04:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Y7McdDrE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6CF10E9C4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:03:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761278607; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fx6tNeu44+jKL039L9enrrNP6z1uJXZ95NSvltJ5BOrUOAkEbddYbmIabG1bPHngtMb8u95iCa1HA7r1W8YMr/726XDjIgPd93oIvwMng/IpOOFcyb5xPL2FHFzqLDJQcsrRd6lG5eJd8zGhWHmbx+82DIwpI1afxYJqWrtG6e0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761278607;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NDOaKADMyDyMltSNR68GqJBLf3lWbNHHak09GIQIPA8=; 
 b=La9emBwyAZGWyNqtzNgXhStV0Jkoj8ZiGAFTEBZU7IRjTQ3W4KCjR8sLrpW4Arp3xK+jZxxfc7yK81Lrelqy7iDUVMkzNJr5RbqlpyEF36xgd1+xPN72+R+0JZdpZieOBCgQmk34jh8VWEopWhLkU7DCtpUQzN7fnf3myZdS+uk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761278607; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NDOaKADMyDyMltSNR68GqJBLf3lWbNHHak09GIQIPA8=;
 b=Y7McdDrEUghsUa599fyfeXXHhb/2MwRR5OdSddNMLdn/U26oH1Vrx+cQT90YU4Dp
 VXlhYaKJZQGmwROBKYi7fjH53erPDsz6obQ7zWh72NAY2RDPzpRO3PN6S8QOWXcRbi8
 hUAeZO6xA/QokmI6O6+U7pL1Wg+ymo2IWlqdhmvY=
Received: by mx.zohomail.com with SMTPS id 1761278605761341.5097583210113;
 Thu, 23 Oct 2025 21:03:25 -0700 (PDT)
Message-ID: <9aa46e0e-5a10-47d5-815f-8e97d42fff94@collabora.com>
Date: Fri, 24 Oct 2025 07:03:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Sergio Lopez <slp@redhat.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
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

On 4/2/25 20:45, Sergio Lopez wrote:
> There's an incresing number of machines supporting multiple page sizes
> and on these machines the host and a guest can be running, each one,
> with a different page size.
> 
> For what pertains to virtio-gpu, this is not a problem if the page size
> of the guest happens to be bigger or equal than the host, but will
> potentially lead to failures in memory allocations and/or mappings
> otherwise.
> 
> To improve this situation, we introduce here the HOST_PAGE_SIZE feature.
> This feature indicates that the host has an extended virtio_gpu_config
> structure that include it's own page size a new field.
> 
> On the second commit, we also add a new param that can be read with
> VIRTGPU_GETPARAM by userspace applications running in the guest to
> obtain the host's page size and find out the right alignment to be used
> in shared memory allocations.
> 
> There has been a discussion in virtio-comments about whether the
> information about alignment restrictions must be shared in a generic or
> in a device-specific way, favoring the latter:
> 
> https://lore.kernel.org/virtio-comment/CY8PR12MB7195B5E575099CD9CA1F2F39DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#t
> 
> v2:
>  - Rebase on top of current upstream.
>  - Make a reference in the cover to the discussion about how device
>    page alignment restrictions should be shared with the driver.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
> Sergio Lopez (2):
>       drm/virtio: introduce the HOST_PAGE_SIZE feature
>       drm/virtio: add VIRTGPU_PARAM_HOST_PAGE_SIZE to params
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c |  5 +++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   | 13 ++++++++++---
>  include/uapi/drm/virtgpu_drm.h         |  1 +
>  include/uapi/linux/virtio_gpu.h        |  5 +++++
>  6 files changed, 24 insertions(+), 3 deletions(-)
> ---
> base-commit: acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
> change-id: 20250402-virtio-gpu-host-page-size-282c99dfe44c
> 
> Best regards,

Hi Sergio,

Curious if this feature still wanted. The protocol was updated many
months ago with the VIRTIO_GPU_F_BLOB_ALIGNMENT addition.

-- 
Best regards,
Dmitry
