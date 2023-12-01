Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5160801378
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 20:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AC010E93F;
	Fri,  1 Dec 2023 19:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E504010E93E;
 Fri,  1 Dec 2023 19:14:33 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1EE9DY001773; Fri, 1 Dec 2023 19:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=V75gORbkS8wNv4xrKEX7qrGJe5kfAGaIDGaUS/K5MWs=;
 b=ohWFSPZQ83AqpSeFQSnYxQYS4x+BFvSza4FXD5RHgSNCP2yCCjohG1dWsk/UQFXFwumW
 4Sugg5cN6v9y/ajNsXssrvIFcRpxThSAqx5GY+hATN+SYdYwHicGm16LxTiOajtwWMit
 bR3U2PiRe2E3cm1xHCAXrn4tomFvUFB4guR5dJe6kBmzt9YM7JiLX2+t0i06oWmFFXG5
 RhJTC4KUpwaH8eJ1AjSm23oD9DxrsxrSgHY/cHousemfsV3ejvnAdIueC7QUHtRhWzNd
 rJPjW46Q7zPa55LzpCfzZDW067Zru2WSVQ6I5pGn3lnL/w/3yGFUpKuAHvKcwl00Hx3n QQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqggaru76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 19:14:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1JESYs030951
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 19:14:28 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 11:14:28 -0800
Message-ID: <730d7e5b-e748-465d-cfee-06bfdcee5844@quicinc.com>
Date: Fri, 1 Dec 2023 11:14:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/2] drm/msm/dpu: Modify vblank_refcount if error in
 callback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Paloma Arellano
 <quic_parellan@quicinc.com>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-2-quic_parellan@quicinc.com>
 <CAA8EJpqGx3eQ3o6bJhv3OBmHqtp67x8ODupZgKfSLSfFcRRmHQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqGx3eQ3o6bJhv3OBmHqtp67x8ODupZgKfSLSfFcRRmHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: beEO7akiyt8dXkbqh1ZmCCDO83MBivvV
X-Proofpoint-ORIG-GUID: beEO7akiyt8dXkbqh1ZmCCDO83MBivvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_17,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010123
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, steev@kali.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/30/2023 11:45 PM, Dmitry Baryshkov wrote:
> On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>
>> When the irq callback returns a value other than zero,
>> modify vblank_refcount by performing the inverse
>> operation of its corresponding if-else condition.
> 
> I think it might be better to follow Bjorn's suggestion: once we have
> the lock, we don't need atomics at all.
> Then you rearrange the code to set the new value after getting return
> code from dpu_core_irq_register_callback() /
> dpu_core_irq_unregister_callback().
> 

Even if we drop the atomics, we will have to replace it with a simple 
refcount. The refcount checks will be before calling 
dpu_core_irq_register_callback() / dpu_core_irq_unregister_callback().

So we will still need the corresponding inverse refcount when either of 
those calls fail but just that they wont be atomics.

Am I missing something here?

>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 9 +++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++--
>>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
