Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC755E5A5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 17:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C945A1130EB;
	Tue, 28 Jun 2022 15:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A9C1130EB;
 Tue, 28 Jun 2022 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656429792; x=1687965792;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RvWriGxvnrfUaWIbEbAZdoDVUWgEkiJx6GnkqCbaZDY=;
 b=QBjdLJo+7UZRf03Otov9uV/sTTmY7x7QdIef/CY3FIGDn5ioht6ui3n0
 DqTN693nXz0GAODn73KuIoX7pLGlD6+9ZTC/lHQOwJIf7dE0fagCuah33
 PHTgKv1H7BufZsD8oVF9+azv6WVSRn2GP/ul2ACjZDnMOFjmlsuvodr65 I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 28 Jun 2022 08:23:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 08:23:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 28 Jun 2022 08:22:50 -0700
Received: from [10.110.113.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 28 Jun
 2022 08:22:48 -0700
Message-ID: <ba89c17a-bf8d-0eda-d975-26e88d43e0aa@quicinc.com>
Date: Tue, 28 Jun 2022 08:22:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <6523e533-960b-d148-0f87-2ad327a3ac3b@quicinc.com>
 <CAA8EJprQBnZAc-2AxXD8cV_qMoKrusNa+VSHW9Kw-xKS_ZWAkg@mail.gmail.com>
 <CAD=FV=WvNrfYaUgbDayxU0wJUbZbgwVMWjeyTjtd+Sqcvj=e2A@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAD=FV=WvNrfYaUgbDayxU0wJUbZbgwVMWjeyTjtd+Sqcvj=e2A@mail.gmail.com>
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
Cc: Vinod Koul <vkoul@kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/27/2022 4:20 PM, Doug Anderson wrote:
> Hi,
>
> On Sat, Jun 25, 2022 at 1:48 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>> On Sat, 25 Jun 2022 at 04:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>> On 6/24/2022 5:11 PM, Dmitry Baryshkov wrote:
>>>> On Sat, 25 Jun 2022 at 03:03, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>> On 6/24/2022 4:56 PM, Kuogee Hsieh wrote:
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> index dcd80c8a794c..7816e82452ca 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> @@ -140,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>>>>>
>>>>>     static const struct msm_dp_config sc7280_dp_cfg = {
>>>>>            .descs = (const struct msm_dp_desc[]) {
>>>>> -               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
>>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
>>>>>                    [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000,
>>>>> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>>>>> +               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
>>>>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
>>>>>            },
>>>>>            .num_descs = 2,
>>>>>     };
>>>>>
>>>>>
>>>>> The reason order is important is because  in this function below, even
>>>>> though it matches the address to find which one to use it loops through
>>>>> the array and so the value of *id will change depending on which one is
>>>>> located where.
>>>>>
>>>>> static const struct msm_dp_desc *dp_display_get_desc(struct
>>>>> platform_device *pdev,
>>>>>                                 unsigned int *id)
>>>>> {
>>>>>        const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
>>>>>        struct resource *res;
>>>>>        int i;
>>>>>
>>>>>        res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>>        if (!res)
>>>>>            return NULL;
>>>>>
>>>>>        for (i = 0; i < cfg->num_descs; i++) {
>>>>>            if (cfg->descs[i].io_start == res->start) {
>>>>>                *id = i;
>>>> The id is set to the index of the corresponding DP instance in the
>>>> descs array, which is MSM_DP_CONTROLLER_n. Correct up to now.
>>> Right, this is where I misunderstood his explanation.
>>>
>>> Even if we swap the order, but retain the index correctly it will still
>>> work today.
>>>
>>> Hes not sure of the root-cause of why turning on the primary display
>>> first fixes the issue.
>>>
>>> I think till we root-cause that, lets put this on hold.
>> Agreed. Let's find the root cause.
> FWIW, I was poking a little bit about the glitch that Kuogee was
> trying to fix here. Through a bunch of hacky heuristics I think the
> dpu_hw_ctl_trigger_flush_v1() is the function that "causes" the
> corruption. Specifically I managed to do something like:
>
> if (hacky_heuristic)
>    pr_info("About to call flush\n);
>    mdelay(2000);
> }
> ctl->ops.trigger_flush(ctl)
> if (hacky_heuristic)
>    pr_info("Finished calling flush\n);
>    mdelay(2000);
>    pr_info("Finished calling flush delay done\n);
> }

flush bit need to up update at real time.

otherwise unexpected side effects will happen.

i try same thing, but I got fence timeout error.

Anyway, I had submit new patch to fix corruption issue.

Thanks for your efforts and helps.

> I then watched my display and reproduced the problem. When I saw the
> problem I looked over at the console and saw "Finished calling flush"
> was the last thing printed.
>
> I don't know if this helps much. Presumably we're flushing a bunch of
> previous operations so whatever we had queued up probably matters
> more, but maybe it'll give a clue?
>
>
> Other notes FWIW:
>
> * If you increase the amount of time of the glitching, you can
> actually see that we are glitching both the internal and external
> displays.
>
> * You can actually make the glitch stay on the screen "permanently" by
> unplugging the external display while the internal screen is off. I
> don't know why it doesn't always happen, but it seems to happen often
> enough. Presumably if someone knew the display controller well they
> could try to figure out what state it was in and debug the problem.
>
>
> -Doug
