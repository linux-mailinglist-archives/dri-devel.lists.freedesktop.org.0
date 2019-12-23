Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B81293D6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 10:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ABE89AB7;
	Mon, 23 Dec 2019 09:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA40089AB7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 09:55:20 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191223095518euoutp01386043d7dab8e28b75e6f30e6aafb81c~i93kCfDAl0581505815euoutp01c
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 09:55:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191223095518euoutp01386043d7dab8e28b75e6f30e6aafb81c~i93kCfDAl0581505815euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1577094918;
 bh=HNsSoxgvRMt5HeBjd8hb4QzGHorDsRyTJ1c5yJEUJ6c=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=J8/czqeJTNRdRAi6QUoDL23KHRRzO8rFocahB11GmsANVh56PADT/f3Xuv0F20czJ
 k4a38xrhnqzGzp53t6RCCXu6mdiXIDJg/d75Tu47+OLR2P5OxjwV8mWvnTX/J93A2R
 OKs8N0dRcptG5EJgFTxq2NeFJ2PJl28Yl1sS0ifI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191223095517eucas1p2ddf24fe9e01f8a63c2e2011b1616326c~i93jMy1YH2350823508eucas1p2V;
 Mon, 23 Dec 2019 09:55:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C5.28.60679.50F800E5; Mon, 23
 Dec 2019 09:55:17 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191223095517eucas1p11e9e8ff718f88578b45bb2bc3ba4e60c~i93ilOsGA0070900709eucas1p1Z;
 Mon, 23 Dec 2019 09:55:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191223095517eusmtrp2d8968ee8602780bf5011352b0060a79c~i93ikHmci2203922039eusmtrp2H;
 Mon, 23 Dec 2019 09:55:17 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-61-5e008f0563f3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 22.7C.07950.40F800E5; Mon, 23
 Dec 2019 09:55:17 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191223095516eusmtip155e949aef75fc1f7a566a341cf79acc4~i93h4Ks_40547705477eusmtip1K;
 Mon, 23 Dec 2019 09:55:16 +0000 (GMT)
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
To: Boris Brezillon <boris.brezillon@collabora.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <60f03d50-7c0f-c3d0-920f-0625c08b2171@samsung.com>
Date: Mon, 23 Dec 2019 10:55:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216162542.261c821c@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0iTYRjt/e4OF5+z8OlOi6SCLpbBG5V0+/FBBZF0oVi18kslnbXPVRaR
 2W0uM80uOs0inMpaFlrmXFFeaFm5bi5N1Cztx0KTUku7mduX5b/znOc87zkHXo5UGZmxXLQu
 XtTrtDFqRkGVPux/NpM+M2LLHHtaMG4sctH4qHExfvL0MYEr7joJfLl6kKrr7WKw+5uHxDUd
 bgqXuFJoXJvUweLk9DwWW+pfELgydTNuvbELH79XzeLC/tsIZ2Z4GNxfnkstUQm2XBsSuhqO
 s0Lr+QFCKGvOQ4Ld3MwK2cYsWii2JjPCo7SXhPD2lJMQ8i64GSH1lhUJD05nUEJ38cQ1yk2K
 RRFiTPReUT87bJsi6n27k9htnrL/fvM1OhGVjDchPw74UEh99IU0IQWn4gsRWE7eY+ShB0GK
 qY2Vh24Er9tKqKGTlgf5SF4UIDhTdOyvqhPBL5vHpwrk10PNz0TWi0fx8+BSicMnIvlcGr5m
 OkjvguFDwNRpYrxYyYdBanqfD1P8VCj8kTaIOW40rwFjQZQsCYCarHbf+36DKfrqfiMvJvlJ
 cKczh5RxEDS2Xya8XsCXcZDs6mXk2CvAYr/4t0IgfHTeYmU8HgbsQwdHEbxzXWflIQXBq6RM
 JKsWQpPruy8RyU+HG+WzZXopWO4e8dHAj4SGzgA5xEg4W3qRlGklGE+oZHUwmJ1F/2wrnr8k
 05DaPKyaeVgd87A65v++VxBlRUGiQYqNFKW5OnHfLEkbKxl0kbN2xMUWo8H/+eS3s6cMlf/c
 Xol4Dqn9ldtyBjQqWrtXSoitRMCR6lFKx6FfGpUyQptwQNTHbdUbYkSpEo3jKHWQct5Vj0bF
 R2rjxV2iuFvUD20Jzm9sIoqrv127dHTIlzq7e/WERsfjNQb1lo707MyAT0t0LjFcsWGxddLG
 AU/6+rUVN9etbKHPHz73akVb0w67X0IIbVZ22ZpqPxxstRxjAvftYeFD9DJHxIKC3pbJO8MD
 LVe631g3SodKcxae+Fz1btoY94uqCs+qCX018w3+obr86R3LM6apKSlKGzKD1EvaP7dff/ib
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsVy+t/xu7qs/QxxBjNCLW6tO8dq0dxha3H6
 zCkmi4N7jjNZzD8CFLry9T2bxdXvL5ktTr65ymKx+VwPq8XZpjfsFp0Tl7BbLL1+kcniUF+0
 xYP12Rate4+wW6z4uZXRYsbkl2wWP3fNY3EQ8lgzbw2jx/sbreweD6b+Z/LYcXcJo8fOWXfZ
 PWZ3zGT12LSqk83jxIRLTB73u48zeSyZdpXNo2/LKkaPA72TWTw+b5IL4I3SsynKLy1JVcjI
 Ly6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy3j05DhTwSzliv13V7M2
 MG6W6WLk5JAQMJG4d2AZYxcjF4eQwFJGiW8n57NCJGQkTk5rgLKFJf5c62KDKHrNKNF7bRIL
 SEJYIEzi5J8GdhBbRMBYYu7m3ewgRcwCC1glWvdNY4LomMgscXPqVbAONgFDia63IKM4OXgF
 7CT6Jv4As1kEVCVW/J4AZosKxEp8X/mJEaJGUOLkzCdgvZxAt/648g8szixgJjFv80NmCFte
 YvvbOVC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yf
 u4kRmC62Hfu5ZQdj17vgQ4wCHIxKPLwcs/7HCrEmlhVX5h5ilOBgVhLh3V37N1aINyWxsiq1
 KD++qDQntfgQoynQcxOZpUST84GpLK8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6Yklqdmpq
 QWoRTB8TB6dUA6NI/FnDkOfqVfM4S2Ujdbawfu2b4TLhtrTQpKNWt9dNK3+VmdQ1fe+hX1NX
 3jJmjjj6tmnR91lnnr99s3dlqOmxHd9/Lns2TXH6mvcKXJOuLj9469WaTpuZJw+pcnetlAyP
 WhSw2Tva+i3bhlqe2Sd0xOXqEkyaJx9acWG9IserW+9Vti3plJnarsRSnJFoqMVcVJwIADG6
 0jctAwAA
