Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEsOCsjenGl/LwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 00:12:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3417EF9D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 00:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15FD10E45F;
	Mon, 23 Feb 2026 23:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J3NJcoEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6FC10E461
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:12:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C9E7600AE;
 Mon, 23 Feb 2026 23:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521FBC116C6;
 Mon, 23 Feb 2026 23:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771888323;
 bh=lfcfBanE3QZv/KHaRe7YkLLvilXJRfDZVBkJNys21gs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J3NJcoEvhADuZ2t3SK40N1ip4xUIagFED/z6EEU6JXd2161HvEGMLzy4oxf2fgFaP
 A0650kkRXw2IeZh/8QpdhLmy4dkr9kGtzrAveXbZh/MjUPRydmWEwbod8PlDOgetxu
 Kgtpqo3vpbWXitc/1kCKdzHtfp3oaR4CTTCz9pHcZt3XxTF86d4xhOA12lemfeXINZ
 JkpU+juQBUDZM7eZTsv3qCk3sMYjAj+6PpacPs7kS0pv+tSGvgE4wGxJwFA9juJeoW
 cCt+urQ1mbOaBYD7DX2wQC0aklD94/nNVn5gTAHGmtPa8u3tZaB+7KVr4V9vaBc2ch
 b+3SU2HeBtvmg==
Date: Mon, 23 Feb 2026 17:11:59 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
Message-ID: <rvi6cqi343yoc3qyabtb72zsedtruktfba6dxstvgw4k7bzyt5@4ofj5pdmkhw6>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 82B3417EF9D
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
> Introduce a per-device memory manager for the QDA driver that tracks
> IOMMU-capable compute context-bank (CB) devices. Each CB device is
> represented by a qda_iommu_device and registered with a central
> qda_memory_manager instance owned by qda_dev.
> 

The name makes me expect that this manages memory, but it seems to
manage devices and context banks...

> The memory manager maintains an xarray of devices and assigns a
> unique ID to each CB. It also provides basic lifetime management
> and a workqueue for deferred device removal. qda_cb_setup_device()
> now allocates a qda_iommu_device for each CB and registers it with
> the memory manager after DMA configuration succeeds.
> 
> qda_init_device() is extended to allocate and initialize the memory
> manager, while qda_deinit_device() will tear it down in later
> patches.

"in later patches" makes this extremely hard to review. I had to apply
the series to try to navigate the code...

> This prepares the QDA driver for fine-grained memory and
> IOMMU domain management tied to individual CB devices.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
[..]
>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
[..]
> @@ -46,6 +52,18 @@ static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev)
>  	rc = dma_set_mask(cb_dev, DMA_BIT_MASK(pa_bits));
>  	if (rc) {
>  		qda_err(qdev, "%d bit DMA enable failed: %d\n", pa_bits, rc);
> +		kfree(iommu_dev);
> +		return rc;
> +	}
> +
> +	iommu_dev->dev = cb_dev;
> +	iommu_dev->sid = sid;
> +	snprintf(iommu_dev->name, sizeof(iommu_dev->name), "qda_iommu_dev_%u", sid);

It's not easy to follow, when you have scattered the code across so many
patches and so many files. But I don't think iommu_dev->name is ever
used.

