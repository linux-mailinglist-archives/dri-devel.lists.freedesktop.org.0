Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51F789CDC8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 23:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9406611287D;
	Mon,  8 Apr 2024 21:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fwzbokP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B079F11287D;
 Mon,  8 Apr 2024 21:45:09 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 438LdsOh025089; Mon, 8 Apr 2024 21:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Afdn36TdS9ViFZw2dsAR0Lj++mbD7UpHSP0NWJEu2YE=; b=fw
 zbokP+Wkh2lECDkCXXvhmNwf6fkjDuexg2RsL7ZcY2SwDHktPHdmOOWPNDtm0fcL
 M3EvtlsCqkNsjNJsK+kmjXfP4Rahl+tSOO5BSc2SKedNZV6VhbIK8CENqK6xJWSX
 Hv8pZzyMlJDrmSbxUEjpHfsCEVKOO05drrSqw6scyt7ZXQbhNcAFHjE8DjpKtZeP
 vqkUPYaazsi7hmd+eZQPKpXTUnhjaWVkEqdsErb1yctmYqfrBnc7Z1mkHuWXs9xH
 ELzYQ9t2ScjKRWQ7h/wGvXyYtDUsKMM7Kw5Cs6vXUt6tshaNGv1lcJoKsvJTWhYq
 jtMScOrfS6XhUWYNRmYw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbg0hxb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2024 21:45:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438Lj51t016450
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 8 Apr 2024 21:45:05 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 14:45:04 -0700
Message-ID: <481df20e-8946-abc7-da9c-da8cc7332098@quicinc.com>
Date: Mon, 8 Apr 2024 14:45:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/msm/dsi: move next bridge acquisition to dsi_bind
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-2-962ebdba82ed@linaro.org>
 <7cecab40-2711-4735-1eb2-45f3942982b1@quicinc.com>
 <CAA8EJpodmW8+JDxLx8+1sYURsXGZfmV1q6wzyxF1cxAx2Jo5dg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpodmW8+JDxLx8+1sYURsXGZfmV1q6wzyxF1cxAx2Jo5dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: A1k2trpgcwpcQ7MVxABOVEcctDKffNi1
X-Proofpoint-ORIG-GUID: A1k2trpgcwpcQ7MVxABOVEcctDKffNi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_17,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=983 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080167
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/5/2024 11:15 AM, Dmitry Baryshkov wrote:
> On Fri, 5 Apr 2024 at 20:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
>>> Currently the MSM DSI driver looks for the next bridge during
>>> msm_dsi_modeset_init(). If the bridge is not registered at that point,
>>> this might result in -EPROBE_DEFER, which can be problematic that late
>>> during the device probe process. Move next bridge acquisition to the
>>> dsi_bind state so that probe deferral is returned as early as possible.
>>>
>>
>> But msm_dsi_modeset)init() is also called during msm_drm_bind() only.
>>
>> What issue are you suggesting will be fixed by moving this from
>> msm_drm_bind() to dsi_bind()?
> 
> The goal is to return as early as possible as not not cause
> probe-deferral loops. See commit fbc35b45f9f6 ("Add documentation on
> meaning of -EPROBE_DEFER"). It discusses returning from probe() but
> the same logic applies to bind().
> 

Understood. I was trying to make sure the purpose of the patch is that 
"deferral in component_bind() is better than component_master_bind()"

But yes, overall that is better since the unbounding path will be more 
in the master case.

>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/dsi/dsi.c         | 16 ++++++++++++++++
>>>    drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c |  8 +-------
>>>    3 files changed, 19 insertions(+), 7 deletions(-)
>>>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
