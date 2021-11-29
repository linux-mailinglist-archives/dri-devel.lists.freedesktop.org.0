Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F804617C3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 15:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C038A6E49A;
	Mon, 29 Nov 2021 14:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9ED76E44A;
 Mon, 29 Nov 2021 14:15:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9B0811F44680
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638195300; bh=qg0ogrpDEw7JPiv8EIlq4c9NL0fyYtw+4YIjCYhjohM=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=IbTiE2av+7ihv0Qq9SkHZc2960kgW1bDv5Y9iGihVQFz6IjoUilrYSku9yJtwLhOn
 GtiOrcTSZP1KwdxCklTZWVFd9zNdBMvsCw7Wzr/S9FIw2lOXhp5sJi0CVnWlrnwjj7
 J2KMKlPvhcGnlrI9v8TxzXQUkn9+jA+p/npimhp6aJdSV1FBm0SeShc+a/cMl2B9kj
 C2RqBMpIvyYb/wXEqv+sLCk7rC3teGaG/9busDeEQuj7HwKRwSPh6MELP6fmFTaBG1
 kKSOlDjWlaRx54vzfbVICO5ltEnKJExlwm612kbDKF/n1jEMd1Rxfuu12LU/JcIkWo
 fsx3oYHza5R2g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
 <bf1540f1-4a9f-a9d6-d487-929107c487fd@linaro.org>
Message-ID: <9a0158ae-a3b1-21b2-1ba3-82d4901eb873@collabora.com>
Date: Mon, 29 Nov 2021 15:14:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bf1540f1-4a9f-a9d6-d487-929107c487fd@linaro.org>
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

Il 29/11/21 03:20, Dmitry Baryshkov ha scritto:
> Hi,
> 
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
> I have been thinking about this. I do not feel that this is the correct approach. 
> Currently DRM device exists only when all components are bound. If any of the 
> subdevices is removed, corresponding component is delteted (and thus all components 
> are unbound), the DRM device is taken down. This results in the state cleanup, 
> userspace notifications, etc.
> 
> With your changes, DRM device will continue to exist even after one of subdevices 
> is removed. This is not an expected behaviour, since subdrivers do not perform full 
> cleanup, delegating that to DRM device takedown.
> 
> I suppose that proper solution would be to split msm_drv.c into into:
> - generic components & drm code to be called from mdp4/mdp5/dpu driver (making 
> mdp4, mdp5 or dpu1 the components master)
> 
> - bare mdss driver, taking care only about IRQs, OF devices population - calling 
> proper mdss_init/mdss_destroy functions. Most probably we can drop this part 
> altogether and just make md5_mdss.c/dpu_mdss.c proper platform drivers.
> 


Hmm... getting a better look on how things are structured... yes, I mostly agree
with you, though I'm not sure about making MDP{4,5}/DPU1 the component master; that
would result in a major change in drm-msm, which may be "a bit too much".

Don't misunderstand me here, please, major changes are fine - but I feel urgency
to get this bug solved ASAP (since drm-msm is currently broken at least for drm 
bridges) and, if we do anything major, that would require a very careful slow
review process that will leave this driver broken for a lot of time.

I actually tried something else that "simplifies" the former approach, so here's
my proposal:
* we introduce {mdp5,dpu}_mdss_early_init(struct device, struct msm_drm_private)
* allocate only msm_drm_private in msm_pdev_probe, leaving the drm_dev_alloc call
   into msm_drm_init(), so that the drm_dev_put() stays in msm_drm_uninit()
* pass msm_drm_private as drvdata instead of drm_device
* change all the drvdata users to get drm_device from priv->dev, instead of getting
   msm_drm_private from drm_device->dev_private (like many other drm drivers are
   currently doing)

This way, we keep the current flow of creating the DRM device at msm_drm_init time
and tearing it down at msm_drm_unbind time, solving the issue that you are
describing.

If you're okay with this kind of approach, I have two patches here that are 95%
ready, can finish them off and send briefly.

Though, something else must be noted here... in the last mail where I'm pasting
a crash that happens when running 'rmmod panel_edp ti_sn65dsi86', I have implied
that this is happening due to the patch that I've sent: after some more research,
I'm not convinced anymore that this is a consequence of that. That crash may not
be related to my fix at all, but to something else (perhaps also related to commit
8f59ee9a570c, the one that we're fixing here).

Of course, that crash still happens even with the approach that I've just proposed.


Looking forward for your opinion!

Cheers,
- Angelo
