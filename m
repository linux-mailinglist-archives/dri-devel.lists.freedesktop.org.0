Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF17A12B3D7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 11:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF868919C;
	Fri, 27 Dec 2019 10:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26F68919C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 10:25:09 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191227102508euoutp02e30c9c290bd6e1fe56234cd7e1b0eac8~kM2vyynKB1387313873euoutp02g
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 10:25:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191227102508euoutp02e30c9c290bd6e1fe56234cd7e1b0eac8~kM2vyynKB1387313873euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1577442308;
 bh=sFHkqaJGCmsQY85E4kqK6KpaMb9VpVWo+QEnSx3ZZs8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=kEmbHUfC4sFlV92EvzczQuySAXLZTmqkZSac7jAdoBhvWOnyHCMgVDZMn3HEDWcNP
 cLBvaIuwEMraIxNKNVbpTLOVyFBk/kJnbdQcxgYunJ+dN+Nr+IfLQvyBjh66RU5nPV
 br0w+Xmi7jrKnR3eD+TW9HuBs16Q2D/qGZ4yBS8I=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191227102507eucas1p190a00ba4431463b6edabf9265de168ae~kM2vcA-Rq1913819138eucas1p1X;
 Fri, 27 Dec 2019 10:25:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 6D.F6.61286.30CD50E5; Fri, 27
 Dec 2019 10:25:07 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191227102507eucas1p1e80ca4ee83ec3283bc1d5307ef70b096~kM2vANLVo1933519335eucas1p1X;
 Fri, 27 Dec 2019 10:25:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191227102507eusmtrp1c1d29d0fbace4bee0887386a9a26a2ee~kM2u-Qq5Z0620106201eusmtrp1Q;
 Fri, 27 Dec 2019 10:25:07 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-a1-5e05dc03477c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4D.6E.07950.30CD50E5; Fri, 27
 Dec 2019 10:25:07 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191227102506eusmtip2904625cdab0b8531fa6739364c7ad1d1~kM2uT6NP22062320623eusmtip27;
 Fri, 27 Dec 2019 10:25:06 +0000 (GMT)
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
To: Boris Brezillon <boris.brezillon@collabora.com>, Andrzej Hajda
 <a.hajda@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <32c4c99a-c943-b1e8-d342-2fd8e8719ff0@samsung.com>
