Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4379568A044
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 18:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB7C10E816;
	Fri,  3 Feb 2023 17:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF2810E816;
 Fri,  3 Feb 2023 17:32:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313HHDRY007015; Fri, 3 Feb 2023 17:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yT7uFgQlrlzn3gsWwX3FtIRaId/qm63YBAKBUbrADiY=;
 b=l6ToYqYAVbd9SXrbRJiUwIgROuwV+WWPMbaQnt9cokVR9BKJfMh+lqf9cXsTlj8xBadY
 tjy2x3in/WyHyAvJIK5Z3FA6h7vJ+/O4hh7WazhOd2KXA/dV3fiHM8PYQ4ETxmIuaUmJ
 601Hb4c9Rrt32v5oQpYXvHIMv9JYOaRzP0YagWnuay1/nqgmqKG52Z+CpWGwcIvzGoqQ
 ZFo0QLc7DWMo6fSgbjBOsmvUjj1PskH0Pb2w20vPXiAocUIWw8BANzEywPHaoTxyLuit
 1vUtDg+XJjRsHUzBKpN3jcQfx5yELy9JS/q+qHethyuTfObP3nFicmMDMCS94dt+e1UE MQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngns2j664-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 17:32:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313HWR6F030732
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Feb 2023 17:32:27 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 09:32:26 -0800
Message-ID: <33ddecb5-7182-1e34-012b-c65098faa567@quicinc.com>
Date: Fri, 3 Feb 2023 09:32:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 05/27] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-6-dmitry.baryshkov@linaro.org>
 <aaeb287f-de41-3f63-fd93-b08532964d59@quicinc.com>
 <CAA8EJprHMyPDmHhqZF-AZpqiLNkK7QuoQz-sZu6kSabZ7y76Dw@mail.gmail.com>
 <e03f4fdc-75c1-dbc3-fb1a-05fc9e32d5cc@quicinc.com>
 <d000fec1-e24f-5a31-2484-98df672d8550@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <d000fec1-e24f-5a31-2484-98df672d8550@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 93FVaOwyYkH2QrBRDZKpf37sSzT8FPSQ
X-Proofpoint-ORIG-GUID: 93FVaOwyYkH2QrBRDZKpf37sSzT8FPSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_17,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=486 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030160
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/2023 6:16 AM, Dmitry Baryshkov wrote:
> On 28/01/2023 01:59, Abhinav Kumar wrote:
>>
>>
>> On 1/26/2023 10:05 PM, Dmitry Baryshkov wrote:
>>> On Fri, 27 Jan 2023 at 02:52, Abhinav Kumar 
>>> <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>>>> The pipe's layout is not cached, corresponding data structure is 
>>>>> zeroed
>>>>> out each time in the dpu_plane_sspp_atomic_update(), right before the
>>>>> call to _dpu_plane_set_scanout() -> dpu_format_populate_layout().
>>>>>
>>>>> Drop plane_addr comparison against previous layout and corresponding
>>>>> EAGAIN handling.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>
>>>> The change itself LGTM, hence
>>>>
>>>> But, shouldnt we add this EAGAIN validation or in other words fix this
>>>> rather than drop this?
>>>
>>> What for? Does it really save us anything? What's the price of
>>> re-programming the SSPP_SRC0_ADDR registers?
>>>
>> There are 4 Src registers being programmed per sspp.
>>
>> With number of layers going up this will be 4x.
>>
>> So lets say there are 5 layers and only one of their address has 
>> changed, we need to reprogram only 4 regs but now will reprogram 20.
> 
> I think this was the original intention for this change, however the 
> implementation ended up being written in a way when this condition 
> doesn't trigger at all.
> 

Yes, and thats why I wrote that we should fix this rather than drop this.

>>
>> Thats why i thought this is a good optimization.
>>
>> But still, that is a separate change so I am fine if this goes in 
>> first as its just removing dead code anyway.
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
