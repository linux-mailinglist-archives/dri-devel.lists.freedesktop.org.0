Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKm+FqLZiWlFCgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:57:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E7410F3F9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F98110E3C1;
	Mon,  9 Feb 2026 11:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LsCNZmAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A88510E3C1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770637213;
 bh=YaTGcZwimloW1kgdEu8K+8Kr1kYVJjhPDsKxgwaC/PM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LsCNZmAyezhl3cvyfXrtT3fLv3wCWzZ9+ABlrTSDaHixCeCjjxhzsU2Ofp6WSAXOx
 lTbIG1xnRmaHn9+L82ux7AgGEQB7215cUmY8YwwMGZ6+QpWdjNngskX1QdUsnHtfvZ
 MOS8CdmxtKmMn6AaDExoUwNnLOiOOJEgpmIjvUProq0KvQrqCUZgmhdcPvBUM3434a
 8MsC44jgeZAi5LeDa2lrMuE64kprokKgDPFCcn+OZRCrprZefZgwOMDXyZQLT2rKT3
 gn5YhQcM1rv8yVHlBQC6JDzp5x6Xv5Rc37TFp/fKZKnuh8TxkaX8tsdXGuuFTxXm8d
 IvXe1leqXwmZQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C1E117E13D5;
 Mon,  9 Feb 2026 12:40:13 +0100 (CET)
Message-ID: <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
Date: Mon, 9 Feb 2026 12:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260209090516.14369-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260209090516.14369-1-l.scorcia@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B5E7410F3F9
X-Rspamd-Action: no action

Il 09/02/26 10:05, Luca Leonardo Scorcia ha scritto:
> The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
> which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
> structure needs to be stored inside the driver data before invoking it.
> 
> As drvdata is currently uninitialized it leads to a crash when
> registering the DSI DRM encoder right after acquiring
> the mode_config.idr_mutex, blocking all subsequent DRM operations.
> 
> Fixes the following crash during mediatek-drm probe (tested on Xiaomi
> Smart Clock x04g):
> 
> Unable to handle kernel NULL pointer dereference at virtual address
>   0000000000000040
> [...]
> Modules linked in: mediatek_drm(+) drm_display_helper cec drm_client_lib
>   drm_dma_helper drm_kms_helper panel_simple
> [...]
> Call trace:
>   drm_mode_object_add+0x58/0x98 (P)
>   __drm_encoder_init+0x48/0x140
>   drm_encoder_init+0x6c/0xa0
>   drm_simple_encoder_init+0x20/0x34 [drm_kms_helper]
>   mtk_dsi_bind+0x34/0x13c [mediatek_drm]
>   component_bind_all+0x120/0x280
>   mtk_drm_bind+0x284/0x67c [mediatek_drm]
>   try_to_bring_up_aggregate_device+0x23c/0x320
>   __component_add+0xa4/0x198
>   component_add+0x14/0x20
>   mtk_dsi_host_attach+0x78/0x100 [mediatek_drm]
>   mipi_dsi_attach+0x2c/0x50
>   panel_simple_dsi_probe+0x4c/0x9c [panel_simple]
>   mipi_dsi_drv_probe+0x1c/0x28
>   really_probe+0xc0/0x3dc
>   __driver_probe_device+0x80/0x160
>   driver_probe_device+0x40/0x120
>   __device_attach_driver+0xbc/0x17c
>   bus_for_each_drv+0x88/0xf0
>   __device_attach+0x9c/0x1cc
>   device_initial_probe+0x54/0x60
>   bus_probe_device+0x34/0xa0
>   device_add+0x5b0/0x800
>   mipi_dsi_device_register_full+0xdc/0x16c
>   mipi_dsi_host_register+0xc4/0x17c
>   mtk_dsi_probe+0x10c/0x260 [mediatek_drm]
>   platform_probe+0x5c/0xa4
>   really_probe+0xc0/0x3dc
>   __driver_probe_device+0x80/0x160
>   driver_probe_device+0x40/0x120
>   __driver_attach+0xc8/0x1f8
>   bus_for_each_dev+0x7c/0xe0
>   driver_attach+0x24/0x30
>   bus_add_driver+0x11c/0x240
>   driver_register+0x68/0x130
>   __platform_register_drivers+0x64/0x160
>   mtk_drm_init+0x24/0x1000 [mediatek_drm]
>   do_one_initcall+0x60/0x1d0
>   do_init_module+0x54/0x240
>   load_module+0x1838/0x1dc0
>   init_module_from_file+0xd8/0xf0
>   __arm64_sys_finit_module+0x1b4/0x428
>   invoke_syscall.constprop.0+0x48/0xc8
>   do_el0_svc+0x3c/0xb8
>   el0_svc+0x34/0xe8
>   el0t_64_sync_handler+0xa0/0xe4
>   el0t_64_sync+0x198/0x19c
> Code: 52800022 941004ab 2a0003f3 37f80040 (29005a80)
> ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

... but wait, what have I just read? Xiaomi Smart Clock?! MT8167?

Are you running upstream on this device?
If so, why don't you also contribute a nice devicetree to get this device finally
upstream?!?! :-)

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 4c2983852596..2358407b8a6b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>   
>   	dsi->host.ops = &mtk_dsi_ops;
>   	dsi->host.dev = dev;
> +	platform_set_drvdata(pdev, dsi);
> +
>   	ret = mipi_dsi_host_register(&dsi->host);
>   	if (ret < 0)
>   		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
> @@ -1254,8 +1256,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>   
>   	init_waitqueue_head(&dsi->irq_wait_queue);
>   
> -	platform_set_drvdata(pdev, dsi);
> -
>   	dsi->bridge.of_node = dev->of_node;
>   	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>   