Date: Fri, 27 Dec 2019 11:25:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191224110307.00ca841d@collabora.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTURjn3LfaldOy/LAoGBmUNZP640Bvet2QIoKCLK2VlyXqrE0t6x9T
 LF26HmLlDItSEl+BWU4zyGWtuVqlWT5RyR4zTXoRVrS2XSr/+z3P931wBFp1kgsTEvSpskGv
 TVJzgczthxOuRXQfG7d4+NMi0lPrYkl27grifNxGkZZmO0Uut3qlF9/GOdL53U0Tx2gnQ266
 8lnyJGuUJ3lny3hS/uo5RWzmXWTwRiLJudvKk4qJW4hcLHRzZKKplFmtkqpLq5E03pXDS4NF
 Hkqy9pchqdHSz0slucWsVFeZx0mPzrRT0sApOyWVne/kJHN9JZLuFRQy0pe62VvFmMDl8XJS
 QrpsiFy5N/BA0VAvOuhceqSmN4fNRB0RJhQgAF4KZudT1oQCBRWuQPDaVsIr5CsCU00vrZAv
 CDzXznJ/Kx/udjCKcR3BeM85TiFj3tRIN+9LTcM7wPEr049DcAy8Ger3N2j8nYGKgvusz+Bw
 FJjGTN62IIh4Jbjad/tkBodD0/le5MPTcSx4im9RPiziqeAoHmZ88QDvFu89/ldoPAcaxi7R
 Cg6FnuHLlG8U4GYBOmoVA/A6eJn1kVLwNBix1/MKngXOwnxGKWQjGHLV8ArJR9CRdREpqWXQ
 5/rhX5TG8+FGU6Qir4Hy5uN+GXAwdI1NVZYIhnO3L9CKLELuCZWSngcWe+2/sS3P2ukzSG2Z
 dJll0jmWSedY/s+9gphKFCqnGZN1sjFKLx/WGLXJxjS9TrM/JbkOeb+n87f9sxV9a99nQ1hA
 6iniYisTp2K16caMZBsCgVaHiHodG6cS47UZR2VDyh5DWpJstKGZAqMOFZdcdceqsE6bKifK
 8kHZ8NelhICwTFS8Zu+xBF12Sdf6oI3m5bWD23PnRlTJjfSm7qGshZpDqxo6ew6naJy6mHfb
 dg3IdeEzSu+4CzRJGxqWZJqXfQh6beWq7sWyGvur9Ih6Xfh666lS+XOEZ0+l7YHjpLuxf+eI
 tciRkfdzc1jbljfiQGTCjLW/Uy69XREdvTmAOtF3ep2aMR7QRi2gDUbtHysG/muaAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsVy+t/xe7rMd1jjDOY/Fra4te4cq0Vzh63F
 6TOnmCwO7jnOZDH/CFDoytf3bBZXv79ktjj55iqLxeZzPawWZ5vesFt0TlzCbrH0+kUmi0N9
 0RYP1mdbtO49wm6x4udWRosZk1+yWfzcNY/FQchjzbw1jB7vb7SyezyY+p/JY8fdJYweO2fd
 ZfeY3TGT1WPTqk42jxMTLjF53O8+zuSxZNpVNo++LasYPQ70Tmbx+LxJLoA3Ss+mKL+0JFUh
 I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j6sPbjAWnTSrW3m5l
 bWC8rN3FyMkhIWAi8XrvZZYuRi4OIYGljBLnj39hgUjISJyc1sAKYQtL/LnWxQZR9JpR4n/H
 STaQhLBAmMTJPw3sILaIQJRE96fPzCBFzAK/WST+P13MCNHxk0WieUkbM0gVm4ChRNdbkFEc
 HLwCdhLnLsWAhFkEVCV2TbvNCGKLCsRKbN/8EKycV0BQ4uTMJywg5ZxAp774D3YQs4CZxDyo
 EmYBeYntb+dA2eISt57MZ5rAKDQLSfcsJC2zkLTMQtKygJFlFaNIamlxbnpusZFecWJucWle
 ul5yfu4mRmCy2Hbs55YdjF3vgg8xCnAwKvHwGuxgiRNiTSwrrsw9xCjBwawkwpuXzhonxJuS
 WFmVWpQfX1Sak1p8iNEU6LeJzFKiyfnARJZXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEk
 NTs1tSC1CKaPiYNTqoHxDCvrTfeFzJFMa17tfhm8Z6+J8/6j/rcd80xaVKPX3z/NpOepwSn0
 7byS8PlcB7VFv9bHSL76dm9Wwm5XNamIq9N11+Zd421KuL1nmfkk70X/2Q5uO/z+qbfrUg2H
 tUWrFfemhvW+DT99ziRf7zl7+9kmpgjXCxExbh/XZyZlz/bkE4h+cMFXiaU4I9FQi7moOBEA
 fUecoiwDAAA=
X-CMS-MailID: 20191227102507eucas1p1e80ca4ee83ec3283bc1d5307ef70b096
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
 <20191224104936.6a7c4977@collabora.com>
 <20191224110307.00ca841d@collabora.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On 24.12.2019 11:03, Boris Brezillon wrote:
