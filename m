Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C5925FDD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 14:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646A110E7CE;
	Wed,  3 Jul 2024 12:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CaAHBbW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2769210E7CE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 12:13:38 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52cd717ec07so6558325e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 05:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720008816; x=1720613616; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mtxaln+eYprtsEzksAG32bgqEl2BdSqzdsv6oJ8D3do=;
 b=CaAHBbW/QolAk8mXHfD1zBLvxu/8INo8zBCPd/GFZs6mklF6RaGNCEGp8fbgtbRuN3
 PvQ8iA/dZDJcqcQtykzKDX9GrZc6Q/hcJJZX0R+Oyqv5zituJMmx/Yh+plSUF+UjAL25
 zs7JDDtw92CsCpx+43F6Ijq4NKy2kD+4NyXQB97KvhfmDlsG1MP937uZJQi7IEKFhBzj
 Y3Ui+4ANWUKKh2vXEnvmDpdfkhq81AOg554FV+/8tYmoWKEBCyss4y8E6zMD0JElIqoy
 wSC/gGnjs+TKSPkzWbe/MKhH+Z3vG6I2HUJeSbqfMFqsokoktq32KB2ZTfcL4isU8mi7
 Moxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720008816; x=1720613616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mtxaln+eYprtsEzksAG32bgqEl2BdSqzdsv6oJ8D3do=;
 b=K4q2wV8eU/KdPmEywY0TtmuX4VTT66nkpAfiV7eSMgyuuJN257UTsWD+/t8l2wE+o9
 1PmHSUahTOWQUeSKYoZO6Ho4cXA5ikplbUOuY5HrX3W3b4GE+2r7ZskZvMhsGyFfVLLj
 7bCNC3hfwVpD2kalgERp5dj1THdkwFG18XBxyGySMNZgM8bBkUZPQoEowgQj01bTLOTn
 3UJg65AQ/Ec216g/mgbue2+Rs9bqSujZGd6iPa4jC/MQx5RczWH23f92EIDix/O2hS2E
 B5e3OdGek65esgX6ysdPLYQxXuxp9yn26seXmItV0pYr4gmuLIiPXBTzLTZaiPwnUFMH
 2Q+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyG9ASeT1bVCGB6YOQFmb1iQ5AHItyMtQBxKf6FuRdgYds+i1K3WwpVIJpPdNZrULVHdtatnGjVVb7SMZhlr+QZauWhAnqBzqzxnMJ4Cu1
X-Gm-Message-State: AOJu0Yy+l7Fn0i3XXWcaR8Ks8wPIIP6dmnLszhmVxEVBlEpdWz92vtri
 RGrIH1sBw4lOiyeiOUspfHOr5EGH5KX2IFFk5/MqUoUG2b5Nsvkx5EfQsFo7zFE=
X-Google-Smtp-Source: AGHT+IFQ44wUPRBfO32WSa8vpRtV0atlCtlGMc+GeqNTEi7kXKHtAPFdQwa3M5ooUda+iEi7obUsJQ==
X-Received: by 2002:a05:6512:2397:b0:52e:813f:ab60 with SMTP id
 2adb3069b0e04-52e8274a125mr8917602e87.56.1720008815646; 
 Wed, 03 Jul 2024 05:13:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab27ac2sm2163437e87.129.2024.07.03.05.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 05:13:35 -0700 (PDT)
Date: Wed, 3 Jul 2024 15:13:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 1/3] firmware: qcom: implement object invoke support
Message-ID: <ink4tq3wk2jkpybiisaudkun3g2x2drfogrdw43zdpi6yh2u5g@yrvrxzxsi46g>
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
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

On Tue, Jul 02, 2024 at 10:57:36PM GMT, Amirreza Zarrabi wrote:
> Qualcomm TEE hosts Trusted Applications and Services that run in the
> secure world. Access to these resources is provided using object
> capabilities. A TEE client with access to the capability can invoke
> the object and request a service. Similarly, TEE can request a service
> from nonsecure world with object capabilities that are exported to secure
> world.
> 
> We provide qcom_tee_object which represents an object in both secure
> and nonsecure world. TEE clients can invoke an instance of qcom_tee_object
> to access TEE. TEE can issue a callback request to nonsecure world
> by invoking an instance of qcom_tee_object in nonsecure world.

