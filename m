Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83579D68E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C077A10E43B;
	Tue, 12 Sep 2023 16:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043EB10E43B;
 Tue, 12 Sep 2023 16:42:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38C9S7Cm011359; Tue, 12 Sep 2023 16:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AsHXnwwbd7YXERWnnmLVg0c25HPkD9xWV8YP8pooxf0=;
 b=mxllP2p9q+5EdPMYjhbRhcIeIB4LU1PZuigR6UfU3OTOWOlb0nen09hAYNVgaEFNmUiR
 MgC+UdeOiql1NvBf2ZRFPsBhmZ1ng55sy77h8IXnfwKs6RpSZBbuD20bSKIz8tAKUdbE
 U6Ke9gCkknLHh5h2GT2BXKuWgxnXIEFHDhuKTKSkKQYTzVwgWk32X6XYeH1nIl/+YZ0S
 1sWleM6NmulzDmfLOXqvUEw5xboKBc9erGmE0INdJOWXm5PlA/MQ4Z+cYD97iXTMIzFf
 ioTiqHHuQVGnmJ1mzFKrhtmzdtb9Cr3xHOGQcLY+ecRDPfTL5rPYp0/CFTPs7z4ykSzp zQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2ncp19md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Sep 2023 16:41:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CGfgQv001003
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Sep 2023 16:41:42 GMT
Received: from [10.71.110.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 09:41:40 -0700
Message-ID: <36b5dd86-0532-882a-4220-33b38fab2a63@quicinc.com>
Date: Tue, 12 Sep 2023 09:41:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: skip validity check for DP CTS
 EDID checksum
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Stephen Boyd <swboyd@chromium.org>,
 <dri-devel@lists.freedesktop.org>
References: <20230901142034.580802-1-jani.nikula@intel.com>
 <CAE-0n52T4VGVVKqZCJwhpxe=vLUb7WNi=J0hdsHFOqA95u-Ymg@mail.gmail.com>
 <877covy4bl.fsf@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <877covy4bl.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 69tF28V0oyckKYoNOHdDKVSMpFy5Sg-G
X-Proofpoint-ORIG-GUID: 69tF28V0oyckKYoNOHdDKVSMpFy5Sg-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_16,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120140
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani

On 9/12/2023 5:16 AM, Jani Nikula wrote:
> On Thu, 07 Sep 2023, Stephen Boyd <swboyd@chromium.org> wrote:
>> Quoting Jani Nikula (2023-09-01 07:20:34)
>>> The DP CTS test for EDID last block checksum expects the checksum for
>>> the last block, invalid or not. Skip the validity check.
>>>
>>> For the most part (*), the EDIDs returned by drm_get_edid() will be
>>> valid anyway, and there's the CTS workaround to get the checksum for
>>> completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
>>> correct edid checksum after corrupted edid checksum read").
>>>
>>> This lets us remove one user of drm_edid_block_valid() with hopes the
>>> function can be removed altogether in the future.
>>>
>>> (*) drm_get_edid() ignores checksum errors on CTA extensions.
>>>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
>>> Cc: Marijn Suijten <marijn.suijten@somainline.org>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Cc: Stephen Boyd <swboyd@chromium.org>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: freedreno@lists.freedesktop.org
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> ---
>>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Thanks; is that enough to merge? I can't claim I would have been able to
> test this.
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Change looks fine.

We can pick this up in the MSM tree if you would like.

Dmitry, you can please pick this up along with my R-b and Kuogee's R-b 
as well.

I think his R-b got misformatted. I can ask him to add that again.

>>
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> index 42d52510ffd4..86a8e06c7a60 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> @@ -289,26 +289,9 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>>>
>>>   static u8 dp_panel_get_edid_checksum(struct edid *edid)
>>
>> It would be nice to make 'edid' const here in another patch.
> 
> Sure.
> 
> BR,
> Jani.
> 
> 
