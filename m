Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA4129FA8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 10:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CD289E38;
	Tue, 24 Dec 2019 09:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 551 seconds by postgrey-1.36 at gabe;
 Tue, 24 Dec 2019 09:26:06 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B7E89E38
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 09:26:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191224091653euoutp0263901e2df14ef3feade393b5a51fbaa3~jQ-TEnbf91233212332euoutp02V
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 09:16:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191224091653euoutp0263901e2df14ef3feade393b5a51fbaa3~jQ-TEnbf91233212332euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1577179013;
 bh=n/lifaWZUFK80v/YAbn/FG0VHaQnlU2MI4t8NpK5U6g=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Z2Ny8g3wUJ2LppcHQ3XRWFab9AfffPlZCG4Uyrwq+/knoeC7JTQjgWF1RLxNWgMZc
 SAH3Kw0bbU1g13DEYa8oFSNOEwm/SnsDWQPHka91KZqEdNATRVb38e+ey4q+TLhlat
 f7uZZmkq0uO3AdeKTB8Rd5wqBL/rxNe+AahM7zBU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191224091652eucas1p1359633ad0e35d53925f3cdea3a6b2a61~jQ-SsAJb20321803218eucas1p1s;
 Tue, 24 Dec 2019 09:16:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 65.BA.60679.487D10E5; Tue, 24
 Dec 2019 09:16:52 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191224091652eucas1p19f6407e5e86032240b164b79ab6f14c5~jQ-SVvJZx2513625136eucas1p1S;
 Tue, 24 Dec 2019 09:16:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191224091652eusmtrp2e519a25031cd0b4e72dd2f6e571adfa5~jQ-SU5CLQ2586325863eusmtrp2e;
 Tue, 24 Dec 2019 09:16:52 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-05-5e01d7849c3e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 32.B9.07950.487D10E5; Tue, 24
 Dec 2019 09:16:52 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191224091651eusmtip1aa8a0c29f9c6828958bc329e6e862665~jQ-Rfi67b1674516745eusmtip1x;
 Tue, 24 Dec 2019 09:16:51 +0000 (GMT)
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
To: Marek Szyprowski <m.szyprowski@samsung.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <1010f5fc-0672-643c-4410-e053a928cb66@samsung.com>
Date: Tue, 24 Dec 2019 10:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <60f03d50-7c0f-c3d0-920f-0625c08b2171@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO+fsnLPR4mxqvlh0mfSjIiuL+OhiBV3OnyDoZpbm1INGXmJT
 ywqyspiWYkmWszR0ltjCMTUvOdDlJTWHlmKaUysrjEY3NVbZap5F/nve532e730e+FhSeYn2
 Y4/GJwqaeHWsipZRD1ucthVpfShsVYFpMb6g24Q7nrYTuLG+lcCFTTYJ7pn4ROPe72MkbvvY
 S+EK2xUJ7jz/kcHpVw0MftBkZ3BJXzeBrVmH8Ej5MXzR0sTgUmcVwjdzxmjsrCugtih5Y4ER
 8Z9eXGT4kesugq+xGxBfq7czfL4uT8Kby9Jp/kn2M4IfvtxK8IbcXprPqixDfENmDsV/My/Y
 LQ+RbYwSYo8mC5qVQeGymOpOPXM8c/lJ4+BnIhV9VmUgKQvcWsgv1lEZSMYquVIEU6/zCHEY
 R1BntiBx+IbA2Oki/1mcxj7P4h6CwWv5HosDwauBYsKt8uL2Q9uvVCYDsaw3FwGPsze7NSTn
 pOBnbR7l1tDcUpiq6KfdWM4FQfPUkMStp7glYOs/4KZ9uGAY7XkjESUKaMsbnbZKuc1w7seX
 6UAktxCqHbc82BcGRgun8wDXwMLkIwMhpt4GX9t6GBF7wYfWSg+eD67aQo/mLAyXppGiWYeg
 ylTrqbwBBm0/aHc48m/o8rqVIr0VSurPTdPAzYEXDoWYYQ5ce3iDFGk56C4pRfViGO6s8jzo
 CyVdE3Q2UulnNNPPaKOf0Ub//+4dRJUhXyFJGxctaAPjhRMBWnWcNik+OiAyIc6M/v7Ojt+t
 4zWo7leEFXEsUs2Wmx7PClNK1MnalDgrApZUecvva1CYUh6lTjklaBKOaJJiBa0VzWMpla98
 TdFYqJKLVicKxwThuKD5tyVYqV8qMika7IZ9oQHPXeulB696SZdayCuDLX6nh/Y6Ft5tslje
 RdKH5h/es7U7ZectU0PN25Z322RjL312yBPS1+3yyq0ydATeN4ek24v8R866WpaXpG1/1n7G
 Gn3jvf+B8UWTwfWK5q6hoIGN/ESwIlfd3fj+dvHcybmJjXzOm/CQkxON21WUNka9ehmp0ar/
 AONdQpGZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsVy+t/xu7ot1xnjDD7N5rFo7rC1OH3mFJPF
 wT3HmSzmHznHanHl63s2i6vfXzJbnHxzlcVi87keVouzTW/YLTonLmG3WHvkLrvF0usXmSwO
 9UVbPFifbdG69wi7xYqfWxktZkx+yWbxc9c8FgchjzXz1jB6vL/Ryu7xYOp/Jo8dd5cweuyc
 dZfdY3bHTFaPTas62TxOTLjE5HG/+ziTx5JpV9k8+rasYvQ40DuZxePzJrkA3ig9m6L80pJU
 hYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jO1nZ7EX9GpXrLnz
 gamB8YNSFyMnh4SAicTPNdcZuxi5OIQEljJKfO78xwaREJfYPf8tM4QtLPHnWhcbRNFrRokd
 V88zgiSEBcIkTv5pYAexRQSSJHbvXQc2iVngN4vE2UvzWCA6jjFLzP/7Bmwsm4CmxN/NN8Fs
 XgE7iaN/77F2MXJwsAioSpy7GQ4SFhWIkHj7+yYrRImgxMmZT1hAbE4Be4nGXx/BLmIWUJf4
 M+8SlC0vsf3tHChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0u
 zUvXS87P3cQITBfbjv3csoOx613wIUYBDkYlHt6IgwxxQqyJZcWVuYcYJTiYlUR4Vxcxxgnx
 piRWVqUW5ccXleakFh9iNAX6bSKzlGhyPjCV5ZXEG5oamltYGpobmxubWSiJ83YIHIwREkhP
 LEnNTk0tSC2C6WPi4JRqYFxxfXvF4T+RL85Pyt9ygLP869uFApM0naefLHXVYNfu/mhWxSzB
 q/Wna++Cy/6aW4VTzTTndMyZJPz9I++FfNvT//8l+NSHM+VUpQRN2zLBbNcKv+sNi29uuvQ4
 oVdzQ8jb8wLfUx/M4epxNfz5I3Gis1BbnOrNXQ5qP1Rq3WxO1vN/9/i89rsSS3FGoqEWc1Fx
 IgDwxFjSLQMAAA==
