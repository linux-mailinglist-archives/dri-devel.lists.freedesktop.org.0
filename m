Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B904BFC2F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 16:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5001210E9EC;
	Tue, 22 Feb 2022 15:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB8A10E9E3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 15:16:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1402E1F42D79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645543012;
 bh=m6iks4nKShpjnvSQCg9oNY965h9zeoboZznnHfhpxKI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hWvPkhkzNvqzNuA/40T3XKUxHYa8HSRU4pVMNzoIFWC7rXAT0apDYLnpkMJhnqbJM
 arssexAyQVcSVzvw5Amf+UBgH8G+8JAoeSIFcUxhxPNyzQMNZV+16CstcTP/iDH5Hg
 8XKAw2ROpBcy+hVlpJZNGroDpoRV/m8w9fVh/Yl0wVhuV6RPtUoYvkLuG/iZUukwGC
 bAX9ZZ15SJkfiUYauqLfQv5HFCFnR47Rx3FLe1eOLehFQPIJKIeNvBPRO6NReiqME2
 u+ne7v0rhJH3lU010TKtdqa7o08BP9WgUrRIeePPFQWufHuOtvUjuDVVM8Ex9z5m24
 I22HEnZSbhtaw==
Message-ID: <1c791b60-935c-1e8e-dd1b-4b18fc273c1b@collabora.com>
Date: Tue, 22 Feb 2022 16:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 04/19] video/hdmi: Add audio_infoframe packing for DP
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-5-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-5-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Similar to HDMI, DP uses audio infoframes as well which are structured
> very similar to the HDMI ones.
> 
> This patch adds a helper function to pack the HDMI audio infoframe for
> DP, called hdmi_audio_infoframe_pack_for_dp().
> hdmi_audio_infoframe_pack_only() is split into two parts. One of them
> packs the payload only and can be used for HDMI and DP.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Hello Guillaume,

I've just noticed that this patch will not apply against the latest linux-next,
as the include/drm/drm_dp_helper.h header was moved to
include/drm/dp/drm_dp_helper.h

Can you please rebase for v9?

Thanks,
Angelo

> ---
>   drivers/video/hdmi.c        | 83 ++++++++++++++++++++++++++++---------
>   include/drm/drm_dp_helper.h |  2 +
>   include/linux/hdmi.h        |  7 +++-
>   3 files changed, 72 insertions(+), 20 deletions(-)
> 
