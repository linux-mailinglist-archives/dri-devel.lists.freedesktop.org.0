Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D24AC27AB
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 18:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FCF10E843;
	Fri, 23 May 2025 16:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mtOl8AnF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D9710E843
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 16:31:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFSlY9028753;
 Fri, 23 May 2025 16:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l/GrWp4HULjcDXYDW8Gpf3PiKQTF8RUOBLQlrUOZL18=; b=mtOl8AnFmq61+wmp
 uKLg76S63Ks7G3gGRC1zmZ1B8UlAXDQ6MXDxWR9q+19ihrc2iOK3ogLGI++7VOwF
 JKjq3teBGnbbca0ZRlB4MLlHypXj2KtBtNDfY6ckNaCehe0+Ji0JolVdofT3oP8/
 RSgppDs5VdIUjfwpMIuJhETw3pm4BIGAQ7avczPCX5fRgdAN9OPN1bCVB73QuNjj
 LZyU0m35bjEmHjizXv70K/HK/jCub7H/bUE/3g2ixRb69SZtAz23hK2c4e6EfPSc
 eNZyVMaYTGSXdNpcClWvdtz1uZwtf2Hz7tzCg9Va+B3Gxr3MxMWAjRU42z0s2mk3
 vHWCdg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c299hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 16:31:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54NGVWKm019916
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 16:31:32 GMT
Received: from [10.110.22.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 May
 2025 09:31:30 -0700
Message-ID: <bdd44c38-24dc-4775-88cd-c96696e6bb4b@quicinc.com>
Date: Fri, 23 May 2025 09:31:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/panel: nt37801: Fix IS_ERR() vs NULL check in
 probe()
To: Dan Carpenter <dan.carpenter@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
References: <aDCdn9r_ZAUTRpWn@stanley.mountain>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <aDCdn9r_ZAUTRpWn@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1MCBTYWx0ZWRfXx0q0YYhFtXxQ
 zVgrtrowFCrjpL3XfIOZ8uLoBMzCOK9dcnyHjwXQInvLiVItMheszQpxUsA8YaYijtpNqUR2nGG
 5Y/NFgGXxaz0l0aSXAhKaPD3sQoCpPpUVN05dQB09ohWbXtywrkUMce5umFWJjVcwi7wdgCc3ch
 tdJvP/wg26BA+VXI0QWoj1xmHUGRPTacBwQOE7VkHIF1IzOlc7K+DM/WY2aiyOeQ7y9yLPsoPfY
 i9Y0LFzokA0CRWbFscCWijoMVZJ3922cTPvnAUh7i5r/ziA7bK7phgnbOIHcufHvvaev2f7zjcw
 hJVjFtAkrLVt8ji53vhPDxDkEYqnIRG9sVqGeidPe4ExNe98p1O7uzCAOxbN6FXz/Jyr7O1PFDH
 EAjDL/7np9BzbkCCQKzI3bdbzGWpobrydI37BkevAi7mqeWRRf/p7UTnrj4ORhoaALFFvUmU
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=6830a2e4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=XMHdZpqdGEBm9EcGwjcA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: l51ohz8uEy-T7YCnPHWwGRVsnyd7SAcg
X-Proofpoint-GUID: l51ohz8uEy-T7YCnPHWwGRVsnyd7SAcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230150
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



On 5/23/2025 9:09 AM, Dan Carpenter wrote:
> The devm_drm_panel_alloc() function returns error pointers, it doesn't
> return NULL.  Update the check to match.
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-novatek-nt37801.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> index 84d367eab058..d6a37d7e0cc6 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> @@ -257,8 +257,8 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
>   	ctx = devm_drm_panel_alloc(dev, struct novatek_nt37801, panel,
>   				   &novatek_nt37801_panel_funcs,
>   				   DRM_MODE_CONNECTOR_DSI);
> -	if (!ctx)
> -		return -ENOMEM;
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
>   
>   	ret = devm_regulator_bulk_get_const(dev,
>   					    ARRAY_SIZE(novatek_nt37801_supplies),

