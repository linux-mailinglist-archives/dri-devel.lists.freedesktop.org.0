Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1745F6040EF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 12:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03FE10EACA;
	Wed, 19 Oct 2022 10:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 504 seconds by postgrey-1.36 at gabe;
 Wed, 19 Oct 2022 10:29:58 UTC
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7186D10E0C7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 10:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id AFAF93F3F2;
 Wed, 19 Oct 2022 12:21:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -5.06
X-Spam-Level: 
X-Spam-Status: No, score=-5.06 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.961,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa3.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJpU7LJKtvy4; Wed, 19 Oct 2022 12:21:31 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 0CD2B3F3B6;
 Wed, 19 Oct 2022 12:21:30 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 482CA360352;
 Wed, 19 Oct 2022 12:21:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1666174890; bh=VYeVSz10ttaKvzVGr+YcxmuaBsdH9vvcMpakFNMkef4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pq/nMU8DIVTbfnSrj3CXCeNd+U4ezTyyGzv0eSgksyCQqTYTUyjUWFdF0kcnke5Iu
 ZPIihzPnixDGxj/aP7G+cD9ZIdJvyaRjoDcMYXfL5JxJcJY5lpCCBNAfC5g0SROUL1
 1Y62ogsMomURVTGMNBiK45VhhOtIbxHGVylDusIU=
Message-ID: <968d3fa5-aa51-d388-7ec1-7c2e6dfb0911@shipmail.org>
Date: Wed, 19 Oct 2022 12:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 05/16] drm/vmwgfx: Refactor resource validation hashtable
 to use linux/hashtable implementation.
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20221017195440.311862-1-zack@kde.org>
 <20221017195440.311862-6-zack@kde.org>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20221017195440.311862-6-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/17/22 21:54, Zack Rusin wrote:
> From: Maaz Mombasawala <mombasawalam@vmware.com>
>
> Vmwgfx's hashtab implementation needs to be replaced with linux/hashtable
> to reduce maintenence burden.
> As part of this effort, refactor the res_ht hashtable used for resource
> validation during execbuf execution to use linux/hashtable implementation.
> This also refactors vmw_validation_context to use vmw_sw_context as the
> container for the hashtable, whereas before it used a vmwgfx_open_hash
> directly. This makes vmw_validation_context less generic, but there is
> no functional change since res_ht is the only instance where validation
> context used a hashtable in vmwgfx driver.

Why is a pointer to the vmw_sw_context added to the validation context, 
rather than a pointer to the new hash table type itself? Seems like an 
unnecessary indirection which adds a dependency on the sw context to the 
validation context?

> Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        | 24 ++++++++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  5 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    | 14 ++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 55 +++++++++++-----------
>   drivers/gpu/drm/vmwgfx/vmwgfx_validation.h | 26 +++-------
>   5 files changed, 58 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 13b90273eb77..8d77e79bd904 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -830,6 +830,22 @@ static void vmw_write_driver_id(struct vmw_private *dev)
>   	}
>   }
>   
> +static void vmw_sw_context_init(struct vmw_private *dev_priv)
> +{
> +	struct vmw_sw_context *sw_context = &dev_priv->ctx;
> +
> +	hash_init(sw_context->res_ht);
> +}
> +
> +static void vmw_sw_context_fini(struct vmw_private *dev_priv)
> +{
> +	struct vmw_sw_context *sw_context = &dev_priv->ctx;
> +
> +	vfree(sw_context->cmd_bounce);
> +	if (sw_context->staged_bindings)
> +		vmw_binding_state_free(sw_context->staged_bindings);
> +}
> +
>   static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
>   {
>   	int ret;
> @@ -839,6 +855,8 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
>   
>   	dev_priv->drm.dev_private = dev_priv;
>   
> +	vmw_sw_context_init(dev_priv);
> +
>   	mutex_init(&dev_priv->cmdbuf_mutex);
>   	mutex_init(&dev_priv->binding_mutex);
>   	spin_lock_init(&dev_priv->resource_lock);
> @@ -1168,9 +1186,7 @@ static void vmw_driver_unload(struct drm_device *dev)
>   
>   	unregister_pm_notifier(&dev_priv->pm_nb);
>   
> -	if (dev_priv->ctx.res_ht_initialized)
> -		vmwgfx_ht_remove(&dev_priv->ctx.res_ht);
> -	vfree(dev_priv->ctx.cmd_bounce);
> +	vmw_sw_context_fini(dev_priv);
>   	if (dev_priv->enable_fb) {
>   		vmw_fb_off(dev_priv);
>   		vmw_fb_close(dev_priv);
> @@ -1198,8 +1214,6 @@ static void vmw_driver_unload(struct drm_device *dev)
>   		vmw_irq_uninstall(&dev_priv->drm);
>   
>   	ttm_object_device_release(&dev_priv->tdev);
> -	if (dev_priv->ctx.staged_bindings)
> -		vmw_binding_state_free(dev_priv->ctx.staged_bindings);
>   
>   	for (i = vmw_res_context; i < vmw_res_max; ++i)
>   		idr_destroy(&dev_priv->res_idr[i]);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 09e2d738aa87..d87aeedb78d0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -30,6 +30,7 @@
>   
>   #include <linux/suspend.h>
>   #include <linux/sync_file.h>
> +#include <linux/hashtable.h>
>   
>   #include <drm/drm_auth.h>
>   #include <drm/drm_device.h>
> @@ -93,6 +94,7 @@
>   #define VMW_RES_STREAM ttm_driver_type2
>   #define VMW_RES_FENCE ttm_driver_type3
>   #define VMW_RES_SHADER ttm_driver_type4
> +#define VMW_RES_HT_ORDER 12
>   
>   #define MKSSTAT_CAPACITY_LOG2 5U
>   #define MKSSTAT_CAPACITY (1U << MKSSTAT_CAPACITY_LOG2)
> @@ -425,8 +427,7 @@ struct vmw_ctx_validation_info;
>    * @ctx: The validation context
>    */
>   struct vmw_sw_context{
> -	struct vmwgfx_open_hash res_ht;
> -	bool res_ht_initialized;
> +	DECLARE_HASHTABLE(res_ht, VMW_RES_HT_ORDER);
>   	bool kernel;
>   	struct vmw_fpriv *fp;
>   	struct drm_file *filp;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index f085dbd4736d..c943ab801ca7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0 OR MIT
>   /**************************************************************************
>    *
> - * Copyright 2009 - 2015 VMware, Inc., Palo Alto, CA., USA
> + * Copyright 2009 - 2022 VMware, Inc., Palo Alto, CA., USA
>    *
>    * Permission is hereby granted, free of charge, to any person obtaining a
>    * copy of this software and associated documentation files (the
> @@ -25,6 +25,7 @@
>    *
>    **************************************************************************/
>   #include <linux/sync_file.h>
> +#include <linux/hashtable.h>
>   
>   #include "vmwgfx_drv.h"
>   #include "vmwgfx_reg.h"
> @@ -34,7 +35,6 @@
>   #include "vmwgfx_binding.h"
>   #include "vmwgfx_mksstat.h"
>   
> -#define VMW_RES_HT_ORDER 12
>   
>   /*
>    * Helper macro to get dx_ctx_node if available otherwise print an error
> @@ -4101,7 +4101,7 @@ int vmw_execbuf_process(struct drm_file *file_priv,
>   	int ret;
>   	int32_t out_fence_fd = -1;
>   	struct sync_file *sync_file = NULL;
> -	DECLARE_VAL_CONTEXT(val_ctx, &sw_context->res_ht, 1);
> +	DECLARE_VAL_CONTEXT(val_ctx, sw_context, 1);
>   
>   	if (flags & DRM_VMW_EXECBUF_FLAG_EXPORT_FENCE_FD) {
>   		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
> @@ -4164,14 +4164,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
>   	if (sw_context->staged_bindings)
>   		vmw_binding_state_reset(sw_context->staged_bindings);
>   
> -	if (!sw_context->res_ht_initialized) {
> -		ret = vmwgfx_ht_create(&sw_context->res_ht, VMW_RES_HT_ORDER);
> -		if (unlikely(ret != 0))
> -			goto out_unlock;
> -
> -		sw_context->res_ht_initialized = true;
> -	}
> -
>   	INIT_LIST_HEAD(&sw_context->staged_cmd_res);
>   	sw_context->ctx = &val_ctx;
>   	ret = vmw_execbuf_tie_context(dev_priv, sw_context, dx_context_handle);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> index f46891012be3..f5c4a40fb16d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0 OR MIT
>   /**************************************************************************
>    *
> - * Copyright © 2018 VMware, Inc., Palo Alto, CA., USA
> + * Copyright © 2018 - 2022 VMware, Inc., Palo Alto, CA., USA
>    * All Rights Reserved.
>    *
>    * Permission is hereby granted, free of charge, to any person obtaining a
> @@ -180,11 +180,16 @@ vmw_validation_find_bo_dup(struct vmw_validation_context *ctx,
>   	if (!ctx->merge_dups)
>   		return NULL;
>   
> -	if (ctx->ht) {
> +	if (ctx->sw_context) {
>   		struct vmwgfx_hash_item *hash;
> +		unsigned long key = (unsigned long) vbo;
>   
> -		if (!vmwgfx_ht_find_item(ctx->ht, (unsigned long) vbo, &hash))
> -			bo_node = container_of(hash, typeof(*bo_node), hash);
> +		hash_for_each_possible_rcu(ctx->sw_context->res_ht, hash, head, key) {

This open-coded loop seems to be used throughout the conversion, and 
also in other patches. Perhaps a small helper in place?

Otherwise LGTM.

Thanks,

Thomas


