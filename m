Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBE8804D2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 19:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5B210FC4D;
	Tue, 19 Mar 2024 18:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UNRh8UTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0897E10FC4D;
 Tue, 19 Mar 2024 18:27:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42JHGheX022789; Tue, 19 Mar 2024 18:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=lrM5iCYsYQcepW3Ml6eTEfI3q3rWCXgbzBMB5LNHyFI=; b=UN
 Rh8UTBXpAg2ol3SfFkYVQ/eYQ1FmDEQzlVhrdQNUwn+yot7f0IF5BIZLHroVK92V
 AaEudiSerVtQBu3It2cnT4nTt81v4H68SQoOYF4fVEurqkbIvcOeXPSHyUn3yVCr
 Hiu/jyT3K5OhmUWDSetjAlfzQm1R/SYfOYfOMzeC4CfYwqbCfKcGft9zpYamAD40
 wPOlOceet2J2dbVeN1d01FgdLbV1QkfkR22v70ueDjw+Nv38og5bILNxZYk/dCr1
 elvIqWE5o5JYfeVPmlTr/mLV5NQNzvQAlgJS21j032TlNAwchKkpfuDnAlKQm/Js
 6UwMlFw8L7sK3LzEJ8kw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wye5n8bsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 18:27:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JIRnCc021855
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 18:27:49 GMT
Received: from [10.110.10.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 11:27:45 -0700
Message-ID: <591d1c33-df3d-7ab6-9cb7-1422784a8e51@quicinc.com>
Date: Tue, 19 Mar 2024 11:27:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD
 in aux transfer
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Bjorn
 Andersson" <quic_bjorande@quicinc.com>, Johan Hovold <johan@kernel.org>
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
 <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
 <CAA8EJppau--vt3RLkH96K0SF2x-QGWz+5U8tErvLFDvz-GQN4Q@mail.gmail.com>
 <d04711c1-6df0-f988-9227-2161f4109dd1@quicinc.com>
 <CAA8EJppcuftv4hfKkZeaXCDQJ4Z5+8-P99wHc9X8WgYJbk6CjA@mail.gmail.com>
 <CAD=FV=WMbqmU1q+6hJZV9a16PdPUtdDJuMmsQ1wb27jDdeQFmg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=WMbqmU1q+6hJZV9a16PdPUtdDJuMmsQ1wb27jDdeQFmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: z58_Rk1BEtCbOiC1XWt1f-Zh2r70tjax
X-Proofpoint-ORIG-GUID: z58_Rk1BEtCbOiC1XWt1f-Zh2r70tjax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190140
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



On 3/19/2024 11:15 AM, Doug Anderson wrote:
> Hi,
> 
> On Tue, Mar 19, 2024 at 10:27 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Tue, 19 Mar 2024 at 19:13, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 3/18/2024 5:55 PM, Dmitry Baryshkov wrote:
>>>> On Tue, 19 Mar 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>> +bjorn, johan as fyi for sc8280xp
>>>>>
>>>>> On 3/15/2024 2:36 PM, Douglas Anderson wrote:
>>>>>> Before the introduction of the wait_hpd_asserted() callback in commit
>>>>>> 841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
>>>>>> drm_dp_aux") the API between panel drivers and DP AUX bus drivers was
>>>>>> that it was up to the AUX bus driver to wait for HPD in the transfer()
>>>>>> function.
>>>>>>
>>>>>> Now wait_hpd_asserted() has been added. The two panel drivers that are
>>>>>> DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: Take
>>>>>> advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
>>>>>> 3b5765df375c ("drm/panel: atna33xc20: Take advantage of
>>>>>> wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
>>>>>> wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
>>>>>> ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There is
>>>>>> no longer any reason for long wait in the AUX transfer() function.
>>>>>> Remove it.
>>>>>>
>>>>>> NOTE: the wait_hpd_asserted() is listed as "optional". That means it's
>>>>>> optional for the DP AUX bus to implement. In the case of the MSM DP
>>>>>> driver we implement it so we can assume it will be called.
>>>>>>
>>>>>
>>>>> How do we enforce that for any new edp panels to be used with MSM, the
>>>>> panels should atleast invoke wait_hpd_asserted()?
>>>>>
>>>>> I agree that since MSM implements it, even though its listed as
>>>>> optional, we can drop this additional wait. So nothing wrong with this
>>>>> patch for current users including sc8280xp, sc7280 and sc7180.
>>>>>
>>>>> But, does there need to be some documentation that the edp panels not
>>>>> using the panel-edp framework should still invoke wait_hpd_asserted()?
>>>>>
>>>>> Since its marked as optional, what happens if the edp panel driver,
>>>>> skips calling wait_hpd_asserted()?
>>>>
>>>> It is optional for the DP AUX implementations, not for the panel to be called.
>>>>
>>>
>>> Yes, I understood that part, but is there anything from the panel side
>>> which mandates calling wait_hpd_asserted()?
>>>
>>> Is this documented somewhere for all edp panels to do:
>>>
>>> if (aux->wait_hpd_asserted)
>>>          aux->wait_hpd_asserted(aux, wait_us);
>>
>> That's obviously not true, e.g. if panel-edp.c handled HPD signal via
>> the GPIO pin.
>>
>> But the documentation explicitly says that the host will be powered up
>> automatically, but the caller must ensure that the panel is powered
>> on. `It's up to the caller of this code to make sure that the panel is
>> powered on if getting an error back is not OK.'
> 
> It wouldn't hurt to send out a documentation patch that makes this
> more explicit. OK, I sent:
> 
> https://lore.kernel.org/r/20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid
> 
> -Doug

Thanks, with that in place, this is

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
