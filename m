Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B222086AB27
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 10:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD82B10E9D1;
	Wed, 28 Feb 2024 09:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GA7yAhVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4355F10E9D3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 09:28:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD1+yl2wvRXw8BBFbP1uS1UkiwqqIAPGxsLTP0/MEgs/2LrIgM2aOpPJTPuzwtp4p3Iu8kz5Fbwy1IteRMiSWqLktfOfCv5UoIDY9+1gDIFk5+hw5SYCn326Y4Pl3zTwRV4JxotyCjGaMALC2fm2Y5mrfDsbhHXd35OhLU54Zb2ctY/ROh/1GxJAl3CIDtPi9GBlfQIyos8/PaB8zAGWnYsScyL2HsywMNlyXmJHKYdinfwLXaI3/rtck/gzBHsOTG9KrKhGJo+eAogkXUFGrAD58kpjZDT4wlO4wHM2ZAVoL3EpNvPa7S+tzGDghrPM0jXy4yiidZPGstN+zHUXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBEoo8yjOmb6pUjJm32BXUOAQc2IcNKgsm9gyZacvOU=;
 b=N+aHsLhtKX7QnGBYFXlxDu3/0EWeeZI2FxGOckar1t5GOzNITLEgBPiWDzmx4kZBcseCMPrRXUhxEiiRMf9m8DFUx26nz7M+t2SNQ8+cmElXgctO7uj3XBlce35pofDzkZeT+m3YIecBsa5+R4IO7ERAJWa7FcO7DY02ahDTgL4SBwkRtX19dYxh44lRa2qsq+NRjnxGAI8X3DhYYPfvS4zjRtRuqAkGXzYxLGh5vc90XvBDgUgyJ1xh0RST8hWYg6JVfqwdZt6vV/cDdG3/aMUjfzWare/oW3lebSTDCfnrwXSwpXL+SuQI/CfhG5ecNc3S6GNUM16kA7c9KhGHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBEoo8yjOmb6pUjJm32BXUOAQc2IcNKgsm9gyZacvOU=;
 b=GA7yAhVrh9qxtlDC7YWaiDw0rMe5qbEkdYwXEKNWxpmMhl+XGbI7uVOHC2nHvJosO0ZLndG3I2b9ep4z7OF+WdxXgozy0Sll3Ew5ARCcnJBD07wG0sWF73v6OG6bpo9XMHDYsYHaTyca8mB2MRi3Y/KIQ6ho8JZ0dZF2z0LzYMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5333.eurprd04.prod.outlook.com (2603:10a6:209:4a::22)
 by AS8PR04MB7560.eurprd04.prod.outlook.com (2603:10a6:20b:29d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 09:28:38 +0000
Received: from AM6PR04MB5333.eurprd04.prod.outlook.com
 ([fe80::e905:d263:1321:f08]) by AM6PR04MB5333.eurprd04.prod.outlook.com
 ([fe80::e905:d263:1321:f08%6]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 09:28:38 +0000
Date: Wed, 28 Feb 2024 11:28:32 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Philipp Stanner <pstanner@redhat.com>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/imx/dcss: fix resource size calculation
Message-ID: <wd5qlrd5c3kmguosjqyi7w7oayvjfh3mrzuw7nx64ibagmtkck@bczrrshd7a43>
References: <4914592b-4256-4c9c-bc1d-6dec1e473831@moroto.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4914592b-4256-4c9c-bc1d-6dec1e473831@moroto.mountain>
X-ClientProxiedBy: AM0P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::33) To AM6PR04MB5333.eurprd04.prod.outlook.com
 (2603:10a6:209:4a::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5333:EE_|AS8PR04MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 171a0b4b-6cf3-4ce6-b129-08dc383fa4dd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +H8AFY5pX7d3NYuT3C3FvfIv+b4eQVeL4ZAdMU8JCfPxuQFx84hEhxzbFD0FbGIniJI6hK964h07J5egcQxAR7BUnkkWEgumwAdXK9214vTARpnX2ukiemTKOq4O2geQea8Tc0La2yGuzszbJ26CY38c+3qPlUJMWkWGZi9A0YeuSRWJOYfkX/EJG20WFh4ZzjvG4ad+OrgkcXYCf7TMR2Lsj6RJk1iSipe55GBD8sIWAtbxAifgYWLbSeFTJcCM9PUSsHDgAVshU4wFP1L1GCtyWTDtdr8IXYXjuQcGRYXXzety9kCgIQkMjKf7ht7o6Qb39RjcNiCJrC5thmHXGAJBGy9tjAPsSwi68acq2SfLboUnxFItj1PCNQokig7L8J5MTtDScorkBYhkQ/8q8Yx1LPen92nA8ODMpvZskF/Z5sQUji4n8tll7r9+TZwLPujqR4cQ9dbDqJXG3wcar9SGEqcyImok5iu1OGx4kWpqwcf22tcKJOfY/hBo/V1U5p0rUtCOvLpJVnpw5cErP5QC2UK3BGlddBEzcIj+pfcxAO84PJWEUhZt3nfGMyX6JKbNUqbn41F0HJo4qAzDrMw1EORpuZPys1jN6Hq36i5bhcjFwUdiU1q8dJtV90Y4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5333.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CfksxUt5mR71ioMwnGjkaA0huSTemciiF/p4Cwf07YQ9sJjM5QpoFkP95FoU?=
 =?us-ascii?Q?o7m/AmLp/5hKvytTWCFol4LrBb41gm14lIi2QU9U7EfYD7OtvMmtsknojUOZ?=
 =?us-ascii?Q?Q/Tv7XqVPjn26fLeNG69r1mRYRiX+9+k05CK8xGXE9yU32p5Cf0lW9jAWi7l?=
 =?us-ascii?Q?1LR3m2/aUmqDwCYtpTJ6Vm0NS9SH1j7QAmE/IBvJoU7GncLG+P1+p++Hvg3W?=
 =?us-ascii?Q?01Twuf7CZ0rra3saZ4qYj/+/eXu6N7XDS1UZ8KmzRVlgwvdhFCWioh0IOynJ?=
 =?us-ascii?Q?4zw3qOsIl5ww0d3EUgedZAQhKSz/yJrImB5IEP43hW+QZwi8oAUSBJgmAdnF?=
 =?us-ascii?Q?w/+MqKHQWjYRXESBTink96bT6huSJbfAZsSNmUOeAstyyWQ+eXkMOqZThgsx?=
 =?us-ascii?Q?Bj8a/g/gZ+nmaJycfOVCfDp2PlXcvC3Bo9EUIAhghr2IaDJP4fRliWYKVE7O?=
 =?us-ascii?Q?VFAFJNmm2WCnJgmANS/3P3ukM/sFOFSm3YXoDQUrHNEBj9rScuIL9nmxoGjK?=
 =?us-ascii?Q?pHR17fsarATkIe0l4wHIjN4Dqcs4bEjGpLQ/dvXBKemtPkS49MynDhsdtshm?=
 =?us-ascii?Q?hDwyr68D12eiyLZxjZRsgL1Yge8hnYziyJuy7Ilg/ahxRODCZitYGUjZk4qj?=
 =?us-ascii?Q?gUTAYaAEmppxuxiCvw803Xa+hI6qtcj7M2oDe8hb9nTU49/t9+OJ1KyoUIOu?=
 =?us-ascii?Q?5LySUQIwY7D28WWJUd7PMqSfq2xe26ofu0qeIri8wasm99CQruzkIPO3E3ts?=
 =?us-ascii?Q?Bxd+FNZHxnUEnkT/lyzc8Jg0g430ywtYP6OY7jAFiYpY4ZjwM9JJWbefYsny?=
 =?us-ascii?Q?JAUMpoaVYBxkntcoRMneMxzxfKlpW5lRuIlX3QDATp6r4jG0FBWq1s+zzy3j?=
 =?us-ascii?Q?AXcWmirzSdqMTopJRtFjhscJVbcJMi6nlrdMM0q08iA1sMT3v6Ou3sKViCTG?=
 =?us-ascii?Q?aZ3+a+BuoR30a4rpYhZV1GmyMcUV849SRKPe0TnNhTSti5dwNJorkGSTMSl4?=
 =?us-ascii?Q?3q852d9iQWDcs+X41ZXwovHIHBMidjg/vUfQsvj8vUl5aBUTlkdvMvAU1YlT?=
 =?us-ascii?Q?v2Uagg8JQDoPiRYnqQeIFLpsSC5iZ3xbZj4IsumRuCdLtQvJrgHkqPKoWH9I?=
 =?us-ascii?Q?v1tz38EQ79lI4bXmt/spehIVmifl4ydWjyxBhN4Gfx2UuKGBfNWPbEl6oeIA?=
 =?us-ascii?Q?bAGxyJIkWpVHIn7H4rtnXPWFAjdhZLGf5y5li83oSGlyAfh54fPJoyB7ofy8?=
 =?us-ascii?Q?s98DV6m9jwi0DsXgL2zfgOHD2o5upixLaw/ea41VCyzdE2W0ERZxE0x3HNZC?=
 =?us-ascii?Q?jMhjdzuL+stAEefezHYtO5IIS7IBggAfcVUpf044W2swMAi2OlezuWRPGgp/?=
 =?us-ascii?Q?bxd+igekDTa1w9YtUjlOyDa+z8DMQvlcJdwuQ0c42T83ps7eGwJQ7vFGv9iy?=
 =?us-ascii?Q?MbfEhOWL28joUcnKTEjN1EIylUK1qW4eYipg0I4DEiri4PgTxTOZfp2i3hJR?=
 =?us-ascii?Q?V4hTMDT3KDfT4rDEc2QS69wqNj/OuZ7G149JTD0EfwCBX+QQaS6xMd0r/JBz?=
 =?us-ascii?Q?/Ak8oA55OUKTEdO/2o2nQCyO4MIOGCv5uoEOA1z8NKOdpeM+uXid//I3lhNO?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 171a0b4b-6cf3-4ce6-b129-08dc383fa4dd
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 09:28:38.3158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuTgRRy8xlblTitfE4aAEvzOMhC6vsvu0yx3mz3MaZr4PhEsJerpO7javdtfmYb033jnNonXTVNifRqy6HaoPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7560
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

Hi Dan,

On Tue, Feb 13, 2024 at 09:05:01PM +0300, Dan Carpenter wrote:
> The resource is inclusive of the ->start and ->end addresses so this
> calculation is not correct.  It should be "res->end - res->start + 1".
> Use the resource_size() to do the calculation.
> 
> Fixes: 90393c9b5408 ("drm/imx/dcss: request memory region")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

And pushed to drm-misc-next-fixes.

Thanks,
Laurentiu

> ---
> From static analysis.  Not tested.
> 
>  drivers/gpu/drm/imx/dcss/dcss-dev.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index 597e9b7bd4bf..7fd0c4c14205 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -167,7 +167,6 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  	struct resource *res;
>  	struct dcss_dev *dcss;
>  	const struct dcss_type_data *devtype;
> -	resource_size_t res_len;
>  
>  	devtype = of_device_get_match_data(dev);
>  	if (!devtype) {
> @@ -181,8 +180,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	res_len = res->end - res->start;
> -	if (!devm_request_mem_region(dev, res->start, res_len, "dcss")) {
> +	if (!devm_request_mem_region(dev, res->start, resource_size(res), "dcss")) {
>  		dev_err(dev, "cannot request memory region\n");
>  		return ERR_PTR(-EBUSY);
>  	}
> -- 
> 2.43.0
> 
