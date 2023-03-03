Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720746AA4BE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 23:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE3010E785;
	Fri,  3 Mar 2023 22:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D294B10E785;
 Fri,  3 Mar 2023 22:45:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323LUSja024354; Fri, 3 Mar 2023 22:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cwkVrpUacoldAI37mTHT2Q17LBTLJKo8aObqKP2hVJ8=;
 b=iPe0iQNC2hFizegFcGCxadsG6t3a/EAzI7EOyhkoNQPqqoFZIiMqnjBST6oCB6YgPA4d
 d4+3Ey+Juj+oC7z/Bdf7ew7F7dVmdBO9b17jkN0zjxzLc6x7rCmuLShWhfFseJ3r2/UB
 jtVtDkS+skq+3hWN2D+lFYudamRspMv1WJbnFFanB7yNpihHI5ktcZvWBCceyZY4/UxC
 SW+IaOtFsyylVdDB7xNq14je+cGllYcu/Giaa5eYtNDUDiGW2eVJmWfC3Y/C25km6ve0
 j2EAa5A72Ep+4qmXbl0XDP85mp00N63qOninMADSUdML4js01crLtpUW0G6aOn+Cwiun SQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p3c8htgjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 22:45:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 323MjoXk013469
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Mar 2023 22:45:50 GMT
Received: from [10.110.57.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 3 Mar 2023
 14:45:49 -0800
Message-ID: <4c733721-855a-85fd-82a9-9af0f80fc02e@quicinc.com>
Date: Fri, 3 Mar 2023 14:45:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/msm/dp: check core_initialized flag at both
 host_init() and host_deinit()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1677629817-18891-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpquZAhn+HswNxardN1fE8Zu1CKrCU5EiX=B8mGWuxfWnQ@mail.gmail.com>
 <38bf75b4-799a-9758-aae3-69a7e0fc3f58@quicinc.com>
 <86787af0-aa95-a2d8-d68c-555be54a3784@linaro.org>
 <dddd3f2f-28e7-2188-5498-399cdb75adb4@quicinc.com>
 <CAA8EJpokgWnRZ6rvNtsY4=WVcQv-5bCPYRE+dTqcWjbgzO-bxw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpokgWnRZ6rvNtsY4=WVcQv-5bCPYRE+dTqcWjbgzO-bxw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: puOMUtC6SAly4judYQ59r4W_1yRT2QoJ
X-Proofpoint-ORIG-GUID: puOMUtC6SAly4judYQ59r4W_1yRT2QoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_05,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030191
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/2/2023 11:04 AM, Dmitry Baryshkov wrote:
> On Thu, 2 Mar 2023 at 20:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 3/1/2023 1:15 PM, Dmitry Baryshkov wrote:
>>> On 01/03/2023 18:57, Kuogee Hsieh wrote:
>>>> On 2/28/2023 6:16 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, 1 Mar 2023 at 02:17, Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>> wrote:
>>>>>> There is a reboot/suspend test case where system suspend is forced
>>>>>> during system booting up. Since dp_display_host_init() of external
>>>>>> DP is executed at hpd thread context, this test case may created a
>>>>>> scenario that dp_display_host_deinit() from pm_suspend() run before
>>>>>> dp_display_host_init() if hpd thread has no chance to run during
>>>>>> booting up while suspend request command was issued. At this scenario
>>>>>> system will crash at aux register access at dp_display_host_deinit()
>>>>>> since aux clock had not yet been enabled by dp_display_host_init().
>>>>>> Therefore we have to ensure aux clock enabled by checking
>>>>>> core_initialized flag before access aux registers at pm_suspend.
>>>>> Can a call to dp_display_host_init() be moved from
>>>>> dp_display_config_hpd() to dp_display_bind()?
>>>> yes,  Sankeerth's  "drm/msm/dp: enable pm_runtime support for dp
>>>> driver" patch is doing that which is under review.
>>>>
>>>> https://patchwork.freedesktop.org/patch/523879/?series=114297&rev=1
>>> No, he is doing another thing. He is moving these calls to pm_runtime
>>> callbacks, not to the dp_display_bind().
>>>
>>>>> Related question: what is the primary reason for having
>>>>> EV_HPD_INIT_SETUP and calling dp_display_config_hpd() via the event
>>>>> thread? Does DP driver really depend on DPU irqs being installed? As
>>>>> far as I understand, DP device uses MDSS interrupts and those IRQs are
>>>>> available and working at the time of dp_display_probe() /
>>>>> dp_display_bind().
>>>> HDP gpio pin has to run through DP aux module 100ms denouncing logic
>>>> and have its mask bits.
>>>>
>>>> Therefore DP irq has to be enabled to receive DP isr with mask bits set.
>>> So... DP irq is enabled by the MDSS, not by the DPU. Again, why does
>>> DP driver depend on DPU irqs being installed?
>> sorry, previously i mis understand your question -- why does DP driver
>> depend on DPU irqs being installed?
>>
>> now, I think you are asking why  dpu_irq_postinstall() ==>
>> msm_dp_irq_postinstall() ==> event_thread ==> dp_display_config_hdp()
>> ==> enable_irq(dp->irq)
>>
>> With the below test i had run, i think the reason is to make sure
>> dp->irq be requested before enable it.
>>
>> I just run the execution timing order test and collect execution order
>> as descending order at below,
>>
>> 1) dp_display_probe() -- start
>>
>> 2) dp_display_bind()
>>
>> 3) msm_dp_modeset_init()  ==> dp_display_request_irq() ==>
>> dp_display_get_next_bridge()
>>
>> 4) dpu_irq_postinstall() ==> msm_dp_irq_postinstall() ==>
>> enable_irq(dp->irq)
>>
>> 5) dp_display_probe() -- end
>>
>> dp->irq is request at msm_dp_modeset_init() and enabled after.
> Should be moved to probe.
>
>> That bring up the issue to move DP's dp_display_host_init() executed at
>> dp_display_bind().
>>
>> Since eDP have dp_dispaly_host_init() executed at
>> dp_display_get_next_bridge() which executed after dp_display_bind().
>>
>> If moved DP's dp_display_host_init() to dp_dispaly_bind() which means DP
>> will be ready to receive HPD irq before eDP ready.
> And the AUX bus population should also be moved to probe(), which
> means we should call dp_display_host_init() from probe() too.
> Having aux_bus_populate in probe would allow moving component_add() to
> the done_probing() callback, making probe/defer case more robust
>
>> This may create some uncertainties at execution flow and complicate
>> things up.
> Hopefully the changes suggested above will make it simpler.

ok, I will create another patch to

1) move dp_display_host_init() to probe()

2) move component_add() to done_probing() for eDP

3) keep DP as simple platform device (component_add() still executed in 
probe())

Meanwhile, can you approve this patch so that it will not block our 
internal daily testing?



>