Please see Documentation/process/submitting-patches.rst on how to write
commit messages.

> 
> Any driver in nonsecure world that is interested to export a struct (or a
> service object) to TEE, requires to embed an instance of qcom_tee_object in
> the relevant struct and implements the dispatcher function which is called
> when TEE invoked the service object.
> 
> We also provids simplified API which implements the Qualcomm TEE transport
> protocol. The implementation is independent from any services that may
> reside in nonsecure world.

"also" usually means that it should go to a separate commit.

> 
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
>  drivers/firmware/qcom/Kconfig                      |   14 +
>  drivers/firmware/qcom/Makefile                     |    2 +
>  drivers/firmware/qcom/qcom_object_invoke/Makefile  |    4 +
>  drivers/firmware/qcom/qcom_object_invoke/async.c   |  142 +++
>  drivers/firmware/qcom/qcom_object_invoke/core.c    | 1139 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_object_invoke/core.h    |  186 ++++
>  .../qcom/qcom_object_invoke/qcom_scm_invoke.c      |   22 +
>  .../firmware/qcom/qcom_object_invoke/release_wq.c  |   90 ++
>  include/linux/firmware/qcom/qcom_object_invoke.h   |  233 ++++
>  9 files changed, 1832 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index 7f6eb4174734..103ab82bae9f 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -84,4 +84,18 @@ config QCOM_QSEECOM_UEFISECAPP
>  	  Select Y here to provide access to EFI variables on the aforementioned
>  	  platforms.
>  
> +config QCOM_OBJECT_INVOKE_CORE
> +	bool "Secure TEE Communication Support"

tristate

> +	help
> +	  Various Qualcomm SoCs have a Trusted Execution Environment (TEE) running
> +	  in the Trust Zone. This module provides an interface to that via the
> +	  capability based object invocation, using SMC calls.
> +
> +	  OBJECT_INVOKE_CORE allows capability based secure communication between
> +	  TEE and VMs. Using OBJECT_INVOKE_CORE, kernel can issue calls to TEE or
> +	  TAs to request a service or exposes services to TEE and TAs. It implements
> +	  the necessary marshaling of messages with TEE.
> +
> +	  Select Y here to provide access to TEE.
> +
>  endmenu
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> index 0be40a1abc13..dd5e00215b2e 100644
> --- a/drivers/firmware/qcom/Makefile
> +++ b/drivers/firmware/qcom/Makefile
> @@ -8,3 +8,5 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
> +
> +obj-y += qcom_object_invoke/
> diff --git a/drivers/firmware/qcom/qcom_object_invoke/Makefile b/drivers/firmware/qcom/qcom_object_invoke/Makefile
> new file mode 100644
> index 000000000000..6ef4d54891a5
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_object_invoke/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_QCOM_OBJECT_INVOKE_CORE) += object-invoke-core.o
> +object-invoke-core-objs := qcom_scm_invoke.o release_wq.o async.o core.o
> diff --git a/drivers/firmware/qcom/qcom_object_invoke/async.c b/drivers/firmware/qcom/qcom_object_invoke/async.c
> new file mode 100644
> index 000000000000..dd022ec68d8b
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_object_invoke/async.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/kobject.h>
> +#include <linux/slab.h>
> +#include <linux/mutex.h>
> +
> +#include "core.h"
> +
> +/* Async handlers and providers. */
> +struct async_msg {
> +	struct {
> +		u32 version;	/* Protocol version: top 16b major, lower 16b minor. */
> +		u32 op;			/* Async operation. */
> +	} header;
> +
> +	/* Format of the Async data field is defined by the specified operation. */
> +
> +	struct {
> +		u32 count;	/* Number of objects that should be released. */
> +		u32 obj[];
> +	} op_release;
> +};

Another generic comment: please select some prefix (like QTEE_ / qtee_)
and use it for _all_ defines and all names in the driver.

