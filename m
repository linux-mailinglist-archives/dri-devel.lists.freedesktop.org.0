Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BDB82DE78
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93F110E069;
	Mon, 15 Jan 2024 17:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CAE10E069
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 17:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705339893;
 bh=E4Uy45YloUlbWODeZe5tRDC1O4JZOezdcXmCDL9soTg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=04T03B+ztF5LtXUE+SFse2EAZymzWQbblV76qLQr9ZW1k5a7UThLEazFlsdymo4Jk
 CYmiALWodkvCefhX0xI2XGveLqjEJvfpyl814eJrtmELu6y3irFVG/9SnMLg4ed0f5
 MIGVsSgh0wAYxEPeQndlTZWKUcwG4xjqK5eXDQxQzqcCUCydSoJr5qF5WEtfZnO9HL
 sUPwTfcC851j191jbtkbE/BwxJnyiKY5PxxVNivZB06T/1Uzo2EG1M3tQE+ZYZwqqm
 g7+rtGkXhGm46PyOjn+tREsaKvsvYy2vRBu6h3vR9xpYBIiYF63+B/yF9Q+lsC6j8U
 nDgeZAISc/NqQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E55C937813E4;
 Mon, 15 Jan 2024 17:31:32 +0000 (UTC)
Date: Mon, 15 Jan 2024 18:31:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 07/14] drm/panthor: Add the MMU/VM logical block
Message-ID: <20240115183131.12a16e02@collabora.com>
In-Reply-To: <20231204173313.2098733-8-boris.brezillon@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-8-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  4 Dec 2023 18:33:00 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +static int panthor_vm_prepare_unmap_op_ctx(struct panthor_vm_op_ctx *op_ctx,
> +					   struct panthor_vm *vm,
> +					   u64 va, u64 size)
> +{
> +	u32 pt_count = 0;
> +	int ret;
> +
> +	memset(op_ctx, 0, sizeof(*op_ctx));
> +	INIT_LIST_HEAD(&op_ctx->returned_vmas);
> +	op_ctx->va.range = size;
> +	op_ctx->va.addr = va;
> +	op_ctx->flags = DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP;
> +
> +	/* Pre-allocate L3 page tables to account for the split-2M-block
> +	 * situation on unmap.
> +	 */
> +	if (va != ALIGN(va, SZ_2M))
> +		pt_count++;
> +
> +	if (va + size != ALIGN(va + size, SZ_2M) &&
> +	    ALIGN(va + size, SZ_2M) != ALIGN(va, SZ_2M))
> +		pt_count++;
> +
> +	if (pt_count) {
> +		op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
> +							 sizeof(*op_ctx->rsvd_page_tables.pages),
> +							 GFP_KERNEL);
> +		if (!op_ctx->rsvd_page_tables.pages)
> +			goto err_cleanup;
> +
> +		ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
> +					    op_ctx->rsvd_page_tables.pages);
> +		if (ret != pt_count) {
> +			ret = -ENOMEM;
> +			goto err_cleanup;
> +		}
> +		op_ctx->rsvd_page_tables.count = pt_count;
> +	}

We also need to allocate {prev,next}_vma objects, because partial
unmaps will call sm_step_remap(), which leads to a NULL deref if we
don't pre-allocate these objects. I'm reworking the code to have a
3-entry array of preallocated VMAs instead of having
->map.{prev,new,next}_vma fields. We can then populate this array when
preparing an op_ctx, and pick from this preallocated pool in
sm_step_[re]map().

> +
> +	return 0;
> +
> +err_cleanup:
> +	panthor_vm_cleanup_op_ctx(op_ctx, vm);
> +	return ret;
> +}
