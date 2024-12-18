Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B969F6F7F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 22:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0343310E13E;
	Wed, 18 Dec 2024 21:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FdBRP8h+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7244F10E13E;
 Wed, 18 Dec 2024 21:34:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGQtKv023946;
 Wed, 18 Dec 2024 21:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x7h51NnDJyUD/OUOZyQAzkX/KpLa4aFP230owX2e5Uw=; b=FdBRP8h+9GccklAZ
 4CbHZsI+vBsxceOM5Kw1Tr5nuUz+gcgqRjiK/L/om9OeqoQniVopXa0kZBcNe2Pf
 Haw7lqxncLhyNpHfqh7xSVHfoiTTM51VNNhtGwQ+X++vXTdQef6KFPy2zD+6HGn8
 bA7VeYuA01rG39wGzVIIzizgv8bT8D4M4TYooDFhoJPGXWnVH7tGth41Wh0v882A
 gRe5szdGNBp/jypuyfChjz9lzLuNHlxSHUnqztMXyxOaeQqv8ZRnzgPPfMZyMI/3
 zXB6EZH6SA6Lmq22azJLK9vZANA1uZErhi1gcca3i7h+lHrUQ0Q95hHM1szRwI8x
 FctTGQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m01gh21d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 21:34:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BILYDKi006323
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 21:34:13 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 13:34:13 -0800
Message-ID: <dbe94c6b-e981-4f40-9261-2e44b5fb73cc@quicinc.com>
Date: Wed, 18 Dec 2024 13:33:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
 <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
 <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7y6KQiIizqm9XtIm61CgaacJPrY4NkYX
X-Proofpoint-ORIG-GUID: 7y6KQiIizqm9XtIm61CgaacJPrY4NkYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180168
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



On 12/18/2024 3:20 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 17, 2024 at 04:27:57PM -0800, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> There is no recovery mechanism in place yet to recover from mmu
>> faults for DPU. We can only prevent the faults by making sure there
>> is no misconfiguration.
>>
>> Rate-limit the snapshot capture for mmu faults to once per
>> msm_atomic_commit_tail() as that should be sufficient to capture
>> the snapshot for debugging otherwise there will be a lot of DPU
>> snapshots getting captured for the same fault which is redundant
>> and also might affect capturing even one snapshot accurately.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>>   drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
>>   drivers/gpu/drm/msm/msm_kms.h    | 3 +++
>>   3 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
>> index 9c45d641b5212c11078ab38c13a519663d85e10a..9ad7eeb14d4336abd9d8a8eb1382bdddce80508a 100644
>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>> @@ -228,6 +228,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>>   	if (kms->funcs->prepare_commit)
>>   		kms->funcs->prepare_commit(kms, state);
>>   
>> +	kms->fault_snapshot_capture = 0;
>> +
> 
> - Please move it before the prepare_commit().
> - You are accessing the same variable from different threads / cores.
>    There should be some kind of a sync barrier.

Hi Dmitry,

Ack, will add a lock for the snapshot capture counter.

Thanks,

Jessica Zhang

> 
>>   	/*
>>   	 * Push atomic updates down to hardware:
>>   	 */
>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>> index 78830e446355f77154fa21a5d107635bc88ba3ed..3327caf396d4fc905dc127f09515559c12666dc8 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.c
>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
>>   {
>>   	struct msm_kms *kms = arg;
>>   
>> -	msm_disp_snapshot_state(kms->dev);
>> +	if (!kms->fault_snapshot_capture) {
>> +		msm_disp_snapshot_state(kms->dev);
>> +		kms->fault_snapshot_capture++;
>> +	}
>>   
>>   	return -ENOSYS;
>>   }
>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
>> index e60162744c669773b6e5aef824a173647626ab4e..3ac089e26e14b824567f3cd2c62f82a1b9ea9878 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.h
>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>> @@ -128,6 +128,9 @@ struct msm_kms {
>>   	int irq;
>>   	bool irq_requested;
>>   
>> +	/* rate limit the snapshot capture to once per attach */
>> +	int fault_snapshot_capture;
>> +
>>   	/* mapper-id used to request GEM buffer mapped for scanout: */
>>   	struct msm_gem_address_space *aspace;
>>   
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry

