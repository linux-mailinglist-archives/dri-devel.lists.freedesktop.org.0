Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F2384B9B3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1454410EF28;
	Tue,  6 Feb 2024 15:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="N33xNgQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E67C10EF28
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707233670;
 bh=JgdHGKF/giEmbsBfxZ3wNxEUKgmpKNJiCoeaTQFnxxM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N33xNgQDwfEZ3NgWrDjjWxitLwhTRGko3/YDJh7e89HaF6QTeTkteGlIiLKuRwMku
 2jfm6z3/nP9IUPlfiLHJBK5X0vZ+p7N+YZU31huZgjObGorLAXYUvj6/oa8oApDayM
 hupV38oyGkZrsW5u57evEvHV8h+TwZNV4UHG63a2btNREYAT2PXdaHF75PbR8JbcJK
 CHMF9hh7obevvE3CbbIVHZ6wH689XO3ZIK9/K4pO0DLxcTmC75XZ3jbwlVdfzOrFiw
 hR81cXR8bl+FOUrlyLCfxWnCJLa6gvlCCrrzgwiofux2ug9W2kLLmrh5ATlh7D5eD4
 rKGcOWQKAGXXA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 875013782072;
 Tue,  6 Feb 2024 15:34:29 +0000 (UTC)
Message-ID: <65e5e4fa-3c09-4fa1-922c-0cc9f891e174@collabora.com>
Date: Tue, 6 Feb 2024 16:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Subject: [PATCH] drm/mediatek/dp: Add tee client
 application for HDCP feature
Content-Language: en-US
To: "mac.shen" <mac.shen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: shuijing.li@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240205055055.25340-1-mac.shen@mediatek.com>
 <20240205055055.25340-2-mac.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240205055055.25340-2-mac.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 05/02/24 06:50, mac.shen ha scritto:
> Add tee client application which will be used for
> HDCP 1.x and 2.x authentication in DisplayPort.
> 
> Changes in v2:
> - remove ca folder, and change file name with lower case
> - refine the tci_t structure to make the data to tee can
>    through this structure
> - remove aux and regs from mtk_hdcp_info structure
> - remove some definitions, and use the definitions in
>    include/drm/drm_hdcp.h
> - remove useless code
> per suggestion from the previous thread:
> https://lore.kernel.org/all/8fff59b5567449d8201dd1138c8fa
> 9218a545c46.camel@mediatek.com/
> 
> Signed-off-by: mac.shen <mac.shen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/Makefile      |   5 +-
>   drivers/gpu/drm/mediatek/tci.h         | 156 +++++++
>   drivers/gpu/drm/mediatek/tlc_dp_hdcp.c | 598 +++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/tlc_dp_hdcp.h | 414 +++++++++++++++++
>   4 files changed, 1172 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/mediatek/tci.h
>   create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c
>   create mode 100644 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index d4d193f60271..c80e6c2f9336 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -26,4 +26,7 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>   
>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>   
> -obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
> +mtk-dp-objs := tlc_dp_hdcp.o \
> +		  mtk_dp.o
> +
> +obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk-dp.o
> diff --git a/drivers/gpu/drm/mediatek/tci.h b/drivers/gpu/drm/mediatek/tci.h
> new file mode 100644
> index 000000000000..f2239ea3ffbf
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/tci.h
> @@ -0,0 +1,156 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019-2024 MediaTek Inc.
> + */
> +
> +#ifndef _TCI_H_
> +#define _TCI_H_
> +
> +#include <drm/display/drm_hdcp.h>
> +
> +#define CMD_DEVICE_ADDED        1
> +#define CMD_DEVICE_REMOVE       2
> +#define CMD_WRITE_VAL           3
> +#define CMD_DEVICE_CLEAN        4
> +#define CMD_ENABLE_ENCRYPT      5
> +
> +/* V1.3 */
> +#define CMD_CALCULATE_LM        11
> +#define CMD_COMPARE_R0          12
> +#define CMD_COMPARE_V1          13
> +#define CMD_GET_AKSV            14
> +
> +/* V2.2 */
> +#define CMD_AKE_CERTIFICATE     20
> +#define CMD_ENC_KM              21
> +#define CMD_AKE_H_PRIME         22
> +#define CMD_AKE_PARING          23
> +#define CMD_LC_L_PRIME          24
> +#define CMD_COMPARE_L           25
> +#define CMD_SKE_CAL_EKS         26
> +
> +#define CMD_COMPARE_V2          27
> +#define CMD_COMPARE_M           28
> +
> +/* Need remove in furture */
> +#define CMD_LOAD_KEY            50
> +
> +#define RET_COMPARE_PASS 0
> +#define RET_COMPARE_FAIL 1
> +#define RET_NEW_DEVICE 2
> +#define RET_STORED_DEVICE 3
> +
> +#define TYPE_HDCP_PARAM_AN 10
> +#define TYPE_HDCP_PARAM_RST_1 11
> +#define TYPE_HDCP_PARAM_RST_2 12
> +#define TYPE_HDCP_ENABLE_ENCRYPT 13
> +#define TYPE_HDCP_DISABLE_ENCRYPT 14
> +
> +#define TYPE_HDCP13_KEY 20
> +#define TYPE_HDCP22_KEY 21
> +
> +// reserved:2

