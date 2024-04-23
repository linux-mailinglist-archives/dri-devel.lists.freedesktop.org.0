Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0938AF86A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 22:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BED610E06D;
	Tue, 23 Apr 2024 20:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="H1zi+uW1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E5C10E06D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 20:52:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240423205238euoutp013cd2e769616c26d745f9bc0e7e573afe~JBAZp5pzw1294612946euoutp01k
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 20:52:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240423205238euoutp013cd2e769616c26d745f9bc0e7e573afe~JBAZp5pzw1294612946euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1713905558;
 bh=2otvmutdKyHoEaA06cEeWxPbYOppyD/0lNiNCzbg05g=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=H1zi+uW1Z40x3XzIdNP7JwVEN55zswPVuI83E8PnzeYo7AGafSU4/xym3YmwHJy6Z
 95zKIBALSaJ09yNcvVMzQK7ECyQu3xsueOVFTUpOpUpJ+FfPRfmTh4n7yKv4ErKye9
 svKNVDazSl/l2oFy9kW0Ir2CHrjNVxzF9zr38dJQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240423205238eucas1p1d42dca0b203ed18170c2360dc670194a~JBAZQPWYy1461514615eucas1p1_;
 Tue, 23 Apr 2024 20:52:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4C.2A.09875.69F18266; Tue, 23
 Apr 2024 21:52:38 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240423205237eucas1p193f07dfa95bb54c2d3d23a6187c4614e~JBAYr64GL1461514615eucas1p19;
 Tue, 23 Apr 2024 20:52:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240423205237eusmtrp25e0512fb14637a6a188206f796ce90c5~JBAYrUESH3042330423eusmtrp2F;
 Tue, 23 Apr 2024 20:52:37 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-cb-66281f968a0d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E8.17.08810.59F18266; Tue, 23
 Apr 2024 21:52:37 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240423205237eusmtip1f46664a45102f838da2f722dc193cfcd~JBAYOW64C0206202062eusmtip1K;
 Tue, 23 Apr 2024 20:52:37 +0000 (GMT)
Message-ID: <e9d4378e-60c6-4004-ae56-6b4f55eb3400@samsung.com>
Date: Tue, 23 Apr 2024 22:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/exynos: fix .get_modes return value in case of errors
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240423204431.3288578-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djPc7rT5DXSDLr2CFlc+fqezWLS/Qks
 FufPb2C32PT4GqvFjPP7mCwWbHzEaDFj8ks2B3aPTas62Tzudx9n8ti8pN6jb8sqRo/Pm+QC
 WKO4bFJSczLLUov07RK4Mh6+WcVWcECo4sJXgwbGbv4uRk4OCQETieOrdjKB2EICKxgl5jSz
 dzFyAdlfGCVWbv/IBuF8ZpTYv3AZE0zHweNnmCASyxklNj6/yQzhfGSUePz6HlgVr4CdxJGj
 V9hBbBYBVYmeyw2MEHFBiZMzn7CA2KIC8hL3b80AqxEWCJCYeXIamC0ikCdxdVo7K8hQZoEe
 RolVs64wgySYBcQlbj2ZD7aATcBQouttFxuIzSngIDFzeg87RI28xPa3c8AukhC4wyEx8+IG
 Voi7XSTW9V+BsoUlXh3fwg5hy0j83zmfCaKhnVFiwe/7UM4ERomG57cYIaqsJe6c+wW0jgNo
 habE+l36EGFHianXD4KFJQT4JG68FYQ4gk9i0rbpzBBhXomONiGIajWJWcfXwa09eOES8wRG
 pVlI4TILyZuzkLwzC2HvAkaWVYziqaXFuempxUZ5qeV6xYm5xaV56XrJ+bmbGIEp6PS/4192
 MC5/9VHvECMTB+MhRgkOZiUR3l9/VNKEeFMSK6tSi/Lji0pzUosPMUpzsCiJ86qmyKcKCaQn
 lqRmp6YWpBbBZJk4OKUamFQZw3XVXy0VVVA+Nn/llpxTWRIyf//MZH3f6vn6gfeuvV4uS9KN
 ylhu1C12dvqh1iDWx5kukmF057XA7QnKInFOHN+WSLrPTV4pKnX4UFWofWhnuffr+l/Wxs75
 PNvPCLMuLtl145sO17vO78Idc3ti+96Wih7vtzuWKGZ4O0z6q2j8hP2/jHeUvT3t9vCW5qrT
 m0uzrNX63u9lbHg9I/7o38hj52LvcV92D/3weUruk3O/b3Ptq9nFbP82506mTVEV/znbxKSF
 yxZcq69JdGjjUF/XmfvA3yvAbvG/iqwdmpE60++4nJt20GnPqQl/1IPkXdNXpE6a9F3jq7Pb
 HsmfF3Z99swQSOi8s82qTYmlOCPRUIu5qDgRABXiTMOwAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7pT5TXSDBZeULG48vU9m8Wk+xNY
 LM6f38BusenxNVaLGef3MVks2PiI0WLG5JdsDuwem1Z1snnc7z7O5LF5Sb1H35ZVjB6fN8kF
 sEbp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZTx8
 s4qt4IBQxYWvBg2M3fxdjJwcEgImEgePn2ECsYUEljJKnNthCRGXkTg5rYEVwhaW+HOti62L
 kQuo5j2jxKbZq9hAErwCdhJHjl5hB7FZBFQlei43MELEBSVOznzCAmKLCshL3L81A6xGWMBP
 4uOkfrBlIgJ5EouWHmAFGcos0MMosWDxV2aIDZMZJV59fwG2mllAXOLWk/lgHWwChhJdb7vA
 NnMKOEjMnN7DDlFjJtG1tYsRwpaX2P52DvMERqFZSA6ZhWTULCQts5C0LGBkWcUoklpanJue
 W2yoV5yYW1yal66XnJ+7iREYc9uO/dy8g3Heq496hxiZOBgPMUpwMCuJ8P76o5ImxJuSWFmV
 WpQfX1Sak1p8iNEUGBoTmaVEk/OBUZ9XEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliSmp2a
 WpBaBNPHxMEp1cCk09R0qS70vt3K862P69p/NXx11LCT2qmuwXTt34HvLJyC7WuLa2x+R9cu
 Nrxw75nu79cfl71SsFvp+kT0rfyu1aXpnJ++cezbafDvzQf9X0WBMe8mp/HMUW1dUCaX7/rh
 0LStZyUYNzQoJScaKCYeuOW4fFXFERnpn9rHHM6drI8+Z/HuQ2z2fO5T/Kur3n64vlfxT6dC
 TtNExzjX27OFfdMPcD5fP93bsWCv2vMUx8+aK6UmM1quZtXyUMh2inS5WqdvKDxliyPbCdGl
 s2vXRfYvYnzWWGV95VDor4evlx282mjJ9VI6Wrx6neak0EmTmlZmPHu8YK624+LsGSnnzv7X
 XeBW3cHD8myDe7yfEktxRqKhFnNRcSIAvPqvK0IDAAA=
