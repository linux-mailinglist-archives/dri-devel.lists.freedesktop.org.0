Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8604685C4BF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190BA10E535;
	Tue, 20 Feb 2024 19:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nuplWMYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42AC10E531;
 Tue, 20 Feb 2024 19:27:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KJFiSS021818; Tue, 20 Feb 2024 19:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Q/plVcvO1WfGsPITbLbiTiRdy4hEFuw8/6lXwDmsHPM=; b=nu
 plWMYPEUkmuINkMR38btt45QYliCGPf55CFvrW3Uz83CkZcv/ITO2biVEbPeqP6P
 13VJfCH2wbws0zb/6Fxt5KUV7dZCpl3VO3zAiRi4XtVdKpSaoyw7eHxM0/aQjufU
 fkJWURSI57zkUX4jGFri+l2a9OI6mz8SJXAbfb7Ux6+E1xZOyTo9QUfgkUBSXmug
 pDE8d7EsYSxKFf57o4GN9vZJ1SOXuHLY2+R0ricV4Xwvc+oHGjAhF46h1nC4wNRv
 UXk1auZg0QWawVpyRpk64pDfT4d7EgsvIqW/sV0KfXTutZeqVxX+4Z/BQOjs1lBf
 Z0tWeEGgg35BhvLZOxCA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd230r0th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:27:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KJRJue006072
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:27:19 GMT
Received: from [10.110.62.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 11:27:18 -0800
Message-ID: <ec5ee910-469e-4224-28ca-336c9f589057@quicinc.com>
Date: Tue, 20 Feb 2024 11:27:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>,
 <robdclark@gmail.com>, <freedreno@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <quic_jesszhan@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>
References: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
 <CAA8EJppQquHgSgCrxKZHPHk248Pxg7Q8mvmmjbcpUxpreQkcuA@mail.gmail.com>
 <d3674c10-5c29-d917-44f5-758d90d9e679@quicinc.com>
 <CAA8EJpqaG+fBA_FO-L7Bimtjqqg3ZDQtyJL0oPFEueb-1WxjUw@mail.gmail.com>
 <CAA8EJpoeb63QRddxawm2J0s8O0XrLQBrDuYXOB=ZtzDG7mu2PQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoeb63QRddxawm2J0s8O0XrLQBrDuYXOB=ZtzDG7mu2PQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YVP7otHqJ9hM93Bim4XH1u-F1NYtMoJb
X-Proofpoint-GUID: YVP7otHqJ9hM93Bim4XH1u-F1NYtMoJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=525
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402200139
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



On 2/20/2024 11:20 AM, Dmitry Baryshkov wrote:
> On Tue, 20 Feb 2024 at 21:05, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Tue, 20 Feb 2024 at 20:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 2/20/2024 10:49 AM, Dmitry Baryshkov wrote:
>>>> On Thu, 15 Feb 2024 at 21:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
>>>>> Lets move this to drm_dp_helper to achieve this.
>>>>>
>>>>> changes in v2:
>>>>>           - rebased on top of drm-tip
>>>>>
>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>
>>>> v1 had an explicit comment before the ack:
>>>>
>>>
>>> Yes, I remember the comment. I did not make any changes to v2 other than
>>> just rebasing it on drm-tip to get the ack from i915 folks.
>>>
>>>>>      From my side, with the promise of the size fixup.
>>>>
>>>> However I observe neither a second patch removing the size argument
>>>> nor it being dropped as a part of this patch.
>>>>
>>>
>>> Yes, now that in v2 we got the ack for this patch, I can spin a v3 with
>>> the addition of the next patch to remove the size OR as another series
>>> so as to not block the main series which needs this patch.
>>>
>>> I would prefer the latter.
>>
>> It doesn't work this way. The comment should have been fixed for v2.
> 
> This probably deserves some explanation. Currently there is only one
> user of this function. So it is easy to fix it. Once there are several
> users, you have to fix all of them at the same time, patching
> different drm subtrees. That complicates the life of maintainers.
> 

Yes, understood. Its easier to fix it now if its really needed.

Actually, I think the reason the size was passed was to make sure
a valid struct dp_sdp *sdp was being passed.

If we drop the size, we need to have a if (!sdp) check as there is a 
memset followed by dereference.

So maybe, if we want to keep this API protected, its not too bad to have?

