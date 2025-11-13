Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8AEC556AE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 03:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3896110E1B1;
	Thu, 13 Nov 2025 02:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ewVT+7dU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A86C10E1B1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 02:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763000452; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kmYOQaxioT9b5FLQ51Jl3oYVHY06BtNudAk0KzUakVNkhQ/EBiCMDfV5Xou9XH2H+iFNStnj92rooJRlrfJg6QqRpfPLh4G6iiQ73FSCKlZpIf7lbOsmSFjXEp9EGwIaeCQOQKPuYjkiW61hVc5nT9Nz7LURBVA1KD4BEBp7J2o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763000452;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=CXbCEYcoIZPhCKLcaNaYTRUshcOwu+FGWa82wu+M1QI=; 
 b=aRrDgyATyFQFm498va5cwdmPwrDHf0E0xL4a1jFgkYs22kE2el96hSV1SEoWETzp2G3Uvgfz9ZiIJQ93L7V1ZSi/yrJyJr+3tXdEcZ+ql4HzINY1zklP6BS4X2qOT4Dgy6o0Xm3vZ4ywwQMgN0JmNhn5WV4RKaWjkK1Ayn0vtGI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763000452; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=CXbCEYcoIZPhCKLcaNaYTRUshcOwu+FGWa82wu+M1QI=;
 b=ewVT+7dUej6DO3PGZypeXdikOfDqH8ybtF9oPhy5bgrD9tbxNiryBKL9A4vxnTYy
 AxqQvyxUUk/qnPKQmL6eK7hVNOaHQS8I6CBtY8vRTdf7eJk1rJdwZfjcpqsxxLuqkMd
 gwXRnNnBAacnb/VcjxGmr3HFpmeymJ+qTgMXNGVY=
Received: by mx.zohomail.com with SMTPS id 1763000449665737.2364341632508;
 Wed, 12 Nov 2025 18:20:49 -0800 (PST)
Message-ID: <43c1ee1b-a9be-489b-82f6-0f4d24a409d5@collabora.com>
Date: Thu, 13 Nov 2025 05:20:43 +0300
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
> @@ -216,8 +216,14 @@ int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
>  		return ret;
>  	}
>  
> -	virtio_gpu_cmd_resource_create_blob(vgdev, &vram->base, params, NULL,
> -					    0);
> +	ret = virtio_gpu_cmd_resource_create_blob(vgdev, &vram->base, params,
> +						  NULL, 0);
> +	if (ret) {
> +		drm_gem_free_mmap_offset(obj);
> +		kfree(vram);
> +		return ret;
> +	}

virtio_gpu_cleanup_object() shall be used to free obj, otherwise
resource_ida and etc is leaked

-- 
Best regards,
Dmitry
