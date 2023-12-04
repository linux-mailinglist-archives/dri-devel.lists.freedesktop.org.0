Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F69B8039A3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 17:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF4110E357;
	Mon,  4 Dec 2023 16:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B2110E3A6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 16:05:35 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20231204160534euoutp0254fc1d3dbfdb53921aeb2f16deefcad7~drIf0STbl2126921269euoutp029
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 16:05:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20231204160534euoutp0254fc1d3dbfdb53921aeb2f16deefcad7~drIf0STbl2126921269euoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1701705934;
 bh=tG55V1cCaMA1MS+cN+Gb8Ou995buXT1WIvaUo468X/I=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=rXh6uDREOJulzpFtQjTpoooaquPzIv9hwtNY87mYirCKz/c41f0ZsdOOu43lWcgiw
 MyivdBnJ80CR1ZoMu4ugKjzKCdR848cqh9sMg+7yZIE05mbbmtd3Z1+xI0dIwvuL0i
 2cRLLBItKvHbOpqoxWx8aDHDisLD/qFmmaTGcrYI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20231204160533eucas1p133692df6d2c0096a56c5b8a1bf197e3e~drIfm-I830078200782eucas1p1e;
 Mon,  4 Dec 2023 16:05:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E8.E2.09814.DC8FD656; Mon,  4
 Dec 2023 16:05:33 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20231204160533eucas1p19fe627487940bd4ef3bc99757fed9950~drIfJwDE90065600656eucas1p1T;
 Mon,  4 Dec 2023 16:05:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231204160533eusmtrp27c94c7cbb779eb833f5ac4e561f50be1~drIfJE_Je2028320283eusmtrp2g;
 Mon,  4 Dec 2023 16:05:33 +0000 (GMT)
X-AuditID: cbfec7f4-711ff70000002656-4a-656df8cd5256
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AD.71.09274.DC8FD656; Mon,  4
 Dec 2023 16:05:33 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231204160532eusmtip1a585ff8d8f2769c766e0f5966684319c~drIeXuM1D1334813348eusmtip1d;
 Mon,  4 Dec 2023 16:05:32 +0000 (GMT)
