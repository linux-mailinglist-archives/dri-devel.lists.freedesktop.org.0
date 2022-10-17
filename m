Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B08D60136E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D1410E348;
	Mon, 17 Oct 2022 16:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208110E348;
 Mon, 17 Oct 2022 16:28:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HG3KeI031996;
 Mon, 17 Oct 2022 16:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=60xV+pokAo84lrILwTyJMaGkHQPqhN9mPzhriNTOuRo=;
 b=Ltl8MfRphzyhnzjz8OLffELjgbv0n1dmHXriQvY4uiSIkgOyxWkJNtGhNNH7A2MCK0FP
 azgOR4voJfPe2RuT/919xJ62RCl5vdhPuSSLWUQLaeczN3R4JOQWrF58zhRQG56sUMhj
 j13MzJhdn4/969SnbqfjSz/o8svS47Ibv2PrJ5rHUgCpMFlkJKxcrSTPRg5a+ulZkEDI
 MMdUmUCV/XCproKOBDas+ZMx+pKZAKVUs/X0Qo+bpmRTsnQb/Ja4RlbwBK9AdMzyK5BB
 IvA6mZBuhZHAEiNGN59AE+WDcDLlGNiioFaVnvC8761+lh3VWudPUcdUbjCU7aBwUgDz wQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7m6ucebu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 16:28:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29HGSTEN010552
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 16:28:29 GMT
Received: from [10.111.167.160] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 17 Oct
 2022 09:28:25 -0700
Message-ID: <7557b80c-d4fb-efe1-7440-edb934f63487@quicinc.com>
Date: Mon, 17 Oct 2022 09:28:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v3 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
Content-Language: en-US
To: Caleb Connolly <caleb@connolly.tech>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185058.460688-1-marijn.suijten@somainline.org>
 <5c178d7e-5022-f5e5-791d-d3800114b42b@quicinc.com>
 <20221013093646.c65mbjc6oekd7gha@SoMainline.org>
 <32af4444-9c88-eb0f-eda7-24fa0418aff6@quicinc.com>
 <20221017085944.2r24uqg73irmziqm@SoMainline.org>
 <0642a664-3eed-21b7-a417-c6c607908f51@connolly.tech>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <0642a664-3eed-21b7-a417-c6c607908f51@connolly.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: w1IDz3mtBX6oAYMkDaydVeqIsDUdLPjM
X-Proofpoint-GUID: w1IDz3mtBX6oAYMkDaydVeqIsDUdLPjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 clxscore=1011 adultscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170095
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
Cc: Sean Paul <sean@poorly.run>, Newbyte <newbie13xd@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/17/2022 6:37 AM, Caleb Connolly wrote:
> 
> 
> On 17/10/2022 09:59, Marijn Suijten wrote:
>> On 2022-10-13 09:02:44, Abhinav Kumar wrote:
>>> On 10/13/2022 2:36 AM, Marijn Suijten wrote:
>>>> On 2022-10-12 16:03:06, Abhinav Kumar wrote:
>>>>> [..]
>>>>> But I would like to hold back this change till Vinod clarifies because
>>>>> Vinod had mentioned that with drm_dsc_compute_rc_parameters() he was
>>>>> seeing a mismatch in the computation of two values.
>>>>>
>>>>> slice_bpg_offset and the final_offset.
>>>>
>>>> Unsurprisingly so because final_offset, and slice_bpg_offset through
>>>> initial_offset depend directly on bits_per_pixel.  The main takeaway of
>>>> this series is that Vinod was interpreting this field as integer instead
>>>> of containing 4 fractional bits.  If he updates his the panel driver [1]
>>>> to set bits_per_pixel = 8 << 4 instead of just 8 to account for this,
>>>> the values should check out once again.
>>>>
>>>> [1]: https://git.linaro.org/people/vinod.koul/kernel.git/commit/?h=topic/pixel3_5.18-rc1&id=1d7d98ad564f1ec69e7525e07418918d90f247a1
>>>>
>>>> Once Vinod (or someone else in the posession of a Pixel 3) confirms
>>>> this, I can respin this series and more explicitly explain why the FIXME
>>>> was put in place, instead of being resolved outright?
>>>>
>>>> - Marijn
>>>
>>> Makes perfect sense to me.
>>>
>>> Will just wait for Vinod's tested-by.
>>
>> Unfortunately Vinod doesn't have access to this device anymore, but
>> Caleb recently sent the support series including display driver for
>> Pixel 3 and is picking up the testing.  User "Newbyte" from #linux-msm
>> promised to test on the LG G7 to have even more input samples.
> 
> Hi,
> 
> I'm hoping to pick the Pixel 3 stuff back up at some point, but right now there
> seem to be quite a few issues outside of DSC which make testing it a bit of a pain.
> 
> I gave Marijn's series [1] a go but wasn't able to get anything usable out of the
> panel, however I doubt this is a DSC issue as I've always needed some hacks to
> get the panel working - I've never had any success with it without skipping both
> the initial panel reset and sending the PPS payload.
> 
> I think if Marijn has managed to initialise a panel properly then the lack of
> Pixel 3 for validation shouldn't be a blocker to merge these fixes.
> 
> [1]:
> https://lore.kernel.org/linux-arm-msm/20221009184824.457416-1-marijn.suijten@somainline.org/
> 
>>
>> - Marijn

Alright, the onus is then on Vinod/ users of pixel3 to report/debug 
whatever issues arise out of this computation.

Patch itself LGTM, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
> --
> Kind Regards,
> Caleb
> 
