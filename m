Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EF596FDF2
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 00:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D48610EB17;
	Fri,  6 Sep 2024 22:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UiyYPaW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD2710EB17
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 22:27:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4869JEH1013737;
 Fri, 6 Sep 2024 22:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DVRyQIqwVWANWjqFBWJEurI2bEK456iogcWfFqLN0EY=; b=UiyYPaW2pcGAH74O
 RTMv4OVZMqDn8DAMSXfawmdbxYaJOJJOLEmUmGupzI84hItBH4jClTo80stdb2Ad
 zLsMLrUj3UP5Qj2k96KRGB+MTUSYqw0T44s+gFEpLkjkvyH9lEVkGrwz0ZnyvPHo
 eFaioOuk0vxdfoYepFkdUqKBA1wC5PfeShGnyeV8GvudtN4vUoSrdBKnyJMhavHE
 Iyh6Ya93RDprY1+tZqP4fzC/1VNCD2w250zlUTChNN9h/b8gCABevky7Evvx6c88
 o8252bfiQl7PFYq5swpGfE+whuQPltWd0r8/Em5qNqfDo1+i8i3Lyofu8Yk/nm6C
 Gc5DQg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fj03bem3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2024 22:26:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486MQrG9017708
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Sep 2024 22:26:53 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 15:26:53 -0700
Message-ID: <a563280b-1ce6-4bfc-92e5-57546eb1a544@quicinc.com>
Date: Fri, 6 Sep 2024 15:26:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel: hx83112a: Transition to wrapped mipi_dsi
 functions
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, <neil.armstrong@linaro.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <skhan@linuxfoundation.org>, <rbmarliere@gmail.com>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, kernel
 test robot <lkp@intel.com>
References: <20240903173130.41784-1-abhishektamboli9@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240903173130.41784-1-abhishektamboli9@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -W2x0Gw-Ac1FyXmu58Gucw53a38FJnbJ
X-Proofpoint-ORIG-GUID: -W2x0Gw-Ac1FyXmu58Gucw53a38FJnbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_07,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409060167
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



