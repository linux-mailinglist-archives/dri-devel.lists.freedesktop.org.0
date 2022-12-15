Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312CF64E396
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 22:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E4510E57F;
	Thu, 15 Dec 2022 21:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9516310E57E;
 Thu, 15 Dec 2022 21:57:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFK7hXd028350; Thu, 15 Dec 2022 21:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3oI5Crq41qMyHxMddn7qmdwHvswRUAK3S/5DvS27CEU=;
 b=SPwR5Sw000VA6ReSIFpnvhcqhWUSOM1//++qLDHUkZXWYHouhgfbHMpHOKCTHu5/MqNH
 jzQKzR+RWGiVoRZYMLbmcWZezzoUc9SwsfQDalc+V7hEheIiq8jOshS5o6O6o6ck7hWb
 IzYNtNzPZknlieZ9OV1VIFCd6mvs2Oee1VcoxCBCvP6BnmcEWIUlQ3FO0/BSP9qA9naJ
 SHynA5qfWc1lsfWoj4NXvT5gQZjcq0qUXgPjQq8U2SlvY/5XsZTmUbowK/YtSAOGxFVT
 3hd9pzpB451sTkLeOBnXkxGjuKVubYXoHgyvecnFc3ljnLcfehWNlFCtaPDUgRW1k2yc mQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mfxseaqnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 21:57:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BFLvXnR017105
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 21:57:33 GMT
Received: from [10.110.127.101] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 15 Dec
 2022 13:57:32 -0800
Message-ID: <f11ec176-35b8-6e8a-a9a1-63f73a000d13@quicinc.com>
Date: Thu, 15 Dec 2022 13:57:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if
 irq is not for aux transfer
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, <agross@kernel.org>,
 <airlied@gmail.com>, <andersson@kernel.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1671129159-31105-1-git-send-email-quic_khsieh@quicinc.com>
 <ca15a54b-8040-5e4f-a78e-12b7f8a554e1@linaro.org>
 <CAE-0n53bREwEMV4aP=ySPuPP8mMbDr=Unbjw_bW0MNN7hTsWRw@mail.gmail.com>
 <d41e29a9-5da6-3843-5018-9674e7d56505@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <d41e29a9-5da6-3843-5018-9674e7d56505@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YD0Zo7geZT_GGuaJB40KHbKRJAplotXo
X-Proofpoint-GUID: YD0Zo7geZT_GGuaJB40KHbKRJAplotXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=879
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150182
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/15/2022 1:15 PM, Dmitry Baryshkov wrote:
> On 15/12/2022 22:10, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-12-15 10:46:42)
>>> On 15/12/2022 20:32, Kuogee Hsieh wrote:
>>>>        if (!aux->cmd_busy)
>>>>                return;
>>>>
>>>>        if (aux->native)
>>>> -             dp_aux_native_handler(aux, isr);
>>>> +             ret = dp_aux_native_handler(aux, isr);
>>>>        else
>>>> -             dp_aux_i2c_handler(aux, isr);
>>>> +             ret = dp_aux_i2c_handler(aux, isr);
>>>>
>>>> -     complete(&aux->comp);
>>>> +     if (ret == IRQ_HANDLED)
>>>> +             complete(&aux->comp);
>>>
>>> Can you just move the complete() into the individual handling functions?
>>> Then you won't have to return the error code from dp_aux_*_handler() at
>>> all. You can check `isr' in that function and call complete if there was
>>> any error.
>>
>> I'd prefer we apply my patch and pass the irqreturn_t variable to the
>> caller of this function so spurious irqs are shutdown. Should I send it
>> as a proper patch?
> 
> I'm for handling the spurious IRQs in a proper way. However I believe 
> that it's not related to the issue Kuogee is trying to fix.
> 
> Thus I think we should have two separate patches: one fixing the EDID 
> corruption issue (for which the proper fix is !isr check, IIUC) and the 
> irqreturn_t. And for the irqreturn_t it might be beneficial to move 
> complete() call to the dp_aux_foo_handler(). Or might be not. That would 
> depend on the patch itself.

Ack.
> 
> 
