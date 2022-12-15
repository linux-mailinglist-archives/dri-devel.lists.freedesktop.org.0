Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB164D4C0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 01:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8928B10E4D6;
	Thu, 15 Dec 2022 00:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0A510E089;
 Thu, 15 Dec 2022 00:37:57 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BENC6fR008489; Thu, 15 Dec 2022 00:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HS8L6PaXpcf1aCZXEFRozeT8JM2ZY+VhUFTjBJUxlqo=;
 b=lmjTifD9tM60CR3Qu/++MrkIaDWxdgZjkDN/qz+8gkRtWGTMUHa2cUU3QpiEkvq58/ZA
 1MNKyKHctXBcM+BlFpBj3O7ihJuO/V/S25CNptZnSnGtVIDofoX9MKIo8vBkltSo2zhC
 eBQiTtyjI4ZX4mI4/q51Gy36268VY769tioQaLgxAxkBEpgwfpsHK70kaOJm3M9sHtJe
 pMr7HQze1NtUSiGnI5Dd+XO2FxHkhf7zxSqNNIYyBmQhQs+lsF5foo4TciQ5Pdg4ktO6
 JV50HRM1w/myTMMlbprCw6pT2UoXyPrPXeRuCLPWZ5m0sUdyYOxyiGAca47wJfg3KPC1 uA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rctqwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 00:37:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BF0bot4003206
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 00:37:50 GMT
Received: from [10.111.161.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 14 Dec
 2022 16:37:47 -0800
Message-ID: <a7cf0775-e4f5-bd99-6541-93e66add201f@quicinc.com>
Date: Wed, 14 Dec 2022 16:37:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: do not complete
 dp_aux_cmd_fifo_tx() if irq is not for aux transfer
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
 <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com>
 <512f9f0d-a399-27fb-08d0-7311b73fd2a1@quicinc.com>
 <CAD=FV=VvP8Xe+wrMrKymetQ8X9-771m7jM7o1kRQz+oxXdRptg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=VvP8Xe+wrMrKymetQ8X9-771m7jM7o1kRQz+oxXdRptg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Je88X_7I5gmqy39_wNgUTdzitZmW8euF
X-Proofpoint-ORIG-GUID: Je88X_7I5gmqy39_wNgUTdzitZmW8euF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_12,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150002
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
Cc: sean@poorly.run, quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
 andersson@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On 12/14/2022 4:14 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Dec 14, 2022 at 3:46 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Hi Doug
>>
>> On 12/14/2022 2:29 PM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Wed, Dec 14, 2022 at 1:21 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>>
>>>> There are 3 possible interrupt sources are handled by DP controller,
>>>> HPDstatus, Controller state changes and Aux read/write transaction.
>>>> At every irq, DP controller have to check isr status of every interrupt
>>>> sources and service the interrupt if its isr status bits shows interrupts
>>>> are pending. There is potential race condition may happen at current aux
>>>> isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
>>>> even irq is not for aux read or write transaction. This may cause aux read
>>>> transaction return premature if host aux data read is in the middle of
>>>> waiting for sink to complete transferring data to host while irq happen.
>>>> This will cause host's receiving buffer contains unexpected data. This
>>>> patch fixes this problem by checking aux isr and return immediately at
>>>> aux isr handler if there are no any isr status bits set.
>>>>
>>>> Follows are the signature at kernel logs when problem happen,
>>>> EDID has corrupt header
>>>> panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
>>>> panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_aux.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
>>>> index d030a93..8f8b12a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>>>> @@ -423,6 +423,13 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>>>>
>>>>           isr = dp_catalog_aux_get_irq(aux->catalog);
>>>>
>>>> +       /*
>>>> +        * if this irq is not for aux transfer,
>>>> +        * then return immediately
>>>> +        */
>>>
>>> Why do you need 4 lines for a comment that fits on one line?
>> Yes, we can fit this to one line.
>>>
>>>> +       if (!isr)
>>>> +               return;
>>>
>>> I can confirm that this works for me. I could reproduce the EDID
>>> problems in the past and I can't after this patch. ...so I could give
>>> a:
>>>
>>> Tested-by: Douglas Anderson <dianders@chromium.org>
>>>
>>> I'm not an expert on this part of the code, so feel free to ignore my
>>> other comments if everyone else thinks this patch is fine as-is, but
>>> to me something here feels a little fragile. It feels a little weird
>>> that we'll "complete" for _any_ interrupt that comes through now
>>> rather than relying on dp_aux_native_handler() / dp_aux_i2c_handler()
>>> to specifically identify interrupts that caused the end of the
>>> transfer. I guess that idea is that every possible interrupt we get
>>> causes the end of the transfer?
>>>
>>> -Doug
>>
>> So this turned out to be more tricky and was a good finding from kuogee.
>>
>> In the bad EDID case, it was technically not bad EDID.
>>
>> What was happening was, the VIDEO_READY interrupt was continuously
>> firing. Ideally, this should fire only once but due to some error
>> condition it kept firing. We dont exactly know why yet what was the
>> error condition making it continuously fire.
>>
>> In the DP ISR, the dp_aux_isr() gets called even if it was not an aux
>> interrupt which fired (so the call flow in this case was
>> dp_display_irq_handler (triggered for VIDEO_READY) ---> dp_aux_isr()
>> So we should certainly have some protection to return early from this
>> routine if there was no aux interrupt which fired.
>>
>> Which is what this fix is doing.
>>
>> Its not completing any interrupt, its just returning early if no aux
>> interrupt fired.
> 
> ...but the whole problem was that it was doing the complete() at the
> end, right? Kuogee even mentioned that in the commit message.
> Specifically, I checked dp_aux_native_handler() and
> dp_aux_i2c_handler(), both of which are passed the "isr". Unless I
> messed up, both functions already were no-ops if the ISR was 0, even
> before Kuogee's patch. That means that the only thing Kuogee's patch
> does is to prevent the call to "complete(&aux->comp)" at the end of
> "dp_aux_isr()".
> 
> ...and it makes sense not to call the complete() if no "isr" is 0.
> ...but what I'm saying is that _any_ non-zero value of ISR will still
> cause the complete() to be called after Kuogee's patch. That means
> that if any of the 32-bits in the "isr" variable are set, that we will
> call complete(). I'm asking if you're sure that every single bit of
> the "isr" means that we're ready to call complete(). It feels like it
> would be less fragile if dp_aux_native_handler() and
> dp_aux_i2c_handler() (which both already look at the ISR) returned
> some value saying whether the "isr" contained a bit that meant that
> complete() should be called.
> 

Yes, so other than the "transfer done" bits, the other bits we listen to 
are below:

29 #define DP_INTERRUPT_STATUS1 \
30 	(DP_INTR_AUX_I2C_DONE| \
31 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
32 	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
33 	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
34 	DP_INTR_PLL_UNLOCKED | DP_INTR_AUX_ERROR

All of these, if they fire, will be handled in dp_aux_i2c_handler() and 
the aux_error_num will be assigned.

And only if aux_error_num is DP_AUX_ERR_NONE, we go further and read the 
data from the fifo.

So we should complete even if there is any bit set as they are error 
bits which will need to be handled.

> -Doug
