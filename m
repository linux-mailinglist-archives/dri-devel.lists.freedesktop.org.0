Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC03915AB9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 01:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E8810E16A;
	Mon, 24 Jun 2024 23:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="DPP2yGcl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B1F10E16A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 23:41:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OJ7Zer020319;
 Mon, 24 Jun 2024 23:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FzbWLwx5kmHGd9u6t0c45ZTO5Zh47AOd4L4VUr6uTAQ=; b=DPP2yGcl//4uCKnd
 sTYZPbT7Ra24eDhVS9KKfP8rBagNQdO6+pWjorfupTj1DRxedibnC2loUA+HW6XX
 dcLB+I8TDTFr63kBozuxnptnQl64BM/IXyDUuL+mHhN+G2XO4HXpeB7DzKxJQuAy
 8IPgoGHmTn+I3n2bN3cLCdUwKLPI97s/bYcGB1NKOJXdvUes56f8iKEn+jfpd/jc
 G36q5h6fVatRwDPxeu4p701qQIF/s/qGomJ0AFX1K/hP1nHQ5uvJx1NfgDL+MGlA
 zsLNScdKaoCSJSTTQs24S43MUrWKg/Q2TpsXjlEFiF8Mz/S5eQ2oQHhWVh4yJE9f
 y0lAVw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6ymvef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 23:41:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45ONfmJh007937
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 23:41:48 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 16:41:48 -0700
Message-ID: <de8ab492-272c-4bed-92eb-a0c3303543b2@quicinc.com>
Date: Mon, 24 Jun 2024 16:41:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/panel: jd9365da: Modify the method of sending
 commands
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 <dmitry.torokhov@gmail.com>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.co>,
 <dianders@google.com>, <hsinyi@google.com>, <jagan@edgeble.ai>,
 <neil.armstrong@linaro.org>, <dmitry.baryshkov@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7m_-aN2Z8ZXD2rpIlvxQAzzlmjWO4sOZ
X-Proofpoint-ORIG-GUID: 7m_-aN2Z8ZXD2rpIlvxQAzzlmjWO4sOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_20,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240190
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



On 6/24/2024 7:19 AM, Zhaoxiong Lv wrote:
> Currently, the init_code of the jd9365da driver is placed
> in the enable() function and sent, but this seems to take
> a long time. It takes 17ms to send each instruction (an init
> code consists of about 200 instructions), so it takes
> about 3.5s to send the init_code. So we moved the sending
> of the inti_code to the prepare() function, and each
> instruction seemed to take only 25μs.
> 
> We checked the DSI host and found that the difference in
> command sending time is caused by the different modes of
> the DSI host in prepare() and enable() functions.
> Our DSI Host only supports sending cmd in LP mode, The
> prepare() function can directly send init_code (LP->cmd)
> in LP mode, but the enable() function is in HS mode and
> needs to switch to LP mode before sending init code
> (HS->LP->cmd->HS). Therefore, it takes longer to send
> the command.
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

Hi Zhaoxiong,

Just curious, if the host expects that commands are sent in LP mode, why 
isn't the MIPI_DSI_MODE_LPM flag set before sending the DCS commands?

Thanks,

Jessica Zhang

> ---
> Changes between V5 and V4:
> - 1. No changes.
> 
> V4:https://lore.kernel.org/all/20240620080509.18504-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> Changes between V4 and V3:
> - 1. Only move mipi_dsi_dcs_write_buffer from enable() function to prepare() function,
> -    and no longer use mipi_dsi_dcs_write_seq_multi.
> 
> V3:https://lore.kernel.org/all/20240614145510.22965-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> ---
>   .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 24 +++++++++----------
>   1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 4879835fe101..a9c483a7b3fa 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -52,21 +52,9 @@ static int jadard_enable(struct drm_panel *panel)
>   {
>   	struct device *dev = panel->dev;
>   	struct jadard *jadard = panel_to_jadard(panel);
> -	const struct jadard_panel_desc *desc = jadard->desc;
>   	struct mipi_dsi_device *dsi = jadard->dsi;
> -	unsigned int i;
>   	int err;
>   
> -	msleep(10);
> -
> -	for (i = 0; i < desc->num_init_cmds; i++) {
> -		const struct jadard_init_cmd *cmd = &desc->init_cmds[i];
> -
> -		err = mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365DA_INIT_CMD_LEN);
> -		if (err < 0)
> -			return err;
> -	}
> -
>   	msleep(120);
>   
>   	err = mipi_dsi_dcs_exit_sleep_mode(dsi);
> @@ -100,6 +88,8 @@ static int jadard_disable(struct drm_panel *panel)
>   static int jadard_prepare(struct drm_panel *panel)
>   {
>   	struct jadard *jadard = panel_to_jadard(panel);
> +	const struct jadard_panel_desc *desc = jadard->desc;
> +	unsigned int i;
>   	int ret;
>   
>   	ret = regulator_enable(jadard->vccio);
> @@ -117,7 +107,15 @@ static int jadard_prepare(struct drm_panel *panel)
>   	msleep(10);
>   
>   	gpiod_set_value(jadard->reset, 1);
> -	msleep(120);
> +	msleep(130);
> +
> +	for (i = 0; i < desc->num_init_cmds; i++) {
> +		const struct jadard_init_cmd *cmd = &desc->init_cmds[i];
> +
> +		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365DA_INIT_CMD_LEN);
> +		if (ret < 0)
> +			return ret;
> +	}
>   
>   	return 0;
>   }
> -- 
> 2.17.1
> 