On 9/3/2024 10:31 AM, Abhishek Tamboli wrote:
> Transition to mipi_dsi_dcs_write_seq_multi() macros for initialization
> sequences. The previous mipi_dsi_dcs_write_seq() macros were
> non-intuitive and use other wrapped MIPI DSI functions in the
> driver code to simplify the code pattern.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@intel.com/
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
> Changes in v2:
> - Update the commit message to explain the reason for the change.
> - Correct the code by changing 'dsi->mode_flags' to 'dsi_ctx.dsi->mode_flags'
> This change addresses a build error in v1 reported by kernel test robot
> caused by using an undeclared variable 'dsi'.
> [v1] : https://lore.kernel.org/all/20240902170153.34512-1-abhishektamboli9@gmail.com/
> 
>   drivers/gpu/drm/panel/panel-himax-hx83112a.c | 140 ++++++++-----------
>   1 file changed, 60 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
> index 466c27012abf..6c457d17fd11 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83112a.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
> @@ -58,30 +58,28 @@ static void hx83112a_reset(struct hx83112a_panel *ctx)
> 
>   static int hx83112a_on(struct hx83112a_panel *ctx)
>   {
> -	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> -
> -	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};
> +
> +	dsi_ctx.dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> 
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER1,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER1,
>   			       0x08, 0x28, 0x28, 0x83, 0x83, 0x4c, 0x4f, 0x33);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDISP,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDISP,
>   			       0x00, 0x02, 0x00, 0x90, 0x24, 0x00, 0x08, 0x19,
>   			       0xea, 0x11, 0x11, 0x00, 0x11, 0xa3);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
>   			       0x58, 0x68, 0x58, 0x68, 0x0f, 0xef, 0x0b, 0xc0,
>   			       0x0b, 0xc0, 0x0b, 0xc0, 0x00, 0xff, 0x00, 0xff,
>   			       0x00, 0x00, 0x14, 0x15, 0x00, 0x29, 0x11, 0x07,
>   			       0x12, 0x00, 0x29);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
>   			       0x00, 0x12, 0x12, 0x11, 0x88, 0x12, 0x12, 0x00,
>   			       0x53);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
>   			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
>   			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
>   			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
> @@ -90,8 +88,8 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
>   			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
>   			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
>   			       0x40);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
>   			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
>   			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
>   			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
> @@ -100,8 +98,8 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
>   			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
>   			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
>   			       0x40);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
>   			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
>   			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
>   			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
> @@ -110,13 +108,13 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
>   			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
>   			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
>   			       0x40);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTCON,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTCON,
>   			       0x70, 0x00, 0x04, 0xe0, 0x33, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPANEL, 0x08);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER2, 0x2b, 0x2b);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPANEL, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER2, 0x2b, 0x2b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
>   			       0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08,
>   			       0x08, 0x03, 0x03, 0x22, 0x18, 0x07, 0x07, 0x07,
>   			       0x07, 0x32, 0x10, 0x06, 0x00, 0x06, 0x32, 0x10,
> @@ -124,105 +122,87 @@ static int hx83112a_on(struct hx83112a_panel *ctx)
>   			       0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x08,
>   			       0x09, 0x30, 0x00, 0x00, 0x00, 0x06, 0x0d, 0x00,
>   			       0x0f);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
>   			       0x00, 0x00, 0x19, 0x10, 0x00, 0x0a, 0x00, 0x81);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP1,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP1,
>   			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
>   			       0xc0, 0xc0, 0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
>   			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
>   			       0x28, 0x28, 0x24, 0x24, 0x02, 0x03, 0x02, 0x03,
>   			       0x00, 0x01, 0x00, 0x01, 0x31, 0x31, 0x31, 0x31,
>   			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP2,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP2,
>   			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
>   			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19,
>   			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
>   			       0x24, 0x24, 0x28, 0x28, 0x01, 0x00, 0x01, 0x00,
>   			       0x03, 0x02, 0x03, 0x02, 0x31, 0x31, 0x31, 0x31,
>   			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
>   			       0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea,
>   			       0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa,
>   			       0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa, 0xaa, 0xaa);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
>   			       0xaa, 0x2e, 0x28, 0x00, 0x00, 0x00, 0xaa, 0x2e,
>   			       0x28, 0x00, 0x00, 0x00, 0xaa, 0xee, 0xaa, 0xaa,
>   			       0xaa, 0xaa, 0xaa, 0xee, 0xaa, 0xaa, 0xaa, 0xaa);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
>   			       0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, 0xff,
>   			       0xff, 0xff, 0xff, 0xff);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
>   			       0xaa, 0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
>   			       0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xff, 0xff, 0xff,
>   			       0xff, 0xff, 0xaa, 0xff, 0xff, 0xff, 0xff, 0xff);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
>   			       0x0e, 0x0e, 0x1e, 0x65, 0x1c, 0x65, 0x00, 0x50,
>   			       0x20, 0x20, 0x00, 0x00, 0x02, 0x02, 0x02, 0x05,
>   			       0x14, 0x14, 0x32, 0xb9, 0x23, 0xb9, 0x08);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
>   			       0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
>   			       0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,
>   			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>   			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
>   			       0x00, 0x00, 0x00, 0x02, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc3);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETCLOCK, 0xd1, 0xd6);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc6);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPTBA, 0x37);
> -	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
> -
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(150);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETCLOCK, 0xd1, 0xd6);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc6);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPTBA, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);
> 
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display on: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(50);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 150);
> 
> -	return 0;
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	return dsi_ctx.accum_err;
>   }
> 
>   static int hx83112a_disable(struct drm_panel *panel)
>   {
>   	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
> -	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};
> 
> -	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +	dsi_ctx.dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> 
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display off: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(20);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> 
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(120);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> 
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
> 
>   static int hx83112a_prepare(struct drm_panel *panel)
> --
> 2.34.1
> 
