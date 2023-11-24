Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F877F7426
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5387510E1DF;
	Fri, 24 Nov 2023 12:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD4E10E1DF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 12:45:35 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20231124124533euoutp0295934ef621629de9c47e8506c6459ab9~aj9A5UgLl2351223512euoutp02X
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 12:45:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20231124124533euoutp0295934ef621629de9c47e8506c6459ab9~aj9A5UgLl2351223512euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1700829933;
 bh=ntaqMyz7YzHuFOSbbT6sp4kgEM5ji5rcmDOY93Qfeos=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=SviCt4/sslhtL7z/LzSwU4myb39ss+In2QltuR8qnlNkN6bRH0gEn/61xsMISuo4I
 j7pXOB+ud+8t4COv72FV/FS9OxKTJHs88X9QYvJAL6/7fOcoVLVqBi40VU6GCToWC9
 BvHN42xAf68vYpwAr+MeZB7+hcmTcTkEfUyDxoxc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231124124533eucas1p2ab9c27a3f635846aaff6b2d150997020~aj9AqDK3M1397813978eucas1p2l;
 Fri, 24 Nov 2023 12:45:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 6F.1E.09539.DEA90656; Fri, 24
 Nov 2023 12:45:33 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20231124124533eucas1p28d61463e5dc716cc0a1ba083069203f0~aj9AMSEBs1397813978eucas1p2k;
 Fri, 24 Nov 2023 12:45:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20231124124532eusmtrp1b9b88945f5b2ec6e3aed67f9e94129e9~aj9ALjtBX1224812248eusmtrp1b;
 Fri, 24 Nov 2023 12:45:32 +0000 (GMT)
X-AuditID: cbfec7f2-52bff70000002543-1b-65609aedb451
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 97.17.09274.CEA90656; Fri, 24
 Nov 2023 12:45:32 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231124124532eusmtip1faa5cb023a66160b439cdedf9eaeb6c6~aj8-mU1sq2692926929eusmtip1X;
 Fri, 24 Nov 2023 12:45:32 +0000 (GMT)
Message-ID: <37d373e1-8850-4ab2-8fdb-6b069e2d6976@samsung.com>
Date: Fri, 24 Nov 2023 13:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Content-Language: en-US
In-Reply-To: <39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUyMcRz3e57n7p5qd5670JeauC0vbaJhHmmRhYt5GXkZNm71c5Xu3O6K
 hK2wowsVtqsjL8NVRFxqLYS0Tu5UQuO6xGTIpSUvvRju7gn993n5/n6fz/e3H01K7vPG0Qmq
 ZKxRyZOkfG+qoq6/YVqXcSueYarwZ5uLgbXaHhHss2/dfLas4QiPvfOpXMA+rTrNZ/MaqwlW
 l2nisRm1LvemM5fH5ume8hb4yErOlCDZqfQnlKyy7SKSmS9n8mWOltt8WXuWhZCVWffIes3j
 V9EbvcPjcFLCTqyZHrHVO976rRWpX4lTc4/aqXRUKNIjLxqYWdDxq0mgR960hClC4LiaSXHk
 K4LqT4Yh0osg3WAm/x5xZpoIzihEYLh7FnGkB8FFW7VnSshEwOtGPeHGFBMEb/s6h3Qx1Od3
 UG48mgmEdnuewI35TCjou/R8N/ZlNoElr8WTMIopQ5BvN3t6kMxhAswDJs9NJOMH9o6zngQv
 V5ot4xLi9EA4UH5qqGuWF/w+H8vhKKgylgs47AudlptDOACsJ454AoA5hODcYDvBkRzX1u/t
 iJuaB46GAVc/2pUwFUqrpnNyJGRl6AVuGRgRvOgScx1EcLzCQHKyEA7rJNz0JDBarv2Lvd/U
 TOYgqXHYuxiHbWYcto3xf+45RF1GfjhFq1RgbagK7wrRypXaFJUiJHaH0oxcv8z6y/KlEhV0
 9oTUIIJGNQhoUjpKqPy5BUuEcfLdaVizY4smJQlra5A/TUn9hEFxgVjCKOTJeDvGaqz56xK0
 17h0QpgToyzKrruSHRM9sxbPqb99aP5IZfzExAA1to7x/4K+bz5fsjts1cnE/NQRzqbZryta
 +xeOWZhSa1CLJotzg4s17x9m6/3qniffIR73ivZO2VVeULh/c9QEn6Vr5ysO7nkz7cHilcFP
 FjnEEdGlFx6svFU7tmt10XJHpM0+IrvVYV70rvrZc99BMuTFMhXqXhf2eXuZxqZoS5hX9GED
 YW0pPVbF9oSfLjZl7LsXs173uwZNtIzv6/s+p8RnW/3qRJEz8l7Q3uaBtLbRKz52v3TOiL3V
 HymxCQ5e581UpkmO6e1hlU1RBUEBAaU+ZuGNNUpjuHruks+NkwtTE/YP6h6afvRLKW28PDSY
 1GjlfwCtN/3x1AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xu7pvZiWkGuyfYW5xaaWExekzp5gs
 rnx9z2ax+VwPq8Xe11vZLS7vmsNmMeP8PiaLts5lrBaNR4CyW95MZLWY0XaZ1YHbY828NYwe
 sxsusnjsuLuE0WPTqk42jzvX9rB53O8+zuSx+XS1x+dNcgEcUXo2RfmlJakKGfnFJbZK0YYW
 RnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZp7/eZiy4J1gxsfcWSwPjcr4uRk4O
 CQETiTedy5hAbCGBpYwS8x4YQMRlJE5Oa2CFsIUl/lzrYuti5AKqec8o0XVwPRtIglfATuLB
 +S6wZhYBVYnHP14xQ8QFJU7OfMICYosKyEvcvzWDHcRmEzCU6HrbBdYrLBAtcXzGNSaQoSIC
 mxklzj38BOYwC3QwSZz9PJkZYl0ri0TTtg1gLcwC4hK3nswHW8cJtPpM41JGiLiZRNfWLihb
 XqJ562zmCYxCs5BcMgtJ+ywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRGLvb
 jv3csoNx5auPeocYmTgYDzFKcDArifDm/olPFeJNSaysSi3Kjy8qzUktPsRoCgyOicxSosn5
 wOSRVxJvaGZgamhiZmlgamlmrCTO61nQkSgkkJ5YkpqdmlqQWgTTx8TBKdXAlDHRqlrnWsST
 PNPnU15e+dhyfvOpNItDhf+SPBKPr5kiuNF6nd/VFxluc7U1H5fqPmzSTWfw+XBBeaGr2nQb
 1RVJTr33ajnW3Rb8umr+hjnNUSVZRbu2PeHJ/eHeeI/hzbZDdcyN2u63Lq0KMvyXsjhuTcPr
 S+ZM63Nnb+8smC8nnHbE22N1yumGBS9+ZfBHMBR1XRNP+pC3KODJl0krFr99VMg+RSRKZEfZ
 utOrPd5pVgRb9lp7P9NJi7U33JCZqXNlBpf0hhiFbds3r6vZpbnmDs9kJp3twS8F7h53/1BY
 wbi0rnKlyl+Wt5bK7RxXBFwn8uXG7hN+aHdChHtekdOdy7/s+xRroyPawzX9lViKMxINtZiL
 ihMBRECyRWYDAAA=
