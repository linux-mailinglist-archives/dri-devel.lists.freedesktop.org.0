Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DCDAFB2FC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 14:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE59710E45E;
	Mon,  7 Jul 2025 12:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KtXvErg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662E410E458
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 12:16:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 28EC0A53F44;
 Mon,  7 Jul 2025 12:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8F0C4CEE3;
 Mon,  7 Jul 2025 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751890567;
 bh=0zAEgYxU1v+h8sO1XcaOhqIFHOrqhdpfwO98PdDhN7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KtXvErg08CElpCA/bpoPuYqffr8dj31S0bt3MrhtUUsOCiE5B43ZX2jKuXJp6x01m
 ZaP4fXvtNN4APCbrEIpwm6DRlTkDXyg6UehQpCOG6MSES0Z1qevVyd9JdoxgGYqd6k
 KuMiV+REee5zgCnlK9w4RvVR0nzmjo1eYevMxzqokzaZJ7ugoyB71n7hu/WbfP2BoP
 58JAaR5o6E609p/AoOwU51xL1aIbStfkIC3puwesInyTMNWg+r+0WVQBuv4tklNFOV
 2PJHzdqcdpib1eNqsgJfqKV1PDWtlFC90i/onPUjGXK/F2P1cdgi/nfTY9nJi2xT3v
 UflR4TBeTRoig==
Date: Mon, 7 Jul 2025 17:45:59 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 11/12] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
Message-ID: <aGu6f3VJ1KTzRHGG@sumit-X1>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-11-024e3221b0b9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-11-024e3221b0b9@oss.qualcomm.com>
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

On Mon, May 26, 2025 at 11:56:56PM -0700, Amirreza Zarrabi wrote:
> Enable userspace to allocate shared memory with QTEE. Since
> QTEE handles shared memory as object, a wrapper is implemented
> to represent tee_shm as an object. The shared memory identifier,
> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/Makefile         |   1 +
>  drivers/tee/qcomtee/call.c           |  10 +-
>  drivers/tee/qcomtee/mem_obj.c        | 172 +++++++++++++++++++++++++++++++++++
>  drivers/tee/qcomtee/primordial_obj.c |  50 ++++++++++
>  drivers/tee/qcomtee/qcomtee.h        |  39 ++++++++
>  drivers/tee/qcomtee/shm.c            |   3 -
>  6 files changed, 270 insertions(+), 5 deletions(-)

Looks good to me, feel free to add:

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

