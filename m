Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC9085518F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1F310E4E7;
	Wed, 14 Feb 2024 18:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TXffvLL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52AF10E2C4;
 Wed, 14 Feb 2024 18:08:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EEkTSM021017; Wed, 14 Feb 2024 18:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=DPjmKb4R5eZwFF3QzQ/xQJH8OZvY7FFNlHqFMG3ehL8=; b=TX
 ffvLL/02npLV1td5n0eS1FLOC7RnqOMVj8T9jRiy+vvMHsiogIx9XNciWCysODGR
 kAMyDL7yTACoPUEGkLdqmbNpqZG0MnrEmpy1vAyPUkVB+Ea2uK+UdYR5ohlm0K/E
 RkKOuHUhJ1vOGNXpkGEc8B4lFQ4jSLHESkhn8m1gH0E3k7ycubR8ekwKA/b8or48
 hsZ0HRYLii0WbwoTtSoIdzYBZ1bkSQba3pypCSKsX/uDKUM1x18Rbgi9uN7Bjaez
 0Nfi1Oybbqalrk/s47C4LVZzTOvgc+0aiH9ga/bm7vB1N/zV7+DGvY+/WalHcpOB
 hhGtxTNe+YmCsVoPLwYQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8kkrhwg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:08:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI8ead017295
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:08:40 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 10:08:38 -0800
Message-ID: <fa63e9c1-3cec-41df-c643-33950346b76c@quicinc.com>
Date: Wed, 14 Feb 2024 10:08:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
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
References: <20240213234513.2411604-1-quic_abhinavk@quicinc.com>
 <CAA8EJpo0yeLyCkVvLFX7wUEV4+i+ORbaCB2qxN0izaWLdFqCrA@mail.gmail.com>
 <eb8b3bac-5f97-8efd-721e-08e9544be3f8@quicinc.com>
 <Zc0AR6pdLzDjCrAB@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Zc0AR6pdLzDjCrAB@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UsOqeXAcExC59bnYnEJ0YVT3hP9tdPvm
X-Proofpoint-ORIG-GUID: UsOqeXAcExC59bnYnEJ0YVT3hP9tdPvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140142
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



On 2/14/2024 10:02 AM, Ville Syrjälä wrote:
> On Wed, Feb 14, 2024 at 09:17:34AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 2/14/2024 12:15 AM, Dmitry Baryshkov wrote:
>>> On Wed, 14 Feb 2024 at 01:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
>>>> Lets move this to drm_dp_helper to achieve this.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> My preference would be to have packing functions in
>>> drivers/video/hdmi.c, as we already have
>>> hdmi_audio_infoframe_pack_for_dp() there.
>>>
>>
>> My preference is drm_dp_helper because it already has some VSC SDP stuff
>> and after discussion with Ville on IRC, I decided to post it this way.
>>
>> hdmi_audio_infoframe_pack_for_dp() is an exception from my PoV as the
>> hdmi audio infoframe fields were re-used and packed into a DP SDP
>> thereby re-using the existing struct hdmi_audio_infoframe .
>>
>> This is not like that. Here we pack from struct drm_dp_vsc_sdp to struct
>> dp_sdp both of which had prior usages already in this file.
>>
>> So it all adds up and makes sense to me to be in this file.
>>
>> I will let the other DRM core maintainers comment on this.
>>
>> Ville, Jani?
> 
> Yeah, I'm not sure bloating the (poorly named) hdmi.c with all
> SDP stuff is a great idea. Since other related stuff already
> lives in the drm_dp_helper.c that seems reasonable to me at this
> time. And if we get a decent amount of this then probably all
> DP SDP stuff should be extracted into its own file.
> 

Yes, thanks.

> There are of course a few overlaps here andthere (the audio SDP
> I guess, and the CTA infoframe SDP). But I'm not sure that actually
> needs any SDP specific stuff in hdmi.c, or could we just let hdmi.c
> deal with the actual CTA-861 stuff and then have the DP SDP code
> wrap that up in its own thing externally? Dunno, haven't really
> looked at the details.
> 

