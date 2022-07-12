Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C755711AC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 07:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFBC1125B8;
	Tue, 12 Jul 2022 05:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004961125B8;
 Tue, 12 Jul 2022 05:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657602306; x=1689138306;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=17Z3xulwqXW1QfY/QEzxXBPkNTk6rcH+8iLrHGYb9Gc=;
 b=gA0IZ7dtlvORiDpRjLGDLC2ajzjxnZjKGTrQqizofElx8RpREwkxDKzg
 N2r+u7NGDzNrA2fBfcGSzLrvfHz0H3A5JdEcZ6rtJH2WZHLwDo0uu5WLg
 ZwABV3f1/1S1i0d5Nh/CeZphq1D038KvRbf0BEqortPiVrNrLvx53gN34 E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Jul 2022 22:05:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 22:05:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Jul 2022 22:05:02 -0700
Received: from [10.216.10.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 11 Jul
 2022 22:04:56 -0700
Message-ID: <1299312f-e614-e4e2-72cb-fd7fb99922ce@quicinc.com>
Date: Tue, 12 Jul 2022 10:34:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm: Fix cx collapse issue during
 recovery
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
 <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David
 Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jordan
 Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/2022 4:52 AM, Doug Anderson wrote:
> Hi,
>
> On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> There are some hardware logic under CX domain. For a successful
>> recovery, we should ensure cx headswitch collapses to ensure all the
>> stale states are cleard out. This is especially true to for a6xx family
>> where we can GMU co-processor.
>>
>> Currently, cx doesn't collapse due to a devlink between gpu and its
>> smmu. So the *struct gpu device* needs to be runtime suspended to ensure
>> that the iommu driver removes its vote on cx gdsc.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>
>> (no changes since v1)
>>
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
>>   drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>>   2 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 4d50110..7ed347c 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1278,8 +1278,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
>>           */
>>          gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>>
>> -       gpu->funcs->pm_suspend(gpu);
>> -       gpu->funcs->pm_resume(gpu);
>> +       /*
>> +        * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
>> +        * First drop the usage count from all active submits
>> +        */
>> +       for (i = gpu->active_submits; i > 0; i--)
>> +               pm_runtime_put(&gpu->pdev->dev);
>> +
>> +       /* And the final one from recover worker */
>> +       pm_runtime_put_sync(&gpu->pdev->dev);
>> +
>> +       for (i = gpu->active_submits; i > 0; i--)
>> +               pm_runtime_get(&gpu->pdev->dev);
>> +
>> +       pm_runtime_get_sync(&gpu->pdev->dev);
> In response to v1, Rob suggested pm_runtime_force_suspend/resume().
> Those seem like they would work to me, too. Why not use them?
Quoting my previous response which I seem to have sent only to Freedreno 
list:

"I believe it is supposed to be used only during system sleep state 
transitions. Btw, we don't want pm_runtime_get() calls from elsewhere to 
fail by disabling RPM here."

-Akhil
