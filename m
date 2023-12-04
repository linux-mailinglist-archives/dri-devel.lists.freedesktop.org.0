Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F456803E43
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 20:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF45910E3E4;
	Mon,  4 Dec 2023 19:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4409E10E3E6;
 Mon,  4 Dec 2023 19:22:32 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B4IVn6F032323; Mon, 4 Dec 2023 19:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lP7E3zFWJeXTpds8gs7ryPa5qiXUD4nuUjU26TmZEpI=;
 b=buHByzuGLRJUpvLmINnVDd6f0IKu/izhQa8+s7qMSKoudF1J8gORbkZau/gi6CKRmK0c
 9YsrA72W4ssBDW5g2co8FH+1RgFrsU8+R5kilxHC65RQTqNmHL8mvbhd+bNWsx6OF+JU
 O9NBCXwC1B5ZFEc3gy8VUdbAXpPMF5HtWwY8tQRsF+WTU3PNJouD3U4fjh4TSAc9B5Rb
 M9l/c04UdZDlZY1xmv3LXP+KkHGsMhPs5bDbtU5pKbsXpQJmu88RRLlhKqv6Ag5K4m3Y
 RpcSDtP9sGCnnC5xfnksCr6He5DMbgsI1I5QJBotPr4OZ8G43tUmslTqpS7cqMKp0waD SA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usgfmrrrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Dec 2023 19:22:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4JMPmG026785
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Dec 2023 19:22:25 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 11:22:25 -0800
Message-ID: <14e6d232-8e6d-0b5f-4ec4-a23244bcd701@quicinc.com>
Date: Mon, 4 Dec 2023 11:22:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-3-quic_parellan@quicinc.com>
 <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqFya5H+4PPZ8A3CqqqRJXsJ3KKbbcfS=C13QTr1vAtSw@mail.gmail.com>
 <20231201162252.GG1766637@hu-bjorande-lv.qualcomm.com>
 <a78c42d1-6ce0-2c34-5513-c04948d2ff31@quicinc.com>
 <knm2uvjuad47famhr5uzibxxx3reknxdpb5raj3fox2vlkarvc@w6xer6jo4yok>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <knm2uvjuad47famhr5uzibxxx3reknxdpb5raj3fox2vlkarvc@w6xer6jo4yok>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CO_JL1xuiqX3ANtt1BmEaFqlM5TKzpkC
X-Proofpoint-ORIG-GUID: CO_JL1xuiqX3ANtt1BmEaFqlM5TKzpkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_18,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=781 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040150
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
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Paloma Arellano <quic_parellan@quicinc.com>,
 steev@kali.org, quic_jesszhan@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/3/2023 7:31 PM, Bjorn Andersson wrote:
> On Fri, Dec 01, 2023 at 11:43:36AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/1/2023 8:22 AM, Bjorn Andersson wrote:
>>> On Fri, Dec 01, 2023 at 10:34:50AM +0200, Dmitry Baryshkov wrote:
>>>> On Fri, 1 Dec 2023 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>>>> On Thu, Nov 30, 2023 at 05:40:55PM -0800, Paloma Arellano wrote:
>>> [..]
>>>>>> @@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>>>>>>         dpu_enc->enabled = false;
>>>>>>         mutex_init(&dpu_enc->enc_lock);
>>>>>>         mutex_init(&dpu_enc->rc_lock);
>>>>>> +     mutex_init(&dpu_enc->vblank_ctl_lock);
>>>>>
>>>>> Is this somehow propagated to multiple different dpu_encoder_phys
>>>>> instances, or why do you need to initialize it here and pass the pointer
>>>>> through 2 different intermediate structures before assigning it to
>>>>> phys_enc->vblank_ctl_lock below?
>>>>
>>>> Yes, there can be two phys_enc instances for a single encoder, so this
>>>> part is fine.
>>>>
>>>
>>> Thanks for the clarification, Dmitry. Sounds like it make sense then.
>>>
>>> But, if I read the code correctly the two instances will have separate
>>> vblank_refcount copies, and the dpu_core_irq_*() interface does mutual
>>> exclusion within. So why do we need shared mutual exclusion between the
>>> two? (This is where a proper description of the problem in the commit
>>> message would have been very helpful)
>>>
>>
>> Are you suggesting we just have one vblank_ctl_lock per encoder and not have
>> one vblank_ctl_lock per phys encoder? I cannot think of a display specific
>> reason for that other than just the SW layout.
>>
>> The reason its like this today is that control_vblank_irq is an encoder phys
>> op because it does different things based on the type of encoder.
>>
>> Because its an encoder phys op, it has the vblank_ctl_lock at the phys
>> structure and not the encoder one.
>>
>> Its just more about how the phys op is defined that each phys op operates on
>> its phys's structure.
>>
>> Generally, if we have one encoder with two physical encoders we anyways bail
>> out early for the other encoder so this is mostly a no-op for the slave phys
>> encoder.
>>
>> Please take a look at below return point.
>>
>> 715 	/* Slave encoders don't report vblank */
>> 716 	if (!sde_encoder_phys_vid_is_master(phys_enc))
>> 717 		goto end;
>> 718
>>
>> So technically its still providing protection for the same phys encoder but
>> the catch is this control_vblank_irq can get called from different threads
>> hence we need exclusion.
>>
> 
> The way I understand the code is that the atomic is used to refcount
> when to enable/disable the interrupt, and the new lock protects this
> refcount during concurrent updates. I have no concerns with this part.
> 

Correct.

> 
> What I'm seeing is that the refcount it per phys_enc, and as such there
> would be no reason to have a common mutex to protect the two independent
> refcounts.
> 
> But I'm probably misunderstanding something here...
> 

There is no reason to have a common mutex to protect the two independent 
refcounts. In fact, there is no need to even have two independent 
refcounts because whenever we have one encoder with two physical 
encoders, we use only the master physical encoder for vblanks like I 
pointed above.

The only reason we have it like this is because today the 
vblank_refcount is part of phys_enc so the mutex handle is also now a 
part of it.

Do you think if we move both the mutex and the vblank_refcount to the 
dpu_encoder from the dpu_encoder_phys and maintain the mutex at that 
level it will be less confusing for you?

I am fine with that.

> Regards,
> Bjorn
> 
