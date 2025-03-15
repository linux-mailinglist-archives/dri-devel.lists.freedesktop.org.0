Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B6CA6293F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 09:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214C610E1C0;
	Sat, 15 Mar 2025 08:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LQO04r4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3CF10E1C0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742028448;
 bh=G8uYSrifhqywqfMO1IBBhasEEunS+Y3jrko3Aki/XA0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LQO04r4q3Sevfv8mmADPojqCSJcQxUVqr4wr2MLx8Y89UPKMJ/9MVD3Ka68IF5d2V
 fYWoNfuPE/yl6yzB4kFEUFU5qHLrhdKhuBuFwd1RfDrwkkbACsdMEBPxSty6ki57Qv
 hwdp7lNTn0Bit7z2HUoapOazm5azakK1LwI0jFXyxelzE5e/0z3uO+SkZnOLl8x9m2
 FPIaialuC/Wp1qsgs/2EiYwo5CYKPsf/VkuTaDuUC8zbgYfWp+0LH7vtssH5L+PWpw
 7pu4dbwDbgizk1/LFSBduf/h4FFXinQyo+bIydoS5dF9tqeLGWIDNMQ7ruU9xJHH7z
 bLG9gUCBi32qA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CCFF117E05C8;
 Sat, 15 Mar 2025 09:47:27 +0100 (CET)
Date: Sat, 15 Mar 2025 09:47:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v2 6/6] drm/panfrost: Force AARCH64_4K page table format
 on MediaTek MT8192
Message-ID: <20250315094722.4c4804c6@collabora.com>
In-Reply-To: <20250314173858.212264-7-ariel.dalessandro@collabora.com>
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
 <20250314173858.212264-7-ariel.dalessandro@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 14 Mar 2025 14:38:58 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> MediaTek MT8192 SoC has an ARM Mali-G57 MC5 GPU (Valhall-JM). Now that
> Panfrost supports AARCH64_4K page table format, let's enable it on this
> SoC.
> 
> Running glmark2-es2-drm [0] benchmark, reported the same performance
> score on both modes Mali LPAE (LEGACY) vs. AARCH64_4K, before and after
> this commit. Tested on a Mediatek (MT8395) Genio 1200 EVK board.
> 
> [0] https://github.com/glmark2/glmark2
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index e854f290858f9..ef30d314b2281 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -836,6 +836,7 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
>  	.pm_domain_names = mediatek_mt8192_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
>  
>  static const struct of_device_id dt_match[] = {

