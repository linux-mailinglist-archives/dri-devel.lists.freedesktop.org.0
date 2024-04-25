Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF00C8B1DA8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 11:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC8211A2EA;
	Thu, 25 Apr 2024 09:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="n2jmnZOj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF5D11A2EA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:19:02 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240425091901euoutp01bf1fa4f2342fec613b49d4ec2035b19a~Je1Wuv99f1844118441euoutp01L
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:19:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240425091901euoutp01bf1fa4f2342fec613b49d4ec2035b19a~Je1Wuv99f1844118441euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1714036741;
 bh=VVybz3ArjG9SCkgGYI737DCfD9gNvfNWH5pq4og9JqM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=n2jmnZOj+xfBxkwgxzN+y5rOEAcx0ppo65WLIu2F1N449bWFdBSSWszstKMIwiXLQ
 rr4yoyL2siZ2vXjJdzF6REikIPFheYS+MCpVaAdg3m5j8ZUh23Rt0+FZuTx5FkcrOB
 GukJEehdYMcVVm6slV+J3BbFPUBuaStmW+zfum9o=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240425091900eucas1p1645037da54c87e6c9656aeaf90ded5bb~Je1WXRL1z0566605666eucas1p16;
 Thu, 25 Apr 2024 09:19:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 95.FA.09624.4002A266; Thu, 25
 Apr 2024 10:19:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240425091900eucas1p190e706ee0812ddf335f73a19a0d1d2fe~Je1V4M4BG0531605316eucas1p1z;
 Thu, 25 Apr 2024 09:19:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240425091900eusmtrp2f52e83848f5a5dc3139f028e2f6c11d2~Je1V2Y63_0050200502eusmtrp2C;
 Thu, 25 Apr 2024 09:19:00 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-87-662a200478bf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 26.5D.08810.4002A266; Thu, 25
 Apr 2024 10:19:00 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240425091859eusmtip17ec77fc46434a61640e187bdbde9790d~Je1U5fpUe1005310053eusmtip1Y;
 Thu, 25 Apr 2024 09:18:59 +0000 (GMT)
Message-ID: <6fcfe1bb-a1e9-4d7c-aff7-e572bcdf5d31@samsung.com>
Date: Thu, 25 Apr 2024 11:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] drm/bridge: samsung-dsim: Fix porch
 calcalcuation rounding
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Cc: marex@denx.de, aford@beaconembedded.com, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Marco Felsch
 <m.felsch@pengutronix.de>, Michael Tretter <m.tretter@pengutronix.de>,
 linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240211230931.188194-2-aford173@gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0yTVxjHc95bS13NS8X0qCwsTeo2BhV0l+NQdLAPb/ww8QOhzjip8goo
 VNaKii5NXTKUkrECLpYKpUAVRAXHAO1FXHERKrFuTFipJV2dCRfpsBbY5iLO9t2Fb//zPL/n
 8n9y+LjoLLWaX6g8zKqUiiIJJSB6b/95L5l4LXF/ir1KinwPhnBkH6nkocGfmzHkbwkT6EVv
 NY7uz89S6MvzbhLV+PUEmuvSU2iisQMg18wIgSqqLTz0k62eQk9sIzjqbXvJNYV6CDRTfhKg
 8ooLJJq1egGqMY2RqHummty6krkS8pPMVKsWZ0zGQYK5sWAmGKtxnMecO11HMi2OKYzpaq+g
 mO9HWkhmUD+MMb5RB8WYXDsYf+UAxnz1PIWp6m4HzLdDJ7JiPxZsymOLCo+wqnXpuYKCCVMz
 KGmIPXb3mRNogVeoAzF8SL8Nv6j8DdcBAV9EtwEY/s6FRxIieg7AW82ZnA4D2BTQ6AA/WrDY
 9hnHtwL4dc2PPI4JAaib/jSihXQ6ND+pjfYhaClcMFdQXDwWuuoeERG9kk6Afq8hWruClsO5
 2stRPo7OhK7nC1hkAE5PkTAY6CEjCZwWQ++jRiyiKToV6oK6aNMYeiMc6wwQHJMArwXro24g
 XSeA7gttBGfzQzjqtFKcXgGnB7p5nI6HL6yNGFdwCkDzX/5/HnoAtRNewFFp0Od+RkX84/Sb
 sNO2jgt/AO/a+kjuLMuhJxjLLbEc1vSexbmwEJ4uF3H0Wmgc6PhvrPOHYVwPJMYldzEusWlc
 Ysf4/1wzINqBmC1VF+ez6lQle1SmVhSrS5X5sn2HirvAy787tDjw9DpomA7J+gHGB/0A8nFJ
 nHAs9MZ+kTBPUXacVR3aoyotYtX9YA2fkIiF0rwEVkTnKw6zB1m2hFX9m8X4Mau12EaLnecY
 29RwxpBxgp+5xYEb5TnSTkOZSJlrzbnxiWPzVfUBbZY0OTm+YFmVopA4fyltWNZPTrzfcW7+
 ZsaZK7MlijUWeUpn31GVXZz99KYntHPVPct7W2tvuak7RXWnLiUOY9nhpDS1Z9d6zWPBXsXv
 l+ud78g0+vVOtKPVZEieHZw0d2zw5fBSai9+vm3t1Z6DoodvJckSdH2/Bu4odkv+8GSLPkr0
 /SI/ucwWL08/Ml6m2feNRHN7qHi+fdX9LfOTDzIeOirr418db7zmyRqdlC7GPd4buL45EFPl
 toe3l1qOhUbJd8VNvKTggazdhlfyct2vo10bBMGmPd21249LCHWBIjURV6kVfwNriKwIKgQA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsVy+t/xu7osClppBnevMlvcuX2a2WL31W52
 ixPXFzFZ3F/8mcXi/7aJzBZXvr5ns+hdeo7VYtL9CSwWXzZNYLN4Pn8do8XJN1dZLDonLmG3
 uLxrDpvFh11AU7atAKpb+HEri8WbtkZGi7bOZawW73feYrSYNO8mq8WWNxNZHUQ91n68z+rx
 cnkDs8e8WSdYPPZ+W8DisXPWXXaP2R0zWT0W73nJ5LFpVSebx5Gri1k9Tky4xORx59oeNo95
 JwM97ncfZ/Lo/2vg0bdlFaPH5tPVAYJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbm
 sVZGpkr6djYpqTmZZalF+nYJehnP5y1iLJgrWHH210HGBsZbvF2MHBwSAiYS/1bUdDFycQgJ
 LGWUWHbgGUsXIydQXEbi5LQGVghbWOLPtS42iKL3jBJzXu5kA0nwCthJLPgwmRnEZhFQlfi2
 oBMqLihxcuYTsEGiAvIS92/NYAexhQUiJG5ObQKzRQScJU7+/cYEMpRZ4DWrxLdb5xghNuxm
 lPh5YS3YVGYBcYlbT+YzgdhsAoYSXW+7wDZwClhK3Fz/kAWixkyia2sXI4QtL7H97RzmCYxC
 s5AcMgvJqFlIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMNlsO/Zz8w7Gea8+
 6h1iZOJgPMQowcGsJMJ786NGmhBvSmJlVWpRfnxRaU5q8SFGU2BoTGSWEk3OB6a7vJJ4QzMD
 U0MTM0sDU0szYyVxXs+CjkQhgfTEktTs1NSC1CKYPiYOTqkGpnn1qROTT87T2TuBSbxu5/9F
 fZtMb29yfnPy/9yDTw4kSkyf7SG9cJlc3KWjK4uZeNb8yr9eZPNO+nCNWkZ59ZbtVz+5T3hw
 zECXb2t2yHbhIueDkcu/r5bivLpj0rF/EmwXXgdvYe66aLPLLEpU+O0N9qKP3EvWffY42l6/
 uHpp1TtRqQnNQt4FHJc29r39URZ/o+X/XZPJfzo4uU38V7Gm3eqweq9z+GDsrZlmXtGLpTm8
 Oye0Hy8rsD6uvjNM9BlXa/1ptrI3x1PSlx6YYrhj/8MNBhoRAlwuXs/KUw3Pcyw+kL6yZM25
 KKWSGf3r3HbZz978NPX0hOPiPK9iGnUFGE119TqcRYvZX+3IyVFiKc5INNRiLipOBADu2C4P
 vwMAAA==