> +
> +	rc = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);
> +	if (rc) {
> +		qda_err(qdev, "Failed to register IOMMU device: %d\n", rc);
> +		kfree(iommu_dev);
>  		return rc;
>  	}
>  
> @@ -127,6 +145,8 @@ int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>  void qda_destroy_cb_device(struct device *cb_dev)
>  {
>  	struct iommu_group *group;
> +	struct qda_iommu_device *iommu_dev;
> +	struct qda_dev *qdev;
>  
>  	if (!cb_dev) {
>  		qda_dbg(NULL, "NULL CB device passed to destroy\n");
> @@ -135,6 +155,18 @@ void qda_destroy_cb_device(struct device *cb_dev)
>  
>  	qda_dbg(NULL, "Destroying CB device %s\n", dev_name(cb_dev));
>  
> +	iommu_dev = dev_get_drvdata(cb_dev);

I'm not sure, but I think cb_dev is the struct device allocated in
qda_create_cb_device(), but I can not find a place where you set drvdata
for this device.

> +	if (iommu_dev) {
> +		if (cb_dev->parent) {
> +			qdev = dev_get_drvdata(cb_dev->parent);
> +			if (qdev && qdev->iommu_mgr) {
> +				qda_dbg(NULL, "Unregistering IOMMU device for %s\n",
> +					dev_name(cb_dev));
> +				qda_memory_manager_unregister_device(qdev->iommu_mgr, iommu_dev);
> +			}
> +		}
> +	}
> +
>  	group = iommu_group_get(cb_dev);
>  	if (group) {
>  		qda_dbg(NULL, "Removing %s from IOMMU group\n", dev_name(cb_dev));
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
[..]
> @@ -25,12 +37,46 @@ static void init_device_resources(struct qda_dev *qdev)
>  	atomic_set(&qdev->removing, 0);
>  }
>  
> +static int init_memory_manager(struct qda_dev *qdev)
> +{
> +	int ret;
> +
> +	qda_dbg(qdev, "Initializing IOMMU manager\n");
> +
> +	qdev->iommu_mgr = kzalloc_obj(*qdev->iommu_mgr, GFP_KERNEL);
> +	if (!qdev->iommu_mgr)
> +		return -ENOMEM;
> +
> +	ret = qda_memory_manager_init(qdev->iommu_mgr);
> +	if (ret) {
> +		qda_err(qdev, "Failed to initialize memory manager: %d\n", ret);

qda_memory_manager_init() already logged 1 error and 1 debug prints if
you get here.

> +		kfree(qdev->iommu_mgr);
> +		qdev->iommu_mgr = NULL;

We're going to fail probe, you shouldn't have to clear this.

> +		return ret;
> +	}
> +
> +	qda_dbg(qdev, "IOMMU manager initialized successfully\n");
> +	return 0;
> +}
> +
>  int qda_init_device(struct qda_dev *qdev)
>  {
> +	int ret;
> +
>  	init_device_resources(qdev);
>  
> +	ret = init_memory_manager(qdev);
> +	if (ret) {
> +		qda_err(qdev, "IOMMU manager initialization failed: %d\n", ret);

And now we have 2 debug prints and two error prints in the log.

> +		goto err_cleanup_resources;
> +	}
> +
>  	qda_dbg(qdev, "QDA device initialized successfully\n");

Or, if we get here, you have 8 debug prints.

Please learn how to use kprobe/kretprobe instead of reimplementing it
using printk().

>  	return 0;
> +
> +err_cleanup_resources:
> +	cleanup_device_resources(qdev);
> +	return ret;
>  }
>  
>  static int __init qda_core_init(void)
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index eb732b7d8091..2cb97e4eafbf 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -11,6 +11,7 @@
>  #include <linux/mutex.h>
>  #include <linux/rpmsg.h>
>  #include <linux/xarray.h>
> +#include "qda_memory_manager.h"
>  
>  /* Driver identification */
>  #define DRIVER_NAME "qda"
> @@ -23,6 +24,8 @@ struct qda_dev {
>  	struct device *dev;
>  	/* Mutex protecting device state */
>  	struct mutex lock;
> +	/* IOMMU/memory manager */
> +	struct qda_memory_manager *iommu_mgr;
>  	/* Flag indicating device removal in progress */
>  	atomic_t removing;
>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
> diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
[..]
> +int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
> +				       struct qda_iommu_device *iommu_dev)
> +{
> +	int ret;
> +	u32 id;
> +
> +	if (!mem_mgr || !iommu_dev || !iommu_dev->dev) {

How could this happen? You call this function from one place, that looks
like this:

iommu_dev->dev = cb_dev;
iommu_dev->sid = sid;
rc = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);

You just allocated in filled out iommu_dev.

Looking up the callstack, we're coming from qda_rpmsg_probe() which just
did qda_init_device() which created the qsdev->iommu_mgr.

In other words, these can't possibly be NULL.

> +		qda_err(NULL, "Invalid parameters for device registration\n");
> +		return -EINVAL;
> +	}
> +
> +	init_iommu_device_fields(iommu_dev, mem_mgr);
> +
> +	ret = allocate_device_id(mem_mgr, iommu_dev, &id);
> +	if (ret) {
> +		qda_err(NULL, "Failed to allocate device ID: %d (sid=%u)\n", ret, iommu_dev->sid);
> +		return ret;
> +	}
> +
> +	iommu_dev->id = id;
> +
> +	qda_dbg(NULL, "Registered device id=%u (sid=%u)\n", id, iommu_dev->sid);
> +
> +	return 0;
> +}
> +
> +void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
> +					  struct qda_iommu_device *iommu_dev)
> +{
> +	if (!mem_mgr || !iommu_dev) {

The one call to this function is wrapped in:

if (iommu_dev) {
	if (qdev->iommu_mgr) {
		qda_dbg(NULL, ...);
		qda_memory_manager_unregister_device(qdev->iommu_mgr, iommu_dev);
	}
}

> +		qda_err(NULL, "Attempted to unregister invalid device/manager\n");
> +		return;
> +	}
> +
> +	qda_dbg(NULL, "Unregistering device id=%u (refcount=%u)\n", iommu_dev->id,
> +		refcount_read(&iommu_dev->refcount));

And just before the call to qda_memory_manager_unregister_device() you
print a debug log, saying you will call this function.

> +
> +	if (refcount_read(&iommu_dev->refcount) == 0) {
> +		xa_erase(&mem_mgr->device_xa, iommu_dev->id);
> +		kfree(iommu_dev);
> +		return;
> +	}
> +
> +	if (refcount_dec_and_test(&iommu_dev->refcount)) {
> +		qda_info(NULL, "Device id=%u refcount reached zero, queuing removal\n",
> +			 iommu_dev->id);
> +		queue_work(mem_mgr->wq, &iommu_dev->remove_work);
> +	}
> +}
> +
[..]
> diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
[..]
> +
> +/**

This says "kernel-doc"

> + * struct qda_iommu_device - IOMMU device instance for memory management
> + *
> + * This structure represents a single IOMMU-enabled device managed by the
> + * memory manager. Each device can be assigned to a specific process.
> + */
> +struct qda_iommu_device {
> +	/* Unique identifier for this IOMMU device */

But this doesn't follow kernel-doc style.

At the end of the series, 

./scripts/kernel-doc -none -vv -Wall drivers/accel/qda/

reports 270 warnings.

> +	u32 id;
> +	/* Pointer to the underlying device */
> +	struct device *dev;
> +	/* Name for the device */
> +	char name[32];
> +	/* Spinlock protecting concurrent access to device */
> +	spinlock_t lock;
> +	/* Reference counter for device */
> +	refcount_t refcount;
> +	/* Work structure for deferred device removal */
> +	struct work_struct remove_work;
> +	/* Stream ID for IOMMU transactions */
> +	u32 sid;
> +	/* Pointer to parent memory manager */
> +	struct qda_memory_manager *manager;
> +};

Regards,
Bjorn
