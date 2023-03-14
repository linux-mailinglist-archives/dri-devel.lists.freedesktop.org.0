Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5163B6B89B9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 05:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DF610E6DE;
	Tue, 14 Mar 2023 04:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2751610E6DA;
 Tue, 14 Mar 2023 04:43:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32E3W2lj006833; Tue, 14 Mar 2023 04:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FYETLTvhqG/wsHTILBXvXqOAtvqeraewKsSHZvVCNwI=;
 b=HczmH/x5B7dLWeXw24qFoHyzGwBsnvS9+NdCFHdM9qz0J3Ni8RRaA8MxABI0Xm9O0Q/F
 sz9fh2j+2bIxVzFonz0MfRqSO0n9v+XNXqx33w56nNSPgzNm5S/WquuUImQHSF5IwfoP
 eUozJUnSJ5Lo59GGEFlH+axMiAZYnPiRv6cA2F+HVBPvUfvAxVK/LxjKYJFJxexhC1pC
 aXrxmtY5A+qhPZ/Z62MpQ1MviZBbACOjgnEID1hVLMNmPc9kksY/6jUM2z0p0h2syJLl
 zj6iMINrBghAFe3+JJXv6V2hjyl1TjFOKkRH1Yn1KEmDi8kqaqgOYFeIC9EsbywCjoVC 7A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p9yew2xg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 04:42:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32E4guMk021540
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 04:42:56 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 21:42:55 -0700
Message-ID: <545a2feb-c2b5-19de-aa91-3bfbef1771f7@quicinc.com>
Date: Mon, 13 Mar 2023 21:42:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 16/32] drm/msm/dpu: move the rest of plane checks to
 dpu_plane_atomic_check()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-17-dmitry.baryshkov@linaro.org>
 <f71027ed-e871-94b5-86d3-58986ae40462@quicinc.com>
 <1045c715-9887-cf4d-9f1d-b9c764270205@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1045c715-9887-cf4d-9f1d-b9c764270205@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8br4D-kNiS3lKcY9KKDofjniMsipgDWd
X-Proofpoint-ORIG-GUID: 8br4D-kNiS3lKcY9KKDofjniMsipgDWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=237
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140041
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/13/2023 9:14 PM, Dmitry Baryshkov wrote:
> On 14/03/2023 06:02, Abhinav Kumar wrote:
>>
>>
>> On 3/9/2023 4:56 PM, Dmitry Baryshkov wrote:
>>> Move plane state updates from dpu_crtc_atomic_check() to the function
>>> where they belong: to dpu_plane_atomic_check().
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Can you please elaborate a bit on this comment?
>>
>> https://patchwork.freedesktop.org/patch/521356/?series=99909&rev=4#comment_949772 
>>
>>
>> Is something still missing? I dont see the multirects being cleared in 
>> dpu_plane_atomic_disable() before or even now.
> 
> It is done in the last patch, where it belongs. There is no need to 
> clear multirect setup until we support RECT_1.
> 

Yup, checked the relevant patch (it wasnt the last).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
