Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6125B17A062
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 08:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36496E06E;
	Thu,  5 Mar 2020 07:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9156E06E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 07:07:19 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200305070717euoutp0179843991922079d193774a56891f8a4b~5VqtQWAAK2412924129euoutp01O
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 07:07:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200305070717euoutp0179843991922079d193774a56891f8a4b~5VqtQWAAK2412924129euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583392037;
 bh=BNesTyLQvVBEB+/M7jHYKs4b78sYTv7b/PnyNmhYe54=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=dp4IaxDUjU/Hv0RJdFKkukivtJrHrvfsw6pd/H/stCNOQo123utUHFFM2j0kyW7Fq
 S8mO4rcjENV8IyfRY/Gqo2MI1WDdmvCyMI8TUgWML/BKW6padCOzmG61DvixqQi4+D
 ywyIvkG10rUGX48Hc+vrhMk6EOSV/Ksc1mLd6OSk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200305070717eucas1p1094961cc8a05d10cc6a95c97b395715b~5Vqs5Pji71003210032eucas1p1V;
 Thu,  5 Mar 2020 07:07:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 70.C2.60698.525A06E5; Thu,  5
 Mar 2020 07:07:17 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200305070716eucas1p261a245d2a992c247df216999b63067f7~5VqsdKy2E0339303393eucas1p2B;
 Thu,  5 Mar 2020 07:07:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200305070716eusmtrp2ab2471cdc84627ede9bab86b4756f3f6~5VqscaevE2209422094eusmtrp2T;
 Thu,  5 Mar 2020 07:07:16 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-98-5e60a525ed06
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id EA.18.08375.425A06E5; Thu,  5
 Mar 2020 07:07:16 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200305070716eusmtip26f183909871836c7e203319d6fc9b9f7~5VqropC982907029070eusmtip2d;
 Thu,  5 Mar 2020 07:07:16 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Fix memory leak and release IOMMU mapping
 structures
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <684ef9fb-eafb-22d3-40c1-50f596211d85@samsung.com>
Date: Thu, 5 Mar 2020 08:07:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304220022.8003-1-lukasz.luba@arm.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTURT1dabToVryKJDeoIHYiCIKiEvyEg1Bo6QfxvhjNBCoVUY0UCCd
 guKHICJqRQXcSiXiviCCIrLFtagVCGUzSoCACIhVERMsiBqRYUT5O+fcc3POfXkspRyQerG7
 4o2cIV4Xp2bkdPmLMXuA79WtUUvK+jFpL7ZLyTF7rYTcNZdIyXh5DkX6s+9T5JVziCG53dk0
 +dDVTJMTvZ8o0th4R0Ya0j/LSGnvaylprc5niLnxkYRcTM+QEfNJBxOKNUXni5Dm4cgFWlNa
 eITRVIy8lWq6j9okmntXUjXHywqRZrjUeyMbLl8VzcXtSuYMQSFb5TurO09KEkuW7qkdHaLT
 0EE/E2JZwMuhxhxjQnJWiW8gsDjO0CL5hsD5cooMI8goOy01IZfJjbq2PkYcXEdQkLn/LxlE
 8O5xp0xwuePN8KRrdHLgge8iaCuqQgKh8BiCW93DEsHF4GAwDZoYAStwCDgup01m0Hge5I31
 IAF74kg4d7OGFj1uUJvXRwvNXTCBay3BgkxhH6gYzKdErIL2vgKJkAX4CAsPO5sosfda+F6f
 Q4vYHT7aymQingPjVVMLBxD02G/LRJKFoDXdjETXSui0/2CEZAovhJLqIFFeDfuteVLxKV2h
 bdBNLOEKueVnKVFWwOFMpeieDxZb8b/Yp00tVDZSW6ZdZpl2jmXaOZb/uRcQXYhUXBKvj+H4
 ZfHc7kBep+eT4mMCtyfoS9HE96v/bXNWoke/tlkRZpF6luLDaW2UUqpL5lP0VgQspfZQuK+Y
 kBTRupS9nCFBa0iK43grms3SapVi2SVHpBLH6IxcLMclcoapqYR18UpDz59t+Nq7ckPspv6a
 DuPAurBtbxr0Sc2ph5oD1m+5HeE94BG92ZtP8+frbHdCf6ncHkeFNDT4z9zxXvsl0/maX5zv
 8Gr65OYbNkOyINp4dM1Y/tucrIUVTEfYiYjaoJ8+WWq/8MXrI4tTcozhT7RBpwb2hRVnjz94
 5en0m9tWuYhd5Kqm+Z26YH/KwOv+AKuUX2B6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xe7oqSxPiDBbMMbK4te4cq0XvuZNM
 FhtnrGe1+L9tIrPF0wlbmS2ufH3PZjHp/gQWixf3LrJY9D9+zWxx/vwGdouzTW/YLTY9vsZq
 cXnXHDaLGef3MVksbGpht5gx+SWbg4DHmnlrGD32flvA4rFpVSebx/ZvD1g97ncfZ/LYvKTe
 o2/LKkaPz5vkAjii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMy
 y1KL9O0S9DJ23ZnMVLDeqOLk9/csDYytGl2MnBwSAiYSp248Yeti5OIQEljKKNG+8A4jREJG
 4uS0BlYIW1jiz7UuqKLXjBJth1+zgySEBcIlDtz7DpYQEdjIKDH//AoWEIdZ4CejxKzvL8BG
 CQl0M0pMn+MNYrMJGEp0vQUZxcnBK2An8XIxxAoWARWJmT8fgtWLCsRK3JjZwQRRIyhxcuYT
 oKEcHJwCFhLLLhmChJkFzCTmbX7IDGHLS2x/OwfKFpe49WQ+0wRGoVlIumchaZmFpGUWkpYF
 jCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAqN927Gfm3cwXtoYfIhRgINRiYf3xdT4OCHW
 xLLiytxDjBIczEoivMKmQCHelMTKqtSi/Pii0pzU4kOMpkC/TWSWEk3OByaivJJ4Q1NDcwtL
 Q3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjMJibSYsmw7lreYqFdWbrsWgwOql
 n/Dk5ep3ybZimnd2lNxatkctOEhOYtPNLbP0L6QYRIQ+mnhnv33/rBuF7gX7Mo7tkLS5yvvV
 fPm93yX+uXJHq1ztOrZ9C/k871vthv4W0bDr1/YZuqwI/lHi6RzU3cnls3GGZtH5Ft0KgfJI
 DcmbcaUTlFiKMxINtZiLihMBWe8DUQwDAAA=
