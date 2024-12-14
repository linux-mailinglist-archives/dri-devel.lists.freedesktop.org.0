Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99409F2036
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 19:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF00B10E099;
	Sat, 14 Dec 2024 18:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aBj8I1ql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867C210E02C;
 Sat, 14 Dec 2024 18:02:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BEGraha021075;
 Sat, 14 Dec 2024 18:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v1Ybzk84uGSlfDJpnE733yrjYmvH6mTSTeC/J2oKaT4=; b=aBj8I1ql4tKlCk0A
 QSrBEfRCDGJyD8WDcVXJYYaDjaOGHUlTLg2Oz3PGQSWNgH3oxqnwdlrUZDmgHApV
 gs1mJgafoiENN0mkGF2CImeyuAKPTWsumTzUZKHUAAssUQVy3WEtLLzz1OimqYm6
 TG8xr8R5IJWwumsQvhXOHHlptz9YNOm7elu2ePD81bb3EldUtI1rZDJIFIMFm2V/
 lTh+DiC/lGYlHWUhKyuIk7Z8Df6Gbd/Jgxz1Tc24Uboc8AaFNKADcrK6C0qLP0JC
 dnfeGcQjAQcdsgJeCWI3HsL5+ukQVwy9I6coPh91kE3Jw7Ivj4ipo04/w4G1s79E
 hZ6sxg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h30x0v3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Dec 2024 18:02:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BEI27bS021591
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Dec 2024 18:02:07 GMT
Received: from [10.110.102.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 14 Dec
 2024 10:02:03 -0800
Message-ID: <8cce980f-758e-493c-b646-ee62a298da8d@quicinc.com>
Date: Sat, 14 Dec 2024 10:02:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-9-0b1c65e7dba3@linaro.org>
 <070dea1a-c300-4968-ba24-011625e4c133@quicinc.com>
 <CAA8EJpqO=AjVGEnZHNbM5+Mnu2gMN96kABBLM5XHh3NMMGFtjw@mail.gmail.com>
 <9a9ff3a5-5c01-45fd-a89a-b8305baac5bd@quicinc.com>
 <CAA8EJpoF1B4mARmSmEhq9qUfMFxCF-+W1AVDnOLniM6F67=yvw@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoF1B4mARmSmEhq9qUfMFxCF-+W1AVDnOLniM6F67=yvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: U6nGTMSTqAS9PKulgQRqW2BJMzILPIW4
X-Proofpoint-GUID: U6nGTMSTqAS9PKulgQRqW2BJMzILPIW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412140149
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



On 12/12/2024 4:28 PM, Dmitry Baryshkov wrote:
> On Fri, 13 Dec 2024 at 01:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/12/2024 2:28 PM, Dmitry Baryshkov wrote:
>>> On Thu, 12 Dec 2024 at 23:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
>>>>> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
>>>>> to program audio packet data. Use 0 as Packet ID, as it was not
>>>>> programmed earlier.
>>>>>
>>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/dp/dp_audio.c | 288 +++++++++-----------------------------
>>>>>     1 file changed, 66 insertions(+), 222 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
>>>>> index 5cbb11986460d1e4ed1890bdf66d0913e013083c..1aa52d5cc08684a49102e45ed6e40ac2b13497c7 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>>>>> @@ -14,6 +14,7 @@
>>>>>     #include "dp_catalog.h"
>>>>>     #include "dp_audio.h"
>>>>>     #include "dp_panel.h"
>>>>> +#include "dp_reg.h"
>>>>>     #include "dp_display.h"
>>>>>     #include "dp_utils.h"
>>>>>
>>>>> @@ -28,251 +29,94 @@ struct msm_dp_audio_private {
>>>>>         struct msm_dp_audio msm_dp_audio;
>>>>>     };
>>>>>
>>>>> -static u32 msm_dp_audio_get_header(struct msm_dp_catalog *catalog,
>>>>> -             enum msm_dp_catalog_audio_sdp_type sdp,
>>>>> -             enum msm_dp_catalog_audio_header_type header)
>>>>> -{
>>>>> -     return msm_dp_catalog_audio_get_header(catalog, sdp, header);
>>>>> -}
>>>>> -
>>>>> -static void msm_dp_audio_set_header(struct msm_dp_catalog *catalog,
>>>>> -             u32 data,
>>>>> -             enum msm_dp_catalog_audio_sdp_type sdp,
>>>>> -             enum msm_dp_catalog_audio_header_type header)
>>>>> -{
>>>>> -     msm_dp_catalog_audio_set_header(catalog, sdp, header, data);
>>>>> -}
>>>>> -
>>>>>     static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
>>>>>     {
>>>>>         struct msm_dp_catalog *catalog = audio->catalog;
>>>>> -     u32 value, new_value;
>>>>> -     u8 parity_byte;
>>>>> -
>>>>> -     /* Config header and parity byte 1 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     new_value = 0x02;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     /* Config header and parity byte 2 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
>>>>> -     new_value = value;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
>>>>> -
>>>>> -     /* Config header and parity byte 3 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
>>>>> -
>>>>> -     new_value = audio->channels - 1;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -             value, parity_byte);
>>>>> -
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
>>>>> +     struct dp_sdp_header sdp_hdr = {
>>>>> +             .HB0 = 0x00,
>>>>> +             .HB1 = 0x02,
>>>>> +             .HB2 = 0x00,
>>>>> +             .HB3 = audio->channels - 1,
>>>>> +     };
>>>>> +     u32 header[2];
>>>>> +
>>>>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
>>>>> +
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
>>>>>     }
>>>>
>>>> This patch is changing the programming behavior.
>>>>
>>>> Earlier it was using a read/modify/write on each register. Now, its just
>>>>     a write. I checked a few chipsets, the reset value of registers was 0,
>>>> so that part is okay.
>>>
>>> Except that it was not a correct RMW, it was read, OR new data without
>>> clearing the bitfield, write. So it has been working mostly by a
>>> miracle,
>>>

Yes, we should have added the bitfield clearing long ago and not waited 
for this cleanup. Could have even gone as a separate fix.

>>>>
>>>> But, for the MMSS_DP_AUDIO_STREAM_0 register, earlier we were writing
>>>> only the upper nibble, that is bits 15:0 of DP_AUDIO_SDP_HEADER_0 was
>>>> kept as-it-is, but now this patch is changing that to 0. What was the
>>>> reason for that change?
>>>
>>> It is described in the commit message: "Use 0 as Packet ID, as it was not
>>> programmed earlier."
>>>
>>
>> The part of using 0 as Packet ID is but not the behavior of changing the
>> RMW which is also pretty significant. That was all happening under the hood.
> 
> No. It is explicitly mentioned in the commit message. It's not under the hood.
> 

Which part? "Use msm_dp_utils_pack_sdp_header() and call 
msm_dp_write_link() directly
to program audio packet data" .. this one?

I would prefer to be more explicit.

I would have preferred something like "and drop the existing behavior to 
read every header and write it and write the whole register at once to 
drop the catalog audio map"


>>
>>>>
>>>> This is true for all the APIs being touched in this file.
>>>>
>>>> I guess the whole point of having that audio map in the catalog was to
>>>> preserve the read values of these registers. I have to check what was
>>>> the reason behind that as once again this was before I worked on this
>>>> driver as well.
>>>>
>>>> So technically there are two parts to this change:
>>>>
>>>> 1) dropping read for each header and directly just writing it
>>>> 2) Writing the registers directly instead of going through catalog
>>>>
>>>> It seems like (1) and (2) are independent. I hope (1) was not the reason
>>>> to have started this whole rework.
>>>
>>> Yes, the driver spends a lot of effort to preserve the data that will
>>> be rewritten when the function is called to write the next header
>>> byte. So it is useless. Only HB0 has been preserved, PacketID. If for
>>> some reason we are generating a stream with the non-zero ID, it should
>>> be explicit, not implicitly 'preserved'.
>>>
>>
>> I am trying to understand why this was being preserved. Audio
>> programming is half in DP driver and half in ADSP. I dont know if the
>> expectation was that packet ID will be programmed elsewhere and not in
>> HLOS code hence it was preserved.
>>
>>> So, the reasons were:
>>> - fix the RMW cycles to drop old values from the registers
>>> - use new msm_dp_utils_pack_sdp_header()

This could have been one change by itself rather than an under the 
umbrella of misc cleanups. All you had to do was do the same cleanup, 
but rather than dp audio directly writing the register, it would have 
gone through catalog maybe perhaps with another API.

Then the catalog cleanup could have just replaced that API if required.

Easier to review , easier to land by iself and easier to bisect as well 
if some regression had happened.

>>> - get rid of the useless indirection through the catalog and enum
>>> msm_dp_catalog_audio_header_type
>>> - write registers in an efficient way.

Yes, agreed to this point. It does certainly reduce the number of 
register reads/writes for each DP audio register and yes if we had known 
earlier that this was not needed, would have done it the same way.

>>> - if we ever have a set of functions to handle DP infoframes (like we
>>> do for HDMI), make the MSM DP driver ready to be converted to such
>>> functions.
>>

Yes I get where this change came from. For any infoframe, we have 
similar logic of doing a pack and then writing at once. So I was never 
opposed to this part. I was trying to mostly figure out where the 
read-modify-write came from in the first place and whether there is any 
impact of dropping that.

>>
>> The only reason the current driver needed to go through the catalog map
>> was that it was trying to write one header at a time. And in the
>> registers, 2 headers are mapped to one register. So a map was needed. I
>> do not know the reason for breaking up the writes into one header at a
>> time like I already mentioned so I am trying to gather that info.
>> Without knowing the reason it might seem useless but its my duty to make
>> sure nothing was overlooked.
> 
> Sure!
> 

Ok, so I was finally able to trace down the history of why we did it 
this way and it goes back almost 6 years so took me a while. Its just 
that the pre-silicon validation sequences had a read-modify-write (which 
they do even today) so the current software was just reflecting that.

Functionally however, I have confirmed that we do not need to do that. 
So, I am fine with this change but will first close the discussion on 
patch 5 as this patch tried to do multiple things, so have to close one 
topic and then get to the other to finally ack this change.

>>
>>
>>
>>>
>>>>
>>>>>
>>>>>     static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
>>>>>     {
>>>>>         struct msm_dp_catalog *catalog = audio->catalog;
>>>>> -     u32 value, new_value;
>>>>> -     u8 parity_byte;
>>>>> -
>>>>> -     /* Config header and parity byte 1 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     new_value = 0x1;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     /* Config header and parity byte 2 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
>>>>> -
>>>>> -     new_value = 0x17;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
>>>>> -
>>>>> -     /* Config header and parity byte 3 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
>>>>> -
>>>>> -     new_value = (0x0 | (0x11 << 2));
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
>>>>> +     struct dp_sdp_header sdp_hdr = {
>>>>> +             .HB0 = 0x00,
>>>>> +             .HB1 = 0x01,
>>>>> +             .HB2 = 0x17,
>>>>> +             .HB3 = 0x0 | (0x11 << 2),
>>>>> +     };
>>>>> +     u32 header[2];
>>>>> +
>>>>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
>>>>> +
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
>>>>>     }
>>>>>
>>>>>     static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
>>>>>     {
>>>>>         struct msm_dp_catalog *catalog = audio->catalog;
>>>>> -     u32 value, new_value;
>>>>> -     u8 parity_byte;
>>>>> -
>>>>> -     /* Config header and parity byte 1 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     new_value = 0x84;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     /* Config header and parity byte 2 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
>>>>> -
>>>>> -     new_value = 0x1b;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
>>>>> -
>>>>> -     /* Config header and parity byte 3 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
>>>>> -
>>>>> -     new_value = (0x0 | (0x11 << 2));
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     new_value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
>>>>> +     struct dp_sdp_header sdp_hdr = {
>>>>> +             .HB0 = 0x00,
>>>>> +             .HB1 = 0x84,
>>>>> +             .HB2 = 0x1b,
>>>>> +             .HB3 = 0x0 | (0x11 << 2),
>>>>> +     };
>>>>> +     u32 header[2];
>>>>> +
>>>>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
>>>>> +
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
>>>>>     }
>>>>>
>>>>>     static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
>>>>>     {
>>>>>         struct msm_dp_catalog *catalog = audio->catalog;
>>>>> -     u32 value, new_value;
>>>>> -     u8 parity_byte;
>>>>> -
>>>>> -     /* Config header and parity byte 1 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     new_value = 0x05;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     /* Config header and parity byte 2 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
>>>>> -
>>>>> -     new_value = 0x0F;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
>>>>> -
>>>>> -     /* Config header and parity byte 3 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
>>>>> -
>>>>> -     new_value = 0x0;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
>>>>> +     struct dp_sdp_header sdp_hdr = {
>>>>> +             .HB0 = 0x00,
>>>>> +             .HB1 = 0x05,
>>>>> +             .HB2 = 0x0f,
>>>>> +             .HB3 = 0x00,
>>>>> +     };
>>>>> +     u32 header[2];
>>>>> +
>>>>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
>>>>> +
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
>>>>>     }
>>>>>
>>>>>     static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
>>>>>     {
>>>>>         struct msm_dp_catalog *catalog = audio->catalog;
>>>>> -     u32 value, new_value;
>>>>> -     u8 parity_byte;
>>>>> -
>>>>> -     /* Config header and parity byte 1 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     new_value = 0x06;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
>>>>> -
>>>>> -     /* Config header and parity byte 2 */
>>>>> -     value = msm_dp_audio_get_header(catalog,
>>>>> -                     DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
>>>>> -
>>>>> -     new_value = 0x0F;
>>>>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
>>>>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
>>>>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
>>>>> -     drm_dbg_dp(audio->drm_dev,
>>>>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
>>>>> -                     value, parity_byte);
>>>>> -     msm_dp_audio_set_header(catalog, value,
>>>>> -             DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
>>>>> +     struct dp_sdp_header sdp_hdr = {
>>>>> +             .HB0 = 0x00,
>>>>> +             .HB1 = 0x06,
>>>>> +             .HB2 = 0x0f,
>>>>> +             .HB3 = 0x00,
>>>>> +     };
>>>>> +     u32 header[2];
>>>>> +     u32 reg;
>>>>> +
>>>>> +     /* XXX: is it necessary to preserve this field? */
>>>>> +     reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
>>>>> +     sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
>>>>> +
>>>>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
>>>>> +
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
>>>>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
>>>>>     }
>>>>>
>>>>>     static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
>>>>>
>>>
>>>
>>>
> 
> 
> 
