Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF385C45F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2487710E515;
	Tue, 20 Feb 2024 19:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JG48f+o/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32F110E515;
 Tue, 20 Feb 2024 19:11:21 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KDWVfe030536; Tue, 20 Feb 2024 19:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=k5coFD2dm6ziOQ+2MCGWmBiW0babAHkBczzC59EceNo=; b=JG
 48f+o/mMuW7AZl//AXuTp+v8MaZoqvfRjrnb98FJUp7GMrMPx3h2goe4Q97JUoP/
 nw3kA+BSvpvvjfk9RYNFRIRXibEitTFCUl9RFai3bztMmEgIwS47R4IfeMBOmVs+
 mqX1UTGm1nvLa1soHQFphVfzgTSWYm9bK/7yQ5ieQviHfCuYw+A6gjDM+L37qirw
 iWqa/AXPhTD6EDUq1nWZOKgosczyIFsqog3IGfUBeOEMP0lr2eoinuTcYBcqGBUe
 r/75qw7RipXZJi/9t3VYE1lhv2OcR/2NMn5MYKsSb5Gbq3ntBT7swGIW470UptHs
 uMP5utvNSL0ii7/nymdg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wct2sh5k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:11:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KJBHLf000646
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:11:17 GMT
Received: from [10.110.53.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 11:11:17 -0800
Message-ID: <a4d23a83-e922-29f1-1839-cf743d39e6f6@quicinc.com>
Date: Tue, 20 Feb 2024 11:11:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
 DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
 <quic_khsieh@quicinc.com>, <marijn.suijten@somainline.org>,
 <neil.armstrong@linaro.org>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
 <20240216230228.26713-14-quic_parellan@quicinc.com>
 <CAA8EJppO4FcJJex8mBbPoDyUbkn4zFvDFR0h3sOY75Qth15Rng@mail.gmail.com>
 <30f383ce-0952-0dc1-a7a1-a7565526f728@quicinc.com>
 <CAA8EJpr4XKDQELhhnumqmH2Yh4qzh-gypR4tpRQ0eDhSB3U0Sw@mail.gmail.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJpr4XKDQELhhnumqmH2Yh4qzh-gypR4tpRQ0eDhSB3U0Sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jGeJA2GdLSI5hOdLGRZGxgkJV6w0ZorH
X-Proofpoint-ORIG-GUID: jGeJA2GdLSI5hOdLGRZGxgkJV6w0ZorH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=592 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402200138
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


On 2/20/2024 10:09 AM, Dmitry Baryshkov wrote:
> On Tue, 20 Feb 2024 at 19:55, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>
>> On 2/17/2024 12:56 AM, Dmitry Baryshkov wrote:
>>> On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>> +       }
>>>> +
>>>> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>>>> +       catalog = panel->catalog;
>>>> +       dp_mode = &dp_panel->dp_mode;
>>>> +
>>>> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
>>>> +
>>>> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
>>>> +       vsc_sdp_data.sdp_type = DP_SDP_VSC;
>>>> +       vsc_sdp_data.revision = 0x05;
>>>> +       vsc_sdp_data.length = 0x13;
>>>> +
>>>> +       /* VSC SDP Payload for DB16 */
>>>> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
>>>> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
>>>> +
>>>> +       /* VSC SDP Payload for DB17 */
>>>> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
>>>> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
>>>> +
>>>> +       /* VSC SDP Payload for DB18 */
>>>> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
>>>> +
>>>> +       len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &vsc_sdp, header);
>>>> +       if (len < 0) {
>>>> +               DRM_ERROR("unable to pack vsc sdp\n");
>>>> +               return len;
>>>> +       }
>>> So, at this point we have the header data both in vsc_sdp.sdp_header
>>> and in the packed header. The relationship between them becomes less
>>> obvious. Could you please pack dp_sdp_header into u32[2] just before
>>> writing it? It really makes little sense to pass both at the same
>>> time.
>>
>> Just want to clear some stuff up. Do you want to call the
>> dp_utils_pack_sdp_header() function right before
>> dp_catalog_panel_send_vsc_sdp()? The point of putting the
>> dp_utils_pack_sdp_header() function inside dp_utils_pack_vsc_sdp() is so
>> that all of the packing could be in the same location. Although I agree
>> that we are passing the same values twice, I believe that having it the
>> way it is currently is better since it shows that the
>> drm_dp_vsc_sdp_pack() and dp_utils_pack_sdp_header() are related since
>> they're packing the data to the set of GENERIC0 registers.
> I'm perfectly fine with dp_utils_pack_sdp_header() being called from
> within dp_catalog_panel_send_vsc_sdp(). This way you are not passing
> extra data and it is perfectly clear how the SDP header is handled
> before being written to the hardware.


Ack. Sounds good, I'll implement it that way


>
