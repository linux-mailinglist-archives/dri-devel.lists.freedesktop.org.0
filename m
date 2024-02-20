Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132E685C527
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E410F10E548;
	Tue, 20 Feb 2024 19:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="DV4QxXmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7664B10E53A;
 Tue, 20 Feb 2024 19:49:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KJHC7V026576; Tue, 20 Feb 2024 19:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=wHY6PYvLQf215IOV3qlVWkbLXtnGBZFaxRHgDZ5ic08=; b=DV
 4QxXmif7PlAWsVMsdp3+uBVY6++WXxQBVxRz+8mqJMUvXSYQ6Rzcm2vXbVBilH4O
 yoRXY2p0fn0SK2V1fynO6piaI1UJ5lsekDe/8+XsZUJFeBcedNpgev3K5kJikk9g
 iGQ92qJs3BNAJa3g3SVazZDyrpE+rqdLM5g1RtDQjMaY40FofH7vJ/6kNgsuYz48
 R9KzjrIOdCmlo60roSGdXZhw2zoUzFhD3DVZGfjRVYndJiAg80L6b4QqXmD37dRL
 ivRgu1zlN29HlU7R1PX2i6NDxoWK7Z3yw3IiHkmDoOeUxFlG3KxP1YYKneLlBJCJ
 1CQxOjAGiDreFPsj2uPg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd2360294-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:49:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KJn7XD002416
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:49:07 GMT
Received: from [10.110.62.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 11:49:06 -0800
Message-ID: <16a720e8-f3bb-2059-3b7a-65311c3aaa64@quicinc.com>
Date: Tue, 20 Feb 2024 11:49:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>,
 <robdclark@gmail.com>, <freedreno@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>
References: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
 <CAA8EJppQquHgSgCrxKZHPHk248Pxg7Q8mvmmjbcpUxpreQkcuA@mail.gmail.com>
 <d3674c10-5c29-d917-44f5-758d90d9e679@quicinc.com>
 <CAA8EJpqaG+fBA_FO-L7Bimtjqqg3ZDQtyJL0oPFEueb-1WxjUw@mail.gmail.com>
 <CAA8EJpoeb63QRddxawm2J0s8O0XrLQBrDuYXOB=ZtzDG7mu2PQ@mail.gmail.com>
 <ec5ee910-469e-4224-28ca-336c9f589057@quicinc.com>
 <ZdUAZZIO5Zk2Y8Wm@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZdUAZZIO5Zk2Y8Wm@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jrreOZvRVsFXGxE3Iy84fNvoQ2Rx1lER
X-Proofpoint-ORIG-GUID: jrreOZvRVsFXGxE3Iy84fNvoQ2Rx1lER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=518 impostorscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402200142
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



On 2/20/2024 11:41 AM, Ville Syrjälä wrote:
> On Tue, Feb 20, 2024 at 11:27:18AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 2/20/2024 11:20 AM, Dmitry Baryshkov wrote:
>>> On Tue, 20 Feb 2024 at 21:05, Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On Tue, 20 Feb 2024 at 20:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 2/20/2024 10:49 AM, Dmitry Baryshkov wrote:
>>>>>> On Thu, 15 Feb 2024 at 21:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>>
>>>>>>> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
>>>>>>> Lets move this to drm_dp_helper to achieve this.
>>>>>>>
>>>>>>> changes in v2:
>>>>>>>            - rebased on top of drm-tip
>>>>>>>
>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>
>>>>>> v1 had an explicit comment before the ack:
>>>>>>
>>>>>
>>>>> Yes, I remember the comment. I did not make any changes to v2 other than
>>>>> just rebasing it on drm-tip to get the ack from i915 folks.
>>>>>
>>>>>>>       From my side, with the promise of the size fixup.
>>>>>>
>>>>>> However I observe neither a second patch removing the size argument
>>>>>> nor it being dropped as a part of this patch.
>>>>>>
>>>>>
>>>>> Yes, now that in v2 we got the ack for this patch, I can spin a v3 with
>>>>> the addition of the next patch to remove the size OR as another series
>>>>> so as to not block the main series which needs this patch.
>>>>>
>>>>> I would prefer the latter.
>>>>
>>>> It doesn't work this way. The comment should have been fixed for v2.
>>>
>>> This probably deserves some explanation. Currently there is only one
>>> user of this function. So it is easy to fix it. Once there are several
>>> users, you have to fix all of them at the same time, patching
>>> different drm subtrees. That complicates the life of maintainers.
>>>
>>
>> Yes, understood. Its easier to fix it now if its really needed.
>>
>> Actually, I think the reason the size was passed was to make sure
>> a valid struct dp_sdp *sdp was being passed.
> 
> The size is supposed to be the size of *hardware* buffer where this
> gets written into. But looks like this wasn't done correctly when
> the code was copy-pasted from the HDMI inforframe code.
> 

Alright, in that case, let me post a patch to drop this and let me know 
if that works for you.