> On Tue, 24 Dec 2019 10:49:36 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>> On Tue, 24 Dec 2019 10:44:22 +0100
>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>> On Tue, 24 Dec 2019 10:16:49 +0100
>>> Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>> On 23.12.2019 10:55, Marek Szyprowski wrote:
>>>>> On 16.12.2019 16:25, Boris Brezillon wrote:
>>>>>> On Mon, 16 Dec 2019 16:02:36 +0100
>>>>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>>>>> On 16.12.2019 15:55, Boris Brezillon wrote:
>>>>>>>> On Mon, 16 Dec 2019 14:54:25 +0100
>>>>>>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>>>>>>> On 03.12.2019 15:15, Boris Brezillon wrote:
>>>>>>>>>> So that each element in the chain can easily access its predecessor.
>>>>>>>>>> This will be needed to support bus format negotiation between elements
>>>>>>>>>> of the bridge chain.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>>>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>>>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>>>>> I've noticed that this patch got merged to linux-next as commit
>>>>>>>>> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks booting of
>>>>>>>>> Samsung Exynos5250-based Arndale board. Booting stops after following
>>>>>>>>> messages:
>>>>>>>>>
>>>>>>>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
>>>>>>>>> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops)
>>>>>>>>> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops)
>>>>>>>>> exynos-drm exynos-drm: bound 14500000.dsi (ops exynos_dsi_component_ops)
>>>>>>>>> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_component_ops)
>>>>>>>>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>>>>>>>>> [drm] No driver support for vblank timestamp query.
>>>>>>>>> [drm] Cannot find any crtc or sizes
>>>>>>>>> [drm] Cannot find any crtc or sizes
>>>>>>>>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 0
>>>>>>>>>
>>>>>>>>> I will try to debug this and provide more information soon.
>>>>>>>>>          
>>>>>>>> Can you try with this diff applied?
>>>>>>> This patch doesn't change anything.
>>>>>> Okay. Can you do a list_for_each_entry() on both encoder->bridge_chain
>>>>>> and dsi->bridge_chain (dump bridge pointers in a pr_info()) before and
>>>>>> after the list_splice_init() call?
>>>>> encoder->bridge_chain contains only one element. dsi->drive_chain is empty.
>>>>>
>>>>> Replacing that list_splice() with INIT_LIST_HEAD(&encoder->bridge_chain)
>>>>> fixed the boot issue.
>>> If INIT_LIST_HEAD() worked, I don't understand why replacing the
>>> list_splice() call by a list_splice_init() (which doing a list_splice()
>>> + INIT_LIST_HEAD()) didn't fix the problem. Are you sure the
>>> list_splice_init() version doesn't work?
>>>    
>>>>> It looks that this is related with the way the
>>>>> Exynos DSI handles bridges (in bridge and out brige?). Maybe Andrzej
>>>>> will give a bit more detailed comment and spread some light on this.
>>>>
>>>> Hi Marek, Boris,
>>>>
>>>>
>>>> I have not followed latest patches due to high work load, my bad. Marek
>>>> thanks from pointing
>>>>
>>>> About ExynosDSI bridge handling:
>>>>
>>>> The order of calling encoder, bridge (and consequently panel) ops
>>>> enforced by DRM core (bridge->pre_enable, encoder->enable,
>>>> bridge->enable) does not fit to ExynosDSI hardware initialization
>>>> sequence, if I remember correctly it does not fit to whole MIPI DSI
>>>> standard (I think similar situation is with eDP). As a result DSI
>>>> drivers must use some ugly workarounds, rely on HW properly coping with
>>>> incorrect sequences, or, as in case of ExynosDSI driver, just avoid
>>>> using encoder->bridge chaining and call bridge ops by itself when suitable.
>>> Yes, that's definitely hack-ish, and I proposed 2 solutions to address
>>> that in previous versions of this patchset, unfortunately I didn't get
>>> any feedback so I went for the less invasive option (keep the hack but
>>> adapt it to the double-linked list changes), which still lead to
>>> regressions :-/.
>>>
>>> Just a reminder of my 2 proposals:
>>>
>>> 1/ implement the bridge_ops->pre_enable/post_disable() hooks so you can
>>>     split your enable/disable logic in 2 parts and make sure things are
>>>     ready when the panel/next bridge tries to send DSI commands
>>> 2/ move everything that's needed to send DSI commands out of the
>>>     ->enable() path (maybe in runtime PM resume/suspend hooks) so you
>>>     can call that in the DSI transfer path too
>>>
>>> As pointed out by Laurent, #1 doesn't work because some panel drivers
>>> send DSI commands in their ->prepare() hook, and ->pre_enable() methods
>>> are called in reverse order, meaning that the DRM panel bridge driver
>>> would try to issue DSI commands before the DSI host controllers is ready
>>> to send them. I still thing #2 is a good option.
>>>    
>>>> So proper patch converting to double-linked list should not try to
>>>> splice ExynosDSI private bridge list with with encoder's, encoder's list
>>>> should be always empty, as Marek suggested.
>>> That's exactly what I wanted to do: make the encoder's list empty after
>>> attach() and restore it to its initial state before unregistering
>>> the bridge, except I forgot that list_splice() doesn't call
>>> INIT_LIST_HEAD(). It's still not clear to me why replacing the
>>> list_splice() call by a list_splice_init() didn't work.
>> Okay, I think I figured it out: drm_bridge_chain_xx() helpers use
>> encoder->bridge_chain as their list head, and you'll never hit the 'elem
>> is list head' condition since we moved all elems from
>> encoder->bridge_chain to exynos_dsi->bridge_chain. The only way this
>> can work is if we stop using the helpers and implement our own list
>> iterators.
> Just to make it clear, calling INIT_LIST_HEAD(encoder->bridge_chain)
> doesn't really fix the bug, it just prevents the hang (infinite loop)
> and turn all drm_bridge_chain_xx() calls into NOPs.

Right, I've just checked it and indeed the display chain outputs nothing 
after such 'fix'. To get it finally working I've replaced 
drm_bridge_chain_*() operations for exynos_dsi 'out_bridge' by a direct 
calls. I will submit a patch in a few minutes. I hope that such 
workaround can be used now to fix the regression until a better solution 
is agreed.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
