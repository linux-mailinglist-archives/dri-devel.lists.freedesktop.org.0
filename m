Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B554BBB161E
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 19:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B1B10E6F6;
	Wed,  1 Oct 2025 17:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Czo+Xqsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D36E10E6F6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 17:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759340593; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=P1eRn4BuyIrg3LMuaFMln9tH0y7z/eJMfuQdxaMFRJpqREo04TUhNkrLzqVOqGupr8SXp55J3eroYQFbrty1mD1XkerYtNrgwYaBWzsACJtqMZTWW00XA3b6c3OW5Z3pr9UV6I2ou5gQpR+TpZW2QJaxFhROo3TGGMX1Hy6SP04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759340593;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=5vTFg/4afzwXwKfYS7yfB1o9lUTup8xyFiGUTlZCCTI=; 
 b=coO57NSCWQrSDjg7NmWVVURajeTgGsfwOFETQJKJK7RtxXZWhPkCFk+LeS1sEJV97f5olekO0s8CYPeQ0VkE1G2DVWeOfXQjK01dsx5JtqI9qMt2uMDtrCbvrnHRA5dvHZvG+BGX1h0y/RttMB9ItzbuW07jXOFzhTxSsFkIo8M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759340593; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=5vTFg/4afzwXwKfYS7yfB1o9lUTup8xyFiGUTlZCCTI=;
 b=Czo+Xqsu+yKjap7jt0f7YG0AdJsLI/DGjwec/QhZwbyJ06GWNL0HhB/cMAbnOg0p
 m37TyZ24H7X16l2iaSNyH82kapt+jAD37dz3DyREJpsl9DvbBLCgbN+iAZMa0UnpZSG
 R920j1e42W3L/nUx3E8bxWqZ2ZIHV0kCXYiIMA30=
Received: by mx.zohomail.com with SMTPS id 1759340592019170.62597523534396;
 Wed, 1 Oct 2025 10:43:12 -0700 (PDT)
Message-ID: <bd6cfa71-2e43-4109-8ad0-20bde0e34da2@collabora.com>
Date: Wed, 1 Oct 2025 20:43:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-3-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924194755.1265531-3-dongwon.kim@intel.com>
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

On 9/24/25 22:47, dongwon.kim@intel.com wrote:
>  }
>  
> +static void virtio_gpu_object_add_restore_list(struct virtio_gpu_device *vgdev,
> +					       struct virtio_gpu_object *bo,
> +					       struct virtio_gpu_object_params *params)
> +{
> +	struct virtio_gpu_object_restore *new;
> +
> +	new = kvmalloc(sizeof(*new), GFP_KERNEL);
> +	if (!new) {
> +		DRM_ERROR("Fail to allocate virtio_gpu_object_restore");
> +		return;
> +	}
> +
> +	new->bo = bo;
> +	memcpy(&new->params, params, sizeof(*params));
> +
> +	list_add_tail(&new->node, &vgdev->obj_restore);

Would be good if you could embed struct virtio_gpu_object_restore into
BO itself and don't have extra kmalloc.

-- 
Best regards,
Dmitry
