Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E09C276B7B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 10:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB3E88284;
	Thu, 24 Sep 2020 08:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C29288284
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 08:09:34 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200924080930epoutp025571f9f071d8a0a5fdb72a18bc452de4~3qd_w01u31325913259epoutp02Q
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 08:09:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200924080930epoutp025571f9f071d8a0a5fdb72a18bc452de4~3qd_w01u31325913259epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600934970;
 bh=gReR2wNqOvuKz7P2eY+fQgZGR0GAsZffitXmkFYyOTw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=GWGmhRmJDIqi5TmC3J+fuaJiwxnKHn28DS6xbCFlNQV0iVRc+4JCyaIdT5w3hQxC5
 pHnO1sbdMaszRhHMmuGMKC6q1BWA2Lm1wWA+u50bLR/ozErAek+zq+BnFy9/h4gqzP
 WB/CFj0UpV9r9s6e5t4IhvYKbK+L1Ves/QXAJo1A=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200924080930epcas1p238d9f410d1b9d69e2eaf721156a66f10~3qd_OfSsD2552525525epcas1p2q;
 Thu, 24 Sep 2020 08:09:30 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.155]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Bxnkv1CxGzMqYkj; Thu, 24 Sep
 2020 08:09:27 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 5E.A5.09918.5345C6F5; Thu, 24 Sep 2020 17:09:25 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200924080925epcas1p4d6025fff2a3e5e7b305035760d75cbc8~3qd5hhq6-1521015210epcas1p46;
 Thu, 24 Sep 2020 08:09:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200924080925epsmtrp13cfb9320e42d8039763ff61e3e39fc3c~3qd5g0q7v2572325723epsmtrp1D;
 Thu, 24 Sep 2020 08:09:25 +0000 (GMT)
X-AuditID: b6c32a36-713ff700000026be-bd-5f6c54358362
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7C.93.08604.5345C6F5; Thu, 24 Sep 2020 17:09:25 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200924080924epsmtip1389b5a9464536a1de1bababe65fa339b~3qd5RUDWY0957109571epsmtip1l;
 Thu, 24 Sep 2020 08:09:24 +0000 (GMT)
