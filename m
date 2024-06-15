Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9C590992D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C928B10E07D;
	Sat, 15 Jun 2024 17:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="F5J+2YGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671F410E0CC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:13:51 +0000 (UTC)
X-Envelope-To: oshpigelman@habana.ai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1718471627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKz/uZ69stpdHTCGCmfKmk6F/uIFhLBEG64gASbovyw=;
 b=F5J+2YGUuh8QNjH/wmOkDVgyDstS28eHjXZ+s6x073q99tAPMPfWQOTPzO8rnuEBpivgEr
 jz2pwww30o24nR1yLe+Qe4lTd0I4uClUihfDvmiwsJpzw0AH9dwwx1pJs7QdMoH5K0ddEf
 belNppiT2tkZMqogA6dybQGAT0C561Q=
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-rdma@vger.kernel.org
X-Envelope-To: netdev@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: ogabbay@kernel.org
X-Envelope-To: zyehudai@habana.ai
Message-ID: <38b9797e-d213-422e-8b2b-7a31f5924b55@linux.dev>
Date: Sun, 16 Jun 2024 01:13:38 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
To: Omer Shpigelman <oshpigelman@habana.ai>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, zyehudai@habana.ai
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20240613082208.1439968-10-oshpigelman@habana.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

在 2024/6/13 16:22, Omer Shpigelman 写道:
> This ethernet driver is initialized via auxiliary bus by the hbl_cn
> driver.
> It serves mainly for control operations that are needed for AI scaling.
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
> ---
>   MAINTAINERS                                   |    9 +
>   drivers/net/ethernet/intel/Kconfig            |   18 +
>   drivers/net/ethernet/intel/Makefile           |    1 +
>   drivers/net/ethernet/intel/hbl_en/Makefile    |    9 +
>   .../net/ethernet/intel/hbl_en/common/Makefile |    3 +
>   .../net/ethernet/intel/hbl_en/common/hbl_en.c | 1168 +++++++++++++++++
>   .../net/ethernet/intel/hbl_en/common/hbl_en.h |  206 +++
>   .../intel/hbl_en/common/hbl_en_dcbnl.c        |  101 ++
>   .../ethernet/intel/hbl_en/common/hbl_en_drv.c |  211 +++
>   .../intel/hbl_en/common/hbl_en_ethtool.c      |  452 +++++++
>   10 files changed, 2178 insertions(+)
>   create mode 100644 drivers/net/ethernet/intel/hbl_en/Makefile
>   create mode 100644 drivers/net/ethernet/intel/hbl_en/common/Makefile
>   create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en.c
>   create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en.h
>   create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en_dcbnl.c
>   create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en_drv.c
>   create mode 100644 drivers/net/ethernet/intel/hbl_en/common/hbl_en_ethtool.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 096439a62129..7301f38e9cfb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9617,6 +9617,15 @@ F:	include/linux/habanalabs/
>   F:	include/linux/net/intel/cn*
>   F:	include/linux/net/intel/gaudi2*
>   
> +HABANALABS ETHERNET DRIVER
> +M:	Omer Shpigelman <oshpigelman@habana.ai>
> +L:	netdev@vger.kernel.org
> +S:	Supported
> +W:	https://www.habana.ai
> +F:	Documentation/networking/device_drivers/ethernet/intel/hbl.rst
> +F:	drivers/net/ethernet/intel/hbl_en/
> +F:	include/linux/net/intel/cn*
> +
>   HACKRF MEDIA DRIVER
>   L:	linux-media@vger.kernel.org
>   S:	Orphan
> diff --git a/drivers/net/ethernet/intel/Kconfig b/drivers/net/ethernet/intel/Kconfig
> index 0d1b8a2bae99..5d07349348a0 100644
> --- a/drivers/net/ethernet/intel/Kconfig
> +++ b/drivers/net/ethernet/intel/Kconfig
> @@ -417,4 +417,22 @@ config HABANA_CN
>   	  To compile this driver as a module, choose M here. The module
>   	  will be called habanalabs_cn.
>   
> +config HABANA_EN
> +	tristate "HabanaLabs (an Intel Company) Ethernet driver"
> +	depends on NETDEVICES && ETHERNET && INET
> +	select HABANA_CN
> +	help
> +	  This driver enables Ethernet functionality for the network interfaces
> +	  that are part of the GAUDI ASIC family of AI Accelerators.
> +	  For more information on how to identify your adapter, go to the
> +	  Adapter & Driver ID Guide that can be located at:
> +
> +	  <http://support.intel.com>
> +
> +	  More specific information on configuring the driver is in
> +	  <file:Documentation/networking/device_drivers/ethernet/intel/hbl.rst>.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called habanalabs_en.
> +
>   endif # NET_VENDOR_INTEL
> diff --git a/drivers/net/ethernet/intel/Makefile b/drivers/net/ethernet/intel/Makefile
> index 10049a28e336..ec62a0227897 100644
> --- a/drivers/net/ethernet/intel/Makefile
> +++ b/drivers/net/ethernet/intel/Makefile
> @@ -20,3 +20,4 @@ obj-$(CONFIG_FM10K) += fm10k/
>   obj-$(CONFIG_ICE) += ice/
>   obj-$(CONFIG_IDPF) += idpf/
>   obj-$(CONFIG_HABANA_CN) += hbl_cn/
> +obj-$(CONFIG_HABANA_EN) += hbl_en/
> diff --git a/drivers/net/ethernet/intel/hbl_en/Makefile b/drivers/net/ethernet/intel/hbl_en/Makefile
> new file mode 100644
> index 000000000000..695497ab93b6
> --- /dev/null
> +++ b/drivers/net/ethernet/intel/hbl_en/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for HabanaLabs (an Intel Company) Ethernet network driver
> +#
> +
> +obj-$(CONFIG_HABANA_EN) := habanalabs_en.o
> +
> +include $(src)/common/Makefile
> +habanalabs_en-y += $(HBL_EN_COMMON_FILES)
> diff --git a/drivers/net/ethernet/intel/hbl_en/common/Makefile b/drivers/net/ethernet/intel/hbl_en/common/Makefile
> new file mode 100644
> index 000000000000..a3ccb5dbf4a6
> --- /dev/null
> +++ b/drivers/net/ethernet/intel/hbl_en/common/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +HBL_EN_COMMON_FILES := common/hbl_en_drv.o common/hbl_en.o \
> +	common/hbl_en_ethtool.o common/hbl_en_dcbnl.o
> diff --git a/drivers/net/ethernet/intel/hbl_en/common/hbl_en.c b/drivers/net/ethernet/intel/hbl_en/common/hbl_en.c
> new file mode 100644
> index 000000000000..066be5ac2d84
> --- /dev/null
> +++ b/drivers/net/ethernet/intel/hbl_en/common/hbl_en.c
> @@ -0,0 +1,1168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2020-2024 HabanaLabs, Ltd.
> + * Copyright (C) 2023-2024, Intel Corporation.
> + * All Rights Reserved.
> + */
> +
> +#include "hbl_en.h"
> +#include <linux/inetdevice.h>
> +
> +#define TX_TIMEOUT			(5 * HZ)
> +#define PORT_RESET_TIMEOUT_MSEC		(60 * 1000ull) /* 60s */
> +
> +/**
> + * struct hbl_en_tx_pkt_work - used to schedule a work of a Tx packet.
> + * @tx_work: workqueue object to run when packet needs to be sent.
> + * @port: pointer to current port structure.
> + * @skb: copy of the packet to send.
> + */
> +struct hbl_en_tx_pkt_work {
> +	struct work_struct tx_work;
> +	struct hbl_en_port *port;
> +	struct sk_buff *skb;
> +};
> +
> +static int hbl_en_napi_poll(struct napi_struct *napi, int budget);
> +static int hbl_en_port_open(struct hbl_en_port *port);
> +
> +static int hbl_en_ports_reopen(struct hbl_aux_dev *aux_dev)
> +{
> +	struct hbl_en_device *hdev = aux_dev->priv;
> +	struct hbl_en_port *port;
> +	int rc = 0, i;
> +
> +	for (i = 0; i < hdev->max_num_of_ports; i++) {
> +		if (!(hdev->ports_mask & BIT(i)))
> +			continue;
> +
> +		port = &hdev->ports[i];
> +
> +		/* It could be that the port was shutdown by 'ip link set down' and there is no need
> +		 * in reopening it.
> +		 * Since we mark the ports as in reset even if they are disabled, we clear the flag
> +		 * here anyway.
> +		 * See hbl_en_ports_stop_prepare() for more info.
> +		 */
> +		if (!netif_running(port->ndev)) {
> +			atomic_set(&port->in_reset, 0);
> +			continue;
> +		}
> +
> +		rc = hbl_en_port_open(port);
> +
> +		atomic_set(&port->in_reset, 0);
> +
> +		if (rc)
> +			break;
> +	}
> +
> +	hdev->in_reset = false;
> +
> +	return rc;
> +}
> +
> +static void hbl_en_port_fini(struct hbl_en_port *port)
> +{
> +	if (port->rx_wq)
> +		destroy_workqueue(port->rx_wq);
> +}
> +
> +static int hbl_en_port_init(struct hbl_en_port *port)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	u32 port_idx = port->idx;
> +	char wq_name[32];
> +	int rc;
> +
> +	if (hdev->poll_enable) {
> +		memset(wq_name, 0, sizeof(wq_name));
> +		snprintf(wq_name, sizeof(wq_name) - 1, "hbl%u-port%d-rx-wq", hdev->core_dev_id,
> +			 port_idx);
> +		port->rx_wq = alloc_ordered_workqueue(wq_name, 0);
> +		if (!port->rx_wq) {
> +			dev_err(hdev->dev, "Failed to allocate Rx WQ\n");
> +			rc = -ENOMEM;
> +			goto fail;
> +		}
> +	}
> +
> +	hbl_en_ethtool_init_coalesce(port);
> +
> +	return 0;
> +
> +fail:
> +	hbl_en_port_fini(port);
> +
> +	return rc;
> +}
> +
> +static void _hbl_en_set_port_status(struct hbl_en_port *port, bool up)
> +{
> +	struct net_device *ndev = port->ndev;
> +	u32 port_idx = port->idx;
> +
> +	if (up) {
> +		netif_carrier_on(ndev);
> +		netif_wake_queue(ndev);
> +	} else {
> +		netif_carrier_off(ndev);
> +		netif_stop_queue(ndev);
> +	}
> +
> +	/* Unless link events are getting through the EQ, no need to print about link down events
> +	 * during port reset
> +	 */
> +	if (port->hdev->has_eq || up || !atomic_read(&port->in_reset))
> +		netdev_info(port->ndev, "link %s, port %d\n", up ? "up" : "down", port_idx);
> +}
> +
> +static void hbl_en_set_port_status(struct hbl_aux_dev *aux_dev, u32 port_idx, bool up)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +
> +	_hbl_en_set_port_status(port, up);
> +}
> +
> +static bool hbl_en_is_port_open(struct hbl_aux_dev *aux_dev, u32 port_idx)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +
> +	return port->is_initialized;
> +}
> +
> +/* get the src IP as it is done in devinet_ioctl() */
> +static int hbl_en_get_src_ip(struct hbl_aux_dev *aux_dev, u32 port_idx, u32 *src_ip)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +	struct net_device *ndev = port->ndev;
> +	struct in_device *in_dev;
> +	struct in_ifaddr *ifa;
> +	int rc = 0;
> +
> +	/* for the case where no src IP is configured */
> +	*src_ip = 0;
> +
> +	/* rtnl lock should be acquired in relevant flows before taking configuration lock */
> +	if (!rtnl_is_locked()) {
> +		netdev_err(port->ndev, "Rtnl lock is not acquired, can't proceed\n");
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +
> +	in_dev = __in_dev_get_rtnl(ndev);
> +	if (!in_dev) {
> +		netdev_err(port->ndev, "Failed to get IPv4 struct\n");
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +
> +	ifa = rtnl_dereference(in_dev->ifa_list);
> +
> +	while (ifa) {
> +		if (!strcmp(ndev->name, ifa->ifa_label)) {
> +			/* convert the BE to native and later on it will be
> +			 * written to the HW as LE in QPC_SET
> +			 */
> +			*src_ip = be32_to_cpu(ifa->ifa_local);
> +			break;
> +		}
> +		ifa = rtnl_dereference(ifa->ifa_next);
> +	}
> +out:
> +	return rc;
> +}
> +
> +static void hbl_en_reset_stats(struct hbl_aux_dev *aux_dev, u32 port_idx)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +
> +	port->net_stats.rx_packets = 0;
> +	port->net_stats.tx_packets = 0;
> +	port->net_stats.rx_bytes = 0;
> +	port->net_stats.tx_bytes = 0;
> +	port->net_stats.tx_errors = 0;
> +	atomic64_set(&port->net_stats.rx_dropped, 0);
> +	atomic64_set(&port->net_stats.tx_dropped, 0);

per-cpu variable is better?

Zhu Yanjun

> +}
> +
> +static u32 hbl_en_get_mtu(struct hbl_aux_dev *aux_dev, u32 port_idx)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +	struct net_device *ndev = port->ndev;
> +	u32 mtu;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		netdev_err(ndev, "port is in reset, can't get MTU\n");
> +		return 0;
> +	}
> +
> +	mtu = ndev->mtu;
> +
> +	atomic_set(&port->in_reset, 0);
> +
> +	return mtu;
> +}
> +
> +static u32 hbl_en_get_pflags(struct hbl_aux_dev *aux_dev, u32 port_idx)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +
> +	return port->pflags;
> +}
> +
> +static void hbl_en_set_dev_lpbk(struct hbl_aux_dev *aux_dev, u32 port_idx, bool enable)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +	struct net_device *ndev = port->ndev;
> +
> +	if (enable)
> +		ndev->features |= NETIF_F_LOOPBACK;
> +	else
> +		ndev->features &= ~NETIF_F_LOOPBACK;
> +}
> +
> +/* This function should be called after ctrl_lock was taken */
> +static int hbl_en_port_open_locked(struct hbl_en_port *port)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct net_device *ndev = port->ndev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +	int rc;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	if (port->is_initialized)
> +		return 0;
> +
> +	if (!hdev->poll_enable)
> +		netif_napi_add(ndev, &port->napi, hbl_en_napi_poll);
> +
> +	rc = aux_ops->port_hw_init(aux_dev, port_idx);
> +	if (rc) {
> +		netdev_err(ndev, "Failed to configure the HW, rc %d\n", rc);
> +		goto hw_init_fail;
> +	}
> +
> +	if (!hdev->poll_enable)
> +		napi_enable(&port->napi);
> +
> +	rc = hdev->asic_funcs.eth_port_open(port);
> +	if (rc) {
> +		netdev_err(ndev, "Failed to init H/W, rc %d\n", rc);
> +		goto port_open_fail;
> +	}
> +
> +	rc = aux_ops->update_mtu(aux_dev, port_idx, ndev->mtu);
> +	if (rc) {
> +		netdev_err(ndev, "MTU update failed, rc %d\n", rc);
> +		goto update_mtu_fail;
> +	}
> +
> +	rc = aux_ops->phy_init(aux_dev, port_idx);
> +	if (rc) {
> +		netdev_err(ndev, "PHY init failed, rc %d\n", rc);
> +		goto phy_init_fail;
> +	}
> +
> +	netif_start_queue(ndev);
> +
> +	port->is_initialized = true;
> +
> +	return 0;
> +
> +phy_init_fail:
> +	/* no need to revert the MTU change, it will be updated on next port open */
> +update_mtu_fail:
> +	hdev->asic_funcs.eth_port_close(port);
> +port_open_fail:
> +	if (!hdev->poll_enable)
> +		napi_disable(&port->napi);
> +
> +	aux_ops->port_hw_fini(aux_dev, port_idx);
> +hw_init_fail:
> +	if (!hdev->poll_enable)
> +		netif_napi_del(&port->napi);
> +
> +	return rc;
> +}
> +
> +static int hbl_en_port_open(struct hbl_en_port *port)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +	int rc;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	aux_ops->ctrl_lock(aux_dev, port_idx);
> +	rc = hbl_en_port_open_locked(port);
> +	aux_ops->ctrl_unlock(aux_dev, port_idx);
> +
> +	return rc;
> +}
> +
> +static int hbl_en_open(struct net_device *netdev)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +	int rc;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		netdev_err(netdev, "port is in reset, can't open it\n");
> +		return -EBUSY;
> +	}
> +
> +	rc = hbl_en_port_open(port);
> +
> +	atomic_set(&port->in_reset, 0);
> +
> +	return rc;
> +}
> +
> +/* This function should be called after ctrl_lock was taken */
> +static void hbl_en_port_close_locked(struct hbl_en_port *port)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	if (!port->is_initialized)
> +		return;
> +
> +	port->is_initialized = false;
> +
> +	/* verify that the port is marked as closed before continuing */
> +	mb();
> +
> +	/* Print if not in hard reset flow e.g. from ip cmd */
> +	if (!hdev->in_reset && netif_carrier_ok(port->ndev))
> +		netdev_info(port->ndev, "port was closed\n");
> +
> +	/* disable the PHY here so no link changes will occur from this point forward */
> +	aux_ops->phy_fini(aux_dev, port_idx);
> +
> +	/* disable Tx SW flow */
> +	netif_carrier_off(port->ndev);
> +	netif_tx_disable(port->ndev);
> +
> +	/* stop Tx/Rx HW */
> +	aux_ops->port_hw_fini(aux_dev, port_idx);
> +
> +	/* disable Tx/Rx QPs */
> +	hdev->asic_funcs.eth_port_close(port);
> +
> +	/* stop Rx SW flow */
> +	if (hdev->poll_enable) {
> +		hbl_en_rx_poll_stop(port);
> +	} else {
> +		napi_disable(&port->napi);
> +		netif_napi_del(&port->napi);
> +	}
> +
> +	/* Explicitly count the port close operations as we don't get a link event for this.
> +	 * Upon port open we receive a link event, hence no additional action required.
> +	 */
> +	aux_ops->port_toggle_count(aux_dev, port_idx);
> +}
> +
> +static void hbl_en_port_close(struct hbl_en_port *port)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	aux_ops->ctrl_lock(aux_dev, port_idx);
> +	hbl_en_port_close_locked(port);
> +	aux_ops->ctrl_unlock(aux_dev, port_idx);
> +}
> +
> +/* This function should be called after ctrl_lock was taken */
> +static int __hbl_en_port_reset_locked(struct hbl_en_port *port)
> +{
> +	hbl_en_port_close_locked(port);
> +
> +	return hbl_en_port_open_locked(port);
> +}
> +
> +/* This function should be called after ctrl_lock was taken */
> +int hbl_en_port_reset_locked(struct hbl_aux_dev *aux_dev, u32 port_idx)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +
> +	return __hbl_en_port_reset_locked(port);
> +}
> +
> +int hbl_en_port_reset(struct hbl_en_port *port)
> +{
> +	hbl_en_port_close(port);
> +
> +	/* Sleep in order to let obsolete events to be dropped before re-opening the port */
> +	msleep(20);
> +
> +	return hbl_en_port_open(port);
> +}
> +
> +static int hbl_en_close(struct net_device *netdev)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +	struct hbl_en_device *hdev = port->hdev;
> +	ktime_t timeout;
> +
> +	/* Looks like the return value of this function is not checked, so we can't just return
> +	 * EBUSY if the port is under reset. We need to wait until the reset is finished and then
> +	 * close the port. Otherwise the netdev will set the port as closed although port_close()
> +	 * wasn't called. Only if we waited long enough and the reset hasn't finished, we can return
> +	 * an error without actually closing the port as it is a fatal flow anyway.
> +	 */
> +	timeout = ktime_add_ms(ktime_get(), PORT_RESET_TIMEOUT_MSEC);
> +	while (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		/* If this is called from unregister_netdev() then the port was already closed and
> +		 * hence we can safely return.
> +		 * We could have just check the port_open boolean, but that might hide some future
> +		 * bugs. Hence it is better to use a dedicated flag for that.
> +		 */
> +		if (READ_ONCE(hdev->in_teardown))
> +			return 0;
> +
> +		usleep_range(50, 200);
> +		if (ktime_compare(ktime_get(), timeout) > 0) {
> +			netdev_crit(netdev,
> +				    "Timeout while waiting for port to finish reset, can't close it\n"
> +				    );
> +			return -EBUSY;
> +		}
> +	}
> +
> +	hbl_en_port_close(port);
> +
> +	atomic_set(&port->in_reset, 0);
> +
> +	return 0;
> +}
> +
> +/**
> + * hbl_en_ports_stop_prepare() - stop the Rx and Tx and synchronize with other reset flows.
> + * @aux_dev: habanalabs auxiliary device structure.
> + *
> + * This function makes sure that during the reset no packets will be processed and that
> + * ndo_open/ndo_close do not open/close the ports.
> + * A hard reset might occur right after the driver was loaded, which means before the ports
> + * initialization was finished. Therefore, even if the ports are not yet open, we mark it as in
> + * reset in order to avoid races. We clear the in reset flag later on when reopening the ports.
> + */
> +static void hbl_en_ports_stop_prepare(struct hbl_aux_dev *aux_dev)
> +{
> +	struct hbl_en_device *hdev = aux_dev->priv;
> +	struct hbl_en_port *port;
> +	ktime_t timeout;
> +	int i;
> +
> +	/* Check if the ports where initialized. If not, we shouldn't mark them as in reset because
> +	 * they will fail to get opened.
> +	 */
> +	if (!hdev->is_initialized || hdev->in_reset)
> +		return;
> +
> +	for (i = 0; i < hdev->max_num_of_ports; i++) {
> +		if (!(hdev->ports_mask & BIT(i)))
> +			continue;
> +
> +		port = &hdev->ports[i];
> +
> +		/* This function is competing with reset from ethtool/ip, so try to take the
> +		 * in_reset atomic and if we are already in a middle of reset, wait until reset
> +		 * function is finished.
> +		 * Reset function is designed to always finish (could take up to a few seconds in
> +		 * worst case).
> +		 * We mark also closed ports as in reset so they won't be able to get opened while
> +		 * the device in under reset.
> +		 */
> +
> +		timeout = ktime_add_ms(ktime_get(), PORT_RESET_TIMEOUT_MSEC);
> +		while (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +			usleep_range(50, 200);
> +			if (ktime_compare(ktime_get(), timeout) > 0) {
> +				netdev_crit(port->ndev,
> +					    "Timeout while waiting for port %d to finish reset\n",
> +					    port->idx);
> +				break;
> +			}
> +		}
> +	}
> +
> +	hdev->in_reset = true;
> +}
> +
> +static void hbl_en_ports_stop(struct hbl_aux_dev *aux_dev)
> +{
> +	struct hbl_en_device *hdev = aux_dev->priv;
> +	struct hbl_en_port *port;
> +	int i;
> +
> +	for (i = 0; i < hdev->max_num_of_ports; i++) {
> +		if (!(hdev->ports_mask & BIT(i)))
> +			continue;
> +
> +		port = &hdev->ports[i];
> +
> +		if (netif_running(port->ndev))
> +			hbl_en_port_close(port);
> +	}
> +}
> +
> +static int hbl_en_change_mtu(struct net_device *netdev, int new_mtu)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +	int rc = 0;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		netdev_err(netdev, "port is in reset, can't change MTU\n");
> +		return -EBUSY;
> +	}
> +
> +	if (netif_running(port->ndev)) {
> +		hbl_en_port_close(port);
> +
> +		/* Sleep in order to let obsolete events to be dropped before re-opening the port */
> +		msleep(20);
> +
> +		netdev->mtu = new_mtu;
> +
> +		rc = hbl_en_port_open(port);
> +		if (rc)
> +			netdev_err(netdev, "Failed to reinit port for MTU change, rc %d\n", rc);
> +	} else {
> +		netdev->mtu = new_mtu;
> +	}
> +
> +	atomic_set(&port->in_reset, 0);
> +
> +	return rc;
> +}
> +
> +/* Swap source and destination MAC addresses */
> +static inline void swap_l2(char *buf)
> +{
> +	u16 *eth_hdr, tmp;
> +
> +	eth_hdr = (u16 *)buf;
> +	tmp = eth_hdr[0];
> +	eth_hdr[0] = eth_hdr[3];
> +	eth_hdr[3] = tmp;
> +	tmp = eth_hdr[1];
> +	eth_hdr[1] = eth_hdr[4];
> +	eth_hdr[4] = tmp;
> +	tmp = eth_hdr[2];
> +	eth_hdr[2] = eth_hdr[5];
> +	eth_hdr[5] = tmp;
> +}
> +
> +/* Swap source and destination IP addresses
> + */
> +static inline void swap_l3(char *buf)
> +{
> +	u32 tmp;
> +
> +	/* skip the Ethernet header and the IP header till source IP address */
> +	buf += ETH_HLEN + 12;
> +	tmp = ((u32 *)buf)[0];
> +	((u32 *)buf)[0] = ((u32 *)buf)[1];
> +	((u32 *)buf)[1] = tmp;
> +}
> +
> +static void do_tx_swap(struct hbl_en_port *port, struct sk_buff *skb)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	u16 *tmp_buff = (u16 *)skb->data;
> +	u32 port_idx = port->idx;
> +
> +	/* First, let's print the SKB we got */
> +	dev_dbg_ratelimited(hdev->dev,
> +			    "Send [P%d]: dst-mac:%04x%04x%04x, src-mac:%04x%04x%04x, eth-type:%04x, len:%u\n",
> +			    port_idx, swab16(tmp_buff[0]), swab16(tmp_buff[1]), swab16(tmp_buff[2]),
> +			    swab16(tmp_buff[3]), swab16(tmp_buff[4]), swab16(tmp_buff[5]),
> +			    swab16(tmp_buff[6]), skb->len);
> +
> +	/* Before submit it to HW, in case this is ipv4 pkt, swap eth/ip addresses.
> +	 * that way, we may send ECMP (ping) to ourselves in LB cases.
> +	 */
> +	swap_l2(skb->data);
> +	if (swab16(tmp_buff[6]) == ETH_P_IP)
> +		swap_l3(skb->data);
> +}
> +
> +static bool is_pkt_swap_enabled(struct hbl_en_device *hdev)
> +{
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	return aux_ops->is_eth_lpbk(aux_dev);
> +}
> +
> +static bool is_tx_disabled(struct hbl_en_port *port)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	return aux_ops->get_mac_lpbk(aux_dev, port_idx) && !is_pkt_swap_enabled(hdev);
> +}
> +
> +static netdev_tx_t hbl_en_handle_tx(struct hbl_en_port *port, struct sk_buff *skb)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	netdev_tx_t ret;
> +
> +	if (skb->len <= 0 || is_tx_disabled(port))
> +		goto free_skb;
> +
> +	if (skb->len > hdev->max_frm_len) {
> +		netdev_err(port->ndev, "Tx pkt size %uB exceeds maximum of %uB\n", skb->len,
> +			   hdev->max_frm_len);
> +		goto free_skb;
> +	}
> +
> +	if (is_pkt_swap_enabled(hdev))
> +		do_tx_swap(port, skb);
> +
> +	/* Pad the ethernet packets to the minimum frame size as the NIC hw doesn't do it.
> +	 * eth_skb_pad() frees the packet on failure, so just increment the dropped counter and
> +	 * return as success to avoid a retry.
> +	 */
> +	if (skb_put_padto(skb, hdev->pad_size)) {
> +		dev_err_ratelimited(hdev->dev, "Padding failed, the skb is dropped\n");
> +		atomic64_inc(&port->net_stats.tx_dropped);
> +		return NETDEV_TX_OK;
> +	}
> +
> +	ret = hdev->asic_funcs.write_pkt_to_hw(port, skb);
> +	if (ret == NETDEV_TX_OK) {
> +		port->net_stats.tx_packets++;
> +		port->net_stats.tx_bytes += skb->len;
> +	}
> +
> +	return ret;
> +
> +free_skb:
> +	dev_kfree_skb_any(skb);
> +	return NETDEV_TX_OK;
> +}
> +
> +static netdev_tx_t hbl_en_start_xmit(struct sk_buff *skb, struct net_device *netdev)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +	struct hbl_en_device *hdev;
> +
> +	hdev = port->hdev;
> +
> +	return hbl_en_handle_tx(port, skb);
> +}
> +
> +static int hbl_en_set_port_mac_loopback(struct hbl_en_port *port, bool enable)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct net_device *ndev = port->ndev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +	int rc;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	rc = aux_ops->set_mac_lpbk(aux_dev, port_idx, enable);
> +	if (rc)
> +		return rc;
> +
> +	netdev_info(ndev, "port %u: mac loopback is %s\n", port_idx,
> +		    enable ? "enabled" : "disabled");
> +
> +	if (netif_running(ndev)) {
> +		rc = hbl_en_port_reset(port);
> +		if (rc) {
> +			netdev_err(ndev, "Failed to reset port %u, rc %d\n", port_idx, rc);
> +			return rc;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int hbl_en_set_features(struct net_device *netdev, netdev_features_t features)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +	netdev_features_t changed;
> +	int rc = 0;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		netdev_err(netdev, "port %d is in reset, can't update settings", port->idx);
> +		return -EBUSY;
> +	}
> +
> +	changed = netdev->features ^ features;
> +
> +	if (changed & NETIF_F_LOOPBACK)
> +		rc = hbl_en_set_port_mac_loopback(port, !!(features & NETIF_F_LOOPBACK));
> +
> +	atomic_set(&port->in_reset, 0);
> +
> +	return rc;
> +}
> +
> +static void hbl_en_handle_tx_timeout(struct net_device *netdev, unsigned int txqueue)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +
> +	port->net_stats.tx_errors++;
> +	atomic64_inc(&port->net_stats.tx_dropped);
> +}
> +
> +static void hbl_en_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(dev);
> +
> +	stats->rx_bytes = port->net_stats.rx_bytes;
> +	stats->tx_bytes = port->net_stats.tx_bytes;
> +	stats->rx_packets = port->net_stats.rx_packets;
> +	stats->tx_packets = port->net_stats.tx_packets;
> +	stats->tx_errors = port->net_stats.tx_errors;
> +	stats->tx_dropped = (u64)atomic64_read(&port->net_stats.tx_dropped);
> +	stats->rx_dropped = (u64)atomic64_read(&port->net_stats.rx_dropped);
> +}
> +
> +static const struct net_device_ops hbl_en_netdev_ops = {
> +	.ndo_open = hbl_en_open,
> +	.ndo_stop = hbl_en_close,
> +	.ndo_start_xmit = hbl_en_start_xmit,
> +	.ndo_validate_addr = eth_validate_addr,
> +	.ndo_change_mtu = hbl_en_change_mtu,
> +	.ndo_set_features = hbl_en_set_features,
> +	.ndo_get_stats64 = hbl_en_get_stats64,
> +	.ndo_tx_timeout = hbl_en_handle_tx_timeout,
> +};
> +
> +static void hbl_en_set_ops(struct net_device *ndev)
> +{
> +	ndev->netdev_ops = &hbl_en_netdev_ops;
> +	ndev->ethtool_ops = hbl_en_ethtool_get_ops(ndev);
> +#ifdef CONFIG_DCB
> +	ndev->dcbnl_ops = &hbl_en_dcbnl_ops;
> +#endif
> +}
> +
> +static int hbl_en_port_register(struct hbl_en_port *port)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +	struct hbl_en_port **ptr;
> +	struct net_device *ndev;
> +	int rc;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	ndev = alloc_etherdev(sizeof(struct hbl_en_port *));
> +	if (!ndev) {
> +		dev_err(hdev->dev, "netdevice %d alloc failed\n", port_idx);
> +		return -ENOMEM;
> +	}
> +
> +	port->ndev = ndev;
> +	SET_NETDEV_DEV(ndev, &hdev->pdev->dev);
> +	ptr = netdev_priv(ndev);
> +	*ptr = port;
> +
> +	/* necessary for creating multiple interfaces */
> +	ndev->dev_port = port_idx;
> +
> +	hbl_en_set_ops(ndev);
> +
> +	ndev->watchdog_timeo = TX_TIMEOUT;
> +	ndev->min_mtu = hdev->min_raw_mtu;
> +	ndev->max_mtu = hdev->max_raw_mtu;
> +
> +	/* Add loopback capability to the device. */
> +	ndev->hw_features |= NETIF_F_LOOPBACK;
> +
> +	/* If this port was set to loopback, set it also to the ndev features */
> +	if (aux_ops->get_mac_lpbk(aux_dev, port_idx))
> +		ndev->features |= NETIF_F_LOOPBACK;
> +
> +	eth_hw_addr_set(ndev, port->mac_addr);
> +
> +	/* It's more an intelligent poll wherein, we enable the Rx completion EQE event and then
> +	 * start the poll from there.
> +	 * Inside the polling thread, we read packets from hardware and then reschedule the poll
> +	 * only if there are more packets to be processed. Else we re-enable the CQ Arm interrupt
> +	 * and exit the poll.
> +	 */
> +	if (hdev->poll_enable)
> +		hbl_en_rx_poll_trigger_init(port);
> +
> +	netif_carrier_off(ndev);
> +
> +	rc = register_netdev(ndev);
> +	if (rc) {
> +		dev_err(hdev->dev, "Could not register netdevice %d\n", port_idx);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	if (ndev) {
> +		free_netdev(ndev);
> +		port->ndev = NULL;
> +	}
> +
> +	return rc;
> +}
> +
> +static void dump_swap_pkt(struct hbl_en_port *port, struct sk_buff *skb)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	u16 *tmp_buff = (u16 *)skb->data;
> +	u32 port_idx = port->idx;
> +
> +	/* The SKB is ready now (before stripping-out the L2), print its content */
> +	dev_dbg_ratelimited(hdev->dev,
> +			    "Recv [P%d]: dst-mac:%04x%04x%04x, src-mac:%04x%04x%04x, eth-type:%04x, len:%u\n",
> +			    port_idx, swab16(tmp_buff[0]), swab16(tmp_buff[1]), swab16(tmp_buff[2]),
> +			    swab16(tmp_buff[3]), swab16(tmp_buff[4]), swab16(tmp_buff[5]),
> +			    swab16(tmp_buff[6]), skb->len);
> +}
> +
> +int hbl_en_handle_rx(struct hbl_en_port *port, int budget)
> +{
> +	struct hbl_en_device *hdev = port->hdev;
> +	enum hbl_en_eth_pkt_status pkt_status;
> +	struct net_device *ndev = port->ndev;
> +	int rc, pkt_count = 0;
> +	struct sk_buff *skb;
> +	void *pkt_addr;
> +	u32 pkt_size;
> +
> +	if (!netif_carrier_ok(ndev))
> +		return 0;
> +
> +	while (pkt_count < budget) {
> +		pkt_status = hdev->asic_funcs.read_pkt_from_hw(port, &pkt_addr, &pkt_size);
> +
> +		if (pkt_status == ETH_PKT_NONE)
> +			break;
> +
> +		pkt_count++;
> +
> +		if (pkt_status == ETH_PKT_DROP) {
> +			atomic64_inc(&port->net_stats.rx_dropped);
> +			continue;
> +		}
> +
> +		if (hdev->poll_enable)
> +			skb = __netdev_alloc_skb_ip_align(ndev, pkt_size, GFP_KERNEL);
> +		else
> +			skb = napi_alloc_skb(&port->napi, pkt_size);
> +
> +		if (!skb) {
> +			atomic64_inc(&port->net_stats.rx_dropped);
> +			break;
> +		}
> +
> +		skb_copy_to_linear_data(skb, pkt_addr, pkt_size);
> +		skb_put(skb, pkt_size);
> +
> +		if (is_pkt_swap_enabled(hdev))
> +			dump_swap_pkt(port, skb);
> +
> +		skb->protocol = eth_type_trans(skb, ndev);
> +
> +		/* Zero the packet buffer memory to avoid leak in case of wrong
> +		 * size is used when next packet populates the same memory
> +		 */
> +		memset(pkt_addr, 0, pkt_size);
> +
> +		/* polling is done in thread context and hence BH should be disabled */
> +		if (hdev->poll_enable)
> +			local_bh_disable();
> +
> +		rc = netif_receive_skb(skb);
> +
> +		if (hdev->poll_enable)
> +			local_bh_enable();
> +
> +		if (rc == NET_RX_SUCCESS) {
> +			port->net_stats.rx_packets++;
> +			port->net_stats.rx_bytes += pkt_size;
> +		} else {
> +			atomic64_inc(&port->net_stats.rx_dropped);
> +		}
> +	}
> +
> +	return pkt_count;
> +}
> +
> +static bool __hbl_en_rx_poll_schedule(struct hbl_en_port *port, unsigned long delay)
> +{
> +	return queue_delayed_work(port->rx_wq, &port->rx_poll_work, delay);
> +}
> +
> +static void hbl_en_rx_poll_work(struct work_struct *work)
> +{
> +	struct hbl_en_port *port = container_of(work, struct hbl_en_port, rx_poll_work.work);
> +	struct hbl_en_device *hdev = port->hdev;
> +	int pkt_count;
> +
> +	pkt_count = hbl_en_handle_rx(port, NAPI_POLL_WEIGHT);
> +
> +	/* Reschedule the poll if we have consumed budget which means we still have packets to
> +	 * process. Else re-enable the Rx IRQs and exit the work.
> +	 */
> +	if (pkt_count < NAPI_POLL_WEIGHT)
> +		hdev->asic_funcs.reenable_rx_irq(port);
> +	else
> +		__hbl_en_rx_poll_schedule(port, 0);
> +}
> +
> +/* Rx poll init and trigger routines are used in event-driven setups where
> + * Rx polling is initialized once during init or open and started/triggered by the event handler.
> + */
> +void hbl_en_rx_poll_trigger_init(struct hbl_en_port *port)
> +{
> +	INIT_DELAYED_WORK(&port->rx_poll_work, hbl_en_rx_poll_work);
> +}
> +
> +bool hbl_en_rx_poll_start(struct hbl_en_port *port)
> +{
> +	return __hbl_en_rx_poll_schedule(port, msecs_to_jiffies(1));
> +}
> +
> +void hbl_en_rx_poll_stop(struct hbl_en_port *port)
> +{
> +	cancel_delayed_work_sync(&port->rx_poll_work);
> +}
> +
> +static int hbl_en_napi_poll(struct napi_struct *napi, int budget)
> +{
> +	struct hbl_en_port *port = container_of(napi, struct hbl_en_port, napi);
> +	struct hbl_en_device *hdev = port->hdev;
> +	int pkt_count;
> +
> +	/* exit if we are called by netpoll as we free the Tx ring via EQ (if enabled) */
> +	if (!budget)
> +		return 0;
> +
> +	pkt_count = hbl_en_handle_rx(port, budget);
> +
> +	/* If budget not fully consumed, exit the polling mode */
> +	if (pkt_count < budget) {
> +		napi_complete_done(napi, pkt_count);
> +		hdev->asic_funcs.reenable_rx_irq(port);
> +	}
> +
> +	return pkt_count;
> +}
> +
> +static void hbl_en_port_unregister(struct hbl_en_port *port)
> +{
> +	struct net_device *ndev = port->ndev;
> +
> +	unregister_netdev(ndev);
> +	free_netdev(ndev);
> +	port->ndev = NULL;
> +}
> +
> +static int hbl_en_set_asic_funcs(struct hbl_en_device *hdev)
> +{
> +	switch (hdev->asic_type) {
> +	case HBL_ASIC_GAUDI2:
> +	default:
> +		dev_err(hdev->dev, "Unrecognized ASIC type %d\n", hdev->asic_type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void hbl_en_handle_eqe(struct hbl_aux_dev *aux_dev, u32 port, struct hbl_cn_eqe *eqe)
> +{
> +	struct hbl_en_device *hdev = aux_dev->priv;
> +
> +	hdev->asic_funcs.handle_eqe(aux_dev, port, eqe);
> +}
> +
> +static void hbl_en_set_aux_ops(struct hbl_en_device *hdev, bool enable)
> +{
> +	struct hbl_en_aux_ops *aux_ops = hdev->aux_dev->aux_ops;
> +
> +	if (enable) {
> +		aux_ops->ports_reopen = hbl_en_ports_reopen;
> +		aux_ops->ports_stop_prepare = hbl_en_ports_stop_prepare;
> +		aux_ops->ports_stop = hbl_en_ports_stop;
> +		aux_ops->set_port_status = hbl_en_set_port_status;
> +		aux_ops->is_port_open = hbl_en_is_port_open;
> +		aux_ops->get_src_ip = hbl_en_get_src_ip;
> +		aux_ops->reset_stats = hbl_en_reset_stats;
> +		aux_ops->get_mtu = hbl_en_get_mtu;
> +		aux_ops->get_pflags = hbl_en_get_pflags;
> +		aux_ops->set_dev_lpbk = hbl_en_set_dev_lpbk;
> +		aux_ops->handle_eqe = hbl_en_handle_eqe;
> +	} else {
> +		aux_ops->ports_reopen = NULL;
> +		aux_ops->ports_stop_prepare = NULL;
> +		aux_ops->ports_stop = NULL;
> +		aux_ops->set_port_status = NULL;
> +		aux_ops->is_port_open = NULL;
> +		aux_ops->get_src_ip = NULL;
> +		aux_ops->reset_stats = NULL;
> +		aux_ops->get_mtu = NULL;
> +		aux_ops->get_pflags = NULL;
> +		aux_ops->set_dev_lpbk = NULL;
> +		aux_ops->handle_eqe = NULL;
> +	}
> +}
> +
> +int hbl_en_dev_init(struct hbl_en_device *hdev)
> +{
> +	struct hbl_en_asic_funcs *asic_funcs = &hdev->asic_funcs;
> +	struct hbl_en_port *port;
> +	int rc, i, port_cnt = 0;
> +
> +	/* must be called before the call to dev_init() */
> +	rc = hbl_en_set_asic_funcs(hdev);
> +	if (rc) {
> +		dev_err(hdev->dev, "failed to set aux ops\n");
> +		return rc;
> +	}
> +
> +	rc = asic_funcs->dev_init(hdev);
> +	if (rc) {
> +		dev_err(hdev->dev, "device init failed\n");
> +		return rc;
> +	}
> +
> +	/* init the function pointers here before calling hbl_en_port_register which sets up
> +	 * net_device_ops, and its ops might start getting called.
> +	 * If any failure is encountered, these will be made NULL and the core driver won't call
> +	 * them.
> +	 */
> +	hbl_en_set_aux_ops(hdev, true);
> +
> +	/* Port register depends on the above initialization so it must be called here and not
> +	 * before that.
> +	 */
> +	for (i = 0; i < hdev->max_num_of_ports; i++, port_cnt++) {
> +		if (!(hdev->ports_mask & BIT(i)))
> +			continue;
> +
> +		port = &hdev->ports[i];
> +
> +		rc = hbl_en_port_init(port);
> +		if (rc) {
> +			dev_err(hdev->dev, "port init failed\n");
> +			goto unregister_ports;
> +		}
> +
> +		rc = hbl_en_port_register(port);
> +		if (rc) {
> +			dev_err(hdev->dev, "port register failed\n");
> +
> +			hbl_en_port_fini(port);
> +			goto unregister_ports;
> +		}
> +	}
> +
> +	hdev->is_initialized = true;
> +
> +	return 0;
> +
> +unregister_ports:
> +	for (i = 0; i < port_cnt; i++) {
> +		if (!(hdev->ports_mask & BIT(i)))
> +			continue;
> +
> +		port = &hdev->ports[i];
> +
> +		hbl_en_port_unregister(port);
> +		hbl_en_port_fini(port);
> +	}
> +
> +	hbl_en_set_aux_ops(hdev, false);
> +
> +	asic_funcs->dev_fini(hdev);
> +
> +	return rc;
> +}
> +
> +void hbl_en_dev_fini(struct hbl_en_device *hdev)
> +{
> +	struct hbl_en_asic_funcs *asic_funcs = &hdev->asic_funcs;
> +	struct hbl_en_port *port;
> +	int i;
> +
> +	hdev->in_teardown = true;
> +
> +	if (!hdev->is_initialized)
> +		return;
> +
> +	hdev->is_initialized = false;
> +
> +	for (i = 0; i < hdev->max_num_of_ports; i++) {
> +		if (!(hdev->ports_mask & BIT(i)))
> +			continue;
> +
> +		port = &hdev->ports[i];
> +
> +		/* It could be this cleanup flow is called after a failed init flow.
> +		 * Hence we need to check that we indeed have a netdev to unregister.
> +		 */
> +		if (!port->ndev)
> +			continue;
> +
> +		hbl_en_port_unregister(port);
> +		hbl_en_port_fini(port);
> +	}
> +
> +	hbl_en_set_aux_ops(hdev, false);
> +
> +	asic_funcs->dev_fini(hdev);
> +}
> +
> +dma_addr_t hbl_en_dma_map(struct hbl_en_device *hdev, void *addr, int len)
> +{
> +	dma_addr_t dma_addr;
> +
> +	if (hdev->dma_map_support)
> +		dma_addr = dma_map_single(&hdev->pdev->dev, addr, len, DMA_TO_DEVICE);
> +	else
> +		dma_addr = virt_to_phys(addr);
> +
> +	return dma_addr;
> +}
> +
> +void hbl_en_dma_unmap(struct hbl_en_device *hdev, dma_addr_t dma_addr, int len)
> +{
> +	if (hdev->dma_map_support)
> +		dma_unmap_single(&hdev->pdev->dev, dma_addr, len, DMA_TO_DEVICE);
> +}
> diff --git a/drivers/net/ethernet/intel/hbl_en/common/hbl_en.h b/drivers/net/ethernet/intel/hbl_en/common/hbl_en.h
> new file mode 100644
> index 000000000000..15504c1f3cfb
> --- /dev/null
> +++ b/drivers/net/ethernet/intel/hbl_en/common/hbl_en.h
> @@ -0,0 +1,206 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2020-2024 HabanaLabs, Ltd.
> + * Copyright (C) 2023-2024, Intel Corporation.
> + * All Rights Reserved.
> + */
> +
> +#ifndef HABANALABS_EN_H_
> +#define HABANALABS_EN_H_
> +
> +#include <linux/net/intel/cn.h>
> +
> +#include <linux/netdevice.h>
> +#include <linux/pci.h>
> +
> +#define HBL_EN_NAME			"habanalabs_en"
> +
> +#define HBL_EN_PORT(aux_dev, idx)	(&(((struct hbl_en_device *)(aux_dev)->priv)->ports[(idx)]))
> +
> +#define hbl_netdev_priv(ndev) \
> +({ \
> +	typecheck(struct net_device *, ndev); \
> +	*(struct hbl_en_port **)netdev_priv(ndev); \
> +})
> +
> +/**
> + * enum hbl_en_eth_pkt_status - status of Rx Ethernet packet.
> + * ETH_PKT_OK: packet was received successfully.
> + * ETH_PKT_DROP: packet should be dropped.
> + * ETH_PKT_NONE: no available packet.
> + */
> +enum hbl_en_eth_pkt_status {
> +	ETH_PKT_OK,
> +	ETH_PKT_DROP,
> +	ETH_PKT_NONE
> +};
> +
> +/**
> + * struct hbl_en_net_stats - stats of Ethernet interface.
> + * rx_packets: number of packets received.
> + * tx_packets: number of packets sent.
> + * rx_bytes: total bytes of data received.
> + * tx_bytes: total bytes of data sent.
> + * tx_errors: number of errors in the TX.
> + * rx_dropped: number of packets dropped by the RX.
> + * tx_dropped: number of packets dropped by the TX.
> + */
> +struct hbl_en_net_stats {
> +	u64 rx_packets;
> +	u64 tx_packets;
> +	u64 rx_bytes;
> +	u64 tx_bytes;
> +	u64 tx_errors;
> +	atomic64_t rx_dropped;
> +	atomic64_t tx_dropped;
> +};
> +
> +/**
> + * struct hbl_en_port - manage port common structure.
> + * @hdev: habanalabs Ethernet device structure.
> + * @ndev: network device.
> + * @rx_wq: WQ for Rx poll when we cannot schedule NAPI poll.
> + * @mac_addr: HW MAC addresses.
> + * @asic_specific: ASIC specific port structure.
> + * @napi: New API structure.
> + * @rx_poll_work: Rx work for polling mode.
> + * @net_stats: statistics of the ethernet interface.
> + * @in_reset: true if the NIC was marked as in reset, false otherwise. Used to avoid an additional
> + *            stopping of the NIC if a hard reset was re-initiated.
> + * @pflags: ethtool private flags bit mask.
> + * @idx: index of this specific port.
> + * @rx_max_coalesced_frames: Maximum number of packets to receive before an RX interrupt.
> + * @tx_max_coalesced_frames: Maximum number of packets to be sent before a TX interrupt.
> + * @rx_coalesce_usecs: How many usecs to delay an RX interrupt after a packet arrives.
> + * @is_initialized: true if the port H/W is initialized, false otherwise.
> + * @pfc_enable: true if this port supports Priority Flow Control, false otherwise.
> + * @auto_neg_enable: is autoneg enabled.
> + * @auto_neg_resolved: was autoneg phase finished successfully.
> + */
> +struct hbl_en_port {
> +	struct hbl_en_device *hdev;
> +	struct net_device *ndev;
> +	struct workqueue_struct *rx_wq;
> +	char *mac_addr;
> +	void *asic_specific;
> +	struct napi_struct napi;
> +	struct delayed_work rx_poll_work;
> +	struct hbl_en_net_stats net_stats;
> +	atomic_t in_reset;
> +	u32 pflags;
> +	u32 idx;
> +	u32 rx_max_coalesced_frames;
> +	u32 tx_max_coalesced_frames;
> +	u16 rx_coalesce_usecs;
> +	u8 is_initialized;
> +	u8 pfc_enable;
> +	u8 auto_neg_enable;
> +	u8 auto_neg_resolved;
> +};
> +
> +/**
> + * struct hbl_en_asic_funcs - ASIC specific Ethernet functions.
> + * @dev_init: device init.
> + * @dev_fini: device cleanup.
> + * @reenable_rx_irq: re-enable Rx interrupts.
> + * @eth_port_open: initialize and open the Ethernet port.
> + * @eth_port_close: close the Ethernet port.
> + * @write_pkt_to_hw: write skb to HW.
> + * @read_pkt_from_hw: read pkt from HW.
> + * @get_pfc_cnts: get PFC counters.
> + * @set_coalesce: set Tx/Rx coalesce config in HW.
> + * @get_rx_ring size: get max number of elements the Rx ring can contain.
> + * @handle_eqe: Handle a received event.
> + */
> +struct hbl_en_asic_funcs {
> +	int (*dev_init)(struct hbl_en_device *hdev);
> +	void (*dev_fini)(struct hbl_en_device *hdev);
> +	void (*reenable_rx_irq)(struct hbl_en_port *port);
> +	int (*eth_port_open)(struct hbl_en_port *port);
> +	void (*eth_port_close)(struct hbl_en_port *port);
> +	netdev_tx_t (*write_pkt_to_hw)(struct hbl_en_port *port, struct sk_buff *skb);
> +	int (*read_pkt_from_hw)(struct hbl_en_port *port, void **pkt_addr, u32 *pkt_size);
> +	void (*get_pfc_cnts)(struct hbl_en_port *port, void *ptr);
> +	int (*set_coalesce)(struct hbl_en_port *port);
> +	int (*get_rx_ring_size)(struct hbl_en_port *port);
> +	void (*handle_eqe)(struct hbl_aux_dev *aux_dev, u32 port_idx, struct hbl_cn_eqe *eqe);
> +};
> +
> +/**
> + * struct hbl_en_device - habanalabs Ethernet device structure.
> + * @pdev: pointer to PCI device.
> + * @dev: related kernel basic device structure.
> + * @ports: array of all ports manage common structures.
> + * @aux_dev: pointer to auxiliary device.
> + * @asic_specific: ASIC specific device structure.
> + * @fw_ver: FW version.
> + * @qsfp_eeprom: QSFPD EEPROM info.
> + * @mac_addr: array of all MAC addresses.
> + * @asic_funcs: ASIC specific Ethernet functions.
> + * @asic_type: ASIC specific type.
> + * @ports_mask: mask of available ports.
> + * @auto_neg_mask: mask of port with Autonegotiation enabled.
> + * @port_reset_timeout: max time in seconds for a port reset flow to finish.
> + * @pending_reset_long_timeout: long timeout for pending hard reset to finish in seconds.
> + * @max_frm_len: maximum allowed frame length.
> + * @raw_elem_size: size of element in raw buffers.
> + * @max_raw_mtu: maximum MTU size for raw packets.
> + * @min_raw_mtu: minimum MTU size for raw packets.
> + * @pad_size: the pad size in bytes for the skb to transmit.
> + * @core_dev_id: core device ID.
> + * @max_num_of_ports: max number of available ports;
> + * @in_reset: is the entire NIC currently under reset.
> + * @poll_enable: Enable Rx polling rather than IRQ + NAPI.
> + * @in_teardown: true if the NIC is in teardown (during device remove).
> + * @is_initialized: was the device initialized successfully.
> + * @has_eq: true if event queue is supported.
> + * @dma_map_support: HW supports DMA mapping.
> + */
> +struct hbl_en_device {
> +	struct pci_dev *pdev;
> +	struct device *dev;
> +	struct hbl_en_port *ports;
> +	struct hbl_aux_dev *aux_dev;
> +	void *asic_specific;
> +	char *fw_ver;
> +	char *qsfp_eeprom;
> +	char *mac_addr;
> +	struct hbl_en_asic_funcs asic_funcs;
> +	enum hbl_cn_asic_type asic_type;
> +	u64 ports_mask;
> +	u64 auto_neg_mask;
> +	u32 port_reset_timeout;
> +	u32 pending_reset_long_timeout;
> +	u32 max_frm_len;
> +	u32 raw_elem_size;
> +	u16 max_raw_mtu;
> +	u16 min_raw_mtu;
> +	u16 pad_size;
> +	u16 core_dev_id;
> +	u8 max_num_of_ports;
> +	u8 in_reset;
> +	u8 poll_enable;
> +	u8 in_teardown;
> +	u8 is_initialized;
> +	u8 has_eq;
> +	u8 dma_map_support;
> +};
> +
> +int hbl_en_dev_init(struct hbl_en_device *hdev);
> +void hbl_en_dev_fini(struct hbl_en_device *hdev);
> +
> +const struct ethtool_ops *hbl_en_ethtool_get_ops(struct net_device *ndev);
> +void hbl_en_ethtool_init_coalesce(struct hbl_en_port *port);
> +
> +extern const struct dcbnl_rtnl_ops hbl_en_dcbnl_ops;
> +
> +bool hbl_en_rx_poll_start(struct hbl_en_port *port);
> +void hbl_en_rx_poll_stop(struct hbl_en_port *port);
> +void hbl_en_rx_poll_trigger_init(struct hbl_en_port *port);
> +int hbl_en_port_reset(struct hbl_en_port *port);
> +int hbl_en_port_reset_locked(struct hbl_aux_dev *aux_dev, u32 port_idx);
> +int hbl_en_handle_rx(struct hbl_en_port *port, int budget);
> +dma_addr_t hbl_en_dma_map(struct hbl_en_device *hdev, void *addr, int len);
> +void hbl_en_dma_unmap(struct hbl_en_device *hdev, dma_addr_t dma_addr, int len);
> +
> +#endif /* HABANALABS_EN_H_ */
> diff --git a/drivers/net/ethernet/intel/hbl_en/common/hbl_en_dcbnl.c b/drivers/net/ethernet/intel/hbl_en/common/hbl_en_dcbnl.c
> new file mode 100644
> index 000000000000..5d718579a2b6
> --- /dev/null
> +++ b/drivers/net/ethernet/intel/hbl_en/common/hbl_en_dcbnl.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2020-2024 HabanaLabs, Ltd.
> + * Copyright (C) 2023-2024, Intel Corporation.
> + * All Rights Reserved.
> + */
> +
> +#include "hbl_en.h"
> +
> +#define PFC_PRIO_MASK_ALL	GENMASK(HBL_EN_PFC_PRIO_NUM - 1, 0)
> +#define PFC_PRIO_MASK_NONE	0
> +
> +#ifdef CONFIG_DCB
> +static int hbl_en_dcbnl_ieee_getpfc(struct net_device *netdev, struct ieee_pfc *pfc)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +	struct hbl_en_device *hdev;
> +	u32 port_idx;
> +
> +	hdev = port->hdev;
> +	port_idx = port->idx;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		dev_dbg_ratelimited(hdev->dev, "port %d is in reset, can't get PFC", port_idx);
> +		return -EBUSY;
> +	}
> +
> +	pfc->pfc_en = port->pfc_enable ? PFC_PRIO_MASK_ALL : PFC_PRIO_MASK_NONE;
> +	pfc->pfc_cap = HBL_EN_PFC_PRIO_NUM;
> +
> +	hdev->asic_funcs.get_pfc_cnts(port, pfc);
> +
> +	atomic_set(&port->in_reset, 0);
> +
> +	return 0;
> +}
> +
> +static int hbl_en_dcbnl_ieee_setpfc(struct net_device *netdev, struct ieee_pfc *pfc)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	struct hbl_en_device *hdev;
> +	u8 curr_pfc_en;
> +	u32 port_idx;
> +	int rc = 0;
> +
> +	hdev = port->hdev;
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +	port_idx = port->idx;
> +
> +	if (pfc->pfc_en & ~PFC_PRIO_MASK_ALL) {
> +		dev_dbg_ratelimited(hdev->dev, "PFC supports %d priorities only, port %d\n",
> +				    HBL_EN_PFC_PRIO_NUM, port_idx);
> +		return -EINVAL;
> +	}
> +
> +	if (pfc->pfc_en != PFC_PRIO_MASK_NONE && pfc->pfc_en != PFC_PRIO_MASK_ALL) {
> +		dev_dbg_ratelimited(hdev->dev,
> +				    "PFC should be enabled/disabled on all priorities, port %d\n",
> +				    port_idx);
> +		return -EINVAL;
> +	}
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		dev_dbg_ratelimited(hdev->dev, "port %d is in reset, can't set PFC", port_idx);
> +		return -EBUSY;
> +	}
> +
> +	curr_pfc_en = port->pfc_enable ? PFC_PRIO_MASK_ALL : PFC_PRIO_MASK_NONE;
> +
> +	if (pfc->pfc_en == curr_pfc_en)
> +		goto out;
> +
> +	port->pfc_enable = !port->pfc_enable;
> +
> +	rc = aux_ops->set_pfc(aux_dev, port_idx, port->pfc_enable);
> +
> +out:
> +	atomic_set(&port->in_reset, 0);
> +
> +	return rc;
> +}
> +
> +static u8 hbl_en_dcbnl_getdcbx(struct net_device *netdev)
> +{
> +	return DCB_CAP_DCBX_HOST | DCB_CAP_DCBX_VER_IEEE;
> +}
> +
> +static u8 hbl_en_dcbnl_setdcbx(struct net_device *netdev, u8 mode)
> +{
> +	return !(mode == (DCB_CAP_DCBX_HOST | DCB_CAP_DCBX_VER_IEEE));
> +}
> +
> +const struct dcbnl_rtnl_ops hbl_en_dcbnl_ops = {
> +	.ieee_getpfc	= hbl_en_dcbnl_ieee_getpfc,
> +	.ieee_setpfc	= hbl_en_dcbnl_ieee_setpfc,
> +	.getdcbx	= hbl_en_dcbnl_getdcbx,
> +	.setdcbx	= hbl_en_dcbnl_setdcbx
> +};
> +#endif
> diff --git a/drivers/net/ethernet/intel/hbl_en/common/hbl_en_drv.c b/drivers/net/ethernet/intel/hbl_en/common/hbl_en_drv.c
> new file mode 100644
> index 000000000000..23a87d36ded5
> --- /dev/null
> +++ b/drivers/net/ethernet/intel/hbl_en/common/hbl_en_drv.c
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2020-2024 HabanaLabs, Ltd.
> + * Copyright (C) 2023-2024, Intel Corporation.
> + * All Rights Reserved.
> + */
> +
> +#define pr_fmt(fmt)		"habanalabs_en: " fmt
> +
> +#include "hbl_en.h"
> +
> +#include <linux/module.h>
> +#include <linux/auxiliary_bus.h>
> +
> +#define HBL_DRIVER_AUTHOR	"HabanaLabs Kernel Driver Team"
> +
> +#define HBL_DRIVER_DESC		"HabanaLabs AI accelerators Ethernet driver"
> +
> +MODULE_AUTHOR(HBL_DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(HBL_DRIVER_DESC);
> +MODULE_LICENSE("GPL");
> +
> +static bool poll_enable;
> +
> +module_param(poll_enable, bool, 0444);
> +MODULE_PARM_DESC(poll_enable,
> +		 "Enable Rx polling rather than IRQ + NAPI (0 = no, 1 = yes, default: no)");
> +
> +static int hdev_init(struct hbl_aux_dev *aux_dev)
> +{
> +	struct hbl_en_aux_data *aux_data = aux_dev->aux_data;
> +	struct hbl_en_port *ports, *port;
> +	struct hbl_en_device *hdev;
> +	int rc, i;
> +
> +	hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);
> +	if (!hdev)
> +		return -ENOMEM;
> +
> +	ports = kcalloc(aux_data->max_num_of_ports, sizeof(*ports), GFP_KERNEL);
> +	if (!ports) {
> +		rc = -ENOMEM;
> +		goto ports_alloc_fail;
> +	}
> +
> +	aux_dev->priv = hdev;
> +	hdev->aux_dev = aux_dev;
> +	hdev->ports = ports;
> +	hdev->pdev = aux_data->pdev;
> +	hdev->dev = aux_data->dev;
> +	hdev->ports_mask = aux_data->ports_mask;
> +	hdev->auto_neg_mask = aux_data->auto_neg_mask;
> +	hdev->max_num_of_ports = aux_data->max_num_of_ports;
> +	hdev->core_dev_id = aux_data->id;
> +	hdev->fw_ver = aux_data->fw_ver;
> +	hdev->qsfp_eeprom = aux_data->qsfp_eeprom;
> +	hdev->asic_type = aux_data->asic_type;
> +	hdev->pending_reset_long_timeout = aux_data->pending_reset_long_timeout;
> +	hdev->max_frm_len = aux_data->max_frm_len;
> +	hdev->raw_elem_size = aux_data->raw_elem_size;
> +	hdev->max_raw_mtu = aux_data->max_raw_mtu;
> +	hdev->min_raw_mtu = aux_data->min_raw_mtu;
> +	hdev->pad_size = ETH_ZLEN;
> +	hdev->has_eq = aux_data->has_eq;
> +	hdev->dma_map_support = true;
> +	hdev->poll_enable = poll_enable;
> +
> +	for (i = 0; i < hdev->max_num_of_ports; i++) {
> +		if (!(hdev->ports_mask & BIT(i)))
> +			continue;
> +
> +		port = &hdev->ports[i];
> +		port->hdev = hdev;
> +		port->idx = i;
> +		port->pfc_enable = true;
> +		port->pflags = PFLAGS_PCS_LINK_CHECK | PFLAGS_PHY_AUTO_NEG_LPBK;
> +		port->mac_addr = aux_data->mac_addr[i];
> +		port->auto_neg_enable = !!(aux_data->auto_neg_mask & BIT(i));
> +	}
> +
> +	return 0;
> +
> +ports_alloc_fail:
> +	kfree(hdev);
> +
> +	return rc;
> +}
> +
> +static void hdev_fini(struct hbl_aux_dev *aux_dev)
> +{
> +	struct hbl_en_device *hdev = aux_dev->priv;
> +
> +	kfree(hdev->ports);
> +	kfree(hdev);
> +	aux_dev->priv = NULL;
> +}
> +
> +static const struct auxiliary_device_id hbl_en_id_table[] = {
> +	{ .name = "habanalabs_cn.en", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(auxiliary, hbl_en_id_table);
> +
> +static int hbl_en_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
> +{
> +	struct hbl_aux_dev *aux_dev = container_of(adev, struct hbl_aux_dev, adev);
> +	struct hbl_en_aux_ops *aux_ops = aux_dev->aux_ops;
> +	struct hbl_en_device *hdev;
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
> +		dev_err(hdev->dev, "Failed to increment %s module refcount\n", HBL_EN_NAME);
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
> +		dev_notice_once(hdev->dev, "Waiting for hard reset to finish before probing en\n");
> +
> +		msleep_interruptible(MSEC_PER_SEC);
> +	}
> +
> +	rc = hbl_en_dev_init(hdev);
> +	if (rc) {
> +		dev_err(hdev->dev, "Failed to init en device\n");
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
> +
> +/* This function can be called only from the CN driver when deleting the aux bus, because we
> + * incremented the module refcount on probing. Hence no need to protect here from hard reset.
> + */
> +static void hbl_en_remove(struct auxiliary_device *adev)
> +{
> +	struct hbl_aux_dev *aux_dev = container_of(adev, struct hbl_aux_dev, adev);
> +	struct hbl_en_device *hdev = aux_dev->priv;
> +
> +	if (!hdev)
> +		return;
> +
> +	hbl_en_dev_fini(hdev);
> +
> +	/* allow module unloading as now it is detached */
> +	module_put(THIS_MODULE);
> +
> +	hdev_fini(aux_dev);
> +}
> +
> +static struct auxiliary_driver hbl_en_driver = {
> +	.name = "eth",
> +	.probe = hbl_en_probe,
> +	.remove = hbl_en_remove,
> +	.id_table = hbl_en_id_table,
> +};
> +
> +static int __init hbl_en_init(void)
> +{
> +	pr_info("loading driver\n");
> +
> +	return auxiliary_driver_register(&hbl_en_driver);
> +}
> +
> +static void __exit hbl_en_exit(void)
> +{
> +	auxiliary_driver_unregister(&hbl_en_driver);
> +
> +	pr_info("driver removed\n");
> +}
> +
> +module_init(hbl_en_init);
> +module_exit(hbl_en_exit);
> diff --git a/drivers/net/ethernet/intel/hbl_en/common/hbl_en_ethtool.c b/drivers/net/ethernet/intel/hbl_en/common/hbl_en_ethtool.c
> new file mode 100644
> index 000000000000..1d14d283409b
> --- /dev/null
> +++ b/drivers/net/ethernet/intel/hbl_en/common/hbl_en_ethtool.c
> @@ -0,0 +1,452 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2020-2024 HabanaLabs, Ltd.
> + * Copyright (C) 2023-2024, Intel Corporation.
> + * All Rights Reserved.
> + */
> +
> +#include "hbl_en.h"
> +#include <linux/ethtool.h>
> +
> +#define RX_COALESCED_FRAMES_MIN		1
> +#define TX_COALESCED_FRAMES_MIN		1
> +#define TX_COALESCED_FRAMES_MAX		10
> +
> +static const char pflags_str[][ETH_GSTRING_LEN] = {
> +	"pcs-link-check",
> +	"phy-auto-neg-lpbk",
> +};
> +
> +#define NIC_STAT(m) {#m, offsetof(struct hbl_en_port, net_stats.m)}
> +
> +static struct hbl_cn_stat netdev_eth_stats[] = {
> +	NIC_STAT(rx_packets),
> +	NIC_STAT(tx_packets),
> +	NIC_STAT(rx_bytes),
> +	NIC_STAT(tx_bytes),
> +	NIC_STAT(tx_errors),
> +	NIC_STAT(rx_dropped),
> +	NIC_STAT(tx_dropped)
> +};
> +
> +static size_t pflags_str_len = ARRAY_SIZE(pflags_str);
> +static size_t netdev_eth_stats_len = ARRAY_SIZE(netdev_eth_stats);
> +
> +static void hbl_en_ethtool_get_drvinfo(struct net_device *ndev, struct ethtool_drvinfo *drvinfo)
> +{
> +	struct hbl_en_device *hdev;
> +	struct hbl_en_port *port;
> +
> +	port = hbl_netdev_priv(ndev);
> +	hdev = port->hdev;
> +
> +	strscpy(drvinfo->driver, HBL_EN_NAME, sizeof(drvinfo->driver));
> +	strscpy(drvinfo->fw_version, hdev->fw_ver, sizeof(drvinfo->fw_version));
> +	strscpy(drvinfo->bus_info, pci_name(hdev->pdev), sizeof(drvinfo->bus_info));
> +}
> +
> +static int hbl_en_ethtool_get_module_info(struct net_device *ndev, struct ethtool_modinfo *modinfo)
> +{
> +	modinfo->eeprom_len = ETH_MODULE_SFF_8636_LEN;
> +	modinfo->type = ETH_MODULE_SFF_8636;
> +
> +	return 0;
> +}
> +
> +static int hbl_en_ethtool_get_module_eeprom(struct net_device *ndev, struct ethtool_eeprom *ee,
> +					    u8 *data)
> +{
> +	struct hbl_en_device *hdev;
> +	struct hbl_en_port *port;
> +	u32 first, last, len;
> +	u8 *qsfp_eeprom;
> +
> +	port = hbl_netdev_priv(ndev);
> +	hdev = port->hdev;
> +	qsfp_eeprom = hdev->qsfp_eeprom;
> +
> +	if (ee->len == 0)
> +		return -EINVAL;
> +
> +	first = ee->offset;
> +	last = ee->offset + ee->len;
> +
> +	if (first < ETH_MODULE_SFF_8636_LEN) {
> +		len = min_t(unsigned int, last, ETH_MODULE_SFF_8079_LEN);
> +		len -= first;
> +
> +		memcpy(data, qsfp_eeprom + first, len);
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 hbl_en_ethtool_get_priv_flags(struct net_device *ndev)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(ndev);
> +
> +	return port->pflags;
> +}
> +
> +static int hbl_en_ethtool_set_priv_flags(struct net_device *ndev, u32 priv_flags)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(ndev);
> +
> +	port->pflags = priv_flags;
> +
> +	return 0;
> +}
> +
> +static int hbl_en_ethtool_get_link_ksettings(struct net_device *ndev,
> +					     struct ethtool_link_ksettings *cmd)
> +{
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	struct hbl_en_device *hdev;
> +	struct hbl_en_port *port;
> +	u32 port_idx, speed;
> +
> +	port = hbl_netdev_priv(ndev);
> +	hdev = port->hdev;
> +	port_idx = port->idx;
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +	speed = aux_ops->get_speed(aux_dev, port_idx);
> +
> +	cmd->base.speed = speed;
> +	cmd->base.duplex = DUPLEX_FULL;
> +
> +	ethtool_link_ksettings_zero_link_mode(cmd, supported);
> +	ethtool_link_ksettings_zero_link_mode(cmd, advertising);
> +
> +	switch (speed) {
> +	case SPEED_100000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 100000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 100000baseSR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 100000baseKR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 100000baseLR4_ER4_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 100000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 100000baseSR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 100000baseKR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 100000baseLR4_ER4_Full);
> +
> +		cmd->base.port = PORT_FIBRE;
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, FIBRE);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, FIBRE);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, Backplane);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, Backplane);
> +		break;
> +	case SPEED_50000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 50000baseSR2_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 50000baseCR2_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 50000baseKR2_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 50000baseSR2_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 50000baseCR2_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 50000baseKR2_Full);
> +		break;
> +	case SPEED_25000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 25000baseCR_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 25000baseCR_Full);
> +		break;
> +	case SPEED_200000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 200000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 200000baseKR4_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 200000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 200000baseKR4_Full);
> +		break;
> +	case SPEED_400000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 400000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 400000baseKR4_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 400000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 400000baseKR4_Full);
> +		break;
> +	default:
> +		netdev_err(port->ndev, "unknown speed %d\n", speed);
> +		return -EFAULT;
> +	}
> +
> +	ethtool_link_ksettings_add_link_mode(cmd, supported, Autoneg);
> +
> +	if (port->auto_neg_enable) {
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, Autoneg);
> +		cmd->base.autoneg = AUTONEG_ENABLE;
> +		if (port->auto_neg_resolved)
> +			ethtool_link_ksettings_add_link_mode(cmd, lp_advertising, Autoneg);
> +	} else {
> +		cmd->base.autoneg = AUTONEG_DISABLE;
> +	}
> +
> +	ethtool_link_ksettings_add_link_mode(cmd, supported, Pause);
> +
> +	if (port->pfc_enable)
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, Pause);
> +
> +	return 0;
> +}
> +
> +/* only autoneg is mutable */
> +static bool check_immutable_ksettings(const struct ethtool_link_ksettings *old_cmd,
> +				      const struct ethtool_link_ksettings *new_cmd)
> +{
> +	return (old_cmd->base.speed == new_cmd->base.speed) &&
> +	       (old_cmd->base.duplex == new_cmd->base.duplex) &&
> +	       (old_cmd->base.port == new_cmd->base.port) &&
> +	       (old_cmd->base.phy_address == new_cmd->base.phy_address) &&
> +	       (old_cmd->base.eth_tp_mdix_ctrl == new_cmd->base.eth_tp_mdix_ctrl) &&
> +	       bitmap_equal(old_cmd->link_modes.advertising, new_cmd->link_modes.advertising,
> +			    __ETHTOOL_LINK_MODE_MASK_NBITS);
> +}
> +
> +static int
> +hbl_en_ethtool_set_link_ksettings(struct net_device *ndev, const struct ethtool_link_ksettings *cmd)
> +{
> +	struct ethtool_link_ksettings curr_cmd;
> +	struct hbl_en_device *hdev;
> +	struct hbl_en_port *port;
> +	bool auto_neg;
> +	u32 port_idx;
> +	int rc;
> +
> +	port = hbl_netdev_priv(ndev);
> +	hdev = port->hdev;
> +	port_idx = port->idx;
> +
> +	memset(&curr_cmd, 0, sizeof(struct ethtool_link_ksettings));
> +
> +	rc = hbl_en_ethtool_get_link_ksettings(ndev, &curr_cmd);
> +	if (rc)
> +		return rc;
> +
> +	if (!check_immutable_ksettings(&curr_cmd, cmd))
> +		return -EOPNOTSUPP;
> +
> +	auto_neg = cmd->base.autoneg == AUTONEG_ENABLE;
> +
> +	if (port->auto_neg_enable == auto_neg)
> +		return 0;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		netdev_err(port->ndev, "port is in reset, can't update settings\n");
> +		return -EBUSY;
> +	}
> +
> +	if (auto_neg && !(hdev->auto_neg_mask & BIT(port_idx))) {
> +		netdev_err(port->ndev, "port autoneg is disabled by BMC\n");
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +
> +	port->auto_neg_enable = auto_neg;
> +
> +	if (netif_running(port->ndev)) {
> +		rc = hbl_en_port_reset(port);
> +		if (rc)
> +			netdev_err(port->ndev, "Failed to reset port for settings update, rc %d\n",
> +				   rc);
> +	}
> +
> +out:
> +	atomic_set(&port->in_reset, 0);
> +
> +	return rc;
> +}
> +
> +static int hbl_en_ethtool_get_sset_count(struct net_device *ndev, int sset)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(ndev);
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	switch (sset) {
> +	case ETH_SS_STATS:
> +		return netdev_eth_stats_len + aux_ops->get_cnts_num(aux_dev, port_idx);
> +	case ETH_SS_PRIV_FLAGS:
> +		return pflags_str_len;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static void hbl_en_ethtool_get_strings(struct net_device *ndev, u32 stringset, u8 *data)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(ndev);
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +	int i;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	switch (stringset) {
> +	case ETH_SS_STATS:
> +		for (i = 0; i < netdev_eth_stats_len; i++)
> +			ethtool_puts(&data, netdev_eth_stats[i].str);
> +
> +		aux_ops->get_cnts_names(aux_dev, port_idx, data);
> +		break;
> +	case ETH_SS_PRIV_FLAGS:
> +		for (i = 0; i < pflags_str_len; i++)
> +			ethtool_puts(&data, pflags_str[i]);
> +		break;
> +	}
> +}
> +
> +static void hbl_en_ethtool_get_ethtool_stats(struct net_device *ndev,
> +					     __always_unused struct ethtool_stats *stats, u64 *data)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(ndev);
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	struct hbl_en_device *hdev;
> +	u32 port_idx;
> +	char *p;
> +	int i;
> +
> +	hdev = port->hdev;
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +	port_idx = port->idx;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		dev_info_ratelimited(hdev->dev, "port %d is in reset, can't get ethtool stats",
> +				     port_idx);
> +		return;
> +	}
> +
> +	/* Even though the Ethernet Rx/Tx flow might update the stats in parallel, there is not an
> +	 * absolute need for synchronisation. This is because, missing few counts of these stats is
> +	 * much better than adding a lock to synchronize and increase the overhead of the Rx/Tx
> +	 * flows. In worst case scenario, reader will get stale stats. He will receive updated
> +	 * stats in next read.
> +	 */
> +	for (i = 0; i < netdev_eth_stats_len; i++) {
> +		p = (char *)port + netdev_eth_stats[i].lo_offset;
> +		data[i] = *(u32 *)p;
> +	}
> +
> +	data += i;
> +
> +	aux_ops->get_cnts_values(aux_dev, port_idx, data);
> +
> +	atomic_set(&port->in_reset, 0);
> +}
> +
> +static int hbl_en_ethtool_get_coalesce(struct net_device *ndev,
> +				       struct ethtool_coalesce *coal,
> +				       struct kernel_ethtool_coalesce *kernel_coal,
> +				       struct netlink_ext_ack *extack)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(ndev);
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	aux_ops->ctrl_lock(aux_dev, port_idx);
> +
> +	coal->tx_max_coalesced_frames = port->tx_max_coalesced_frames;
> +	coal->rx_coalesce_usecs = port->rx_coalesce_usecs;
> +	coal->rx_max_coalesced_frames = port->rx_max_coalesced_frames;
> +
> +	aux_ops->ctrl_unlock(aux_dev, port_idx);
> +
> +	return 0;
> +}
> +
> +static int hbl_en_ethtool_set_coalesce(struct net_device *ndev,
> +				       struct ethtool_coalesce *coal,
> +				       struct kernel_ethtool_coalesce *kernel_coal,
> +				       struct netlink_ext_ack *extack)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(ndev);
> +	struct hbl_en_device *hdev = port->hdev;
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	u32 port_idx = port->idx;
> +	int rc, rx_ring_size;
> +
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		netdev_err(port->ndev, "port is in reset, can't update settings\n");
> +		return -EBUSY;
> +	}
> +
> +	if (coal->tx_max_coalesced_frames < TX_COALESCED_FRAMES_MIN ||
> +	    coal->tx_max_coalesced_frames > TX_COALESCED_FRAMES_MAX) {
> +		netdev_err(ndev, "tx max_coalesced_frames should be between %d and %d\n",
> +			   TX_COALESCED_FRAMES_MIN, TX_COALESCED_FRAMES_MAX);
> +		rc = -EINVAL;
> +		goto atomic_out;
> +	}
> +
> +	rx_ring_size = hdev->asic_funcs.get_rx_ring_size(port);
> +	if (coal->rx_max_coalesced_frames < RX_COALESCED_FRAMES_MIN ||
> +	    coal->rx_max_coalesced_frames >= rx_ring_size) {
> +		netdev_err(ndev, "rx max_coalesced_frames should be between %d and %d\n",
> +			   RX_COALESCED_FRAMES_MIN, rx_ring_size);
> +		rc = -EINVAL;
> +		goto atomic_out;
> +	}
> +
> +	aux_ops->ctrl_lock(aux_dev, port_idx);
> +
> +	port->tx_max_coalesced_frames = coal->tx_max_coalesced_frames;
> +	port->rx_coalesce_usecs = coal->rx_coalesce_usecs;
> +	port->rx_max_coalesced_frames = coal->rx_max_coalesced_frames;
> +
> +	rc = hdev->asic_funcs.set_coalesce(port);
> +
> +	aux_ops->ctrl_unlock(aux_dev, port_idx);
> +
> +atomic_out:
> +	atomic_set(&port->in_reset, 0);
> +	return rc;
> +}
> +
> +void hbl_en_ethtool_init_coalesce(struct hbl_en_port *port)
> +{
> +	port->rx_coalesce_usecs = CQ_ARM_TIMEOUT_USEC;
> +	port->rx_max_coalesced_frames = 1;
> +	port->tx_max_coalesced_frames = 1;
> +}
> +
> +static const struct ethtool_ops hbl_en_ethtool_ops_coalesce = {
> +	.supported_coalesce_params = ETHTOOL_COALESCE_RX_USECS | ETHTOOL_COALESCE_RX_MAX_FRAMES |
> +				     ETHTOOL_COALESCE_TX_MAX_FRAMES,
> +	.get_drvinfo = hbl_en_ethtool_get_drvinfo,
> +	.get_link = ethtool_op_get_link,
> +	.get_module_info = hbl_en_ethtool_get_module_info,
> +	.get_module_eeprom = hbl_en_ethtool_get_module_eeprom,
> +	.get_priv_flags = hbl_en_ethtool_get_priv_flags,
> +	.set_priv_flags = hbl_en_ethtool_set_priv_flags,
> +	.get_link_ksettings = hbl_en_ethtool_get_link_ksettings,
> +	.set_link_ksettings = hbl_en_ethtool_set_link_ksettings,
> +	.get_sset_count = hbl_en_ethtool_get_sset_count,
> +	.get_strings = hbl_en_ethtool_get_strings,
> +	.get_ethtool_stats = hbl_en_ethtool_get_ethtool_stats,
> +	.get_coalesce = hbl_en_ethtool_get_coalesce,
> +	.set_coalesce = hbl_en_ethtool_set_coalesce,
> +};
> +
> +const struct ethtool_ops *hbl_en_ethtool_get_ops(struct net_device *ndev)
> +{
> +	return &hbl_en_ethtool_ops_coalesce;
> +}