`struct async_msg` means that it is some genric code that is applicable
to the whole kernel.

> +
> +/* Async Operations and header information. */
> +
> +#define ASYNC_HEADER_SIZE sizeof(((struct async_msg *)(0))->header)

Extract struct definition. Use sizeof(struct qtee_async_msg_header).

> +
> +/* ASYNC_OP_x: operation.
> + * ASYNC_OP_x_HDR_SIZE: header size for the operation.
> + * ASYNC_OP_x_SIZE: size of each entry in a message for the operation.
> + * ASYNC_OP_x_MSG_SIZE: size of a message with n entries.
> + */
> +
> +#define ASYNC_OP_RELEASE QCOM_TEE_OBJECT_OP_RELEASE	/* Added in minor version 0x0000. **/

Anything before minor version 0x0000 ?

> +#define ASYNC_OP_RELEASE_HDR_SIZE offsetof(struct async_msg, op_release.obj)
> +#define ASYNC_OP_RELEASE_SIZE sizeof(((struct async_msg *)(0))->op_release.obj[0])

sizeof(u32) is much better

> +#define ASYNC_OP_RELEASE_MSG_SIZE(n) \
> +	(ASYNC_OP_RELEASE_HDR_SIZE + ((n) * ASYNC_OP_RELEASE_SIZE))

struct_size(). But I think you should be able to inline and/or drop most
of these defines.

> +
> +/* async_qcom_tee_buffer return the available async buffer in the output buffer. */
> +
> +static struct qcom_tee_buffer async_qcom_tee_buffer(struct qcom_tee_object_invoke_ctx *oic)

Why do you need to return struct instance?

> +{
> +	int i;
> +	size_t offset;
> +
> +	struct qcom_tee_callback *msg = (struct qcom_tee_callback *)oic->out.msg.addr;
> +
> +	if (!(oic->flags & OIC_FLAG_BUSY))
> +		return oic->out.msg;
> +
> +	/* Async requests are appended to the output buffer after the CB message. */
> +
> +	offset = OFFSET_TO_BUFFER_ARGS(msg, counts_total(msg->counts));
> +
> +	for_each_input_buffer(i, msg->counts)
> +		offset += align_offset(msg->args[i].b.size);
> +
> +	for_each_output_buffer(i, msg->counts)
> +		offset += align_offset(msg->args[i].b.size);
> +
> +	if (oic->out.msg.size > offset) {
> +		return (struct qcom_tee_buffer)
> +			{ { oic->out.msg.addr + offset }, oic->out.msg.size - offset };
> +	}
> +
> +	pr_err("no space left for async messages! or malformed message.\n");

No spamming on the kmsg.

> +
> +	return (struct qcom_tee_buffer) { { 0 }, 0 };

This doesn't look correct.

> +}
> +

What does this function return?

> +static size_t async_release_handler(struct qcom_tee_object_invoke_ctx *oic,
> +	struct async_msg *async_msg, size_t size)

Please ident the code properly, this should be aligned to the open
bracket.

