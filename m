Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37E93522C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 21:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0454110E84A;
	Thu, 18 Jul 2024 19:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="u1bPjMva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8BE10E84A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721331242;
 bh=InXNEnt44O15EAqYJv2wCMP4rSAYCLw7AkyyobMSXWg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u1bPjMvan/FWz+U15sjYVsXsrUyX4kFVXPydgr4tpThmtatBaBCDye9nv5QViwumX
 dH2zG4pkMRzp8/A+l9kPdFpu1VcwxTVaR3R/oMvTZN3D/X4qq16i7BnDERBUerm2gu
 a76Hpd2lLUytghijFSFk+eDrCzwK6VaBUdQDPbVX/A08wNKfZE+pf8pZFcaVm/jaAa
 HAEquCwZSZz92hOjstkg72fKChGHKXv4MTDRbEYPTHKmW7rPAbAyNsElM6bQY+Mmfr
 RSrJ2GgKyLc16D0ZOoOdmTAUZ9XaxtXbRuNV7mCr9HX5fmjBXPhU3smeqtg1Vr9+TF
 90Yr2IpEGNIww==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D50873780626;
 Thu, 18 Jul 2024 19:34:01 +0000 (UTC)
Message-ID: <bb5ee059-08fe-4535-9a06-cba508de78d6@collabora.com>
Date: Thu, 18 Jul 2024 22:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] drm/virtio: Import prime buffers from other
 devices as guest blobs
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <20240624064841.1572452-1-vivek.kasireddy@intel.com>
 <20240624064841.1572452-5-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240624064841.1572452-5-vivek.kasireddy@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/24 09:43, Vivek Kasireddy wrote:
> +static void virtgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
> +{
> +	struct drm_gem_object *obj = attach->importer_priv;
> +	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +
> +	if (bo->created) {
> +		virtio_gpu_cmd_resource_detach_backing(vgdev,
> +						       bo->hw_res_handle);
> +		if (bo->sgt)
> +			dma_buf_unmap_attachment(attach, bo->sgt,
> +						 DMA_BIDIRECTIONAL);
> +
> +		bo->sgt = NULL;
> +	}

BO detachment should be fenced, AFAICT. See
virtio_gpu_detach_object_fenced() in [1] for example.

[1]
https://lore.kernel.org/lkml/20240105184624.508603-1-dmitry.osipenko@collabora.com/T/#me62dca570fdae39c41bdf0867c9908ef62d5cc2e


BTW, for next version please correct the list of emails recipients. I
got only patch 0 in my inbox, for patches 1-5 only Gerd Hoffmann is CC'ed.

-- 
Best regards,
Dmitry

