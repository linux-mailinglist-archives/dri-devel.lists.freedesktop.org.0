Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8A78FC4F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 13:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6D310E78B;
	Fri,  1 Sep 2023 11:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DAE10E78B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 11:32:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 381BVpjf036112;
 Fri, 1 Sep 2023 06:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1693567911;
 bh=SYdFRxXFU6erJ9Dh1t1hgvxPkK69MKAAgIlxHB5BT4g=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=MEDRj3xZw+6dV+NMmmX3rKGISboFg4t4tOFexgXRtcj10RFG5VALtz7SYQp7qBDcy
 GkPpUKL2xtcOc5J/T6gisLlVCmcimtYbtjwztPRaQwxH2id02VzpUOksyP7pLTTRl6
 qrTrqJhKEX5ly6fR+8xaV5wFhYF5hQldryloafT8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 381BVpJE000326
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Sep 2023 06:31:51 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Sep 2023 06:31:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Sep 2023 06:31:49 -0500
Received: from [172.24.227.132] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 381BVN55036338;
 Fri, 1 Sep 2023 06:31:32 -0500
Message-ID: <fe786b37-a442-7230-305c-c8bca7cffa2a@ti.com>
Date: Fri, 1 Sep 2023 17:01:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] drm: bridge: it66121: Fix invalid connector dereference
To: Jai Luthra <j-luthra@ti.com>, Phong LE <ple@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Belin <nbelin@baylibre.com>, "Andy.Hsieh" <Andy.Hsieh@mediatek.com>
References: <20230901-it66121_edid-v2-1-aa59605336b9@ti.com>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20230901-it66121_edid-v2-1-aa59605336b9@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: nm@ti.com, devarsht@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 01-Sep-23 15:01, Jai Luthra wrote:
> Fix the NULL pointer dereference when no monitor is connected, and the
> sound card is opened from userspace.
> 
> Instead return an empty buffer (of zeroes) as the EDID information to
> the sound framework if there is no connector attached.
> 
> Fixes: e0fd83dbe924 ("drm: bridge: it66121: Add audio support")
> Reported-by: Nishanth Menon <nm@ti.com>
> Closes: https://lore.kernel.org/all/20230825105849.crhon42qndxqif4i@gondola/
> Reviewed-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

Regards
Aradhya

> ---
> Changes in v2:
> - Return an empty buffer of 0s instead of returning an error
> - Lock the mutex before accessing ctx->connector
> - Link to v1: https://lore.kernel.org/r/20230825-it66121_edid-v1-1-3ab54923e472@ti.com
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 466641c77fe9..fc7f5ec5fb38 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1447,10 +1447,14 @@ static int it66121_audio_get_eld(struct device *dev, void *data,
>  	struct it66121_ctx *ctx = dev_get_drvdata(dev);
>  
>  	mutex_lock(&ctx->lock);
> -
> -	memcpy(buf, ctx->connector->eld,
> -	       min(sizeof(ctx->connector->eld), len));
> -
> +	if (!ctx->connector) {
> +		/* Pass en empty ELD if connector not available */
> +		dev_dbg(dev, "No connector present, passing empty EDID data");
> +		memset(buf, 0, len);
> +	} else {
> +		memcpy(buf, ctx->connector->eld,
> +		       min(sizeof(ctx->connector->eld), len));
> +	}
>  	mutex_unlock(&ctx->lock);
>  
>  	return 0;
> 
> ---
> base-commit: 99d99825fc075fd24b60cc9cf0fb1e20b9c16b0f
> change-id: 20230825-it66121_edid-6ee98517808b
> 
> Best regards,

