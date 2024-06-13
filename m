Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B048E907C47
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1210EB83;
	Thu, 13 Jun 2024 19:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BiODEcA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A2110EB83
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:18:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8475261D28;
 Thu, 13 Jun 2024 19:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90473C2BBFC;
 Thu, 13 Jun 2024 19:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718306313;
 bh=0dUoIERvha84Ttm88+VYuMJSLvLnVGmZhewF3c9D9Ps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BiODEcA+596m57waePRbr913TZX70bGwTVw2U5cJow/u7yy3sF6R2rIlvUrh+qb2f
 TcdMkIQhP4yRqZPODt5+ZhhoESIkGBCi4njvMtRkhzTjrrR1hZuStkxs0VpIkm2uYj
 8zRoIcad7KwuZMVgmpERwGErcraSzkmsweD4f5EAJXXFK6lyM0ISNarP9ZOw1aMhrJ
 V2oNjlo+fhM/YdcYWZ8WZIHYJ+Ko5I6NQfAR6kum2OGlYXDsPqO7QqXgpkUPyAFb4+
 8Yeg5tEOuSzNF3D437mE5IOh8SqDhmlzOz8xMFJZSSL0PtlFQylD4tnTAywoGj0faz
 jx19BE/xTN7mg==
Date: Thu, 13 Jun 2024 22:18:28 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org, zyehudai@habana.ai
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Message-ID: <20240613191828.GJ4966@unreal>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613082208.1439968-12-oshpigelman@habana.ai>
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

On Thu, Jun 13, 2024 at 11:22:04AM +0300, Omer Shpigelman wrote:
> Add an RDMA driver of Gaudi ASICs family for AI scaling.
> The driver itself is agnostic to the ASIC in action, it operates according
> to the capabilities that were passed on device initialization.
> The device is initialized by the hbl_cn driver via auxiliary bus.
> The driver also supports QP resource tracking and port/device HW counters.
> 
> Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
> Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
> Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
> Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
> Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
> Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> Co-developed-by: David Meriin <dmeriin@habana.ai>
> Signed-off-by: David Meriin <dmeriin@habana.ai>
> Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
> Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>

I afraid that you misinterpreted the "Co-developed-by" tag. All these
people are probably touch the code and not actually sit together at
the same room and write the code together. So, please remove the
extensive "Co-developed-by" tags.

It is not full review yet, but simple pass-by-comments.

> ---
>  MAINTAINERS                              |   10 +
>  drivers/infiniband/Kconfig               |    1 +
>  drivers/infiniband/hw/Makefile           |    1 +
>  drivers/infiniband/hw/hbl/Kconfig        |   17 +
>  drivers/infiniband/hw/hbl/Makefile       |    8 +
>  drivers/infiniband/hw/hbl/hbl.h          |  326 +++
>  drivers/infiniband/hw/hbl/hbl_main.c     |  478 ++++
>  drivers/infiniband/hw/hbl/hbl_verbs.c    | 2686 ++++++++++++++++++++++
>  include/uapi/rdma/hbl-abi.h              |  204 ++
>  include/uapi/rdma/hbl_user_ioctl_cmds.h  |   66 +
>  include/uapi/rdma/hbl_user_ioctl_verbs.h |  106 +
>  include/uapi/rdma/ib_user_ioctl_verbs.h  |    1 +
>  12 files changed, 3904 insertions(+)
>  create mode 100644 drivers/infiniband/hw/hbl/Kconfig
>  create mode 100644 drivers/infiniband/hw/hbl/Makefile
>  create mode 100644 drivers/infiniband/hw/hbl/hbl.h
>  create mode 100644 drivers/infiniband/hw/hbl/hbl_main.c
>  create mode 100644 drivers/infiniband/hw/hbl/hbl_verbs.c
>  create mode 100644 include/uapi/rdma/hbl-abi.h
>  create mode 100644 include/uapi/rdma/hbl_user_ioctl_cmds.h
>  create mode 100644 include/uapi/rdma/hbl_user_ioctl_verbs.h

<...>

