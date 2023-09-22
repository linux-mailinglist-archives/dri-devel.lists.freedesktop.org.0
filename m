Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCBD7AAAF1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 09:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27C710E03A;
	Fri, 22 Sep 2023 07:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2071.outbound.protection.outlook.com [40.107.14.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8306A10E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 07:56:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWrdvVaiY8BZnsOW9CaSg82XBZaMJgWy04r6HiDFDeLdCyUU/G/ZV58RoP6SvGkCge7Nz4uUT4jmhuGeS2hBMgqmX1Z5+TGdzoUtQYeParMedj4zO3fud8c1qg4v2p95rkCWKOCFFi5fM1TeX2JLyFoY9INp67quKvZqCkaVrXJ6O1x+beTOkgZ/1vpRH//yl7BkIaEHJfagHa6Y6AWD9kefMpC1X96Lq58vGaXfAkPczOH00uctPzS9C2fBzYTzQ26YyQ+aCa+ymZWieAmi2lNXGBmR2ywbZ0CcLKwFGn3LepFNlyuFrKm1shXsFWoa2xIqnwCLQNU0D+pXQq08Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9PIxFHIfoyU+Y030Mm8HV/VYSC1bkAxApotiyD3YBM=;
 b=KG/RRCvdUynVDQ1XV3OYYEps86GMnZTTXLoI4yOQlldBQPNd7aoXwQLTZR8dzw5KrCteptH228zVZcqHPDdq+TpHJJJeWHvRX4Q1WwqusP7E1f/NudtspFxu5ehjtntWmMXwW5tQ+6iVp1yIsN4g76hYiE0n/80DbTx+PZHNKPz2ApoazHV05UVVMtUGw54WBIqSH2U2IpyHzF+gIMAdfMVSVP7gd8BTfrZd5KY4BW0dSIhY9NuC2fKh07dwszxEHqco0qMH4IjYqe7HyJT91riibsDeeqKwGldQDMYV+K6hVzz50YIvWdprLvKtpQ2JU7ezJWr+VDWmIEgiON8z9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9PIxFHIfoyU+Y030Mm8HV/VYSC1bkAxApotiyD3YBM=;
 b=jhS8GTtJTXGQrI/Ox1oPNOy7qn51Vd8bXv2iu/JQM4Y6KHGXK0nqQgDXkSShVpB8MhLKpyRQCMqtmsmi6F/LicHtLcBikWURqQnJ4v/zP2jvsRNyGWGps7KR0mqSYUM5bIhmtJHJNOsBbk3fkQ6bFRvIlZ80A2vPRAWHQWnukjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by AM9PR04MB8147.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 07:56:14 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad16:42a5:193f:6396]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad16:42a5:193f:6396%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 07:56:14 +0000
Date: Fri, 22 Sep 2023 10:56:10 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [RFT PATCH v2 01/12] drm/imx/dcss: Call
 drm_atomic_helper_shutdown() at shutdown time
