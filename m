Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B22E157FF4E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 14:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21486906D4;
	Mon, 25 Jul 2022 12:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B702BA32
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 12:51:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D1A6B80DCD;
 Mon, 25 Jul 2022 12:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBF9C341C6;
 Mon, 25 Jul 2022 12:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658753459;
 bh=rq5R6ViRqezzEg2QCXeGAAFf0M/MhLMEh9Y9kPhCsUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dhB+MLIaybwyHgnuLVDeuvhX3rnJNJld+K2syPmBtOn0/iGZXhpVXeMURkfGHraiI
 3o/0BS9KjGoUvRCcubBZFyDGTScQiwKfC9cxB4cDsqUHtv0xhEDr3s9gbk2YjMWg21
 7use+ezgMFrLWyPHjfBulZ2WOGGjq99E12rwQphA=
Date: Mon, 25 Jul 2022 14:50:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH v2 3/5] soc: visconti: Add Toshiba Visconti DNN image
 processing accelerator
Message-ID: <Yt6Rryi4SHVc4DR4@kroah.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-4-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722082858.17880-4-yuji2.ishikawa@toshiba.co.jp>
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
Cc: linaro-mm-sig@lists.linaro.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 05:28:56PM +0900, Yuji Ishikawa wrote:
> --- /dev/null
> +++ b/drivers/soc/visconti/uapi/dnn.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/* Toshiba Visconti DNN Accelerator Support
> + *
> + * (C) Copyright 2022 TOSHIBA CORPORATION
> + * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
> + */
> +
> +#ifndef _UAPI_LINUX_DNN_H
> +#define _UAPI_LINUX_DNN_H
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +#include "ipa.h"
> +
> +#define DRV_DNN_BIT_CONFIG_DESC_FINAL (0x8000U)
> +#define DRV_DNN_BUFFER_INDEX_MAX      (15)
> +
> +#define DRV_DNN_BASE_ADDR_NUM (8U) /* DNN number of base address */
> +
> +#define DRV_DNN_BASE_ADDR_PURPOSE_INPUT	    (1U)
> +#define DRV_DNN_BASE_ADDR_PURPOSE_OUTPUT    (2U)
> +#define DRV_DNN_BASE_ADDR_PURPOSE_AWB	    (3U)
> +#define DRV_DNN_BASE_ADDR_PURPOSE_TEMPORARY (4U)
> +
> +/**
> + * struct drv_dnn_status - DNN IPA status for IOC_IPA_GET_STATUS
> + *
> + * @state:     State of driver
> + * @eer_cmd:   Execution error command
> + * @eer:       Execution error
> + * @reserved:  Padding
> + * @eer_flags: Execution error flags
> + */
> +struct drv_dnn_status {
> +	enum drv_ipa_state state;
> +	__u32 eer_cmd;
> +	__u32 eer : 1;
> +	__u32 reserved : 31;

bitfields will not work like this for uapi files, sorry.

> +	__u32 eer_flags[32];

What endian is all of these?  Big?  Little?  Unknown?

> +};
> +
> +struct drv_dnn_base_addr {
> +	__u32 purpose;
> +	union {
> +		struct drv_ipa_addr ipa_addr;
> +		uintptr_t list_addr;

You really do not ever want a uintptr_t in a uapi file, that's not going
to be portable at all.  It's also not a valid kernel type :(

No documentation on what "purpose" is for?

> +	} addr;
> +};
> +
> +/**
> + * struct drv_dnn_descriptor - DNN IPA Descriptor for IOC_IPA_START
> + *
> + * @configuration:        Address of configuration data
> + * @configuration_offset: Configuration offset
> + * @configuration_size:   Configuration data size
> + * @list_num:             Number of input/output list
> + * @base_addr:            Base addresses
> + * @base_addr_flag:       Bit-fields of base_addr list config;
> + *                        0 for fixed address,
> + *                        1 for address list.

Where are the bitfield definitions?

What about unused bits, what happens with them?  You are checking them,
right?

> + * @config_done:          Flags of called configuration
> + * @buffer_info:          Table of buffer information
> + * @buffer_info_num:      Number of buffer_info
> + */
> +struct drv_dnn_descriptor {
> +	struct drv_ipa_addr configuration;
> +	__u32 configuration_offset;

What endian are any of these?

thanks,

greg k-h
