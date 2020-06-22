Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47601204066
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 21:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2106E8C7;
	Mon, 22 Jun 2020 19:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81BC6E156;
 Mon, 22 Jun 2020 19:30:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g18so8829791wrm.2;
 Mon, 22 Jun 2020 12:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wIz2fxyJWX5nrUWTsvGpZwEGo68Own2v4V5TIKYuKeM=;
 b=JYMnCxYXiET/lonw0pp9l46R/rRDPA9XoSyvUzv5/O3V9Cnu+i/C/nzga/dBivorCR
 Oc1obl0Pljww26yb+urCN5jcaTI8W1UpLmkY6rcUD3VsdM7i3jKlJKQae+YkXfiTyx4x
 Bcn4XUslKbdCaoZ2ZKYb897b/BWY93T88AaExzy338Bw1EsjFe0LbEKbWFIN08v9Ax40
 TdMG0GjXL8nR3/qq7DOk2LbxYJm9uO2tOmzocfOTwO4adjth1052/7fatXeC0OPXBNwL
 RtHrApAt2vnQbU7bJ6arqOuTQA3kmxxWlts0wWFZxj+E3ToK9MsWi5T4w2CsX8GWlZ5j
 oZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wIz2fxyJWX5nrUWTsvGpZwEGo68Own2v4V5TIKYuKeM=;
 b=suNMNgLiEQUsgGxujGtrnlr8RPBxUce4JQQsRdzADjGGMpADL1GH3yll6Bk8AXyyMf
 zcQRs1tfHV9p6wNCZ1JlmxGXKABF7qE5Xx0uffiJs+nxbSKWaJCTXxHGPVSTMPIh+u/p
 w/qwqpqDqihrMUfuZPNpvzWG2x1lAZVq1ueraNhPHe20m4ua/qdllyXL2CjSxoXjgSni
 trZK1j1ipXr7tWGKGRUngpUWvvGiC2QSMRyuD2EyM7vutDhxk/7n/geSrudOP4wooDk3
 O9+G+Zynhdzahzv0AL03elUdOl3QfUHMphCGbk/qc5NwRFA3ofT407YaOcgKwjGHq3N8
 7kyw==
X-Gm-Message-State: AOAM530NewekKuVXS9XvEgqpqiPAnLpbBQMNvoKhu8JOafG9aUwpvR3k
 I5wfKhDIejIpDNx7a8Pq+dY=
X-Google-Smtp-Source: ABdhPJwjJFOTfh0hXLbn6lTfNeF0wxjFiBrK4qS0CqWp60rTog4OrSPE3fCu6mlHFMglnHjwdOG6RQ==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr15644694wrq.184.1592854206562; 
 Mon, 22 Jun 2020 12:30:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b201sm597846wmb.36.2020.06.22.12.30.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 12:30:05 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] drm/ttm: Remap all page faults to per process
 dummy page.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-3-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <80798cef-1adc-088b-ee0c-54c13a31c425@gmail.com>
Date: Mon, 22 Jun 2020 21:30:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1592719388-13819-3-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.20 um 08:03 schrieb Andrey Grodzovsky:
> On device removal reroute all CPU mappings to dummy page per drm_file
> instance or imported GEM object.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 65 ++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 57 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 389128b..2f8bf5e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -35,6 +35,8 @@
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/drm_vma_manager.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
>   #include <linux/mm.h>
>   #include <linux/pfn_t.h>
>   #include <linux/rbtree.h>
> @@ -328,19 +330,66 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>   	pgprot_t prot;
>   	struct ttm_buffer_object *bo = vma->vm_private_data;
>   	vm_fault_t ret;
> +	int idx;
> +	struct drm_device *ddev = bo->base.dev;
>   
> -	ret = ttm_bo_vm_reserve(bo, vmf);
> -	if (ret)
> -		return ret;
> +	if (drm_dev_enter(ddev, &idx)) {

Better do this like if (!drm_dev_enter(...)) return ttm_bo_vm_dummy(..);

This way you can move all the dummy fault handling into a separate 
function without cluttering this one here to much.

Christian.

> +		ret = ttm_bo_vm_reserve(bo, vmf);
> +		if (ret)
> +			goto exit;
> +
> +		prot = vma->vm_page_prot;
>   
> -	prot = vma->vm_page_prot;
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
> -	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> +		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
> +		if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> +			goto exit;
> +
> +		dma_resv_unlock(bo->base.resv);
> +
> +exit:
> +		drm_dev_exit(idx);
>   		return ret;
> +	} else {
>   
> -	dma_resv_unlock(bo->base.resv);
> +		struct drm_file *file = NULL;
> +		struct page *dummy_page = NULL;
> +		int handle;
>   
> -	return ret;
> +		/* We are faulting on imported BO from dma_buf */
> +		if (bo->base.dma_buf && bo->base.import_attach) {
> +			dummy_page = bo->base.dummy_page;
> +		/* We are faulting on non imported BO, find drm_file owning the BO*/
> +		} else {
> +			struct drm_gem_object *gobj;
> +
> +			mutex_lock(&ddev->filelist_mutex);
> +			list_for_each_entry(file, &ddev->filelist, lhead) {
> +				spin_lock(&file->table_lock);
> +				idr_for_each_entry(&file->object_idr, gobj, handle) {
> +					if (gobj == &bo->base) {
> +						dummy_page = file->dummy_page;
> +						break;
> +					}
> +				}
> +				spin_unlock(&file->table_lock);
> +			}
> +			mutex_unlock(&ddev->filelist_mutex);
> +		}
> +
> +		if (dummy_page) {
> +			/*
> +			 * Let do_fault complete the PTE install e.t.c using vmf->page
> +			 *
> +			 * TODO - should i call free_page somewhere ?
> +			 */
> +			get_page(dummy_page);
> +			vmf->page = dummy_page;
> +			return 0;
> +		} else {
> +			return VM_FAULT_SIGSEGV;
> +		}
> +	}
>   }
>   EXPORT_SYMBOL(ttm_bo_vm_fault);
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
