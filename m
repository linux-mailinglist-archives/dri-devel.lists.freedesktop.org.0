Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679AD132A01
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 16:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AFE6E0E1;
	Tue,  7 Jan 2020 15:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A090D6E0E2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 15:27:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200107152712euoutp02655acc78fb0a7fd93ee562a82c7d3640~npEn8JGKn1691216912euoutp02c
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 15:27:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200107152712euoutp02655acc78fb0a7fd93ee562a82c7d3640~npEn8JGKn1691216912euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578410832;
 bh=Bfvd2+OeaKJomXYHaF9eIAwpQ2wjj9+UMNN7sp7r0jw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=U+fOp1MFM43HG9q93O+LiXfZ2z5mrDGXFGyVeDXEHwuWNn+x4YMmPT13zwffYSbhE
 Y1RvB0hyA69TDPmCQEHqJ8MQyAWaVjWrIWlALKUEJijrz7MesmY2FuPk7jiJzmyjfK
 EE9UaXViVZxcMcZ22XcfAsVgESP/P0FuMAmJoNxk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200107152711eucas1p14d15fbb007d5a85e5aba8856b14c023a~npEnruimP1801818018eucas1p1Q;
 Tue,  7 Jan 2020 15:27:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A1.E3.60679.F43A41E5; Tue,  7
 Jan 2020 15:27:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200107152711eucas1p1d5dd0201a7f6793ec1a1f6dfec9bb7c3~npEnTifqy1802218022eucas1p1M;
 Tue,  7 Jan 2020 15:27:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200107152711eusmtrp2459a3fb076cc05b1f1cfcb763c2a6511~npEnStf792872828728eusmtrp2T;
 Tue,  7 Jan 2020 15:27:11 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-17-5e14a34f5f46
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 13.B9.08375.F43A41E5; Tue,  7
 Jan 2020 15:27:11 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200107152710eusmtip178967ce760f1d6ff07353bafaa535743~npEmse0hF2236922369eusmtip1n;
 Tue,  7 Jan 2020 15:27:10 +0000 (GMT)
Subject: Re: [PATCH 1/3] drm/bridge: Fix drm_bridge_chain_pre_enable()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <9ec04432-c727-2309-ec4a-6527d9fc3e7a@samsung.com>
Date: Tue, 7 Jan 2020 16:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106102911.GA4853@pendragon.ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXfOdo7ixnFO9mBiuPqSee3GsVILLEcI5ZcIS2vpQc37piut
 SC1tXluuWE4rb6FoYZR3LMTKeU9TwUyblEKGItlETM08HiW//d7n+f+f5/nDS2Lifr4dGRGT
 wChjFFEygSVe377U53K6TBLs/vDjXrq7p4tHDy3MCejW1EFE55u0OD28OI3RnTPDOP3j6wBO
 96bNEHTm/XKCfvF+nKDb8s7Tj3TTgmNW8rS5doF8biSdkDeOlyN5oaaAL+/QfuLJTdlGnjyv
 tgrJW3N1+Bky0PJoKBMVoWaUbt6XLMN7NWRco/U1vWEMS0FaURayIIE6AJqJe4hlMVWJQNfj
 n4Us19mMIG/5CZ97/EYwOZCLbTnGHr8luEYFgkFNBs7ZZxGYh9Us21AnobngjyALkaSEioTM
 lIOsHqNyMEi//ZBgNQJqD6y+/ixgWUh5Q4k5a2MOTu2GD9XzG8tsqXMwOfSdz2msobNgckNj
 QflAx8TShhejdkLDbBHGsRRGJ5/y2GVAzRKQvzrE5672hZp+LeLYBn4aawmO7WGtiTWwfAtM
 lXcwzqxBUPeyaTPyERjr49Jg61fXNLtx5eMwOD9HsGWgRDAya83dIIL8ej3GlYWgyRBzakcw
 9dZtDpTCs/4FgRbJDNuSGbalMWxLY/i/txjhVUjKJKqiwxjVvhjmqqtKEa1KjAlzDYmNfoXW
 /1n3X6O5ETWvXG5DFIlkVkKtvU2wmK9Qq5Ki2xCQmEwidHKWBIuFoYqkZEYZe1GZGMWo2tAO
 EpdJhftLp4PEVJgigYlkmDhGudXlkRZ2KchxwnlotKyyuM7X7FmxeJc8IVM/z56qsMV69PE5
 noWZAf4JWjLhhtebXeXGFTzdVxSeog/xcfk24IGSz55ybxEVfglIWhPWe5a2B80os1vQOwdG
 c+hCYcNhPy8/3aiDR3++tHTxwXUso6No/Ep8al1Y6VRBYFf1sm+JR86vm3kyXBWu8HDClCrF
 Px4Qsf5jAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xu7r+i0XiDBoeiFqcPnOKyeLK1/ds
 FgcaLzNaTLo/gcXi6veXzBYn31xlsXhx7yKLxdmmN+wWnROXsFusPXKX3eJQX7TFjMkv2Rx4
 PJreH2PzeH+jld1jx90ljB6zO2ayepyYcInJ4373cSaPvi2rGD0O9E5mCeCI0rMpyi8tSVXI
 yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Ms428FRsEOwYvqsO8wN
 jBP4uhg5OSQETCTuzN3H3sXIxSEksJRRov3KEiaIhLjE7vlvmSFsYYk/17rYIIpeM0r0rF8P
 lhAWcJPYNfMXG4gtIpAtMWHGGUaQImaBPmaJq0teg00SEjjDKLHtbQaIzSagKfF3802wBl4B
 O4mFX7pYQGwWARWJo6s/gQ0VFYiQePv7JitEjaDEyZlPwGo4BewlTjz4CdbLLKAu8WfeJWYI
 W15i+9s5ULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66X
 nJ+7iREYxduO/dy8g/HSxuBDjAIcjEo8vBNkhOOEWBPLiitzDzFKcDArifBq6YjECfGmJFZW
 pRblxxeV5qQWH2I0BXpuIrOUaHI+MMHklcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1O
 TS1ILYLpY+LglGpgzM/Wffzyr0HlovcS21kcFNvk+S5unb7FOa1erub/o/mPVp38W//V84zT
 Wg3jrK4dD3b/Nlilvi5+Y17Ql1uyy+Yf5yi+UniZOWbutw1r61ZsXPZzwobJHW/db1x4lGbD
 Zn5uZsO+Mx4VgbFVOimCjpNv5bwrzv6rnviU6Wadk5dDzKeLrL22nkosxRmJhlrMRcWJAKGT
 6t74AgAA
