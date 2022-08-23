Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F306159DAD5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 13:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DB310F811;
	Tue, 23 Aug 2022 11:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1633B10F811;
 Tue, 23 Aug 2022 11:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661252833; x=1692788833;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=65rCfG6xMMeC7Jt89cuyZn1ku4TH10iIRsMVDCRrRx4=;
 b=G069nfNVRoNrPkrnlOx948mML+Jl51SQMINlP4LYD4NW8ot36mx3bywL
 EFrTN5ejDCg/ffEJ39kacXDj/MBTDcPyE9yuxWkwwJ03v8l9YCcMFvq7u
 bAr/SffotsFQCEGvYlI9kZPO1c4MFy/o/ib+BK4p0cOTzcaqmkw42OoN6
 QKt7mN7vO09jSMrUTI12pd73/vl1IZgokMEUu2kFW1FuXFZXE86fqGvCs
 vfBt7+OCzuaUR3ciMJOKmoHd8t46jv11j6u6dWULKT/KJKTVzp3uxwGim
 XkO5yUgp9xNLM5xRasIf5aUA2XLQRc03lD+pUNWsbPUsYcV8Ep9UEjC5/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="274046561"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="274046561"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:07:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="669984426"
Received: from obeltran-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.51.100])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:07:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 05/15] mei: pxp: add command streamer API
 to the PXP driver
In-Reply-To: <20220819225335.3947346-6-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
 <20220819225335.3947346-6-daniele.ceraolospurio@intel.com>
Date: Tue, 23 Aug 2022 14:07:07 +0300
Message-ID: <87bksbkylg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomas Winkler <tomas.winkler@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Aug 2022, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> From: Vitaly Lubart <vitaly.lubart@intel.com>
>
> The discrete graphics card with GSC firmware
> using command streamer API hence it requires to enhance
> pxp module with the new gsc_command() handler.
>
> The handler is implemented via mei_pxp_gsc_command() which is
> just just a thin wrapper around mei_cldev_send_gsc_command()
>
> V2:
>  1. More detailed commit message
>  2. Fix typo in the comments
>
> Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/misc/mei/pxp/mei_pxp.c       | 28 ++++++++++++++++++++++++++++
>  include/drm/i915_pxp_tee_interface.h |  5 +++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
> index 5c39457e3f53..17c5d201603f 100644
> --- a/drivers/misc/mei/pxp/mei_pxp.c
> +++ b/drivers/misc/mei/pxp/mei_pxp.c
> @@ -77,10 +77,38 @@ mei_pxp_receive_message(struct device *dev, void *buffer, size_t size)
>  	return byte;
>  }
>  
> +/**
> + * mei_pxp_gsc_command() - sends a gsc command, by sending
> + * a sgl mei message to gsc and receiving reply from gsc
> + *
> + * @dev: device corresponding to the mei_cl_device
> + * @client_id: client id to send the command to
> + * @fence_id: fence id to send the command to
> + * @sg_in: scatter gather list containing addresses for rx message buffer
> + * @total_in_len: total length of data in 'in' sg, can be less than the sum of buffers sizes
> + * @sg_out: scatter gather list containing addresses for tx message buffer
> + *
> + * Return: bytes sent on Success, <0 on Failure
> + */
> +static ssize_t mei_pxp_gsc_command(struct device *dev, u8 client_id, u32 fence_id,
> +				   struct scatterlist *sg_in, size_t total_in_len,
> +				   struct scatterlist *sg_out)
> +{
> +	struct mei_cl_device *cldev;
> +
> +	if (!dev || !sg_in || !sg_out)
> +		return -EINVAL;
> +
> +	cldev = to_mei_cl_device(dev);
> +
> +	return mei_cldev_send_gsc_command(cldev, client_id, fence_id, sg_in, total_in_len, sg_out);
> +}
> +
>  static const struct i915_pxp_component_ops mei_pxp_ops = {
>  	.owner = THIS_MODULE,
>  	.send = mei_pxp_send_message,
>  	.recv = mei_pxp_receive_message,
> +	.gsc_command = mei_pxp_gsc_command,
>  };
>  
>  static int mei_component_master_bind(struct device *dev)
> diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_tee_interface.h
> index af593ec64469..67d44a1827f9 100644
> --- a/include/drm/i915_pxp_tee_interface.h
> +++ b/include/drm/i915_pxp_tee_interface.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/mutex.h>
>  #include <linux/device.h>
> +#include <linux/scatterlist.h>

A forward declaration is enough. Ditto for struct device instead of
including device.h.

BR,
Jani.

>  
>  /**
>   * struct i915_pxp_component_ops - ops for PXP services.
> @@ -23,6 +24,10 @@ struct i915_pxp_component_ops {
>  
>  	int (*send)(struct device *dev, const void *message, size_t size);
>  	int (*recv)(struct device *dev, void *buffer, size_t size);
> +	ssize_t (*gsc_command)(struct device *dev, u8 client_id, u32 fence_id,
> +			       struct scatterlist *sg_in, size_t total_in_len,
> +			       struct scatterlist *sg_out);
> +
>  };
>  
>  /**

-- 
Jani Nikula, Intel Open Source Graphics Center