Message-ID: <b3855e51-6e44-402e-9727-d67ac6ae64b5@samsung.com>
Date: Mon, 4 Dec 2023 17:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20231204114215.54575-4-angelogioacchino.delregno@collabora.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCKsWRmVeSWpSXmKPExsWy7djPc7pnf+SmGvQf1bc4cX0Rk8WllRIW
 p8+cYrL4v20is8WVr+/ZLDaf62G12Pt6K7vF5V1z2CwWftzKYtHWuYzV4v+eHewWjUeASra8
 mcjqwOuxZt4aRo8dd5cweuz9toDFY+esu+wem1Z1snncubaHzWPeyUCP+93HmTw2n672+LxJ
 LoArissmJTUnsyy1SN8ugSvj5pvbbAVv+SpezVnL1MA4jaeLkZNDQsBEYvqDZSxdjFwcQgIr
 GCUOvXnCBuF8YZR49ukVE4TzmVHiwc9nrDAtP//dhkosZ5Q49/UtK4TzkVFi1plNYFW8AnYS
 /dN3soDYLAIqEov+LWKCiAtKnJz5BCwuKiAvcf/WDHYQW1ggSeLazi9gNcwC4hK3nswHs0UE
 MiUezXjJDrKAWWAak8TeQ48ZQRJsAoYSXW+72EBsTgFfibW3LrBCNMtLbH87hxmkQUJgNafE
 jiVboe52kfjwajIbhC0s8er4FnYIW0bi/875TBAN7YwSC37fh3ImMEo0PL/FCFFlLXHn3C+g
 bg6gFZoS63fpQ4QdJR6d/sYKEpYQ4JO48VYQ4gg+iUnbpjNDhHklOtqEIKrVJGYdXwe39uCF
 S8wTGJVmIYXLLCT/z0LyziyEvQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEJrzT
 /45/2cG4/NVHvUOMTByMhxglOJiVRHjn3cpOFeJNSaysSi3Kjy8qzUktPsQozcGiJM6rmiKf
 KiSQnliSmp2aWpBaBJNl4uCUamBaFlX/eG+1XYBRZ+TnV3M53AR3+HLkOcnOf3O+c528QR7D
 pltv+pMCH09Q7vFynLlncdTnTRecBXIZ1DJ/3J3xVVM3+XXy3o8Gf9wMlnLo39a76Vznt+rH
 QfU/Bg/9tweYbbtbo6O0WfnD88VbDhdYdet63LEUEvghyTc18vKh4KqrSmtdr0d/3t2dLWfw
 WrFj28Eds1i9PvKeyTiYX1p+Zp/6kY59jZEO+x8/O6hwSH3y3QOct7vf8W1PiLpzhuN0kOjh
 PNGHwTHf7ryaHeR5z7dza/SMF1YXAkSUD7Cbz6iaqRLrvMbHflaiQ5GH17RsD90T9358Dl5l
 fWrP4nuHayear1ayj1ex33HrU905JZbijERDLeai4kQAcTZ/FucDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsVy+t/xu7pnf+SmGhydKmRx4voiJotLKyUs
 Tp85xWTxf9tEZosrX9+zWWw+18Nqsff1VnaLy7vmsFks/LiVxaKtcxmrxf89O9gtGo8AlWx5
 M5HVgddjzbw1jB477i5h9Nj7bQGLx85Zd9k9Nq3qZPO4c20Pm8e8k4Ee97uPM3lsPl3t8XmT
 XABXlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G
 zTe32Qre8lW8mrOWqYFxGk8XIyeHhICJxM9/t5m6GLk4hASWMko8/fyMESIhI3FyWgMrhC0s
 8edaFxtE0XtGiVXLXjCBJHgF7CT6p+9kAbFZBFQkFv1bBBUXlDg58wlYXFRAXuL+rRnsILaw
 QJLEtZ1fwGqYBcQlbj2ZD2aLCGRKvJx+jR1kAbPAFCaJRzveMkNse8wo8aqvE2wSm4ChRNdb
 kDM4OTgFfCXW3rrACjHJTKJraxcjhC0vsf3tHOYJjEKzkBwyC8nCWUhaZiFpWcDIsopRJLW0
 ODc9t9hIrzgxt7g0L10vOT93EyMwwrcd+7llB+PKVx/1DjEycTAeYpTgYFYS4Z13KztViDcl
 sbIqtSg/vqg0J7X4EKMpMDQmMkuJJucDU0xeSbyhmYGpoYmZpYGppZmxkjivZ0FHopBAemJJ
 anZqakFqEUwfEwenVAMTc4xsab/ePl95t+ocbpM9yWLzHz5m6PSbvd7q9IPWjw6z3a+W//Gf
 UNjR7+suUflic9cpNs3c+8df/jPKbXy/8V31dNdpCxep/fmrdd3koVfttFnxhQ6OciuPL9j7
 pfrYhidr9DRDlmRdXNqWIJa+KD12w6Lm958VrFubJpgbPvbnbFd9wiO6SMJhnzdjV9Uel6eX
 X7psuTTVeVXP8jkJ8+76rpmsvmJWJseim36T4mxybaVk2ZasLC//rxsuxW05YXlPd1jDfJPE
 z1UFJ6Lj2K1VRXr9Nm3Q3W9rzLJmEz/Tlp8en1KculW5F8REpoSqFvB2/PuZxS6Sev/Gf9bA
 tQzsdhOXsc15HJ/F5KLEUpyRaKjFXFScCACK1HJUeQMAAA==
X-CMS-MailID: 20231204160533eucas1p19fe627487940bd4ef3bc99757fed9950
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231204114229eucas1p22c7ef58046923b0de57a0cc139a94afc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231204114229eucas1p22c7ef58046923b0de57a0cc139a94afc
References: <20231204114215.54575-1-angelogioacchino.delregno@collabora.com>
 <CGME20231204114229eucas1p22c7ef58046923b0de57a0cc139a94afc@eucas1p2.samsung.com>
 <20231204114215.54575-4-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.12.2023 12:42, AngeloGioacchino Del Regno wrote:
> To make sure that we don't unintentionally perform any unclocked and/or
> unpowered R/W operation on GPU registers, before turning off clocks and
> regulators we must make sure that no GPU, JOB or MMU ISR execution is
> pending: doing that requires to add a mechanism to synchronize the
> interrupts on suspend.
>
> Add functions panfrost_{gpu,job,mmu}_suspend_irq() which will perform
> interrupts masking and ISR execution synchronization, and then call
> those in the panfrost_device_runtime_suspend() handler in the exact
> sequence of job (may require mmu!) -> mmu -> gpu.
>
> As a side note, JOB and MMU suspend_irq functions needed some special
> treatment: as their interrupt handlers will unmask interrupts, it was
> necessary to add an `is_suspended` bitmap which is used to address the
> possible corner case of unintentional IRQ unmasking because of ISR
> execution after a call to synchronize_irq().
>
> At resume, clear each is_suspended bit in the reset path of JOB/MMU
> to allow unmasking the interrupts.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>   drivers/gpu/drm/panfrost/panfrost_device.c |  3 +++
>   drivers/gpu/drm/panfrost/panfrost_device.h |  8 +++++++
>   drivers/gpu/drm/panfrost/panfrost_gpu.c    | 18 +++++++++++++--
>   drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
>   drivers/gpu/drm/panfrost/panfrost_job.c    | 26 ++++++++++++++++++----
>   drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 22 +++++++++++++++---
>   drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
>   8 files changed, 71 insertions(+), 9 deletions(-)
>
> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

