Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C30AA54CB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 21:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0565310E323;
	Wed, 30 Apr 2025 19:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Glo7zhLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684CE10E134;
 Wed, 30 Apr 2025 19:41:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGgxBS029556;
 Wed, 30 Apr 2025 19:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JPJj2ypVxLM6FirxIox1Ym4HrMcpwqg5uqyspzcdVqA=; b=Glo7zhLmOH1FFffG
 +GPcusVVc4fHmf5fOD6JZ1418X0nASD0XaFSgjY0lOmpNm6YKtjJlfQypGeSA1MF
 WHKIveIsxAnjic4Xu7X+3m+hKhmBfFgQ1cG9WrFtQ0YBEe4XqRqo7EeNJEXvZ9UL
 WWdfr6VRYTZpS8TfsK7goFd2SSq9zxByaJoS7/dIzMTzfLBtiVNGA5EeztEiQpen
 ftLV/3b8xEYkWmBcL0RoBjR/P53S3pCJPlo0WCzdp/t2/YGHmYjLQTMjj+K2DEhA
 lNX/Ez+T36Zl4OD8RQJQhH3ga8PtUg91FbLTTziXAbblwqrylxZT37cwW2CvJPL/
 dhZxIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u7ug0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 19:41:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UJfG1i030862
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 19:41:16 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 12:41:15 -0700
Message-ID: <0e07f35d-0eeb-4380-84e2-97a45841bf15@quicinc.com>
Date: Wed, 30 Apr 2025 12:41:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm: move wq handling to KMS code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>
CC: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
 <CAF6AEGtG2K79zAd9tyNAG7JSVhS2sPdC-VjqubpmhD9AvoVoAA@mail.gmail.com>
 <9f64ea5e-1b59-4522-b55a-d9b11e412ee5@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <9f64ea5e-1b59-4522-b55a-d9b11e412ee5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=68127cdc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8
 a=ZvaOMdlihffMFPaspHcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: OYPJ16N5teY2OzZPBYTTALRqidUUVMO8
X-Proofpoint-ORIG-GUID: OYPJ16N5teY2OzZPBYTTALRqidUUVMO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE0NCBTYWx0ZWRfXxKy1z67eH/WT
 CK8Zndnp8kdp6x1GIlg7c6gy0EJbrfw5sCdALay+F7rEyXdGodUZvWwakPuLMiCZN9UZ1P+/ILr
 pBoApuK8J+0Ck9YEE+rlUE9yWZdqcNjXLNOhtZ6Afz4eMO0iG85zfSIPSwJ/qQgzUbUZmCejxM7
 TlgEWHPiWvgBP0b8uX3U4JYHoFvGobpIXJh6R+ErMM70yChfnGFQGoEBRzyY72Kajr73adZJOpl
 +7oTSLBV+8mJc+6Ulp91ywumnIWKVMNprz3qeJXkTqf9pgL+vhARKTcaAlb7swxdNB0PRAvRpKt
 HJdUZTFJe3brbj0jYHCgr+HLvjyBnmQ+vKClGe2JUHrKzOcdcLy02Q4SG5Hfcx0tSS50I+1VS+B
 uqe6ZxSs1pr3QD1EJro+KDT3mqLFwmcxQYEdNjd9YgORksJsiKo+zDBtEs1rcYyPyUo+4oBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300144
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



On 4/15/2025 1:59 AM, Dmitry Baryshkov wrote:
> On 14/04/2025 18:58, Rob Clark wrote:
>> On Sun, Apr 13, 2025 at 9:33 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> The global workqueue is only used for vblanks inside KMS code. Move
>>> allocation / flushing / deallcation of it to msm_kms.c
>>
>> Maybe we should also just move the wq into struct msm_kms?
> 
> ... together with several other KMS-only fields. I will take a look.
> 

Yeah the usages seem to be only within kms, so we can move this to msm_kms.

