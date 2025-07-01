Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28865AEFF7E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8150010E2CA;
	Tue,  1 Jul 2025 16:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="A2yWOcBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E774410E2CA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 16:20:57 +0000 (UTC)
Message-ID: <c546bd16-d362-4271-b6d5-5ebba1b559e8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1751386855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsV30E+M704BomUrkn9PaQIcf3RDWG//2ZtptNdsDA0=;
 b=A2yWOcBkKm0V6uzksttO9DBc1IYm96E3Vvxtrq5Z9TXIqPNwT7RttZndqTh6maKEJkVLA2
 2B63mJZ8va7CAiU9WJY0ON9DgN4JLLt4gId7R4WtTXfFikGGxarFkUS4spQfBMdYjKRWhA
 BapVu02JI/9aH/FJRM5LAFs2sHHo4dk=
Date: Wed, 2 Jul 2025 00:20:42 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/gem-shmem: Do not map s/g table by default
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: christian.koenig@amd.com, oushixiong@kylinos.cn,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, simona@ffwll.ch,
 melissa.srw@gmail.com, airlied@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 dri-devel@lists.freedesktop.org, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20250630143537.309052-1-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20250630143537.309052-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

On 2025/6/30 22:34, Thomas Zimmermann wrote:
> The vast majority of drivers that use GEM-SHMEM helpers do not use
> an s/g table for imported buffers; specifically all drivers that use
> DRM_GEM_SHMEM_DRIVER_OPS. Therefore convert the initializer macro
> to DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT and remove the latter. This
> helps to avoid swiotbl errors, such as seen with some Aspeed systems
> 
>   ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
> 
> The error is caused by the system's limited DMA capabilities and can
> happen with any GEM-SHMEM-based driver. It results in a performance
> penalty.
> 
> In the case of vgem and vkms, the devices do not support DMA at all,
> which can result in failure to map the buffer object into the kernel's
> address space. [1][2] Avoiding the s/g table fixes this problem.
> 
> The other drivers based on GEM-SHMEM, imagination, lima, panfrost,
> panthor, v3d and virtio, use the s/g table of imported buffers. Neither
> driver uses the default initializer, so they won't be affected by
> this change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
> Closes: https://lore.kernel.org/dri-devel/6d22bce3-4533-4cfa-96ba-64352b715741@linux.dev/ # [1]
> Reported-by: José Expósito <jose.exposito89@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/20250311172054.2903-1-jose.exposito89@gmail.com/ # [2]

Tested-by: Zenghui Yu <zenghui.yu@linux.dev>

Thanks!