Message-ID: <20230922075610.ekrzyz6hfcd3rjsm@fsr-ub1664-121.ea.freescale.net>
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.1.I134336fce7eac5a63bdac46d57b0888858fc8081@changeid>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921122641.RFT.v2.1.I134336fce7eac5a63bdac46d57b0888858fc8081@changeid>
X-ClientProxiedBy: AM0PR02CA0198.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::35) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|AM9PR04MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 715073a6-34a6-4c01-6120-08dbbb4164ad
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 21SC9KnI88ozTPJq5QM1tacCtS1+DYlkSXKej7PEeSkqe1govmKDDSk0OcaiewlEL8bW7RLywR7Z6gqn4KjcIrATlH6wLWsAoAgy6ELsYucZs8qRIp9zaOYV74wtYTlYSR0xy72eTzPLbVbSOBPpKCaKs4+2b+PTZQfLukRSliFduSssverhysth0b7hGRW2vFIHgQt9/8NvbjYQ87/6cYA7al6wBivfXngcDCv/ICV01DYNtgUjd6wsLKemYaWFc4MXoxJ4XGDFac/IxllXpvpKYkveNuY6ZvKS9ITWKnhww6VZvpsYqidCjYFTrHQswcZzI3OXU1pxaoK5Rfrmsb7QrVM1PgkxXc7V2lOhpeAUi94UapEoxRMq4XdJqinZubtRpy7VhkKM9edf4j/s8JLMhv7DVupwCeeaz7eMSZS+U0d5jdzaupy4hKoDOxHUN6PWEu4Ba75aCAQaACLXr/q9ruqC19oFNMx5NFAEsDjTN0H7CG9RuFuJh6yTlPDuPmKf7vtpfkuMq4fV3WgX8Za3kH6YbnsBqsA91b225/t23Zs7BD7KhcZUJoonv9y0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(186009)(1800799009)(451199024)(6506007)(6512007)(6666004)(1076003)(6486002)(9686003)(26005)(66946007)(86362001)(478600001)(38100700002)(66476007)(66556008)(8676002)(8936002)(4326008)(44832011)(316002)(6916009)(54906003)(5660300002)(41300700001)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9H5WmLzSaRkERVqqY58c6qFYSUY8nM62SBjOysUdz8pReLBk4f3KXutc0dAV?=
 =?us-ascii?Q?x0bK1l2hCm+gXagiS91UehRzS79+OmwydyT8MJeZDITxMoqwH+eTGSAOPzer?=
 =?us-ascii?Q?GzRpFO6n1zgjkjANBujBAs7Yx7AypLuXu87gLzsE7ugFLDri7VeqJVvQBqZb?=
 =?us-ascii?Q?/ADIU51dUPkg072IkY1v8lq6/HV3GfEd+kg7Ey8Lb4UssioWoZNWgsILB6EO?=
 =?us-ascii?Q?T5fisUaJT/ppYPbt3Jgtke3xcf4EBJw4yclxj90ELHGN5UfVvm9t44vk7iwd?=
 =?us-ascii?Q?cKQfdZvMA25cSlRu0bNaE7KE6o/UEuyEt3SB9utKp+rT2IlDsDoblgg4Q2pq?=
 =?us-ascii?Q?m8IIJ4s4dytB/EPX1jQcu30S/H29ix7uyOHR/YT91S7oOMdoxVo6zwTYv9y+?=
 =?us-ascii?Q?ldz8YLwdEX0dAn8j9j9NtL0LbzKvMo3+YC/uTMJu4VkTgQzkFXk58D3WPSah?=
 =?us-ascii?Q?+gyrY3STHzqKCihw5+k+S8kWDMF4lcI8PH4i+dlBe6WfzlFFzyWpinHXRHyN?=
 =?us-ascii?Q?qQUPhnQOI9GqXgCRZt5KUqs7/0Q0lsjgIiaEaB+2FR1tYkO8QCjBgeGH6HdL?=
 =?us-ascii?Q?aSTiRgBTGj5KmR1pnI8XjdxCrIuTo1YwriE0WybWyxpAskZOrrVk4IY87lR4?=
 =?us-ascii?Q?lRPhB5bYmeNna7bR8XZ8mF/6MsTVlhxqVdFdDpoyBBPLo8DZdtXWzwDvMNhl?=
 =?us-ascii?Q?CpIgdjs+s0FuSE9RUT2tjng4bc+QTOvKlE5JPz8lvOmYpCEXPu03Gt1bMvxj?=
 =?us-ascii?Q?WVafNmNIqG9HWvFudAXJUmo6mRsEw+SFVFsWBjZA4j6phCzC2nCZ93+gZ3tl?=
 =?us-ascii?Q?GodN7Oyt6bqaF52+vucUds9NOAAOF/bdY7Qj+C2LDrUca2u6JiNtbXLLcpi8?=
 =?us-ascii?Q?Uvh3Fg28+1cye3KF8oGvcBKKxDl7qJe1b8kJ5BY/8bD5oG7LQXZQh5qDWdJc?=
 =?us-ascii?Q?+9XbGSFGlJsUOJeMT0KyigHGmZ9S4brsJYQrOxWAHwjnv+hAA3q9pP/LVBis?=
 =?us-ascii?Q?HrdQyaTkLXrwhNVNoNiBwPs8vUS7z0wNxGKm3em4CochZ+YTKWoqbZx2TZBd?=
 =?us-ascii?Q?zZchJJ/Jb5Zc9g+ixh1m32eL14Eh9fb7FqD5Z7fJ1YE6qPBq2rodg7Sb48g0?=
 =?us-ascii?Q?75w2t7RNb2h5/y672uEHnY8UTh9BqPFADikzvJ9gbzhnztzDRpWYC7mDcbnu?=
 =?us-ascii?Q?4qOkYsIM684HX9uxXRfhEeuU786Mdp3F3dgdN97i/682JiGyXXESBNbiW3ql?=
 =?us-ascii?Q?GWbZUo97vrWkFdE2OuoNxl8VcjcpE5mhoY86j5SpP4hL2tQ2+u9ut3fBR8Aj?=
 =?us-ascii?Q?gP6OyKeGfkultS8epFxxiFgifz3oSoSNAzckTE592Yd7Ak6n6LjPJu1nfVbK?=
 =?us-ascii?Q?L6aecABtMBcikQslLUPoUkMDsGjn74u6vVnsxerqo3VerSdmv1JLNS5a4UAl?=
 =?us-ascii?Q?VSIadP22+Dk6WQVgCVPTKPtXrZpn36eTN7L1TwlxPoJ4lGURFfLqi8uiuqLL?=
 =?us-ascii?Q?7ifrg3Jgs1IvhU9qcnUc+YieQaxW3gXLt/3dE4XqNhhlfbeBQHD4g3W6ZBFn?=
 =?us-ascii?Q?deNnfD3EaHHu8OBDgUPjawDmn1OSVB75XLOGcPBsOsaX2i7wY+2exExu8yrJ?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715073a6-34a6-4c01-6120-08dbbb4164ad
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 07:56:14.6480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POGLqPzuVkZrOnmN1sI8M0rckanxS3JHugAR2dLhajX44ucVOYHv5ezSNFW5Y/M+J8g4kmhqokDeZKgGLuZe8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8147
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
Cc: kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-imx@nxp.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 21, 2023 at 12:26:44PM -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

