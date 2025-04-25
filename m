Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E6FA9D188
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4812510E9A5;
	Fri, 25 Apr 2025 19:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lZWfl9X/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358C110E9A5;
 Fri, 25 Apr 2025 19:28:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwXq032071;
 Fri, 25 Apr 2025 19:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9mFLn8fdySd3Qr5bxZppl9BhUtB9tSFBf3hiiMzBeo4=; b=lZWfl9X/7plLq9ww
 OuPuOhPLQmlO5Soc41/bnhBVyY5XRreYl/3mDeMayB1zzWjPT0+4wPc7lvWZoXbb
 CPSxJJzlgxOY5tYDz0NaNy17ohLpQeyBu0xepBiMBjIkucZ/PCQuTvzNy39SyfBg
 7e5lOX9bzmaZTGRDC9Ki1Nc5d1jCylH7irZ5qNVj7+ZCmY2Iz9wsVcgsEdcC0UGl
 eKI0huMKXSHdAcMpKSp20DAyM91ufPogk94VnfjJk300kjtazeFqq4pLFKhlW7jb
 KlBXg0t38cmyOHGTTK1kCfWZuzT2R1cr1OZRag4Zc98bX70UXwAavQlZpAqcEuur
 UDUbMA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh19ygy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 19:27:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PJRnrw030943
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 19:27:49 GMT
Received: from [10.110.43.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 12:27:47 -0700
Message-ID: <3179a6f7-d052-436d-8c76-5bbdf373ec62@quicinc.com>
Date: Fri, 25 Apr 2025 12:27:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Hermes Wu
 <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <06448824-81a6-41de-b44f-32101b889258@quicinc.com>
 <4isbdbp5z2kr4pnkp5gstridtwv2pyceqfea6lhkxaa7s3epvw@7s3qtp7m6ovl>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <4isbdbp5z2kr4pnkp5gstridtwv2pyceqfea6lhkxaa7s3epvw@7s3qtp7m6ovl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VTYKbmgAaxFYmjz9AqHCAPK4fE-YMkVD
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680be236 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=TaMUQpHDU3K6OwaTzKwA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VTYKbmgAaxFYmjz9AqHCAPK4fE-YMkVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzOSBTYWx0ZWRfX27JD0cq23hXK
 EJjwvXX7WMc8JvU4J2zbNizMjO8VP4FXhC8N9FBxNHv26FKPm6NokAIlCao0p1QDnENqDgTOHh6
 H5HP5lNMQpd/ohOGfJ5XzUFzzULNksXJBKwYK4jL3mriXGEyoceoq52eGITCnjpj69csY8Lzfeb
 d2pnJNO4joX23Fysimxal8ukqn0LExnnzTTCmeVa6TDv6i/7TNvHQ/ud89GrIrt6YZqZFyQYy3P
 fpjvzZbtN3PsXlq13ZBJ5wlN8fDpB5JALdHJY3WmwyLs6woZ2bjFmE7BHWPwFYdBxuiXUfY7M69
 IFe1Cd/HHUGNW/m4nqx3WrXRG3kAbHzFMNSjN41mkiXhtnU++FoZDP7xHn1fVYRKFEjNCDaebB3
 2Ba/mwqEwhtw+wJUC88slK4pCpiSH6Rup7aU7+H4NugE+dSpZpc15tCskySbQzrkre5ux6m7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=649 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250139
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



On 4/25/2025 12:10 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 24, 2025 at 06:55:50PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 4/23/2025 10:52 AM, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <lumag@kernel.org>
>>>
>>> The MSM DisplayPort driver implements several HDMI codec functions
>>> in the driver, e.g. it manually manages HDMI codec device registration,
>>> returning ELD and plugged_cb support. In order to reduce code
>>> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
>>> integration.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> A lot of DisplayPort bridges use HDMI Codec in order to provide audio
>>> support. Present DRM HDMI Audio support has been written with the HDMI
>>> and in particular DRM HDMI Connector framework support, however those
>>> audio helpers can be easily reused for DisplayPort drivers too.
>>>
>>> Patches by Hermes Wu that targeted implementing HDMI Audio support in
>>> the iTE IT6506 driver pointed out the necessity of allowing one to use
>>> generic audio helpers for DisplayPort drivers, as otherwise each driver
>>> has to manually (and correctly) implement the get_eld() and plugged_cb
>>> support.
>>>
>>> Implement necessary integration in drm_bridge_connector and provide an
>>> example implementation in the msm/dp driver.
>>> ---
>>> Changes in v7:
>>> - Dropped applied patches
>>> - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
>>>
>>> Changes in v6:
>>> - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
>>>     callbacks to the drm_bridge interface (Maxime)
>>> - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
>>>
>>> Changes in v5:
>>> - Rebased on top of linux-next, also handling HDMI audio piece of the
>>>     MSM HDMI driver.
>>> - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
>>>
>>> Changes in v4:
>>> - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
>>>     HDMI driver.
>>> - Drop outdated comment regarding subconnector from the commit message.
>>> - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
>>>
>>> Changes in v3:
>>> - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
>>>     (Laurent, Maxime)
>>> - Dropped the subconnector patch (again)
>>> - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
>>>
>>> Changes in v2:
>>> - Added drm_connector_attach_dp_subconnector_property() patches
>>> - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
>>> ---
>>>    drivers/gpu/drm/msm/Kconfig         |   1 +
>>>    drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
>>>    drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
>>>    drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
>>>    drivers/gpu/drm/msm/dp/dp_display.h |   6 --
>>>    drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
>>>    6 files changed, 31 insertions(+), 170 deletions(-)
>>>
>>
>> Looks fine to me, just one question, please confirm if DP audio was
>> re-verified after this change.
> 
> Yes
> 

Thanks for confirming,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