> +{
> +	int i;
> +
> +	/* We need space for at least a single entry. */
> +	if (size < ASYNC_OP_RELEASE_MSG_SIZE(1))
> +		return 0;
> +
> +	for (i = 0; i < async_msg->op_release.count; i++) {
> +		struct qcom_tee_object *object;
> +
> +		/* Remove the object from xa_qcom_tee_objects so that the object_id
> +		 * becomes invalid for further use. However, call put_qcom_tee_object
> +		 * to schedule the actual release if there is no user.
> +		 */
> +
> +		object = erase_qcom_tee_object(async_msg->op_release.obj[i]);
> +
> +		put_qcom_tee_object(object);
> +	}
> +
> +	return ASYNC_OP_RELEASE_MSG_SIZE(i);
> +}
> +
> +/* '__fetch__async_reqs' is a handler dispatcher (from TEE). */
> +
> +void __fetch__async_reqs(struct qcom_tee_object_invoke_ctx *oic)
> +{
> +	size_t consumed, used = 0;
> +
> +	struct qcom_tee_buffer async_buffer = async_qcom_tee_buffer(oic);
> +
> +	while (async_buffer.size - used > ASYNC_HEADER_SIZE) {
> +		struct async_msg *async_msg = (struct async_msg *)(async_buffer.addr + used);
> +
> +		/* TEE assumes unused buffer is set to zero. */
> +		if (!async_msg->header.version)
> +			goto out;
> +
> +		switch (async_msg->header.op) {
> +		case ASYNC_OP_RELEASE:
> +			consumed = async_release_handler(oic,
> +				async_msg, async_buffer.size - used);
> +
> +			break;
> +		default: /* Unsupported operations. */
> +			consumed = 0;
> +		}
> +
> +		used += align_offset(consumed);
> +
> +		if (!consumed) {
> +			pr_err("Drop async buffer (context_id %d): buffer %p, (%p, %zx), processed %zx\n",

Should it really go to the kmsg?

> +				oic->context_id,
> +				oic->out.msg.addr,	/* Address of Output buffer. */
> +				async_buffer.addr,	/* Address of beginning of async buffer. */
> +				async_buffer.size,	/* Available size of async buffer. */
> +				used);				/* Processed async buffer. */
> +
> +			goto out;
> +		}
> +	}
> +
> + out:
> +
> +	memset(async_buffer.addr, 0, async_buffer.size);

Why?

> +}
> diff --git a/drivers/firmware/qcom/qcom_object_invoke/core.c b/drivers/firmware/qcom/qcom_object_invoke/core.c
> new file mode 100644
> index 000000000000..37dde8946b08
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_object_invoke/core.c
> @@ -0,0 +1,1139 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/delay.h>
> +#include <linux/mm.h>
> +#include <linux/xarray.h>
> +
> +#include "core.h"
> +
> +/* Static 'Primordial Object' operations. */
> +
> +#define OBJECT_OP_YIELD	1
> +#define OBJECT_OP_SLEEP	2
> +
> +/* static_qcom_tee_object_primordial always exists. */
> +/* primordial_object_register and primordial_object_release extends it. */
> +
> +static struct qcom_tee_object static_qcom_tee_object_primordial;
> +
> +static int primordial_object_register(struct qcom_tee_object *object);
> +static void primordial_object_release(struct qcom_tee_object *object);
> +
> +/* Marshaling API. */
> +/*
> + * prepare_msg - Prepares input buffer for sending to TEE.
> + * update_args - Parses TEE response in input buffer.
> + * prepare_args - Parses TEE request from output buffer.
> + * update_msg - Updates output buffer with response for TEE request.
> + *
> + * prepare_msg and update_args are used in direct TEE object invocation.
> + * prepare_args and update_msg are used for TEE requests (callback or async).
> + */
> +
> +static int prepare_msg(struct qcom_tee_object_invoke_ctx *oic,
> +	struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[]);
> +static int update_args(struct qcom_tee_arg u[], struct qcom_tee_object_invoke_ctx *oic);
> +static int prepare_args(struct qcom_tee_object_invoke_ctx *oic);
> +static int update_msg(struct qcom_tee_object_invoke_ctx *oic);

Please reorder the functions so that you don't need forward
declarations.

