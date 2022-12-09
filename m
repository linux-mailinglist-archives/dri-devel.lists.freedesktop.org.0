Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F666481BF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 12:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D7D10E521;
	Fri,  9 Dec 2022 11:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7161D10E521
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 11:30:31 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p3bZw-0004FK-Oh; Fri, 09 Dec 2022 12:30:09 +0100
Message-ID: <cb1ad1aadb29f03c559a7ca15b9acd37dcd49ab7.camel@pengutronix.de>
Subject: Re: [PATCH v5 01/10] drm: bridge: cadence: convert mailbox
 functions to macro functions
From: Lucas Stach <l.stach@pengutronix.de>
To: Sandor Yu <Sandor.yu@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, robert.foss@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com,  airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org,  krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de,  festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Date: Fri, 09 Dec 2022 12:29:59 +0100
In-Reply-To: <be4532b834109595b0fbf3562bf072caf2852a01.1669620155.git.Sandor.yu@nxp.com>
References: <cover.1669620155.git.Sandor.yu@nxp.com>
 <be4532b834109595b0fbf3562bf072caf2852a01.1669620155.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: oliver.brown@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

Am Montag, dem 28.11.2022 um 15:36 +0800 schrieb Sandor Yu:
> Mailbox access functions could be share to other mhdp driver and
> HDP-TX HDMI/DP PHY drivers, move those functions to head file
> include/drm/bridge/cdns-mhdp-mailbox.h and convert them to
> macro functions.
> 

This does not look right. If those functions need to be called from
other units and implemented in the header, they should simply be static
inline functions rather than macros. Those macros obfuscate the code a
lot.

However, I don't believe those should be called by other units
directly. From what I can see this is mostly used by the PHY drivers,
to interact with the mailbox and read/write PHY registers. However,
there is no locking between the bridge and the core driver in any form,
so they could corrupt the mailbox state. The PHY drivers have mailbox
mutexes, but as far as I can see they aren't used and even if they were
they would not guard against concurrent access to the mailbox between
the bridge and the PHY driver.

I think the right thing to do here would be to have a regmap
implementation in the bridge driver, which uses the mailbox functions
to implement the register access. Then this regmap could be passed down
from the bridge driver to the PHY, which should simply be a child node
of the bridge in DT.

Regards,
Lucas

> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 197 +-------------
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   1 -
>  include/drm/bridge/cdns-mhdp-mailbox.h        | 240 ++++++++++++++++++
>  3 files changed, 242 insertions(+), 196 deletions(-)
>  create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 31442a922502..b77b0ddcc9b3 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -36,6 +36,7 @@
>  #include <linux/slab.h>
>  #include <linux/wait.h>
>  
> +#include <drm/bridge/cdns-mhdp-mailbox.h>
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/display/drm_hdcp_helper.h>
>  #include <drm/drm_atomic.h>
> @@ -55,200 +56,6 @@
>  #include "cdns-mhdp8546-hdcp.h"
>  #include "cdns-mhdp8546-j721e.h"
>  
> -static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
> -{
> -	int ret, empty;
> -
> -	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> -
> -	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_EMPTY,
> -				 empty, !empty, MAILBOX_RETRY_US,
> -				 MAILBOX_TIMEOUT_US);
> -	if (ret < 0)
> -		return ret;
> -
> -	return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
> -}
> -
> -static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
> -{
> -	int ret, full;
> -
> -	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> -
> -	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
> -				 full, !full, MAILBOX_RETRY_US,
> -				 MAILBOX_TIMEOUT_US);
> -	if (ret < 0)
> -		return ret;
> -
> -	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
> -
> -	return 0;
> -}
> -
> -static int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
> -					 u8 module_id, u8 opcode,
> -					 u16 req_size)
> -{
> -	u32 mbox_size, i;
> -	u8 header[4];
> -	int ret;
> -
> -	/* read the header of the message */
> -	for (i = 0; i < sizeof(header); i++) {
> -		ret = cdns_mhdp_mailbox_read(mhdp);
> -		if (ret < 0)
> -			return ret;
> -
> -		header[i] = ret;
> -	}
> -
> -	mbox_size = get_unaligned_be16(header + 2);
> -
> -	if (opcode != header[0] || module_id != header[1] ||
> -	    req_size != mbox_size) {
> -		/*
> -		 * If the message in mailbox is not what we want, we need to
> -		 * clear the mailbox by reading its contents.
> -		 */
> -		for (i = 0; i < mbox_size; i++)
> -			if (cdns_mhdp_mailbox_read(mhdp) < 0)
> -				break;
> -
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
> -				       u8 *buff, u16 buff_size)
> -{
> -	u32 i;
> -	int ret;
> -
> -	for (i = 0; i < buff_size; i++) {
> -		ret = cdns_mhdp_mailbox_read(mhdp);
> -		if (ret < 0)
> -			return ret;
> -
> -		buff[i] = ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
> -				  u8 opcode, u16 size, u8 *message)
> -{
> -	u8 header[4];
> -	int ret, i;
> -
> -	header[0] = opcode;
> -	header[1] = module_id;
> -	put_unaligned_be16(size, header + 2);
> -
> -	for (i = 0; i < sizeof(header); i++) {
> -		ret = cdns_mhdp_mailbox_write(mhdp, header[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	for (i = 0; i < size; i++) {
> -		ret = cdns_mhdp_mailbox_write(mhdp, message[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static
> -int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr, u32 *value)
> -{
> -	u8 msg[4], resp[8];
> -	int ret;
> -
> -	put_unaligned_be32(addr, msg);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
> -				     GENERAL_REGISTER_READ,
> -				     sizeof(msg), msg);
> -	if (ret)
> -		goto out;
> -
> -	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,
> -					    GENERAL_REGISTER_READ,
> -					    sizeof(resp));
> -	if (ret)
> -		goto out;
> -
> -	ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));
> -	if (ret)
> -		goto out;
> -
> -	/* Returned address value should be the same as requested */
> -	if (memcmp(msg, resp, sizeof(msg))) {
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
> -	*value = get_unaligned_be32(resp + 4);
> -
> -out:
> -	mutex_unlock(&mhdp->mbox_mutex);
> -	if (ret) {
> -		dev_err(mhdp->dev, "Failed to read register\n");
> -		*value = 0;
> -	}
> -
> -	return ret;
> -}
> -
> -static
> -int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr, u32 val)
> -{
> -	u8 msg[6];
> -	int ret;
> -
> -	put_unaligned_be16(addr, msg);
> -	put_unaligned_be32(val, msg + 2);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> -				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
> -
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	return ret;
> -}
> -
> -static
> -int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
> -			    u8 start_bit, u8 bits_no, u32 val)
> -{
> -	u8 field[8];
> -	int ret;
> -
> -	put_unaligned_be16(addr, field);
> -	field[2] = start_bit;
> -	field[3] = bits_no;
> -	put_unaligned_be32(val, field + 4);
> -
> -	mutex_lock(&mhdp->mbox_mutex);
> -
> -	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> -				     DPTX_WRITE_FIELD, sizeof(field), field);
> -
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
> -	return ret;
> -}
> -
>  static
>  int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
>  			u32 addr, u8 *data, u16 len)
> @@ -2058,7 +1865,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
>  				     struct drm_bridge_state *bridge_state)
>  {
>  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> -	u32 resp;
> +	u32 resp = 0;
>  
>  	dev_dbg(mhdp->dev, "%s\n", __func__);
>  
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> index bedddd510d17..10c878bf0e63 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> @@ -212,7 +212,6 @@ struct phy;
>  #define MB_MODULE_ID_HDCP_TX			0x07
>  #define MB_MODULE_ID_HDCP_RX			0x08
>  #define MB_MODULE_ID_HDCP_GENERAL		0x09
> -#define MB_MODULE_ID_GENERAL			0x0a
>  
>  /* firmware and opcodes */
>  #define FW_NAME					"cadence/mhdp8546.bin"
> diff --git a/include/drm/bridge/cdns-mhdp-mailbox.h b/include/drm/bridge/cdns-mhdp-mailbox.h
> new file mode 100644
> index 000000000000..0249322a74b0
> --- /dev/null
> +++ b/include/drm/bridge/cdns-mhdp-mailbox.h
> @@ -0,0 +1,240 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Cadence MHDP Firmware Access API function by Malibox.
> + *
> + * Copyright (C) 2022 NXP Semiconductor, Inc.
> + *
> + */
> +#ifndef CDNS_MHDP_MAILBOX_H
> +#define CDNS_MHDP_MAILBOX_H
> +
> +#include <asm/unaligned.h>
> +#include <linux/iopoll.h>
> +
> +/* mailbox regs offset */
> +#define CDNS_MAILBOX_FULL			0x00008
> +#define CDNS_MAILBOX_EMPTY			0x0000c
> +#define CDNS_MAILBOX_TX_DATA		0x00010
> +#define CDNS_MAILBOX_RX_DATA		0x00014
> +
> +#define MAILBOX_RETRY_US			1000
> +#define MAILBOX_TIMEOUT_US			2000000
> +
> +/* Module ID Code */
> +#define MB_MODULE_ID_GENERAL		0x0A
> +#define MB_MODULE_ID_DP_TX			0x01
> +
> +/* General Commands */
> +#define GENERAL_REGISTER_WRITE		0x05
> +#define GENERAL_REGISTER_READ		0x07
> +
> +/* DP TX Command */
> +#define DPTX_WRITE_FIELD			0x08
> +
> +/* MHDP Firmware access functions by Mailbox */
> +#define cdns_mhdp_mailbox_read(__mhdp) \
> +({ \
> +	int ret, empty, val; \
> +\
> +	WARN_ON(!mutex_is_locked(&(__mhdp)->mbox_mutex)); \
> +\
> +	do {  \
> +		ret = readx_poll_timeout(readl, (__mhdp)->regs + CDNS_MAILBOX_EMPTY,  \
> +					 empty, !empty, MAILBOX_RETRY_US,  \
> +					 MAILBOX_TIMEOUT_US);  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		val = readl((__mhdp)->regs + CDNS_MAILBOX_RX_DATA) & 0xff; \
> +	} while (0);  \
> +\
> +	(ret < 0) ? ret : val;  \
> +})
> +
> +#define cdns_mhdp_mailbox_write(__mhdp, __val) \
> +({ \
> +	int ret, full;  \
> +\
> +	WARN_ON(!mutex_is_locked(&(__mhdp)->mbox_mutex)); \
> +\
> +	do {  \
> +		ret = readx_poll_timeout(readl, (__mhdp)->regs + CDNS_MAILBOX_FULL,  \
> +					 full, !full, MAILBOX_RETRY_US,  \
> +					 MAILBOX_TIMEOUT_US);  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		writel((__val), (__mhdp)->regs + CDNS_MAILBOX_TX_DATA); \
> +	} while (0);  \
> +\
> +	ret; \
> +})
> +
> +#define  cdns_mhdp_mailbox_recv_header(__mhdp, __module_id, __opcode, __req_size) \
> +({  \
> +	u32 mbox_size, i;  \
> +	u8 header[4];  \
> +	int ret;  \
> +\
> +	do {  \
> +		/* read the header of the message */ \
> +		for (i = 0; i < sizeof(header); i++) {  \
> +			ret = cdns_mhdp_mailbox_read(__mhdp);  \
> +			if (ret < 0)  \
> +				break;  \
> +\
> +			header[i] = ret;  \
> +		}  \
> +\
> +		mbox_size = get_unaligned_be16(header + 2);  \
> +\
> +		if ((__opcode) != header[0] || (__module_id) != header[1] ||  \
> +		    (__req_size) != mbox_size) {  \
> +			/* If the message in mailbox is not what we want, we need to
> +			 * clear the mailbox by reading its contents. */  \
> +			for (i = 0; i < mbox_size; i++)   \
> +				if (cdns_mhdp_mailbox_read(__mhdp) < 0)  \
> +					break;  \
> +\
> +			ret = -EINVAL;  \
> +		}  \
> +\
> +		ret = 0; \
> +\
> +	} while (0);  \
> +\
> +	ret;  \
> +})
> +
> +#define cdns_mhdp_mailbox_recv_data(mhdp, buff, buff_size)  \
> +({  \
> +	u32 i;  \
> +	int ret;  \
> +\
> +	do {  \
> +		for (i = 0; i < buff_size; i++) {  \
> +			ret = cdns_mhdp_mailbox_read(mhdp);  \
> +			if (ret < 0)  \
> +				break;  \
> +\
> +			((u8 *)buff)[i] = ret;  \
> +		}  \
> +\
> +		ret = 0;  \
> +\
> +	} while (0);  \
> +\
> +	ret; \
> +})
> +
> +#define cdns_mhdp_mailbox_send(mhdp, module_id, opcode, size, message)  \
> +({  \
> +	u8 header[4];  \
> +	int ret, i;  \
> +\
> +	header[0] = opcode;  \
> +	header[1] = module_id;  \
> +	put_unaligned_be16(size, header + 2);  \
> +\
> +	do {  \
> +		for (i = 0; i < sizeof(header); i++) {  \
> +			ret = cdns_mhdp_mailbox_write(mhdp, header[i]);  \
> +			if (ret < 0)  \
> +				break;  \
> +		}  \
> +\
> +		for (i = 0; i < size; i++) {  \
> +			ret = cdns_mhdp_mailbox_write(mhdp, ((u8 *)message)[i]);  \
> +			if (ret < 0)  \
> +				break;;  \
> +		}  \
> +		ret = 0;  \
> +	} while (0);  \
> +\
> +	ret;  \
> +})
> +
> +#define cdns_mhdp_reg_read(mhdp, addr, value)  \
> +({  \
> +	u8 msg[4], resp[8];  \
> +	int ret;  \
> +\
> +	put_unaligned_be32(addr, msg);  \
> +\
> +	mutex_lock(&mhdp->mbox_mutex);  \
> +\
> +	do {  \
> +		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,  \
> +					     GENERAL_REGISTER_READ,  \
> +					     sizeof(msg), msg);  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,  \
> +						    GENERAL_REGISTER_READ,  \
> +						    sizeof(resp));  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));  \
> +		if (ret < 0)  \
> +			break;  \
> +\
> +		/* Returned address value should be the same as requested */  \
> +		if (memcmp(msg, resp, sizeof(msg))) {  \
> +			ret = -EINVAL;  \
> +			break;  \
> +		}  \
> +\
> +		*((u32 *)value) = get_unaligned_be32(resp + 4);  \
> +			ret = 0;  \
> +	} while (0);  \
> +\
> +	mutex_unlock(&mhdp->mbox_mutex);  \
> +	if (ret < 0) {  \
> +		dev_err(mhdp->dev, "Failed to read register\n");  \
> +		*((u32 *)value) = 0;  \
> +	}  \
> +\
> +	ret;  \
> +})
> +
> +#define cdns_mhdp_reg_write(mhdp, addr, val)  \
> +({  \
> +	u8 msg[8];  \
> +	int ret;  \
> +\
> +	put_unaligned_be32(addr, msg);  \
> +	put_unaligned_be32(val, msg + 4);  \
> +\
> +	mutex_lock(&mhdp->mbox_mutex);  \
> +\
> +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,  \
> +				      GENERAL_REGISTER_WRITE, sizeof(msg), msg);  \
> +\
> +	mutex_unlock(&mhdp->mbox_mutex);  \
> +\
> +	ret;  \
> +})
> +
> +#define cdns_mhdp_reg_write_bit(mhdp, addr, start_bit, bits_no, val) \
> +({  \
> +	u8 field[8];  \
> +	int ret;  \
> +\
> +	put_unaligned_be16(addr, field);  \
> +	field[2] = start_bit;  \
> +	field[3] = bits_no;  \
> +	put_unaligned_be32(val, field + 4);  \
> +\
> +	mutex_lock(&mhdp->mbox_mutex);  \
> +\
> +	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, \
> +				     DPTX_WRITE_FIELD, sizeof(field), field);  \
> +\
> +	mutex_unlock(&mhdp->mbox_mutex);  \
> +\
> +	ret; \
> +})
> +
> +#endif


