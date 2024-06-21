Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB5912E82
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 22:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770F410E0B1;
	Fri, 21 Jun 2024 20:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OjQZIpXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EA710E0B1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 20:31:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LFkfbl003773;
 Fri, 21 Jun 2024 20:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RUxcYEGWuMv1jftc+KPnyPT+gkqd+V6Adm2hkxphGqs=; b=OjQZIpXfFIPtXrWj
 n7gjBAZ81jcZolKCcd4MHJ76TrGZ7sfnr8JjReSt1r9RN/4Bxy0KhZS+5+B0+bt2
 FW+vxGDMyH4ULjTlNw52cJWuqz1wV0OQEJlv+gLv1A/3NE+rolgNIUJtGpxOZw3F
 REuJoN+hzknY+euCLEg//2B/nsq8h+6emWTrKDlKbWfh7pHQ5GGd0TmWz8SHRlKe
 isSm6cFgDAMCET9SYDtxZtlaqGntcdwcEU8qzAukezSbFqM/S5OkfD45pqhFJot5
 q2Pjmg9gzKYT837nBYI/D33G1pr7YzmXse+cp/ZvJ8TinYHlaEq6bq0e2ai1M5s2
 K9/b0A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw49esxtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 20:31:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45LKVgoN029400
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 20:31:42 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 13:31:41 -0700
Message-ID: <de5e45eb-4885-4c4b-ab49-f350d82537f3@quicinc.com>
Date: Fri, 21 Jun 2024 13:31:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/panel: st7701: Add support for SPI for
 configuration
To: Hironori KIKUCHI <kikuchan98@gmail.com>, <linux-kernel@vger.kernel.org>
CC: Jagan Teki <jagan@amarulasolutions.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
References: <20240618081515.1215552-1-kikuchan98@gmail.com>
 <20240618081515.1215552-3-kikuchan98@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240618081515.1215552-3-kikuchan98@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: X8u3Mir84WleVdcmOsCKhDTTW0waZvPE
X-Proofpoint-GUID: X8u3Mir84WleVdcmOsCKhDTTW0waZvPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_12,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210148
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