> +
> +static int next_arg_type(struct qcom_tee_arg u[], int i, enum qcom_tee_arg_type type)
> +{
> +	while (u[i].type != QCOM_TEE_ARG_TYPE_END && u[i].type != type)
> +		i++;
> +
> +	return i;
> +}
> +
> +/**
> + * args_for_each_type - Iterate over argument of given type.
> + * @i: index in @args.
> + * @args: array of arguments.
> + * @at: type of argument.
> + */
> +#define args_for_each_type(i, args, at) \
> +	for (i = 0, i = next_arg_type(args, i, at); \
> +		args[i].type != QCOM_TEE_ARG_TYPE_END; i = next_arg_type(args, ++i, at))
> +
> +#define arg_for_each_input_buffer(i, args)  args_for_each_type(i, args, QCOM_TEE_ARG_TYPE_IB)
> +#define arg_for_each_output_buffer(i, args) args_for_each_type(i, args, QCOM_TEE_ARG_TYPE_OB)
> +#define arg_for_each_input_object(i, args)  args_for_each_type(i, args, QCOM_TEE_ARG_TYPE_IO)
> +#define arg_for_each_output_object(i, args) args_for_each_type(i, args, QCOM_TEE_ARG_TYPE_OO)
> +
> +/* Outside this file we use struct qcom_tee_object to identify an object. */
> +
> +/* We only allocate IDs with QCOM_TEE_OBJ_NS_BIT set in range
> + * [QCOM_TEE_OBJECT_ID_START .. QCOM_TEE_OBJECT_ID_END]. qcom_tee_object
> + * represents non-secure object. The first ID with QCOM_TEE_OBJ_NS_BIT set is reserved
> + * for primordial object.
> + */
> +
> +#define QCOM_TEE_OBJECT_PRIMORDIAL	(QCOM_TEE_OBJ_NS_BIT)
> +#define QCOM_TEE_OBJECT_ID_START	(QCOM_TEE_OBJECT_PRIMORDIAL + 1)
> +#define QCOM_TEE_OBJECT_ID_END		(UINT_MAX)
> +
> +#define SET_QCOM_TEE_OBJECT(p, type, ...) __SET_QCOM_TEE_OBJECT(p, type, ##__VA_ARGS__, 0UL)
> +#define __SET_QCOM_TEE_OBJECT(p, type, optr, ...) do { \
> +		(p)->object_type = (type); \
> +		(p)->info.object_ptr = (unsigned long)(optr); \
> +		(p)->release = NULL; \
> +	} while (0)
> +
> +/* ''TEE Object Table''. */
> +static DEFINE_XARRAY_ALLOC(xa_qcom_tee_objects);
> +
> +struct qcom_tee_object *allocate_qcom_tee_object(void)
> +{
> +	struct qcom_tee_object *object;

I thought that struct qcom_tee_object should be embedded into other
struct definitions. Here you are just allocing it. Did I misunderstand
something?

> +
> +	object = kzalloc(sizeof(*object), GFP_KERNEL);
> +	if (object)
> +		SET_QCOM_TEE_OBJECT(object, QCOM_TEE_OBJECT_TYPE_NULL);
> +
> +	return object;
> +}
> +EXPORT_SYMBOL_GPL(allocate_qcom_tee_object);

kerneldoc for all exported functions.

> +
> +void free_qcom_tee_object(struct qcom_tee_object *object)
> +{
> +	kfree(object);
> +}
> +EXPORT_SYMBOL_GPL(free_qcom_tee_object);

If qcom_tee_object is refcounted, then such API is defintely forbidden.

> +
> +/* 'get_qcom_tee_object' and 'put_qcom_tee_object'. */
> +
> +static int __free_qcom_tee_object(struct qcom_tee_object *object);

What is the difference between free_qcom_tee_object() and
__free_qcom_tee_object() ?

