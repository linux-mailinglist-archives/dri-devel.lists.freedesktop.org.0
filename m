Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD83E7F2714
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6478D10E24E;
	Tue, 21 Nov 2023 08:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9516510E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700554632; x=1732090632;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=iQiafgt3A/8kRc95BEN8wMG6LblyFfcfPE+p6IB93zM=;
 b=JLURA8JWZmZn+pZPJMHilfA7fZGCEt7pRa721B3mD5AllPo5ktY8laax
 i/YkK6JyjMXZodvEZPsjkVPkALTLTfPBu3ofzuKYIKi+A9WIcblcCBOVL
 R/l2D0uTWKl/kLIvGzt4OOI+4SFodRThLVXL+rsS71kqh9EDthssvDjYI
 8IVgAVRkZiIG6yfJrCe+UAeWUBJ/+z5y174cVfy5YUX//RzW03jJ2431j
 7xnnJGWEFTQJct5gKUwu2C/LncEnsKw1HZzEgbQP0DmZRj8XZKOxSW9SA
 Yw9wDwC4DC2xldrNfuBPGFPS5D+Oz4lPgEJBxVhqqEaQYWd5z+0elVN1D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="388937060"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="388937060"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="14429378"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.78])
 ([10.217.160.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:17:10 -0800
Message-ID: <456d3951-870f-4414-979a-fd5a86da9fe8@linux.intel.com>
Date: Tue, 21 Nov 2023 09:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Expand DRM device lifecycle
To: dri-devel@lists.freedesktop.org
References: <20231117174337.20174-1-quic_jhugo@quicinc.com>
 <20231117174337.20174-3-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231117174337.20174-3-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 17.11.2023 18:43, Jeffrey Hugo wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Currently the QAIC DRM device registers itself when the MHI QAIC_CONTROL
> channel becomes available. This is when the device is able to process
> workloads. However, the DRM driver also provides the debugfs interface
> bootlog for the device. If the device fails to boot to the QSM (which
> brings up the MHI QAIC_CONTROL channel), the bootlog won't be available for
> debugging why it failed to boot.
> 
> Change when the DRM device registers itself from when QAIC_CONTROL is
> available to when the card is first probed on the PCI bus. Additionally,
> make the DRM driver persist through reset/error cases so the driver
> doesn't have to be reloaded to access the card again. Send
> KOBJ_ONLINE/OFFLINE uevents so userspace can know when DRM device is
> ready to handle requests.
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  Documentation/accel/qaic/qaic.rst   |  9 +++++-
>  drivers/accel/qaic/mhi_controller.c |  2 +-
>  drivers/accel/qaic/qaic.h           |  2 +-
>  drivers/accel/qaic/qaic_drv.c       | 44 +++++++++++------------------
>  4 files changed, 27 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
> index f81020736ebf..efb7771273bb 100644
> --- a/Documentation/accel/qaic/qaic.rst
> +++ b/Documentation/accel/qaic/qaic.rst
> @@ -93,8 +93,15 @@ commands (does not impact QAIC).
>  uAPI
>  ====
>  
> +QAIC creates an accel device per phsyical PCIe device. This accel device exists
> +for as long as the PCIe device is known to Linux.
> +
> +The PCIe device may not be in the state to accept requests from userspace at
> +all times. QAIC will trigger KOBJ_ONLINE/OFFLINE uevents to advertise when the
> +device can accept requests (ONLINE) and when the device is no longer accepting
> +requests (OFFLINE) because of a reset or other state transition.
> +
>  QAIC defines a number of driver specific IOCTLs as part of the userspace API.
> -This section describes those APIs.
>  
>  DRM_IOCTL_QAIC_MANAGE
>    This IOCTL allows userspace to send a NNC request to the QSM. The call will
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 5d3cc30009cc..832464f2833a 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -469,7 +469,7 @@ static void mhi_status_cb(struct mhi_controller *mhi_cntrl, enum mhi_callback re
>  		pci_err(qdev->pdev, "Fatal error received from device. Attempting to recover\n");
>  	/* this event occurs in non-atomic context */
>  	if (reason == MHI_CB_SYS_ERROR)
> -		qaic_dev_reset_clean_local_state(qdev, true);
> +		qaic_dev_reset_clean_local_state(qdev);
>  }
>  
>  static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntrl)
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index bd0c884e6bf7..66f4abf6c4c4 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -283,7 +283,7 @@ void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
>  void release_dbc(struct qaic_device *qdev, u32 dbc_id);
>  
>  void wake_all_cntl(struct qaic_device *qdev);
> -void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset);
> +void qaic_dev_reset_clean_local_state(struct qaic_device *qdev);
>  
>  struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
>  
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 02fe23248da4..c19bc83b249c 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -8,6 +8,7 @@
>  #include <linux/idr.h>
>  #include <linux/interrupt.h>
>  #include <linux/list.h>
> +#include <linux/kobject.h>
>  #include <linux/kref.h>
>  #include <linux/mhi.h>
>  #include <linux/module.h>
> @@ -43,9 +44,6 @@ MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
>  static bool link_up;
>  static DEFINE_IDA(qaic_usrs);
>  
> -static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id);
> -static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id);
> -
>  static void free_usr(struct kref *kref)
>  {
>  	struct qaic_user *usr = container_of(kref, struct qaic_user, ref_count);
> @@ -183,13 +181,6 @@ static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id)
>  
>  	qddev->partition_id = partition_id;
>  
> -	/*
> -	 * drm_dev_unregister() sets the driver data to NULL and
> -	 * drm_dev_register() does not update the driver data. During a SOC
> -	 * reset drm dev is unregistered and registered again leaving the
> -	 * driver data to NULL.
> -	 */
> -	dev_set_drvdata(to_accel_kdev(qddev), drm->accel);
>  	ret = drm_dev_register(drm, 0);
>  	if (ret)
>  		pci_dbg(qdev->pdev, "drm_dev_register failed %d\n", ret);
> @@ -203,7 +194,6 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
>  	struct drm_device *drm = to_drm(qddev);
>  	struct qaic_user *usr;
>  
> -	drm_dev_get(drm);
>  	drm_dev_unregister(drm);
>  	qddev->partition_id = 0;
>  	/*
> @@ -232,7 +222,6 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
>  		mutex_lock(&qddev->users_mutex);
>  	}
>  	mutex_unlock(&qddev->users_mutex);
> -	drm_dev_put(drm);
>  }
>  
>  static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
> @@ -254,8 +243,6 @@ static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
>  
>  	qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
>  
> -	qdev->reset_state = QAIC_ONLINE;
> -
>  	dev_set_drvdata(&mhi_dev->dev, qdev);
>  	qdev->cntl_ch = mhi_dev;
>  
> @@ -265,6 +252,7 @@ static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
>  		return ret;
>  	}
>  
> +	qdev->reset_state = QAIC_BOOT;
>  	ret = get_cntl_version(qdev, NULL, &major, &minor);
>  	if (ret || major != CNTL_MAJOR || minor > CNTL_MINOR) {
>  		pci_err(qdev->pdev, "%s: Control protocol version (%d.%d) not supported. Supported version is (%d.%d). Ret: %d\n",
> @@ -272,8 +260,8 @@ static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
>  		ret = -EINVAL;
>  		goto close_control;
>  	}
> -
> -	ret = qaic_create_drm_device(qdev, QAIC_NO_PARTITION);
> +	qdev->reset_state = QAIC_ONLINE;
> +	kobject_uevent(&(to_accel_kdev(qdev->qddev))->kobj, KOBJ_ONLINE);
>  
>  	return ret;
>  
> @@ -291,6 +279,7 @@ static void qaic_notify_reset(struct qaic_device *qdev)
>  {
>  	int i;
>  
> +	kobject_uevent(&(to_accel_kdev(qdev->qddev))->kobj, KOBJ_OFFLINE);
>  	qdev->reset_state = QAIC_OFFLINE;
>  	/* wake up any waiters to avoid waiting for timeouts at sync */
>  	wake_all_cntl(qdev);
> @@ -299,21 +288,15 @@ static void qaic_notify_reset(struct qaic_device *qdev)
>  	synchronize_srcu(&qdev->dev_lock);
>  }
>  
> -void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset)
> +void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
>  {
>  	int i;
>  
>  	qaic_notify_reset(qdev);
>  
> -	/* remove drmdevs to prevent new users from coming in */
> -	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
> -
>  	/* start tearing things down */
>  	for (i = 0; i < qdev->num_dbc; ++i)
>  		release_dbc(qdev, i);
> -
> -	if (exit_reset)
> -		qdev->reset_state = QAIC_ONLINE;
>  }
>  
>  static void cleanup_qdev(struct qaic_device *qdev)
> @@ -338,6 +321,7 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
>  	if (!qdev)
>  		return NULL;
>  
> +	qdev->reset_state = QAIC_OFFLINE;
>  	if (id->device == PCI_DEV_AIC100) {
>  		qdev->num_dbc = 16;
>  		qdev->dbc = devm_kcalloc(&pdev->dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
> @@ -499,15 +483,21 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		goto cleanup_qdev;
>  	}
>  
> +	ret = qaic_create_drm_device(qdev, QAIC_NO_PARTITION);
> +	if (ret)
> +		goto cleanup_qdev;
> +
>  	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq,
>  						       qdev->single_msi);
>  	if (IS_ERR(qdev->mhi_cntrl)) {
>  		ret = PTR_ERR(qdev->mhi_cntrl);
> -		goto cleanup_qdev;
> +		goto cleanup_drm_dev;
>  	}
>  
>  	return 0;
>  
> +cleanup_drm_dev:
> +	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
>  cleanup_qdev:
>  	cleanup_qdev(qdev);
>  	return ret;
> @@ -520,7 +510,8 @@ static void qaic_pci_remove(struct pci_dev *pdev)
>  	if (!qdev)
>  		return;
>  
> -	qaic_dev_reset_clean_local_state(qdev, false);
> +	qaic_dev_reset_clean_local_state(qdev);
> +	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
>  	qaic_mhi_free_controller(qdev->mhi_cntrl, link_up);
>  	cleanup_qdev(qdev);
>  }
> @@ -543,14 +534,13 @@ static void qaic_pci_reset_prepare(struct pci_dev *pdev)
>  
>  	qaic_notify_reset(qdev);
>  	qaic_mhi_start_reset(qdev->mhi_cntrl);
> -	qaic_dev_reset_clean_local_state(qdev, false);
> +	qaic_dev_reset_clean_local_state(qdev);
>  }
>  
>  static void qaic_pci_reset_done(struct pci_dev *pdev)
>  {
>  	struct qaic_device *qdev = pci_get_drvdata(pdev);
>  
> -	qdev->reset_state = QAIC_ONLINE;
>  	qaic_mhi_reset_done(qdev->mhi_cntrl);
>  }
>  
