Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B840C556EA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 03:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EE710E1B7;
	Thu, 13 Nov 2025 02:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="HLSrsczI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32DF10E1B7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 02:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763000905; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QOXoLRPKZJnnSuO9Fyo1Vep1RIhLKfUSt+sCW6+HMBSWPbRRdECmashijBYT/x4eZda2U/U3A/Zkjl7f/SZE8AD9Xq+KKbcwoUCm+reZ6NiOrZuiCdH4N6KKTg6LWy3hD4CR6IUxM00mPNDjQfHTK7AzX1cQIU3B2sv+BKJHjU0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763000905;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=WVo+VYg/7XEVG4AiQ+g7ZNcwWrXnBYHst4gCom/13Xo=; 
 b=QahlkIr0EYqBWhHcx6FZ1cxoyXKKeSMB9Nf/RJ5jpMdXg5u+WGPDMvwS4gu3kt8o2WGvf2SPbfctmImFw+UKWg0ANJ6O1AaAcxMFaj/K2/i47lARmZeD55knybjbFmsVLzt7Xns52tpsk7zQJQAak+ogLFXiQWyLsHBnOAhC/IU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763000905; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=WVo+VYg/7XEVG4AiQ+g7ZNcwWrXnBYHst4gCom/13Xo=;
 b=HLSrsczITCgGyJq1D983V9K8vp7fWe2q8t4XizklLm372A78ob2gpAlLjtAAYnC3
 VArhuR5fRThF+KIWljm76a+DgMRoMGekmCYjUbcWAtKEHJA/dO2bFlDEqv8A99LoBXF
 S9baNhpz8o8DTBcKSZH9lnakVl949tkFwQPoA3+c=
Received: by mx.zohomail.com with SMTPS id 1763000902278326.27648556926727;
 Wed, 12 Nov 2025 18:28:22 -0800 (PST)
Message-ID: <7f06489d-0ed8-4d7b-a152-9cb35e04dbb0@collabora.com>
Date: Thu, 13 Nov 2025 05:28:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/virtio: honor blob_alignment requirements
To: Sergio Lopez <slp@redhat.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251110125213.12633-1-slp@redhat.com>
 <20251110125213.12633-3-slp@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20251110125213.12633-3-slp@redhat.com>
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

On 11/10/25 15:52, Sergio Lopez wrote:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 8181b22b9b46..d558ba2d213a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1393,6 +1393,10 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
>  	struct virtio_gpu_vbuffer *vbuf;
>  	struct virtio_gpu_resp_map_info *resp_buf;
>  
> +	if (vgdev->has_blob_alignment &&
> +	    !IS_ALIGNED(offset, vgdev->blob_alignment))
> +		return -EINVAL;

The vram offset should have been validated when obj is created. Checking
offset here on cmd_map() should be unnecessary.

-- 
Best regards,
Dmitry