X-CMS-MailID: 20231124124533eucas1p28d61463e5dc716cc0a1ba083069203f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
 <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
 <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
 <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
 <20231121175531.085809f5@collabora.com>
 <d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
 <4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com>
 <CGME20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c@eucas1p2.samsung.com>
 <39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.11.2023 10:29, Krzysztof Kozlowski wrote:
> On 22/11/2023 10:06, AngeloGioacchino Del Regno wrote:
>>>>> Hey Krzysztof,
>>>>>
>>>>> This is interesting. It might be about the cores that are missing from the partial
>>>>> core_mask raising interrupts, but an external abort on non-linefetch is strange to
>>>>> see here.
>>>> I've seen such external aborts in the past, and the fault type has
>>>> often been misleading. It's unlikely to have anything to do with a
>>> Yeah, often accessing device with power or clocks gated.
>>>
>> Except my commit does *not* gate SoC power, nor SoC clocks 🙂
> It could be that something (like clocks or power supplies) was missing
> on this board/SoC, which was not critical till your patch came.
>
>> What the "Really power off ..." commit does is to ask the GPU to internally power
>> off the shaders, tilers and L2, that's why I say that it is strange to see that
>> kind of abort.
>>
>> The GPU_INT_CLEAR GPU_INT_STAT, GPU_FAULT_STATUS and GPU_FAULT_ADDRESS_{HI/LO}
>> registers should still be accessible even with shaders, tilers and cache OFF.
>>
>> Anyway, yes, synchronizing IRQs before calling the poweroff sequence would also
>> work, but that'd add up quite a bit of latency on the runtime_suspend() call, so
>> in this case I'd be more for avoiding to execute any register r/w in the handler
>> by either checking if the GPU is supposed to be OFF, or clearing interrupts, which
>> may not work if those are generated after the execution of the poweroff function.
>> Or we could simply disable the irq after power_off, but that'd be hacky (as well).
>>
>>
>> Let's see if asking to poweroff *everything* works:
> Worked.

Yes, I also got into this issue some time ago, but I didn't report it 
because I also had some power supply related problems on my test farm 
and everything was a bit unstable. I wasn't 100% sure that the $subject 
patch is responsible for the observed issues. Now, after fixing power 
supply, I confirm that the issue was revealed by the $subject patch and 
above mentioned change fixes the problem. Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

