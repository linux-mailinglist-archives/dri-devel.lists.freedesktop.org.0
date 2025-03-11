Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA16A5BBA4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B919F10E135;
	Tue, 11 Mar 2025 09:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IPqCIJR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE8A10E135
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741684182;
 bh=6Y/kqe4ESlLKPPwAdQRMQdrAIo89CgPRwwvqGj8Dd8s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IPqCIJR154BY6tFPErElSqI5KpX6LmqlGrxjLYgykbMbKI4AhzvIyiebJs1qcEKcl
 rS5yBrFJt4ENvvdHd3nD+eEz69JQuNKA/CXITBeYTe3s+yUlEbkamtX+AbLgRexF+P
 ZiFTOB7eMEKXUFhPO3XCrVyMDSAKUwaTYW6UCyS00H6Idclv6vLEL3d3OGsSOjCnkH
 4cZjsjvkxUwjm+fb2xfdS3m4m/G27lyBXBPWQYK9XdBFsXwXuy88TgxvvrEyT6Rlmn
 N2f826TK0hYW7dofQ4k3u3aCvAJqBrcZezwtPyJFEhPcWQizhd6WaVzGjxC3jxtGY4
 YBBORT+bdRvZA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 617C717E087E;
 Tue, 11 Mar 2025 10:09:41 +0100 (CET)
Message-ID: <55b8bc40-0a29-46c2-ba5d-c7cc7742cf5f@collabora.com>
Date: Tue, 11 Mar 2025 10:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] drm/panfrost: Enable AARCH64_4K page table format
 on mediatek_mt8188
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-6-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250310195921.157511-6-ariel.dalessandro@collabora.com>
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

Il 10/03/25 20:59, Ariel D'Alessandro ha scritto:
> Now that Panfrost supports AARCH64_4K page table format, let's enable it
> on Mediatek MT8188.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 0f3935556ac76..d7b8bded6d784 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -824,6 +824,7 @@ static const struct panfrost_compatible mediatek_mt8188_data = {
>   	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>   	.pm_domain_names = mediatek_mt8183_pm_domains,
>   	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +	.gpu_configs = BIT(GPU_CONFIG_AARCH64_4K),
>   };
>   
>   static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };

Didn't that work on MT8195/8395 as well? I also recall hearing that it was somewhat
giving ever-so-slightly better performance?

If it does, please enable it on 8195 as well :-)

also s/mediatek_mt8188/MediaTek MT8188/g

...and btw
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo
