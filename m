Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8907C12B393
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 10:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011966E11D;
	Fri, 27 Dec 2019 09:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1903D6E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 09:42:29 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191227094228euoutp01d39240d6ad0f93d77af3dedef5f83799~kMRfiaSwW0543005430euoutp01J
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 09:42:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191227094228euoutp01d39240d6ad0f93d77af3dedef5f83799~kMRfiaSwW0543005430euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1577439748;
 bh=SklRnUS+OJe4r2ijdTXj38B0pPoUDGj1igo4wrti+yY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=s32fhSsh7iiUivWcgWuCNNm3U4VrN8wGQIudALvjDIsQ4C6h1Gkp6IgfsIbqYwuRL
 zEnWjibTEP4Fgr7r1lLPZUX2LKyL+RZaAoiJV8bWEaxoBreF6vuGCatI538FUhSWVx
 MkkPMSqxVyOwx/IBeLWBMDBnudWPR8nGvdUMcFlo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191227094227eucas1p14c78c21d24a96baf4c0bdcc55805b864~kMRfJ4hz82119721197eucas1p17;
 Fri, 27 Dec 2019 09:42:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 59.04.61286.302D50E5; Fri, 27
 Dec 2019 09:42:27 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191227094227eucas1p2010ec6c5a928e958497bf40ae4095969~kMReqpuhc1646816468eucas1p2R;
 Fri, 27 Dec 2019 09:42:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191227094227eusmtrp17559419c3dec1e57b87f90c314a15901~kMRep1QGc1066010660eusmtrp1e;
 Fri, 27 Dec 2019 09:42:27 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-6f-5e05d2032123
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AF.6B.08375.302D50E5; Fri, 27
 Dec 2019 09:42:27 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191227094226eusmtip225599ca902799af3dcc8465c0a10a79f~kMRdzHaEf0405304053eusmtip2v;
 Fri, 27 Dec 2019 09:42:26 +0000 (GMT)
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
To: Boris Brezillon <boris.brezillon@collabora.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <3a30de8e-9cc9-e3ff-a19a-45ea085ed9fc@samsung.com>
Date: Fri, 27 Dec 2019 10:42:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191224104422.25dbf980@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0iTYRTGefddHU2+1mWnC10GBhVlYsEbWSzo8hX9UVlRWdqyj2nqtE27
 QWR28ZKZaaau0rBZYhfLpc0b5DKdeamGVpqiolAzl5KKGJa5fUb+9zvPec57ngMvS8hj6bls
 sDZS0GnVoUpaShZXjzauIGyU/6qvA0vwxbj1uK7+rQRXltdIcHZVI4Wbhvtp3DxiJ3BtXzOJ
 TY2JFG6I6WNw/A0jg59UtTM499MHCbYk+eHOghB8uaKKwXmjRQhnpNppPFqaRark/OOsx4jv
 /3yZ4TvTxiW8ud2I+BJDO8Pfjsuk+ML8eJq3JtskfMfVGglvvNVM80kv8hH/6loqyQ8WLtgp
 Oyj1OSaEBp8UdJ4bjkiDBnqvkBFDq0//TmsjopFpeQJyY4FbDc86RqgEJGXlXB6Cbz8qGbEY
 QjCSYSDEYhCBuf8R8W+k1ZZOi42HCGwX3iKxcCDotmdRTtcMbh/UjkUzTp7JecNdU5nrXYLL
 o+BmbIzLRHNL4bephXayjNsA9sriCWZZkvOA4bFIpzyL2w89Td2UaJkOtZk9pJPdJlIYsy2u
 RAS3EF467kyyAlp7siXOXcCZWfiWMzQZexNY34m7gJsBvTUvGJHnQ11qIinyeejIu0SIw3EI
 ip6VTA6vg7bGX65wxEToglJPUd4IueUXXDJw7vDZMV3M4A4pxemEKMsg7opcdC+GjoaiyQcV
 kPt+mE5GSsOUywxTrjFMucbwf+89ROYjhRClD9MIei+tcGqlXh2mj9JqVgaGhxWiie9Z96fm
 pxkN245aEMci5TTZKjPpL6fUJ/VnwiwIWEI5U6bVUP5y2TH1mbOCLjxAFxUq6C1oHksqFTLv
 HPthOadRRwohghAh6P51Jazb3Gjki2TmKlVgYurxlkX30/d0Wcc1ARXnxnxeB1TU930fSOk1
 dkX5zd4xiLKjHQcOrdm9VzVekFwiVW11zNneqrG3PQ0+dMIjEG1jWr7HjPnWW20ZioPVCY8+
 Lo1017qXemyZs3ajI/GJtXz5LmrzpeulI9Vlz01+b/q/cH4n2mNVDwaUpD5I7bWM0OnVfwFH
 yCUUmgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsVy+t/xe7rMl1jjDBa1sls0d9hanD5zisni
 4J7jTBbzj5xjtbjy9T2bxdXvL5ktTr65ymKx+VwPq8XZpjfsFp0Tl7BbrD1yl91i6fWLTBaH
 +qItHqzPtmjde4TdYsXPrYwWMya/ZLP4uWsei4OQx5p5axg93t9oZfd4MPU/k8eOu0sYPXbO
 usvuMbtjJqvHplWdbB4nJlxi8rjffZzJY8m0q2wefVtWMXoc6J3M4vF5k1wAb5SeTVF+aUmq
 QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexodXbSwFX0wq/k69
 w9zAuFm7i5GTQ0LAROLWpelsXYxcHEICSxkl5p9awgaREJfYPf8tM4QtLPHnWhdU0WtGiYYZ
 jxhBEsICYRIn/zSwg9giAsYSczfvBrOZBVaxSvw7oAI1lUXi8b55rCAJNgFNib+bb4Jt4BWw
 k3h5cBuQzcHBIqAq8fVPCUhYVCBC4u3vm6wQJYISJ2c+YQGxOYEuXTL/EDPEfHWJP/MuQdny
 EtvfzoGyxSVuPZnPNIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT8
 3E2MwGSx7djPzTsYL20MPsQowMGoxMPbsYslTog1say4MvcQowQHs5IIb146a5wQb0piZVVq
 UX58UWlOavEhRlOg3yYyS4km5wMTWV5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTU
 gtQimD4mDk6pBsYu8eX9O98v57AW+cQ4U1LieL39p5b9a22zMxcGhVZmXt/6fU3mkT8MRWnf
 eBqMZnz6x3ByUduKykNTJ4vXMrfPtvB4ZJ3P8+O0A7/wNIFH6xsEWObdPKKrd2THj7fLbW9H
 fymrS4rg2qvz3POM1XXrdXKJPXNKOdt8Hkb/s7gb8WLZlZxlEpJKLMUZiYZazEXFiQBsctkG
 LAMAAA==
X-CMS-MailID: 20191227094227eucas1p2010ec6c5a928e958497bf40ae4095969
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
 <1010f5fc-0672-643c-4410-e053a928cb66@samsung.com>
 <20191224104422.25dbf980@collabora.com>
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
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.12.2019 10:44, Boris Brezillon wrote:
> On Tue, 24 Dec 2019 10:16:49 +0100
> Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>> On 23.12.2019 10:55, Marek Szyprowski wrote:
>>> Hi Boris,
>>>
>>> On 16.12.2019 16:25, Boris Brezillon wrote:  
>>>> On Mon, 16 Dec 2019 16:02:36 +0100
>>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:  
>>>>> Hi Boris,
>>>>>
>>>>> On 16.12.2019 15:55, Boris Brezillon wrote:  
>>>>>> On Mon, 16 Dec 2019 14:54:25 +0100
>>>>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:  
>>>>>>> On 03.12.2019 15:15, Boris Brezillon wrote:  
>>>>>>>> So that each element in the chain can easily access its predecessor.
>>>>>>>> This will be needed to support bus format negotiation between elements
>>>>>>>> of the bridge chain.
>>>>>>>>
>>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>  
>>>>>>> I've noticed that this patch got merged to linux-next as commit
>>>>>>> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of
>>>>>>> Samsung Exynos5250-based Arndale board. Booting stops after following
>>>>>>> messages:
>>>>>>>
>>>>>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
>>>>>>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
>>>>>>> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
>>>>>>> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
>>>>>>> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
>>>>>>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>>>>>>> [drm] No driver support for vblank timestamp query.
>>>>>>> [drm] Cannot find any crtc or sizes
>>>>>>> [drm] Cannot find any crtc or sizes
>>>>>>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
>>>>>>>
>>>>>>> I will try to debug this and provide more information soon.
>>>>>>>     
>>>>>> Can you try with this diff applied?  
>>>>> This patch doesn't change anything.  
>>>> Okay. Can you do a list_for_each_entry() on both encoder->bridge_chain
>>>> and dsi->bridge_chain (dump bridge pointers in a pr_info()) before and
>>>> after the list_splice_init() call?  
>>> encoder->bridge_chain contains only one element. dsi->drive_chain is empty.
>>>
>>> Replacing that list_splice() with INIT_LIST_HEAD(&encoder->bridge_chain) 
>>> fixed the boot issue.
> If INIT_LIST_HEAD() worked, I don't understand why replacing the
> list_splice() call by a list_splice_init() (which doing a list_splice()
> + INIT_LIST_HEAD()) didn't fix the problem. Are you sure the
> list_splice_init() version doesn't work?
>
>>> It looks that this is related with the way the 
>>> Exynos DSI handles bridges (in bridge and out brige?). Maybe Andrzej 
>>> will give a bit more detailed comment and spread some light on this.  
>>
>> Hi Marek, Boris,
>>
>>
>> I have not followed latest patches due to high work load, my bad. Marek
>> thanks from pointing
>>
>> About ExynosDSI bridge handling:
>>
>> The order of calling encoder, bridge (and consequently panel) ops
>> enforced by DRM core (bridge->pre_enable, encoder->enable,
>> bridge->enable) does not fit to ExynosDSI hardware initialization
>> sequence, if I remember correctly it does not fit to whole MIPI DSI
>> standard (I think similar situation is with eDP). As a result DSI
>> drivers must use some ugly workarounds, rely on HW properly coping with
>> incorrect sequences, or, as in case of ExynosDSI driver, just avoid
>> using encoder->bridge chaining and call bridge ops by itself when suitable.
> Yes, that's definitely hack-ish, and I proposed 2 solutions to address
> that in previous versions of this patchset, unfortunately I didn't get
> any feedback so I went for the less invasive option (keep the hack but
> adapt it to the double-linked list changes), which still lead to
> regressions :-/.
>
> Just a reminder of my 2 proposals:
>
> 1/ implement the bridge_ops->pre_enable/post_disable() hooks so you can
>    split your enable/disable logic in 2 parts and make sure things are
>    ready when the panel/next bridge tries to send DSI commands


