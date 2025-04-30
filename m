Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF3AA3EE0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 02:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC10710E59E;
	Wed, 30 Apr 2025 00:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dawybj5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBB510E59E;
 Wed, 30 Apr 2025 00:31:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLadN5002524;
 Wed, 30 Apr 2025 00:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SH/hrE0EhbsEBMChKmI5FF04Vp+oBu+tOb0ZSc9FU4c=; b=dawybj5WLIu15I27
 WJwdwcwsrPpJzXzalo5JZW+mjX5exH+OVhWjTWvOAf09uBP93WsR2010MzAxQP28
 4WEGKAD+wo3wQLd9d9scy0/S2wribJeiE9oWCX0ZRCkbI3GefZscYtt1FJ324Wxt
 fLtwAinpInurIURPaC1Oml2tZxFVz2WKjx7iqd13Z6tt7Je70ScHRZJGSDvcnFZa
 2j9qqpkTiibS1uYJEgCb6OjgjFA5IRVx1e8ytI3mh+h5jLWY6nU8mxmhDPh3EJ8W
 tS8/7l67ZckBnWj7KabnopCeA8m8Y6WCZsmMbp2CtFVin7/DVBm+2vHmpUW4yI4h
 Khj5TA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u889y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 00:30:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U0UKMl010616
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 00:30:20 GMT
Received: from [10.110.114.218] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 17:30:15 -0700
Message-ID: <5ee6f036-104b-4c53-87ce-8cec07c0b035@quicinc.com>
Date: Tue, 29 Apr 2025 17:30:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of
 msm_hdmi_set_timings()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
 <20250408-drm-hdmi-acr-v2-2-dee7298ab1af@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250408-drm-hdmi-acr-v2-2-dee7298ab1af@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68116f2f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=q8S6-B7p12HAI_vjdQ4A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: z8hNlKXExkpvo2EQM06B9NDPU8M4VSd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAwMiBTYWx0ZWRfX6gcbSXtdEmCH
 gIzMjnpPXfiQxaK6AQtzbJv8czUVxF7+DWBBF9zqypu7lTy8iSLb6f4MH0dU5U2vTXIDNavzUb7
 5/fzy4D7oGn0YUiFKHyakh3UhN7qyiUl7MPBsvZbxvMNjNvks+G78oq9LFQcEqYRqe59eYmJcMa
 s2/Q9KPr2lGThq0QnZiWpIvcjmtXirtQFgTP+GocpmKf+/5sEUVxI3ZLZd2qAS00JCji1t0vsRf
 OlR1smpnidtk46DhSHbcaqk+japseDbvwcNyHxtx+cLZmRH9Ujw7Bgy+h1TQ1moD5n3E4UWGD2h
 gxrbFUcYYYjwlITsjtYi08McuJEKGsOcAvQ2pUY/k643o7qp/vlh243NCPd59z7osv1fqv6xQjn
 xMQggKXUe2KodSmk9WOaqZZ+coWBXu/kgBWnVdn7CNZArNxNzKlRGPR4icB2TUt3LIPQ7QOI
X-Proofpoint-ORIG-GUID: z8hNlKXExkpvo2EQM06B9NDPU8M4VSd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1011
 mlxscore=0 impostorscore=0 mlxlogscore=664 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300002
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



On 4/8/2025 6:54 AM, Dmitry Baryshkov wrote:
> There is a duplication between msm_hdmi_audio_update() calls in
> msm_hdmi_set_timings() and msm_hdmi_bridge_atomic_pre_enable(). Merge
> those two calls to be performed unconditionally at
> msm_hdmi_bridge_atomic_pre_enable().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
