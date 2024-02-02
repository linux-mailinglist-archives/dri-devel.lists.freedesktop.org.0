Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FDC8467FC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 07:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9459210E5BB;
	Fri,  2 Feb 2024 06:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZEcKgy36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3B710E5BB;
 Fri,  2 Feb 2024 06:25:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4124FaOi011948; Fri, 2 Feb 2024 06:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=E18shHMh9Z5ZGyjJWlzzaCC2s8AAWnHccVNxUBRVAbM=; b=ZE
 cKgy36XnrtrTXBGf78p3MJRIw9oKBUIvL2eJqeqnrPNFxSiHLIig5/9Op2U7Bwo6
 atacEXfBvP/+7xZG4nR5lfLP6xCO60it9wK+iIdCo3NU0vQr9rCJm8+VeSlhD6In
 AssfJp7Ju1/W3AevZlScXQBwTuaui8udcmAoqc3dhCyAIh89vrHnErgjSbP5qZWO
 84iPIpeezovII+wK04qMwDP2y+X4xYr/LEv6IEfnianb3fFWvw0bgcpFOfPpKlSE
 bYJVOYifMcPVRUqAE3Hd0q8cf5Wu7kN3Y0Bf//9En1jtUWMuQRb7xeecyFzxlYK4
 WbU8dUqPZrFj9dOIvUHw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pwjgkng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Feb 2024 06:25:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4126Pghk021073
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Feb 2024 06:25:42 GMT
Received: from [10.110.1.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 1 Feb
 2024 22:25:41 -0800
Message-ID: <62e3c81e-5f35-772b-6ed0-f660f7a792b2@quicinc.com>
Date: Thu, 1 Feb 2024 22:25:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 11/17] drm/msm/dp: add VSC SDP support for YUV420 over DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-12-quic_parellan@quicinc.com>
 <d94434ec-00fd-489f-98f2-8c811522ff82@linaro.org>
 <11c6fdbe-f85a-088d-92df-abd8405c966b@quicinc.com>
 <CAA8EJprPziRHhxVK9mAdQZNEeon9q95ZMKSBhs-s95O-7W10NA@mail.gmail.com>
 <6fd0cc09-a1c4-123e-966d-111d44263286@quicinc.com>
 <CAA8EJppT_i4=O8hx96FF+9-PP5w__bP6iqqzxDtFQmHXPPROfw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppT_i4=O8hx96FF+9-PP5w__bP6iqqzxDtFQmHXPPROfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Uc7RShKNjFRzmOmeXVTiuhz2tF8Pdjdf
X-Proofpoint-ORIG-GUID: Uc7RShKNjFRzmOmeXVTiuhz2tF8Pdjdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020045
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



