Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64781357F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 16:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275A010E1A9;
	Thu, 14 Dec 2023 15:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9804110E1A9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 15:59:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20231214155915euoutp0173b2c6a7ca89e959c3037df1b207093b~gvf2KAMI72193621936euoutp01F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 15:59:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20231214155915euoutp0173b2c6a7ca89e959c3037df1b207093b~gvf2KAMI72193621936euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1702569555;
 bh=t1Ri1k88YEtJXFLu4apS8OAYzivDLP6IYWLM6Hz470Q=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ZJHvADc3B4C/FT1ThSS0qmAJenVNV4kLogS5UG1mUI6/B0tro/4SCXVGamorndpcJ
 n7u6Eo7Ic5yaIfUNQmnYKxHqhJuQaK43dRw/1+L5KlspmzR+tkAAW2Oc5Ef7DMQwKq
 kmQeHMu0P9XAxswrcpfSJr3ZWwzdZqugGatqmyQ8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231214155915eucas1p26a90c53486421a4576d223badfb3f49b~gvf132k6v0218202182eucas1p2Q;
 Thu, 14 Dec 2023 15:59:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CF.D9.09539.3562B756; Thu, 14
 Dec 2023 15:59:15 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20231214155915eucas1p2c518336996033a817222877b35ea4fd3~gvf1dNbqE0218202182eucas1p2N;
 Thu, 14 Dec 2023 15:59:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20231214155915eusmtrp16e110281bd355ea0351c1cb636cbff39~gvf1cSySh2480424804eusmtrp1z;
 Thu, 14 Dec 2023 15:59:15 +0000 (GMT)
X-AuditID: cbfec7f2-52bff70000002543-e7-657b2653c492
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2C.7D.09146.2562B756; Thu, 14
 Dec 2023 15:59:14 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231214155913eusmtip1e7453cbacef6362492c4fd6cab56598d~gvf0a9H2D1522115221eusmtip1b;
 Thu, 14 Dec 2023 15:59:13 +0000 (GMT)
Message-ID: <699636b7-d737-4df4-92e9-43b0f52d4b99@samsung.com>
Date: Thu, 14 Dec 2023 16:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/exynos: fix accidental on-stack copy of
 exynos_drm_plane
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20231214123237.1727428-1-arnd@kernel.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxj23Ht7b9useC0oR7bQrAk4toDCzDyZhK3bXG6CPwwwWWama8Zd
 JQLV1uIHPygQoBbBUrVCgY4wBGwIiwVKh8I2hlRxU0BgtLCURDcjjs9WFBlube/c+Pc87/s8
 53nfN4ePi0vJCH5mznFWlSPPkpJCwj6wcic2NTqP3XFDuxXd/LUBQ9MWO4nWjAMUsnfYeOhv
 eyWORp/Mk8joMRBoabwMoJ7HnRT6pfBPCtnuj/PQve5aElXd7cXQD5dLCWS0uPy26w4Ktax0
 AlTQ7/dWnX9EosnVkPfDmFZLK2BWnxsB07NcTzDfmX+jmBpdNY+xWc+QzNT4dZLxlDkxpr0x
 nykvmiOZRtMYyVR0WAHjtUXuE30mTMxgszJzWdX2pC+Eh436xKMjW04Wl6ziWmAK1QMBH9I7
 4R+ufkIPhHwx3QJgn6kB54gPwBv2YowjXgCbF86RLy2uwS7ANZoBNFz4+V/VIoDeK+d4AZWI
 ToLOmQEqgAk6CvbXLJNcfRO8Vf2ACODNtAR63FVBTSidCit6JrEAxulw6H7wdfDRMNqEwea7
 TWSA4PR9HP7uHgm6SToe6mf1wVcF9C54pXuI4twS2DVbG9wC0ssC+LRmmMcN/hHUtU1gHA6F
 M84OisOvwdvnzxKcoRTA+lUPxhEDgNqHbsCpdsOpO8/9cXx/RAz8tns7V5bBHs8cFihDOgRO
 zG7ihgiBRvslnCuLoK5EzKmjodnZ9l/sj0MjuAFIzesOY153APO6dcz/59YDwgrCWY06W8Gq
 43PYE3FqebZak6OI+1KZbQP+v3r7hXPJAepmFuP6AMYHfQDycWmY6JbjBCsWZchPnWZVykMq
 TRar7gOv8glpuCgqQ8KKaYX8OHuEZY+yqpddjC+I0GKmbzaMDl4tmrgaURw3vycqEVs7kjsp
 K+Slp5j3WxQbFzekKt9yVDbefJsau7bPkVxW3jX3/ZbNn8/VJeyadkQ+Xlj0+vIS3vXKk30V
 mda8offeqbz3SHPyolU8dqj2YeiOUbuEyV9LCaF0Sssn6Wkw90B0oevMtfafUvTlNqdgfmOs
 r/bi8BsL26b2wsjotHTdRP62FsnkQcOpC6LpT2Nf0RTxm2TxewuWEgYPaJvs3S+2lmCy3a//
 JZo+ljTuSt5jfIK+aul0w16bY7Dt7GXf6PBy2scVB2PaC5JKLn0o6/0g1pzwtLpB3St51llV
 rFESMRHWMMXpYyvPWoeF+3dq66SE+rA8/k1cpZb/A1AB3pkaBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsVy+t/xu7pBatWpBvM+GVucuL6IyeLBvG1s
 Fn8nHWO32LZlE6vF/20TmS2ufH3PZjHp/gQWi0/Xuhkt9r7eym5xtukNu8Wmx9dYLS7vmsNm
 MeP8PiaLA0vbWSwmzbsJ1LZnB7vFip9bGS0ajwD1zpj8ks3i9m8+BxGPNfPWMHr8/jWJ0WPv
 twUsHjtn3WX3mN0xk9Vj06pONo871/awedzvPs7ksXlJvUdv8zs2jyXTrrJ59G1ZxejxeZNc
 AG+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsak
 LpuCS2IVrW2/mRsYpwl3MXJySAiYSNw8tZ2xi5GLQ0hgKaPE+zPvmCESMhInpzWwQtjCEn+u
 dbFBFL1nlJh58RATSIJXwE7i+Ktj7CA2i4CqxJHZ39gg4oISJ2c+YQGxRQXkJe7fmgFWIywQ
 LNG39zZYL7OAuMStJ/OZQIaKCMxgkvi/qANsA7PAY2aJ/ue/wLqFBLqA1j02BbHZBAwlut52
 gW3gFDCXWLnrAjvEJDOJrq1djBC2vMT2t3OYJzAKzUJyyCwkC2chaZmFpGUBI8sqRpHU0uLc
 9NxiQ73ixNzi0rx0veT83E2MwCSy7djPzTsY5736qHeIkYmD8RCjBAezkgjvyR3lqUK8KYmV
 ValF+fFFpTmpxYcYTYGhMZFZSjQ5H5jG8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1Kz
 U1MLUotg+pg4OKUamGok4l4dVTSc8Fk2U3/vy1PtXlJ2qy39G+ZPFUx/wHzmStrs3rp1GmEW
 r5JWq+3e9W49q3e50t8rezsP+/0rN+uu2T5j/ZIn7dvyup5l2RibCiwpOGrfu2fHpiw9NR/B
 zovPS9o/fOTq/7IywdqOa9+PQ+3d8VFZiRWHz3Ht2vzGcbpZQsDR1WK3p89If/58eYLSGTXj
 0+rdgvIMjo6/nZlsJati0pmS660lr9hPvyw2o7bdiPlqePmNpZXbPSo0lxY21s7Q2Xrn5bot
 XXXGh3ZGCC5yZH528NuPC6nbRAprLXL2HTYtMJLhePtj2ZLjG398dF7+UlHv6sdOx0Pb32hs
 0T3Yv/J/2nUf458vTiuxFGckGmoxFxUnAgAQVosAqwMAAA==
