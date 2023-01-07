Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA9660ACD
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 01:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E256210E2DB;
	Sat,  7 Jan 2023 00:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CADF10E2D8;
 Sat,  7 Jan 2023 00:33:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 306NjSiI031052; Sat, 7 Jan 2023 00:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F8KUNTz1kI+9Zlzb+6KnF8DoMZfKchODDiVW8+K2gEM=;
 b=MJPZlwjFNRxkBnN0IYC65wFWe4EmYsKTabPQmZ1q5KKr8BZwbNywsB9GctaITaRV4gdm
 YojV+lwA9Z0NWEA0ZlVnz72lj0/EZvgGnIUjuX6Ub6ISCDW5+2kwSJd+fvneflom8f9o
 DhUWtXhVXtbmoh4v37eCmqfLgZ40YjJTyQ7BKv0NQ5G/OrwDmkPel03h24e+0t06zbiB
 WxKw/0TD5dAab20J67OHgoHDagYCQBlGU48BG0mCQC65WWVP83bN2vutFDhWhiC5/+lh
 kDmyFaB5kl4kFsTIMHebtn8ttpPl07RGgjeQLR+Nd5Ku5ge0RPAvqQW1YMXnux6hPHq/ Hg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mx57e33n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Jan 2023 00:33:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3070X6pN026625
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 7 Jan 2023 00:33:06 GMT
Received: from [10.110.50.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 16:33:05 -0800
Message-ID: <60eea42e-07d6-3dc3-25ab-8fabc76c2473@quicinc.com>
Date: Fri, 6 Jan 2023 16:33:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Daniel Vetter
 <daniel@ffwll.ch>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QKBp0-PJ3NaZjpi2ojiP3BTf_CsQ46qJ
X-Proofpoint-ORIG-GUID: QKBp0-PJ3NaZjpi2ojiP3BTf_CsQ46qJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_14,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301070002
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, Jessica Zhang <quic_jesszhan@quicinc.com>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel

Thanks for looking into this series.

On 1/6/2023 1:49 PM, Dmitry Baryshkov wrote:
> On Fri, 6 Jan 2023 at 20:41, Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Fri, Jan 06, 2023 at 05:43:23AM +0200, Dmitry Baryshkov wrote:
>>> On Fri, 6 Jan 2023 at 02:38, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 1/5/2023 3:33 AM, Daniel Vetter wrote:
>>>>> On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
>>>>>> Introduce and add support for a solid_fill property. When the solid_fill
>>>>>> property is set, and the framebuffer is set to NULL, memory fetch will be
>>>>>> disabled.
>>>>>>
>>>>>> In addition, loosen the NULL FB checks within the atomic commit callstack
>>>>>> to allow a NULL FB when the solid_fill property is set and add FB checks
>>>>>> in methods where the FB was previously assumed to be non-NULL.
>>>>>>
>>>>>> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
>>>>>> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
>>>>>> callstack to account for a NULL FB in cases where solid_fill is set.
>>>>>>
>>>>>> Some drivers support hardware that have optimizations for solid fill
>>>>>> planes. This series aims to expose these capabilities to userspace as
>>>>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
>>>>>> hardware composer HAL) that can be set by apps like the Android Gears
>>>>>> app.
>>>>>>
>>>>>> Userspace can set the solid_fill property to a blob containing the
>>>>>> appropriate version number and solid fill color (in RGB323232 format) and
>>>>>> setting the framebuffer to NULL.
>>>>>>
>>>>>> Note: Currently, there's only one version of the solid_fill blob property.
>>>>>> However if other drivers want to support a similar feature, but require
>>>>>> more than just the solid fill color, they can extend this feature by
>>>>>> creating additional versions of the drm_solid_fill struct.
>>>>>>
>>>>>> Changes in V2:
>>>>>> - Dropped SOLID_FILL_FORMAT property (Simon)
>>>>>> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
>>>>>> - Changed to checks for if solid_fill_blob is set (Dmitry)
>>>>>> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>>>>>>     (Dmitry)
>>>>>> - Removed DPU_PLANE_COLOR_FILL_FLAG
>>>>>> - Fixed whitespace and indentation issues (Dmitry)
>>>>>
>>>>> Now that this is a blob, I do wonder again whether it's not cleaner to set
>>>>> the blob as the FB pointer. Or create some kind other kind of special data
>>>>> source objects (because solid fill is by far not the only such thing).
>>>>>
>>>>> We'd still end up in special cases like when userspace that doesn't
>>>>> understand solid fill tries to read out such a framebuffer, but these
>>>>> cases already exist anyway for lack of priviledges.
>>>>>
>>>>> So I still think that feels like the more consistent way to integrate this
>>>>> feature. Which doesn't mean it has to happen like that, but the
>>>>> patches/cover letter should at least explain why we don't do it like this.
>>>>
>>>> Hi Daniel,
>>>>
>>>> IIRC we were facing some issues with this check [1] when trying to set
>>>> FB to a PROP_BLOB instead. Which is why we went with making it a
>>>> separate property instead. Will mention this in the cover letter.
>>>
>>> What kind of issues? Could you please describe them?
>>
>> We switched from bitmask to enum style for prop types, which means it's
>> not possible to express with the current uapi a property which accepts
>> both an object or a blob.
>>
>> Which yeah sucks a bit ...
>>
>> But!
>>
>> blob properties are kms objects (like framebuffers), so it should be
>> possible to stuff a blob into an object property as-is. Of course you need
>> to update the validation code to make sure we accept either an fb or a
>> blob for the internal representation. But that kind of split internally is
>> required no matter what I think.
> 
> I checked your idea and notes from Jessica. So while we can pass blobs
> to property objects, the prop_fb_id is created as an object property
> with the type DRM_MODE_OBJECT_FB. Passing DRM_MODE_OBJECT_BLOB would
> fail a check in drm_property_change_valid_get() ->
> __drm_mode_object_find(). And I don't think that we should break the
> existing validation code for this special case.
> 

Like Jessica wrote, re-using the FB_ID property to pass solid fill 
information will need modification of existing checks shown in [1] OR 
the property creation itself would fail.

We just went with this approach, as it was less intrusive and would not 
affect the existing FB_ID path.

Since both approaches need modifications of validation checks, adding a 
new property is less intrusive and safer than the already convoluted 
checks in drm_property_flags_valid().

Let us know if its a strong preference on your side to re-use FB_ID and 
if so why.

Thanks

Abhinav

> If you insist on using FB_ID for passing solid_fill information, I'd
> ask you to reconsider using a 1x1 framebuffer. It would be fully
> compatible with the existing userspace, which can then treat it
> seamlessly.
> 
>> -Daniel
>>
>>>
>>>>
>>>> [1]
>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_property.c#L71
> 
