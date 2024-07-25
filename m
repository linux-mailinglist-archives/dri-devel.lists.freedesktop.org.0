Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691AF93BB6E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 06:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECAC10E051;
	Thu, 25 Jul 2024 04:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="elEybvog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D52B10E051
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 04:15:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P1UTOs006484;
 Thu, 25 Jul 2024 04:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0R/GmLmF+AVH4F3lFb4D+tfwXOcUIFJJ6X3Tm/Hmdz8=; b=elEybvogrrmIkATe
 sg4vUhPT3WJzn/9aaVjmIvxLBfrYSFZBT+Q51gi3hJgIe2YlhSuPx0xaD+fcklqe
 Eqh4lsda+tbAIWelgcuqWbxyaLt7rpTCrragTMgq/iL7EjAsEHVb0HXyEhlr2f45
 NjHFaUNRbmx9QDAOiH1SHhTXBWBZv2kA0OXXkkS/6km4S+Fq54yVkvtQdLALUdhV
 BAKQh60RBIbrmOby2EtUF7rTTDOIC5L2zgAR1aepg+72faHczAnKN/HisnDhR5zP
 7nmXDJAzR5Vn8O503q5cvvaKmMMbGMy6H+VRC7T6IL+y6cfrRkG6sxGA5U00kGJK
 yPC5oA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2xem0av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jul 2024 04:15:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46P4FUph014052
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jul 2024 04:15:30 GMT
Received: from [10.4.85.8] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 24 Jul
 2024 21:15:27 -0700
Message-ID: <a1f4457a-2313-4d75-9857-0d82cd502343@quicinc.com>
Date: Thu, 25 Jul 2024 14:15:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] firmware: qcom: implement object invoke support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
 <ink4tq3wk2jkpybiisaudkun3g2x2drfogrdw43zdpi6yh2u5g@yrvrxzxsi46g>
 <836dab13-9c59-4d87-a600-a0be6506deb2@quicinc.com>
 <CAA8EJprp2veCaQq8GsYv4Mu1HQbx8nWv0XWtxcE4cu5kxkA16w@mail.gmail.com>
 <f9e5ef49-754c-4d97-8186-634674151b2f@quicinc.com>
 <gtdr5s7yih7pjuhpfkjmlu2lflya4heiph4wi446rlbxduqlya@5xfix7dyocli>
Content-Language: en-US
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <gtdr5s7yih7pjuhpfkjmlu2lflya4heiph4wi446rlbxduqlya@5xfix7dyocli>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: P54gFV-rRAwSOICVnk90OwqlP48txtQO
X-Proofpoint-ORIG-GUID: P54gFV-rRAwSOICVnk90OwqlP48txtQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_03,2024-07-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250025
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



On 7/25/2024 2:09 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 25, 2024 at 01:19:07PM GMT, Amirreza Zarrabi wrote:
>>
>>
>> On 7/4/2024 5:34 PM, Dmitry Baryshkov wrote:
>>> On Thu, 4 Jul 2024 at 00:40, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 7/3/2024 10:13 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 02, 2024 at 10:57:36PM GMT, Amirreza Zarrabi wrote:
>>>>>> Qualcomm TEE hosts Trusted Applications and Services that run in the
>>>>>> secure world. Access to these resources is provided using object
>>>>>> capabilities. A TEE client with access to the capability can invoke
>>>>>> the object and request a service. Similarly, TEE can request a service
>>>>>> from nonsecure world with object capabilities that are exported to secure
>>>>>> world.
>>>>>>
>>>>>> We provide qcom_tee_object which represents an object in both secure
>>>>>> and nonsecure world. TEE clients can invoke an instance of qcom_tee_object
>>>>>> to access TEE. TEE can issue a callback request to nonsecure world
>>>>>> by invoking an instance of qcom_tee_object in nonsecure world.
>>>>>
>>>>> Please see Documentation/process/submitting-patches.rst on how to write
>>>>> commit messages.
>>>>
>>>> Ack.
>>>>
>>>>>
>>>>>>
>>>>>> Any driver in nonsecure world that is interested to export a struct (or a
>>>>>> service object) to TEE, requires to embed an instance of qcom_tee_object in
>>>>>> the relevant struct and implements the dispatcher function which is called
>>>>>> when TEE invoked the service object.
>>>>>>
>>>>>> We also provids simplified API which implements the Qualcomm TEE transport
>>>>>> protocol. The implementation is independent from any services that may
>>>>>> reside in nonsecure world.
>>>>>
>>>>> "also" usually means that it should go to a separate commit.
>>>>
>>>> I will split this patch to multiple smaller ones.
>>>>
>>>
>>> [...]
>>>
>>>>>
>>>>>> +    } in, out;
>>>>>> +};
>>>>>> +
>>>>>> +int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
>>>>>> +    struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[], int *result);
>>>>>
>>>>> What's the difference between a result that gets returned by the
>>>>> function and the result that gets retuned via the pointer?
>>>>
>>>> The function result, is local to kernel, for instance memory allocation failure,
>>>> or failure to issue the smc call. The result in pointer, is the remote result,
>>>> for instance return value from TA, or the TEE itself.
>>>>
>>>> I'll use better name, e.g. 'remote_result'?
>>>
>>> See how this is handled by other parties. For example, PSCI. If you
>>> have a standard set of return codes, translate them to -ESOMETHING in
>>> your framework and let everybody else see only the standard errors.
>>>
>>>
>>
>> I can not hide this return value, they are TA dependent. The client to a TA
>> needs to see it, just knowing that something has failed is not enough in
>> case they need to do something based on that. I can not even translate them
>> as they are TA related so the range is unknown.
> 
> I'd say it a sad design. At least error values should be standard.
> 

Sure. But it is normal. If we finally move to TEE subsystem, this is the value that
would be copied to struct tee_ioctl_invoke_arg.ret to pass to the caller of
TEE_IOC_INVOKE.