Please, C-style comments only.

> +#define HDCP2_CERTRX_LEN (HDCP_2_2_RECEIVER_ID_LEN + HDCP_2_2_K_PUB_RX_LEN + \
> +	2 + HDCP_2_2_DCP_LLC_SIG_LEN)
> +// version:1
> +#define HDCP_2_2_TXCAPS_LEN (HDCP_2_2_TXCAP_MASK_LEN + 1)
> +#define PARAM_LEN 1024
> +
> +#define TCI_LENGTH sizeof(struct tci_t)
> +
> +struct cmd_hdcp_init_for_verion_t {
> +	u32 version;
> +	bool need_load_key;
> +};
> +
> +struct cmd_hdcp_write_val_t {
> +	u8 type;
> +	u8 len;
> +	u8 val[DRM_HDCP_AN_LEN];
> +};
> +
> +struct cmd_hdcp_calculate_lm_t {
> +	u8 bksv[DRM_HDCP_KSV_LEN];
> +};
> +
> +struct cmd_hdcp_get_aksv_t {
> +	u8 aksv[DRM_HDCP_KSV_LEN];
> +};
> +
> +struct cmd_hdcp_ake_certificate_t {
> +	u8 certification[HDCP2_CERTRX_LEN];
> +	bool stored;
> +	u8 m[HDCP_2_2_E_KH_KM_M_LEN - HDCP_2_2_E_KH_KM_LEN];
> +	u8 ekm[HDCP_2_2_E_KH_KM_LEN];
> +};
> +
> +struct cmd_hdcp_ake_paring_t {
> +	u8 ekm[HDCP_2_2_E_KH_KM_LEN];
> +};
> +
> +struct cmd_hdcp_enc_km_t {
> +	u8 enc_km[HDCP_2_2_E_KPUB_KM_LEN];
> +};
> +
> +struct cmd_hdcp_ake_h_prime_t {
> +	u8 rtx[HDCP_2_2_RTX_LEN];
> +	u8 rrx[HDCP_2_2_RRX_LEN];
> +	u8 rx_caps[HDCP_2_2_RXCAPS_LEN];
> +	u8 tx_caps[HDCP_2_2_TXCAPS_LEN];
> +	u32 rx_h_len;
> +	u8 rx_h[HDCP_2_2_H_PRIME_LEN];
> +};
> +
> +struct cmd_hdcp_lc_l_prime_t {
> +	u8 rn[HDCP_2_2_RN_LEN];
> +	u32 rx_l_len;
> +	u8 rx_l[HDCP_2_2_L_PRIME_LEN];
> +};
> +
> +struct cmd_hdcp_ske_eks_t {
> +	u8 riv[HDCP_2_2_RIV_LEN];
> +	u32 eks_len;
> +	u32 eks;
> +};
> +
> +struct cmd_hdcp_compare_t {
> +	u32 rx_val_len;
> +	u8 rx_val[HDCP_2_2_MPRIME_LEN];
> +	u32 param_len;
> +	u8 param[PARAM_LEN];
> +	u32 out_len;
> +	u32 out;
> +};
> +
> +union tci_cmd_body_t {
> +	/* Init with special HDCP version */
> +	struct cmd_hdcp_init_for_verion_t cmd_hdcp_init_for_verion;
> +	/* Write uint32 data to hw */
> +	struct cmd_hdcp_write_val_t cmd_hdcp_write_val;
> +	/* Get aksv */
> +	struct cmd_hdcp_get_aksv_t cmd_hdcp_get_aksv;
> +	/* Calculate r0 */
> +	struct cmd_hdcp_calculate_lm_t cmd_hdcp_calculate_lm;
> +	/* Generate signature for certificate */
> +	struct cmd_hdcp_ake_certificate_t cmd_hdcp_ake_certificate;
> +	/* To store ekm */
> +	struct cmd_hdcp_ake_paring_t cmd_hdcp_ake_paring;
> +	/* Encrypt km for V2.2 */
> +	struct cmd_hdcp_enc_km_t cmd_hdcp_enc_km;
> +	/* Compute H prime */
> +	struct cmd_hdcp_ake_h_prime_t cmd_hdcp_ake_h_prime;
> +	/* Compute L prime */
> +	struct cmd_hdcp_lc_l_prime_t cmd_hdcp_lc_l_prime;
> +	/* Compute eks */
> +	struct cmd_hdcp_ske_eks_t cmd_hdcp_ske_eks;
> +	/* Compare */
> +	struct cmd_hdcp_compare_t cmd_hdcp_compare;
> +} __packed;
> +
> +struct tci_t {
> +	u32 command_id;
> +	u32 return_code;
> +	union tci_cmd_body_t cmd_body;
> +};
> +
> +#endif /* _TCI_H_ */
> diff --git a/drivers/gpu/drm/mediatek/tlc_dp_hdcp.c b/drivers/gpu/drm/mediatek/tlc_dp_hdcp.c
> new file mode 100644
> index 000000000000..147329324648
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/tlc_dp_hdcp.c
> @@ -0,0 +1,598 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019-2024 MediaTek Inc.
> + */
> +
> +#include <linux/types.h>
> +#include <linux/string.h>
> +#include <linux/slab.h>
> +#include "tlc_dp_hdcp.h"
> +
> +#define DEFAULT_WRITE_VAL_LEN 1
> +#define DEFAULT_WRITE_VAL 0
> +
> +/*
> + * TA_FTPM_UUID: 99975014-3c7c-54ea-8487-a80d215ea92c
> + *
> + * Randomly generated, and must correspond to the GUID on the TA side.
> + * Defined here in the reference implementation:
> + * https://github.com/microsoft/ms-tpm-20-ref/blob/master/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/include/fTPM.h#L42
> + */
> +static const uuid_t dp_ta_uuid =
> +	UUID_INIT(0x99975014, 0x3c7c, 0x54ea,
> +		  0x84, 0x87, 0xa8, 0x0d, 0x21, 0x5e, 0xa9, 0x2c);
> +
> +/**
> + * dp_tee_op_send() - send dp commands through the TEE shared memory.
> + * @len:	the number of bytes to send.
> + *
> + * Return:
> + *	In case of success, returns 0.
> + *	On failure, -errno

I think that's not what you want as final format, please check the documentation.

https://docs.kernel.org/doc-guide/kernel-doc.html#return-values

> + */
> +static int dp_tee_op_send(struct dp_tee_private *dp_tee_priv, size_t len, u32 cmd_id)
> +{
> +	int rc;
> +	u8 *temp_buf;
> +	struct tee_ioctl_invoke_arg transceive_args;
> +	struct tee_param command_params[4];
> +	struct tee_shm *shm = dp_tee_priv->shm;

Please reorder:

	struct tee_ioctl_invoke_arg transceive_args;
	struct tee_shm *shm = dp_tee_priv->shm;
	struct tee_param command_params[4];
	u8 *temp_buf;
	int rc;

> +
> +	if (len > MAX_COMMAND_SIZE) {
> +		TLCERR("%s: len=%zd exceeds MAX_COMMAND_SIZE supported by dp TA\n", __func__, len);
> +		return -EIO;
> +	}
> +
> +	memset(&transceive_args, 0, sizeof(transceive_args));
> +	memset(command_params, 0, sizeof(command_params));
> +	dp_tee_priv->resp_len = 0;
> +
> +	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of dp TA */
> +	transceive_args = (struct tee_ioctl_invoke_arg) {
> +		.func = cmd_id,
> +		.session = dp_tee_priv->session,
> +		.num_params = 4,
> +	};
> +
> +	/* Fill FTPM_OPTEE_TA_SUBMIT_COMMAND parameters */
> +	command_params[0] = (struct tee_param) {
> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
> +		.u.memref = {
> +			.shm = shm,
> +			.size = len,
> +			.shm_offs = 0,
> +		},
> +	};
> +
> +	command_params[1] = (struct tee_param) {
> +		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> +		.u.memref = {
> +			.shm = shm,
> +			.size = MAX_RESPONSE_SIZE,
> +			.shm_offs = MAX_COMMAND_SIZE,
> +		},
> +	};
> +
> +	rc = tee_client_invoke_func(dp_tee_priv->ctx, &transceive_args, command_params);
> +	if (rc < 0 || transceive_args.ret != 0) {
> +		TLCERR("%s: invoke error: 0x%x\n", __func__, transceive_args.ret);
> +		return (rc < 0) ? rc : transceive_args.ret;
> +	}
> +
> +	temp_buf = tee_shm_get_va(shm, command_params[1].u.memref.shm_offs);
> +	if (IS_ERR(temp_buf)) {
> +		TLCERR("%s: tee_shm_get_va failed for receive\n", __func__);
> +		return PTR_ERR(temp_buf);
> +	}
> +
> +	/* Sanity checks look good, cache the response */
> +	memcpy(dp_tee_priv->resp_buf, temp_buf, MAX_RESPONSE_SIZE / 2);
> +	dp_tee_priv->resp_len = MAX_RESPONSE_SIZE / 2;
> +
> +	return 0;
> +}
> +
> +/*
> + * Check whether this driver supports the dp TA in the TEE instance
> + * represented by the params (ver/data) to this function.
> + */
> +static int dp_tee_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +	/*
> +	 * Currently this driver only support GP Complaint OPTEE based dp TA
> +	 */
> +	if (ver->impl_id == TEE_IMPL_ID_OPTEE && ver->gen_caps & TEE_GEN_CAP_GP)
> +		return 1;
> +	else
> +		return 0;

