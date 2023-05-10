Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603086FE81E
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 01:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0C210E573;
	Wed, 10 May 2023 23:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB56310E4D4;
 Wed, 10 May 2023 23:30:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AND972000752; Wed, 10 May 2023 23:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7WDGO1bd4jzyFHOcFubfjRxmEOxwHUYGzdTE8qwNHVc=;
 b=m3Awv65oMaH6mo2w8CV3admiZdcOjcOyuWme5W8XS+bBcSP35zYCfn4XRhorDHfVjsEO
 3k8yklVWFIfKgnQQ0I06enRT3b7KdVzYZE/uUXTSY8C7GA+1gex8sc5+ws/bQixmx6Lz
 YO/vIpQrZiF0jfBbNS/uvw5FzTMloFPkh4QcTYDFWrNfWfU3Pxl5YfJ+BUSDZb+EEwF6
 49UtXvGmWuiNcK3C972wmpICEMlVfQh/6KClOew6z5XRVsWCyboIe1F7PlJIHYacobPc
 MN+z13p6BgwA/vk2VJga+BfnGIJzH+vrmwbDxQeczOTbGxYetdMQcjw+YwYN1n5PXc78 LA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qg5mpsxca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:30:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34ANUdSC003058
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:30:39 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 16:30:38 -0700
Message-ID: <9d405506-3083-3827-990b-ff2151bf6024@quicinc.com>
Date: Wed, 10 May 2023 16:30:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 2/2] drm/msm/dp: add mutex to protect internal_hpd
 against race condition between different threads
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd
 <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@gmail.com>, <andersson@kernel.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <vkoul@kernel.org>
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n532y=ARQ_+urEA_b3zUn+gKTu1fgK_siHNt3CpbLB9PZg@mail.gmail.com>
 <74ae5514-2b04-9363-902e-cb4d7cbe1128@quicinc.com>
 <6721cc2c-6988-948c-65d6-f50edb925ded@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <6721cc2c-6988-948c-65d6-f50edb925ded@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: y6hM4sdyexagpy1sdVrL5qAcZG5QEkOo
X-Proofpoint-GUID: y6hM4sdyexagpy1sdVrL5qAcZG5QEkOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=673 clxscore=1015
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100193
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On 5/10/2023 4:19 PM, Kuogee Hsieh wrote:
> internal_hpd is referenced at both plug and unplug handle.
> 
> The majority purpose of  mutext is try to serialize internal_hpd between 
> dp_bridge_hpd_disable() and either plug or unplug handle.
> 
> 
> On 5/10/2023 4:11 PM, Abhinav Kumar wrote:
>>
>>
>> On 5/10/2023 3:46 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2023-05-10 13:31:05)
>>>> Intrenal_hpd is referenced by event thread but set by drm bridge 
>>>> callback
>>>> context. Add mutex to protect internal_hpd to avoid conflicts between
>>>> threads.
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>
>>> This patch looks completely unnecessary. How can dp_bridge_hpd_enable()
>>> be called at the same time that dp_bridge_hpd_disable() is called or
>>> dp_bridge_hpd_notify() is called? Isn't there locking or ordering at a
>>> higher layer?
>>
>> Ack. We can drop this patch because we are protected by 
>> bridge->hpd_mutex in drm_bridge_hpd_enable() / drm_bridge_hpd_disable 
>> () and drm_bridge_hpd_notify().

I understood now, so what kuogee is referring to is that this 
event_mutex protection is to not protect those 3 calls from each other 
(since they are already protected as we saw above) but because 
dp_hpd_plug_handle/dp_hpd_unplug_handle still uses 
dp_display.internal_hpd to re-enable the hot-plug interrupt, this is 
making sure that flow is protected as well.