> +static void ____destroy_qcom_tee_object(struct kref *refcount)
> +{
> +	struct qcom_tee_object *object = container_of(refcount, struct qcom_tee_object, refcount);
> +
> +	__free_qcom_tee_object(object);
> +}
> +
> +int get_qcom_tee_object(struct qcom_tee_object *object)
> +{
> +	if (object != NULL_QCOM_TEE_OBJECT &&
> +		object != ROOT_QCOM_TEE_OBJECT)
> +		return kref_get_unless_zero(&object->refcount);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(get_qcom_tee_object);
> +
> +static struct qcom_tee_object *qcom_tee__get_qcom_tee_object(unsigned int object_id)
> +{
> +	XA_STATE(xas, &xa_qcom_tee_objects, object_id);
> +	struct qcom_tee_object *object;
> +
> +	rcu_read_lock();
> +	do {
> +		object = xas_load(&xas);
> +		if (xa_is_zero(object))
> +			object = NULL_QCOM_TEE_OBJECT;
> +
> +	} while (xas_retry(&xas, object));

If you are just looping over the objects, why do you need XArray instead
of list?

> +
> +	/* Sure object still exists. */

Why?

> +	if (!get_qcom_tee_object(object))
> +		object = NULL_QCOM_TEE_OBJECT;
> +
> +	rcu_read_unlock();
> +
> +	return object;
> +}
> +
> +struct qcom_tee_object *qcom_tee_get_qcom_tee_object(unsigned int object_id)
> +{
> +	switch (object_id) {
> +	case QCOM_TEE_OBJECT_PRIMORDIAL:
> +		return &static_qcom_tee_object_primordial;
> +
> +	default:
> +		return qcom_tee__get_qcom_tee_object(object_id);
> +	}
> +}
> +
> +void put_qcom_tee_object(struct qcom_tee_object *object)
> +{
> +	if (object != &static_qcom_tee_object_primordial &&
> +		object != NULL_QCOM_TEE_OBJECT &&
> +		object != ROOT_QCOM_TEE_OBJECT)

misaligned

> +		kref_put(&object->refcount, ____destroy_qcom_tee_object);
> +}
> +EXPORT_SYMBOL_GPL(put_qcom_tee_object);
> +
> +/* 'alloc_qcom_tee_object_id' and 'erase_qcom_tee_object'. */

huh?

I think I'm going to stop here. Please:

- Split the driver into logical chunks and more logical pieces.
- Rename functions and structures to follow generic scheme. Usually it
  is prefix_object_do_something().
- Add documentation that would allow us to understand what is going on.
- Also document some general design decisions. Usage of XArray. API
  choice. Refcounting.


[skipped]

> diff --git a/include/linux/firmware/qcom/qcom_object_invoke.h b/include/linux/firmware/qcom/qcom_object_invoke.h
> new file mode 100644
> index 000000000000..9e6acd0f4db0
> --- /dev/null
> +++ b/include/linux/firmware/qcom/qcom_object_invoke.h
> @@ -0,0 +1,233 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __QCOM_OBJECT_INVOKE_H
> +#define __QCOM_OBJECT_INVOKE_H
> +
> +#include <linux/kref.h>
> +#include <linux/completion.h>
> +#include <linux/workqueue.h>
> +#include <uapi/misc/qcom_tee.h>

This header doesn't exist yet. This obviously means that you haven't
actually tried building this patch. Please make sure that kernel
compiles successfully after each commit.

> +
> +struct qcom_tee_object;
> +
> +/* Primordial Object */
> +
> +/* It is used for bootstrapping the IPC connection between a VM and TEE.
> + *
> + * Each side (both the VM and the TEE) starts up with no object received from the
> + * other side. They both ''assume'' the other side implements a permanent initial
> + * object in the object table.
> + *
> + * TEE's initial object is typically called the ''root client env'', and it's
> + * invoked by VMs when they want to get a new clientEnv. The initial object created
> + * by the VMs is invoked by TEE, it's typically called the ''primordial object''.
> + *
> + * VM can register a primordial object using 'init_qcom_tee_object_user' with
> + * 'QCOM_TEE_OBJECT_TYPE_ROOT' type.
> + */
> +
> +enum qcom_tee_object_type {
> +	QCOM_TEE_OBJECT_TYPE_USER = 0x1,	/* TEE object. */
> +	QCOM_TEE_OBJECT_TYPE_CB_OBJECT = 0x2,	/* Callback Object. */
> +	QCOM_TEE_OBJECT_TYPE_ROOT = 0x8,	/* ''Root client env.'' or 'primordial' Object. */
> +	QCOM_TEE_OBJECT_TYPE_NULL = 0x10,	/* NULL object. */
> +};
> +
> +enum qcom_tee_arg_type {
> +	QCOM_TEE_ARG_TYPE_END = 0,
> +	QCOM_TEE_ARG_TYPE_IB  = 0x80,	/* Input Buffer (IB).  */
> +	QCOM_TEE_ARG_TYPE_OB  =	0x1,	/* Output Buffer (OB). */
> +	QCOM_TEE_ARG_TYPE_IO  = 0x81,	/* Input Object (IO).  */
> +	QCOM_TEE_ARG_TYPE_OO  = 0x2		/* Output Object (OO). */
> +};
> +
> +#define QCOM_TEE_ARG_TYPE_INPUT_MASK 0x80
> +
> +/* Maximum specific type of arguments (i.e. IB, OB, IO, and OO) that can fit in a TEE message. */
> +#define QCOM_TEE_ARGS_PER_TYPE 16

Why is it 16?

> +
> +/* Maximum arguments that can fit in a TEE message. */
> +#define QCOM_TEE_ARGS_MAX (QCOM_TEE_ARGS_PER_TYPE * 4)
> +
> +/**
> + * struct qcom_tee_arg - Argument for TEE object invocation.
> + * @type: type of argument
> + * @flags: extra flags.
> + * @b: address and size if type of argument is buffer.
> + * @o: qcom_tee_object instance if type of argument is object.
> + *
> + * @flags only accept QCOM_TEE_ARG_FLAGS_UADDR for now which states that @b
> + * contains userspace address in uaddr.
> + *
> + */
> +struct qcom_tee_arg {
> +	enum qcom_tee_arg_type type;
> +
> +/* 'uaddr' holds a __user address. */
> +#define QCOM_TEE_ARG_FLAGS_UADDR 1
> +	char flags;

This is not a character.

> +	union {
> +		struct qcom_tee_buffer {
> +			union {
> +				void *addr;
> +				void __user *uaddr;
> +			};
> +			size_t size;
> +		} b;
> +		struct qcom_tee_object *o;
> +	};

How can the code distinguish between the qcom_tee_object and
qcom_tee_buffer here?

> +};
> +
> +static inline int size_of_arg(struct qcom_tee_arg u[])

length, not size.

> +{
> +	int i = 0;
> +
> +	while (u[i].type != QCOM_TEE_ARG_TYPE_END)
> +		i++;
> +
> +	return i;
> +}
> +
> +/* Context ID - It is a unique ID assigned to a invocation which is in progress.
> + * Objects's dispatcher can use the ID to differentiate between concurrent calls.
> + * ID [0 .. 10) are reserved, i.e. never passed to object's dispatcher.

Is 10 included or excluded here? Why does it have a different bracket
type?

> + */
> +
> +struct qcom_tee_object_invoke_ctx {
> +	unsigned int context_id;
> +
> +#define OIC_FLAG_BUSY		1	/* Context is busy, i.e. callback is in progress. */
> +#define OIC_FLAG_NOTIFY		2	/* Context needs to notify the current object. */
> +#define OIC_FLAG_QCOM_TEE	4	/* Context has objects shared with TEE. */

BIT(n)

> +	unsigned int flags;
> +
> +	/* Current object invoked in this callback context. */
> +	struct qcom_tee_object *object;
> +
> +	/* Arguments passed to dispatch callback. */
> +	struct qcom_tee_arg u[QCOM_TEE_ARGS_MAX + 1];
> +
> +	int errno;
> +
> +	/* Inbound and Outbound buffers shared with TEE. */
> +	struct {
> +		struct qcom_tee_buffer msg;

Please define struct qcom_tee_buffer in a top-level definition instead
of having it nested somewhere in another struct;

> +	} in, out;
> +};
> +
> +int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> +	struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[], int *result);