/*
  * Check whether this driver supports the dp TA in the TEE instance
  * represented by the params (ver/data) to this function.
  *
  * Note that currently this driver only supports GP Compliant OPTEE
  * based dp TA.
  */
static int dp_tee_match(struct tee_ioctl_version_data *ver, const void *data)
{
	return ver->impl_id == TEE_IMPL_ID_OPTEE &&
	       ver->gen_caps & TEE_GEN_CAP_GP
}

That's shorter :-)

> +}
> +
> +int tee_add_device(struct mtk_hdcp_info *hdcp_info, u32 version)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = NULL;

You don't need this NULL assignment...

> +	struct tee_ioctl_open_session_arg sess_arg;
> +	struct tci_t *tci;

	struct tee_ioctl_open_session_arg sess_arg;
	struct dp_tee_private *dp_tee_priv;
	struct tci_t *tci;
	int rc;


> +
> +	if (hdcp_info->g_init)
> +		tee_remove_device(hdcp_info);
> +
> +	dp_tee_priv = kzalloc(sizeof(*dp_tee_priv), GFP_KERNEL);
> +	if (!dp_tee_priv) {
> +		kfree(dp_tee_priv);

There's no need to kfree something that couldn't be allocated.

> +		TLCERR("%s: tee_alloc_memory failed\n", __func__);
> +		return -ENOMEM;
> +	}
> +	hdcp_info->g_dp_tee_priv = dp_tee_priv;
> +
> +	/* Open context with TEE driver */
> +	dp_tee_priv->ctx = tee_client_open_context(NULL, dp_tee_match, NULL, NULL);
> +	if (IS_ERR(dp_tee_priv->ctx)) {

		/* We return -EPROBE_DEFER because ... why?!
		 * does it even make any sense to override this
		 * return value? I don't think so.
		 */
		if (PTR_ERR(dp_tee_priv->ctx) == -ENOENT)
			rc = -EPROBE_DEFER;
		else
			rc = PTR_ERR(dp_tee_priv->ctx);

		goto free_priv;
	}