X-CMS-MailID: 20200305070716eucas1p261a245d2a992c247df216999b63067f7
X-Msg-Generator: CA
X-RootMTR: 20200304220106eucas1p232aae5af79945664c4586930a9412eda
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200304220106eucas1p232aae5af79945664c4586930a9412eda
References: <CGME20200304220106eucas1p232aae5af79945664c4586930a9412eda@eucas1p2.samsung.com>
 <20200304220022.8003-1-lukasz.luba@arm.com>
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
Cc: jy0922.shim@samsung.com, b.zolnierkie@samsung.com, airlied@linux.ie,
 sw0312.kim@samsung.com, krzk@kernel.org, a.hajda@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, Dietmar.Eggemann@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukasz,

On 04.03.2020 23:00, Lukasz Luba wrote:
> There is a memory leak which left some objects not freed. The reference
> counter of mapping: 'mapping->kref' was 2 when calling
> arm_iommu_detach_device(), so the release_iommu_mapping() won't be called.
> Since the old mapping structure is not going to be used any more (because
> it is detached and new one attached), call arm_iommu_release_mapping()
> to trigger cleanup.

This will break IOMMU support in Exynos DRM if deferred probe happens. 
Here is a proper fix:

https://patchwork.kernel.org/patch/11415715/

The mapping initially created by DMA-mapping framework should be 
attached back when Exynos DRM releases the subdev device.

