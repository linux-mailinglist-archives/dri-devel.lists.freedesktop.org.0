Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C079A8D6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 16:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1493110E30D;
	Mon, 11 Sep 2023 14:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C4F10E30D;
 Mon, 11 Sep 2023 14:45:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 24FA86607307;
 Mon, 11 Sep 2023 15:45:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694443529;
 bh=Vbh5fxfeHsI//pUJImwbrwXNHPplRmRgcHeWYzo5SFQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZxEFB2G2VxvoIVzWgRfty+RtK47nanwaOEdssKkHqlndUhjR31wNkkytWiXhtwIFD
 TqzcjTGbMijeW1qZyuVHm7ci1HD1zbf+R2l5GZqK8dBrjHYjqMRLZz4ZoK4xkQjean
 sRRJT3JGU8X5MTDQ0Wfvk9WU/VSTUb9fYenhlkgxrYVUb1MyQsQzrsuWwyQ/vdNhct
 +U4RjNUQ9AF5WHV4R7Q9VJzPCcKTr3EpJPqubV2SKCx1uEUnY9SZcT/WFXEzKRUpIF
 NGhQQYp8dzmhSoaIGC/ilJ7OcfsV2yY0xrOceiWedf6sO+IvXb9an4Rsdx5ghOdUEL
 vh7arZ801o0jw==
Date: Mon, 11 Sep 2023 16:45:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <20230911164526.0192a686@collabora.com>
In-Reply-To: <20230909153125.30032-7-dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat,  9 Sep 2023 17:31:13 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> @@ -807,6 +1262,14 @@ drm_gpuvm_bo_destroy(struct kref *kref)
>  
>  	drm_gem_gpuva_assert_lock_held(vm_bo->obj);
>  
> +	spin_lock(&gpuvm->extobj.lock);
> +	list_del(&vm_bo->list.entry.extobj);
> +	spin_unlock(&gpuvm->extobj.lock);
> +
> +	spin_lock(&gpuvm->evict.lock);
> +	list_del(&vm_bo->list.entry.evict);
> +	spin_unlock(&gpuvm->evict.lock);
> +
>  	list_del(&vm_bo->list.entry.gem);
>  
>  	drm_gem_object_put(obj);

I ran into a UAF situation when the drm_gpuvm_bo object is the last
owner of obj, because the lock that's supposed to be held when calling
this function (drm_gem_gpuva_assert_lock_held() call above), belongs to
obj (either obj->resv, or a driver specific lock that's attached to the
driver-specific GEM object). I worked around it by taking a ref to obj
before calling lock()+drm_gpuvm_bo_put()+unlock(), and releasing it
after I'm node with the lock, but that just feels wrong.