What's the difference between a result that gets returned by the
function and the result that gets retuned via the pointer?

> +
> +#define QCOM_TEE_OBJECT_OP_METHOD_MASK 0x0000FFFFU
> +#define QCOM_TEE_OBJECT_OP_METHOD_ID(op) ((op) & QCOM_TEE_OBJECT_OP_METHOD_MASK)
> +
> +/* Reserved Operations. */
> +
> +#define QCOM_TEE_OBJECT_OP_RELEASE	(QCOM_TEE_OBJECT_OP_METHOD_MASK - 0)
> +#define QCOM_TEE_OBJECT_OP_RETAIN	(QCOM_TEE_OBJECT_OP_METHOD_MASK - 1)
> +#define QCOM_TEE_OBJECT_OP_NO_OP	(QCOM_TEE_OBJECT_OP_METHOD_MASK - 2)
> +
> +struct qcom_tee_object_operations {
> +	void (*release)(struct qcom_tee_object *object);
> +
> +	/**
> +	 * @op_supported:
> +	 *
> +	 * Query made to make sure the requested operation is supported. If defined,
> +	 * it is called before marshaling of the arguments (as optimisation).
> +	 */
> +	int (*op_supported)(unsigned long op);
> +
> +	/**
> +	 * @notify:
> +	 *
> +	 * After @dispatch returned, it is called to notify the status of the transport;
> +	 * i.e. transport errors or success. This allows the client to cleanup, if
> +	 * the transport fails after @dispatch submits a SUCCESS response.
> +	 */
> +	void (*notify)(unsigned int context_id,	struct qcom_tee_object *object, int status);
> +
> +	int (*dispatch)(unsigned int context_id, struct qcom_tee_object *object,
> +		unsigned long op, struct qcom_tee_arg args[]);
> +
> +	/**
> +	 * @param_to_object:
> +	 *
> +	 * Called by core to do the object dependent marshaling from @param to an
> +	 * instance of @object (NOT IMPLEMENTED YET).
> +	 */
> +	int (*param_to_object)(struct qcom_tee_param *param, struct qcom_tee_object *object);
> +
> +	int (*object_to_param)(struct qcom_tee_object *object, struct qcom_tee_param *param);
> +};
> +
> +struct qcom_tee_object {
> +	const char *name;
> +	struct kref refcount;
> +
> +	enum qcom_tee_object_type object_type;
> +	union object_info {
> +		unsigned long object_ptr;
> +	} info;
> +
> +	struct qcom_tee_object_operations *ops;
> +
> +	/* see release_wq.c. */
> +	struct work_struct work;
> +
> +	/* Callback for any internal cleanup before the object's release. */
> +	void (*release)(struct qcom_tee_object *object);
> +};
> +
> +/* Static instances of qcom_tee_object objects. */
> +
> +#define NULL_QCOM_TEE_OBJECT ((struct qcom_tee_object *)(0))
> +
> +/* ROOT_QCOM_TEE_OBJECT aka ''root client env''. */
> +#define ROOT_QCOM_TEE_OBJECT ((struct qcom_tee_object *)(1))