X-CMS-MailID: 20191223095517eucas1p11e9e8ff718f88578b45bb2bc3ba4e60c
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
 <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
 <20191216162542.261c821c@collabora.com>
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

On 16.12.2019 16:25, Boris Brezillon wrote:
> On Mon, 16 Dec 2019 16:02:36 +0100
> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Hi Boris,
>>
>> On 16.12.2019 15:55, Boris Brezillon wrote:
>>> On Mon, 16 Dec 2019 14:54:25 +0100
>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>> On 03.12.2019 15:15, Boris Brezillon wrote:
>>>>> So that each element in the chain can easily access its predecessor.
>>>>> This will be needed to support bus format negotiation between elements
>>>>> of the bridge chain.
>>>>>
>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> I've noticed that this patch got merged to linux-next as commit
>>>> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of
>>>> Samsung Exynos5250-based Arndale board. Booting stops after following
>>>> messages:
>>>>
>>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
>>>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
>>>> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
>>>> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
>>>> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
>>>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>>>> [drm] No driver support for vblank timestamp query.
>>>> [drm] Cannot find any crtc or sizes
>>>> [drm] Cannot find any crtc or sizes
>>>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
>>>>
>>>> I will try to debug this and provide more information soon.
>>>>   
>>> Can you try with this diff applied?
>> This patch doesn't change anything.
> Okay. Can you do a list_for_each_entry() on both encoder->bridge_chain
> and dsi->bridge_chain (dump bridge pointers in a pr_info()) before and
> after the list_splice_init() call?

encoder->bridge_chain contains only one element. dsi->drive_chain is empty.

Replacing that list_splice() with INIT_LIST_HEAD(&encoder->bridge_chain) 
fixed the boot issue. It looks that this is related with the way the 
Exynos DSI handles bridges (in bridge and out brige?). Maybe Andrzej 
will give a bit more detailed comment and spread some light on this.

I can send a formal patch fixing this if You want.

>>> --->8---
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> index 3955f84dc893..118ecedc7621 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> @@ -1523,7 +1523,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>>           if (out_bridge) {
>>>                   drm_bridge_attach(encoder, out_bridge, NULL);
>>>                   dsi->out_bridge = out_bridge;
>>> -               list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
>>> +               list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>>>           } else {
>>>                   int ret = exynos_dsi_create_connector(encoder);
>>>    
>>> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
>>> index 6c5b80ad6154..e1378d48210f 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
>>> @@ -1613,7 +1613,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>>>            * from our driver, since we need to sequence them within the
>>>            * encoder's enable/disable paths.
>>>            */
>>> -       list_splice(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
>>> +       list_splice_init(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
>>>    
>>>           if (dsi->port == 0)
>>>                   vc4_debugfs_add_regset32(drm, "dsi0_regs", &dsi->regset);
>>> @@ -1639,7 +1639,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
>>>            * Restore the bridge_chain so the bridge detach procedure can happen
>>>            * normally.
>>>            */
>>> -       list_splice(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
>>> +       list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
>>>           vc4_dsi_encoder_destroy(dsi->encoder);
>>>    
>>>           if (dsi->port == 1)
>>>
>>>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