No issues found on i.MX8MQ.

Tested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu

> ---
> This commit is only compile-time tested.
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/imx/dcss/dcss-drv.c | 8 ++++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 7 +++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.h | 1 +
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> index c68b0d93ae9e..b61cec0cc79d 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> @@ -92,6 +92,13 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static void dcss_drv_platform_shutdown(struct platform_device *pdev)
> +{
> +	struct dcss_drv *mdrv = dev_get_drvdata(&pdev->dev);
> +
> +	dcss_kms_shutdown(mdrv->kms);
> +}
> +
>  static struct dcss_type_data dcss_types[] = {
>  	[DCSS_IMX8MQ] = {
>  		.name = "DCSS_IMX8MQ",
> @@ -114,6 +121,7 @@ MODULE_DEVICE_TABLE(of, dcss_of_match);
>  static struct platform_driver dcss_platform_driver = {
>  	.probe	= dcss_drv_platform_probe,
>  	.remove	= dcss_drv_platform_remove,
> +	.shutdown = dcss_drv_platform_shutdown,
>  	.driver	= {
>  		.name = "imx-dcss",
>  		.of_match_table	= dcss_of_match,
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index 896de946f8df..d0ea4e97cded 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -172,3 +172,10 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
>  	dcss_crtc_deinit(&kms->crtc, drm);
>  	drm->dev_private = NULL;
>  }
> +
> +void dcss_kms_shutdown(struct dcss_kms_dev *kms)
> +{
> +	struct drm_device *drm = &kms->base;
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.h b/drivers/gpu/drm/imx/dcss/dcss-kms.h
> index dfe5dd99eea3..62521c1fd6d2 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.h
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.h
> @@ -34,6 +34,7 @@ struct dcss_kms_dev {
>  
>  struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss);
>  void dcss_kms_detach(struct dcss_kms_dev *kms);
> +void dcss_kms_shutdown(struct dcss_kms_dev *kms);
>  int dcss_crtc_init(struct dcss_crtc *crtc, struct drm_device *drm);
>  void dcss_crtc_deinit(struct dcss_crtc *crtc, struct drm_device *drm);
>  struct dcss_plane *dcss_plane_init(struct drm_device *drm,
> -- 
> 2.42.0.515.g380fc7ccd1-goog
> 
