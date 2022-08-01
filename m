Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CCE586CF4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 16:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DCFA7680;
	Mon,  1 Aug 2022 14:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7601096011;
 Mon,  1 Aug 2022 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659364597; x=1690900597;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z1q6yWbe6ZKJFIdTiO5T8PBqxZ1ZPjO7H90GXR9+67U=;
 b=LYsSGyOs/Sdz/duKClekrKeFrpOKXxgW0Lj1zghna3Eqd4hb/0BcbwIc
 T0ELNmQiKmOxPqXiv/wmD/PKXxqBK1efVcqIQDSqRGz35IDoRRzBNNBCI
 yGxxzfBsRkdyNJQCkcSZKVgLG+ilP888WWsmoKcvNKOcDfAnwqsRbsXlt o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Aug 2022 07:36:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 07:36:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 1 Aug 2022 07:36:05 -0700
Received: from [10.216.14.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 1 Aug 2022
 07:35:58 -0700
Message-ID: <f08be233-77ae-f645-df88-d264f2336725@quicinc.com>
Date: Mon, 1 Aug 2022 20:05:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 2/8] drm/msm: Take single rpm refcount on behalf of all
 submits
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <1659174051-27816-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730150952.v3.2.Ifee853f6d8217a0fdacc459092bbc9e81a8a7ac7@changeid>
 <CAF6AEGs7zKDoRY=ijxFQvaZig=UiSPgWkJFA-PY2MTxKWr5bpw@mail.gmail.com>
 <d7f95663-c0f7-8227-dbc0-fac43bdf6faa@quicinc.com>
 <CAF6AEGt5H=T_0HOLrNqRHZOYNicfk74bgZrQH56k2bYpi5JsRA@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGt5H=T_0HOLrNqRHZOYNicfk74bgZrQH56k2bYpi5JsRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/1/2022 3:45 AM, Rob Clark wrote:
> On Sun, Jul 31, 2022 at 9:33 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> On 7/31/2022 9:26 PM, Rob Clark wrote:
>>> On Sat, Jul 30, 2022 at 2:41 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>> Instead of separate refcount for each submit, take single rpm refcount
>>>> on behalf of all the submits. This makes it easier to drop the rpm
>>>> refcount during recovery in an upcoming patch.
>>>>
>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> ---
>>>>
>>>> (no changes since v1)
>>> I see no earlier version of this patch?
My bad, that is incorrect. This is a new patch included in the current 
series.

-Akhil.
>>>
>>>>    drivers/gpu/drm/msm/msm_gpu.c | 12 ++++++++----
>>>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>>> index c8cd9bf..e1dd3cc 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>>> @@ -663,11 +663,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>>>>           mutex_lock(&gpu->active_lock);
>>>>           gpu->active_submits--;
>>>>           WARN_ON(gpu->active_submits < 0);
>>>> -       if (!gpu->active_submits)
>>>> +       if (!gpu->active_submits) {
>>>>                   msm_devfreq_idle(gpu);
>>>> -       mutex_unlock(&gpu->active_lock);
>>>> +               pm_runtime_put_autosuspend(&gpu->pdev->dev);
>>>> +       }
>>>>
>>>> -       pm_runtime_put_autosuspend(&gpu->pdev->dev);
>>>> +       mutex_unlock(&gpu->active_lock);
>>>>
>>>>           msm_gem_submit_put(submit);
>>>>    }
>>>> @@ -756,14 +757,17 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>
>>>>           /* Update devfreq on transition from idle->active: */
>>>>           mutex_lock(&gpu->active_lock);
>>>> -       if (!gpu->active_submits)
>>>> +       if (!gpu->active_submits) {
>>>> +               pm_runtime_get(&gpu->pdev->dev);
>>>>                   msm_devfreq_active(gpu);
>>>> +       }
>>>>           gpu->active_submits++;
>>>>           mutex_unlock(&gpu->active_lock);
>>>>
>>>>           gpu->funcs->submit(gpu, submit);
>>>>           gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
>>>>
>>>> +       pm_runtime_put(&gpu->pdev->dev);
>>> this looks unbalanced?
>> There is another pm_runtime_get_sync at the top of this function. Just
>> before hw_init().
>> https://elixir.bootlin.com/linux/v5.19-rc8/source/drivers/gpu/drm/msm/msm_gpu.c#L737
> oh, right.. sorry, I was looking at my local stack of WIP patches
> which went the opposite direction and moved the runpm into just
> msm_job_run().. I'll drop that one
>
> BR,
> -R
>
>> -Akhil.
>>> BR,
>>> -R
>>>
>>>>           hangcheck_timer_reset(gpu);
>>>>    }
>>>>
>>>> --
>>>> 2.7.4
>>>>

