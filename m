Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266DA83F404
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CFF10E9EA;
	Sun, 28 Jan 2024 05:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E0F10E9EA;
 Sun, 28 Jan 2024 05:18:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40S5ElDt028254; Sun, 28 Jan 2024 05:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=nZiVulOt37XJzylHbZUcqMZBF0/4DxHnv2XxTR63kzs=; b=GN
 aUEc+t7R/26+6hwnVf+kO+w0ycPIzNlYef81QI0eRqJQnHrhBecjF9d6qY7e7amN
 tosoOLG0SbstI3wCg7G7ef2P7U+qKJ9y+iz96/dJmOr8GUslR7O2rhPW7tKVPOQl
 QJoyXnB0R6GKwk8Wvu8S4ZAv9eKCpdU5wZZ25HR9YY1RuCcgwSo6W6QsYN21K2b6
 6Bk8WPq++ZPwypyjk+ticjOIBUweoN1HRFUX/iq7DmHr5pfWjyNF42Xv9QMfY5bW
 /cttYfny470DgcAiBNg1gtWD+V9brrxEzsUU7IbQnqWoemy6X9tVzU5NsLZYF7UQ
 wLQmdkXu17QhF+q91UBQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvtkm9c5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:18:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40S5IpRT003498
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jan 2024 05:18:51 GMT
Received: from [10.110.54.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 27 Jan
 2024 21:18:49 -0800
Message-ID: <929a27e4-9479-e3df-d39c-e5462063abd1@quicinc.com>
Date: Sat, 27 Jan 2024 21:18:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 09/17] drm/msm/dp: move parity calculation to dp_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-10-quic_parellan@quicinc.com>
 <06f76827-bffb-4bc6-a0dd-bc272e4f6690@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <06f76827-bffb-4bc6-a0dd-bc272e4f6690@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LkU9qHpFJIS_thF53I_sZkb5JwcdFSVM
