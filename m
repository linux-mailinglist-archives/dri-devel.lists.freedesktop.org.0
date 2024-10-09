Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E1995FA5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 08:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F4710E64E;
	Wed,  9 Oct 2024 06:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="P3L3+nXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EC710E64E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 06:20:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20241009062052euoutp023746334f5518494421ae0abfd99d4748~8tIfnDd4x1949119491euoutp026
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 06:20:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20241009062052euoutp023746334f5518494421ae0abfd99d4748~8tIfnDd4x1949119491euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1728454852;
 bh=Yziyztyl3bk7q8TWorQwwpsD5PZXgJn1w33HBPiUrl0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=P3L3+nXW+iC5IO6N+Ww4lWQL6f0GetyGonaZUbTaanVs6btLuLCh1eQB6oNOI9sT8
 xjwSNtZxq4untuc9+3qXq11kTmpzDXozhNrp+np/RfZHPdd3pkFYvEtQoImsSZG3n8
 gJBzMIjQt8h+9qTDjRM3O3i39TDOpYTYxkQfsuzg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241009062051eucas1p25ba5a62aa1398299cc46b2cb631a078b~8tIexj_nM1264312643eucas1p26;
 Wed,  9 Oct 2024 06:20:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 0F.42.09620.3C026076; Wed,  9
 Oct 2024 07:20:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241009062051eucas1p14a71ea515c9bce04c1be10020a7a60b2~8tIeckukW0660406604eucas1p1o;
 Wed,  9 Oct 2024 06:20:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241009062051eusmtrp1cfa3b97fbab35e18826fd3aeb4836743~8tIecErIR0225102251eusmtrp1b;
 Wed,  9 Oct 2024 06:20:51 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-27-670620c3fe60
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 83.6D.19096.3C026076; Wed,  9
 Oct 2024 07:20:51 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241009062050eusmtip2868641c031890ffceb7423f242f7c83e~8tIdVZKL41645216452eusmtip2P;
 Wed,  9 Oct 2024 06:20:49 +0000 (GMT)
Message-ID: <52e469a0-2dcb-4f6f-b4af-89568ef41864@samsung.com>
Date: Wed, 9 Oct 2024 08:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/vc4: Correct generation check in vc4_hvs_lut_load
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard
 <mripard@kernel.org>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20241008-drm-vc4-fixes-v1-3-9d0396ca9f42@raspberrypi.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87qHFdjSDV4cNLY4cX0Rk8XbuYtZ
 LK58fc9m8X7mBGaLy7vmsFks/LiVxaKtcxmrxex3+9kttryZyOrA6bH32wIWj52z7rJ7bFrV
 yeYx72Sgx/3u40werUd/sXhsPl3t8XmTXABHFJdNSmpOZllqkb5dAlfGlImfWAqucVY0dqc1
 MP5j72Lk5JAQMJF4tHgBaxcjF4eQwApGiU2r5zFBOF8YJb40zmaBcD4zSuzed5EJpuXJg0uM
 EInljBIT/09ihnA+MkocXnOQEaSKV8BO4u2CjWBLWARUJLZPP8sEEReUODnzCQuILSogL3H/
 1gywGmGBAInnjxeygwwSETjMJPG/fRYrSIJZwFHib/9WZghbXOLWk/lgg9gEDCW63naxgdic
 Au4S869CnMcMNHT72zlgF0kI/OeQmDitiRXibheJeXtWMELYwhKvjm+BBoGMxOnJPSwQDe2M
 Egt+32eCcCYwSjQ8vwXVYS1x59wvoHUcQCs0Jdbv0ocIO0ps/HyGFSQsIcAnceOtIMQRfBKT
 tk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzUIKl1lI3pyF5J1ZCHsXMLKsYhRPLS3OTU8t
 Ns5LLdcrTswtLs1L10vOz93ECExap/8d/7qDccWrj3qHGJk4GA8xSnAwK4nw6i5kTRfiTUms
 rEotyo8vKs1JLT7EKM3BoiTOq5oinyokkJ5YkpqdmlqQWgSTZeLglGpgUmTg4J2/7c1G39At
 1zyzhFz0PDZlfn4+LXD9rnMMy4Wcf+1sbzX7594rWbRgGtcN49VuCWkP92WKLHzAIH5FKGuF
 q42BvwaP0t7Ke6onTY6wi/7maKuzuDFN8e/2E9Nebsu9G6+2suDPoslT2hm4qmJ3lBcs42v4
 lfJjabnicU4z/UapTWHfNOWncLDdn1Wsf0urbtKT3IC0uhP2p+XntpU9+zpLfU/fTrUdOuv/
 vgz+oLZ3lpV8pPLDyUoztix+n92ycg2vd5riuc7Xq94VtJ7nUE6aoLlz3QYLCzV+5wm9Wrmn
 vpQJC5rGLmZ6dVVP6c2zc64LKq+7se5yPT9vyqObx/cIRAvWHuuJM9iVq8RSnJFoqMVcVJwI
 AETQ87vJAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xe7qHFdjSDfZckLQ4cX0Rk8XbuYtZ
 LK58fc9m8X7mBGaLy7vmsFks/LiVxaKtcxmrxex3+9kttryZyOrA6bH32wIWj52z7rJ7bFrV
 yeYx72Sgx/3u40werUd/sXhsPl3t8XmTXABHlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYml
 nqGxeayVkamSvp1NSmpOZllqkb5dgl7GlImfWAqucVY0dqc1MP5j72Lk5JAQMJF48uASYxcj
 F4eQwFJGic/fulkhEjISJ6c1QNnCEn+udbFBFL1nlLj67BBYglfATuLtgo1gk1gEVCS2Tz/L
 BBEXlDg58wkLiC0qIC9x/9YMsBphAT+J7RNfsYAMEhE4zCTR/f4H2CBmAUeJv/1bmSE2XGeU
 OLJpJRNEQlzi1pP5YDabgKFE11uQMzg5OAXcJeZfvQhVYybRtbWLEcKWl9j+dg7zBEahWUgO
 mYVk1CwkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRGKXbjv3csoNx5auPeocY
 mTgYDzFKcDArifDqLmRNF+JNSaysSi3Kjy8qzUktPsRoCgyNicxSosn5wDSRVxJvaGZgamhi
 ZmlgamlmrCTOy3blfJqQQHpiSWp2ampBahFMHxMHp1QD007R98dKNBq4F5tvv1awpuXJST+N
 G66z5i+ZdDWB5fmuFsvqzH0csv7vwgzK11qtzNCRYOH/tnZut+HZvgJD+YL3/ddSOP3O9Qu5
 ygl9uTHv8kn3hV9UFO9l3V98vOs8t/L2d1rSptN0f3IJSz3o/OF14e+Nbd6Xt/w96+rrfTH7
 f+upt/pSwYqNjC5/7iyKnzl3eajjt5Tnsfv2uXtECy/kydNYenPi+v9lihxnt287981Yx+GT
 TsdylYOmTjs0bnOvuyT6Z8vXTfr3guUFfJ8nzVnI9nLVX97ttY9nPtzhc/jsBsmCMx5fHwbP
 DUsOy9pxq+F1dtKPQ39OfPJ4o7pkzXeOiLkN4rx36t/N/tGgxFKckWioxVxUnAgA6X/DhVsD
 AAA=
X-CMS-MailID: 20241009062051eucas1p14a71ea515c9bce04c1be10020a7a60b2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241008164454eucas1p228b8e16fd136e3922b2f25fee8ce4b99
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241008164454eucas1p228b8e16fd136e3922b2f25fee8ce4b99
References: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
 <CGME20241008164454eucas1p228b8e16fd136e3922b2f25fee8ce4b99@eucas1p2.samsung.com>
 <20241008-drm-vc4-fixes-v1-3-9d0396ca9f42@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.10.2024 18:44, Dave Stevenson wrote:
> Commit 24c5ed3ddf27 ("drm/vc4: Introduce generation number enum")
> incorrectly swapped a check of hvs->vc4->is_vc5 to
> hvs->vc4->gen == VC4_GEN_4 in vc4_hvs_lut_load, hence breaking
> loading the gamma look up table on Pi0-3.
>
> Correct that conditional.
>
> Fixes: 24c5ed3ddf27 ("drm/vc4: Introduce generation number enum")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index c5ebc317188a..1edf6e3fa7e6 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -224,7 +224,7 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
>   	if (!drm_dev_enter(drm, &idx))
>   		return;
>   
> -	if (hvs->vc4->gen == VC4_GEN_4)
> +	if (hvs->vc4->gen != VC4_GEN_4)
>   		goto exit;
>   
>   	/* The LUT memory is laid out with each HVS channel in order,
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

