Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430B5B2E93
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CCC10E9E0;
	Fri,  9 Sep 2022 06:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4031C10E9E0;
 Fri,  9 Sep 2022 06:14:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BBF5FB82344;
 Fri,  9 Sep 2022 06:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A0BC43470;
 Fri,  9 Sep 2022 06:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662704043;
 bh=kw2dkKapmBdeUxKCFuCUxywUJ8AJ5uLV3TGjyc6c7yk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sdE6HxDvTOTMB+VtkzLd3DTwwL9UaN2TRpU6l7gflC7q6ffgLXiWhJPRJF4WBH25L
 EYu+4RYIzmZ0KaDc6ai9BiwGrHj+HUn64wXLA1+wVG5M7YhsMd4nUfaCOndJADmPgY
 eg/+9xQ0nIctHg9JG8gteBIWykHmFO7Uk8x569cg=
Date: Fri, 9 Sep 2022 08:14:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 05/15] mei: pxp: add command streamer API to the PXP
 driver
Message-ID: <YxrZqW2l7cNF5OTI@kroah.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-6-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909001612.728451-6-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 08, 2022 at 05:16:02PM -0700, Daniele Ceraolo Spurio wrote:
> +static ssize_t mei_pxp_gsc_command(struct device *dev, u8 client_id, u32 fence_id,
> +				   struct scatterlist *sg_in, size_t total_in_len,
> +				   struct scatterlist *sg_out)
> +{
> +	struct mei_cl_device *cldev;
> +
> +	if (!dev || !sg_in || !sg_out)
> +		return -EINVAL;

How can these ever be NULL?  Doesn't the core control this, so why would
that happen?

Don't check for things that can never happen.

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
> index af593ec64469..a702b6ec17f7 100644
> --- a/include/drm/i915_pxp_tee_interface.h
> +++ b/include/drm/i915_pxp_tee_interface.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/mutex.h>
>  #include <linux/device.h>
> +struct scatterlist;
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

No documentation for this new callback?

The build should give you are warning :(

