Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA1F6E8B19
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B7C10EBAB;
	Thu, 20 Apr 2023 07:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7610EACE;
 Wed, 19 Apr 2023 20:11:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33JIxtmO018870; Wed, 19 Apr 2023 20:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4lRYuddyzyOZ7T7y8ZQegTBdQ60Z0hvBn21Sa+GzYxQ=;
 b=HvRchAgw02Ch8X+g29yHnN9vf5u/PuEGXhDu3jNbwFNO1KnGHGWzqFDlFNrQzsLQ5fGg
 QJ6noOXZa1j0gQxbICLW9KK8XTyMfJ0K7pYuXdTABeJ+wRj3ZzKxVTvmMoRda0wQ0U5f
 t4Em5ru1v5xW8DVsEnuPMpzltCDUnj5WjB6zlhgCqCC1PQTY4njXrc80FsRmNvAkB18Z
 YI4AHEWD+Rl7IzANQzuveqt2Pm7DSzYY7MtJ7sIYOL84ykMKMhiNZjEHOvOqwyVde2nK
 MRsYQ/xNFnjJX2RQoDrfajVUwH8Kn6mz8bxDpxAI5IQ6PlZ8HN54yh12G3VwCMCQPWgH Jg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2nn807cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 20:11:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33JKBjHY024484
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 20:11:46 GMT
Received: from [10.134.71.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 19 Apr
 2023 13:11:44 -0700
Message-ID: <77bb1b3c-09cb-310a-be34-166e573a13a7@quicinc.com>
Date: Wed, 19 Apr 2023 13:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/dpu1: Handle the reg bus ICC path
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Krishna Manikandan
 <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-5-06fbdc1643c0@linaro.org>
 <11c72462-b256-d0db-a666-9615da4420f6@quicinc.com>
 <e15ec005-ef52-c14c-bdeb-faaca207d39b@linaro.org>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <e15ec005-ef52-c14c-bdeb-faaca207d39b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QGMhDy7ReST1ODUAfKQWCbU9L5K7e2AZ
X-Proofpoint-GUID: QGMhDy7ReST1ODUAfKQWCbU9L5K7e2AZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_14,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190174
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Marijn
 Suijten <marijn.suijten@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/19/2023 12:48 PM, Konrad Dybcio wrote:
> 
> 
> On 19.04.2023 21:06, Jeykumar Sankaran wrote:
>>
>>
>> On 4/17/2023 8:30 AM, Konrad Dybcio wrote:
>>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>>> another path that needs to be handled to ensure MDSS functions properly,
>>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>>
>>> Gating that path may have a variety of effects.. from none to otherwise
>>> inexplicable DSI timeouts..
>>>
>>> On the DPU side, we need to keep the bus alive. The vendor driver
>>> kickstarts it to max (300Mbps) throughput on first commit, but in
>>> exchange for some battery life in rare DPU-enabled-panel-disabled
>>> usecases, we can request it at DPU init and gate it at suspend.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++++++++++++--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
>>>    2 files changed, 21 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index dd6c1c40ab9e..d1f77faebbc0 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -384,15 +384,17 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
>>>        return 0;
>>>    }
>>>    -static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>> +static int dpu_kms_parse_icc_paths(struct dpu_kms *dpu_kms)
>>>    {
>>>        struct icc_path *path0;
>>>        struct icc_path *path1;
>>> +    struct icc_path *reg_bus_path;
>>>        struct drm_device *dev = dpu_kms->dev;
>>>        struct device *dpu_dev = dev->dev;
>>>          path0 = msm_icc_get(dpu_dev, "mdp0-mem");
>>>        path1 = msm_icc_get(dpu_dev, "mdp1-mem");
>>> +    reg_bus_path = msm_icc_get(dpu_dev, "cpu-cfg");
>>>          if (IS_ERR_OR_NULL(path0))
>>>            return PTR_ERR_OR_ZERO(path0);
>>> @@ -404,6 +406,10 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>>            dpu_kms->mdp_path[1] = path1;
>>>            dpu_kms->num_mdp_paths++;
>>>        }
>>> +
>>> +    if (!IS_ERR_OR_NULL(reg_bus_path))
>>> +        dpu_kms->reg_bus_path = reg_bus_path;
>>> +
>>>        return 0;
>>>    }
>>>    @@ -1039,7 +1045,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>            DPU_DEBUG("REG_DMA is not defined");
>>>        }
>>>    -    dpu_kms_parse_data_bus_icc_path(dpu_kms);
>>> +    dpu_kms_parse_icc_paths(dpu_kms);
>>>          rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
>>>        if (rc < 0)
>>> @@ -1241,6 +1247,9 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>>>        for (i = 0; i < dpu_kms->num_mdp_paths; i++)
>>>            icc_set_bw(dpu_kms->mdp_path[i], 0, 0);
>>>    +    if (dpu_kms->reg_bus_path)
>>> +        icc_set_bw(dpu_kms->reg_bus_path, 0, 0);
>>> +
>>>        return 0;
>>>    }
>>>    @@ -1261,6 +1270,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>>>            return rc;
>>>        }
>>>    +    /*
>>> +     * The vendor driver supports setting 76.8 / 150 / 300 Mbps on this
>> How do you arrive at these distint BW values? Are they provided by the ICC fwk for the given path?
> They're hardcoded in the SDE driver.
> 
> Konrad
These bandwidths are derived from the scaling frequencies of all the 
buses participating in the icc-path. So they cannot be constants. 
Ideally they should be read from the hw catalog data of the respective 
platform.

Jeykumar S.
>>> +     * path, but it seems to go for the highest level when display output
>>> +     * is enabled and zero otherwise. For simplicity, we can assume that
>>> +     * DPU being enabled and running implies that.
>>> +     */
>>> +    if (dpu_kms->reg_bus_path)
>>> +        icc_set_bw(dpu_kms->reg_bus_path, 0, MBps_to_icc(300));
>>> +
>>>        dpu_vbif_init_memtypes(dpu_kms);
>>>          drm_for_each_encoder(encoder, ddev)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> index d5d9bec90705..c332381d58c4 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> @@ -111,6 +111,7 @@ struct dpu_kms {
>>>        atomic_t bandwidth_ref;
>>>        struct icc_path *mdp_path[2];
>>>        u32 num_mdp_paths;
>>> +    struct icc_path *reg_bus_path;
>>>    };
>>>      struct vsync_info {
>>>