X-CMS-MailID: 20200107152711eucas1p1d5dd0201a7f6793ec1a1f6dfec9bb7c3
X-Msg-Generator: CA
X-RootMTR: 20200106102926epcas5p4b68e21dc062f05695ac9bb23410ce4f7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200106102926epcas5p4b68e21dc062f05695ac9bb23410ce4f7
References: <20191227144124.210294-1-boris.brezillon@collabora.com>
 <CGME20200106102926epcas5p4b68e21dc062f05695ac9bb23410ce4f7@epcas5p4.samsung.com>
 <20200106102911.GA4853@pendragon.ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.01.2020 11:29, Laurent Pinchart wrote:
> Hi Boris,
>
> Thank you for the patch.
>
> On Fri, Dec 27, 2019 at 03:41:22PM +0100, Boris Brezillon wrote:
>> Stop iterating on the bridge chain when we reach the bridge element.
>> That's what other helpers do and should allow bridge implementations
>> to execute a pre_enable operation on a sub-chain.
> The code looks fine to me, but I think you should update the
> documentation to explain this. It currently states:
>
>  * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
>  * chain, starting from the last bridge to the first. These are called
>  * before calling the encoder's commit op.
>  *
>  * Note: the bridge passed should be the one closest to the encoder
>
> I suggest stating instead that the operation is called from the last
> bridge to the bridge passed as the argument. The note should then either
> be removed, or updated to state that bridge is usually the bridge
> closest to the encoder, but can be any other bridge if the caller only
> wants to execute the operation on a subset of the chain. It's also
> probably worth it updating the other functions accordingly.


Apparently drm_(atomic_)bridge_chain_* helpers are always called on the
1st bridge so you can try to remove bridge argument, if it is true.

Moreover after patches 2 and 3 drm_bridge_chain_* helpers have no users.


Regards

Andrzej


>
>> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_bridge.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index c2cf0c90fa26..b3b269ec6a39 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -357,6 +357,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>>  		if (iter->funcs->pre_enable)
>>  			iter->funcs->pre_enable(iter);
>> +
>> +		if (iter == bridge)
>> +			break;
>>  	}
>>  }
>>  EXPORT_SYMBOL(drm_bridge_chain_pre_enable);


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
