Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA92CD0E3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311A16E0C2;
	Thu,  3 Dec 2020 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC4C6EA4E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 16:34:08 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fc7c1ff0000>; Wed, 02 Dec 2020 08:34:07 -0800
Received: from [172.27.12.209] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 16:33:56 +0000
Subject: Re: [PATCH rdma-core v3 2/6] verbs: Support dma-buf based memory
 region
To: Jianxin Xiong <jianxin.xiong@intel.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-3-git-send-email-jianxin.xiong@intel.com>
From: Yishai Hadas <yishaih@nvidia.com>
Message-ID: <665e6e34-bfe4-1b59-bf74-8d8ae8c98ea2@nvidia.com>
Date: Wed, 2 Dec 2020 18:33:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606510543-45567-3-git-send-email-jianxin.xiong@intel.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606926847; bh=6Mpo+eYUpaIkQgz7JZbOeiUI7XI15BmGW47jLRDFGA8=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=Lj9FzOn4BiY4w/tPP5aD+2Z/snsJigN4BU5CsuII/gqAZM46xRzOBfZwQzWi77nnu
 6gNQBM2U77tG7Czg63KcBzpco3KpV5yaYKofSJMmTsN08ZzmAJnWDKyILG/xDr68k7
 rHJy65clXtO9ix4zoIukTxYgNYx7XmIR8hfRRp9eHN/W+PDNVs+KKYoGsFg9P3QOol
 qHfTT8YcesYw+YR/aVSVGM8KotDvUzp4J/rvw5HUoe3M1avZ8kLPRcuT9eUVp5L1Uc
 oGJjlbRJ8KJltiYRaBd97Kuxp820g9sPMYw35oTAcegystFXWPXwrWX4/5p49A7scw
 Ih4nnV+UFfw1A==
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon
 Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/27/2020 10:55 PM, Jianxin Xiong wrote:
> Add new API function and new provider method for registering dma-buf
> based memory region. Update the man page and bump the API version.
>
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> ---
>   debian/libibverbs1.symbols   |  2 ++
>   libibverbs/CMakeLists.txt    |  2 +-
>   libibverbs/cmd_mr.c          | 38 ++++++++++++++++++++++++++++++++++++++
>   libibverbs/driver.h          |  7 +++++++
>   libibverbs/dummy_ops.c       | 11 +++++++++++
>   libibverbs/libibverbs.map.in |  6 ++++++
>   libibverbs/man/ibv_reg_mr.3  | 27 +++++++++++++++++++++++++--
>   libibverbs/verbs.c           | 18 ++++++++++++++++++
>   libibverbs/verbs.h           | 11 +++++++++++
>   9 files changed, 119 insertions(+), 3 deletions(-)


This version still didn't handle the fork() note that was given on 
previous one.

Was that missed ?


