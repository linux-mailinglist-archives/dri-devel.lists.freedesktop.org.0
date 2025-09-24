Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0026B9A9DA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F41310E762;
	Wed, 24 Sep 2025 15:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="k7NcxqOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F4110E75D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 15:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3grI31IiVM0MKj8lKlb8UETnrxx4MQKDfIoUhwKiH/LgTZJ7BpWMjFC9cFgsNxYLwz3v6gIx1LwnyXBL2oXlR6OuSgd3IV1AzjMU3r28aCaQwIcuaMC422PHsa44i7BWY2ubJdim9iQH1qYfU4+dGRe2DZ23OfQ79JoPgNj560Vk/kaXz88ol71nPAA26n95/eLNH9SPUQV222ff06ZhlUJK526pKQuK56GDOBjWnmliyQhj4QMY8eDXLAFOaWFJCabG7sYpLYVtJOG+RFl2B22cMhs2Zw0evbLKbVrVKr9b820yV8+GNicd/njf+bsByE5LYz0F4MspV2XY+Rqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O35FdvNapGxZEI2iE+ZPIiuheh1ek48XnOHhldQ7K9k=;
 b=VwUP8urxPFBM0Dos+0ef1ALrMPnUyeGdVIRRzjhkVedARDUUnKEn1BwNxaAj1Q3K8C3eZoAa/szXWjMZu9Ls3hOgQIMJ+VWw/Nwd5YqMX+hFarJSG5lcNHbl53haKxYNtTBS9iw+KceD/nDmXzmNC5YJTxMX9+daSUdxg8yiwiy3nDd6KQLOkcdOue18JTUXlmYQntXlz1vkQ30vvFWV+zSMGqtZzrbXSlgSubLNawkLILMHVJMd4sKHQfulqzXzL/ugjpexcpSCxQDa5HWnKVewMt0OgAFzdHBVlYQp0dZDGiRTGs0qXgfAbiInxE/pxYJYedcRxBL3hace2tzlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O35FdvNapGxZEI2iE+ZPIiuheh1ek48XnOHhldQ7K9k=;
 b=k7NcxqOx5/CIdDxKVAxrRZh96Ij6mZYzzRFRUxNPA1fqp6AJHrK9fneF/b5IMi+Lh5F7fb8GdtNJGcm3ksCI97SpvW5R8Ors4dru5umDaFNlbzhWsXR7WXIVWLoSkrb9TbbnoRM7MY9UUjDCVsWxYFJ95knQ1fblqd0KSdf8LDvr/l8P5hXlqGkRHvYCztQK8/sSOizm9NAXNlCJwb4QMj862j4rYbWmteFj7fT36rEMVraevlelb12nijSonNZss7RzbcPe2mF7lUjhhfoTPdFdazhqnd69C7gnuy/OkAw6EAObGudu000n/U0J8RO1RgpDFUGy207WwH22UeHNwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8996.eurprd04.prod.outlook.com (2603:10a6:20b:42f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 15:26:33 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 15:26:33 +0000
Date: Wed, 24 Sep 2025 11:26:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/14] drm/imx: dc: Add DPR channel support
Message-ID: <aNQNn9EwZzCjapB6@lizhi-Precision-Tower-5810>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
 <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
 <eb070dbc-1e8e-437a-b519-69709b3feae4@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb070dbc-1e8e-437a-b519-69709b3feae4@nxp.com>
X-ClientProxiedBy: BY5PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:180::24) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7c21bf-faf1-4357-0483-08ddfb7ebe68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CpapovHm3xpBTKs5eL06tGMEB/u6WH8WngATz7/BXlXJNYW/Q+DXr+S6hIBC?=
 =?us-ascii?Q?YUxwI70fpGch6LeoDc9pYuiPlEMOYx4hx+1hhtAwwhHGYpBp7shX/CVyc6ZE?=
 =?us-ascii?Q?XnDG50yamS2VK/wMk7hbeidBWfzqL8kTPe+4vjdtO2GsiOXnbjJE9zvAIOAT?=
 =?us-ascii?Q?Kfi6DU2Yc+XYw4E1tLGxvBwvMhk7E863DjD27e1wZgYbSDYneGHwf07wjBj/?=
 =?us-ascii?Q?nU8xWRVN9QQxr7IgGDqiKGl7Nk9mZOS4ZcwI73PebRA/81+naHwryISuH4X9?=
 =?us-ascii?Q?lXsG0znlNVtVGMHWljFdvAqSJff6r16NRE/298I7f96kj9caJjFpWt1qfn5H?=
 =?us-ascii?Q?i1XNmP5I1kGsCWuboDXF99jU9MbIjPp/6EjFouw3PnOI9ebGL6MxX2zENbRi?=
 =?us-ascii?Q?reOyy5Wch7gQtfbEdyVfu7DgeBfcBo3KwTZKQSYuD/g4xMqtu0PaAG5lz965?=
 =?us-ascii?Q?u8+cGRYnupVO9LVgYP2ucL4RWJ7Jxa6b98veixaTOwJM+Fo6YvYxjYVXpawz?=
 =?us-ascii?Q?qUmm2imj2ko6ZacujLn3Onp+ZJaebbWc6A5XFp4np96aN1XUQn93IQ6AynA9?=
 =?us-ascii?Q?IcCtyE0FzGj2wN27hpau5yKA5M4Y63nOULpvCTWaqWducGq7jWHYbZyQ4o6/?=
 =?us-ascii?Q?eaDT9OPquKbn5IKfOScxkawGHYx/BpZ3uoebk42O4ULVgNozyFDR3f368pwN?=
 =?us-ascii?Q?XH7hBpBoiPkwcmQR6hn+9qS+jdVwbA7M4k8EZ0cRAWJHRpAre23y8t127Ncx?=
 =?us-ascii?Q?1TdhtgrxpZzn6dTY+rAoKlwi7DeydY/wLGkZ6GZj/0SSTj5W+DdyL5j4m1jK?=
 =?us-ascii?Q?2oMpzIibOIdVPKGAKYnYBvAch4E7S1uJfw7EPvVCBd56JfChYrgGggPfD5Sb?=
 =?us-ascii?Q?HU1bKkfMs4YBgifWbcFKHXvUoNYOJO4YX5f8KIvh4OCrAiGGY+L9WYLQsNU4?=
 =?us-ascii?Q?ybxKKvkQjjW/mtZB5Tk4a+dY9TBblv9xsss7OX9IipXNgNxYsAlrJrfC4xP0?=
 =?us-ascii?Q?hD7qOh9yJmgAjTCl6ShT7VhAxWkv6zuNDiGAXyrRJmKfRy0x6hYZ15/KRwhd?=
 =?us-ascii?Q?5Hv1vwCsXqEBG8ZJGpOpWttu6bH/By6I3xX6RuKXpPhxsDMrB2H0g6XKAfgl?=
 =?us-ascii?Q?nPxJo+slbggj2cWQLtncFm9pN8fYtrzCBlJlw9J+WYignOeCwPb7BAWPFTJ8?=
 =?us-ascii?Q?EyCjJqLjP/qSywq/jFW9Ot1wisBp8iomGvjg0L+J0BAPY7HElgr0T7U0BLQC?=
 =?us-ascii?Q?emG2s4x0I36hGfTEEKhkK3y2OFwWXMij2TgvnaKxgSP7bPb7HXQOMosM2+U9?=
 =?us-ascii?Q?Hsei5HE4znbDntzWzEPqZfk+8MJVPH6Mibd56HD+CZLTyrxcLJwQ6HV7FpWp?=
 =?us-ascii?Q?YJ4+3a6+DrRkxIhITumqVKWJ895uyC/gKc4nsjmq/wJoy6ceqUEAu35X+u1O?=
 =?us-ascii?Q?4vu+sOTFVxSmSksTcgrMsUIoiQJcnHLuRMm15tOQ3uwlV3V0NWvL1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cX9hbmOr5Bxh3oLfPyR1mFECo1LbIPcYczxzjuEYvuUP7bB0etWjq6q/NOJC?=
 =?us-ascii?Q?gDYO9+YaTMPHDtRXnJjD/l99RG8xzHgKjk1y7JFfVHahfMxkfBksDnDusOHM?=
 =?us-ascii?Q?5Ia7F46bFrc8Pd659FnEIGPqEeSa8ZEAw921PrTPaXyXWfK6trXqZSauZyha?=
 =?us-ascii?Q?BekZ1S5DDKhxblrzAXD7pe4oTXy5R3oNyfWWB07T0BldgX6dr296MfSBWiZ4?=
 =?us-ascii?Q?zifZhQUiX4D6FjCrntLX6tzjJwxkRzIm6vNAR5eVQmqouARI3ZXYFZgx4md6?=
 =?us-ascii?Q?UD7XZvnmpUQqpAWlsyirXRMwNQuwm9NJ3UdliJKGd+bfTk0aS0pbUzbArxpw?=
 =?us-ascii?Q?6JI7Xa9ZSAirpf0MOv3MbPCUMXRs8XEbxcowSzqeON0vIO5rzEeADbqZieRo?=
 =?us-ascii?Q?NRguj00+HO4wkasvX7nqLdco18d3Dge35iTuIMA0O107YhKpvfcAlCtrdV08?=
 =?us-ascii?Q?5z9TE6KMq/d3HegsLBgY5/9MIm2d4yMnk9F3mA3eVHbJ274nSWiyQChM7S+Y?=
 =?us-ascii?Q?Jf2aHuYA2h6M61OVZIh/pjpiSSqCesZ+UX3V9Knq88OW0UYvMmSLJwr5ru+5?=
 =?us-ascii?Q?aL2cZ3VvS6Vz3ueIL2+GwYgsDrnQ0KTHqKXXkW2FHHr6oPwB4ZYL5ObtVpUT?=
 =?us-ascii?Q?tkLTpijccWqlt76KJoAMzJ5h5+iGwhcyHTdljjTyITZncBDbe+inWO5e4vWP?=
 =?us-ascii?Q?r6fgyDv5BWRwvMfJWbgEJF602R6UGQOG/ZaikJ6GzB9x+UMPoDAk7ZhFWHW2?=
 =?us-ascii?Q?udKL1UCifHkmuVxA39STYxZrCkwwsy1maHrtz35uNO4igxglNWy0zt9Uz/bq?=
 =?us-ascii?Q?v7NZpKB0BaxhJkHkSXR2W5pwnf4v1fLNJ5Jq3scw8utymlUgRbbYe/fQ0skO?=
 =?us-ascii?Q?zvSnEKwHNOOUK/SOjrIY6agAhQgoK6mylxlQyFG3JSwt23M6dw0Bh3d73O7t?=
 =?us-ascii?Q?aDXtaWUwuU0O5IsnYcx1slfEMDrfW5FQQYQRKEaCgsSvDq/hIPEiZS3Na+56?=
 =?us-ascii?Q?sAnQAFHtc81Q7J7+MojwgFUN875nahC4TM54cCPrCscW2NIGNYubqZ0FjVkK?=
 =?us-ascii?Q?sntG7TE4Cy4i/MdWQuPr4Ng/MXzrp3PuwOPG3aLD+AGBX+5at1zDfzILYizu?=
 =?us-ascii?Q?D4YJLx8I9EU36KaZHjvFCE5Isg/Ti3NszTz7hSKk/LRPHNwKLDfji7rYfRoo?=
 =?us-ascii?Q?5FEacWMcSxaUPZ9GoOukIXcpaeGUBcmfeu80ObcQsmzwsfPpihswMh61jIB0?=
 =?us-ascii?Q?BudZQNUPkWJmLblc039ZVuZhGYrOUXZn+QUoY0xW+PrYAcv4DWRRp90GQEqE?=
 =?us-ascii?Q?VPRTPrVp4ToX6XuvjeMR9GDkG5Jp62saVg2TH8DLqaLVLEE9GviuVJ6Y8Ddd?=
 =?us-ascii?Q?i9jUWgfFe9gLG6OYIBzWBl2BMt2kMu5tpC06hSNcTvjQuwQmQmREAc5SEaw9?=
 =?us-ascii?Q?6nwJjrKxikWl9E3LrwIbA+DfukKq+jQlsdcdm+mdNGWp+TLNR8mZf4w+WDys?=
 =?us-ascii?Q?YSXbDGFAPA4P7ekmp5LTm/7iyXER731G3cjdjbPdo9O1lmErbOOA9sD3JNKk?=
 =?us-ascii?Q?gcopXbKSYSM4qHFDRc+RnycVl2hRA4Zl08vsnC3M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7c21bf-faf1-4357-0483-08ddfb7ebe68
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:26:33.6866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWlrF0cBgHAMd1aVZ8p0kGHLifVm0mhHKPsrZVyKIOD/NUYOyx9/ibiZpicF7fPinYwktMLO/2LSSYNrtwd9gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8996
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