>>
>> BR,
>> -R
>>
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/msm/msm_drv.c | 21 ++-------------------
>>>   drivers/gpu/drm/msm/msm_kms.c | 16 +++++++++++++++-
>>>   2 files changed, 17 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/ 
>>> msm_drv.c
>>> index 
>>> c3588dc9e53764a27efda1901b094724cec8928a..02beb40eb9146941aa43862d07a6d82ae21c965e 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>> @@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
>>>                          drm_atomic_helper_shutdown(ddev);
>>>          }
>>>
>>> -       /* We must cancel and cleanup any pending vblank enable/disable
>>> -        * work before msm_irq_uninstall() to avoid work re-enabling an
>>> -        * irq after uninstall has disabled it.
>>> -        */
>>> -
>>> -       flush_workqueue(priv->wq);
>>> -
>>>          msm_gem_shrinker_cleanup(ddev);
>>>
>>>          msm_perf_debugfs_cleanup(priv);
>>> @@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
>>>          ddev->dev_private = NULL;
>>>          drm_dev_put(ddev);
>>>
>>> -       destroy_workqueue(priv->wq);
>>> -
>>>          return 0;
>>>   }
>>>
>>> @@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, 
>>> const struct drm_driver *drv)
>>>          ddev->dev_private = priv;
>>>          priv->dev = ddev;
>>>
>>> -       priv->wq = alloc_ordered_workqueue("msm", 0);
>>> -       if (!priv->wq) {
>>> -               ret = -ENOMEM;
>>> -               goto err_put_dev;
>>> -       }
>>> -
>>>          INIT_LIST_HEAD(&priv->objects);
>>>          mutex_init(&priv->obj_lock);
>>>
>>> @@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, 
>>> const struct drm_driver *drv)
>>>          if (priv->kms_init) {
>>>                  ret = drmm_mode_config_init(ddev);
>>>                  if (ret)
>>> -                       goto err_destroy_wq;
>>> +                       goto err_put_dev;
>>>          }
>>>
>>>          ret = msm_init_vram(ddev);
>>>          if (ret)
>>> -               goto err_destroy_wq;
>>> +               goto err_put_dev;
>>>
>>>          dma_set_max_seg_size(dev, UINT_MAX);
>>>
>>> @@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const 
>>> struct drm_driver *drv)
>>>
>>>   err_deinit_vram:
>>>          msm_deinit_vram(ddev);
>>> -err_destroy_wq:
>>> -       destroy_workqueue(priv->wq);
>>>   err_put_dev:
>>>          drm_dev_put(ddev);
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/ 
>>> msm_kms.c
>>> index 
>>> 35d5397e73b4c5cb90b1770e8570277e782be7ec..821f0b9f968fc3d448e612bfae04639ceb770353 100644
>>> --- a/drivers/gpu/drm/msm/msm_kms.c
>>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>>> @@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
>>>
>>>          BUG_ON(!kms);
>>>
>>> +       /* We must cancel and cleanup any pending vblank enable/disable
>>> +        * work before msm_irq_uninstall() to avoid work re-enabling an
>>> +        * irq after uninstall has disabled it.
>>> +        */
>>> +
>>> +       flush_workqueue(priv->wq);
>>> +
>>>          /* clean up event worker threads */
>>>          for (i = 0; i < priv->num_crtcs; i++) {
>>>                  if (priv->event_thread[i].worker)
>>> @@ -243,6 +250,8 @@ void msm_drm_kms_uninit(struct device *dev)
>>>
>>>          if (kms && kms->funcs)
>>>                  kms->funcs->destroy(kms);
>>> +
>>> +       destroy_workqueue(priv->wq);
>>>   }
>>>
>>>   int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>> @@ -258,10 +267,14 @@ int msm_drm_kms_init(struct device *dev, const 
>>> struct drm_driver *drv)
>>>          if (ret)
>>>                  return ret;
>>>
>>> +       priv->wq = alloc_ordered_workqueue("msm", 0);
>>> +       if (!priv->wq)
>>> +               return -ENOMEM;
>>> +
>>>          ret = priv->kms_init(ddev);
>>>          if (ret) {
>>>                  DRM_DEV_ERROR(dev, "failed to load kms\n");
>>> -               return ret;
>>> +               goto err_msm_uninit;
>>>          }
>>>
>>>          /* Enable normalization of plane zpos */
>>> @@ -319,6 +332,7 @@ int msm_drm_kms_init(struct device *dev, const 
>>> struct drm_driver *drv)
>>>          return 0;
>>>
>>>   err_msm_uninit:
>>> +       destroy_workqueue(priv->wq);
>>>          return ret;
>>>   }
>>>
>>>
>>> -- 
>>> 2.39.5
>>>
> 
> 