On 1/31/2024 8:36 PM, Dmitry Baryshkov wrote:
> On Thu, 1 Feb 2024 at 03:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 1/27/2024 9:39 PM, Dmitry Baryshkov wrote:
>>> On Sun, 28 Jan 2024 at 07:34, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>
>>>>
>>>> On 1/25/2024 1:48 PM, Dmitry Baryshkov wrote:
>>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>>>> Add support to pack and send the VSC SDP packet for DP. This therefore
>>>>>> allows the transmision of format information to the sinks which is
>>>>>> needed for YUV420 support over DP.
>>>>>>
>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/dp/dp_catalog.c | 147 ++++++++++++++++++++++++++++
>>>>>>     drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
>>>>>>     drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
>>>>>>     drivers/gpu/drm/msm/dp/dp_panel.c   |  47 +++++++++
>>>>>>     drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
>>>>>>     5 files changed, 205 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>>>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>>>> index c025786170ba5..7e4c68be23e56 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>>>> @@ -29,6 +29,9 @@
>>>>>>       #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
>>>>>>     +#define DP_GENERIC0_6_YUV_8_BPC        BIT(0)
>>>>>> +#define DP_GENERIC0_6_YUV_10_BPC    BIT(1)
>>>>>> +
>>>>>>     #define DP_INTERRUPT_STATUS1 \
>>>>>>         (DP_INTR_AUX_XFER_DONE| \
>>>>>>         DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
>>>>>> @@ -907,6 +910,150 @@ int dp_catalog_panel_timing_cfg(struct
>>>>>> dp_catalog *dp_catalog)
>>>>>>         return 0;
>>>>>>     }
>>>>>>     +static void dp_catalog_panel_setup_vsc_sdp(struct dp_catalog
>>>>>> *dp_catalog)
>>>>>> +{
>>>>>> +    struct dp_catalog_private *catalog;
>>>>>> +    u32 header, parity, data;
>>>>>> +    u8 bpc, off = 0;
>>>>>> +    u8 buf[SZ_128];
>>>>>> +
>>>>>> +    if (!dp_catalog) {
>>>>>> +        pr_err("invalid input\n");
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>> +    catalog = container_of(dp_catalog, struct dp_catalog_private,
>>>>>> dp_catalog);
>>>>>> +
>>>>>> +    /* HEADER BYTE 1 */
>>>>>> +    header = dp_catalog->sdp.sdp_header.HB1;
>>>>>> +    parity = dp_catalog_calculate_parity(header);
>>>>>> +    data   = ((header << HEADER_BYTE_1_BIT) | (parity <<
>>>>>> PARITY_BYTE_1_BIT));
>>>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_0, data);
>>>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>>>> +    off += sizeof(data);
>>>>>> +
>>>>>> +    /* HEADER BYTE 2 */
>>>>>> +    header = dp_catalog->sdp.sdp_header.HB2;
>>>>>> +    parity = dp_catalog_calculate_parity(header);
>>>>>> +    data   = ((header << HEADER_BYTE_2_BIT) | (parity <<
>>>>>> PARITY_BYTE_2_BIT));
>>>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
>>>>>> +
>>>>>> +    /* HEADER BYTE 3 */
>>>>>> +    header = dp_catalog->sdp.sdp_header.HB3;
>>>>>> +    parity = dp_catalog_calculate_parity(header);
>>>>>> +    data   = ((header << HEADER_BYTE_3_BIT) | (parity <<
>>>>>> PARITY_BYTE_3_BIT));
>>>>>> +    data |= dp_read_link(catalog, MMSS_DP_GENERIC0_1);
>>>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
>>>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>>>> +    off += sizeof(data);
>>>>>
>>>>> This seems to be common with the dp_audio code. Please extract this
>>>>> header writing too.
>>>> These are two different sdp's. audio and vsc, are different with
>>>> different registers being written to and different amount of registers
>>>> being set. Can you please clarify since in audio we only need 3
>>>> registers to write to, and in vsc we need 10.
>>>
>>> Bitmagic with the header is the same. Then the rest of the data is
>>> written one dword per register, if I'm not mistaken.
>>>
>>
>> We can generalize the MMSS_DP_GENERIC0 register writing by breaking it
>> up to two things:
>>
>> 1) Add a function vsc_sdp_pack() similar to hdmi_avi_infoframe_pack_only()
> 
> Note, there is already a hdmi_audio_infoframe_pack_for_dp() function.
> I think this patchset can add hdmi_colorimetry_infoframe_pack_for_dp()
> [you can choose any other similar name that suits from your POV].
> 
> Also please extract the function that inits the dp_sdp_header. It can
> be reused as is for both existing hdmi_audio_infoframe_pack_for_dp(),
> your new function and the dp_audio code.
> 

Not sure if extracting the header will work as all other functions in 
hdmi.c pack the header too so its a half and half implementation.

I am going to start with keeping this pack function in msm/dp/dp_utils.c 
to start with.

If it gets to a form which is generic enough to keep in a helper which 
can be common we can consider it once posted in v2.

>>
>> 2) dp_catalog_write_generic_pkt() which will just write the packed
>> buffer byte-by-byte to these MMSS_DP_GENERIC0_xxx register
>>
>> But audio seems a bit different. We use DP_AUDIO_STREAM_0/1.
>> More importantly, it uses this sdp_map and writes each header one by one
>> with dp_catalog_audio_set_header().
>>
>> Not sure if that entirely fits with this pack and then write model.
>>
>> It can be simplified. But I dont think this effort is needed for this
>> series.
>>
>> So I would prefer to generalize audio SDP programming separately.
> 
> I'd definitely ask to add a utility function that merges 4 header
> bytes with the parity data. We already have 5 instances of that code
> in dp_audio.c, which is already too much by the number of 4. Adding
> the 6th copy is NAKed.
> 

I acknowledge the overlap but coupling them with this feature doesn't 
make sense as we have to individually test out audio after that change 
even if its another cleanup.

In case my previous response was not clear.

I will certainly add a sdp packing function and utils which pack the 4 
header/parity bytes so that they can be used by other sub-modules of DP 
but will still prefer to push them as a separate series for audio as I 
want to re-test audio with that.

As discussed, I will work on that and post it in parallel.

> BTW, I see both in this path and in dp_audio that the driver reads a
> register, ORs it with the value for the next header byte and writes it
> back to the hardware. Shouldn't the driver clear the corresponding
> data bits first? I see the clears in the techpack, but not in the
> upstream code. If my assumption is correct, we should end up with the
> utility function that packs dp_sdp_header into u32[2], which can then
> be used by both YUV and dp_audio code to just write two corresponding
> registers.
> 

Correct. Thats my goal too to have a common utility function which can 
be used by audio code as well but in this series i will only introduce 
the function. The audio usage will be another one. I will also 
incorporate the clearing part if applicable once I check it closely.

> BTW2: where is the rest of the audio infoframe? I see that the old
> fbdev driver was at least clearing the first 4 bytes of the frame.
> 

hmm .... in DP we use audio infoframe SDP to send the audio information.
IIRC, we only fill the header/parity but the payload is fully controlled 
by LPASS (audio side).

