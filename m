Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA60F26F659
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 08:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AFD6ECAB;
	Fri, 18 Sep 2020 06:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024866E114
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 06:53:33 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200918065331epoutp01ab8ac003ab1f9b5bc7751ed74bd0caaf~1zj7ACEEm2423224232epoutp01W
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 06:53:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200918065331epoutp01ab8ac003ab1f9b5bc7751ed74bd0caaf~1zj7ACEEm2423224232epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600412011;
 bh=xzDyugxaYFiOqUZwbCkII37WZqTnWgkEmL5BNpCoZMc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ihPf8/qxqhEJJo+XNoGLXY7Oa+4kRocibVdV8jLBKNuOVQUa4KBfrL5k0ghERlR4O
 yZhmHQxyzb4TSFXzCkOV3ytWFp2yJ830KFurqdcCtMRy0zOFMZwZhc5bdX4KY3UOk/
 LUpJSXWjyofupZsvGHoAHcbzuALJ1VGdboaIMuHo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200918065330epcas1p4c127c1a389542bf92bdd22e4a52558ce~1zj6N-KNQ3212532125epcas1p4e;
 Fri, 18 Sep 2020 06:53:30 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Bt4L00wyWzMqYkV; Fri, 18 Sep
 2020 06:53:28 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 9D.5E.18978.369546F5; Fri, 18 Sep 2020 15:53:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200918065322epcas1p4aa0b72f61f074b7a1217b799a2ea8104~1zjzAIa8e3217632176epcas1p4g;
 Fri, 18 Sep 2020 06:53:22 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200918065322epsmtrp1c8669bfa95c8675baf23da431815f599~1zjy-TjqL1263912639epsmtrp1H;
 Fri, 18 Sep 2020 06:53:22 +0000 (GMT)
X-AuditID: b6c32a35-603ff70000004a22-57-5f6459632f4d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 84.B7.08303.269546F5; Fri, 18 Sep 2020 15:53:22 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200918065322epsmtip19fa0f8cb1345e201452f29e03cc88990~1zjyxcxtd1996919969epsmtip1Q;
 Fri, 18 Sep 2020 06:53:22 +0000 (GMT)
Subject: Re: [PATCH] drm/vc4: hvs: Pull the state of all the CRTCs prior to
 PV muxing
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <38b3fdbd-a8e8-43b0-3f66-5f4515353c0a@samsung.com>
Date: Fri, 18 Sep 2020 15:53:02 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917121623.42023-1-maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmgW5yZEq8wa1t1hZre4+yWLydu5jF
 4srX92wWBxovM1q8X97FZrHp8TVWi4m3N7BbzPjxj9Fi3a3XbBY75h1ktHg09T6jA7dH0/tj
 bB6z7p9l87hz7jybx/3u40wem5fUe7Qe/cXi0bdlFWMAe1S2TUZqYkpqkUJqXnJ+SmZeuq2S
 d3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QkUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM
 /OISW6XUgpScAssCveLE3OLSvHS95PxcK0MDAyNToMKE7Iydy2+yFDSIVXzYXtTAeEmwi5GT
 Q0LAROL6lBXsXYxcHEICOxglZrw+xgzhfGKU+Lr1GxOE85lRYlfvBUaYlsdXf0G17GKUePay
 gw3CecsosW35YiaQKmGBcInbs9eCdYgIuEhcXvQArINZ4AeTRMf/NmaQBJuArsTXnutgDbwC
 dhLTpt5jB7FZBFQlZn6HaBYViJTY+fQlO0SNoMTJmU9YQGxOAXOJLac2gtnMAvIS29/OYYaw
 xSVuPZkPdreEwA4OieUT1rBB3O0i8W7WUxYIW1ji1fEt7BC2lMTL/jYou1jiysxXLBDNDYwS
 /RNnQyWMJfYvnQw0lQNog6bE+l36EGFFiZ2/5zJCLOaTePe1hxWkREKAV6KjTQiiRE3iWcMB
 VghbRuJU73ImCNtDYuvBZ6wTGBVnIXltFpJ3ZiF5ZxbC4gWMLKsYxVILinPTU4sNCwyRo3sT
 IzgFa5nuYJz49oPeIUYmDsZDjBIczEoivM22yfFCvCmJlVWpRfnxRaU5qcWHGE2BgT2RWUo0
 OR+YBfJK4g1NjYyNjS1MDM1MDQ2VxHkf3lKIFxJITyxJzU5NLUgtgulj4uCUamA6Ilq1Y8V5
 ra36Pxotj21q4cg8mNrPIGSqWXelcfFxpkJW27CJS4tY+dbbrFA5LL4xR5Jr0sGbE5RrNzo9
 nHlA+PSN2QfeTjJydLRfWXI/dfY7GclpfC2BmscFDCpNCoKi5kfkLFqwpsTcS2NBZ3rN3Xcl
 +v4JuXr7MjrONX1/kiSzZMZsOdbaUOWyZB35F8ZXJph2zk45scuu6XNN1/UImTOtym6SG9oa
 HVg459poXjmeKp+fmn8qYmrrlQihJgaP511MN3MUtO0mWq94ab9EL+jMn67u25dYQ0xK5s6a
 qKrW8eNa3pNd31devSfIsayh5sXE+2vOBfNOd9HftOvW4T1FiQ0Ga+vTn7+5I6TEUpyRaKjF
 XFScCABAgmJySgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSnG5SZEq8Qe9aY4u1vUdZLN7OXcxi
 ceXrezaLA42XGS3eL+9is9j0+BqrxcTbG9gtZvz4x2ix7tZrNosd8w4yWjyaep/Rgduj6f0x
 No9Z98+yedw5d57N4373cSaPzUvqPVqP/mLx6NuyijGAPYrLJiU1J7MstUjfLoErY+fymywF
 DWIVH7YXNTBeEuxi5OSQEDCReHz1F3sXIxeHkMAORom2MwfZIRIyEqv6t7B2MXIA2cIShw8X
 Q9S8ZpR4v/8kC0iNsEC4xNeJfYwgtoiAi8TlRQ/ABjEL/GCSaPzeywbR0cUo8aN9DRNIFZuA
 rsTXnutgNq+AncS0qffAtrEIqErM/L6WEWSbqECkxM4dlhAlghInZz4BW8YpYC6x5dRGMJtZ
 wExi3uaHzBC2vMT2t3OgbHGJW0/mM01gFJqFpH0WkpZZSFpmIWlZwMiyilEytaA4Nz232LDA
 KC+1XK84Mbe4NC9dLzk/dxMjOOK0tHYw7ln1Qe8QIxMH4yFGCQ5mJRHeZtvkeCHelMTKqtSi
 /Pii0pzU4kOM0hwsSuK8X2ctjBMSSE8sSc1OTS1ILYLJMnFwSjUwKUheNDk+Jy7X5rXAVQ/j
 gtsJzF4mzIf+70+7ona46/Hhh1LJ8wM3uWRv/OG9dl/31PfPMmUl3vO4Wem+a25+v2RRn872
 ju7XoRKKq4R1avYKzNQtXG8Q3iZ0KGlfOfPHiydZeu5/f5GicWfDvBePI1jtD8VuL73R/oPl
 wPGAUzv4I+bk53YsZth/+rTru78Hrj9x/T3xrcjcbP9Nmre37O3IkV5QIbzilB7f7cqgxisq
 zbOW3ehW2WTJu9exav+yo3c020N8s6yatp3vEDrwkO+P45UbCp+K7v337Z1Sy7Saed9r6Y1m
 /dM+NL0LUf2ZvV9Q45gDb5fhe13ed75+n3Sct292++VoaXmM22V6hxJLcUaioRZzUXEiAGrK
 XsgnAwAA
X-CMS-MailID: 20200918065322epcas1p4aa0b72f61f074b7a1217b799a2ea8104
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200917140744epcas1p4ae14fb989c92453b3b3d0defc171446d
References: <CGME20200917140744epcas1p4ae14fb989c92453b3b3d0defc171446d@epcas1p4.samsung.com>
 <20200917121623.42023-1-maxime@cerno.tech>
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

On 9/17/20 9:16 PM, Maxime Ripard wrote:
> The vc4 display engine has a first controller called the HVS that will
> perform the composition of the planes. That HVS has 3 FIFOs and can
> therefore compose planes for up to three outputs. The timings part is
> generated through a component called the Pixel Valve, and the BCM2711 has 6
> of them.
>
> Thus, the HVS has some bits to control which FIFO gets output to which
> Pixel Valve. The current code supports that muxing by looking at all the
> CRTCs in a new DRM atomic state in atomic_check, and given the set of
> contraints that we have, assigns FIFOs to CRTCs or reject the mode
> entirely. The actual muxing will occur during atomic_commit.
>
> However, that doesn't work if only a fraction of the CRTCs' state is
> updated in that state, since it will ignore the CRTCs that are kept running
> unmodified, and will thus unassign its associated FIFO, and later disable
> it.
>
> In order to make the code work as expected, let's pull the CRTC state of
> all the enabled CRTC in our atomic_check so that we can operate on all the
> running CRTCs, no matter whether they are affected by the new state or not.
>
> Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for the quick patch and detailed explanation.

Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>


Best regards,
Hoegeun

> ---
>   drivers/gpu/drm/vc4/vc4_kms.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 16e233e1406e..af3ee3dcdab6 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -620,6 +620,23 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>   	struct drm_crtc *crtc;
>   	int i, ret;
>   
> +	/*
> +	 * Since the HVS FIFOs are shared across all the pixelvalves and
> +	 * the TXP (and thus all the CRTCs), we need to pull the current
> +	 * state of all the enabled CRTCs so that an update to a single
> +	 * CRTC still keeps the previous FIFOs enabled and assigned to
> +	 * the same CRTCs, instead of evaluating only the CRTC being
> +	 * modified.
> +	 */
> +	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> +		if (!crtc->state->enable)
> +			continue;
> +
> +		crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +		if (IS_ERR(crtc_state))
> +			return PTR_ERR(crtc_state);
> +	}
> +
>   	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
>   		struct vc4_crtc_state *vc4_crtc_state =
>   			to_vc4_crtc_state(crtc_state);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