X-CMS-MailID: 20240423205237eucas1p193f07dfa95bb54c2d3d23a6187c4614e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240423204435eucas1p2c0a9a75f87b31d11faa59fec40878f23
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240423204435eucas1p2c0a9a75f87b31d11faa59fec40878f23
References: <CGME20240423204435eucas1p2c0a9a75f87b31d11faa59fec40878f23@eucas1p2.samsung.com>
 <20240423204431.3288578-1-m.szyprowski@samsung.com>
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

On 23.04.2024 22:44, Marek Szyprowski wrote:
> Commit 7af03e688792 ("drm/probe-helper: warn about negative
> .get_modes()") clarified, that .get_modes callback must not return
> negative values on failure, so fix sub-drivers to return 0 in case of
> errors. This fixes strange Exynos DRM initialization failure on boot
> (timeout waiting for VSYNC) observed on Trats2 board.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Ah, I've missed that this has been already fixed in -next by the patch 
13d5b040363c ("drm/exynos: do not return negative values from 
.get_modes()"), so ignore this one. I'm sorry for the noise.

> ---
>   drivers/gpu/drm/exynos/exynos_drm_vidi.c | 4 ++--
>   drivers/gpu/drm/exynos/exynos_hdmi.c     | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index e5662bdcbbde..e3868956eb88 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -315,14 +315,14 @@ static int vidi_get_modes(struct drm_connector *connector)
>   	 */
>   	if (!ctx->raw_edid) {
>   		DRM_DEV_DEBUG_KMS(ctx->dev, "raw_edid is null.\n");
> -		return -EFAULT;
> +		return 0;
>   	}
>   
>   	edid_len = (1 + ctx->raw_edid->extensions) * EDID_LENGTH;
>   	edid = kmemdup(ctx->raw_edid, edid_len, GFP_KERNEL);
>   	if (!edid) {
>   		DRM_DEV_DEBUG_KMS(ctx->dev, "failed to allocate edid\n");
> -		return -ENOMEM;
> +		return 0;
>   	}
>   
>   	drm_connector_update_edid_property(connector, edid);
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index c5ba32fca5f3..603d8bb0b03a 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -878,11 +878,11 @@ static int hdmi_get_modes(struct drm_connector *connector)
>   	int ret;
>   
>   	if (!hdata->ddc_adpt)
> -		return -ENODEV;
> +		return 0;
>   
>   	edid = drm_get_edid(connector, hdata->ddc_adpt);
>   	if (!edid)
> -		return -ENODEV;
> +		return 0;
>   
>   	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
>   	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