> +		if (PTR_ERR(dp_tee_priv->ctx) == -ENOENT) {
> +			kfree(dp_tee_priv);
> +			return -EPROBE_DEFER;
> +		}
> +		kfree(dp_tee_priv);
> +		TLCERR("%s: tee_client_open_context failed\n", __func__);
> +		return PTR_ERR(dp_tee_priv->ctx);
> +	}
> +
> +	/* Open a session with dp TA */
> +	memset(&sess_arg, 0, sizeof(sess_arg));
> +	export_uuid(sess_arg.uuid, &dp_ta_uuid);
> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
> +	sess_arg.num_params = 0;
> +
> +	rc = tee_client_open_session(dp_tee_priv->ctx, &sess_arg, NULL);
> +	if (rc < 0 || sess_arg.ret != 0) {
> +		kfree(dp_tee_priv);

We don't kfree here because the goto will take care of that already...
P.S.: same for the other instances

> +		TLCERR("tee_client_open_session failed, err=%x\n", sess_arg.ret);
> +		rc = -EINVAL;
> +		goto out_tee_session;
> +	}
> +	dp_tee_priv->session = sess_arg.session;
> +
> +	/* Allocate dynamic shared memory with dp TA */
> +	dp_tee_priv->shm = tee_shm_alloc_kernel_buf(dp_tee_priv->ctx, MAX_COMMAND_SIZE
> +	 + MAX_RESPONSE_SIZE);
> +	if (IS_ERR(dp_tee_priv->shm)) {
> +		kfree(dp_tee_priv);
> +		TLCERR("%s: tee_shm_alloc_kernel_buf failed\n", __func__);
> +		rc = -ENOMEM;
> +		goto out_shm_alloc;
> +	}
> +	TLCINFO("Register 8k share memory successfully, (%p)",
> +		dp_tee_priv->shm->kaddr);

Don't print pointer addresses, it won't mean anything for most people as there will
be randomization and - if not - could be used for a vulnerability.

Please, just don't.

> +
> +	/* Copy parameter for add new device */
> +	tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +	memset(tci, 0, TCI_LENGTH);
> +	tci->command_id = CMD_DEVICE_ADDED;
> +	tci->cmd_body.cmd_hdcp_init_for_verion.version = version;
> +	tci->cmd_body.cmd_hdcp_init_for_verion.need_load_key = true;
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_DEVICE_ADDED);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		tee_remove_device(hdcp_info);
> +		return rc;
> +	}
> +
> +	hdcp_info->g_init = true;
> +
> +	return rc;

If you intend to pass on a result of dp_tee_op_send, then pass that to a pointer
in the function param.

Here, you shall return 0.

> +
> +out_shm_alloc:
> +	tee_client_close_session(dp_tee_priv->ctx, dp_tee_priv->session);
> +out_tee_session:
> +	tee_client_close_context(dp_tee_priv->ctx);

free_priv:
	kfree(dp_tee_priv);

> +
> +	return rc;
> +}
> +
> +void tee_remove_device(struct mtk_hdcp_info *hdcp_info)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;

int rc goes here