X-CMS-MailID: 20191224091652eucas1p19f6407e5e86032240b164b79ab6f14c5
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
 <60f03d50-7c0f-c3d0-920f-0625c08b2171@samsung.com>
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

On 23.12.2019 10:55, Marek Szyprowski wrote:
> Hi Boris,
>
> On 16.12.2019 16:25, Boris Brezillon wrote:
>> On Mon, 16 Dec 2019 16:02:36 +0100
>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>> Hi Boris,
>>>
>>> On 16.12.2019 15:55, Boris Brezillon wrote:
>>>> On Mon, 16 Dec 2019 14:54:25 +0100
>>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>>> On 03.12.2019 15:15, Boris Brezillon wrote:
>>>>>> So that each element in the chain can easily access its predecessor.
>>>>>> This will be needed to support bus format negotiation between elements
>>>>>> of the bridge chain.
>>>>>>
>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> I've noticed that this patch got merged to linux-next as commit
>>>>> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of
>>>>> Samsung Exynos5250-based Arndale board. Booting stops after following
>>>>> messages:
>>>>>
>>>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
>>>>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
>>>>> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
>>>>> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
>>>>> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
>>>>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>>>>> [drm] No driver support for vblank timestamp query.
>>>>> [drm] Cannot find any crtc or sizes
>>>>> [drm] Cannot find any crtc or sizes
>>>>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
>>>>>
>>>>> I will try to debug this and provide more information soon.
>>>>>   
>>>> Can you try with this diff applied?
>>> This patch doesn't change anything.
>> Okay. Can you do a list_for_each_entry() on both encoder->bridge_chain
>> and dsi->bridge_chain (dump bridge pointers in a pr_info()) before and
>> after the list_splice_init() call?
> encoder->bridge_chain contains only one element. dsi->drive_chain is empty.
>
> Replacing that list_splice() with INIT_LIST_HEAD(&encoder->bridge_chain) 
> fixed the boot issue. It looks that this is related with the way the 
> Exynos DSI handles bridges (in bridge and out brige?). Maybe Andrzej 
> will give a bit more detailed comment and spread some light on this.


Hi Marek, Boris,


I have not followed latest patches due to high work load, my bad. Marek
thanks from pointing

About ExynosDSI bridge handling:

The order of calling encoder, bridge (and consequently panel) ops
enforced by DRM core (bridge->pre_enable, encoder->enable,
bridge->enable) does not fit to ExynosDSI hardware initialization
sequence, if I remember correctly it does not fit to whole MIPI DSI
standard (I think similar situation is with eDP). As a result DSI
drivers must use some ugly workarounds, rely on HW properly coping with
incorrect sequences, or, as in case of ExynosDSI driver, just avoid
using encoder->bridge chaining and call bridge ops by itself when suitable.

So proper patch converting to double-linked list should not try to
splice ExynosDSI private bridge list with with encoder's, encoder's list
should be always empty, as Marek suggested.


Regards

Andrzej


>
> I can send a formal patch fixing this if You want.
>
>>>> --->8---
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> index 3955f84dc893..118ecedc7621 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> @@ -1523,7 +1523,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>>>           if (out_bridge) {
>>>>                   drm_bridge_attach(encoder, out_bridge, NULL);
>>>>                   dsi->out_bridge = out_bridge;
>>>> -               list_splice(&encoder->bridge_chain, &dsi->bridge_chain);
>>>> +               list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>>>>           } else {
>>>>                   int ret = exynos_dsi_create_connector(encoder);
>>>>    
>>>> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
>>>> index 6c5b80ad6154..e1378d48210f 100644
>>>> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
>>>> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
>>>> @@ -1613,7 +1613,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>>>>            * from our driver, since we need to sequence them within the
>>>>            * encoder's enable/disable paths.
>>>>            */
>>>> -       list_splice(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
>>>> +       list_splice_init(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
>>>>    
>>>>           if (dsi->port == 0)
>>>>                   vc4_debugfs_add_regset32(drm, "dsi0_regs", &dsi->regset);
>>>> @@ -1639,7 +1639,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
>>>>            * Restore the bridge_chain so the bridge detach procedure can happen
>>>>            * normally.
>>>>            */
>>>> -       list_splice(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
>>>> +       list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
>>>>           vc4_dsi_encoder_destroy(dsi->encoder);
>>>>    
>>>>           if (dsi->port == 1)
>>>>
>>>>
> Best regards


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
