Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A288013A5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 20:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C9410E142;
	Fri,  1 Dec 2023 19:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304AF10E142;
 Fri,  1 Dec 2023 19:44:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1GVaaY005177; Fri, 1 Dec 2023 19:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0UvbmXfyHcIlOScsd/uYh4lpCjWpx8TNSAgarzw1f0M=;
 b=Tb1Ofy8rYS4PW8oD451gUqz8h307zVvGMPuQkcRty9AKnyNZPmCir+b940FICiBHHIo9
 kVusj0EoTOu1ke4A0W2ymbNKecvdADEgxwRQhmGc/ff+tXS9yjImGLBh1iItoZMAm9gs
 bNuqtuVgT0BkgJXbvdbb3UAs82iG0UijkbMVx3Bqn93OXrtp9MnEHtX0v1gaGiJ00wd3
 u+aSPVcgurC8p8EqiaycZsJ2tm5mjR3LgylxLPd4z2ZWmrrTzG4IQEW9Sq1WL+fac0tv
 H/rGtS7U9SNnt3wZaMhk/w2sccS3Mn+iGmSlZPbyI/GMxlFx1LhSgx2SYSBj9gMlZKgm Xg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3f7tsb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 19:43:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1Jhcxv004169
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 19:43:38 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 11:43:37 -0800
Message-ID: <a78c42d1-6ce0-2c34-5513-c04948d2ff31@quicinc.com>
Date: Fri, 1 Dec 2023 11:43:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-3-quic_parellan@quicinc.com>
 <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqFya5H+4PPZ8A3CqqqRJXsJ3KKbbcfS=C13QTr1vAtSw@mail.gmail.com>
 <20231201162252.GG1766637@hu-bjorande-lv.qualcomm.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231201162252.GG1766637@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PAp1ffyNoZaj6boHW5eX-9E78-WMBjNN
X-Proofpoint-GUID: PAp1ffyNoZaj6boHW5eX-9E78-WMBjNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_18,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010125
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
Cc: marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 steev@kali.org, quic_jesszhan@quicinc.com,
 Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/1/2023 8:22 AM, Bjorn Andersson wrote:
> On Fri, Dec 01, 2023 at 10:34:50AM +0200, Dmitry Baryshkov wrote:
>> On Fri, 1 Dec 2023 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>> On Thu, Nov 30, 2023 at 05:40:55PM -0800, Paloma Arellano wrote:
> [..]
>>>> @@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>>>>        dpu_enc->enabled = false;
>>>>        mutex_init(&dpu_enc->enc_lock);
>>>>        mutex_init(&dpu_enc->rc_lock);
>>>> +     mutex_init(&dpu_enc->vblank_ctl_lock);
>>>
>>> Is this somehow propagated to multiple different dpu_encoder_phys
>>> instances, or why do you need to initialize it here and pass the pointer
>>> through 2 different intermediate structures before assigning it to
>>> phys_enc->vblank_ctl_lock below?
>>
>> Yes, there can be two phys_enc instances for a single encoder, so this
>> part is fine.
>>
> 
> Thanks for the clarification, Dmitry. Sounds like it make sense then.
> 
> But, if I read the code correctly the two instances will have separate
> vblank_refcount copies, and the dpu_core_irq_*() interface does mutual
> exclusion within. So why do we need shared mutual exclusion between the
> two? (This is where a proper description of the problem in the commit
> message would have been very helpful)
> 

Are you suggesting we just have one vblank_ctl_lock per encoder and not 
have one vblank_ctl_lock per phys encoder? I cannot think of a display 
specific reason for that other than just the SW layout.

The reason its like this today is that control_vblank_irq is an encoder 
phys op because it does different things based on the type of encoder.

Because its an encoder phys op, it has the vblank_ctl_lock at the phys 
structure and not the encoder one.

Its just more about how the phys op is defined that each phys op 
operates on its phys's structure.

Generally, if we have one encoder with two physical encoders we anyways 
bail out early for the other encoder so this is mostly a no-op for the 
slave phys encoder.

Please take a look at below return point.

715 	/* Slave encoders don't report vblank */
716 	if (!sde_encoder_phys_vid_is_master(phys_enc))
717 		goto end;
718

So technically its still providing protection for the same phys encoder 
but the catch is this control_vblank_irq can get called from different 
threads hence we need exclusion.


> Regards,
> Bjorn
