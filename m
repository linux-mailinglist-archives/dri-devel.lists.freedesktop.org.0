Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E431A120932
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 16:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4419889B11;
	Mon, 16 Dec 2019 15:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A7A89B11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 15:02:40 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191216150238euoutp012139f22c4f671613622df6929c20d3be~g4i53Yt4h0812308123euoutp01B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 15:02:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191216150238euoutp012139f22c4f671613622df6929c20d3be~g4i53Yt4h0812308123euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576508558;
 bh=Xaf8wrUXGwn3OVi2d4TBP8ibWVevRwM8z7qymLpY+NM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BqeFfQ7Gjtcq7M0STTEUgtcHl8vzU/5f8lj0IN2wEgsVYpIt+WbKHT4B7vUe4EN6f
 UijQ2Gdu7z70OsncrYAiTD4uf1aXamQjyMt0swJGW2/EAvALYw+d11uHP+e9lSlF4v
 9lgt2FavBpNwhUTl7E1PrEyXyp72g8iyGxTIHF0M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191216150238eucas1p222f36093b6b2c1fcd91ae7aa8146f418~g4i5czzP91762717627eucas1p2R;
 Mon, 16 Dec 2019 15:02:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B1.CB.61286.E8C97FD5; Mon, 16
 Dec 2019 15:02:38 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191216150237eucas1p1c85d23b9dff40d2a34d72998edc92917~g4i47Ls6y2251322513eucas1p1f;
 Mon, 16 Dec 2019 15:02:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191216150237eusmtrp156953cf575e8506bad5f99e053649ea6~g4i46aCiF2867228672eusmtrp1N;
 Mon, 16 Dec 2019 15:02:37 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-a2-5df79c8e8476
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7B.74.08375.D8C97FD5; Mon, 16
 Dec 2019 15:02:37 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191216150236eusmtip16f7c61533b30e0d683c1e6908e81df44~g4i4BV7wR0696706967eusmtip1W;
 Mon, 16 Dec 2019 15:02:36 +0000 (GMT)
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
To: Boris Brezillon <boris.brezillon@collabora.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
Date: Mon, 16 Dec 2019 16:02:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216155551.083dcbaf@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO+fsnDNrdZyWL9nNgZVR5iXig+4RcYgICYpKpGYeVHQmm1r2
 aynWmiammbbK0iaapBOdNS+VN1rLGmkNxRJNBFFc0sWW2M3tWPnveZ73fb/3eV4+lpRfpJez
 8UkpgjpJmaigvaiHz6btm3JvuaJCWmc43F9jl+BM3Q7c9fIFgdtarAS+0zkrvZ2apLHDNUZi
 24SDwvX2HAl+lTHB4MtXjQwu7+0mcHtuJB4yJeCsx50MrpxuQLi4YIzG000l1G45/6DkAeIn
 +7IYfqjwN8FbBoyIbzQMMPxN3Q0JX1d1meaf5/UQ/GC2leCN1x00n2uuQnzrlQKK/1K3KkJ2
 wmt7jJAYnyaoN+885RVXOjmCkrUrztUOtxFaZF6mRywL3BZwNPvrkRcr5yoRWLQWiUi+Ihg0
 fSVF8gXBk34n0iOpZ+K7vZIRCxUI8h3DtEicCGp1pRJ3lw93FGw/tIwb+3LhcLu+2TNBciUS
 +FbcTLoLNBcKeqeedmMZtxNu2z56BiguEEzGUYnb4FIuCnQVcWKLN9hujFBuLJ11YezN9TxD
 cqvhkfPWHPaD/pE7hOjUzEJ1XqSI98F4bTcjYh8Yt5rn8AroKsih3N6Ay0TwwV7NiCQHwZuM
 4rnM26DD2u0xRHJBYGraLMp7oLzlAi0ecjH0Ob1FD4sh/2ERKcoy0F2Ui91rwWCt+be27XUP
 mYcUhnnJDPPSGOalMfzfexdRVchPSNWoYgVNaJJwNlijVGlSk2KDT59R1aHZ39n1y/rZgqZ6
 otsRxyLFIhmkuKLkEmWaJl3VjoAlFb4yy5pZSRajTD8vqM+cVKcmCpp25M9SCj9ZeNlYlJyL
 VaYICYKQLKj/VglWulyLyrfYjgfow6athWGBg88vSdcN3MszfPrp9Hv3bPj++zLvKv+OJZM+
 jQGNCy89PRwSMbU3P3tb0bHCrdbQa707Dhp9DmYdiO4sOq+aCcxusFWU9qMLpoH81MTMtpld
 9felLVqzbzrbvPpjTP1K8/5d8a7wiviMoI3FxvWHjjzeM9q0wKWgNHHK0A2kWqP8Ax1tkWaZ
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsVy+t/xu7q9c77HGvz9omFxa905VovmDluL
 02dOMVkc3HOcyWL+EaDQla/v2Syufn/JbHHyzVUWi83nelgtzja9YbfonLiE3WLp9YtMFof6
 oi0erM+2aN17hN1ixc+tjBYzJr9ks/i5ax6Lg5DHmnlrGD3e32hl93gw9T+Tx467Sxg9ds66
 y+4xu2Mmq8emVZ1sHicmXGLyuN99nMljybSrbB59W1Yxehzonczi8XmTXABvlJ5NUX5pSapC
 Rn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7GwvdPGAsaZCo2PDrI
 1MC4RayLkZNDQsBE4se5FexdjFwcQgJLGSUOTVvNBJGQkTg5rYEVwhaW+HOtiw3EFhJ4zShx
 djdYs7BAmMTJPw3sILaIgLHE3M27wQYxCyxglWjdN40JYuomJon3K7cwg1SxCRhKdL2FmMQr
 YCcx9+Q7sG4WAVWJ9Uueg20TFYiV+L7yEyNEjaDEyZlPWEBsTqBTl1zvA5vDLGAmMW/zQyhb
 XmL72zlQtrjErSfzmSYwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpec
 n7uJEZguth37uXkH46WNwYcYBTgYlXh4JUq+xwqxJpYVV+YeYpTgYFYS4d2hABTiTUmsrEot
 yo8vKs1JLT7EaAr03ERmKdHkfGAqyyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpa
 kFoE08fEwSnVwFh5vu3PXqMoS/meD8zplQm8vlcW3X1uKPp20drgIkn/X59vnwr9q37fedFO
 5uXL9R9sjBIv/dV+uelkoqSZoen20kNsO/RP3md5leqmEuQhb5eW6+J6TFKDvWavhNRPLgbN
 9D+bW1gm9i591D7z2371NVKnj5sZpQs6eu86oxDKKVTVw99wWImlOCPRUIu5qDgRAKqlGWYt
 AwAA
