Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E0DAFC316
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CF710E11C;
	Tue,  8 Jul 2025 06:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UqoooT+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81FA10E11C;
 Tue,  8 Jul 2025 06:48:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8177D463D9;
 Tue,  8 Jul 2025 06:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A7AC4CEED;
 Tue,  8 Jul 2025 06:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751957303;
 bh=qeUqGxOe277ByVR6+gi2MS/jwDGY/IOUFs6oeGGJMkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UqoooT+TOip1ZQZfIu8N0OzsgPh0wmRxD0ZTBC7JPaikJ9ugqZRUGQdhQZmxmoUdW
 7IQD3jHnmXupUmvAw1JBRC+ub0pCnQksjdUuzwk6aIWretji0C0ofAighK5DI7gTOx
 wbDbDZMHgsnbCmgvca6e1ecXnyVloqkS9L29dg6Q=
Date: Tue, 8 Jul 2025 08:48:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v7 2/9] mei: late_bind: add late binding component driver
Message-ID: <2025070810-clinic-decode-57e6@gregkh>
References: <20250707191237.1782824-1-badal.nilawar@intel.com>
 <20250707191237.1782824-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707191237.1782824-3-badal.nilawar@intel.com>
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

On Tue, Jul 08, 2025 at 12:42:30AM +0530, Badal Nilawar wrote:
> From: Alexander Usyskin <alexander.usyskin@intel.com>
> 
> Add late binding component driver.

That says what this does, but not why, or even what "late binding"
means.

> It allows pushing the late binding configuration from, for example,
> the Xe graphics driver to the Intel discrete graphics card's CSE device.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/misc/mei/Kconfig                    |  11 +
>  drivers/misc/mei/Makefile                   |   1 +
>  drivers/misc/mei/mei_late_bind.c            | 271 ++++++++++++++++++++
>  include/drm/intel/i915_component.h          |   1 +
>  include/drm/intel/late_bind_mei_interface.h |  62 +++++
>  5 files changed, 346 insertions(+)
>  create mode 100644 drivers/misc/mei/mei_late_bind.c
>  create mode 100644 include/drm/intel/late_bind_mei_interface.h
> 
> diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
> index 7575fee96cc6..36569604038c 100644
> --- a/drivers/misc/mei/Kconfig
> +++ b/drivers/misc/mei/Kconfig
> @@ -81,6 +81,17 @@ config INTEL_MEI_VSC
>  	  This driver can also be built as a module. If so, the module
>  	  will be called mei-vsc.
>  
> +config INTEL_MEI_LATE_BIND
> +	tristate "Intel late binding support on ME Interface"
> +	depends on INTEL_MEI_ME
> +	depends on DRM_XE
> +	help
> +	  MEI Support for Late Binding for Intel graphics card.
> +
> +	  Enables the ME FW interfaces for Late Binding feature,
> +	  allowing loading of firmware for the devices like Fan
> +	  Controller by Intel Xe driver.

Where is "Late Binding feature" documented so we know what that is?  Why
wouldn't it just always be enabled and why must it be a config option?

> --- /dev/null
> +++ b/include/drm/intel/late_bind_mei_interface.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2025 Intel Corporation
> + */
> +
> +#ifndef _LATE_BIND_MEI_INTERFACE_H_
> +#define _LATE_BIND_MEI_INTERFACE_H_
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct module;

Not needed.

> +
> +/**
> + * Late Binding flags
> + * Persistent across warm reset

persistent where?

> + */
> +#define CSC_LATE_BINDING_FLAGS_IS_PERSISTENT	BIT(0)
> +
> +/**
> + * xe_late_bind_fw_type - enum to determine late binding fw type
> + */
> +enum late_bind_type {
> +	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
> +};

shouldn't you have mei_ as a prefix for the enum type and the values?

> +
> +/**
> + * Late Binding payload status
> + */
> +enum csc_late_binding_status {

Same here, what is "CSC"?

> +	CSC_LATE_BINDING_STATUS_SUCCESS           = 0,
> +	CSC_LATE_BINDING_STATUS_4ID_MISMATCH      = 1,
> +	CSC_LATE_BINDING_STATUS_ARB_FAILURE       = 2,
> +	CSC_LATE_BINDING_STATUS_GENERAL_ERROR     = 3,
> +	CSC_LATE_BINDING_STATUS_INVALID_PARAMS    = 4,
> +	CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE = 5,
> +	CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD   = 6,
> +	CSC_LATE_BINDING_STATUS_TIMEOUT           = 7,
> +};

This enum type is never used.

> +
> +/**
> + * struct late_bind_component_ops - ops for Late Binding services.
> + * @owner: Module providing the ops
> + * @push_config: Sends a config to FW.
> + */
> +struct late_bind_component_ops {
> +	/**
> +	 * @push_config: Sends a config to FW.

What is "FW"?

> +	 * @dev: device struct corresponding to the mei device

Why not pass in the mei device structure, not a 'struct device' so that
we know this is correct?

> +	 * @type: payload type
> +	 * @flags: payload flags
> +	 * @payload: payload buffer

Where are these defined?  Why are they not enums?

> +	 * @payload_size: payload buffer size

Size in what?

> +	 *
> +	 * Return: 0 success, negative errno value on transport failure,
> +	 *         positive status returned by FW
> +	 */
> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
> +			   const void *payload, size_t payload_size);
> +};
> +
> +#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
> -- 
> 2.34.1
> 