On Wed, Sep 24, 2025 at 02:41:50PM +0800, Liu Ying wrote:
> On 09/23/2025, Frank Li wrote:
> > On Tue, Sep 23, 2025 at 10:07:57AM +0800, Liu Ying wrote:
> >> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
> >> It fetches display data, transforms it to linear format and stores it
> >> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
> >> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
> >> driver to support the DPRC.
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v2:
> >> - Manage clocks with bulk interfaces.  (Frank)
> >> - Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
> >> ---
> >>  drivers/gpu/drm/imx/dc/Kconfig   |   1 +
> >>  drivers/gpu/drm/imx/dc/Makefile  |   6 +-
> >>  drivers/gpu/drm/imx/dc/dc-dprc.c | 465 +++++++++++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
> >>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
> >>  drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
> >>  drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
> >>  drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
> >>  8 files changed, 522 insertions(+), 3 deletions(-)
> >>
> > ...
> >> +
> >> +static void dc_dprc_reset(struct dc_dprc *dprc)
> >> +{
> >> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
> >> +	fsleep(20);
> >> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
> >> +	fsleep(20);
> >> +}
> >> +
> >> +static void dc_dprc_enable(struct dc_dprc *dprc)
> >> +{
> >> +	dc_prg_enable(dprc->prg);
> >> +}
> >> +
> >> +static void dc_dprc_reg_update(struct dc_dprc *dprc)
> >> +{
> >> +	dc_prg_reg_update(dprc->prg);
> >> +}
> >> +
> >> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
> >> +{
> >> +	guard(spinlock_irqsave)(&dprc->lock);
> >> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
> >> +}
> >> +
> >> +void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
> >> +		       unsigned int width, unsigned int height,
> >> +		       unsigned int stride,
> >> +		       const struct drm_format_info *format,
> >> +		       dma_addr_t baddr, bool start)
> >> +{
> >> +	unsigned int prg_stride = width * format->cpp[0];
> >> +	unsigned int bpp = format->cpp[0] * 8;
> >> +	struct device *dev = dprc->dev;
> >> +	unsigned int p1_w, p1_h;
> >> +	u32 val;
> >> +	int ret;
> >> +
> >> +	if (start) {
> >> +		ret = pm_runtime_resume_and_get(dev);
> >> +		if (ret < 0) {
> >> +			dev_err(dev, "failed to get RPM: %d\n", ret);
> >> +			return;
> >> +		}
> >> +
> >> +		dc_dprc_set_stream_id(dprc, stream_id);
> >> +	}
> >> +
> >> +	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
> >> +	p1_h = round_up(height, 4);
> >> +
> >> +	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
> >> +	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
> >> +	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
> >> +	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
> >> +	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
> >> +	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
> >> +	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
> >> +
> >> +	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
> >
> > Is it okay to access register if start is false since
> > pm_runtime_resume_and_get() have not called.
>
> Yes, it is okay, because dc_dprc_configure() is supposed to be called
> continously for multiple times(OFC, fine for only once as well).  For
> the first time, start is true in order to enable the DPRC.  After the
> first time(DPRC is running), it is called with start == false to do
> things like page-flip(update frame buffer address).
>
> >
> >> +
> >> +	val = LINE4 | BUF2;
> >> +	switch (format->format) {
> >> +	case DRM_FORMAT_XRGB8888:
> >> +		/*
> >> +		 * It turns out pixel components are mapped directly
> >> +		 * without position change via DPR processing with
> >> +		 * the following color component configurations.
> >> +		 * Leave the pixel format to be handled by the
> >> +		 * display controllers.
> >> +		 */
> >> +		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
> >> +		       G_COMP_SEL(1) | B_COMP_SEL(0);
> >> +		val |= PIX_SIZE_32BIT;
> >> +		break;
> >> +	default:
> >> +		dev_err(dev, "unsupported format 0x%08x\n", format->format);
> >> +		return;
> >> +	}
> >> +	regmap_write(dprc->reg, MODE_CTRL0, val);
> >> +
> >> +	if (start) {
> >> +		/* software shadow load for the first frame */
> >> +		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
> >> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
> >> +
> >> +		/* and then, run... */
> >> +		val |= RUN_EN | REPEAT_EN;
> >> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
> >> +	}
> >> +
> >> +	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
> >> +
> >> +	dc_dprc_enable(dprc);
> >> +
> >> +	dc_dprc_reg_update(dprc);
> >> +
> >> +	if (start)
> >> +		dc_dprc_enable_ctrl_done_irq(dprc);
> >> +
> >> +	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
> >> +		width, height, stride, format->format);
> >> +}
> >> +
> >> +void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
> >> +{
> >> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
> >> +	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
> >> +}
> >> +
> >> +void dc_dprc_disable(struct dc_dprc *dprc)
> >> +{
> >> +	dc_prg_disable(dprc->prg);
> >> +
> >> +	pm_runtime_put(dprc->dev);
> >
> > You call pm_runtime_put() in dc_dprc_disable(), but not call
> > pm_runtime_resume_and_get() at dc_dprc_enable().
>
> Yes, dc_dprc_configure()(start == true) is designed to get RPM and
> dc_dprc_disable() to put RPM.
>
> dc_dprc_enable() just sets PRG to non-bypass mode.
>
> >
> > Is it more reasonable to call pm_runtime_resume_and_get() in dc_dprc_enable()
> >
> > dc_dprc_enable()
> > {
> > 	...
> > 	pm_runtime_resume_and_get();
> > }
> >
> > dc_dprc_configure()
> > {
> > 	unconditional call
> > 	pm_runtime_resume_and_get()
> > 	...
> > 	pm_runtime_put()
>
> Here, as RPM is put, it's possible to actually disable the power domain,
> hence possibly lose all the DPRC configuration done between RPM get and
> RPM put.  So, this doesn't make sense.
>

Okay,

dc_dprc_enable()
{
	...
	pm_runtime_resume_and_get();
}

dc_dpdr_disable()
{
	pm_runtime_put();
}

dc_dprc_configure()
{
	pm_runtime_resume_and_get();

	if (start)
		dc_dprc_enable(dprc);

	pm_runtime_put();
}

Look more reasonable for pair get()/put().  after first start, ref count
will not reduce 0 by pm_runtime_put();.

> >
> > 	if (start) //look like only need enable when start is true
>
> I may add this check in next version.
>
> > 		dc_dprc_enable(dprc);
> > }
> >
> >> +
> >> +	dev_dbg(dprc->dev, "disable\n");
> >> +}
> >> +
> >> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
> >> +{
> >> +	dc_prg_disable_at_boot(dprc->prg);
> >> +
> >> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
> >> +
> >
> > you have runtime functions dc_dprc_runtime_suspend()
> >
> > If runtime pm status is correct, needn't call clk_bulk_disable_unprepare().
> >
> > Look like call pm_runtime_put() here to let runtime pm management clks.
> >
> > otherwise, runtime pm state will not match clock enable/disable state.
> >
> >> +	dev_dbg(dprc->dev, "disable at boot\n");
> >> +}
> >> +
> >> +static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
> >> +{
> >> +	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
> >> +
> >> +	dc_prg_shadow_enable(dprc->prg);
> >> +
> >> +	dev_dbg(dprc->dev, "CTRL done handle\n");
> >> +}
> >> +
> > ...
> >> +
> >> +static int dc_dprc_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev = &pdev->dev;
> >> +	struct device_node *np = dev->of_node;
> >> +	struct resource *res;
> >> +	struct dc_dprc *dprc;
> >> +	void __iomem *base;
> >> +	int ret, wrap_irq;
> >> +
> >> +	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
> >> +	if (!dprc)
> >> +		return -ENOMEM;
> >> +
> >> +	ret = imx_scu_get_handle(&dprc->ipc_handle);
> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
> >> +
> >> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> >> +	if (IS_ERR(base))
> >> +		return PTR_ERR(base);
> >> +
> >> +	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
> >> +	if (IS_ERR(dprc->reg))
> >> +		return PTR_ERR(dprc->reg);
> >> +
> >> +	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
> >> +	if (wrap_irq < 0)
> >> +		return -ENODEV;
> >> +
> >> +	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
> >> +	if (dprc->num_clks < 0)
> >> +		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
> >> +
> >> +	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to get SC resource %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
> >> +	if (!dprc->prg)
> >> +		return dev_err_probe(dev, -EPROBE_DEFER,
> >> +				     "failed to lookup PRG\n");
> >> +
> >> +	dc_prg_set_dprc(dprc->prg, dprc);
> >> +
> >> +	dprc->dev = dev;
> >> +	spin_lock_init(&dprc->lock);
> >> +
> >> +	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
> >> +			       IRQF_SHARED, dev_name(dev), dprc);
> >> +	if (ret < 0) {
> >> +		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
> >> +			wrap_irq, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	dev_set_drvdata(dev, dprc);
> >> +
> >> +	ret = devm_pm_runtime_enable(dev);
> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int dc_dprc_runtime_suspend(struct device *dev)
> >> +{
> >> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> >> +
> >> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int dc_dprc_runtime_resume(struct device *dev)
> >> +{
> >> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> >> +	int ret;
> >> +
> >> +	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	dc_dprc_reset(dprc);
> >> +
> >> +	/* disable all control IRQs and enable all error IRQs */
> >> +	guard(spinlock_irqsave)(&dprc->lock);
> >> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
> >
> > write one 32bit register is atomic, look like needn't spinlock.
> >
> > Only other place use dprc->lock is in dc_dprc_enable_ctrl_done_irq(), which
> > write 32bit clr register.
>
> No, dc_dprc_wrap_irq_handler() uses the lock to protect register access too,
> so it's needed.

guard only protect after it.

in dc_dprc_runtime_resume()

+	/* disable all control IRQs and enable all error IRQs */
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
+
+	return 0;

+static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
+{
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
+}

How spin lock protect register access?

1: IRQ_MASK <= IRQ_CTRL_MASK;
2: IRQ_MASK + CLR <= IRQ_DPR_CRTL_DONE;

2 possilbe result:
	1 happen after 2
	2 happen after 1

Frank

>
> >
> > Frank
> >> +
> >> +	return 0;
> >> +}
> >> +
> > ...
> >> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
> >> +{
> >> +	prg->dprc = dprc;
> >> +}
> >> +
> >> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
> >> +{
> >> +	return prg->dprc;
> >> +}
> >> +
> >>  static int dc_prg_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev = &pdev->dev;
> >> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
> >> index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
> >> --- a/drivers/gpu/drm/imx/dc/dc-prg.h
> >> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
> >> @@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
> >>  struct dc_prg *
> >>  dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
> >>
> >> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
> >> +
> >> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
> >> +
> >>  #endif
> >>
> >> --
> >> 2.34.1
> >>
>
>
> --
> Regards,
> Liu Ying
