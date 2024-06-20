Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354F3910DA7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910C510EB46;
	Thu, 20 Jun 2024 16:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="c6+1Sb2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C43910EB46;
 Thu, 20 Jun 2024 16:54:23 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K9v9ku002533;
 Thu, 20 Jun 2024 16:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v+yEuDylbLxT0gUrqRYwbUC3arI+5fFPpiDRHx6W3gg=; b=c6+1Sb2YfEC0h+0Y
 DbjpdGBSucR5+0DJN5hWuUY1muXN/pIqy1Hj0UQx7ZLmy9ln+esNXics8rz/4BBj
 P2v8JIXT5xJ5LEZ0ovPAhsFP16Eruln49qQibvRcYENORKHA/nDLyAa18JljhIXR
 /KUm3SLCq/khsuT4QJ705m/s5a14LVCnDxe6g/QbFb1lxl3gImhHkHZmT/B/+sXC
 moV7yZ+sv8aD7MHz0CBrAVJ3VLFkBVrx3cbbtk61SzZmQqKzobL6uRYQqd2gI36c
 2NSURaQpcTyHgG9YUZ+oe1ZpfAATtB7NNc7Z4MOMsbY9tyK1yne31k8e1NgKJyOc
 FeTgkQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvaqbt061-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2024 16:54:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45KGsITP015234
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2024 16:54:18 GMT
Received: from [10.110.82.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 09:54:15 -0700
Message-ID: <51832bc1-19ad-2865-2257-97eeeb8b44ee@quicinc.com>
Date: Thu, 20 Jun 2024 09:54:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: protect ctl ops calls with validity checks
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <dan.carpenter@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240619212743.3193985-1-quic_abhinavk@quicinc.com>
 <CAA8EJpowTONWNQH+Sqe1w1eL85Ty4tw8_Qkc1yToQu9s17Tokw@mail.gmail.com>
 <CAF6AEGsQLqf96g9iaUqB1D6zcay8csvUH7oyirTd04x+bUzvYA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAF6AEGsQLqf96g9iaUqB1D6zcay8csvUH7oyirTd04x+bUzvYA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _zisnYxbYC3c_8ke1MS7UfwmuEPJZfLp
X-Proofpoint-ORIG-GUID: _zisnYxbYC3c_8ke1MS7UfwmuEPJZfLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200122
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



On 6/20/2024 9:41 AM, Rob Clark wrote:
> On Thu, Jun 20, 2024 at 6:08 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Thu, 20 Jun 2024 at 00:27, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>
>>> dpu_encoder_helper_phys_cleanup() calls the ctl ops without checking if
>>> the ops are assigned causing discrepancy between its callers where the
>>> checks are performed and the API itself which does not.
>>>
>>> Two approaches can be taken: either drop the checks even in the caller
>>> OR add the checks even in dpu_encoder_helper_phys_cleanup().
>>>
>>> Adopt the latter approach as ctl ops are assigned revision based so may not
>>> be always assigned.
>>
>> NAK, these calls are always assigned. Please make sure that they are
>> documented as required and drop offending checks.
> 
> agreed, I'd rather see the obvious crash if somehow a required
> callback didn't get set up, than a subtle/silent problem.  It is
> easier to debug that way.
> 
> BR,
> -R

Thank you both for the review.

Yes, as I wrote in the commit text, there were two ways to go about it.
And looks like the consensus is to go with the other way (drop the checks).

I will update the v2 that way and I also update the documentation of the 
ctl op of interest to this patch that it is always expected to be assigned.

> 
>>>
>>> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 708657598cce..7f7e6d4e974b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -2180,9 +2180,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>>>          if (ctl->ops.reset_intf_cfg)
>>>                  ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
>>>
>>> -       ctl->ops.trigger_flush(ctl);
>>> -       ctl->ops.trigger_start(ctl);
>>> -       ctl->ops.clear_pending_flush(ctl);
>>> +       if (ctl->ops.trigger_flush)
>>> +               ctl->ops.trigger_flush(ctl);
>>> +       if (ctl->ops.trigger_start)
>>> +               ctl->ops.trigger_start(ctl);
>>> +       if (ctl->ops.clear_pending_flush)
>>> +               ctl->ops.clear_pending_flush(ctl);
>>>   }
>>>
>>>   void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
>>> --
>>> 2.44.0
>>>
>>
>>
>> --
>> With best wishes
>> Dmitry
