Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3BD836D52
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 18:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C446A10E74E;
	Mon, 22 Jan 2024 17:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7BE10E74E;
 Mon, 22 Jan 2024 17:28:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40MEFh1f024730; Mon, 22 Jan 2024 17:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=O33X+3RHv3cg4CvDsAraqDD6UaFlmMnUPDF5/eXUySg=; b=en
 U4AQnKQkty0R6Uj+26rU4Sv8ue4kdUdZboNvAyzimrY3w5lUJK5ZPBdxdSpbrtoO
 1ZPp54XdzpAt4irn6ibOeDNdwbHbteFVT/cfK2J5ZL4QKyoOAnbQOvspnRL5Oz6k
 nKHBm4hqSghFYZfOus5NBdvcZPuxEnqGe0gHCOX34BaLddnVTPwkrD3ETNTN8iU0
 z5cN61cXqyfHqF6lV/B5tqwg/Ui1SI1qshf9RWducOHi/y32zuglgwP4L4SVUXgS
 d17VecQqODIh34yoHfIwfv4On0N1eJc6Uu9NjLtR0MmN28sGydFrnoYvRuFzfalU
 sol+fYtAhksmPBtZql0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vsn0wsbha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jan 2024 17:28:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MHSHis025192
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jan 2024 17:28:17 GMT
Received: from [10.110.92.156] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 09:28:16 -0800
Message-ID: <18b7e28c-c969-c5f4-28a9-74ff79c94aca@quicinc.com>
Date: Mon, 22 Jan 2024 09:28:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/14] drm/msm/dp: move next_bridge handling to dp_display
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-14-dmitry.baryshkov@linaro.org>
 <b5f571c6-dcf6-c416-ca86-fdbd0514676b@quicinc.com>
 <CAA8EJpqvyOsPErUE08mcCAcG41zRJS+Q6qQi83-ZNCBcwv3kCw@mail.gmail.com>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpqvyOsPErUE08mcCAcG41zRJS+Q6qQi83-ZNCBcwv3kCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hkwozvBkpFQlAaylOJ62W--pRcmSraiX
X-Proofpoint-GUID: hkwozvBkpFQlAaylOJ62W--pRcmSraiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_07,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220121
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/19/2024 6:31 PM, Dmitry Baryshkov wrote:
> On Fri, 19 Jan 2024 at 23:14, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> Dmitry,
>>
>> I am testing this patch serial with msm-next branch.
>>
>> This patch cause system crash during booting up for me.
>>
>> Is this patch work for you?
> Yes, tested on top of linux-next. However I only tested it with
> DP-over-USBC. What is your testcase? Could you please share the crash
> log?

I tested it on chrome device (sc7280) which has eDP as primary and 
without external USBC DP connected.

It crashes during boot.

I will debug it more and collect logs for you.


>> On 12/29/2023 2:56 PM, Dmitry Baryshkov wrote:
>>> Remove two levels of indirection and fetch next bridge directly in
>>> dp_display_probe_tail().
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_display.c | 42 +++++++++--------------------
>>>    drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
>>>    drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
>>>    3 files changed, 13 insertions(+), 57 deletions(-)
