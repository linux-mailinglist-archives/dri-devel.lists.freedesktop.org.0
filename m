Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784BA751552
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 02:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CB710E5FE;
	Thu, 13 Jul 2023 00:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134B810E5FE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 00:32:21 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230713003217epoutp02cc91e48b4fed72b549cb081b7e54cb5c~xRghem10T1163611636epoutp023
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 00:32:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230713003217epoutp02cc91e48b4fed72b549cb081b7e54cb5c~xRghem10T1163611636epoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1689208337;
 bh=ToGPsG33oz6z/azFwwQxZqCDnwFnKQuf0oSCvndEKzI=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=bXd9BqFabItjXvM/Li6v0WXuFZhnbqhad7V/hfDwAi2OwIz+hheUXx/tHrkZV8mqX
 MLFqhmyma3AyUZafQlnRZmdeuOUMtJ2NNv5Fz6CcRhDG4z38/jDYZH/POdmWytMjH6
 LyBTpjrllmi13zF5f90ty51ucUWPqDhH5e3PWD5E=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20230713003216epcas1p3c9ebddd3049779ff3d3f7842c902b1b0~xRggpJiaI1885418854epcas1p3h;
 Thu, 13 Jul 2023 00:32:16 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.231]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4R1bCg1Qw5z4x9Pt; Thu, 13 Jul
 2023 00:32:15 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 63.FD.08821.F064FA46; Thu, 13 Jul 2023 09:32:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230713003214epcas1p119f584cdaecab9c4df6b5a83872ccfa8~xRgfVUAbS2006620066epcas1p10;
 Thu, 13 Jul 2023 00:32:14 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230713003214epsmtrp2a57648604b404899172a3e80cd103691~xRgfUjbQ92660226602epsmtrp2h;
 Thu, 13 Jul 2023 00:32:14 +0000 (GMT)
X-AuditID: b6c32a38-90fff70000012275-0a-64af460fb331
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 C9.41.64355.E064FA46; Thu, 13 Jul 2023 09:32:14 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230713003214epsmtip2c5df3b68ed794fe00ff273491d8bb5fb~xRgfDQ9sv1592015920epsmtip2T;
 Thu, 13 Jul 2023 00:32:14 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: "'Tuo Li'" <islituo@gmail.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>
In-Reply-To: <20230630021906.1035115-1-islituo@gmail.com>
Subject: RE: [PATCH] drm/exynos: fix a possible null-pointer dereference due
 to data race in exynos_drm_crtc_atomic_disable()
Date: Thu, 13 Jul 2023 09:32:14 +0900
Message-ID: <095001d9b521$7887e360$6997aa20$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQI+fzd24MQ1Q9d6mA3zQu+jxue9IQIRLEptrty6gbA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRmVeSWpSXmKPExsWy7bCmgS6/2/oUg7nHOSxOXF/EZPFg3jY2
 ixULPjBZrD53mMni/7aJzBZXvr5ns3i//RWrxd7XW9ktzja9YbfY9Pgaq8XlXXPYLGac38dk
 MWPySzYHXo/dXRfYPPZ+W8DisXPWXXaPO9f2sHnc7z7O5LF5Sb3H5tcvmD36tqxi9Pi8SS6A
 MyrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfobiWF
 ssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEpUGFC
 dsaiP8fZCi4JV1z9+Yq1gfGyQBcjJ4eEgInE5cMtTF2MXBxCAjsYJV7vaWeDcD4xSnybdJQZ
 zjnwdBsLTMvpecugWnYySpxq3sIC4bxklPi/ZiojSBWbQIbE3fbFrCAJEYFDjBJtj/aBtTML
 XGOUWDRbF8TmFLCU+LHsNhuILSxQLzH93WGwZhYBVYkDz1aygti8QDW/++axQNiCEidnPoGa
 YySxZPV8JghbXmL72znMEOcpSPx8uowVIi4iMbuzDSwuImAlcWfbA7DnJATucEjsnzCLHaLB
 ReLH1jVMELawxKvjW6DiUhKf3+2FapjMKHHn+goWCGcGo8Thn9cZIaqMJfYvnQzVrSix8/dc
 RojVfBLvvvYAncEBFOeV6GgTgihRkjh28QZUq4TEhSUT2SYwKs1C8twsJM/NQvLcLCQPLWBk
 WcUollpQnJueWmxYYAKP8uT83E2M4IStZbGDce7bD3qHGJk4GIHhz8GsJMKrsm1dihBvSmJl
 VWpRfnxRaU5q8SFGU2B4T2SWEk3OB+aMvJJ4QxNLAxMzI2MTC0MzQyVx3mOvelOEBNITS1Kz
 U1MLUotg+pg4OKUamNIZ/X8rbvXv6BV731k6d2bbz5yPXhs0dmzlYuT02sHZyRHXrmxnbNti
 F3jhj7zOxDr1QwuDmcRWrNvz5LOQhLNB+sHZvucvKmv/2rA98Zffr7XiZ5bUH+Ezz/Qw+89T
 r5UWtjl0fufeJ5Zdiw9mM7aVFMoINXgpnNMMKVv70ILNXmxST5UP//fahcIbrwclXO97E+X4
 0uL/pXcxmx7V6fnsuOsmYX5s/0T+7L9WjM/ZFqefmrvpvPzzHR+nxJrdkvN1bucqnhfAvcWp
 97qb4hWnX/cuV0/ozCzxFQu4ymVm/uagrOrX/olr/TL/8J++s/t04FbvMtd1WfNj/56fUC3U
 cHEy3+Ucibynq/d7KLEUZyQaajEXFScCAJRvWVBhBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsWy7bCSvC6f2/oUg203lS1OXF/EZPFg3jY2
 ixULPjBZrD53mMni/7aJzBZXvr5ns3i//RWrxd7XW9ktzja9YbfY9Pgaq8XlXXPYLGac38dk
 MWPySzYHXo/dXRfYPPZ+W8DisXPWXXaPO9f2sHnc7z7O5LF5Sb3H5tcvmD36tqxi9Pi8SS6A
 M4rLJiU1J7MstUjfLoErY9Gf42wFl4Qrrv58xdrAeFmgi5GTQ0LAROL0vGVMXYxcHEIC2xkl
 Hv7ewtrFyAGUkJDYspUDwhSWOHy4GKLkOaPE7ZlXGUF62QTSJCbN3c8KkhAROMUosWPafhYQ
 h1ngFqPElI0TWCBauhglPr9fxQrSwilgKfFj2W02EFtYoFZi4YWbYHEWAVWJA89Wgtm8QDW/
 ++axQNiCEidnPgGzmYFObTzcDWXLS2x/O4cZ4gUFiZ9Pl7FCxEUkZne2gcVFBKwk7mx7wDaB
 UXgWklGzkIyahWTULCTtCxhZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIEx6pW0A7GZev/
 6h1iZOJgPMQowcGsJMKrsm1dihBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe5ZzOFCGB9MSS1OzU
 1ILUIpgsEwenVAOT0vpd+nvY7568qNbO4mRno3DaWVo2vGD9GobwQl2mLcs2POK8v6MhaKZE
 jn/vAQv3Bal6wjI3OuMs3b48D5x5omht4MfgwJ4/fpLTGR5Y9G5lCHnByM1U4nNS5GnDgczm
 7fIMF//tMOXZ8uCm4szHO/y2hqQbdL+e39WaPm12atAt4XtNnOpLfvRvufvs3pWHZ2a8esmn
 Mmmxvn7dmhgdvenLemu3JMnFTeadFZN4pEkjfbrsH3n5XQ3sdY5uBV0FKV1Cm298NT53bLNa
 WEv+fOG9zq/qXjzbtyZ4okY7M4fweoM1h4ze+C7ftoTbSVP998ELB3jtAs6oMLyZmPR19tuV
 WgqrphwX5XVfUs2txFKckWioxVxUnAgA6nuVCkQDAAA=
