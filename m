Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7D93D86F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 20:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEF210E09C;
	Fri, 26 Jul 2024 18:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LxKHjQ3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC7D10E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 18:39:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QCTACd015435;
 Fri, 26 Jul 2024 18:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PKfdBeoNwNM3l/U+Qodf32d/VP9ieMwFD3DYkb1YDfM=; b=LxKHjQ3xQrY0pX+2
 RF7yem0N4gv+fMFZweDj5HMlwum58+dacbIl9sJ9yETo/+LhHYfWR0Q4NZ8BCXg7
 Mw15kZBS9PSd4yMoK/rZwAhFV4crz04fUSoerU3jLT5uxUxGeHMSzThD37byIp/+
 rvvspEX5SaIlzeRXftq/dXTnZ/gO/BPxy0P4xVNN3ra008uO/W+a72LgEC9en933
 b2z5vOHaKbXR4ke6+rM42ypsYVc22VZxlxQxlNCwQq34pom0DwmPbHkP0OF0A5bG
 iWTWkWk+e/YstTe42FM0monq2GK7w3aCsusEO+KLHwUJBEfgBDViLzz753aURjN6
 QL4Pfg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1urt7c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2024 18:39:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46QId0L5003832
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2024 18:39:00 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 11:38:59 -0700
Message-ID: <6ae6dda5-1e49-4ed1-8748-b086ad4008a4@quicinc.com>
Date: Fri, 26 Jul 2024 11:38:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/panel: jd9365da: Modify the init code of Melfas
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 <neil.armstrong@linaro.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <dianders@chromium.org>,
 <hsinyi@google.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <jagan@edgeble.ai>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240725083245.12253-3-lvzhaoxiong@huaqin.corp-partner.google.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240725083245.12253-3-lvzhaoxiong@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wujxKLDR5aJkY3RyZA1uY3fsE3RzBz6E
X-Proofpoint-ORIG-GUID: wujxKLDR5aJkY3RyZA1uY3fsE3RzBz6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407260125
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



On 7/25/2024 1:32 AM, Zhaoxiong Lv wrote:
> Modify the Melfas panel init code to satisfy the gamma
> value of 2.2
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

Hi Zhaoxiong,

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 78 +++++++++----------
>   1 file changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index ce73e8cb1db5..44897e5218a6 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -873,22 +873,22 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
>   	jd9365da_switch_page(&dsi_ctx, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xbf);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xbf);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x70);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x2d);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x2d);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x7e);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfd);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x28);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x12);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x7e);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x7f);
> @@ -899,47 +899,47 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x01);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x8e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x6a);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x09);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x2e);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x1a);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x15);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x69);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x59);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x4e);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x4c);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x40);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x45);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x30);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x4a);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x49);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x4a);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x68);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x57);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x5b);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x4e);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x73);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x38);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x4f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x3e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x31);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x12);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x69);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x59);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x4e);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x4c);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x40);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x45);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x30);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x4a);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x49);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x4a);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x68);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x57);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x5b);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x4e);
> -	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x73);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x38);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x4f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x3e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x31);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x12);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x02);
> -- 
> 2.17.1
> 
