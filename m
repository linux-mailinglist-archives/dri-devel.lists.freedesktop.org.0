Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE3E64721F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 15:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5927B10E4B0;
	Thu,  8 Dec 2022 14:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7815610E4AD;
 Thu,  8 Dec 2022 14:46:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B8ETERh027895; Thu, 8 Dec 2022 14:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Xr4xHq0gKkujS+pQ9/6dlXQZ2AbT3C9rsoW5f5OpxpA=;
 b=UvtBvCW7ivoyMrWzMb57H+4Xa/QglbdaMWC7C9VUpxO/UourEjPV5L5e9/Z4fyw+Y7+h
 xwyAdo0b4Por0oRK9/oOFBUNYjWDW3mJZ4oRLh2mXUnzfKMBlDYDlJsnGHdb+uJZspHm
 4BxAwqjoIN7jerf0jc1neCTkElJRHUfc8sh6Wvs69bMztBCdD84RmFE7uAgQ4U75TsBP
 Nc0Vu2O/POHeYlpveR5Oum8i22gDY7ko9sJiVGHA3CcJ1A8DvDSHjznkCf9Cc5LCoQOB
 u94zwi4TcHL2Kqdik3p/t9RFyLCfMZCBtBU2WvdxI5UOi5hi+WH2GL57XjFmEhFUrkv0 aw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mb7bc9kyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 14:45:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B8Ejsx7021215
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Dec 2022 14:45:54 GMT
Received: from [10.216.54.36] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 8 Dec 2022
 06:45:46 -0800
Message-ID: <3cd97020-d55a-7808-49f5-5fe3af84dc58@quicinc.com>
Date: Thu, 8 Dec 2022 20:15:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
 <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
 <20221207165457.kwdwwiycbwjpogxl@builder.lan>
 <CAPDyKFpYgYkDdJ79xxkwr-Mqnj5CoBrV+ZZe6Xz4hGLNR4zUVw@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAPDyKFpYgYkDdJ79xxkwr-Mqnj5CoBrV+ZZe6Xz4hGLNR4zUVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oSW0SBdBxL6fUr4qAcmvSHnY4Tqwmf6y
X-Proofpoint-ORIG-GUID: oSW0SBdBxL6fUr4qAcmvSHnY4Tqwmf6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_08,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212080121
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, Konrad
 Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 krzysztof.kozlowski@linaro.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/8/2022 7:10 PM, Ulf Hansson wrote:
> On Wed, 7 Dec 2022 at 17:55, Bjorn Andersson <andersson@kernel.org> wrote:
>> On Wed, Dec 07, 2022 at 05:00:51PM +0100, Ulf Hansson wrote:
>>> On Thu, 1 Dec 2022 at 23:57, Bjorn Andersson <andersson@kernel.org> wrote:
>>>> On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
>>>> @Ulf, Akhil has a power-domain for a piece of hardware which may be
>>>> voted active by multiple different subsystems (co-processors/execution
>>>> contexts) in the system.
>>>>
>>>> As such, during the powering down sequence we don't wait for the
>>>> power-domain to turn off. But in the event of an error, the recovery
>>>> mechanism relies on waiting for the hardware to settle in a powered off
>>>> state.
>>>>
>>>> The proposal here is to use the reset framework to wait for this state
>>>> to be reached, before continuing with the recovery mechanism in the
>>>> client driver.
>>> I tried to review the series (see my other replies), but I am not sure
>>> I fully understand the consumer part.
>>>
>>> More exactly, when and who is going to pull the reset and at what point?
>>>
>>>> Given our other discussions on quirky behavior, do you have any
>>>> input/suggestions on this?
>>>>
>>>>> Some clients like adreno gpu driver would like to ensure that its gdsc
>>>>> is collapsed at hardware during a gpu reset sequence. This is because it
>>>>> has a votable gdsc which could be ON due to a vote from another subsystem
>>>>> like tz, hyp etc or due to an internal hardware signal. To allow
>>>>> this, gpucc driver can expose an interface to the client driver using
>>>>> reset framework. Using this the client driver can trigger a polling within
>>>>> the gdsc driver.
>>>> @Akhil, this description is fairly generic. As we've reached the state
>>>> where the hardware has settled and we return to the client, what
>>>> prevents it from being powered up again?
>>>>
>>>> Or is it simply a question of it hitting the powered-off state, not
>>>> necessarily staying there?
>>> Okay, so it's indeed the GPU driver that is going to assert/de-assert
>>> the reset at some point. Right?
>>>
>>> That seems like a reasonable approach to me, even if it's a bit
>>> unclear under what conditions that could happen.
>>>
>> Generally the disable-path of the power-domain does not check that the
>> power-domain is actually turned off, because the status might indicate
>> that the hardware is voting for the power-domain to be on.
> Is there a good reason why the HW needs to vote too, when the GPU
> driver is already in control?
>
> Or perhaps that depends on the running use case?
This power domain can be voted to be ON from other subsystems outside of linux kernel like secure os, hypervisor etc through separate vote registers. So it is not completely under the control of linux clk driver. Linux clk driver can only vote it to be kept ON, check current status etc, but cannot force it to be OFF. I believe this is why it is a votable gdsc in linux-clk driver.

Just a general clarification. GPU has mainly 2 power domains: (1) CX which is shared by GPU and its SMMU, (2) GX which is GPU specific and managed mostly by a power management core within GPU. This patch series is to allow gpu driver to ensure that CX gdsc has collapsed which in turn will reset GPU's internal state.
>
>> As part of the recovery of the GPU after some fatal fault, the GPU
>> driver does something which will cause the hardware votes for the
>> power-domain to be let go, and then the driver does pm_runtime_put().
> Okay. That "something", sounds like a device specific setting for the
> corresponding gdsc, right?
>
> So somehow the GPU driver needs to manage that setting, right?
Clarified about this above.
>
>> But in this case the GPU driver wants to ensure that the power-domain is
>> actually powered down, before it does pm_runtime_get() again. To ensure
>> that the hardware lost its state...
> I see.
>
>> The proposal here is to use a reset to reach into the power-domain
>> provider and wait for the hardware to be turned off, before the GPU
>> driver attempts turning the power-domain on again.
>>
>>
>> In other words, there is no reset. This is a hack to make a normally
>> asynchronous pd.power_off() to be synchronous in this particular case.
Not really. Because other non-linux subsystems are involved here for CX gdsc, we need a way to poll the gdsc register to ensure that it has indeed collapsed before gpu driver continue with re-initialization of gpu. It is either this approach using 'reset' framework or plumbing a new path from gpu driver to gpucc-gdsc driver to poll the collapse status. I went with the 'reset' approach as per the consensus here: https://patchwork.freedesktop.org/patch/493143/

-Akhil.
> Alright, assuming I understood your clarifications above correctly
> (thanks!), I think I have got a much better picture now.
>
> Rather than abusing the reset interface, I think we should manage this
> through the genpd's power on/off notifiers (GENPD_NOTIFY_OFF). The GPU
> driver should register its corresponding device for them
> (dev_pm_genpd_add_notifier()).
>
> The trick however, is to make the behaviour of the power-domain for
> the gdsc (the genpd->power_off() callback) conditional on whether the
> HW is configured to vote or not. If the HW can vote, it should not
> poll for the state - and vice versa when the HW can't vote.
>
> Would this work?
>
> Kind regards
> Uffe

