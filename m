Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A59D79F8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 03:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A0F10E37F;
	Mon, 25 Nov 2024 02:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="W2d3IVEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC15310E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 02:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732500493; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Rcjo4T90+jTfT5/oBxA3zb0C4ef6sD/y6hGfGBqBlk2z3ugPnbEyo11k8V06e1a3n7aI3YeT1P3eyG7Xh00MX8LPpg97rpn7UngXQq/g9PPeHtdb7O/7V2/SLHMRM2PxRwlYt/SD2aITh4fsL8wTVb7eyIVWDgh9fowKdaqFtjM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732500493;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xOtefBU6j+6o6rC9dOi4/mXj7Zd15QT5CqV5CaLZ6Z4=; 
 b=itzqCJaXrpjRTsDNvYQ+oPnp1Vk/Pb4yTNA9yUVRDjZCljnl7RCqOf+JWE3aOkZY+Ek1utGRwpYMHSSiHrmhDG9Jved/8C2JVyxykqkt0p25dUDbTS2wxdjNzt8r6OUKAyFTutaVaahQmPB5oMs4/WbNpVNxB7bubXwmTvI4x6Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732500493; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=xOtefBU6j+6o6rC9dOi4/mXj7Zd15QT5CqV5CaLZ6Z4=;
 b=W2d3IVErwg8zVO6y4gJXh9CXJCk85CgS2spgPsJorkOyKZ6KgxRHKtTer+KbQCZ2
 /8csVjUByi0M9Wt4nkkf1mwutluC++Wk2J7isDH1oq8NC5JPVDbm/kL7EQR0NuNR0E5
 TJh5IQ4aLnobmZCmqI+RIg8bsyHqWpsAQP+B0C5g=
Received: by mx.zohomail.com with SMTPS id 1732500490815630.2956022126572;
 Sun, 24 Nov 2024 18:08:10 -0800 (PST)
Message-ID: <ecd03abf-2ef2-43e0-8566-ddbe7ee13c47@collabora.com>
Date: Mon, 25 Nov 2024 05:08:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/virtio: Add helpers to initialize and free the
 imported object
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20241119060248.3312553-1-vivek.kasireddy@intel.com>
 <20241119060248.3312553-4-vivek.kasireddy@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241119060248.3312553-4-vivek.kasireddy@intel.com>
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

On 11/19/24 08:59, Vivek Kasireddy wrote:
> +static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
> +{
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> +	struct dma_buf_attachment *attach = obj->import_attach;
> +
> +	if (attach) {
> +		if (bo->sgt)
> +			dma_buf_unmap_attachment(attach, bo->sgt,
> +						 DMA_BIDIRECTIONAL);

Is virtio_gpu_detach_object_fenced(bo) missing here?


-- 
Best regards,
Dmitry
