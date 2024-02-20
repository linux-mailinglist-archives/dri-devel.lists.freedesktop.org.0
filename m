Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D8085C408
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 19:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E8910E214;
	Tue, 20 Feb 2024 18:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="msw1Y1fm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE2010E24F;
 Tue, 20 Feb 2024 18:53:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KGgj8I017298; Tue, 20 Feb 2024 18:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=flIWORpz8P9rJ1a9Qs3CgiKsYD1Sy9y8ZxgrxDYRTqw=; b=ms
 w1Y1fmfZdcujz2SPm5E2icMR5leTCoFWlvLMLke3mBPScNBUZrueVKwTJkmK31Xq
 TySzxzKPfXrpCecGIX6KIoUadZdpzMCI4/V2SsDOcKz6++pMuy8suv8YFzAK+RFQ
 NHCmGfGnIJlqgs4WC1i7FVIkZCnc1FSF7UHKhE4YiEj49A/fNriiWbTxCYq0yce+
 tnblJDJZMgnwRayY14qckC7xjJBGxFWLgOpzv6L0OwWO7sevHNFAbNd6VXIsJNRT
 56NFu69H59PZr31CVrkx3Xe6yaoKsL721266Z/lp0kQVrj8BN25k0bdcd7A20biZ
 rWCwFi44I3p5IdbGQeuQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wct3d142c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 18:53:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KIrG4K019112
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 18:53:16 GMT
Received: from [10.110.62.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 10:53:15 -0800
Message-ID: <d3674c10-5c29-d917-44f5-758d90d9e679@quicinc.com>
Date: Tue, 20 Feb 2024 10:53:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>,
 <robdclark@gmail.com>, <freedreno@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <quic_jesszhan@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>
References: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
 <CAA8EJppQquHgSgCrxKZHPHk248Pxg7Q8mvmmjbcpUxpreQkcuA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppQquHgSgCrxKZHPHk248Pxg7Q8mvmmjbcpUxpreQkcuA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: x26x7sZI9jwG55QXSKpXitfYtFSLD338
X-Proofpoint-GUID: x26x7sZI9jwG55QXSKpXitfYtFSLD338
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402200136
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



On 2/20/2024 10:49 AM, Dmitry Baryshkov wrote:
> On Thu, 15 Feb 2024 at 21:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
>> Lets move this to drm_dp_helper to achieve this.
>>
>> changes in v2:
>>          - rebased on top of drm-tip
>>
>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> v1 had an explicit comment before the ack:
> 

Yes, I remember the comment. I did not make any changes to v2 other than 
just rebasing it on drm-tip to get the ack from i915 folks.

>>     From my side, with the promise of the size fixup.
> 
> However I observe neither a second patch removing the size argument
> nor it being dropped as a part of this patch.
> 

Yes, now that in v2 we got the ack for this patch, I can spin a v3 with 
the addition of the next patch to remove the size OR as another series 
so as to not block the main series which needs this patch.

I would prefer the latter.

>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/display/drm_dp_helper.c | 78 +++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_dp.c | 71 +---------------------
>>   include/drm/display/drm_dp_helper.h     |  3 +
>>   3 files changed, 83 insertions(+), 69 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> index 8d6ce46471ae..6c91f400ecb1 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -2913,6 +2913,84 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
>>   }
>>   EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>>
>> +/**
>> + * drm_dp_vsc_sdp_pack() - pack a given vsc sdp into generic dp_sdp
>> + * @vsc: vsc sdp initialized according to its purpose as defined in
>> + *       table 2-118 - table 2-120 in DP 1.4a specification
>> + * @sdp: valid handle to the generic dp_sdp which will be packed
>> + * @size: valid size of the passed sdp handle
>> + *
>> + * Returns length of sdp on success and error code on failure
>> + */
>> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
>> +                           struct dp_sdp *sdp, size_t size)
>> +{
>> +       size_t length = sizeof(struct dp_sdp);
>> +
>> +       if (size < length)
>> +               return -ENOSPC;
>> +
>> +       memset(sdp, 0, size);
>> +
>> +       /*
>> +        * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
>> +        * VSC SDP Header Bytes
>> +        */
>> +       sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
>> +       sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
>> +       sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
>> +       sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
>> +
>> +       if (vsc->revision == 0x6) {
>> +               sdp->db[0] = 1;
>> +               sdp->db[3] = 1;
>> +       }
>> +
>> +       /*
>> +        * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
>> +        * Format as per DP 1.4a spec and DP 2.0 respectively.
>> +        */
>> +       if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
>> +               goto out;
>> +
>> +       /* VSC SDP Payload for DB16 through DB18 */
>> +       /* Pixel Encoding and Colorimetry Formats  */
>> +       sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
>> +       sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
>> +
>> +       switch (vsc->bpc) {
>> +       case 6:
>> +               /* 6bpc: 0x0 */
>> +               break;
>> +       case 8:
>> +               sdp->db[17] = 0x1; /* DB17[3:0] */
>> +               break;
>> +       case 10:
>> +               sdp->db[17] = 0x2;
>> +               break;
>> +       case 12:
>> +               sdp->db[17] = 0x3;
>> +               break;
>> +       case 16:
>> +               sdp->db[17] = 0x4;
>> +               break;
>> +       default:
>> +               WARN(1, "Missing case %d\n", vsc->bpc);
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* Dynamic Range and Component Bit Depth */
>> +       if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
>> +               sdp->db[17] |= 0x80;  /* DB17[7] */
>> +
>> +       /* Content Type */
>> +       sdp->db[18] = vsc->content_type & 0x7;
>> +
>> +out:
>> +       return length;
>> +}
>> +EXPORT_SYMBOL(drm_dp_vsc_sdp_pack);
>> +
>>   /**
>>    * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
>>    * @dpcd: DisplayPort configuration data
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 217196196e50..a9458df475e2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4089,73 +4089,6 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>>          return false;
>>   }
>>
>> -static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
>> -                                    struct dp_sdp *sdp, size_t size)
>> -{
>> -       size_t length = sizeof(struct dp_sdp);
>> -
>> -       if (size < length)
>> -               return -ENOSPC;
>> -
>> -       memset(sdp, 0, size);
>> -
>> -       /*
>> -        * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
>> -        * VSC SDP Header Bytes
>> -        */
>> -       sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
>> -       sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
>> -       sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
>> -       sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
>> -
>> -       if (vsc->revision == 0x6) {
>> -               sdp->db[0] = 1;
>> -               sdp->db[3] = 1;
>> -       }
>> -
>> -       /*
>> -        * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
>> -        * Format as per DP 1.4a spec and DP 2.0 respectively.
>> -        */
>> -       if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
>> -               goto out;
>> -
>> -       /* VSC SDP Payload for DB16 through DB18 */
>> -       /* Pixel Encoding and Colorimetry Formats  */
>> -       sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
>> -       sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
>> -
>> -       switch (vsc->bpc) {
>> -       case 6:
>> -               /* 6bpc: 0x0 */
>> -               break;
>> -       case 8:
>> -               sdp->db[17] = 0x1; /* DB17[3:0] */
>> -               break;
>> -       case 10:
>> -               sdp->db[17] = 0x2;
>> -               break;
>> -       case 12:
>> -               sdp->db[17] = 0x3;
>> -               break;
>> -       case 16:
>> -               sdp->db[17] = 0x4;
>> -               break;
>> -       default:
>> -               MISSING_CASE(vsc->bpc);
>> -               break;
>> -       }
>> -       /* Dynamic Range and Component Bit Depth */
>> -       if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
>> -               sdp->db[17] |= 0x80;  /* DB17[7] */
>> -
>> -       /* Content Type */
>> -       sdp->db[18] = vsc->content_type & 0x7;
>> -
>> -out:
>> -       return length;
>> -}
>> -
>>   static ssize_t
>>   intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
>>                                           const struct hdmi_drm_infoframe *drm_infoframe,
>> @@ -4248,8 +4181,8 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>>
>>          switch (type) {
>>          case DP_SDP_VSC:
>> -               len = intel_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
>> -                                           sizeof(sdp));
>> +               len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
>> +                                         sizeof(sdp));
>>                  break;
>>          case HDMI_PACKET_TYPE_GAMUT_METADATA:
>>                  len = intel_dp_hdr_metadata_infoframe_sdp_pack(dev_priv,
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> index d02014a87f12..8474504d4c88 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -812,4 +812,7 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>>                         int bpp_x16, unsigned long flags);
>>   int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
>>
>> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
>> +                           struct dp_sdp *sdp, size_t size);
>> +
>>   #endif /* _DRM_DP_HELPER_H_ */
>> --
>> 2.34.1
>>
> 
> 
