Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D42445EA59
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 10:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0812F6EA66;
	Fri, 26 Nov 2021 09:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE82B6EA48;
 Fri, 26 Nov 2021 09:26:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5C18E1F46742
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637918779; bh=RZZMdLZe+frl5NeinRGjT60ZCs3bDCTm8bd2vGIWYxU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CMSPNnmkh8LJZdT2NGjAofryIcTSQ9/lo/FTRbyld5ugGLnF6+IOhNXdNEEL2aIoM
 n2cQTnwp6DsiX7xLZgqi9TYa72PSqU502GYiJUQWJz2yZWY8g1QrVpIIhVzuwQq2vI
 6eWCGzgGf00rZlyVZ1z3xJ7BTPGfUi9Xns3Td0A9i/01y4QXgIkXc+0AZ6eRawjArj
 rXGFCmzKd6T01mCYFwXiy2KSDGeIiizDWjRMzqgvUHm3i9sAaD7uBfB4wBcdRek2tv
 Fp/+Ti49MMnGx7R8MpUplhvp78kM59133FijmDYbfGPPrJpSiKSsMt31WPh8YsFCk1
 bh6e5KeOTe9UA==
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
 <32cdade5-1487-9182-e939-4d93f8a27ad6@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <2b37dfd3-c3be-2640-56d0-25c9971c4f50@collabora.com>
Date: Fri, 26 Nov 2021 10:26:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <32cdade5-1487-9182-e939-4d93f8a27ad6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jami.kettunen@somainline.org, maxime@cerno.tech, marijn.suijten@somainline.org,
 kernel@collabora.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/11/21 01:06, Dmitry Baryshkov ha scritto:
> On 25/11/2021 18:09, AngeloGioacchino Del Regno wrote:
>> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
>> DSI host gets initialized earlier, but this caused unability to probe
>> the entire stack of components because they all depend on interrupts
>> coming from the main `mdss` node (mdp5, or dpu1).
>>
>> To fix this issue, also anticipate probing mdp5 or dpu1 by initializing
>> them at msm_pdev_probe() time: this will make sure that we add the
>> required interrupt controller mapping before dsi and/or other components
>> try to initialize, finally satisfying the dependency.
>>
>> While at it, also change the allocation of msm_drm_private to use the
>> devm variant of kzalloc().
>>
>> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Another issue (or a pack of issues):
> Now the msm_drm_init() is unbalanced with msm_drm_uninit(). Bits of code (putting 
> the drm dev, removing the IRQ domain, etc) have to be called now from the 
> msm_pdev_remove() function rather than from the unbind path.
> 
> The following changes fix the observed issues here, however additional care should 
> be taken.
> 


Hello Dmitry,

thanks for the thorough review (and solutions!).
Are you going to push your changes on top, or should I send a V2?

Cheers,
- Angelo
