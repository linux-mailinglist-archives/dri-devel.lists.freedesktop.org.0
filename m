Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680407E2BA0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F8B10E03A;
	Mon,  6 Nov 2023 18:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD3C10E03A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 18:07:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A6HTTTc000369; Mon, 6 Nov 2023 18:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nETqSnSYD+nVyeAtm/Qlmd6HanYcAr/2Ev263z4J3ZQ=;
 b=V6iHNuN3mV0drat9Csy6LAVIuwECcCpLlm9tB3JoaweYtIAIJlkZJkd+D4OQHWyHale3
 SueXbOSjyBm0en2JwW/klupK7jZTMEvxGXaBkkSUS5Gm+XbkYLQyUZa5z5iesbiv9MgY
 xDFeL2Xmi6Zp80MnVWg/CgSOI8tdcMUGbKck82HncB0dYdM7ilGjg9xAkKBMFPV4B2QC
 UEanmKcAC3GZm833S38IJrmIhIYNR3kBGG88NGw4aMBFvcFMBKy/yumGKb8I4LkVt5M3
 T+RPGnqP4LyO7FgiGYYT10HDgWbTA/xU9cLoYaTis0lahbk2wO4E8JN9ggQbqburVwAi uA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u6yehs1w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Nov 2023 18:07:04 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6I73jT023546
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Nov 2023 18:07:03 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 6 Nov
 2023 10:07:02 -0800
Message-ID: <74a0b395-5ab9-4fcc-bc1c-fc8d2714da98@quicinc.com>
Date: Mon, 6 Nov 2023 10:07:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: starry-2081101qfh032011-53g: Fine tune the
 panel power sequence
Content-Language: en-US
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231102130844.13432-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <6b80dfa4-66d2-40fc-bf3b-88a8ada09b50@quicinc.com>
 <CADYyEwQzDoN83y2NGL6QvgaUSthzONoaHZ6HSKYpuY1EuZe-cQ@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CADYyEwQzDoN83y2NGL6QvgaUSthzONoaHZ6HSKYpuY1EuZe-cQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: axNikcc_GGbUrmx-KYePhbyKs_5kyeoW
X-Proofpoint-ORIG-GUID: axNikcc_GGbUrmx-KYePhbyKs_5kyeoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_13,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060148
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
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, dri-devel@lists.freedesktop.org,
 xuxinxiong@huaqin.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/3/2023 11:55 PM, Zhengqiao Xia wrote:
> Hi  Jessica ,
> 
>> Fixes: 6069b66cd962 ("drm/panel: support for STARRY 2081101QFH032011-53G
> MIPI-DSI panel")
> 
> I'm not very familiar with this upstream process, Where should I add these?

You can add the Fixes tag before the signed-off-by. For example [1]:

Fixes: 01d6c3578379 ("drm/syncobj: add support for timeline point wait v8")
Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
<...>

Thanks,

Jessica Zhang

[1] 
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=101c9f637efa1655f55876644d4439e552267527

> 
> Thanks
> 
> 
> On Sat, Nov 4, 2023 at 2:40 AM Jessica Zhang <quic_jesszhan@quicinc.com>
>> wrote:
>>
>>
>> On 11/2/2023 6:08 AM, xiazhengqiao wrote:
>>> For "starry, 2081101qfh032011-53g" this panel, it is stipulated in the
>> Hi Zhengqiao,
>> Nit: Can you reword this to "For the "starry, 2081101qfh032011-53g"
>> panel..."?
>>> panel spec that MIPI needs to keep the LP11 state before the
>>> lcm_reset pin is pulled high.
>> Was this fixing some panel issue? If so, maybe we can add
>> Fixes: 6069b66cd962 ("drm/panel: support for STARRY 2081101QFH032011-53G
>> MIPI-DSI panel")
>> Otherwise, with the commit msg fix, this looks good to me:
>> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Thanks,
>> Jessica Zhang
>>
>>
>>>
>>> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com
>>>
>>
>> ---
>>>    drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
>> b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
>>> index 4f370bc6dca8..4ed8c2e28d37 100644
>>> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
>>> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
>>> @@ -1765,6 +1765,7 @@ static const struct panel_desc
>> starry_qfh032011_53g_desc = {
>>>        .mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE
>> |
>>>                      MIPI_DSI_MODE_LPM,
>>>        .init_cmds = starry_qfh032011_53g_init_cmd,
>>> +     .lp11_before_reset = true,
>>>    };
>>>
>>>    static const struct drm_display_mode
>> starry_himax83102_j02_default_mode = {
>>> --
>>> 2.17.1
>>>
>>
> 
