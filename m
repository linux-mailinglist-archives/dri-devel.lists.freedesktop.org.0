Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA69D7A5412
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 22:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F58010E335;
	Mon, 18 Sep 2023 20:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE0210E335
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 20:27:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38IK7O5V029990; Mon, 18 Sep 2023 20:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ACVw4rp0FamgaBhcqjxntg9e4OvnXiwruT7sOlPwj8I=;
 b=UrTuqvJ617mOQgwtl3uppx9k3PcN3wt97BS3N+LPAyqnXuanvHias2rCjRcxrCH2R0np
 0HKEeGbEDTy7IfELI1b7E6lWWgzk0TU5NhEu+nHsM11fK+6D2eRNJ9rxfgxUgBZ6Q/NS
 Meyen7C+Jkh8N+bLiYOw0s/ZQBaFFIFq6FoTtdt+ILDEgoJMQaPwepg6wwZhzhaJfjPa
 3XyLx3VkwHivbRYmCqqjRtBpA70tmm/unZEt73hL2L07GYfoPSOShij9BCB+IyHO9qCg
 NsTvMhbd8Rx7jQ/ShOY1iqfdm6L6TI+WnY6iX0R98tzIcEVOwVDI4ndtlS5P4RTrUWQ3 Kg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6mts9apr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 20:27:07 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IKR6jr005970
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 20:27:06 GMT
Received: from [10.110.125.66] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 18 Sep
 2023 13:27:06 -0700
Message-ID: <64760d6e-10f4-4108-d467-f40289a1c6b4@quicinc.com>
Date: Mon, 18 Sep 2023 13:27:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/9] drm/panel: nv3052c: Wait before entering sleep
 mode
Content-Language: en-US
To: John Watts <contact@jookia.org>, <dri-devel@lists.freedesktop.org>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-5-contact@jookia.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230918125853.2249187-5-contact@jookia.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AiiOecIg-oIqUSVsEc1jm7-2K1ue1XDx
X-Proofpoint-ORIG-GUID: AiiOecIg-oIqUSVsEc1jm7-2K1ue1XDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_09,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180178
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/18/2023 5:58 AM, John Watts wrote:
> The panel needs us to wait 120ms between exiting and entering sleep.
> Guarantee that by always waiting 150ms before entering sleep mode.

Hi John,

Same question as the last patch -- is this a fix for something?

Thanks,

Jessica Zhang

> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>   drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 2526b123b1f5..307335d0f1fc 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -289,6 +289,9 @@ static int nv3052c_unprepare(struct drm_panel *panel)
>   	struct mipi_dbi *dbi = &priv->dbi;
>   	int err;
>   
> +	/* Wait 150ms in case we just exited sleep mode */
> +	msleep(150);
> +
>   	err = mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
>   	if (err)
>   		dev_err(priv->dev, "Unable to enter sleep mode: %d\n", err);
> -- 
> 2.42.0
> 