If it means 'convert exynos_dsi to bridge' I do not think it will help -

- pre_enable op will be still called after pre_enable op of downstream
bridge - and this is the main reason why exynos_dsi do not use encoder
bridge chain - it needs to perform some operations BEFORE (pre)enabling
downstream devices.


> 2/ move everything that's needed to send DSI commands out of the
>    ->enable() path (maybe in runtime PM resume/suspend hooks) so you
>    can call that in the DSI transfer path too


It looks like a solution for DSI protocol, where control bus is shared
with data bus, but the problem is more general - we have source and sink
connected with some local bus, which has some negotiation/enable/disable
protocol/requirements. And drm_core/bridge framework enforces us to fit
every such protocol to 'drm_bridge protocol' with few opses called in
fixed order, without clearly defined purpose of each ops. That does not
sound generic and results in multiple issues:

- different drivers uses different opses to perform the same thing,

- different drivers assumes different things about their sinks/sources
in their opses,

- more complicated sequences does not fit at all to this model.

All this results in incompatibilities between drivers which become
visible with devices used in different configurations/platforms.


Regards

Andrzej


>
> As pointed out by Laurent, #1 doesn't work because some panel drivers
> send DSI commands in their ->prepare() hook, and ->pre_enable() methods
> are called in reverse order, meaning that the DRM panel bridge driver
> would try to issue DSI commands before the DSI host controllers is ready
> to send them. I still thing #2 is a good option.
>
>> So proper patch converting to double-linked list should not try to
>> splice ExynosDSI private bridge list with with encoder's, encoder's list
>> should be always empty, as Marek suggested.
> That's exactly what I wanted to do: make the encoder's list empty after
> attach() and restore it to its initial state before unregistering
> the bridge, except I forgot that list_splice() doesn't call
> INIT_LIST_HEAD(). It's still not clear to me why replacing the
> list_splice() call by a list_splice_init() didn't work.
> Also note that calling INIT_LIST_HEAD() only works if you have one
> bridge in the chain, so if we go for that option we need a comment
> explaining the limitations of this approach.
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