> +
> +	if (!hdcp_info->g_init)
> +		return;
> +
> +	hdcp_info->g_init = false;
> +	memset(tci, 0, TCI_LENGTH);
> +	tci->command_id = CMD_DEVICE_REMOVE;
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_DEVICE_REMOVE);
> +	if (rc != 0)
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +
> +	/* Free the shared memory pool */
> +	tee_shm_free(dp_tee_priv->shm);
> +
> +	/* Close the existing session with fTPM TA */
> +	tee_client_close_session(dp_tee_priv->ctx, dp_tee_priv->session);
> +
> +	/* Close the context with TEE driver */
> +	tee_client_close_context(dp_tee_priv->ctx);
> +
> +	/* Free the memory */
> +	kfree(dp_tee_priv);
> +}
> +
> +int tee_clear_paring(struct mtk_hdcp_info *hdcp_info)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;

int rc goes here

> +
> +	/* Copy parameters */
> +	memset(tci, 0, TCI_LENGTH);
> +	tci->command_id = CMD_DEVICE_CLEAN;
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_DEVICE_CLEAN);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	return rc;

return 0;

> +}
> +
> +int tee_hdcp1x_set_tx_an(struct mtk_hdcp_info *hdcp_info, u8 *an_code)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_WRITE_VAL;
> +	tci->cmd_body.cmd_hdcp_write_val.len = DRM_HDCP_AN_LEN;
> +	tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_PARAM_AN;
> +	memcpy(tci->cmd_body.cmd_hdcp_write_val.val, an_code, DRM_HDCP_AN_LEN);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_WRITE_VAL);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	return rc;
> +}
> +
> +int tee_hdcp_enable_encrypt(struct mtk_hdcp_info *hdcp_info, bool enable, u8 version)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_ENABLE_ENCRYPT;

	tci->cmd_body.cmd_hdcp_write_val.type = enable ? TYPE_HDCP_ENABLE_ENCRYPT : 
TYPE_HDCP_DISABLE_ENCRYPT;

> +	if (enable)
> +		tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_ENABLE_ENCRYPT;
> +	else
> +		tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_DISABLE_ENCRYPT;
> +
> +	/* Set HDCP version supportted by device */
> +	tci->cmd_body.cmd_hdcp_write_val.len = 1;
> +	tci->cmd_body.cmd_hdcp_write_val.val[0] = version;
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_ENABLE_ENCRYPT);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +

return 0.... here and everywhere else.

> +	return rc;
> +}
> +
> +int tee_hdcp1x_soft_rst(struct mtk_hdcp_info *hdcp_info)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_WRITE_VAL;
> +	tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_PARAM_RST_1;
> +	/* No need input. Set default value 0 for check */
> +	tci->cmd_body.cmd_hdcp_write_val.len = DEFAULT_WRITE_VAL_LEN;
> +	memset(tci->cmd_body.cmd_hdcp_write_val.val, DEFAULT_WRITE_VAL, DEFAULT_WRITE_VAL_LEN);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_WRITE_VAL);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	return rc;
> +}
> +
> +int tee_hdcp2_soft_rst(struct mtk_hdcp_info *hdcp_info)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	tci->command_id = CMD_WRITE_VAL;
> +	tci->cmd_body.cmd_hdcp_write_val.type = TYPE_HDCP_PARAM_RST_2;
> +	/* No need input. Set default value 0 for check */

> +	tci->cmd_body.cmd_hdcp_write_val.len =
> +		DEFAULT_WRITE_VAL_LEN;

Fits in one line.

> +	memset(tci->cmd_body.cmd_hdcp_write_val.val, DEFAULT_WRITE_VAL, DEFAULT_WRITE_VAL_LEN);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_WRITE_VAL);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	return rc;
> +}
> +
> +/** V1.X **/
> +int tee_get_aksv(struct mtk_hdcp_info *hdcp_info, u8 *aksv)
> +{

Reorder the variables, here and everywhere else.

> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_GET_AKSV;
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_GET_AKSV);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	tci = (struct tci_t *)dp_tee_priv->resp_buf;

Use a different variable, otherwise this adds up confusion.

