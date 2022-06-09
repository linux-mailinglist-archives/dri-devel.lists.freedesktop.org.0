Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10896545145
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 17:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB3712A990;
	Thu,  9 Jun 2022 15:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6342B12A990;
 Thu,  9 Jun 2022 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654789967; x=1686325967;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qfKnae2570h4uEL9FaMYyvGU2UTZ2rcWlTl6+sZcd+w=;
 b=ssO0MFKAumERaanNzvABTvi19ep6Cn++7JjeRkKL5/Npm0p0qRT/MfPC
 ghnHrFT+VchEfsQbqJJgmaBpVJAgs79g1PHCyXXusiMb99F4eY9gNH/LP
 J2WsvJV75hlX3MVMB0BssS5evVHTX/nzB+JTITvcB0PWEgmMmAFOuERaz 8=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Jun 2022 08:52:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 08:52:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 9 Jun 2022 08:52:46 -0700
Received: from [10.216.42.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 9 Jun 2022
 08:52:41 -0700
Message-ID: <e721e6dd-2f31-4e29-f32c-ddecccaaacdc@quicinc.com>
Date: Thu, 9 Jun 2022 21:22:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] drm/msm: Switch ordering of runpm put vs devfreq_idle
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20220608161334.2140611-1-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220608161334.2140611-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Doug
 Anderson <dianders@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/8/2022 9:43 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> I've seen a few crashes like:
>
>      CPU: 0 PID: 216 Comm: A618-worker Tainted: G        W         5.4.196 #7
>      Hardware name: Google Wormdingler rev1+ INX panel board (DT)
>      pstate: 20c00009 (nzCv daif +PAN +UAO)
>      pc : msm_readl+0x14/0x34
>      lr : a6xx_gpu_busy+0x40/0x80
>      sp : ffffffc011b93ad0
>      x29: ffffffc011b93ad0 x28: ffffffe77cba3000
>      x27: 0000000000000001 x26: ffffffe77bb4c4ac
>      x25: ffffffa2f227dfa0 x24: ffffffa2f22aab28
>      x23: 0000000000000000 x22: ffffffa2f22bf020
>      x21: ffffffa2f22bf000 x20: ffffffc011b93b10
>      x19: ffffffc011bd4110 x18: 000000000000000e
>      x17: 0000000000000004 x16: 000000000000000c
>      x15: 000001be3a969450 x14: 0000000000000400
>      x13: 00000000000101d6 x12: 0000000034155555
>      x11: 0000000000000001 x10: 0000000000000000
>      x9 : 0000000100000000 x8 : ffffffc011bd4000
>      x7 : 0000000000000000 x6 : 0000000000000007
>      x5 : ffffffc01d8b38f0 x4 : 0000000000000000
>      x3 : 00000000ffffffff x2 : 0000000000000002
>      x1 : 0000000000000000 x0 : ffffffc011bd4110
>      Call trace:
>       msm_readl+0x14/0x34
>       a6xx_gpu_busy+0x40/0x80
>       msm_devfreq_get_dev_status+0x70/0x1d0
>       devfreq_simple_ondemand_func+0x34/0x100
>       update_devfreq+0x50/0xe8
>       qos_notifier_call+0x2c/0x64
>       qos_max_notifier_call+0x1c/0x2c
>       notifier_call_chain+0x58/0x98
>       __blocking_notifier_call_chain+0x74/0x84
>       blocking_notifier_call_chain+0x38/0x48
>       pm_qos_update_target+0xf8/0x19c
>       freq_qos_apply+0x54/0x6c
>       apply_constraint+0x60/0x104
>       __dev_pm_qos_update_request+0xb4/0x184
>       dev_pm_qos_update_request+0x38/0x58
>       msm_devfreq_idle_work+0x34/0x40
>       kthread_worker_fn+0x144/0x1c8
>       kthread+0x140/0x284
>       ret_from_fork+0x10/0x18
>      Code: f9000bf3 910003fd aa0003f3 d503201f (b9400260)
>      ---[ end trace f6309767a42d0831 ]---
>
> Which smells a lot like touching hw after power collapse.  This seems
> a bit like a race/timing issue elsewhere, as pm_runtime_get_if_in_use()
> in a6xx_gpu_busy() should have kept us from touching hw if it wasn't
> powered.
>
> But, we've seen cases where the idle_work scheduled by
> msm_devfreq_idle() ends up racing with the resume path.  Which, again,
> shouldn't be a problem other than unnecessary freq changes.
>
> v2. Only move the runpm _put_autosuspend, and not the _mark_last_busy()
>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Link: https://lore.kernel.org/r/20210927152928.831245-1-robdclark@gmail.com
> ---
>   drivers/gpu/drm/msm/msm_gpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index eb8a6663f309..244511f85044 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -672,7 +672,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   	msm_submit_retire(submit);
>   
>   	pm_runtime_mark_last_busy(&gpu->pdev->dev);
> -	pm_runtime_put_autosuspend(&gpu->pdev->dev);
>   
>   	spin_lock_irqsave(&ring->submit_lock, flags);
>   	list_del(&submit->node);
> @@ -686,6 +685,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   		msm_devfreq_idle(gpu);
>   	mutex_unlock(&gpu->active_lock);
>   
> +	pm_runtime_put_autosuspend(&gpu->pdev->dev);
> +
>   	msm_gem_submit_put(submit);
>   }
>   

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil.


