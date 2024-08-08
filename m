Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D518194C71E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 00:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C54710E691;
	Thu,  8 Aug 2024 22:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cMt0EU1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52B310E691
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 22:56:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478LJ7HW016234;
 Thu, 8 Aug 2024 22:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +bK8U451oKXQpHMw6SXQEmr7FNx10pP5FH9M9n1I8+g=; b=cMt0EU1UwZAyH0qU
 P+9zkTGboAqGebbanImFVEq9+HziqzwxnbVRRE1d5UMZGXVPVCBXDwjrbATwB85j
 uUVeJ557m1Ii3u7yICywm3B0EcXjXzJrA4sEqtWZWZYAsQ98KAb5OI4fWbYnQhka
 kK3qNlCt9NUzBChmW6un4cWznsUsQYnPMuczugKGlFj0L1VRS+a3XqHUzPNwsr53
 ynQaGKmhQMtRMXwRqSmM77jfEhapOh1+BJ6mMR2K7+RM56NJgzRUxhMQ0PPfL9CK
 URHM/j5uwaQTGrq1NfiXhptQK5vI+saq6L+TsRQc2I4l5SPO2F+sSj6F6vhKfNfk
 CB2tQg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vue3t0sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Aug 2024 22:56:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 478MuX6t012837
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Aug 2024 22:56:33 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 15:56:32 -0700
Message-ID: <1518bded-72d8-4ed0-a63f-3dd21473b23b@quicinc.com>
Date: Thu, 8 Aug 2024 15:56:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/panel: jd9365da: Move "exit sleep mode" and
 "set display on" cmds
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 <neil.armstrong@linaro.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <dianders@chromium.org>,
 <hsinyi@google.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <jagan@edgeble.ai>, <dmitry.baryshkov@linaro.org>,
 <jani.nikula@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240807100429.13260-2-lvzhaoxiong@huaqin.corp-partner.google.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240807100429.13260-2-lvzhaoxiong@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kIrhcZcEoOFHAKuekpBSfd5nlyTMSNx7
X-Proofpoint-ORIG-GUID: kIrhcZcEoOFHAKuekpBSfd5nlyTMSNx7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_23,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 bulkscore=0 mlxscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080164
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