> +	memcpy(aksv, tci->cmd_body.cmd_hdcp_get_aksv.aksv, DRM_HDCP_KSV_LEN);
> +
> +	return rc;
> +}
> +
> +int tee_calculate_lm(struct mtk_hdcp_info *hdcp_info, u8 *bksv)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_CALCULATE_LM;
> +	memcpy(tci->cmd_body.cmd_hdcp_calculate_lm.bksv, bksv, DRM_HDCP_KSV_LEN);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_CALCULATE_LM);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	return rc;
> +}
> +
> +int tee_compare_r0(struct mtk_hdcp_info *hdcp_info, u8 *r0, u32 len)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_COMPARE_R0;
> +	tci->cmd_body.cmd_hdcp_compare.rx_val_len = len;
> +	memcpy(tci->cmd_body.cmd_hdcp_compare.rx_val, r0, len);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_COMPARE_R0);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	return rc;
> +}
> +
> +int tee_hdcp1x_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
> +				 u8 *crypto_param, u32 param_len, u8 *rx_v)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_COMPARE_V1;
> +	tci->cmd_body.cmd_hdcp_compare.rx_val_len = 20;
> +	tci->cmd_body.cmd_hdcp_compare.param_len = param_len;
> +	memcpy(tci->cmd_body.cmd_hdcp_compare.rx_val, rx_v, 20);
> +	memcpy(tci->cmd_body.cmd_hdcp_compare.param, crypto_param, param_len);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_COMPARE_V1);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	return rc;
> +}
> +
> +/** V2.X **/
> +int tee_ake_certificate(struct mtk_hdcp_info *hdcp_info,
> +			u8 *certificate, bool *stored, u8 *out_m, u8 *out_ekm)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_AKE_CERTIFICATE;
> +	memcpy(tci->cmd_body.cmd_hdcp_ake_certificate.certification,
> +	       certificate, HDCP2_CERTRX_LEN);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_AKE_CERTIFICATE);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	TLCINFO("verify signature: result %d", rc);
> +	tci = (struct tci_t *)dp_tee_priv->resp_buf;
> +	*stored = tci->cmd_body.cmd_hdcp_ake_certificate.stored;
> +	memcpy(out_m, tci->cmd_body.cmd_hdcp_ake_certificate.m,
> +	       HDCP_2_2_E_KH_KM_M_LEN - HDCP_2_2_E_KH_KM_LEN);
> +	memcpy(out_ekm, tci->cmd_body.cmd_hdcp_ake_certificate.ekm, HDCP_2_2_E_KH_KM_LEN);
> +
> +	return rc;
> +}
> +
> +int tee_enc_rsaes_oaep(struct mtk_hdcp_info *hdcp_info, u8 *ekm)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_ENC_KM;
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_ENC_KM);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	tci = (struct tci_t *)dp_tee_priv->resp_buf;
> +	memcpy(ekm, tci->cmd_body.cmd_hdcp_enc_km.enc_km, HDCP_2_2_E_KPUB_KM_LEN);
> +
> +	return rc;
> +}
> +
> +int tee_ake_h_prime(struct mtk_hdcp_info *hdcp_info,
> +		    u8 *rtx, u8 *rrx, u8 *rx_caps, u8 *tx_caps, u8 *rx_h, u32 rx_h_len)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_AKE_H_PRIME;
> +	tci->cmd_body.cmd_hdcp_ake_h_prime.rx_h_len = rx_h_len;
> +
> +	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rtx, rtx, HDCP_2_2_RTX_LEN);
> +	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rrx, rrx, HDCP_2_2_RRX_LEN);
> +	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rx_caps, rx_caps, HDCP_2_2_RXCAPS_LEN);
> +	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.tx_caps, tx_caps, HDCP_2_2_TXCAPS_LEN);
> +	memcpy(tci->cmd_body.cmd_hdcp_ake_h_prime.rx_h, rx_h, rx_h_len);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_AKE_H_PRIME);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	tci = (struct tci_t *)dp_tee_priv->resp_buf;
> +	return tci->return_code;
> +}
> +
> +int tee_ake_paring(struct mtk_hdcp_info *hdcp_info, u8 *rx_ekm)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_AKE_PARING;
> +	memcpy(tci->cmd_body.cmd_hdcp_ake_paring.ekm, rx_ekm, HDCP_2_2_E_KH_KM_LEN);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_AKE_PARING);
> +	if (rc != 0)
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +
> +	return rc;
> +}
> +
> +int tee_lc_l_prime(struct mtk_hdcp_info *hdcp_info, u8 *rn, u8 *rx_l, u32 len)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_LC_L_PRIME;
> +	memcpy(tci->cmd_body.cmd_hdcp_lc_l_prime.rn, rn, HDCP_2_2_RN_LEN);
> +	tci->cmd_body.cmd_hdcp_lc_l_prime.rx_l_len = len;
> +	memcpy(tci->cmd_body.cmd_hdcp_lc_l_prime.rx_l, rx_l, len);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_LC_L_PRIME);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	tci = (struct tci_t *)dp_tee_priv->resp_buf;
> +	return tci->return_code;
> +}
> +
> +int tee_ske_enc_ks(struct mtk_hdcp_info *hdcp_info, u8 *riv, u8 *eks)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +	u8 *share_buffer = NULL;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_SKE_CAL_EKS;
> +	memcpy(tci->cmd_body.cmd_hdcp_ske_eks.riv, riv, HDCP_2_2_RIV_LEN);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH + 16, CMD_SKE_CAL_EKS);
> +	if (rc != 0)
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +
> +	share_buffer = (u8 *)dp_tee_priv->resp_buf;
> +	memcpy(eks, share_buffer + TCI_LENGTH, 16);
> +
> +	return rc;
> +}
> +
> +int tee_hdcp2_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
> +				u8 *crypto_param, u32 param_len, u8 *rx_v, u8 *tx_v)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +	u8 *share_buffer = NULL;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_COMPARE_V2;
> +	tci->cmd_body.cmd_hdcp_compare.rx_val_len = 16;
> +	tci->cmd_body.cmd_hdcp_compare.param_len = param_len;
> +	memcpy(tci->cmd_body.cmd_hdcp_compare.rx_val, rx_v, 16);
> +	memcpy(tci->cmd_body.cmd_hdcp_compare.param, crypto_param, param_len);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_COMPARE_V2);
> +	if (rc != 0) {
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +		return rc;
> +	}
> +
> +	share_buffer = (u8 *)dp_tee_priv->resp_buf;
> +	memcpy(tx_v, share_buffer + TCI_LENGTH, 16);
> +
> +	return rc;
> +}
> +
> +int tee_hdcp2_compute_compare_m(struct mtk_hdcp_info *hdcp_info,
> +				u8 *crypto_param, u32 param_len, u8 *rx_m)
> +{
> +	int rc;
> +	struct dp_tee_private *dp_tee_priv = hdcp_info->g_dp_tee_priv;
> +	struct tci_t *tci = (struct tci_t *)dp_tee_priv->shm->kaddr;
> +
> +	/* Copy parameters */
> +	tci->command_id = CMD_COMPARE_M;
> +	tci->cmd_body.cmd_hdcp_compare.rx_val_len = HDCP_2_2_MPRIME_LEN;
> +	tci->cmd_body.cmd_hdcp_compare.param_len = param_len;
> +	memcpy(tci->cmd_body.cmd_hdcp_compare.rx_val, rx_m, HDCP_2_2_MPRIME_LEN);
> +	memcpy(tci->cmd_body.cmd_hdcp_compare.param, crypto_param, param_len);
> +
> +	rc = dp_tee_op_send(dp_tee_priv, TCI_LENGTH, CMD_COMPARE_M);
> +	if (rc != 0)
> +		TLCERR("tee_op_send failed, error=%x\n", rc);
> +
> +	return rc;
> +}
> diff --git a/drivers/gpu/drm/mediatek/tlc_dp_hdcp.h b/drivers/gpu/drm/mediatek/tlc_dp_hdcp.h
> new file mode 100644
> index 000000000000..493d3c51a7a0
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/tlc_dp_hdcp.h
> @@ -0,0 +1,414 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019-2024 MediaTek Inc.
> + */
> +
> +#ifndef _TLC_DP_HDCP_H_
> +#define _TLC_DP_HDCP_H_
> +
> +#include <linux/printk.h>
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +#include <linux/types.h>
> +#include <linux/sched/clock.h>
> +#include <drm/display/drm_dp_helper.h>
> +#include "tci.h"
> +
> +#define TLCINFO(string, args...) pr_info("[TLC_HDCP]info: "string, ##args)
> +#define TLCERR(string, args...) pr_info("[TLC_HDCP]line:%d,err:%s:"string,\
> +	__LINE__, __func__, ##args)
> +
> +#define DPTXHDCPFUNC(fmt, arg...)		\
> +	pr_info("[DPTXHDCP][%s line:%d]"pr_fmt(fmt), __func__, __LINE__, ##arg)
> +#define DPTXHDCPMSG(fmt, arg...)                                  \
> +		pr_info("[DPTXHDCP]"pr_fmt(fmt), ##arg)
> +#define DPTXHDCPERR(fmt, arg...)                                  \
> +		pr_err("[DPTXHDCP]"pr_fmt(fmt), ##arg)

You don't need those print wrappers and you can just use pr_{info,err} where
needed in the code.
Also, dev_info/dev_err would be preferred.

> +
> +#define RET_SUCCESS 0

Unused (and anyway unneeded) definition: please remove.

> +
> +/**
> + * hdcp version definitions
> + */
> +#define HDCP_NONE                0x0 // No HDCP supported, no secure data path
> +#define HDCP_V1                  0x1 // HDCP version 1.0
> +#define HDCP_V2                  0x2 // HDCP version 2.0 Type 1
> +#define HDCP_V2_1                0x3 // HDCP version 2.1 Type 1
> +#define HDCP_V2_2                0x4 // HDCP version 2.2 Type 1
> +#define HDCP_V2_3                0x5 // HDCP version 2.3 Type 1

Please introduce definitions in the same commits where you use them.
Also, C-style comments please.

> +
> +/* Local display only(content required version use only) */
> +#define HDCP_LOCAL_DISPLAY_ONLY  0xf
> +#define HDCP_NO_DIGITAL_OUTPUT   0xff // No digital output
> +#define HDCP_DEFAULT             HDCP_NO_DIGITAL_OUTPUT // Default value
> +
> +#define HDCP_VERSION_1X 1
> +#define HDCP_VERSION_2X 2
> +
> +/* max. buffer size supported by dp  */
> +#define MAX_COMMAND_SIZE       4096
> +#define MAX_RESPONSE_SIZE      4096
> +
> +#define HDCP1X_REP_MAXDEVS 128
> +#define HDCP1X_V_LEN 20
> +#define HDCP1X_B_INFO_LEN 2
> +
> +#define HDCP2_K_LEN 2
> +#define HDCP2_STREAMID_TYPE_LEN 2
> +
> +enum HDCP_RESULT {
> +	AUTH_ZERO = 0,
> +	AUTH_PREPARE = 1,
> +	AUTH_INIT = 2,
> +	AUTH_PASS = 3,
> +	AUTH_FAIL = 4,
> +};
> +
> +struct dp_header {
> +	__be16 tag;
> +	__be32 length;
> +	union {
> +		__be32 ordinal;
> +		__be32 return_code;
> +	};
> +} __packed;
> +
> +/**
> + * struct dp_tee_private - fTPM's private data
> + * @session:  dp TA session identifier.
> + * @resp_len: cached response buffer length.
> + * @resp_buf: cached response buffer.
> + * @ctx:      TEE context handler.
> + * @shm:      Memory pool shared with fTPM TA in TEE.
> + */
> +struct dp_tee_private {
> +	u32 session;
> +	size_t resp_len;
> +	u8 resp_buf[MAX_RESPONSE_SIZE];
> +	struct tee_context *ctx;
> +	struct tee_shm *shm;
> +};
> +
> +struct hdcp2_info_tx {
> +	struct hdcp2_ake_init ake_init;
> +	struct hdcp2_ake_no_stored_km no_stored_km;
> +	struct hdcp2_ske_send_eks send_eks;
> +	struct hdcp2_lc_init lc_init;
> +	struct hdcp2_rep_stream_manage stream_manage;
> +	struct hdcp2_rep_send_ack send_ack;
> +	struct hdcp2_tx_caps tx_caps;
> +	u8 k[HDCP2_K_LEN];
> +	u8 stream_id_type[HDCP2_STREAMID_TYPE_LEN];
> +};
> +
> +struct hdcp2_info_rx {
> +	struct hdcp2_cert_rx cert_rx;
> +	struct hdcp2_ake_send_cert send_cert;
> +	struct hdcp2_rep_send_receiverid_list receiverid_list;
> +	struct hdcp2_ake_send_pairing_info pairing_info;
> +	struct hdcp2_rep_stream_ready stream_ready;
> +	struct hdcp2_ake_send_hprime send_hprime;
> +	struct hdcp2_lc_send_lprime send_lprime;
> +};
> +
> +struct hdcp2_handler {
> +	u8 main_state;
> +	u8 sub_state;
> +	u8 down_stream_dev_cnt;
> +	u8 hdcp_rx_ver;
> +	bool send_ake_init:1;
> +	bool get_recv_id_list:1;
> +	bool stored_km:1;
> +	bool send_lc_init:1;
> +	bool send_ack:1;
> +	bool sink_is_repeater:1;
> +	bool recv_msg:1;
> +	bool send_pair:1;
> +	u32 seq_num_v_cnt;
> +	u32 retry_cnt;
> +};
> +
> +struct hdcp1x_info {
> +	bool enable;
> +	bool repeater;
> +	bool r0_read;
> +	bool ksv_ready;
> +	bool max_cascade;
> +	bool max_devs;
> +	u8 b_status;
> +	u8 b_ksv[DRM_HDCP_KSV_LEN];
> +	u8 a_ksv[DRM_HDCP_KSV_LEN];
> +	u8 v[HDCP1X_V_LEN];
> +	u8 b_info[HDCP1X_B_INFO_LEN];
> +	u8 ksvfifo[DRM_HDCP_KSV_LEN * (HDCP1X_REP_MAXDEVS - 1)];
> +	u8 device_count;
> +	u8 retry_count;
> +	int main_states;
> +	int sub_states;
> +};
> +
> +struct hdcp2_info {
> +	struct hdcp2_info_tx hdcp_tx;
> +	struct hdcp2_info_rx hdcp_rx;
> +	struct hdcp2_ake_stored_km ake_stored_km;
> +	struct hdcp2_handler hdcp_handler;
> +	bool enable;
> +	bool repeater;
> +	bool read_certrx;
> +	bool read_h_prime;
> +	bool read_pairing;
> +	bool read_l_prime;
> +	bool ks_exchange_done;
> +	bool read_v_prime;
> +	u8 retry_count;
> +	u8 device_count;
> +	u8 stream_id_type;
> +};
> +
> +struct mtk_hdcp_info {
> +	u8 auth_status;
> +	bool g_init;
> +	u32 hdcp_content_type;
> +	u32 content_protection;
> +	struct dp_tee_private *g_dp_tee_priv;
> +	struct hdcp1x_info hdcp1x_info;
> +	struct hdcp2_info hdcp2_info;
> +};
> +
> +#ifdef __cplusplus
> +extern "C"

cplusplus?! This is the kernel, this is not a UAPI header and will never be, and
you don't need this ifdef at all.

> +{
> +#endif
> +
> +/*

Please use valid kerneldoc; here and everywhere else.

> + *Description:
> + *  A device connect and do some initializations.
> + *
> + *Input:
> + *  version: HDCP version
> + *
> + *Returns:
> + *  TEEC_SUCCESS success*
> + */
> +int tee_add_device(struct mtk_hdcp_info *hdcp_info, u32 version);
> +

Regards,
Angelo

