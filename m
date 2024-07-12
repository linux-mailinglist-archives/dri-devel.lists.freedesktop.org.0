Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820389301AB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 23:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB0610EDB1;
	Fri, 12 Jul 2024 21:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gTD9e91C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FC310EDB1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 21:39:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46CBAeTN007447;
 Fri, 12 Jul 2024 21:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V9GzW2YNtArD1crWGPYwBMr7WJJOPm6wGsuoCZMyPp4=; b=gTD9e91CDEid3vsy
 ucAJe6sg7PN/YNj50++z+3vJIblGzPoj6/q/BYgzocaMpqpY4r+7umlWuD6c/D4t
 Scsu+cfM0VbrwJIEEb7ijdcgLNUsmU6BHIJXcqnCuH+AIRIGqHYMdmbc1X0E8D1G
 vEKOTF7DSoyi7Qavz6Nrpkk7Gcbs0Mlz4oyHT5/oERY+1SunjYlNlVrI7rFMzvDz
 QLaUNciiqQeoD1fuk3f+YdATlZsM2CzuAD3YPeor6QofApa6NJU+sN87PLcyUX9m
 IwLYzKMr7jZpQFaZDNUc6pIMqzQ0dVgyjBce4xbCkaNSeVtEyop3SXyLLKpWadML
 wXdrBg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ac0gmmqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jul 2024 21:39:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46CLdGG0032337
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jul 2024 21:39:16 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Jul
 2024 14:39:16 -0700
Message-ID: <606ddebb-c98c-47da-93d7-a387dbb6df22@quicinc.com>
Date: Fri, 12 Jul 2024 14:39:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] drm: mipi: add mipi_dsi_generic_write_multi_type()
To: Caleb Connolly <caleb@postmarketos.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Henrik Rydberg <rydberg@bitmath.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-4-c4a1f8da74f1@postmarketos.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240630-oneplus8-v2-4-c4a1f8da74f1@postmarketos.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1X-JElFlFLcusa7j0eTaboXSxbuH0v8m
X-Proofpoint-GUID: 1X-JElFlFLcusa7j0eTaboXSxbuH0v8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_17,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 impostorscore=0 clxscore=1011 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120147
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



On 6/30/2024 11:36 AM, Caleb Connolly wrote:
> Some panels like the Samsung AMB655X use long write commands for all
> non-standard messages and do not work when trying to use the appropriate
> command type.
> 
> Support these panels by introducing a new helper to send commands of a
> specific type, overriding the normal rules.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>   drivers/gpu/drm/drm_mipi_dsi.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   include/drm/drm_mipi_dsi.h     | 16 ++++++++++++++++
>   2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index a471c46f5ca6..f2c7f3f23a6e 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -819,8 +819,48 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
>   	}
>   }
>   EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
>   
> +/**
> + * mipi_dsi_generic_write_raw_multi() - transmit data using a generic write packet of
> + * a specific type
> + * @ctx: Context for multiple DSI transactions
> + * @type: data type of the packet
> + * @payload: buffer containing the payload
> + * @size: size of payload buffer
> + *
> + * This function will automatically choose the right data type depending on
> + * the payload length.

Hi Caleb,

I'm a bit confused by the wording here. By "automatically", do you mean 
the chosen by the macro calling this function?

Thanks,

Jessica Zhang

> + *
> + * Return: The number of bytes transmitted on success or a negative error code
> + * on failure.
> + */
> +ssize_t mipi_dsi_generic_write_raw_multi(struct mipi_dsi_multi_context *ctx,
> +					  u8 type, const void *payload, size_t size)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_msg msg = {
> +		.channel = dsi->channel,
> +		.tx_buf = payload,
> +		.tx_len = size,
> +		.type = type,
> +	};
> +	ssize_t ret;
> +
> +	if (ctx->accum_err)
> +		return 0;
> +
> +	ret = mipi_dsi_device_transfer(dsi, &msg);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(&dsi->dev, "sending generic data %*ph failed: %zd\n",
> +			(int)size, payload, ret);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mipi_dsi_generic_write_raw_multi);
> +
>   /**
>    * mipi_dsi_generic_read() - receive data using a generic read packet
>    * @dsi: DSI peripheral device
>    * @params: buffer containing the request parameters
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 71d121aeef24..fb23f4e3b94e 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -287,8 +287,10 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>   int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
>   				  const void *payload, size_t size);
>   void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
>   				  const void *payload, size_t size);
> +ssize_t mipi_dsi_generic_write_raw_multi(struct mipi_dsi_multi_context *ctx, u8 type,
> +				    const void *payload, size_t size);
>   ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
>   			      size_t num_params, void *data, size_t size);
>   
>   #define mipi_dsi_msleep(ctx, delay)	\
> @@ -432,8 +434,22 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
>   		static const u8 d[] = { cmd, seq };                     \
>   		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>   	} while (0)
>   
> +/**
> + * mipi_dsi_dcs_write_long_multi - transmit a DCS long command with payload
> + * @ctx: Context for multiple DSI transactions
> + * @cmd: Commands
> + * @seq: buffer containing data to be transmitted
> + */
> +#define mipi_dsi_dcs_write_long_multi(ctx, cmd, seq...)                    \
> +	do {                                                               \
> +		static const u8 d[] = { cmd, seq };                        \
> +		mipi_dsi_generic_write_raw_multi(ctx,                      \
> +						  MIPI_DSI_DCS_LONG_WRITE, \
> +						  d, ARRAY_SIZE(d));       \
> +	} while (0)
> +
>   /**
>    * struct mipi_dsi_driver - DSI driver
>    * @driver: device driver model driver
>    * @probe: callback for device binding
> 
> -- 
> 2.45.0
> 
