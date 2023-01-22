Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029FC677103
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 18:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFC310E17C;
	Sun, 22 Jan 2023 17:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C475610E17C
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 17:14:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B04B685565;
 Sun, 22 Jan 2023 18:14:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674407670;
 bh=qpvKbk0W1f539TSNkgyW7XATGGgOzHEwlUEFmsO6ZKg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jyVkpl1H7BgdVylsZAZ3tkofz9c+78/sh7bS8bAnx0wiWHV0bWUWhU1LQ04z+Dky1
 G/7Is/tulu+1zBU+4cSPnM4s+S6J1spzQeRU/o+zSw0YNE+0qvlqWYwNQOIq1v5edu
 F73mWhVfnyUB6hSSwLSk9AZaDkyyCyIyDFNHs0YnCcd8mzDiizkLJ2wKmR2d0OJBWo
 dF58eUME7kcqRraF9zmmA89jTBkWISlsN+TMK/EUKtX2eOMvP9cn8yA7LT4tQ8o6Kj
 QjRPrwDEqcgv/KzNO2SrtXwqEBFGxQu9OATxHCLlVQZ5gZprN/otroBslxh/GdwdQb
 m3g3GD4ziju8Q==
Message-ID: <a5f8ec67-5888-3ee8-a1b1-32fef386d6cb@denx.de>
Date: Sun, 22 Jan 2023 18:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] drm/bridge: fsl-ldb: Add i.MX93 LDB support
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230122121836.778195-1-victor.liu@nxp.com>
 <20230122121836.778195-3-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230122121836.778195-3-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, linux-imx@nxp.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/22/23 13:18, Liu Ying wrote:
> Same to i.MX8mp LDB, i.MX93 LDB is controlled by mediamix blk-ctrl
> through LDB_CTRL and LVDS_CTRL registers.  i.MX93 LDB supports only
> one LVDS channel(channel 0) and it's LVDS_CTRL register bit1 is used
> as LVDS_EN instead of CH1_EN.  Add i.MX93 LDB support in the existing
> i.MX8mp LDB bridge driver by adding i.MX93 LDB compatible string and
> device data(to reflect different register offsets and LVDS_CTRL register
> bit1 definition).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * No change.
> 
>   drivers/gpu/drm/bridge/fsl-ldb.c | 53 ++++++++++++++++++++++++++------
>   1 file changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 9bcba8fc57e7..6ad63ac7367c 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -18,7 +18,6 @@
>   #include <drm/drm_of.h>
>   #include <drm/drm_panel.h>
>   
> -#define LDB_CTRL				0x5c
>   #define LDB_CTRL_CH0_ENABLE			BIT(0)
>   #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
>   #define LDB_CTRL_CH1_ENABLE			BIT(2)
> @@ -35,9 +34,9 @@
>   #define LDB_CTRL_ASYNC_FIFO_ENABLE		BIT(24)
>   #define LDB_CTRL_ASYNC_FIFO_THRESHOLD_MASK	GENMASK(27, 25)
>   
> -#define LVDS_CTRL				0x128
>   #define LVDS_CTRL_CH0_EN			BIT(0)
>   #define LVDS_CTRL_CH1_EN			BIT(1)

It would be good to add a comment here that the bit is poorly named and 
that LVDS_CTRL_LVDS_EN=1 means DISABLE, while LVDS_CTRL_LVDS_EN=0 means 
ENABLE .

> +#define LVDS_CTRL_LVDS_EN			BIT(1)

[...]

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks!
