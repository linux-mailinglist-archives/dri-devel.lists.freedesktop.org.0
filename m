Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E2A5BA79
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 09:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B05710E521;
	Tue, 11 Mar 2025 08:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AIC5nti+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6932910E521
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 08:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741680448;
 bh=Wln6HbJ1YhxwRZiQK3YIiagu79K/yCUP4PftsyrzyJo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AIC5nti+7eUbHYa6koRGpGRDZWZUbDap8+kiOPa6xudRu7/6HjjqlTTTq6qe2/eUP
 Lm4HrDY94i1XeUGM9dBC7TanQ2zW+Ew7KiM7mA8Ctfvllyh/j//QUiaA5cyubszlpZ
 rHDwH9F0Wyj/ZftoFQL26wvIBB4Sk/UFeymsxRC1g2gSxQqBxV3ptne2FoWM4mLYP7
 NNjC+9XFBIeDBcAmhb62N601XSk9+J/cDysAdY9y47RnM8oh/ZxJDcpITuPm5ULtQO
 MocuUeeR4PIDK+pPBZY+m3Epg6xukvWc30vrwWYQIjNEFgmaJYhZQZNkgdMyrtJi4q
 QY0VkpuOtjtlg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A6CBD17E0237;
 Tue, 11 Mar 2025 09:07:27 +0100 (CET)
Date: Tue, 11 Mar 2025 09:06:49 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
Subject: Re: [PATCH v1 5/6] drm/panfrost: Enable AARCH64_4K page table
 format on mediatek_mt8188
Message-ID: <20250311090649.0d15d74d@collabora.com>
In-Reply-To: <20250310195921.157511-6-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-6-ariel.dalessandro@collabora.com>
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

On Mon, 10 Mar 2025 16:59:20 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> Now that Panfrost supports AARCH64_4K page table format, let's enable it
> on Mediatek MT8188.

Can you maybe give more details on why this is needed
(legacy shareability/cacheability not suitable for this GPU?)?

> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 0f3935556ac76..d7b8bded6d784 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -824,6 +824,7 @@ static const struct panfrost_compatible mediatek_mt8188_data = {
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +	.gpu_configs = BIT(GPU_CONFIG_AARCH64_4K),
>  };
>  
>  static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };

