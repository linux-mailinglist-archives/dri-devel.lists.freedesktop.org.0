Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D506B1838
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 01:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB98B10E15E;
	Thu,  9 Mar 2023 00:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C710E15E;
 Thu,  9 Mar 2023 00:52:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3290oBxx002922; Thu, 9 Mar 2023 00:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uOdBnb8tHa2GOvSakCibcd8D5NIAW8J5Zr3Vde+4txc=;
 b=TaipZnCSXI4lGWgwvVp10tlnjCZYV1MiGAk3Ye+b5aLpxGvQPvff9+PLgwlVkjIx6Aw0
 xmhmaMfB23+EYvuKbowek9Dpeqanzp/B+6vDZ1DkKoxaQyROCltwPN7ZGsyLAm9Z5Q1o
 XyYawZl/I/Rzi0KMx/6QKvHj5acAe9G0eG73PWOfTuF0VIakuUtaKalKu6z68APh5Q4H
 Zl6yeNIk3Jp6JGWhfZgJVtUDapsCuVt+UpUCVEYXWT6r5gyDq+Uq+sHyw6u0yY7xdZC8
 bUDe3SsAoJC8BSEFg76XvNVQ2tMSNFMBs2lY029xR7lBeghv2yHvwgHjYjuqCQtTxgak cg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p758cr05q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 00:52:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3290q96M012122
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Mar 2023 00:52:09 GMT
Received: from [10.110.84.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 8 Mar 2023
 16:52:09 -0800
Message-ID: <fa427b6a-dfec-a7c5-a35f-bed623f8b4dc@quicinc.com>
Date: Wed, 8 Mar 2023 16:52:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC] drm: property: use vzalloc() instead of kvzalloc() for
 large blobs
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Rob
 Clark <robdclark@gmail.com>
References: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>
 <ZAjvc7jjKDNSJcjq@intel.com>
 <CAF6AEGvMyDb7kwZU5Uk14nRNOe1-eFUVmXEsnLiGKL7R0kOjPQ@mail.gmail.com>
 <ZAkkEXlE0nwdFTYy@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZAkkEXlE0nwdFTYy@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: GHy4ZtcChWaloyZ3bVDrcAK91MgAm0IR
X-Proofpoint-GUID: GHy4ZtcChWaloyZ3bVDrcAK91MgAm0IR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090006
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville

Thanks for the comments.

On 3/8/2023 4:10 PM, Ville Syrjälä wrote:
> On Wed, Mar 08, 2023 at 03:33:48PM -0800, Rob Clark wrote:
>> On Wed, Mar 8, 2023 at 1:23 PM Ville Syrjälä
>> <ville.syrjala@linux.intel.com> wrote:
>>>
>>> On Wed, Mar 08, 2023 at 12:02:42PM -0800, Abhinav Kumar wrote:
>>>> For DRM property blobs created by user mode using
>>>> drm_property_create_blob(), if the blob value needs to be updated the
>>>> only way is to destroy the previous blob and create a new one instead.
>>>>
>>>> For some of the property blobs, if the size of the blob is more
>>>> than one page size, kvzalloc() can slow down system as it will first
>>>> try to allocate physically contiguous memory but upon failure will
>>>> fall back to non-contiguous (vmalloc) allocation.
>>>>
>>>> If the blob property being used is bigger than one page size, in a
>>>> heavily loaded system, this causes performance issues because
>>>> some of the blobs are updated on a per-frame basis.
>>>>
>>>> To mitigate the performance impact of kvzalloc(), use it only when
>>>> the size of allocation is less than a page size when creating property
>>>> blobs
>>>
>>> Not sure how badly this will eat into the vmalloc area.
>>

The reason we had the PAGE_SIZE check to use vzalloc() was specifically 
to limit the cases which will be affected by this.

The percentage of blobs having a size more than a PAGE_SIZE will be the 
ones for which we will use vzalloc() which is actually good anyway since 
it cases of heavy memory fragmentation, kvzalloc() will fallback to vmalloc.

That percentage should have been very less to begin with otherwise 
others would have already hit this issue and even those will only 
benefit from this change in our opinion.

For most of the existing blobs, then this change should not affect and 
for those which it does, it should only benefit (like MSM).

>> Normally I wouldn't expect this to be much of a problem, but we don't
>> appear to restrict CREATEBLOBPROP to DRM_MASTER, which seems like it
>> might have been a mistake.. so perhaps we want to either restrict
>> CREATEBLOBPROP or put an upper threshold limit on total size of all
>> allocated blob props using vmalloc area?
> 
> Surprisingly few kms ioctls are master-only it seems. Dunno
> what the use case for all those being non-master really is.
> 
> I think blob limits in general were disussed at at various
> points in the past with no conclusion. I guess it's slightly
> problematic in that if you limit individual max blob size
> then they just create more smaller ones. If you limit the
> total size per fd they just open more fds. If you put a total
> upper limit then it's just a slightly quicker DoS than
> without the limit. Shrug.
> 
>>
>> BR,
>> -R
>>
>>> Is there no GFP flag to avoid the expensive stuff instead?
>>>
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_property.c | 6 +++++-
>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
>>>> index dfec479830e4..40c2a3142038 100644
>>>> --- a/drivers/gpu/drm/drm_property.c
>>>> +++ b/drivers/gpu/drm/drm_property.c
>>>> @@ -561,7 +561,11 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
>>>>        if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
>>>>                return ERR_PTR(-EINVAL);
>>>>
>>>> -     blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
>>>> +     if (sizeof(struct drm_property_blob) + length > PAGE_SIZE)
>>>> +             blob = vzalloc(sizeof(struct drm_property_blob)+length);
>>>> +     else
>>>> +             blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
>>>> +
>>>>        if (!blob)
>>>>                return ERR_PTR(-ENOMEM);
>>>>
>>>> --
>>>> 2.7.4
>>>
>>> --
>>> Ville Syrjälä
>>> Intel
> 