X-Proofpoint-GUID: LkU9qHpFJIS_thF53I_sZkb5JwcdFSVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401280036
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/2024 1:32 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> Parity calculation is necessary for VSC SDP implementation, therefore
>> move it to dp_catalog so it usable by both SDP programming and
>> dp_audio.c
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_audio.c   | 100 ++++------------------------
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |  72 ++++++++++++++++++++
>>   2 files changed, 86 insertions(+), 86 deletions(-)
>
> There is nothing catalog-uish in the parity calculation. Just add 
> dp_utils.c. Another options is to push it to the drm/display/
>
> LGTM otherwise.
Ack. Will move to dp_utils.c
>
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c 
>> b/drivers/gpu/drm/msm/dp/dp_audio.c
>> index 4a2e479723a85..7aa785018155a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>> @@ -16,13 +16,6 @@
>>   #include "dp_panel.h"
>>   #include "dp_display.h"
>>   -#define HEADER_BYTE_2_BIT     0
>> -#define PARITY_BYTE_2_BIT     8
>> -#define HEADER_BYTE_1_BIT    16
>> -#define PARITY_BYTE_1_BIT    24
>> -#define HEADER_BYTE_3_BIT    16
>> -#define PARITY_BYTE_3_BIT    24
>> -
>>   struct dp_audio_private {
>>       struct platform_device *audio_pdev;
>>       struct platform_device *pdev;
>> @@ -36,71 +29,6 @@ struct dp_audio_private {
>>       struct dp_audio dp_audio;
>>   };
>>   -static u8 dp_audio_get_g0_value(u8 data)
>> -{
>> -    u8 c[4];
>> -    u8 g[4];
>> -    u8 ret_data = 0;
>> -    u8 i;
>> -
>> -    for (i = 0; i < 4; i++)
>> -        c[i] = (data >> i) & 0x01;
>> -
>> -    g[0] = c[3];
>> -    g[1] = c[0] ^ c[3];
>> -    g[2] = c[1];
>> -    g[3] = c[2];
>> -
>> -    for (i = 0; i < 4; i++)
>> -        ret_data = ((g[i] & 0x01) << i) | ret_data;
>> -
>> -    return ret_data;
>> -}
>> -
>> -static u8 dp_audio_get_g1_value(u8 data)
>> -{
>> -    u8 c[4];
>> -    u8 g[4];
>> -    u8 ret_data = 0;
>> -    u8 i;
>> -
>> -    for (i = 0; i < 4; i++)
>> -        c[i] = (data >> i) & 0x01;
>> -
>> -    g[0] = c[0] ^ c[3];
>> -    g[1] = c[0] ^ c[1] ^ c[3];
>> -    g[2] = c[1] ^ c[2];
>> -    g[3] = c[2] ^ c[3];
>> -
>> -    for (i = 0; i < 4; i++)
>> -        ret_data = ((g[i] & 0x01) << i) | ret_data;
>> -
>> -    return ret_data;
>> -}
>> -
>> -static u8 dp_audio_calculate_parity(u32 data)
>> -{
>> -    u8 x0 = 0;
>> -    u8 x1 = 0;
>> -    u8 ci = 0;
>> -    u8 iData = 0;
>> -    u8 i = 0;
>> -    u8 parity_byte;
>> -    u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
>> -
>> -    for (i = 0; i < num_byte; i++) {
>> -        iData = (data >> i*4) & 0xF;
>> -
>> -        ci = iData ^ x1;
>> -        x1 = x0 ^ dp_audio_get_g1_value(ci);
>> -        x0 = dp_audio_get_g0_value(ci);
>> -    }
>> -
>> -    parity_byte = x1 | (x0 << 4);
>> -
>> -    return parity_byte;
>> -}
>> -
>>   static u32 dp_audio_get_header(struct dp_catalog *catalog,
>>           enum dp_catalog_audio_sdp_type sdp,
>>           enum dp_catalog_audio_header_type header)
>> @@ -134,7 +62,7 @@ static void dp_audio_stream_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
>>         new_value = 0x02;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_1_BIT)
>>               | (parity_byte << PARITY_BYTE_1_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -147,7 +75,7 @@ static void dp_audio_stream_sdp(struct 
>> dp_audio_private *audio)
>>       value = dp_audio_get_header(catalog,
>>               DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
>>       new_value = value;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_2_BIT)
>>               | (parity_byte << PARITY_BYTE_2_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -162,7 +90,7 @@ static void dp_audio_stream_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
>>         new_value = audio->channels - 1;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_3_BIT)
>>               | (parity_byte << PARITY_BYTE_3_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -184,7 +112,7 @@ static void dp_audio_timestamp_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
>>         new_value = 0x1;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_1_BIT)
>>               | (parity_byte << PARITY_BYTE_1_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -198,7 +126,7 @@ static void dp_audio_timestamp_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
>>         new_value = 0x17;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_2_BIT)
>>               | (parity_byte << PARITY_BYTE_2_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -212,7 +140,7 @@ static void dp_audio_timestamp_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
>>         new_value = (0x0 | (0x11 << 2));
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_3_BIT)
>>               | (parity_byte << PARITY_BYTE_3_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -233,7 +161,7 @@ static void dp_audio_infoframe_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
>>         new_value = 0x84;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_1_BIT)
>>               | (parity_byte << PARITY_BYTE_1_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -247,7 +175,7 @@ static void dp_audio_infoframe_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
>>         new_value = 0x1b;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_2_BIT)
>>               | (parity_byte << PARITY_BYTE_2_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -261,7 +189,7 @@ static void dp_audio_infoframe_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
>>         new_value = (0x0 | (0x11 << 2));
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_3_BIT)
>>               | (parity_byte << PARITY_BYTE_3_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -282,7 +210,7 @@ static void dp_audio_copy_management_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
>>         new_value = 0x05;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_1_BIT)
>>               | (parity_byte << PARITY_BYTE_1_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -296,7 +224,7 @@ static void dp_audio_copy_management_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
>>         new_value = 0x0F;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_2_BIT)
>>               | (parity_byte << PARITY_BYTE_2_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -310,7 +238,7 @@ static void dp_audio_copy_management_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
>>         new_value = 0x0;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_3_BIT)
>>               | (parity_byte << PARITY_BYTE_3_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -331,7 +259,7 @@ static void dp_audio_isrc_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
>>         new_value = 0x06;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_1_BIT)
>>               | (parity_byte << PARITY_BYTE_1_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> @@ -345,7 +273,7 @@ static void dp_audio_isrc_sdp(struct 
>> dp_audio_private *audio)
>>               DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
>>         new_value = 0x0F;
>> -    parity_byte = dp_audio_calculate_parity(new_value);
>> +    parity_byte = dp_catalog_calculate_parity(new_value);
>>       value |= ((new_value << HEADER_BYTE_2_BIT)
>>               | (parity_byte << PARITY_BYTE_2_BIT));
>>       drm_dbg_dp(audio->drm_dev,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> index 6cb5e2a243de2..563903605b3a7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> @@ -45,6 +45,13 @@ enum dp_phy_aux_config_type {
>>       PHY_AUX_CFG_MAX,
>>   };
>>   +#define HEADER_BYTE_2_BIT     0
>> +#define PARITY_BYTE_2_BIT     8
>> +#define HEADER_BYTE_1_BIT    16
>> +#define PARITY_BYTE_1_BIT    24
>> +#define HEADER_BYTE_3_BIT    16
>> +#define PARITY_BYTE_3_BIT    24
>> +
>>   enum dp_catalog_audio_sdp_type {
>>       DP_AUDIO_SDP_STREAM,
>>       DP_AUDIO_SDP_TIMESTAMP,
>> @@ -73,6 +80,71 @@ struct dp_catalog {
>>       bool wide_bus_en;
>>   };
>>   +static inline u8 dp_catalog_get_g0_value(u8 data)
>> +{
>> +    u8 c[4];
>> +    u8 g[4];
>> +    u8 ret_data = 0;
>> +    u8 i;
>> +
>> +    for (i = 0; i < 4; i++)
>> +        c[i] = (data >> i) & 0x01;
>> +
>> +    g[0] = c[3];
>> +    g[1] = c[0] ^ c[3];
>> +    g[2] = c[1];
>> +    g[3] = c[2];
>> +
>> +    for (i = 0; i < 4; i++)
>> +        ret_data = ((g[i] & 0x01) << i) | ret_data;
>> +
>> +    return ret_data;
>> +}
>> +
>> +static inline u8 dp_catalog_get_g1_value(u8 data)
>> +{
>> +    u8 c[4];
>> +    u8 g[4];
>> +    u8 ret_data = 0;
>> +    u8 i;
>> +
>> +    for (i = 0; i < 4; i++)
>> +        c[i] = (data >> i) & 0x01;
>> +
>> +    g[0] = c[0] ^ c[3];
>> +    g[1] = c[0] ^ c[1] ^ c[3];
>> +    g[2] = c[1] ^ c[2];
>> +    g[3] = c[2] ^ c[3];
>> +
>> +    for (i = 0; i < 4; i++)
>> +        ret_data = ((g[i] & 0x01) << i) | ret_data;
>> +
>> +    return ret_data;
>> +}
>> +
>> +static inline u8 dp_catalog_calculate_parity(u32 data)
>> +{
>> +    u8 x0 = 0;
>> +    u8 x1 = 0;
>> +    u8 ci = 0;
>> +    u8 iData = 0;
>> +    u8 i = 0;
>> +    u8 parity_byte;
>> +    u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
>> +
>> +    for (i = 0; i < num_byte; i++) {
>> +        iData = (data >> i * 4) & 0xF;
>> +
>> +        ci = iData ^ x1;
>> +        x1 = x0 ^ dp_catalog_get_g1_value(ci);
>> +        x0 = dp_catalog_get_g0_value(ci);
>> +    }
>> +
>> +    parity_byte = x1 | (x0 << 4);
>> +
>> +    return parity_byte;
>> +}
>> +
>>   /* Debug module */
>>   void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct 
>> msm_disp_state *disp_state);
>