> diff --git a/debian/libibverbs1.symbols b/debian/libibverbs1.symbols
> index 9130f41..fcf4d87 100644
> --- a/debian/libibverbs1.symbols
> +++ b/debian/libibverbs1.symbols
> @@ -9,6 +9,7 @@ libibverbs.so.1 libibverbs1 #MINVER#
>    IBVERBS_1.9@IBVERBS_1.9 30
>    IBVERBS_1.10@IBVERBS_1.10 31
>    IBVERBS_1.11@IBVERBS_1.11 32
> + IBVERBS_1.12@IBVERBS_1.12 33
>    (symver)IBVERBS_PRIVATE_33 33
>    _ibv_query_gid_ex@IBVERBS_1.11 32
>    _ibv_query_gid_table@IBVERBS_1.11 32
> @@ -99,6 +100,7 @@ libibverbs.so.1 libibverbs1 #MINVER#
>    ibv_rate_to_mbps@IBVERBS_1.1 1.1.8
>    ibv_rate_to_mult@IBVERBS_1.0 1.1.6
>    ibv_read_sysfs_file@IBVERBS_1.0 1.1.6
> + ibv_reg_dmabuf_mr@IBVERBS_1.12 33
>    ibv_reg_mr@IBVERBS_1.0 1.1.6
>    ibv_reg_mr@IBVERBS_1.1 1.1.6
>    ibv_reg_mr_iova@IBVERBS_1.7 25
> diff --git a/libibverbs/CMakeLists.txt b/libibverbs/CMakeLists.txt
> index 0fe4256..d075225 100644
> --- a/libibverbs/CMakeLists.txt
> +++ b/libibverbs/CMakeLists.txt
> @@ -21,7 +21,7 @@ configure_file("libibverbs.map.in"
>   
>   rdma_library(ibverbs "${CMAKE_CURRENT_BINARY_DIR}/libibverbs.map"
>     # See Documentation/versioning.md
> -  1 1.11.${PACKAGE_VERSION}
> +  1 1.12.${PACKAGE_VERSION}
>     all_providers.c
>     cmd.c
>     cmd_ah.c
> diff --git a/libibverbs/cmd_mr.c b/libibverbs/cmd_mr.c
> index 42dbe42..95ed2d1 100644
> --- a/libibverbs/cmd_mr.c
> +++ b/libibverbs/cmd_mr.c
> @@ -1,5 +1,6 @@
>   /*
>    * Copyright (c) 2018 Mellanox Technologies, Ltd.  All rights reserved.
> + * Copyright (c) 2020 Intel Corporation.  All rights reserved.
>    *
>    * This software is available to you under a choice of one of two
>    * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -116,3 +117,40 @@ int ibv_cmd_query_mr(struct ibv_pd *pd, struct verbs_mr *vmr,
>   	return 0;
>   }
>   
> +int ibv_cmd_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
> +			  uint64_t iova, int fd, int access,
> +			  struct verbs_mr *vmr)
> +{
> +	DECLARE_COMMAND_BUFFER(cmdb, UVERBS_OBJECT_MR,
> +			       UVERBS_METHOD_REG_DMABUF_MR,
> +			       9);
> +	struct ib_uverbs_attr *handle;
> +	uint32_t lkey, rkey;
> +	int ret;
> +
> +	handle = fill_attr_out_obj(cmdb, UVERBS_ATTR_REG_DMABUF_MR_HANDLE);
> +	fill_attr_out_ptr(cmdb, UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY, &lkey);
> +	fill_attr_out_ptr(cmdb, UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY, &rkey);
> +
> +	fill_attr_in_obj(cmdb, UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE, pd->handle);
> +	fill_attr_in_uint64(cmdb, UVERBS_ATTR_REG_DMABUF_MR_OFFSET, offset);
> +	fill_attr_in_uint64(cmdb, UVERBS_ATTR_REG_DMABUF_MR_LENGTH, length);
> +	fill_attr_in_uint64(cmdb, UVERBS_ATTR_REG_DMABUF_MR_IOVA, iova);
> +	fill_attr_in_uint32(cmdb, UVERBS_ATTR_REG_DMABUF_MR_FD, fd);
> +	fill_attr_in_uint32(cmdb, UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS, access);
> +
> +	ret = execute_ioctl(pd->context, cmdb);
> +	if (ret)
> +		return errno;
> +
> +	vmr->ibv_mr.handle = read_attr_obj(UVERBS_ATTR_REG_DMABUF_MR_HANDLE,
> +					   handle);
> +	vmr->ibv_mr.context = pd->context;
> +	vmr->ibv_mr.lkey = lkey;
> +	vmr->ibv_mr.rkey = rkey;
> +	vmr->ibv_mr.pd = pd;
> +	vmr->ibv_mr.addr = (void *)offset;
> +	vmr->ibv_mr.length = length;
> +	vmr->mr_type = IBV_MR_TYPE_MR;
> +	return 0;
> +}
> diff --git a/libibverbs/driver.h b/libibverbs/driver.h
> index ab80f4b..d6a9d0a 100644
> --- a/libibverbs/driver.h
> +++ b/libibverbs/driver.h
> @@ -2,6 +2,7 @@
>    * Copyright (c) 2004, 2005 Topspin Communications.  All rights reserved.
>    * Copyright (c) 2005, 2006 Cisco Systems, Inc.  All rights reserved.
>    * Copyright (c) 2005 PathScale, Inc.  All rights reserved.
> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
>    *
>    * This software is available to you under a choice of one of two
>    * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -373,6 +374,9 @@ struct verbs_context_ops {
>   	struct ibv_mr *(*reg_dm_mr)(struct ibv_pd *pd, struct ibv_dm *dm,
>   				    uint64_t dm_offset, size_t length,
>   				    unsigned int access);
> +	struct ibv_mr *(*reg_dmabuf_mr)(struct ibv_pd *pd, uint64_t offset,
> +					size_t length, uint64_t iova,
> +					int fd, int access);
>   	struct ibv_mr *(*reg_mr)(struct ibv_pd *pd, void *addr, size_t length,
>   				 uint64_t hca_va, int access);
>   	int (*req_notify_cq)(struct ibv_cq *cq, int solicited_only);
> @@ -498,6 +502,9 @@ int ibv_cmd_advise_mr(struct ibv_pd *pd,
>   		      uint32_t flags,
>   		      struct ibv_sge *sg_list,
>   		      uint32_t num_sge);
> +int ibv_cmd_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
> +			  uint64_t iova, int fd, int access,
> +			  struct verbs_mr *vmr);
>   int ibv_cmd_alloc_mw(struct ibv_pd *pd, enum ibv_mw_type type,
>   		     struct ibv_mw *mw, struct ibv_alloc_mw *cmd,
>   		     size_t cmd_size,
> diff --git a/libibverbs/dummy_ops.c b/libibverbs/dummy_ops.c
> index e5af9e4..64ef279 100644
> --- a/libibverbs/dummy_ops.c
> +++ b/libibverbs/dummy_ops.c
> @@ -1,5 +1,6 @@
>   /*
>    * Copyright (c) 2017 Mellanox Technologies, Inc.  All rights reserved.
> + * Copyright (c) 2020 Intel Corporation.  All rights reserved.
>    *
>    * This software is available to you under a choice of one of two
>    * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -452,6 +453,14 @@ static struct ibv_mr *reg_mr(struct ibv_pd *pd, void *addr, size_t length,
>   	return NULL;
>   }
>   
> +static struct ibv_mr *reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset,
> +				    size_t length, uint64_t iova,
> +				    int fd, int access)
> +{
> +	errno = EOPNOTSUPP;
> +	return NULL;
> +}
> +
>   static int req_notify_cq(struct ibv_cq *cq, int solicited_only)
>   {
>   	return EOPNOTSUPP;
> @@ -560,6 +569,7 @@ const struct verbs_context_ops verbs_dummy_ops = {
>   	query_srq,
>   	read_counters,
>   	reg_dm_mr,
> +	reg_dmabuf_mr,
>   	reg_mr,
>   	req_notify_cq,
>   	rereg_mr,
> @@ -689,6 +699,7 @@ void verbs_set_ops(struct verbs_context *vctx,
>   	SET_PRIV_OP_IC(vctx, set_ece);
>   	SET_PRIV_OP_IC(vctx, unimport_mr);
>   	SET_PRIV_OP_IC(vctx, unimport_pd);
> +	SET_OP(ctx, reg_dmabuf_mr);
>   
>   #undef SET_OP
>   #undef SET_OP2
> diff --git a/libibverbs/libibverbs.map.in b/libibverbs/libibverbs.map.in
> index b5ccaca..f67e1ef 100644
> --- a/libibverbs/libibverbs.map.in
> +++ b/libibverbs/libibverbs.map.in
> @@ -148,6 +148,11 @@ IBVERBS_1.11 {
>   		_ibv_query_gid_table;
>   } IBVERBS_1.10;
>   
> +IBVERBS_1.12 {
> +	global:
> +		ibv_reg_dmabuf_mr;
> +} IBVERBS_1.11;
> +
>   /* If any symbols in this stanza change ABI then the entire staza gets a new symbol
>      version. See the top level CMakeLists.txt for this setting. */
>   
> @@ -211,6 +216,7 @@ IBVERBS_PRIVATE_@IBVERBS_PABI_VERSION@ {
>   		ibv_cmd_query_srq;
>   		ibv_cmd_read_counters;
>   		ibv_cmd_reg_dm_mr;
> +		ibv_cmd_reg_dmabuf_mr;
>   		ibv_cmd_reg_mr;
>   		ibv_cmd_req_notify_cq;
>   		ibv_cmd_rereg_mr;
> diff --git a/libibverbs/man/ibv_reg_mr.3 b/libibverbs/man/ibv_reg_mr.3
> index 2bfc955..a522527 100644
> --- a/libibverbs/man/ibv_reg_mr.3
> +++ b/libibverbs/man/ibv_reg_mr.3
> @@ -3,7 +3,7 @@
>   .\"
>   .TH IBV_REG_MR 3 2006-10-31 libibverbs "Libibverbs Programmer's Manual"
>   .SH "NAME"
> -ibv_reg_mr, ibv_reg_mr_iova, ibv_dereg_mr \- register or deregister a memory region (MR)
> +ibv_reg_mr, ibv_reg_mr_iova, ibv_reg_dmabuf_mr, ibv_dereg_mr \- register or deregister a memory region (MR)
>   .SH "SYNOPSIS"
>   .nf
>   .B #include <infiniband/verbs.h>
> @@ -15,6 +15,10 @@ ibv_reg_mr, ibv_reg_mr_iova, ibv_dereg_mr \- register or deregister a memory reg
>   .BI "                               size_t " "length" ", uint64_t " "hca_va" ,
>   .BI "                               int " "access" );
>   .sp
> +.BI "struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd " "*pd" ", uint64_t " "offset" ,
> +.BI "                                 size_t " "length" ", uint64_t " "iova" ,
> +.BI "                                 int " "fd" ", int " "access" );
> +.sp
>   .BI "int ibv_dereg_mr(struct ibv_mr " "*mr" );
>   .fi
>   .SH "DESCRIPTION"
> @@ -71,11 +75,30 @@ a lkey or rkey. The offset in the memory region is computed as 'addr +
>   (iova - hca_va)'. Specifying 0 for hca_va has the same effect as
>   IBV_ACCESS_ZERO_BASED.
>   .PP
> +.B ibv_reg_dmabuf_mr()
> +registers a dma-buf based memory region (MR) associated with the protection domain
> +.I pd\fR.
> +The MR starts at
> +.I offset
> +of the dma-buf and its size is
> +.I length\fR.
> +The dma-buf is identified by the file descriptor
> +.I fd\fR.
> +The argument
> +.I iova
> +specifies the virtual base address of the MR when accessed through a lkey or rkey.
> +It must have the same page offset as
> +.I offset\fR.
> +The argument
> +.I access
> +describes the desired memory protection attributes; it is similar to the ibv_reg_mr case except that only the following flags are supported:
> +.B IBV_ACCESS_LOCAL_WRITE, IBV_ACCESS_REMOTE_WRITE, IBV_ACCESS_REMOTE_READ, IBV_ACCESS_REMOTE_ATOMIC, IBV_ACCESS_RELAXED_ORDERING.
> +.PP
>   .B ibv_dereg_mr()
>   deregisters the MR
>   .I mr\fR.
>   .SH "RETURN VALUE"
> -.B ibv_reg_mr() / ibv_reg_mr_iova()
> +.B ibv_reg_mr() / ibv_reg_mr_iova() / ibv_reg_dmabuf_mr()
>   returns a pointer to the registered MR, or NULL if the request fails.
>   The local key (\fBL_Key\fR) field
>   .B lkey
> diff --git a/libibverbs/verbs.c b/libibverbs/verbs.c
> index 2b0ede8..6293462 100644
> --- a/libibverbs/verbs.c
> +++ b/libibverbs/verbs.c
> @@ -1,6 +1,7 @@
>   /*
>    * Copyright (c) 2005 Topspin Communications.  All rights reserved.
>    * Copyright (c) 2006, 2007 Cisco Systems, Inc.  All rights reserved.
> + * Copyright (c) 2020 Intel Corperation.  All rights reserved.
>    *
>    * This software is available to you under a choice of one of two
>    * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -367,6 +368,23 @@ void ibv_unimport_mr(struct ibv_mr *mr)
>   	get_ops(mr->context)->unimport_mr(mr);
>   }
>   
> +struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset,
> +				 size_t length, uint64_t iova, int fd,
> +				 int access)
> +{
> +	struct ibv_mr *mr;
> +
> +	mr = get_ops(pd->context)->reg_dmabuf_mr(pd, offset, length, iova,
> +						 fd, access);
> +	if (mr) {
> +		mr->context = pd->context;
> +		mr->pd      = pd;
> +		mr->addr    = (void *)offset;
> +		mr->length  = length;
> +	}
> +	return mr;
> +}
> +
>   LATEST_SYMVER_FUNC(ibv_rereg_mr, 1_1, "IBVERBS_1.1",
>   		   int,
>   		   struct ibv_mr *mr, int flags,
> diff --git a/libibverbs/verbs.h b/libibverbs/verbs.h
> index ee57e05..1a0af0e 100644
> --- a/libibverbs/verbs.h
> +++ b/libibverbs/verbs.h
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2004, 2011-2012 Intel Corporation.  All rights reserved.
>    * Copyright (c) 2005, 2006, 2007 Cisco Systems, Inc.  All rights reserved.
>    * Copyright (c) 2005 PathScale, Inc.  All rights reserved.
> + * Copyright (c) 2020 Intel Corporation.  All rights reserved.
>    *
>    * This software is available to you under a choice of one of two
>    * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -1961,6 +1962,10 @@ struct ibv_context_ops {
>   	void *(*_compat_attach_mcast)(void);
>   	void *(*_compat_detach_mcast)(void);
>   	void *(*_compat_async_event)(void);
> +	struct ibv_mr *		(*reg_dmabuf_mr)(struct ibv_pd *pd,
> +						 uint64_t offset, size_t length,
> +						 uint64_t iova, int fd,
> +						 int access);
>   };
>   
>   struct ibv_context {
> @@ -2535,6 +2540,12 @@ __ibv_reg_mr_iova(struct ibv_pd *pd, void *addr, size_t length, uint64_t iova,
>   			  __builtin_constant_p(                                \
>   				  ((access) & IBV_ACCESS_OPTIONAL_RANGE) == 0))
>   
> +/**
> + * ibv_reg_dmabuf_mr - Register a dambuf-based memory region
> + */
> +struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
> +				 uint64_t iova, int fd, int access);
> +
>   enum ibv_rereg_mr_err_code {
>   	/* Old MR is valid, invalid input */
>   	IBV_REREG_MR_ERR_INPUT = -1,


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
