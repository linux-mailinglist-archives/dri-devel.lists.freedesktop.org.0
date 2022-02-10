Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D64B12D8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 17:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD0E10E8BA;
	Thu, 10 Feb 2022 16:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E0F10E165
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 16:36:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4069B1F466A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644510978;
 bh=D6WwfmbStMmHxfTQqVmfzkYRd3e74eS+cdcYjWxj8bc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qvx+ShQ5sHm0W4YLpcexIsfT19zd/qWWe7akYKUqQooiV+EMIg68i8SA0bmRxBPRh
 nB3k6gyUsDtnvsRPkA8yuXFt6JbF+Tz5XchHTcpQk085zpbMvfCyiWncGKCz+UJ/EC
 S6i7Y1CcylZ2C50U51JqKq2eA9JBZhgo9/dXs/Zpsd61kV8YO9swjgFrwBxQruy9j2
 mngas7Os73dbOaHkAMP70s7qAcZc54phBBBYxfLEbBHRx+5NKSiEf52K7PJyIQCaSs
 PW82F1dxZrsNfcNRZguU6LkUfmBUtzRds1XzuNRaQXTLZw7+bX1aKwqu429sBx+JAu
 codL35w1/4UnQ==
Message-ID: <4907bdc1-b4a6-e9ad-5cfa-266fc20c0bec@collabora.com>
Date: Thu, 10 Feb 2022 17:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] drm/mediatek: allow commands to be sent during video
 mode
Content-Language: en-US
To: Julien STEPHAN <jstephan@baylibre.com>, ck.hu@mediatek.com
References: <20220210124638.2330904-1-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210124638.2330904-1-jstephan@baylibre.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/02/22 13:46, Julien STEPHAN ha scritto:
> Mipi dsi panel drivers can use mipi_dsi_dcs_{set,get}_display_brightness()
> to request backlight changes.
> 
> This can be done during panel initialization (dsi is in command mode)
> or afterwards (dsi is in Video Mode).
> 
> When the DSI is in Video Mode, all commands are rejected.
> 
> Detect current DSI mode in mtk_dsi_host_transfer() and switch modes
> temporarily to allow commands to be sent.
> 
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Hello Julien,
thanks for the patch!

However, there's a severe issue to solve.

> ---
> Changes in v2:
>    - update commit message to be more descriptive
> 
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 34 ++++++++++++++++++++++--------
>   1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..7d66fdc7f81d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -891,24 +891,34 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>   	u8 read_data[16];
>   	void *src_addr;
>   	u8 irq_flag = CMD_DONE_INT_FLAG;
> -
> -	if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
> -		DRM_ERROR("dsi engine is not command mode\n");
> -		return -EINVAL;
> +	u32 dsi_mode;
> +
> +	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_stop(dsi);
> +		if (mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500)) {
> +			recv_cnt = -EINVAL;

Variable recv_cnt is u32, hence unsigned... You cannot assign a negative error
number to that variable.

While at it, please add a `int ret` variable to increase readability of this
function after your additions... in which case, this would then be

		ret = mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
		if (ret)
			goto restore_dsi_mode;

...which also simplifies the flow, in my opinion (but that's personal preference).

> +			goto restore_dsi_mode;
> +		}
>   	}
>   
>   	if (MTK_DSI_HOST_IS_READ(msg->type))
>   		irq_flag |= LPRX_RD_RDY_INT_FLAG;
>   
> -	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
> -		return -ETIME;
> +	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0) {
> +		recv_cnt = -ETIME;

This can be improved: mtk_dsi_host_send_cmd() already returns either zero or
-ETIME if mtk_dsi_wait_for_irq_done() times out.

I would also suggest, at this point, to make function mtk_dsi_wait_for_irq_done()
directly return -ETIME, so that also mtk_dsi_switch_to_cmd_mode() and
mtk_dsi_host_send_cmd() are simplified.

Whether you want to improve this file, or want to avoid improving it right now,
this should anyway be like:

	ret = mtk_dsi_host_send_cmd(..blah)
	if (ret)
		goto restore_dsi_mode;

> +		goto restore_dsi_mode;
> +	}
>   
> -	if (!MTK_DSI_HOST_IS_READ(msg->type))
> -		return 0;
> +	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
> +		recv_cnt = 0;
> +		goto restore_dsi_mode;
> +	}
>   
>   	if (!msg->rx_buf) {
>   		DRM_ERROR("dsi receive buffer size may be NULL\n");
> -		return -EINVAL;
> +		recv_cnt = -EINVAL;
> +		goto restore_dsi_mode;
>   	}
>   
>   	for (i = 0; i < 16; i++)
> @@ -933,6 +943,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>   	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
>   		 recv_cnt, *((u8 *)(msg->tx_buf)));
>   
> +restore_dsi_mode:
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_set_mode(dsi);
> +		mtk_dsi_start(dsi);
> +	}
> +
>   	return recv_cnt;

P.S.:   return ret < 0 ? ret : recv_cnt;

>   }
>   
> 

Thanks,
Angelo
