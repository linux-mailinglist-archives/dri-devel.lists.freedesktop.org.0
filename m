Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6733CAF8722
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 07:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC49910E929;
	Fri,  4 Jul 2025 05:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K+7fvisO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C559910E28F;
 Fri,  4 Jul 2025 05:15:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 68E9F43802;
 Fri,  4 Jul 2025 05:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8841C4CEE3;
 Fri,  4 Jul 2025 05:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751606100;
 bh=7B5mXApoyD9cRUyBfr6KEQm1gWkVd5OPEB6n9hnnaHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K+7fvisO68yIKz3/uoJhqR1JrKOwoCkR9XFQdnvnAIIba19bev6sfguF3NEidiRcj
 mwi0zgUSE8Z+vV4vxYkwuXRQtjij9gs9e8pdGaYJfPBmyug2vadnFdHgnbtI3K5t6H
 DHYgXdnGszxllWL6G9RKY/88XOgV64s0EGjXYzW4=
Date: Fri, 4 Jul 2025 07:14:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v6 02/10] mei: late_bind: add late binding component driver
Message-ID: <2025070421-cattishly-buffed-d992@gregkh>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
 <20250703193106.954536-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703193106.954536-3-badal.nilawar@intel.com>
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

On Fri, Jul 04, 2025 at 01:00:58AM +0530, Badal Nilawar wrote:
> From: Alexander Usyskin <alexander.usyskin@intel.com>
> 
> Add late binding component driver.
> It allows pushing the late binding configuration from, for example,
> the Xe graphics driver to the Intel discrete graphics card's CSE device.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/misc/mei/Kconfig                    |   1 +
>  drivers/misc/mei/Makefile                   |   1 +
>  drivers/misc/mei/late_bind/Kconfig          |  13 +
>  drivers/misc/mei/late_bind/Makefile         |   9 +
>  drivers/misc/mei/late_bind/mei_late_bind.c  | 272 ++++++++++++++++++++

Why do you have a whole subdir for a single .c file?  What's wrong with
just keepign it in drivers/misc/mei/ ?

> +/**
> + * struct csc_heci_late_bind_req - late binding request
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @flags: flags to be passed to the firmware
> + * @reserved: reserved field

Reserved for what?  Set to what?

> + * @payload_size: size of the payload data in bytes
> + * @payload: data to be sent to the firmware
> + */
> +struct csc_heci_late_bind_req {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 flags;
> +	u32 reserved[2];
> +	u32 payload_size;

As these cross the kernel boundry, they should be the correct type
(__u32), but really, please define the endiness of them (__le32) and use
the proper macros for that.

> +	u8  payload[] __counted_by(payload_size);
> +} __packed;
> +
> +/**
> + * struct csc_heci_late_bind_rsp - late binding response
> + * @header: @ref mkhi_msg_hdr
> + * @type: type of the late binding payload
> + * @reserved: reserved field

Same here.

> + * @status: status of the late binding command execution by firmware
> + */
> +struct csc_heci_late_bind_rsp {
> +	struct mkhi_msg_hdr header;
> +	u32 type;
> +	u32 reserved[2];
> +	u32 status;

Same on the types.

> +} __packed;
> +
> +static int mei_late_bind_check_response(const struct device *dev, const struct mkhi_msg_hdr *hdr)
> +{
> +	if (hdr->group_id != MKHI_GROUP_ID_GFX) {
> +		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
> +			hdr->group_id, MKHI_GROUP_ID_GFX);
> +		return -EINVAL;
> +	}
> +
> +	if (hdr->command != GFX_SRV_MKHI_LATE_BINDING_RSP) {
> +		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
> +			hdr->command, GFX_SRV_MKHI_LATE_BINDING_RSP);
> +		return -EINVAL;
> +	}
> +
> +	if (hdr->result) {
> +		dev_err(dev, "Error in result: 0x%x\n", hdr->result);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mei_late_bind_push_config(struct device *dev, enum late_bind_type type, u32 flags,
> +				     const void *payload, size_t payload_size)
> +{
> +	struct mei_cl_device *cldev;
> +	struct csc_heci_late_bind_req *req = NULL;
> +	struct csc_heci_late_bind_rsp rsp;
> +	size_t req_size;
> +	ssize_t bytes;
> +	int ret;
> +
> +	cldev = to_mei_cl_device(dev);
> +
> +	ret = mei_cldev_enable(cldev);
> +	if (ret) {
> +		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
> +		return ret;
> +	}
> +
> +	req_size = struct_size(req, payload, payload_size);
> +	if (req_size > mei_cldev_mtu(cldev)) {
> +		dev_err(dev, "Payload is too big %zu\n", payload_size);
> +		ret = -EMSGSIZE;
> +		goto end;
> +	}
> +
> +	req = kmalloc(req_size, GFP_KERNEL);
> +	if (!req) {
> +		ret = -ENOMEM;
> +		goto end;
> +	}
> +
> +	req->header.group_id = MKHI_GROUP_ID_GFX;
> +	req->header.command = GFX_SRV_MKHI_LATE_BINDING_CMD;
> +	req->type = type;
> +	req->flags = flags;
> +	req->reserved[0] = 0;
> +	req->reserved[1] = 0;
> +	req->payload_size = payload_size;
> +	memcpy(req->payload, payload, payload_size);
> +
> +	bytes = mei_cldev_send_timeout(cldev,
> +				       (void *)req, req_size, LATE_BIND_SEND_TIMEOUT_MSEC);
> +	if (bytes < 0) {
> +		dev_err(dev, "mei_cldev_send failed. %zd\n", bytes);
> +		ret = bytes;
> +		goto end;
> +	}
> +
> +	bytes = mei_cldev_recv_timeout(cldev,
> +				       (void *)&rsp, sizeof(rsp), LATE_BIND_RECV_TIMEOUT_MSEC);
> +	if (bytes < 0) {
> +		dev_err(dev, "mei_cldev_recv failed. %zd\n", bytes);
> +		ret = bytes;
> +		goto end;
> +	}
> +	if (bytes < sizeof(rsp.header)) {
> +		dev_err(dev, "bad response header from the firmware: size %zd < %zu\n",
> +			bytes, sizeof(rsp.header));
> +		ret = -EPROTO;
> +		goto end;
> +	}
> +	if (mei_late_bind_check_response(dev, &rsp.header)) {
> +		dev_err(dev, "bad result response from the firmware: 0x%x\n",
> +			*(uint32_t *)&rsp.header);
> +		ret = -EPROTO;
> +		goto end;
> +	}
> +	if (bytes < sizeof(rsp)) {
> +		dev_err(dev, "bad response from the firmware: size %zd < %zu\n",
> +			bytes, sizeof(rsp));
> +		ret = -EPROTO;
> +		goto end;
> +	}
> +
> +	dev_dbg(dev, "%s status = %u\n", __func__, rsp.status);

dev_dbg() already contains __func__, you never need to add it again as
you now have duplicate strings.  Please remove it.


> +	ret = (int)rsp.status;
> +end:
> +	mei_cldev_disable(cldev);
> +	kfree(req);
> +	return ret;
> +}
> +
> +static const struct late_bind_component_ops mei_late_bind_ops = {
> +	.owner = THIS_MODULE,

I thought you were going to drop the .owner stuff?

Or if not, please implement it properly (i.e. by NOT forcing people to
manually set it here.)

thanks,

greg k-h
