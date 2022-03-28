Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED69C4E8FCA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 10:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CABF10E564;
	Mon, 28 Mar 2022 08:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D19610E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 08:10:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0E96B1F430E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648455000;
 bh=/nWwqk3sPy6vmwVbxGTUip5rp6cQqefeecpSJO7M4VU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UiJeHcrb22+gxlwFAcWUPiZHHp8/logMJ7mTY54Dc1dhEE8gp3W9RL0O7G2CeQXbV
 gIqH3zqEye8pXt/cRvpTwr9+Q8OjU5Dx0heK90tYwCh0FG6ooKJCrPf7lDXXZpsFOU
 iwY+2LC5L/DGNeGUnoN9ihJH5wnjerx0CcCMLOPISGODK27sNNctav+XfeXXZnT9LJ
 CHFwHtVxRjUBayuSZAllKSy96pw17v1+oZgJF5zYl3SpZC9S5LcITyy6uM2G5QoBXJ
 hgfBsPl3nn+kuliZ6N1Fg1z4XIIGmoYOMwZlhuvbmsSXO3z/csC/LfIC/IJsyFz+yx
 8fyq0INsI78aQ==
Message-ID: <33212024-ae93-32c3-7890-09006057ff49@collabora.com>
Date: Mon, 28 Mar 2022 10:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 06/22] video/hdmi: Add audio_infoframe packing for DP
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, airlied@linux.ie,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-7-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220327223927.20848-7-granquet@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
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
> ---
>   drivers/video/hdmi.c           | 82 ++++++++++++++++++++++++++--------
>   include/drm/dp/drm_dp_helper.h |  2 +
>   include/linux/hdmi.h           |  7 ++-
>   3 files changed, 71 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 947be761dfa4..5f50237554ed 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -21,6 +21,7 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> +#include <drm/dp/drm_dp_helper.h>
>   #include <linux/bitops.h>
>   #include <linux/bug.h>
>   #include <linux/errno.h>
> @@ -381,12 +382,34 @@ static int hdmi_audio_infoframe_check_only(const struct hdmi_audio_infoframe *fr
>    *
>    * Returns 0 on success or a negative error code on failure.
>    */
> -int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
> +int hdmi_audio_infoframe_check(const struct hdmi_audio_infoframe *frame)

I agree with this change, as hdmi_audio_infoframe_check_only()'s param is a const,
but you really should mention that you're constifying this one in your commit
description, or do that in a separate commit.

Either of the two is fine.

Regards,
Angelo
