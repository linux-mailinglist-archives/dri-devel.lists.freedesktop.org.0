Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FB9A5945
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 05:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABB910E010;
	Mon, 21 Oct 2024 03:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="eABmSe3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E279710E010
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 03:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729481852; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jRJ2VP5mHsOuXEbAhPNfiD6Dhlsf1gK2j6ZPzqL+JzBoP+2OllDEnp1pbv/f+hdLoQPhKNahc2nCq/3SKdk9mxqQuKSbZmEfAbFDLhFTh4QUFgzef8AE1w2hLzmlDZGjhgPpYEFysTxjXIyNcHMINTL1jZQQHPoxWkslvIp1Rws=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729481852;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=91aVOCdibwIsgAY3KHOv6i29NSUgHzs13wwvqXtwb+g=; 
 b=gdSLlZ/19s3yPqBE0TN84RjXNnNLqbRAoC5L0a0dKJf/p/LIh4o03Jhw6nsLYGWQfTC6B5nweWxL8p7no4TKUnD1t6ljmj0UrIF0qUow4RaovcoNWj6UJxb+ebUOWIdodmRTds4yeeQe/kPG5zqugH4tDFXTMVrOBCfp1D6Xj8k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729481852; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=91aVOCdibwIsgAY3KHOv6i29NSUgHzs13wwvqXtwb+g=;
 b=eABmSe3jKnR0d1c6CHRMxBu1+NW7pg8ctbCbCUuTps8v+h8RQTJwCSkuHsrnSFTC
 42pmWuv6b3BvdKWcGxyNu5+eJGvKjcTo4eEcfQzoH5HIP9YI0scS4W33Wys548l+dHm
 wHmhYcUY9m11QWKkBEpWO+d6zlSgQUziiO295yEQ=
Received: by mx.zohomail.com with SMTPS id 1729481850397911.4216817106519;
 Sun, 20 Oct 2024 20:37:30 -0700 (PDT)
Message-ID: <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
Date: Mon, 21 Oct 2024 06:37:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240813035509.3360760-3-vivek.kasireddy@intel.com>
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

On 8/13/24 06:49, Vivek Kasireddy wrote:
> +long virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
> +				unsigned int *nents,
> +				struct virtio_gpu_object *bo,
> +				struct dma_buf_attachment *attach)
> +{
> +	struct scatterlist *sl;
> +	struct sg_table *sgt;
> +	long i, ret;
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	ret = dma_resv_wait_timeout(attach->dmabuf->resv,
> +				    DMA_RESV_USAGE_KERNEL,
> +				    false, MAX_SCHEDULE_TIMEOUT);

Why this wait is needed?

-- 
Best regards,
Dmitry
