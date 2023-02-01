Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC970686A66
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 16:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8654210E417;
	Wed,  1 Feb 2023 15:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B9F10E40A;
 Wed,  1 Feb 2023 15:32:22 +0000 (UTC)
Received: from [192.168.1.27] (cst-prg-44-69.cust.vodafone.cz [46.135.44.69])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: tomeu)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 502D06602ED9;
 Wed,  1 Feb 2023 15:32:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675265540;
 bh=79/7j1adKpBeC2ITLcm3XtfNIwahnDt+R8FVA7DKw/I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h6hcV99h2Zav127o+0aZg2/aWhgV1qaajBTYTZ3kF4udFE5WrlXuWjPJF4qdGlquR
 efswTswr2HmA6OaK7DDetrfgTgX81pB6wspfCrMR8FpjjF3ZhrjqbiQ17Dza+m19Rp
 a3+2ovsDv8gFQm7vH/tji5OrcDoz7Nod2laGEmmDEm9K6j1NHovgs6FOWlYs6fu8jS
 nuvREs+FetRwGHRkfUXxgYgqyodiNOuT6l5yvx/2+/lN11SqWPc73WRZRIKbLbV6zB
 aNWyKNZKpDB9fktHvu0AM4FZENKu4LnGJAkYRDMDk7EGzSLqMkYBtmxRIDxF/ASJJn
 efeFaVFR0+8iA==
Message-ID: <c3f07d72-6fc7-fac7-0d74-3d687f91d3ec@collabora.com>
Date: Wed, 1 Feb 2023 16:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/etnaviv: show number of NN cores in GPU debugfs info
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
References: <20230201152747.1428179-1-l.stach@pengutronix.de>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
In-Reply-To: <20230201152747.1428179-1-l.stach@pengutronix.de>
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/23 16:27, Lucas Stach wrote:
> For NPUs the number of NN cores is a interesting property, which is useful
> to show in the debugfs information.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 27c10584773d..de8c9894967c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -961,6 +961,8 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
>   			gpu->identity.vertex_cache_size);
>   	seq_printf(m, "\t shader_core_count: %d\n",
>   			gpu->identity.shader_core_count);
> +	seq_printf(m, "\t nn_core_count: %d\n",
> +			gpu->identity.nn_core_count);
>   	seq_printf(m, "\t pixel_pipes: %d\n",
>   			gpu->identity.pixel_pipes);
>   	seq_printf(m, "\t vertex_output_buffer_size: %d\n",

Hi Lucas,

That looks good to me.

Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Cheers,

Tomeu
