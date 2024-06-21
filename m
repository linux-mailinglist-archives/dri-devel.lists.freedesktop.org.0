Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7726C9130DC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 01:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8462310E098;
	Fri, 21 Jun 2024 23:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mt9JfZm2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2008210E098;
 Fri, 21 Jun 2024 23:32:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LF6O4L003415;
 Fri, 21 Jun 2024 23:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YT9lB03hb+BN7VK93Q5NAjlKC6SCVjFLDRiXDwk2tKE=; b=mt9JfZm2PfDLrXzF
 sNUAZuJ910VrpW+UuEl5C5WneUCg12PLFdYXKgwhUI5Wyp2LCWOOMQ3BsyAOvXIa
 x6etXcAWjdd5zK6hXhAeFac0ZDStGWJYJcJ9eD0rySDiP1Z7Tmsy4f/Rj79S1tsJ
 nwZ9LYTN4AGjOPEORVtJosHA5v0AyTjqsIK1xt+G+PnCVLGNknWPlQ9jb2LXH1eP
 AlR0SWKo5bFf10OPP4Cr41DIZZ42WaWsLiISDnBFAXcUjD3YOYoOaLHj/m25TpMT
 Cjrj1AxhMfXNTF6nmFzIqTcXGmHRfVKOZ82Q6QkgyotRhHyNUqDOFzjWxxN8BbgU
 z+G8EA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw49et6mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 23:31:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45LNVu62012299
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 23:31:56 GMT
Received: from [10.110.82.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 16:31:51 -0700
Message-ID: <70942425-af39-4bbc-4ab4-8124e336b666@quicinc.com>
Date: Fri, 21 Jun 2024 16:31:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 1/4] drm/msm: register a fault handler for display mmu
 faults
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
 <swboyd@chromium.org>, <dianders@chromium.org>,
 <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
 <cwo63ra2ogrdr3ywmiuxewzuxzsyozyqfcict7xs5kp6uwy2qp@7e6fgb7oyszc>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <cwo63ra2ogrdr3ywmiuxewzuxzsyozyqfcict7xs5kp6uwy2qp@7e6fgb7oyszc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4iej3wq8MMtUpWAcGM_z5FirZKu-Flg7
X-Proofpoint-GUID: 4iej3wq8MMtUpWAcGM_z5FirZKu-Flg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_12,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210171
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



On 5/19/2024 1:31 AM, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 04:37:56PM -0700, Abhinav Kumar wrote:
>> In preparation to register a iommu fault handler for display
>> related modules, register a fault handler for the backing
>> mmu object of msm_kms.
>>
>> Currently, the fault handler only captures the display snapshot
>> but we can expand this later if more information needs to be
>> added to debug display mmu faults.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_kms.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>> index af6a6fcb1173..62c8e6163e81 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.c
>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>> @@ -200,6 +200,28 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>>   	return aspace;
>>   }
>>   
>> +static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>> +{
>> +	struct msm_kms *kms = arg;
>> +	struct msm_disp_state *state;
>> +	int ret;
>> +
>> +	ret = mutex_lock_interruptible(&kms->dump_mutex);
>> +	if (ret)
>> +		return ret;
>> +
>> +	state = msm_disp_snapshot_state_sync(kms);
>> +
>> +	mutex_unlock(&kms->dump_mutex);
>> +
>> +	if (IS_ERR(state)) {
>> +		DRM_DEV_ERROR(kms->dev->dev, "failed to capture snapshot\n");
>> +		return PTR_ERR(state);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   void msm_drm_kms_uninit(struct device *dev)
>>   {
>>   	struct platform_device *pdev = to_platform_device(dev);
>> @@ -261,6 +283,9 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>   		goto err_msm_uninit;
>>   	}
>>   
>> +	if (kms->aspace)
>> +		msm_mmu_set_fault_handler(kms->aspace->mmu, kms, msm_kms_fault_handler);
>> +
> 
> Can we move this to msm_kms_init_aspace() instead of checking for
> kms->aspace?

Ack.
> 
>>   	drm_helper_move_panel_connectors_to_head(ddev);
>>   
>>   	drm_for_each_crtc(crtc, ddev) {
>> -- 
>> 2.44.0
>>
> 