X-CMS-MailID: 20230713003214epcas1p119f584cdaecab9c4df6b5a83872ccfa8
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230630022033epcas1p2a104f08061a51a240364b72eb43842d8
References: <CGME20230630022033epcas1p2a104f08061a51a240364b72eb43842d8@epcas1p2.samsung.com>
 <20230630021906.1035115-1-islituo@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, 'BassCheck' <bass@buaa.edu.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 baijiaju1990@outlook.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Tuo Li <islituo@gmail.com>
> Sent: Friday, June 30, 2023 11:19 AM
> To: inki.dae@samsung.com; sw0312.kim@samsung.com;
> kyungmin.park@samsung.com; airlied@gmail.com; daniel@ffwll.ch;
> krzysztof.kozlowski@linaro.org; alim.akhtar@samsung.com
> Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> baijiaju1990@outlook.com; Tuo Li <islituo@gmail.com>; BassCheck
> <bass@buaa.edu.cn>
> Subject: [PATCH] drm/exynos: fix a possible null-pointer dereference due
> to data race in exynos_drm_crtc_atomic_disable()
> 
> The variable crtc->state->event is often protected by the lock
> crtc->dev->event_lock when is accessed. However, it is accessed as a
> condition of an if statement in exynos_drm_crtc_atomic_disable() without
> holding the lock:
> 
>   if (crtc->state->event && !crtc->state->active)
> 
> However, if crtc->state->event is changed to NULL by another thread right
> after the conditions of the if statement is checked to be true, a
> null-pointer dereference can occur in drm_crtc_send_vblank_event():
> 
>   e->pipe = pipe;
> 
> To fix this possible null-pointer dereference caused by data race, the
> spin lock coverage is extended to protect the if statement as well as the
> function call to drm_crtc_send_vblank_event().
> 
> Reported-by: BassCheck <bass@buaa.edu.cn>
> Signed-off-by: Tuo Li <islituo@gmail.com>

Applied.

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> index 4153f302de7c..d19e796c2061 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -39,13 +39,12 @@ static void exynos_drm_crtc_atomic_disable(struct
> drm_crtc *crtc,
>  	if (exynos_crtc->ops->atomic_disable)
>  		exynos_crtc->ops->atomic_disable(exynos_crtc);
> 
> +	spin_lock_irq(&crtc->dev->event_lock);
>  	if (crtc->state->event && !crtc->state->active) {
> -		spin_lock_irq(&crtc->dev->event_lock);
>  		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -
>  		crtc->state->event = NULL;
>  	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
>  }
> 
>  static int exynos_crtc_atomic_check(struct drm_crtc *crtc,
> --
> 2.34.1