X-CMS-MailID: 20240425091900eucas1p190e706ee0812ddf335f73a19a0d1d2fe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240211230945eucas1p1863deb244ef4fdc68825ff01d082e270
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240211230945eucas1p1863deb244ef4fdc68825ff01d082e270
References: <20240211230931.188194-1-aford173@gmail.com>
 <CGME20240211230945eucas1p1863deb244ef4fdc68825ff01d082e270@eucas1p1.samsung.com>
 <20240211230931.188194-2-aford173@gmail.com>
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

On 12.02.2024 00:09, Adam Ford wrote:
> When using video sync pulses, the HFP, HBP, and HSA are divided between
> the available lanes if there is more than one lane.  For certain
> timings and lane configurations, the HFP may not be evenly divisible.
> If the HFP is rounded down, it ends up being too small which can cause
> some monitors to not sync properly. In these instances, adjust htotal
> and hsync to round the HFP up, and recalculate the htotal.
>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM with HDMI monitor
> Signed-off-by: Adam Ford <aford173@gmail.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> V2:  No changes
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 8476650c477c..52939211fe93 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1606,6 +1606,27 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
>   		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>   	}
>   
> +	/*
> +	 * When using video sync pulses, the HFP, HBP, and HSA are divided between
> +	 * the available lanes if there is more than one lane.  For certain
> +	 * timings and lane configurations, the HFP may not be evenly divisible.
> +	 * If the HFP is rounded down, it ends up being too small which can cause
> +	 * some monitors to not sync properly. In these instances, adjust htotal
> +	 * and hsync to round the HFP up, and recalculate the htotal. Through trial
> +	 * and error, it appears that the HBP and HSA do not appearto need the same
> +	 * correction that HFP does.
> +	 */
> +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lanes > 1) {
> +		int hfp = adjusted_mode->hsync_start - adjusted_mode->hdisplay;
> +		int remainder = hfp % dsi->lanes;
> +
> +		if (remainder) {
> +			adjusted_mode->hsync_start += remainder;
> +			adjusted_mode->hsync_end   += remainder;
> +			adjusted_mode->htotal      += remainder;
> +		}
> +	}
> +
>   	return 0;
>   }
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