> +#define hbl_ibdev_emerg(ibdev, format, ...)	ibdev_emerg(ibdev, format, ##__VA_ARGS__)
> +#define hbl_ibdev_alert(ibdev, format, ...)	ibdev_alert(ibdev, format, ##__VA_ARGS__)
> +#define hbl_ibdev_crit(ibdev, format, ...)	ibdev_crit(ibdev, format, ##__VA_ARGS__)
> +#define hbl_ibdev_err(ibdev, format, ...)	ibdev_err(ibdev, format, ##__VA_ARGS__)
> +#define hbl_ibdev_warn(ibdev, format, ...)	ibdev_warn(ibdev, format, ##__VA_ARGS__)
> +#define hbl_ibdev_notice(ibdev, format, ...)	ibdev_notice(ibdev, format, ##__VA_ARGS__)
> +#define hbl_ibdev_info(ibdev, format, ...)	ibdev_info(ibdev, format, ##__VA_ARGS__)
> +#define hbl_ibdev_dbg(ibdev, format, ...)	ibdev_dbg(ibdev, format, ##__VA_ARGS__)
> +
> +#define hbl_ibdev_emerg_ratelimited(ibdev, fmt, ...)		\
> +	ibdev_emerg_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> +#define hbl_ibdev_alert_ratelimited(ibdev, fmt, ...)		\
> +	ibdev_alert_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> +#define hbl_ibdev_crit_ratelimited(ibdev, fmt, ...)		\
> +	ibdev_crit_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> +#define hbl_ibdev_err_ratelimited(ibdev, fmt, ...)		\
> +	ibdev_err_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> +#define hbl_ibdev_warn_ratelimited(ibdev, fmt, ...)		\
> +	ibdev_warn_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> +#define hbl_ibdev_notice_ratelimited(ibdev, fmt, ...)		\
> +	ibdev_notice_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> +#define hbl_ibdev_info_ratelimited(ibdev, fmt, ...)		\
> +	ibdev_info_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> +#define hbl_ibdev_dbg_ratelimited(ibdev, fmt, ...)		\
> +	ibdev_dbg_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> +

Please don't redefine the existing macros. Just use the existing ones.


<...>

> +	if (hbl_ib_match_netdev(ibdev, netdev))
> +		ib_port = hbl_to_ib_port_num(hdev, netdev->dev_port);
> +	else
> +		return NOTIFY_DONE;

It is not kernel coding style. Please write:
if (!hbl_ib_match_netdev(ibdev, netdev))
    return NOTIFY_DONE;

ib_port = hbl_to_ib_port_num(hdev, netdev->dev_port);

> +

<...>

> +static int hbl_ib_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
> +{
> +	struct hbl_aux_dev *aux_dev = container_of(adev, struct hbl_aux_dev, adev);
> +	struct hbl_ib_aux_ops *aux_ops = aux_dev->aux_ops;
> +	struct hbl_ib_device *hdev;
> +	ktime_t timeout;
> +	int rc;
> +
> +	rc = hdev_init(aux_dev);
> +	if (rc) {
> +		dev_err(&aux_dev->adev.dev, "Failed to init hdev\n");
> +		return -EIO;
> +	}
> +
> +	hdev = aux_dev->priv;
> +
> +	/* don't allow module unloading while it is attached */
> +	if (!try_module_get(THIS_MODULE)) {

This part makes wonder, what are you trying to do here? What doesn't work for you
in standard driver core and module load mechanism?

> +		dev_err(hdev->dev, "Failed to increment %s module refcount\n",
> +			module_name(THIS_MODULE));
> +		rc = -EIO;
> +		goto module_get_err;
> +	}
> +
> +	timeout = ktime_add_ms(ktime_get(), hdev->pending_reset_long_timeout * MSEC_PER_SEC);
> +	while (1) {
> +		aux_ops->hw_access_lock(aux_dev);
> +
> +		/* if the device is operational, proceed to actual init while holding the lock in
> +		 * order to prevent concurrent hard reset
> +		 */
> +		if (aux_ops->device_operational(aux_dev))
> +			break;
> +
> +		aux_ops->hw_access_unlock(aux_dev);
> +
> +		if (ktime_compare(ktime_get(), timeout) > 0) {
> +			dev_err(hdev->dev, "Timeout while waiting for hard reset to finish\n");
> +			rc = -EBUSY;
> +			goto timeout_err;
> +		}
> +
> +		dev_notice_once(hdev->dev, "Waiting for hard reset to finish before probing IB\n");
> +
> +		msleep_interruptible(MSEC_PER_SEC);
> +	}

The code above is unexpected.

> +
> +	rc = hbl_ib_dev_init(hdev);
> +	if (rc) {
> +		dev_err(hdev->dev, "Failed to init ib device\n");
> +		goto dev_init_err;
> +	}
> +
> +	aux_ops->hw_access_unlock(aux_dev);
> +
> +	return 0;
> +
> +dev_init_err:
> +	aux_ops->hw_access_unlock(aux_dev);
> +timeout_err:
> +	module_put(THIS_MODULE);
> +module_get_err:
> +	hdev_fini(aux_dev);
> +
> +	return rc;
> +}

<...>

> +static int __init hbl_ib_init(void)
> +{
> +	pr_info("loading driver\n");

Please remove all these debug prints and leave only the necessary ones.

> +
> +	return auxiliary_driver_register(&hbl_ib_driver);
> +}
> +
> +static void __exit hbl_ib_exit(void)
> +{
> +	auxiliary_driver_unregister(&hbl_ib_driver);
> +
> +	pr_info("driver removed\n");
> +}
> +
> +module_init(hbl_ib_init);
> +module_exit(hbl_ib_exit)

Thanks