Subject: Re: [PATCH 1/2] drm/vc4: kms: Assign a FIFO to enabled CRTCs
 instead of active
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <226dbb4a-e97a-f6b3-645e-785a20bbdacd@samsung.com>
Date: Thu, 24 Sep 2020 17:08:56 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918145918.101068-1-maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGJsWRmVeSWpSXmKPExsWy7bCmga5pSE68weT9uhZre4+yWLydu5jF
 4srX92wWBxovM1q8X97FZrHp8TVWi4m3N7BbzPjxj9Fi3a3XbBY75h1ktHg09T6jA7dH0/tj
 bB6z7p9l87hz7jybx/3u40wem5fUe7Qe/cXi0bdlFWMAe1S2TUZqYkpqkUJqXnJ+SmZeuq2S
 d3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QkUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM
 /OISW6XUgpScAssCveLE3OLSvHS95PxcK0MDAyNToMKE7IzL23YwFezjqzj10reB8Rx3FyMn
 h4SAicTdz+tZuxi5OIQEdjBK3Dt0C8r5xCjxZ/ZCZgjnG6PEySmvmGFaDrY3sUMk9jJKzLh9
 lwXCecso8WFuN1iVsECkxK3tj9hAbBEBF4nLix6AdTAL/GCS6PjfBlbEJqAr8bXnOhOIzStg
 J3H7xVmgOAcHi4CqRP/JRJCwKNCcnU9fskOUCEqcnPmEBcTmFLCQ+P3sHCOIzSwgL7H97Rxm
 CFtc4taT+UwguyQE9nBITLwxnw3ibBeJOws/s0PYwhKvjm+BsqUkXva3QdnFEldmvmKBaG5g
 lOifOBsqYSyxf+lkJpDjmAU0Jdbv0ocIK0rs/D0X6gg+iXdfe1hBSiQEeCU62oQgStQknjUc
 YIWwZSRO9S5ngrA9JNa9380+gVFxFpLXZiF5ZxaSd2YhLF7AyLKKUSy1oDg3PbXYsMAIObY3
 MYITsJbZDsZJbz/oHWJk4mA8xCjBwawkwntDLTteiDclsbIqtSg/vqg0J7X4EKMpMKwnMkuJ
 JucDc0BeSbyhqZGxsbGFiaGZqaGhkjjvw1sK8UIC6YklqdmpqQWpRTB9TBycUg1MBQ/vsxy6
 7fGNN/e2B4PIny7HYMeypmKTA2ELSu0M9AsvnPe23HHEIfXyu0XKDru2/37DdPAl8w32A4cX
 CB/yELrNrnGkr7C67ZDEjDVNUcs52l8GSlUbLtuhu+jDhB3aEy4KvUqcv3p/QMa6mq/Oz9Xr
 X9zmvuATwbDrstCO1yt4Fb6/9DjymqHo8zrDsF9igvvX7zVvidLV+KIYcjwz6W9nfeExMTNN
 u20ZRfGXsyZM/L9ci3nSHIY37uazzhR93f6a66DFxz/TPR6zOfoJ1kzYuubel0IlK9OISyz+
 V6+auM/cuVBNzjnf97GgaNQ35U+uL6cf+HqoQ8b7i/S3BWrXtYvs86rYZNJ31KjLKLEUZyQa
 ajEXFScCAMfmUD1JBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSnK5pSE68wcF3zBZre4+yWLydu5jF
 4srX92wWBxovM1q8X97FZrHp8TVWi4m3N7BbzPjxj9Fi3a3XbBY75h1ktHg09T6jA7dH0/tj
 bB6z7p9l87hz7jybx/3u40wem5fUe7Qe/cXi0bdlFWMAexSXTUpqTmZZapG+XQJXxuVtO5gK
 9vFVnHrp28B4jruLkZNDQsBE4mB7E3sXIxeHkMBuRomJF6+zQSRkJFb1b2HtYuQAsoUlDh8u
 BgkLCbxmlJixlA/EFhaIlGhpuMgKYosIuEhcXvQAbA6zwA8micbvvWwQQ7sZJZpP/QarYhPQ
 lfjac50JxOYVsJO4/eIsM8gCFgFVif6TiSCmKNDQnTssISoEJU7OfMICYnMKWEj8fnaOEcRm
 FjCTmLf5ITOELS+x/e0cKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGKUTC0ozk3PLTYs
 MMxLLdcrTswtLs1L10vOz93ECI42Lc0djNtXfdA7xMjEwXiIUYKDWUmE94ZadrwQb0piZVVq
 UX58UWlOavEhRmkOFiVx3huFC+OEBNITS1KzU1MLUotgskwcnFINTOp74kV8hPQ3JH/r71sd
 3Hbh+aGtKfmsO+115fpXZ/1t2ynwKPjJXTUB59unJ95S39gTmdAQsj21LNwxV/DBn3wHpi2x
 Hib3VvXt+vCshl85ZIHqqzubD858ZhTebfLhxYPcGe0tffdv/YuLrn3spT8twW960pKWiwsq
 FYxT1A8efOun6lC6qMpe5BvXqhMyC3IsZ/Cejl+w9P7epoOHrMIfPM3vfGRtN6Nr7+7Fhxbd
 PcAY9evoZOX1t7qXXGLf4mk2Y028efnO/bNiJr4x0qr5NK/43q9/GqdmfHRN+q15Kb/kX0Wb
 /72gYqGppz5LFAlo5Of8l7wX5vnKdcLcJzcKVgud3R8zIaaQa/qf6DtKLMUZiYZazEXFiQCw
 dIaeJQMAAA==
X-CMS-MailID: 20200924080925epcas1p4d6025fff2a3e5e7b305035760d75cbc8
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200919084635epcas1p3b36b85b4445709cf3595fc62e659c1ae
References: <CGME20200919084635epcas1p3b36b85b4445709cf3595fc62e659c1ae@epcas1p3.samsung.com>
 <20200918145918.101068-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 =?UTF-8?B?64KY7ISx6rWt?= <sungguk.na@samsung.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 9/18/20 11:59 PM, Maxime Ripard wrote:
> The HVS has three FIFOs that can be assigned to a number of PixelValves
> through a mux.
>
> However, changing that FIFO requires that we disable and then enable the
> pixelvalve, so we want to assign FIFOs to all the enabled CRTCs, and not
> just the active ones.

Thanks for the patch.

There is a problem when doing page flip.
After connecting 2 HDMIs without hotplug and booting.(Same thing when
using hotplug.)

When executing page flip for each of HDMI 0 and 1 in modetest
operation does not work normally. (crtc irq does not occur, so timeout 
occurs.)
Sometimes both hdmi 0 or 1 work or not.

LOGs:
root:~> modetest -Mvc4 -s 32:1280x720 -v
setting mode 1280x720-60Hz@XR24 on connectors 32, crtc 64
failed to set gamma: Invalid argument
freq: 60.24Hz
freq: 60.00Hz

root:~> modetest -Mvc4 -s 38:1280x720 -v
setting mode 1280x720-60Hz@XR24 on connectors 38, crtc 69
failed to set gamma: Invalid argument
select timed out or error (ret 0)
select timed out or error (ret 0)

Could you please check it?

Best regards,
Hoegeun

>
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index af3ee3dcdab6..01fa60844695 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -643,7 +643,7 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>   		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>   		unsigned int matching_channels;
>   
> -		if (!crtc_state->active)
> +		if (!crtc_state->enable)
>   			continue;
>   
>   		/*
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