My gut feeling is that an invalid non-null pointer is a path to
disaster.

> +
> +static inline enum qcom_tee_object_type typeof_qcom_tee_object(struct qcom_tee_object *object)
> +{
> +	if (object == NULL_QCOM_TEE_OBJECT)
> +		return QCOM_TEE_OBJECT_TYPE_NULL;
> +
> +	if (object == ROOT_QCOM_TEE_OBJECT)
> +		return QCOM_TEE_OBJECT_TYPE_ROOT;
> +
> +	return object->object_type;
> +}
> +
> +static inline const char *qcom_tee_object_name(struct qcom_tee_object *object)
> +{
> +	if (object == NULL_QCOM_TEE_OBJECT)
> +		return "null";
> +
> +	if (object == ROOT_QCOM_TEE_OBJECT)
> +		return "root";
> +
> +	if (!object->name)
> +		return "noname";
> +
> +	return object->name;
> +}
> +
> +struct qcom_tee_object *allocate_qcom_tee_object(void);
> +void free_qcom_tee_object(struct qcom_tee_object *object);
> +
> +/**
> + * init_qcom_tee_object_user - Initialize an instance of qcom_tee_object.
> + * @object: object being initialized.
> + * @ot: type of object.
> + * @ops: sets of callback opeartions.
> + * @fmt: object name.
> + */
> +int init_qcom_tee_object_user(struct qcom_tee_object *object, enum qcom_tee_object_type ot,
> +	struct qcom_tee_object_operations *ops, const char *fmt, ...);
> +
> +int get_qcom_tee_object(struct qcom_tee_object *object);
> +void put_qcom_tee_object(struct qcom_tee_object *object);
> +
> +#endif /* __QCOM_OBJECT_INVOKE_H */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