On 8/7/2024 3:04 AM, Zhaoxiong Lv wrote:
> Move the "exit sleep mode" and "set display on" command from
> enable() to init() function.
> 
> As mentioned in the patch:
> https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> The Mediatek Soc DSI host has different modes in prepare() and
> enable() functions, prepare() is in LP mode and enable() is in
> HS mode. Since the "exit sleep mode" and "set display on"
> command must also be sent in LP mode, so we also move "exit
> sleep mode" and "set display on" command to the init() function.
> 
> We have no other actions in the enable() function after moves
> "exit sleep mode" and "set display on", and we checked the call
> of the enable() function during the "startup" process. It seems
> that only one judgment was made in drm_panel_enabel(). If the
> panel does not define enable(), the judgment will skip the
> enable() and continue execution. This does not seem to have
> any other effect, and we found that some drivers also seem
> to have no enable() function added, for example:
> panel-asus-z00t-tm5p5-n35596 / panel-boe-himax8279d...
> In addition, we briefly tested the kingdisplay_kd101ne3 panel and
> melfas_lmfbx101117480 panel, and it seems that there is no garbage
> on the panel, so we delete enable() function.
> 
> After moving the "exit sleep mode" and "set display on" command
> to the init() function, we no longer need additional delay
> judgment, so we delete variables "exit_sleep_to_display_on_delay_ms"
> and "display_on_delay_ms".
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
> Changes between V3 and V2:
> -  1. The code has not changed, Just modified the nit in the commit
> -     information mentioned by Doug.
> v2: https://lore.kernel.org/all/20240806034015.11884-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> Changes between V2 and V1:
> -  1. The code has not changed, Modify the commit information.
> v1: https://lore.kernel.org/all/20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> ---
>   .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++---------
>   1 file changed, 32 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 04d315d96bff..ce73e8cb1db5 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -31,8 +31,6 @@ struct jadard_panel_desc {
>   	bool reset_before_power_off_vcioo;
>   	unsigned int vcioo_to_lp11_delay_ms;
>   	unsigned int lp11_to_reset_delay_ms;
> -	unsigned int exit_sleep_to_display_on_delay_ms;
> -	unsigned int display_on_delay_ms;
>   	unsigned int backlight_off_to_display_off_delay_ms;
>   	unsigned int display_off_to_enter_sleep_delay_ms;
>   	unsigned int enter_sleep_to_reset_down_delay_ms;
> @@ -66,26 +64,6 @@ static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
>   	return container_of(panel, struct jadard, panel);
>   }
>   
> -static int jadard_enable(struct drm_panel *panel)
> -{
> -	struct jadard *jadard = panel_to_jadard(panel);
> -	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
> -
> -	msleep(120);
> -
> -	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> -
> -	if (jadard->desc->exit_sleep_to_display_on_delay_ms)
> -		mipi_dsi_msleep(&dsi_ctx, jadard->desc->exit_sleep_to_display_on_delay_ms);
> -
> -	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> -
> -	if (jadard->desc->display_on_delay_ms)
> -		mipi_dsi_msleep(&dsi_ctx, jadard->desc->display_on_delay_ms);
> -
> -	return dsi_ctx.accum_err;
> -}
> -
>   static int jadard_disable(struct drm_panel *panel)
>   {
>   	struct jadard *jadard = panel_to_jadard(panel);
> @@ -202,7 +180,6 @@ static const struct drm_panel_funcs jadard_funcs = {
>   	.disable = jadard_disable,
>   	.unprepare = jadard_unprepare,
>   	.prepare = jadard_prepare,
> -	.enable = jadard_enable,
>   	.get_modes = jadard_get_modes,
>   	.get_orientation = jadard_panel_get_orientation,
>   };
> @@ -382,6 +359,12 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
>   
>   	jd9365da_switch_page(&dsi_ctx, 0x00);
>   
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
>   	return dsi_ctx.accum_err;
>   };
>   
> @@ -608,6 +591,12 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE6, 0x02);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE7, 0x0C);
>   
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
>   	return dsi_ctx.accum_err;
>   };
>   
> @@ -831,6 +820,16 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
>   
>   	jd9365da_switch_page(&dsi_ctx, 0x00);
>   
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
>   	return dsi_ctx.accum_err;
>   };
>   
> @@ -859,8 +858,6 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
>   	.reset_before_power_off_vcioo = true,
>   	.vcioo_to_lp11_delay_ms = 5,
>   	.lp11_to_reset_delay_ms = 10,
> -	.exit_sleep_to_display_on_delay_ms = 120,
> -	.display_on_delay_ms = 20,
>   	.backlight_off_to_display_off_delay_ms = 100,
>   	.display_off_to_enter_sleep_delay_ms = 50,
>   	.enter_sleep_to_reset_down_delay_ms = 100,
> @@ -1074,6 +1071,16 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x02);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe7, 0x06);
>   
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
>   	return dsi_ctx.accum_err;
>   };
>   
> @@ -1102,8 +1109,6 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
>   	.reset_before_power_off_vcioo = true,
>   	.vcioo_to_lp11_delay_ms = 5,
>   	.lp11_to_reset_delay_ms = 10,
> -	.exit_sleep_to_display_on_delay_ms = 120,
> -	.display_on_delay_ms = 20,
>   	.backlight_off_to_display_off_delay_ms = 100,
>   	.display_off_to_enter_sleep_delay_ms = 50,
>   	.enter_sleep_to_reset_down_delay_ms = 100,
> -- 
> 2.17.1
> 
