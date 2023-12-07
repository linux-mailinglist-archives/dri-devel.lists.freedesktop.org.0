Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631780924C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 21:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A45410E977;
	Thu,  7 Dec 2023 20:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D67D10E95B;
 Thu,  7 Dec 2023 20:29:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B7FxiUh020210; Thu, 7 Dec 2023 20:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=X2pYs0UuuiWun4R0IKV5p6WkW0EnE3ha9WWHG3w/E+M=;
 b=GSc0fQy/lQZ5VIy3lkohbzjIoJDJ3ROxSeoICjGQV4vi8UiwrYu5eoWMBQCK6MemRZLN
 o2TNsB/OCCSpdw1QczR3EIkw673q3v1PMphZj81XsJVhLtSJ0ztgaA555GjWELtIMFF1
 +E1xwtKbyBvD0rvaPPDUC7jDUMLnF3iu3dUMse2+Q50mSgMefPyl+J6oklKcm1CtFkjS
 eiisxcLoWmfN6kE0CP+knILu+KNcJhXSoJKfik3nwNrwlXTedPLx8e9XLWxtpga5BoTZ
 b+tQondfUPQ5Ox5PsZFg/bLNiYIEJOfT+WtUiE3WlxcQBA4U6loeA9goLiKbcn5sxMLH bA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utt70c31n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Dec 2023 20:28:14 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B7KSCYK022543
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 7 Dec 2023 20:28:12 GMT
Received: from [10.110.31.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Dec
 2023 12:28:11 -0800
Message-ID: <3a15dc76-12ab-4ef5-8aa7-8a853ce1ec68@quicinc.com>
Date: Thu, 7 Dec 2023 12:28:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2 5/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Jonathan Marek <jonathan@marek.ca>, <freedreno@lists.freedesktop.org>
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-6-jonathan@marek.ca>
Content-Language: en-US
In-Reply-To: <20231114225857.19702-6-jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: IIwfnC3Q5vyMuuGYq2YHajjVnxo7oQvK
X-Proofpoint-GUID: IIwfnC3Q5vyMuuGYq2YHajjVnxo7oQvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_17,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312070172
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 open
 list <linux-kernel@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open
 list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, "open
 list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/14/2023 2:58 PM, Jonathan Marek wrote:
> Add a dsc_slice_per_pkt field to mipi_dsi_device struct and the necessary
> changes to msm driver to support this field.
> 
> Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
> comment is incorrect.

Hi John,

Thanks for catching the typo.

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>   include/drm/drm_mipi_dsi.h         |  1 +
>   2 files changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 842765063b1b..892a463a7e03 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -161,6 +161,7 @@ struct msm_dsi_host {
>   
>   	struct drm_display_mode *mode;
>   	struct drm_dsc_config *dsc;
> +	unsigned int dsc_slice_per_pkt;
>   
>   	/* connected device info */
>   	unsigned int channel;
> @@ -857,17 +858,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>   
>   	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> -	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
> +	bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
>   
>   	eol_byte_num = total_bytes_per_intf % 3;
> -
> -	/*
> -	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
> -	 *
> -	 * Since the current driver only supports slice_per_pkt = 1,
> -	 * pkt_per_line will be equal to slice per intf for now.
> -	 */
> -	pkt_per_line = slice_per_intf;
> +	pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
>   
>   	if (is_cmd_mode) /* packet data type */
>   		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -1004,12 +998,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		else
>   			/*
>   			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
> -			 * Currently, the driver only supports default value of slice_per_pkt = 1
> -			 *
> -			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
> -			 *       and adjust DSC math to account for slice_per_pkt.
>   			 */
> -			wc = msm_host->dsc->slice_chunk_size + 1;
> +			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;

Maybe we can reuse bytes_per_pkt here.

>   
>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>   			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> @@ -1636,8 +1626,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>   	msm_host->lanes = dsi->lanes;
>   	msm_host->format = dsi->format;
>   	msm_host->mode_flags = dsi->mode_flags;
> -	if (dsi->dsc)
> +	if (dsi->dsc) {
>   		msm_host->dsc = dsi->dsc;
> +		msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
> +		/* for backwards compatibility, assume 1 if not set */
> +		if (!msm_host->dsc_slice_per_pkt)
> +			msm_host->dsc_slice_per_pkt = 1;
> +	}
>   
>   	/* Some gpios defined in panel DT need to be controlled by host */
>   	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index c9df0407980c..3e32fa52d94b 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -193,6 +193,7 @@ struct mipi_dsi_device {
>   	unsigned long hs_rate;
>   	unsigned long lp_rate;
>   	struct drm_dsc_config *dsc;

Any reason for not putting this in drm_dsc_config?

Thanks,

Jessica Zhang

> +	unsigned int dsc_slice_per_pkt;
>   };
>   
>   #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
> -- 
> 2.26.1
> 