X-CMS-MailID: 20231214155915eucas1p2c518336996033a817222877b35ea4fd3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231214123248eucas1p1577bc2064401fce57a752234e1338f5a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231214123248eucas1p1577bc2064401fce57a752234e1338f5a
References: <CGME20231214123248eucas1p1577bc2064401fce57a752234e1338f5a@eucas1p1.samsung.com>
 <20231214123237.1727428-1-arnd@kernel.org>
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
Cc: linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.12.2023 13:32, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc rightfully complains about excessive stack usage in the fimd_win_set_pixfmt()
> function:
>
> drivers/gpu/drm/exynos/exynos_drm_fimd.c: In function 'fimd_win_set_pixfmt':
> drivers/gpu/drm/exynos/exynos_drm_fimd.c:750:1: error: the frame size of 1032 bytes is larger than 1024 byte
> drivers/gpu/drm/exynos/exynos5433_drm_decon.c: In function 'decon_win_set_pixfmt':
> drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:1: error: the frame size of 1032 bytes is larger than 1024 bytes
>
> There is really no reason to copy the large exynos_drm_plane
> structure to the stack before using one of its members, so just
> use a pointer instead.
>
> Fixes: 6f8ee5c21722 ("drm/exynos: fimd: Make plane alpha configurable")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--
>   drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 4d986077738b..bce027552474 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -319,9 +319,9 @@ static void decon_win_set_bldmod(struct decon_context *ctx, unsigned int win,
>   static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
>   				 struct drm_framebuffer *fb)
>   {
> -	struct exynos_drm_plane plane = ctx->planes[win];
> +	struct exynos_drm_plane *plane = &ctx->planes[win];
>   	struct exynos_drm_plane_state *state =
> -		to_exynos_plane_state(plane.base.state);
> +		to_exynos_plane_state(plane->base.state);
>   	unsigned int alpha = state->base.alpha;
>   	unsigned int pixel_alpha;
>   	unsigned long val;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 8dde7b1e9b35..5bdc246f5fad 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -661,9 +661,9 @@ static void fimd_win_set_bldmod(struct fimd_context *ctx, unsigned int win,
>   static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
>   				struct drm_framebuffer *fb, int width)
>   {
> -	struct exynos_drm_plane plane = ctx->planes[win];
> +	struct exynos_drm_plane *plane = &ctx->planes[win];
>   	struct exynos_drm_plane_state *state =
> -		to_exynos_plane_state(plane.base.state);
> +		to_exynos_plane_state(plane->base.state);
>   	uint32_t pixel_format = fb->format->format;
>   	unsigned int alpha = state->base.alpha;
>   	u32 val = WINCONx_ENWIN;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

