Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2273977BF77
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 20:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F5810E225;
	Mon, 14 Aug 2023 18:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3070B10E225
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 18:02:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37EF8ZNs026801; Mon, 14 Aug 2023 18:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UNpVzQ4CMH+jlXb43JIfY+cDSdv9lcGGxee2ap9UWU4=;
 b=ORLoqQU2AuraEppgxCeYnw94c85s3RLg5fKNecf4Awv1Ml+V6/NozBqISg4TEbYR8nx/
 VikH7UIcOzzFxtBMzEnzlu3XQt4fDyHx40xs8XOfny2+YXlrvX0+Xotuij2W34IU7UrU
 5KnQcwHblJo8/tIrqpAOTxf0uLoVcN5Q3C1DRzkMcb92NAhQppXi5gMvVSDCHw1bO0XA
 JXARDpBtwHPAo+YnSPxSWUBzSC5uH4uERab/HHofiM3R+8sN7ErbO1SVsIIvmnr/3GvR
 8LG9UyAXV7messvqGH4FjsZ6OJardmwl4Oxvs07MlJ3LIrdC/pFcJ0q/3zMwVk5EZdNx JQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3se40rmf5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Aug 2023 18:02:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37EI2nF5021222
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Aug 2023 18:02:49 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 14 Aug
 2023 11:02:48 -0700
Message-ID: <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
Date: Mon, 14 Aug 2023 11:02:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: p7f1EE0LqDINZI6rLBFQZuxEHTysgEP8
X-Proofpoint-GUID: p7f1EE0LqDINZI6rLBFQZuxEHTysgEP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_15,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140167
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
Cc: quic_parellan@quicinc.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil

On 8/14/2023 1:01 AM, neil.armstrong@linaro.org wrote:
> Hi Abhinav,
> 
> On 10/08/2023 18:26, Abhinav Kumar wrote:
>> Hi Neil
>>
>> On 8/3/2023 10:19 AM, Jessica Zhang wrote:
>>>
>>>
>>> On 7/31/2023 6:00 AM, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 26/07/2023 00:56, Jessica Zhang wrote:
>>>>> Due to a recent introduction of the pre_enable_prev_first bridge 
>>>>> flag [1],
>>>>> the panel driver will be probed before the DSI is enabled, causing the
>>>>> DCS commands to fail to send.
>>>>>
>>>>> Ensure that DSI is enabled before panel probe by setting the
>>>>> prepare_prev_first flag for the panel.
>>>>
>>>> Well this is specific to MSM DSI driver, it's not related at all to 
>>>> the panel.
>>>
>>
>> I dont fully agree this is a MSM DSI driver specific thing.
>>
>> If the panel can send its commands in its enable() callback, then this 
>> flag need not be set.
>>
>> When a panel sends its DCS commands in its pre_enable() callback, any 
>> DSI controller will need to be ON before that otherwise DCS commands 
>> cannot be sent.
>>
>> With this in mind, may I know why is this a MSM change and not a panel 
>> change?
>>
>> As per my discussion with Dmitry during the last sync up, we were 
>> aligned on this expectation.
> 
> As of today, only the MSM DSI driver expects panels to have 
> prepare_prev_first because it's the first
> one calling pre_enable() before the DSI controller to be on, all other 
> DSI drivers I know
> still enables the DSI controller in mode_set() and thus can send 
> commands in pre_enable() which
> is a loose way to map the pre-video state for DSI panels...
> 

It looks like there are multiple panels already setting this flag so 
this panel will not be the first unless they were added to make those 
work with MSM (which seems unlikely)

panel-samsung-s6d7aa0.c:        ctx->panel.prepare_prev_first = true;
panel-samsung-s6e3ha2.c:        ctx->panel.prepare_prev_first = true;
panel-samsung-s6e63j0x03.c:     ctx->panel.prepare_prev_first = true;
panel-samsung-s6e8aa0.c:        ctx->panel.prepare_prev_first = true;

This is where I would like to understand a bit that if the panel sends 
out the ON commands in enable() instead of pre_enable() then, this flag 
will not be needed. So its also depends on the panel side and thats why
the bridge feeds of the panel's input in devm_drm_panel_bridge_add_typed()

bridge->pre_enable_prev_first = panel->prepare_prev_first;

> A panel driver should not depend on features of a DSI controller, which 
> is the case here
> with this patch. Today's expectation is to send DSI commands in 
> pre_enable() then when enabled
> expect to be in video mode when enable() is called.
> 

We are not depending on any feature as such. Any DSI controller , not 
just MSM's would need to be ON for DCS commands to be sent out in the 
panel's pre_enable() callback.

Its not true that MSM is the only driver powering on the DSI controller 
in pre_enable(). Even MTK seems to be doing that

mtk_dsi_bridge_atomic_pre_enable

So I assume any panel which sends out commands in pre_enable() will not 
work with MTK as well.

> The main reason is because some DSI controllers cannot send LP commands 
> after switching
> to video mode (allwinner for example), so we must take this into account.
> 
> For v6.6, I don't see other solutions than reverting 9e15123eca79 
> (reverting won't regress anything,
> because now it regresses also other panels on MSM platforms) and try to 
> find a proper solution for v6.7...
> 

No, I would prefer not to revert that. It will bring back special 
handling for the parade chip into MSM driver, something which I would 
prefer not to go back to. Powering on the DSI in modeset() was done only 
for the parade chip.

> Neil
> 
>>
>> Thanks
>>
>> Abhinav
>>
>>> Hi Neil,
>>>
>>> I think there might be some confusion caused by the commit message -- 
>>> instead of "enabled before panel probe", it should be "enabled before 
>>> panel pre_enable()" as the panel on commands are sent during 
>>> prepare(), which is matched to bridge pre_enable().
>>>
>>> IIRC the general rule is that the panel driver should set the 
>>> prepare_prev_first flag if the on commands are sent during 
>>> pre_enable(), so I'll keep the code change but correct the commit 
>>> message if that's ok with you.
>>>
>>> Thanks,
>>>
>>
>>> Jessica Zhang
>>>
>>>>
>>>> Neil
>>>>
>>>>>
>>>>> [1] commit 4fb912e5e190 ("drm/bridge: Introduce 
>>>>> pre_enable_prev_first to alter bridge init order")
> 
> It's not the right commit that cause regression here, it's :
> 
> 9e15123eca79 drm/msm/dsi: Stop unconditionally powering up DSI hosts at 
> modeset
> 
>>>>>
>>>>> Fixes: 2349183d32d8 ("drm/panel: add visionox vtdr6130 DSI panel 
>>>>> driver")
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c 
>>>>> b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>> index bb0dfd86ea67..e1363e128e7e 100644
>>>>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>> @@ -296,6 +296,7 @@ static int visionox_vtdr6130_probe(struct 
>>>>> mipi_dsi_device *dsi)
>>>>>       dsi->format = MIPI_DSI_FMT_RGB888;
>>>>>       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | 
>>>>> MIPI_DSI_MODE_NO_EOT_PACKET |
>>>>>                 MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>>> +    ctx->panel.prepare_prev_first = true;
>>>>>       drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
>>>>>                  DRM_MODE_CONNECTOR_DSI);
>>>>>
>>>>> ---
>>>>> base-commit: 28a5c036b05fc5c935cc72d76abd3589825ea9cd
>>>>> change-id: 20230717-visionox-vtdr-prev-first-e00ae02eec9f
>>>>>
>>>>> Best regards,
>>>>
> 
