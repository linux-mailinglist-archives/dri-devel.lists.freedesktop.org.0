Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EEF5F563F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 16:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B196310E635;
	Wed,  5 Oct 2022 14:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91C810E635;
 Wed,  5 Oct 2022 14:19:23 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 295EJHIL022889;
 Wed, 5 Oct 2022 14:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lOKUdL4SfmoA4A/iH/3PevuocbiAUEp6EmppSdK48jc=;
 b=XKLXoQM5btz9Gums2sa3wp0H7zSpVg9qp9Od6Kdba1Ozp3iiMn+4G/wJ8sZcuQ7xV7Mc
 hlBdLT+GQJ0YpOjIH9vRq3Lqy5Aw8LAFpi2M6m6HjhibfvZrNB3fNdHnPfSFvQDAeNWZ
 HgoEaG4VhGiHaOd+y5ZdyUxOz9K0xpPKGnCi/rwaFN0Wnz4mgl1Yo7BBo5wWL4wt4YD1
 DVTM0i3oI0+bUcSey5kvth3nXIUWIlS/ydZVOEg6MBiG9Ms/q1B31zBGZinJZ9j8bYmV
 KOkisajbZqZsDyggodwo6xWViTyOl1KhgbqeEhsZiuNssMWCkDRROOFkfS7gCW4J7yR9 OA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k15shggwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 14:19:17 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 295EEN17027124; 
 Wed, 5 Oct 2022 14:19:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3jxemkxjsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 14:19:16 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 295EGhcA029167;
 Wed, 5 Oct 2022 14:19:15 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 295EJFLW031723
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 14:19:15 +0000
Received: from [10.38.242.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 5 Oct 2022
 07:19:13 -0700
Message-ID: <3bf05883-e8dc-5e11-ed83-7f8f7b801737@quicinc.com>
Date: Wed, 5 Oct 2022 07:19:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 4/5] drm/msm/dpu1: Account for DSC's bits_per_pixel having
 4 fractional bits
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, <freedreno@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jami Kettunen
 <jami.kettunen@somainline.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 <linux-arm-msm@vger.kernel.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, <dri-devel@lists.freedesktop.org>, Javier
 Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, Alex Deucher
 <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 <linux-kernel@vger.kernel.org>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-5-marijn.suijten@somainline.org>
 <7f7a5d78-e50f-b6af-bb3e-bbfbc7fa5f75@quicinc.com>
 <20221004221134.roino4u2waawgh6u@SoMainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221004221134.roino4u2waawgh6u@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eawUBwmjs2ZNif2dVeoV7CCQHHci12b7
X-Proofpoint-ORIG-GUID: eawUBwmjs2ZNif2dVeoV7CCQHHci12b7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_03,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210050090
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



On 10/4/2022 3:11 PM, Marijn Suijten wrote:
> On 2022-10-04 10:03:07, Abhinav Kumar wrote:
>>
>>
>> On 10/1/2022 12:08 PM, Marijn Suijten wrote:
>>> According to the comment this DPU register contains the bits per pixel
>>> as a 6.4 fractional value, conveniently matching the contents of
>>> bits_per_pixel in struct drm_dsc_config which also uses 4 fractional
>>> bits.  However, the downstream source this implementation was
>>> copy-pasted from has its bpp field stored _without_ fractional part.
>>>
>>> This makes the entire convoluted math obsolete as it is impossible to
>>> pull those 4 fractional bits out of thin air, by somehow trying to reuse
>>> the lowest 2 bits of a non-fractional bpp (lsb = bpp % 4??).
>>>
>>> The rest of the code merely attempts to keep the integer part a multiple
>>> of 4, which is rendered useless thanks to data |= dsc->bits_per_pixel <<
>>> 12; already filling up those bits anyway (but not on downstream).
>>>
>>> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> Many of this bugs are because the downstream code from which this
>> implementation was derived wasnt the latest perhaps?
> 
> Perhaps, this code is "identical" to what I'm looking at in some
> downstream 4.14 / 4.19, where the upstream struct for DSC either wasn't
> there or wasn't used.  We have to find and address these bugs one by one
> to make our panels work, and this series gets one platform (sdm845) down
> but has more work pending for others (sm8250 has my current focus).
> 
> Or are you suggesting to "redo" the DSC integration work based on a
> (much) newer display techpack (SDE driver)?

There is no need to redo the DSC integration now.

The code I am referring to is here :

https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.2.0.r1-08000-WAIPIO.0/msm/sde_dsc_helper.c#L240

So with respect to the redundant math in patches 1/3/4/5 of this series, 
I dont see all the redundant math anymore in this calculation.

This is what i meant by my comment.

When DSC changes were pushed, they were indeed validated on sdm845 
devices by Vinod so there was a certain level of confidence on those 
changes.

At this point, we should just consider these as bug-fixes for upstream 
and keep going. A full redo is not required.

At some point in the next couple of months, we plan to add DSC 1.2 
support to MSM.

We will check for any missing changes (if any after this series of 
yours) and push those as part of that.

> 
>> Earlier, downstream had its own DSC struct maybe leading to this
>> redundant math but now we have migrated over to use the upstream struct
>> drm_dsc_config.
> 
> Found the 3-year-old `disp: msm: use upstream dsc config data` commit
> that makes this change.  It carries a similar comment:
> 
>      /* integer bpp support only */
> 
> The superfluous math was howerver removed earlier, in:
> 
>      disp: msm: fix dsc parameters related to 10 bpc 10 bpp
> 
> - Marijn
> 
>> That being said, this patch LGTM
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