On 6/18/2024 1:15 AM, Hironori KIKUCHI wrote:
> The ST7701 supports not only MIPI DSI, but also SPI as an interface
> for configuration. To support a panel connected via RGB parallel
> interface, add support for SPI using MIPI DBI helpers.
> 
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   2 +
>   drivers/gpu/drm/panel/panel-sitronix-st7701.c | 211 ++++++++++++++----
>   2 files changed, 172 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 2ae0eb0638f..1831544400d 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -755,7 +755,9 @@ config DRM_PANEL_SHARP_LS060T1SX01
>   config DRM_PANEL_SITRONIX_ST7701
>   	tristate "Sitronix ST7701 panel driver"
>   	depends on OF
> +	depends on SPI
>   	depends on DRM_MIPI_DSI
> +	select DRM_MIPI_DBI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for the Sitronix
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> index 421eb4592b6..3c4a66f2fc7 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -4,6 +4,7 @@
>    * Author: Jagan Teki <jagan@amarulasolutions.com>
>    */
>   
> +#include <drm/drm_mipi_dbi.h>
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
> @@ -14,6 +15,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
>   
>   #include <video/mipi_display.h>
>   
> @@ -130,12 +132,16 @@ struct st7701_panel_desc {
>   struct st7701 {
>   	struct drm_panel panel;
>   	struct mipi_dsi_device *dsi;
> +	struct mipi_dbi dbi;
>   	const struct st7701_panel_desc *desc;
>   
>   	struct regulator_bulk_data supplies[2];
>   	struct gpio_desc *reset;
>   	unsigned int sleep_delay;
>   	enum drm_panel_orientation orientation;
> +
> +	int (*write_command)(struct st7701 *st7701, u8 cmd, const u8 *seq,
> +			     size_t len);
>   };
>   
>   static inline struct st7701 *panel_to_st7701(struct drm_panel *panel)
> @@ -143,16 +149,22 @@ static inline struct st7701 *panel_to_st7701(struct drm_panel *panel)
>   	return container_of(panel, struct st7701, panel);
>   }
>   
> -static inline int st7701_dsi_write(struct st7701 *st7701, const void *seq,
> -				   size_t len)
> +static int st7701_dsi_write(struct st7701 *st7701, u8 cmd, const u8 *seq,
> +			    size_t len)
>   {
> -	return mipi_dsi_dcs_write_buffer(st7701->dsi, seq, len);
> +	return mipi_dsi_dcs_write(st7701->dsi, cmd, seq, len);
>   }
>   
> -#define ST7701_DSI(st7701, seq...)				\
> -	{							\
> -		const u8 d[] = { seq };				\
> -		st7701_dsi_write(st7701, d, ARRAY_SIZE(d));	\
> +static int st7701_dbi_write(struct st7701 *st7701, u8 cmd, const u8 *seq,
> +			    size_t len)
> +{
> +	return mipi_dbi_command_stackbuf(&st7701->dbi, cmd, seq, len);
> +}
> +
> +#define ST7701_DSI(st7701, cmd, seq...)	

Hi Hironori,

Is it really correct to keep this as *_DSI? Since the macro can 
theoretically support either DBI or DSI write commands, maybe this 
should be renamed to something more generic.

				\
> +	{								\
> +		const u8 d[] = { seq };					\
> +		st7701->write_command(st7701, cmd, d, ARRAY_SIZE(d));	\
>   	}
>   
>   static u8 st7701_vgls_map(struct st7701 *st7701)
> @@ -211,10 +223,10 @@ static void st7701_init_sequence(struct st7701 *st7701)
>   	/* Command2, BK0 */
>   	st7701_switch_cmd_bkx(st7701, true, 0);
>   
> -	mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_PVGAMCTRL,
> -			   desc->pv_gamma, ARRAY_SIZE(desc->pv_gamma));
> -	mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_NVGAMCTRL,
> -			   desc->nv_gamma, ARRAY_SIZE(desc->nv_gamma));
> +	st7701->write_command(st7701, DSI_CMD2_BK0_PVGAMCTRL, desc->pv_gamma,

Same here for the DSI_CMD2_* macros.

> +			      ARRAY_SIZE(desc->pv_gamma));
> +	st7701->write_command(st7701, DSI_CMD2_BK0_NVGAMCTRL, desc->nv_gamma,
> +			      ARRAY_SIZE(desc->nv_gamma));
>   	/*
>   	 * Vertical line count configuration:
>   	 * Line[6:0]: select number of vertical lines of the TFT matrix in
> @@ -974,42 +986,47 @@ static const struct st7701_panel_desc rg_arc_desc = {
>   	.gip_sequence = rg_arc_gip_sequence,
>   };
>   
> -static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
> +static void st7701_cleanup(void *data)
> +{
> +	struct st7701 *st7701 = (struct st7701 *)data;
> +
> +	drm_panel_remove(&st7701->panel);
> +}
> +
> +static int st7701_probe(struct device *dev, int connector_type)
>   {
>   	const struct st7701_panel_desc *desc;
>   	struct st7701 *st7701;
>   	int ret;
>   
> -	st7701 = devm_kzalloc(&dsi->dev, sizeof(*st7701), GFP_KERNEL);
> +	desc = of_device_get_match_data(dev);
> +	if (!desc)
> +		return -ENODEV;
> +
> +	st7701 = devm_kzalloc(dev, sizeof(*st7701), GFP_KERNEL);
>   	if (!st7701)
>   		return -ENOMEM;
>   
> -	desc = of_device_get_match_data(&dsi->dev);
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> -	dsi->format = desc->format;
> -	dsi->lanes = desc->lanes;
> -
> +	st7701->desc = desc;
>   	st7701->supplies[0].supply = "VCC";
>   	st7701->supplies[1].supply = "IOVCC";
>   
> -	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(st7701->supplies),
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(st7701->supplies),
>   				      st7701->supplies);
>   	if (ret < 0)
>   		return ret;
>   
> -	st7701->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
> +	st7701->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   	if (IS_ERR(st7701->reset)) {
> -		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
> +		dev_err(dev, "Couldn't get our reset GPIO\n");
>   		return PTR_ERR(st7701->reset);
>   	}
>   
> -	ret = of_drm_get_panel_orientation(dsi->dev.of_node, &st7701->orientation);
> +	ret = of_drm_get_panel_orientation(dev->of_node, &st7701->orientation);
>   	if (ret < 0)
> -		return dev_err_probe(&dsi->dev, ret, "Failed to get orientation\n");
> +		return dev_err_probe(dev, ret, "Failed to get orientation\n");
>   
> -	drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
> -		       DRM_MODE_CONNECTOR_DSI);
> +	drm_panel_init(&st7701->panel, dev, &st7701_funcs, connector_type);
>   
>   	/**
>   	 * Once sleep out has been issued, ST7701 IC required to wait 120ms
> @@ -1026,21 +1043,77 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
>   	if (ret)
>   		return ret;
>   
> +	dev_set_drvdata(dev, st7701);
> +
>   	drm_panel_add(&st7701->panel);
>   
> -	mipi_dsi_set_drvdata(dsi, st7701);
> -	st7701->dsi = dsi;
> -	st7701->desc = desc;
> -
> -	ret = mipi_dsi_attach(dsi);
> +	ret = devm_add_action_or_reset(dev, st7701_cleanup, st7701);

Is the intention here to move to using the devm framework? Also, just 
wondering, what advantages does this implementation have over the 
original implementation?

>   	if (ret)
> -		goto err_attach;
> +		return ret;

If you're removing the `goto` here, you could probably drop this entire 
check and just `return ret` at the end of the function.

>   
>   	return 0;
> +}
>   
> -err_attach:
> -	drm_panel_remove(&st7701->panel);
> -	return ret;
> +static void st7701_remove(struct st7701 *st7701)
> +{
> +	st7701_cleanup(st7701);

Why add an extra helper that's essentially just a wrapper for another 
helper? Why can't we directly call st7701_cleanup()?

Thanks,

Jessica Zhang

> +}
> +
> +static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct st7701 *st7701;
> +	int err;
> +
> +	err = st7701_probe(&dsi->dev, DRM_MODE_CONNECTOR_DSI);
> +	if (err)
> +		return err;
> +
> +	st7701 = dev_get_drvdata(&dsi->dev);
> +	st7701->dsi = dsi;
> +	st7701->write_command = st7701_dsi_write;
> +
> +	if (!st7701->desc->lanes)
> +		return dev_err_probe(&dsi->dev, err, "This panel is not for MIPI DSI\n");
> +
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	dsi->format = st7701->desc->format;
> +	dsi->lanes = st7701->desc->lanes;
> +
> +	mipi_dsi_set_drvdata(dsi, st7701);
> +
> +	err = mipi_dsi_attach(dsi);
> +	if (err)
> +		return dev_err_probe(&dsi->dev, err, "Failed to init MIPI DSI\n");
> +
> +	return 0;
> +}
> +
> +static int st7701_spi_probe(struct spi_device *spi)
> +{
> +	struct st7701 *st7701;
> +	struct gpio_desc *dc;
> +	int err;
> +
> +	err = st7701_probe(&spi->dev, DRM_MODE_CONNECTOR_DPI);
> +	if (err)
> +		return err;
> +
> +	st7701 = dev_get_drvdata(&spi->dev);
> +	st7701->write_command = st7701_dbi_write;
> +
> +	dc = devm_gpiod_get_optional(&spi->dev, "dc", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> +	if (IS_ERR(dc))
> +		return dev_err_probe(&spi->dev, PTR_ERR(dc), "Failed to get GPIO for D/CX\n");
> +
> +	spi_set_drvdata(spi, st7701);
> +
> +	err = mipi_dbi_spi_init(spi, &st7701->dbi, dc);
> +	if (err)
> +		return dev_err_probe(&spi->dev, err, "Failed to init MIPI DBI\n");
> +	st7701->dbi.read_commands = NULL;
> +
> +	return 0;
>   }
>   
>   static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
> @@ -1048,28 +1121,84 @@ static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
>   	struct st7701 *st7701 = mipi_dsi_get_drvdata(dsi);
>   
>   	mipi_dsi_detach(dsi);
> -	drm_panel_remove(&st7701->panel);
> +	st7701_remove(st7701);
>   }
>   
> -static const struct of_device_id st7701_of_match[] = {
> +static void st7701_spi_remove(struct spi_device *spi)
> +{
> +	struct st7701 *st7701 = spi_get_drvdata(spi);
> +
> +	st7701_remove(st7701);
> +}
> +
> +static const struct of_device_id st7701_dsi_of_match[] = {
>   	{ .compatible = "anbernic,rg-arc-panel", .data = &rg_arc_desc },
>   	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
>   	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
>   	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
> -	{ }
> +	{ /* sentinel */ }
>   };
> -MODULE_DEVICE_TABLE(of, st7701_of_match);
> +MODULE_DEVICE_TABLE(of, st7701_dsi_of_match);
> +
> +static const struct of_device_id st7701_spi_of_match[] = {
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, st7701_spi_of_match);
> +
> +static const struct spi_device_id st7701_spi_ids[] = {
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, st7701_spi_ids);
>   
>   static struct mipi_dsi_driver st7701_dsi_driver = {
>   	.probe		= st7701_dsi_probe,
>   	.remove		= st7701_dsi_remove,
>   	.driver = {
>   		.name		= "st7701",
> -		.of_match_table	= st7701_of_match,
> +		.of_match_table	= st7701_dsi_of_match,
>   	},
>   };
> -module_mipi_dsi_driver(st7701_dsi_driver);
> +
> +static struct spi_driver st7701_spi_driver = {
> +	.probe		= st7701_spi_probe,
> +	.remove		= st7701_spi_remove,
> +	.id_table	= st7701_spi_ids,
> +	.driver = {
> +		.name		= "st7701",
> +		.of_match_table	= st7701_spi_of_match,
> +	},
> +};
> +
> +static int __init st7701_driver_init(void)
> +{
> +	int err;
> +
> +	err = spi_register_driver(&st7701_spi_driver);
> +	if (err)
> +		return err;
> +
> +	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
> +		err = mipi_dsi_driver_register(&st7701_dsi_driver);
> +		if (err) {
> +			spi_unregister_driver(&st7701_spi_driver);
> +			return err;
> +		}
> +
> +		return 0;
> +	}
> +}
> +module_init(st7701_driver_init);
> +
> +static void __exit st7701_driver_exit(void)
> +{
> +	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
> +		mipi_dsi_driver_unregister(&st7701_dsi_driver);
> +
> +	spi_unregister_driver(&st7701_spi_driver);
> +}
> +module_exit(st7701_driver_exit);
>   
>   MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
> +MODULE_AUTHOR("Hironori KIKUCHI <kikuchan98@gmail.com>");
>   MODULE_DESCRIPTION("Sitronix ST7701 LCD Panel Driver");
>   MODULE_LICENSE("GPL");
> -- 
> 2.45.2
> 