X-CMS-MailID: 20191216150237eucas1p1c85d23b9dff40d2a34d72998edc92917
X-Msg-Generator: CA
X-RootMTR: 20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
 <20191203141515.3597631-5-boris.brezillon@collabora.com>
 <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
 <20191216155551.083dcbaf@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On 16.12.2019 15:55, Boris Brezillon wrote:
> On Mon, 16 Dec 2019 14:54:25 +0100
> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 03.12.2019 15:15, Boris Brezillon wrote:
>>> So that each element in the chain can easily access its predecessor.
>>> This will be needed to support bus format negotiation between elements
>>> of the bridge chain.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> I've noticed that this patch got merged to linux-next as commit
>> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of
>> Samsung Exynos5250-based Arndale board. Booting stops after following
>> messages:
>>
>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
>> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
>> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
>> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>> [drm] No driver support for vblank timestamp query.
>> [drm] Cannot find any crtc or sizes
>> [drm] Cannot find any crtc or sizes
>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
>>
>> I will try to debug this and provide more information soon.
>>
> Can you try with this diff applied?

This patch doesn't change anything.

> --->8---
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 3955f84dc893..118ecedc7621 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1523,7 +1523,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>          if (out_bridge) {
>                  drm_bridge_attach(encoder, out_bridge, NULL);
>                  dsi->out_bridge = out_bridge;
> -               list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
> +               list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>          } else {
>                  int ret = exynos_dsi_create_connector(encoder);
>   
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 6c5b80ad6154..e1378d48210f 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1613,7 +1613,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>           * from our driver, since we need to sequence them within the
>           * encoder's enable/disable paths.
>           */
> -       list_splice(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
> +       list_splice_init(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
>   
>          if (dsi->port == 0)
>                  vc4_debugfs_add_regset32(drm, "dsi0_regs", &dsi->regset);
> @@ -1639,7 +1639,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
>           * Restore the bridge_chain so the bridge detach procedure can happen
>           * normally.
>           */
> -       list_splice(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
> +       list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
>          vc4_dsi_encoder_destroy(dsi->encoder);
>   
>          if (dsi->port == 1)
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
