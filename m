Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEB62E91FC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BC489E36;
	Mon,  4 Jan 2021 08:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps5.brixit.nl (vps5.brixit.nl [192.81.221.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B778E8935B;
 Sun,  3 Jan 2021 18:00:16 +0000 (UTC)
Received: from [192.168.20.102] (unknown [77.239.252.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by vps5.brixit.nl (Postfix) with ESMTPSA id 10F7160815;
 Sun,  3 Jan 2021 18:00:12 +0000 (UTC)
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
To: Iskren Chernev <iskren.chernev@gmail.com>, Rob Clark <robdclark@gmail.com>
References: <20210102202437.1630365-1-iskren.chernev@gmail.com>
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <d2333f2e-1227-3f37-ac22-4a2a0a02acb4@postmarketos.org>
Date: Sun, 3 Jan 2021 21:01:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210102202437.1630365-1-iskren.chernev@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've tested all recent GPU bring-up patches on msm8974pro samsung-klte 
(a330v2) and with this patch everything is OK. But without this we're 
getting the following in dmesg while running kmscube (which is rendering 
nothing except black screen):

[   94.969272] msm fd900000.mdss: [drm:hangcheck_handler [msm]] *ERROR* 
A330: hangcheck detected gpu lockup rb 0!
[   94.970184] msm fd900000.mdss: [drm:hangcheck_handler [msm]] *ERROR* 
A330:     completed fence: 0
[   94.970873] msm fd900000.mdss: [drm:hangcheck_handler [msm]] *ERROR* 
A330:     submitted fence: 1
[   94.971600] msm fd900000.mdss: [drm:recover_worker [msm]] *ERROR* 
A330: hangcheck recover!
[   94.972329] msm fd900000.mdss: [drm:recover_worker [msm]] *ERROR* 
A330: offending task: kmscube (kmscube)
[   94.974101] revision: 330 (3.3.0.2)
[   94.974117] rb 0: fence:    0/1
[   94.974129] rptr:     36
[   94.974139] rb wptr:  36
[   94.974148] CP_SCRATCH_REG0: 0
[   94.974159] CP_SCRATCH_REG1: 0
[   94.974169] CP_SCRATCH_REG2: 0
[   94.974178] CP_SCRATCH_REG3: 0
[   94.974188] CP_SCRATCH_REG4: 0
[   94.974198] CP_SCRATCH_REG5: 0
[   94.974208] CP_SCRATCH_REG6: 10
[   94.974218] CP_SCRATCH_REG7: 12

So indeed partial revert of "if" condition fixes gpu at least on msm8974.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

On 1/2/21 11:24 PM, Iskren Chernev wrote:
> The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
> != NULL, because aspace is NULL when using vram carveout.
> 
> Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c5e61cb3356df..c1953fb079133 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -775,9 +775,10 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
>   		struct drm_file *file, struct drm_gem_object *obj,
>   		uint64_t *iova)
>   {
> +	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_file_private *ctx = file->driver_priv;
>   
> -	if (!ctx->aspace)
> +	if (!priv->gpu)
>   		return -EINVAL;
>   
>   	/*
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
