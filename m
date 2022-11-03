Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A8617362
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 01:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C927210E20D;
	Thu,  3 Nov 2022 00:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D192310E1FB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 00:31:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C571A61C7B;
 Thu,  3 Nov 2022 00:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE30C433C1;
 Thu,  3 Nov 2022 00:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1667435472;
 bh=tZFQi2ezr/TRrYv5Qk3okf6jnz8KjoG8g3dbndzWyfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h9+ekRWywNymN03zVYZM+oLF62BelIBCqBQH3FbqVQLig0J90HW+ZUrm5IxY4M8Sq
 Ju1J14i2A0i3PoeGB+i0f5GC2X4moKUCmXyitUy4ueWQ4fs/IPllH+t/R4o3LS7JLB
 VjMquAlLyXvDybq8zKcLnbH5vEFVzJ7ZcxVK2eCA=
Date: Thu, 3 Nov 2022 01:32:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
Message-ID: <Y2MMCIe5wND2XPqE@kroah.com>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102203405.1797491-2-ogabbay@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 10:34:03PM +0200, Oded Gabbay wrote:
> --- /dev/null
> +++ b/drivers/accel/Kconfig
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Compute Acceleration device configuration
> +#
> +# This framework provides support for compute acceleration devices, such
> +# as, but not limited to, Machine-Learning and Deep-Learning acceleration
> +# devices
> +#
> +menuconfig ACCEL
> +	tristate "Compute Acceleration Framework"
> +	depends on DRM
> +	help
> +	  Framework for device drivers of compute acceleration devices, such
> +	  as, but not limited to, Machine-Learning and Deep-Learning
> +	  acceleration devices.
> +	  If you say Y here, you need to select the module that's right for
> +	  your acceleration device from the list below.
> +	  This framework is integrated with the DRM subsystem as compute
> +	  accelerators and GPUs share a lot in common and can use almost the
> +	  same infrastructure code.
> +	  Having said that, acceleration devices will have a different
> +	  major number than GPUs, and will be exposed to user-space using
> +	  different device files, called accel/accel* (in /dev, sysfs
> +	  and debugfs)

Module name if "M" is chosen?


> +static char *accel_devnode(struct device *dev, umode_t *mode)
> +{
> +	return kasprintf(GFP_KERNEL, "accel/%s", dev_name(dev));
> +}
> +
> +static CLASS_ATTR_STRING(accel_version, 0444, "accel 1.0.0 20221018");

What is a version number doing here?

Please no, I understand that DRM has this, but it really does not make
sense for any in-kernel code.  And that's not how sysfs is supposed to
work anyway (if a file is present, the value is documented, if the file
is not present, the value is just not there, userspace has to handle
it all.)

> +
> +/**
> + * accel_sysfs_init - initialize sysfs helpers
> + *
> + * This is used to create the ACCEL class, which is the implicit parent of any
> + * other top-level ACCEL sysfs objects.
> + *
> + * You must call accel_sysfs_destroy() to release the allocated resources.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int accel_sysfs_init(void)
> +{
> +	int err;
> +
> +	accel_class = class_create(THIS_MODULE, "accel");
> +	if (IS_ERR(accel_class))
> +		return PTR_ERR(accel_class);
> +
> +	err = class_create_file(accel_class, &class_attr_accel_version.attr);

Hint, if you ever find yourself adding sysfs files "by hand" like this,
you are doing something wrong.  The driver code should create them
automatically for you by setting up default groups, _OR_ as in this
case, you shouldn't be adding the file at all :)

> +static void accel_sysfs_destroy(void)
> +{
> +	if (IS_ERR_OR_NULL(accel_class))
> +		return;
> +	class_remove_file(accel_class, &class_attr_accel_version.attr);

No need to manually destroy files when you remove a device.  But you
will remove this file anyway for the next version of this patch, so it's
not a big deal :)

> +	class_destroy(accel_class);
> +	accel_class = NULL;
> +}
> +
> +static int accel_stub_open(struct inode *inode, struct file *filp)
> +{
> +	DRM_DEBUG("Operation not supported");

ftrace is wonderful, please use that and not hand-rolled custom "I am
here!" type messages like this.

thanks,

greg k-h