Thats a good way to look at it. this packing is from DP spec and not CTA 
so makes more sense to be in this file.

In that case, R-b?

>>
>>>> ---
>>>>    drivers/gpu/drm/display/drm_dp_helper.c | 78 +++++++++++++++++++++++++
>>>>    drivers/gpu/drm/i915/display/intel_dp.c | 73 +----------------------
>>>>    include/drm/display/drm_dp_helper.h     |  3 +
>>>>    3 files changed, 84 insertions(+), 70 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>>>> index b1ca3a1100da..066cfbbf7a91 100644
>>>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>>>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>>>> @@ -2916,6 +2916,84 @@ void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>>>>    }
>>>>    EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>>>>
>>>> +/**
>>>> + * drm_dp_vsc_sdp_pack() - pack a given vsc sdp into generic dp_sdp
>>>> + * @vsc: vsc sdp initialized according to its purpose as defined in
>>>> + *       table 2-118 - table 2-120 in DP 1.4a specification
>>>> + * @sdp: valid handle to the generic dp_sdp which will be packed
>>>> + * @size: valid size of the passed sdp handle
>>>> + *
>>>> + * Returns length of sdp on success and error code on failure
>>>> + */
>>>> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
>>>> +                           struct dp_sdp *sdp, size_t size)
>>>
>>> I know that you are just moving the function. Maybe there can be
>>> patch#2, which drops the size argument? The struct dp_sdp already has
>>> a defined size. The i915 driver just passes sizeof(sdp), which is more
>>> or less useless.
>>>
>>
>> Yes this is a valid point, I also noticed this. I can post it on top of
>> this once we get an agreement and ack on this patch first.
>>
>>>> +{
>>>> +       size_t length = sizeof(struct dp_sdp);
>>>> +
>>>> +       if (size < length)
>>>> +               return -ENOSPC;
>>>> +
>>>> +       memset(sdp, 0, size);
>>>> +
>>>> +       /*
>>>> +        * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
>>>> +        * VSC SDP Header Bytes
>>>> +        */
>>>> +       sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
>>>> +       sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
>>>> +       sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
>>>> +       sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
>>>> +
>>>> +       if (vsc->revision == 0x6) {
>>>> +               sdp->db[0] = 1;
>>>> +               sdp->db[3] = 1;
>>>> +       }
>>>> +
>>>> +       /*
>>>> +        * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
>>>> +        * Format as per DP 1.4a spec and DP 2.0 respectively.
>>>> +        */
>>>> +       if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
>>>> +               goto out;
>>>> +
>>>> +       /* VSC SDP Payload for DB16 through DB18 */
>>>> +       /* Pixel Encoding and Colorimetry Formats  */
>>>> +       sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
>>>> +       sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
>>>> +
>>>> +       switch (vsc->bpc) {
>>>> +       case 6:
>>>> +               /* 6bpc: 0x0 */
>>>> +               break;
>>>> +       case 8:
>>>> +               sdp->db[17] = 0x1; /* DB17[3:0] */
>>>> +               break;
>>>> +       case 10:
>>>> +               sdp->db[17] = 0x2;
>>>> +               break;
>>>> +       case 12:
>>>> +               sdp->db[17] = 0x3;
>>>> +               break;
>>>> +       case 16:
>>>> +               sdp->db[17] = 0x4;
>>>> +               break;
>>>> +       default:
>>>> +               WARN(1, "Missing case %d\n", vsc->bpc);
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       /* Dynamic Range and Component Bit Depth */
>>>> +       if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
>>>> +               sdp->db[17] |= 0x80;  /* DB17[7] */
>>>> +
>>>> +       /* Content Type */
>>>> +       sdp->db[18] = vsc->content_type & 0x7;
>>>> +
>>>> +out:
>>>> +       return length;
>>>> +}
>>>> +EXPORT_SYMBOL(drm_dp_vsc_sdp_pack);
>>>> +
>>>>    /**
>>>>     * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
>>>>     * @dpcd: DisplayPort configuration data
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>>>> index f5ef95da5534..e94db51aeeb7 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>>>> @@ -4110,73 +4110,6 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>>>>           return false;
>>>>    }
>>>>
>>>> -static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
>>>> -                                    struct dp_sdp *sdp, size_t size)
>>>> -{
>>>> -       size_t length = sizeof(struct dp_sdp);
>>>> -
>>>> -       if (size < length)
>>>> -               return -ENOSPC;
>>>> -
>>>> -       memset(sdp, 0, size);
>>>> -
>>>> -       /*
>>>> -        * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
>>>> -        * VSC SDP Header Bytes
>>>> -        */
>>>> -       sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
>>>> -       sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
>>>> -       sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
>>>> -       sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
>>>> -
>>>> -       if (vsc->revision == 0x6) {
>>>> -               sdp->db[0] = 1;
>>>> -               sdp->db[3] = 1;
>>>> -       }
>>>> -
>>>> -       /*
>>>> -        * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
>>>> -        * Format as per DP 1.4a spec and DP 2.0 respectively.
>>>> -        */
>>>> -       if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
>>>> -               goto out;
>>>> -
>>>> -       /* VSC SDP Payload for DB16 through DB18 */
>>>> -       /* Pixel Encoding and Colorimetry Formats  */
>>>> -       sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
>>>> -       sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
>>>> -
>>>> -       switch (vsc->bpc) {
>>>> -       case 6:
>>>> -               /* 6bpc: 0x0 */
>>>> -               break;
>>>> -       case 8:
>>>> -               sdp->db[17] = 0x1; /* DB17[3:0] */
>>>> -               break;
>>>> -       case 10:
>>>> -               sdp->db[17] = 0x2;
>>>> -               break;
>>>> -       case 12:
>>>> -               sdp->db[17] = 0x3;
>>>> -               break;
>>>> -       case 16:
>>>> -               sdp->db[17] = 0x4;
>>>> -               break;
>>>> -       default:
>>>> -               MISSING_CASE(vsc->bpc);
>>>> -               break;
>>>> -       }
>>>> -       /* Dynamic Range and Component Bit Depth */
>>>> -       if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
>>>> -               sdp->db[17] |= 0x80;  /* DB17[7] */
>>>> -
>>>> -       /* Content Type */
>>>> -       sdp->db[18] = vsc->content_type & 0x7;
>>>> -
>>>> -out:
>>>> -       return length;
>>>> -}
>>>> -
>>>>    static ssize_t
>>>>    intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
>>>>                                            const struct hdmi_drm_infoframe *drm_infoframe,
>>>> @@ -4269,8 +4202,8 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>>>>
>>>>           switch (type) {
>>>>           case DP_SDP_VSC:
>>>> -               len = intel_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
>>>> -                                           sizeof(sdp));
>>>> +               len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
>>>> +                                         sizeof(sdp));
>>>>                   break;
>>>>           case HDMI_PACKET_TYPE_GAMUT_METADATA:
>>>>                   len = intel_dp_hdr_metadata_infoframe_sdp_pack(dev_priv,
>>>> @@ -4297,7 +4230,7 @@ void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
>>>>           struct dp_sdp sdp = {};
>>>>           ssize_t len;
>>>>
>>>> -       len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
>>>> +       len = drm_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
>>>>
>>>>           if (drm_WARN_ON(&dev_priv->drm, len < 0))
>>>>                   return;
>>>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>>>> index 863b2e7add29..f8db34a2f7a5 100644
>>>> --- a/include/drm/display/drm_dp_helper.h
>>>> +++ b/include/drm/display/drm_dp_helper.h
>>>> @@ -813,4 +813,7 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>>>>                          int bpp_x16, unsigned long flags);
>>>>    int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
>>>>
>>>> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
>>>> +                           struct dp_sdp *sdp, size_t size);
>>>> +
>>>>    #endif /* _DRM_DP_HELPER_H_ */
>>>> --
>>>> 2.34.1
>>>>
>>>
>>>
> 