> Found using kmemleak detector, the output:
>
> unreferenced object 0xc2137640 (size 64):
>    comm "swapper/0", pid 1, jiffies 4294937900 (age 3127.400s)
>    hex dump (first 32 bytes):
>      50 a3 14 c2 80 a2 14 c2 01 00 00 00 20 00 00 00  P........... ...
>      00 10 00 00 00 80 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace:
>      [<3acd268d>] arch_setup_dma_ops+0x4c/0x104
>      [<9f7d2cce>] of_dma_configure+0x19c/0x3a4
>      [<ba07704b>] really_probe+0xb0/0x47c
>      [<4f510e4f>] driver_probe_device+0x78/0x1c4
>      [<7481a0cf>] device_driver_attach+0x58/0x60
>      [<0ff8f5c1>] __driver_attach+0xb8/0x158
>      [<86006144>] bus_for_each_dev+0x74/0xb4
>      [<10159dca>] bus_add_driver+0x1c0/0x200
>      [<8a265265>] driver_register+0x74/0x108
>      [<e0f3451a>] exynos_drm_init+0xb0/0x134
>      [<db3fc7ba>] do_one_initcall+0x90/0x458
>      [<6da35917>] kernel_init_freeable+0x188/0x200
>      [<db3f74d4>] kernel_init+0x8/0x110
>      [<1f3cddf9>] ret_from_fork+0x14/0x20
>      [<8cd12507>] 0x0
> unreferenced object 0xc214a280 (size 128):
>    comm "swapper/0", pid 1, jiffies 4294937900 (age 3127.400s)
>    hex dump (first 32 bytes):
>      00 a0 ec ed 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace:
>      [<3acd268d>] arch_setup_dma_ops+0x4c/0x104
>      [<9f7d2cce>] of_dma_configure+0x19c/0x3a4
>      [<ba07704b>] really_probe+0xb0/0x47c
>      [<4f510e4f>] driver_probe_device+0x78/0x1c4
>      [<7481a0cf>] device_driver_attach+0x58/0x60
>      [<0ff8f5c1>] __driver_attach+0xb8/0x158
>      [<86006144>] bus_for_each_dev+0x74/0xb4
>      [<10159dca>] bus_add_driver+0x1c0/0x200
>      [<8a265265>] driver_register+0x74/0x108
>      [<e0f3451a>] exynos_drm_init+0xb0/0x134
>      [<db3fc7ba>] do_one_initcall+0x90/0x458
>      [<6da35917>] kernel_init_freeable+0x188/0x200
>      [<db3f74d4>] kernel_init+0x8/0x110
>      [<1f3cddf9>] ret_from_fork+0x14/0x20
>      [<8cd12507>] 0x0
> unreferenced object 0xedeca000 (size 4096):
>    comm "swapper/0", pid 1, jiffies 4294937900 (age 3127.400s)
>    hex dump (first 32 bytes):
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace:
>      [<3acd268d>] arch_setup_dma_ops+0x4c/0x104
>      [<9f7d2cce>] of_dma_configure+0x19c/0x3a4
>      [<ba07704b>] really_probe+0xb0/0x47c
>      [<4f510e4f>] driver_probe_device+0x78/0x1c4
>      [<7481a0cf>] device_driver_attach+0x58/0x60
>      [<0ff8f5c1>] __driver_attach+0xb8/0x158
>      [<86006144>] bus_for_each_dev+0x74/0xb4
>      [<10159dca>] bus_add_driver+0x1c0/0x200
>      [<8a265265>] driver_register+0x74/0x108
>      [<e0f3451a>] exynos_drm_init+0xb0/0x134
>      [<db3fc7ba>] do_one_initcall+0x90/0x458
>      [<6da35917>] kernel_init_freeable+0x188/0x200
>      [<db3f74d4>] kernel_init+0x8/0x110
>      [<1f3cddf9>] ret_from_fork+0x14/0x20
>      [<8cd12507>] 0x0
> unreferenced object 0xc214a300 (size 128):
>    comm "swapper/0", pid 1, jiffies 4294937900 (age 3127.400s)
>    hex dump (first 32 bytes):
>      00 a3 14 c2 00 a3 14 c2 00 40 18 c2 00 80 18 c2  .........@......
>      02 00 02 00 ad 4e ad de ff ff ff ff ff ff ff ff  .....N..........
>    backtrace:
>      [<08cbd8bc>] iommu_domain_alloc+0x24/0x50
>      [<b835abee>] arm_iommu_create_mapping+0xe4/0x134
>      [<3acd268d>] arch_setup_dma_ops+0x4c/0x104
>      [<9f7d2cce>] of_dma_configure+0x19c/0x3a4
>      [<ba07704b>] really_probe+0xb0/0x47c
>      [<4f510e4f>] driver_probe_device+0x78/0x1c4
>      [<7481a0cf>] device_driver_attach+0x58/0x60
>      [<0ff8f5c1>] __driver_attach+0xb8/0x158
>      [<86006144>] bus_for_each_dev+0x74/0xb4
>      [<10159dca>] bus_add_driver+0x1c0/0x200
>      [<8a265265>] driver_register+0x74/0x108
>      [<e0f3451a>] exynos_drm_init+0xb0/0x134
>      [<db3fc7ba>] do_one_initcall+0x90/0x458
>      [<6da35917>] kernel_init_freeable+0x188/0x200
>      [<db3f74d4>] kernel_init+0x8/0x110
>      [<1f3cddf9>] ret_from_fork+0x14/0x20
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>
> Hi all,
>
> I have discovered this issue on OdroidXU4 while running some stress tests
> for upcoming Energy Model. To reproduce it, kernel must be compiled with
> DEBUG_KMEMLEAK. When the boot has finished, type:
> # echo scan > /sys/kernel/debug/kmemleak
> # cat /sys/kernel/debug/kmemleak
> You should expect similar output to the one from the commit message.
>
> I don't know if it should go via stable tree as well. I can resend with CC
> stable, if there is a need.
>
> Regards,
> Lukasz Luba
>
>   drivers/gpu/drm/exynos/exynos_drm_dma.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index 9ebc02768847..45f209ec107f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -74,8 +74,13 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>   		return ret;
>   
>   	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> -		if (to_dma_iommu_mapping(subdrv_dev))
> +		struct dma_iommu_mapping *mapping =
> +					to_dma_iommu_mapping(subdrv_dev);
> +
> +		if (mapping) {
>   			arm_iommu_detach_device(subdrv_dev);
> +			arm_iommu_release_mapping(mapping);
> +		}
>   
>   		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
>   	} else if (IS_ENABLED(CONFIG_IOMMU_DMA)) {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