> 
> diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
> index 78f8e899d143..7c466c9f32af 100644
> --- a/drivers/tee/qcomtee/Makefile
> +++ b/drivers/tee/qcomtee/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
>  qcomtee-objs += async.o
>  qcomtee-objs += call.o
>  qcomtee-objs += core.o
> +qcomtee-objs += mem_obj.o
>  qcomtee-objs += primordial_obj.o
>  qcomtee-objs += shm.o
>  qcomtee-objs += user_obj.o
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index cd117295fce3..b3074d1bbae4 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -114,8 +114,8 @@ void qcomtee_context_del_qtee_object(struct tee_param *param,
>   * &enum qcomtee_arg_type value. It gets the object's refcount in @arg;
>   * the caller should manage to put it afterward.
>   *
> - * For user objects (i.e. (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_USER)),
> - * qcomtee_user_param_to_object() calls qcomtee_object_get() to keep a
> + * For non-QTEE objects (i.e. !(param->u.objref.flags &
> + * QCOMTEE_OBJREF_FLAG_TEE)), qcomtee_object_get() is called to keep a
>   * temporary copy for the driver as the release of objects are asynchronous
>   * and they may go away even before returning from the invocation.
>   *
> @@ -139,6 +139,9 @@ int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *param,
>  	/* param is a QTEE object: */
>  	} else if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE) {
>  		err = qcomtee_context_find_qtee_object(&arg->o, param, ctx);
> +	/* param is a memory object: */
> +	} else if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_MEM) {
> +		err = qcomtee_memobj_param_to_object(&arg->o, param, ctx);
>  	} else {
>  		err = -EINVAL;
>  	}
> @@ -185,6 +188,9 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>  		if (is_qcomtee_user_object(object))
>  			err = qcomtee_user_param_from_object(param, object,
>  							     ctx);
> +		else if (is_qcomtee_memobj_object(object))
> +			err = qcomtee_memobj_param_from_object(param, object,
> +							       ctx);
>  		else
>  			err = -EINVAL;
>  
> diff --git a/drivers/tee/qcomtee/mem_obj.c b/drivers/tee/qcomtee/mem_obj.c
> new file mode 100644
> index 000000000000..347ba98a2d97
> --- /dev/null
> +++ b/drivers/tee/qcomtee/mem_obj.c
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/mm.h>
> +
> +#include "qcomtee.h"
> +
> +/**
> + * DOC: Memory and Mapping Objects
> + *
> + * QTEE uses memory objects for memory sharing with Linux.
> + * A memory object can be a standard dma_buf or a contiguous memory range,
> + * e.g., tee_shm. A memory object should support one operation: map. When
> + * invoked by QTEE, a mapping object is generated. A mapping object supports
> + * one operation: unmap.
> + *
> + *  (1) To map a memory object, QTEE invokes the primordial object with
> + *      %QCOMTEE_OBJECT_OP_MAP_REGION operation; see
> + *      qcomtee_primordial_obj_dispatch().
> + *  (2) To unmap a memory object, QTEE releases the mapping object which
> + *      calls qcomtee_mem_object_release().
> + *
> + * The map operation is implemented in the primordial object as a privileged
> + * operation instead of qcomtee_mem_object_dispatch(). Otherwise, on
> + * platforms without shm_bridge, a user can trick QTEE into writing to the
> + * kernel memory by passing a user object as a memory object and returning a
> + * random physical address as the result of the mapping request.
> + */
> +
> +struct qcomtee_mem_object {
> +	struct qcomtee_object object;
> +	struct tee_shm *shm;
> +	/* QTEE requires these felids to be page aligned. */
> +	phys_addr_t paddr; /* Physical address of range. */
> +	size_t size; /* Size of the range. */
> +};
> +
> +#define to_qcomtee_mem_object(o) \
> +	container_of((o), struct qcomtee_mem_object, object)
> +
> +static struct qcomtee_object_operations qcomtee_mem_object_ops;
> +
> +/* Is it a memory object using tee_shm? */
> +int is_qcomtee_memobj_object(struct qcomtee_object *object)
> +{
> +	return object != NULL_QCOMTEE_OBJECT &&
> +	       typeof_qcomtee_object(object) == QCOMTEE_OBJECT_TYPE_CB &&
> +	       object->ops == &qcomtee_mem_object_ops;
> +}
> +
> +static int qcomtee_mem_object_dispatch(struct qcomtee_object_invoke_ctx *oic,
> +				       struct qcomtee_object *object, u32 op,
> +				       struct qcomtee_arg *args)
> +{
> +	return -EINVAL;
> +}
> +
> +static void qcomtee_mem_object_release(struct qcomtee_object *object)
> +{
> +	struct qcomtee_mem_object *mem_object = to_qcomtee_mem_object(object);
> +
> +	/* Matching get is in qcomtee_memobj_param_to_object(). */
> +	tee_shm_put(mem_object->shm);
> +	kfree(mem_object);
> +}
> +
> +static struct qcomtee_object_operations qcomtee_mem_object_ops = {
> +	.release = qcomtee_mem_object_release,
> +	.dispatch = qcomtee_mem_object_dispatch,
> +};
> +
> +/**
> + * qcomtee_memobj_param_to_object() - OBJREF parameter to &struct qcomtee_object.
> + * @object: object returned.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_MEM flags.
> + * It calls qcomtee_object_get() to keep a copy of @object for the driver
> + * as well as a copy for QTEE.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
> +				   struct tee_param *param,
> +				   struct tee_context *ctx)
> +{
> +	struct qcomtee_mem_object *mem_object __free(kfree) = NULL;
> +	struct tee_shm *shm;
> +	int err;
> +
> +	mem_object = kzalloc(sizeof(*mem_object), GFP_KERNEL);
> +	if (!mem_object)
> +		return -ENOMEM;
> +
> +	shm = tee_shm_get_from_id(ctx, param->u.objref.id);
> +	if (IS_ERR(shm))
> +		return PTR_ERR(shm);
> +
> +	/* mem-object wrapping the memref. */
> +	err = qcomtee_object_user_init(&mem_object->object,
> +				       QCOMTEE_OBJECT_TYPE_CB,
> +				       &qcomtee_mem_object_ops, "tee-shm-%d",
> +				       shm->id);
> +	if (err) {
> +		tee_shm_put(shm);
> +
> +		return err;
> +	}
> +
> +	mem_object->paddr = shm->paddr;
> +	mem_object->size = shm->size;
> +	mem_object->shm = shm;
> +
> +	*object = &no_free_ptr(mem_object)->object;
> +	qcomtee_object_get(*object);
> +
> +	return 0;
> +}
> +
> +/* Reverse what qcomtee_memobj_param_to_object() does. */
> +int qcomtee_memobj_param_from_object(struct tee_param *param,
> +				     struct qcomtee_object *object,
> +				     struct tee_context *ctx)
> +{
> +	struct qcomtee_mem_object *mem_object;
> +
> +	mem_object = to_qcomtee_mem_object(object);
> +	/* Sure if the memobj is in a same context it is originated from. */
> +	if (mem_object->shm->ctx != ctx)
> +		return -EINVAL;
> +
> +	param->u.objref.id = mem_object->shm->id;
> +	param->u.objref.flags = QCOMTEE_OBJREF_FLAG_MEM;
> +
> +	/* Passing shm->id to userspace; drop the reference. */
> +	qcomtee_object_put(object);
> +
> +	return 0;
> +}
> +
> +/**
> + * qcomtee_mem_object_map() - Map a memory object.
> + * @object: memory object.
> + * @map_object: created mapping object.
> + * @mem_paddr: physical address of the memory.
> + * @mem_size: size of the memory.
> + * @perms: QTEE access permissions.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcomtee_mem_object_map(struct qcomtee_object *object,
> +			   struct qcomtee_object **map_object, u64 *mem_paddr,
> +			   u64 *mem_size, u32 *perms)
> +{
> +	struct qcomtee_mem_object *mem_object = to_qcomtee_mem_object(object);
> +
> +	/* Reuses the memory object as a mapping object by re-sharing it. */
> +	qcomtee_object_get(&mem_object->object);
> +
> +	*map_object = &mem_object->object;
> +	*mem_paddr = mem_object->paddr;
> +	*mem_size = mem_object->size;
> +	*perms = QCOM_SCM_PERM_RW;
> +
> +	return 0;
> +}
> diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
> index 025346cde835..556e81083f55 100644
> --- a/drivers/tee/qcomtee/primordial_obj.c
> +++ b/drivers/tee/qcomtee/primordial_obj.c
> @@ -17,18 +17,31 @@
>   * for native kernel services or privileged operations.
>   *
>   * We support:
> + *  - %QCOMTEE_OBJECT_OP_MAP_REGION to map a memory object and return mapping
> + *    object and mapping information (see qcomtee_mem_object_map()).
>   *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
>   *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
>   */
>  
> +#define QCOMTEE_OBJECT_OP_MAP_REGION 0
>  #define QCOMTEE_OBJECT_OP_YIELD 1
>  #define QCOMTEE_OBJECT_OP_SLEEP 2
>  
> +/* Mapping information format as expected by QTEE. */
> +struct qcomtee_mapping_info {
> +	u64 paddr;
> +	u64 len;
> +	u32 perms;
> +} __packed;
> +
>  static int
>  qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
>  				struct qcomtee_object *primordial_object_unused,
>  				u32 op, struct qcomtee_arg *args)
>  {
> +	struct qcomtee_mapping_info *map_info;
> +	struct qcomtee_object *mem_object;
> +	struct qcomtee_object *map_object;
>  	int err = 0;
>  
>  	switch (op) {
> @@ -36,6 +49,7 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
>  		cond_resched();
>  		/* No output object. */
>  		oic->data = NULL;
> +
>  		break;
>  	case QCOMTEE_OBJECT_OP_SLEEP:
>  		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
> @@ -47,6 +61,29 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
>  		msleep(*(u32 *)(args[0].b.addr));
>  		/* No output object. */
>  		oic->data = NULL;
> +
> +		break;
> +	case QCOMTEE_OBJECT_OP_MAP_REGION:
> +		if (qcomtee_args_len(args) != 3 ||
> +		    args[0].type != QCOMTEE_ARG_TYPE_OB ||
> +		    args[1].type != QCOMTEE_ARG_TYPE_IO ||
> +		    args[2].type != QCOMTEE_ARG_TYPE_OO ||
> +		    args[0].b.size < sizeof(struct qcomtee_mapping_info))
> +			return -EINVAL;
> +
> +		map_info = args[0].b.addr;
> +		mem_object = args[1].o;
> +
> +		qcomtee_mem_object_map(mem_object, &map_object,
> +				       &map_info->paddr, &map_info->len,
> +				       &map_info->perms);
> +
> +		args[2].o = map_object;
> +		/* One output object; pass it for cleanup to notify. */
> +		oic->data = map_object;
> +
> +		qcomtee_object_put(mem_object);
> +
>  		break;
>  	default:
>  		err = -EINVAL;
> @@ -55,8 +92,21 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
>  	return err;
>  }
>  
> +/* Called after submitting the callback response. */
> +static void qcomtee_primordial_obj_notify(struct qcomtee_object_invoke_ctx *oic,
> +					  struct qcomtee_object *unused,
> +					  int err)
> +{
> +	struct qcomtee_object *object = oic->data;
> +
> +	/* If err, QTEE did not obtain mapping object. Drop it. */
> +	if (object && err)
> +		qcomtee_object_put(object);
> +}
> +
>  static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
>  	.dispatch = qcomtee_primordial_obj_dispatch,
> +	.notify = qcomtee_primordial_obj_notify,
>  };
>  
>  struct qcomtee_object qcomtee_primordial_object = {
> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
> index f3a5c4658792..2285dfe6ab6b 100644
> --- a/drivers/tee/qcomtee/qcomtee.h
> +++ b/drivers/tee/qcomtee/qcomtee.h
> @@ -15,6 +15,7 @@
>  /* Flags relating to object reference. */
>  #define QCOMTEE_OBJREF_FLAG_TEE		BIT(0)
>  #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
> +#define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
>  
>  /**
>   * struct qcomtee - Main service struct.
> @@ -224,4 +225,42 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
>  /* (2) Primordial Object. */
>  extern struct qcomtee_object qcomtee_primordial_object;
>  
> +/* (3) Memory Object API. */
> +
> +/* Is it a memory object using tee_shm? */
> +int is_qcomtee_memobj_object(struct qcomtee_object *object);
> +
> +/**
> + * qcomtee_memobj_param_to_object() - OBJREF parameter to &struct qcomtee_object.
> + * @object: object returned.
> + * @param: TEE parameter.
> + * @ctx: context in which the conversion should happen.
> + *
> + * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_MEM flags.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
> +				   struct tee_param *param,
> +				   struct tee_context *ctx);
> +
> +/* Reverse what qcomtee_memobj_param_to_object() does. */
> +int qcomtee_memobj_param_from_object(struct tee_param *param,
> +				     struct qcomtee_object *object,
> +				     struct tee_context *ctx);
> +
> +/**
> + * qcomtee_mem_object_map() - Map a memory object.
> + * @object: memory object.
> + * @map_object: created mapping object.
> + * @mem_paddr: physical address of the memory.
> + * @mem_size: size of the memory.
> + * @perms: QTEE access permissions.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int qcomtee_mem_object_map(struct qcomtee_object *object,
> +			   struct qcomtee_object **map_object, u64 *mem_paddr,
> +			   u64 *mem_size, u32 *perms);
> +
>  #endif /* QCOMTEE_H */
> diff --git a/drivers/tee/qcomtee/shm.c b/drivers/tee/qcomtee/shm.c
> index ab1182bb84ee..ae04458492be 100644
> --- a/drivers/tee/qcomtee/shm.c
> +++ b/drivers/tee/qcomtee/shm.c
> @@ -117,9 +117,6 @@ static int qcomtee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
>  static int pool_op_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
>  			 size_t size, size_t align)
>  {
> -	if (!(shm->flags & TEE_SHM_PRIV))
> -		return -ENOMEM;
> -
>  	return tee_dyn_shm_alloc_helper(shm, size, align, qcomtee_shm_register);
>  }
>  
> 
> -- 
> 2.34.1
> 
