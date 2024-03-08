Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51F38768E1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 17:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D27113912;
	Fri,  8 Mar 2024 16:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kOGl/9do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073C611392B;
 Fri,  8 Mar 2024 16:52:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 428EaMvx025654; Fri, 8 Mar 2024 16:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=4h1nrQ0ADPnyDAxNzGXA7guhmQW/Wg/2BTZTLzTrfME=; b=kO
 Gl/9donaWIaz988tbIl0waBPR1q5/dNV1I0gqapiy5YycaOGrUGUallwHYnjAjTO
 Fypn2TSFtCHR/fPd1OGovByWwbBI4ABG+uViYKWeq8vkO7AqzOYOXza6NLV7C59/
 zgmoOSxs+oX9llsfOCvlAnOOZAXoYvHSzxb9VpT0au5XTdq+L5KgxErfD9X8gb2F
 V1lGWTW+VZcF1ez7poKWp9/dE11Z2w40a9tHGlP++SHSbtkhFeWDbeFHNGBcNF5J
 Wr6Q7+sjUhiiKMJjOtXrxKsdqZHm8m3YHQsMMRda5dRnaulTxlJmFVpg3FdSztJi
 Sr85yOxS2BqbzZxx748w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wr1wj0n1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Mar 2024 16:52:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 428GqMJF002623
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Mar 2024 16:52:22 GMT
Received: from [10.110.41.90] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Mar
 2024 08:52:21 -0800
Message-ID: <ab68d7a0-44a0-4e6a-82ea-7d7e3e9a718e@quicinc.com>
Date: Fri, 8 Mar 2024 08:52:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/panel: do not return negative error codes from
 drm_panel_get_modes()
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, <stable@vger.kernel.org>
References: <cover.1709913674.git.jani.nikula@intel.com>
 <79f559b72d8c493940417304e222a4b04dfa19c4.1709913674.git.jani.nikula@intel.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <79f559b72d8c493940417304e222a4b04dfa19c4.1709913674.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gyFQ5eOq4cAxLZEH7jMfOsYt57sPU1Ol
X-Proofpoint-GUID: gyFQ5eOq4cAxLZEH7jMfOsYt57sPU1Ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 mlxscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080134
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



On 3/8/2024 8:03 AM, Jani Nikula wrote:
> None of the callers of drm_panel_get_modes() expect it to return
> negative error codes. Either they propagate the return value in their
> struct drm_connector_helper_funcs .get_modes() hook (which is also not
> supposed to return negative codes), or add it to other counts leading to
> bogus values.
> 
> On the other hand, many of the struct drm_panel_funcs .get_modes() hooks
> do return negative error codes, so handle them gracefully instead of
> propagating further.
> 
> Return 0 for no modes, whatever the reason.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_panel.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index e814020bbcd3..cfbe020de54e 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -274,19 +274,24 @@ EXPORT_SYMBOL(drm_panel_disable);
>    * The modes probed from the panel are automatically added to the connector
>    * that the panel is attached to.
>    *
> - * Return: The number of modes available from the panel on success or a
> - * negative error code on failure.
> + * Return: The number of modes available from the panel on success, or 0 on
> + * failure (no modes).
>    */
>   int drm_panel_get_modes(struct drm_panel *panel,
>   			struct drm_connector *connector)
>   {
>   	if (!panel)
> -		return -EINVAL;
> +		return 0;
>   
> -	if (panel->funcs && panel->funcs->get_modes)
> -		return panel->funcs->get_modes(panel, connector);
> +	if (panel->funcs && panel->funcs->get_modes) {
> +		int num;
>   
> -	return -EOPNOTSUPP;
> +		num = panel->funcs->get_modes(panel, connector);
> +		if (num > 0)
> +			return num;

Hi Jani,

The change LGTM:

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> +	}
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL(drm_panel_get_modes);
>   
> -- 
> 2.39.2
> 
