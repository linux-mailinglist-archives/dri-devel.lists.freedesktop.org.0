Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9C990232
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D63710E9D1;
	Fri,  4 Oct 2024 11:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h9uf7fQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3792A10E2B0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 11:40:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfTvAqKOONnus0yDYxXyrXnyDLk3pRJ3mHiMTigJkhe7GD9RMQIbHkdzqlfmyANNp+/iMjNfQqyMZXQyRBmfnHHsa6A7/UYVvb+QTGA7zseKbMDmyeDP88WaO2NtfuLaQ+w0F2LmHKrB1DTqWhhPbO5JX6p0yzWy70Czeqmj6Q02TO459H1JR2bka9jP8DryR50Gy2TEFvTXV8mm+0rwEo846zJT3yxDgpj0ZUA/vmOT8l+YPewi2cAx3h8paoIg+w3X7piWSaR7nRMXg1DdFkBdS+/2CeD6QtAFE8LYgNcIuLVRjzyzsjiUhMw+COJDy/1rGDRWF0m/axelfw0eFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QIchNDWmocysX+m8BpvGq5AFJo/VhHxWb9p6jba9nA=;
 b=Q93fdFntAnAD4aWCPgeY8SdKg1ACWRzgZmNiRHT7hLN7fkrHdqu8XMrfDrRbuwmrZBUrxHlMN+uDiZihDjkGDY7baEbuP6n44l5JuB+qV+m2UQTYwb36jJobS3aUO9grEFeSqbfVGOrLaJOK0nKVxXNPnWenQXnoydXmIvDCIP8G1IjNVIRM9J7wiDxa76tfeVatDKpnrBOhYQyTtnBqBltPKu7ewmmlFmSx/ochCncpB210c7v/Xbt913TlDYfoMcT/of+EoNBiiedQJJobu0s+FzCBDZcNnYQLAieiXLDnrfXZZneeoeZORFDnlda2OTYIUkNW0sL9oTQp9GjCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QIchNDWmocysX+m8BpvGq5AFJo/VhHxWb9p6jba9nA=;
 b=h9uf7fQAermrQOchf3+o3XB5nOqlLh//wY4yAjM+UIsuEY9c7+WuicxsFadkVMiejReqAtuRf+YgGXDl1RRWrioYQsvFtlJ/7kDgTLweI6+VAWhC5ztqQu4vp/alou29NK5ZrjRVDlQpnsRSj4YaH9RU+C5Odxoj15kFg7zK7GEKztL/74pMvwD0Do8fc598n6F+2rq5Z/11NfqKjfhT9lGxDFf87RgPC2jOlYqxjq+mbRxhLQ8y4eU9ylTSXVl1ZDPSYvx4yXwDSUURtjVPcXJVzb9hG/3tIq8YYTALYIK+9E67bojiikF+a5au3OaJ+hFNmhdieIzd4q9Mt6pMHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by GVXPR04MB11044.eurprd04.prod.outlook.com (2603:10a6:150:215::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 11:40:44 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 11:40:44 +0000
Date: Fri, 4 Oct 2024 14:40:41 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 07/10] drm/imx/dcss: Allow build with COMPILE_TEST=y
Message-ID: <2ktvejmdx3kpz2eu3fpzbygusywqolljz75rb7nxbse2vuub7a@xgyqcj6e3mrz>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
 <20241003111851.10453-8-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241003111851.10453-8-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: AM9P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::17) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|GVXPR04MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: fc651b12-3c3b-4014-0f70-08dce469617f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7s5GWpDf7AAtWrZsrKmwbb5WBB1uwMGeJ5GfQ9BD0eGnEw6C5QGMHm1cOT?=
 =?iso-8859-1?Q?XTBnr71Wh9nB9gyrWweu6nRfktHQRrJbXI7HgW1WS0xKoBsmOOAgon6VsH?=
 =?iso-8859-1?Q?OjKrOm4i5vZFjXkeYSbooRjAxSJtC3ai1RE6/0i78pHFYdzCaWwEbWBbwc?=
 =?iso-8859-1?Q?7wjbZY6O1DOf7WssHFsHDIVEe8VxKtYhAeFUB5gtZ4OwsY+hgS5yyti++3?=
 =?iso-8859-1?Q?uoCKpWgfMtt/ZlNhraVpuzqAE/5ePBcE84TCpR26EUa4R7AfGowno1TdtD?=
 =?iso-8859-1?Q?P+761Xc+imbX8kVOxE3f/e5TL1y4ykb3+8mA+jrK6xaSu6R7mvzkJgxEM2?=
 =?iso-8859-1?Q?yN+JMEcRqqNMxTZz7R5e/cKTqnrAtYtgRnJVxh/vZH5c1qjE5Dd3YlHBzN?=
 =?iso-8859-1?Q?mhSIjkimxw7gau3ShCh24q/DBCDu3O/g/7Mdv+Nb8RkORWq8yToM6HLl//?=
 =?iso-8859-1?Q?dbMapKkKohcuqLGTathpUzNkM2TTSOj60Cs26TaVsYXnH0fb2EtQSLurdD?=
 =?iso-8859-1?Q?yc0Tb2/KwRgy6VGWqep9/sRycEQM2fa+tNF2ax/tsFFKpbf+FAYqVUiieM?=
 =?iso-8859-1?Q?nM/Dts7nEFvJ4ONOAVoMFyLbW7CzMn6ZBu7s2ErNQ7A6b9Y9tzCXcxPkZi?=
 =?iso-8859-1?Q?MmAlc+3qZ/T9A0H/0Tc/8lCwXPcQ2C1aXI4W9JScX3VcobuL3B+1SUlpvC?=
 =?iso-8859-1?Q?JFvw8P09qYGfZ0Kxnov5oQ9J9hOziGwFkP2iGQcmYH2XPDvokVcShq/gdH?=
 =?iso-8859-1?Q?1r5l/d3nnkkLUbzes2rd5QqSW40R/bpEbVNqdLdsm2l7qCdJixpyyeIIAw?=
 =?iso-8859-1?Q?Kkzjz0TZhvDjLmUnr/U4pmnK8eYAGfSshWMBiJA5J3RQIXZmJzSVKpUuaP?=
 =?iso-8859-1?Q?si38JglV57f8rOCCf9Jlf3DhGg+A0ZChDPWQC5JOw21HQqDnJRd0+hixwQ?=
 =?iso-8859-1?Q?hi8gnFM1SR8dy/ftVmWilDZ+bljbYEjBHjXDJNtLwLFib3wv7n18TGZxAo?=
 =?iso-8859-1?Q?Ii4HAxBGA+XPWR0QKH+2akQZz/V4meTl87iJP/BcdxT+S6LfFCkMSOTVU5?=
 =?iso-8859-1?Q?nYPwlAOgv4VZaCPQS/SZ7YzzSqGs45rB2tKOBZ070dx5gVeBuIoSbTw5bw?=
 =?iso-8859-1?Q?izfYaQgL+qThjd6WAw+x0ftKUBD87khcJnNder5ZxBny4U+pEpWgUplYpw?=
 =?iso-8859-1?Q?ygSNkrXv9w5zQdRdh2bwQQsp2kklK3iR+Z3UznTf6cWI5LBgQ/A/qlWw6L?=
 =?iso-8859-1?Q?hXAGMUuLo5fN66V2Lajm0+93RLSnAKW84RbLxBRZu0D2QWflFHWQwK6t0w?=
 =?iso-8859-1?Q?05sHpSs9WJyJh45H/MgN7sb/Tg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?C7KeswOfoRmS4/RYotjUceuHFB+29nKXXFV1hRxgxk8RwP4LvQ3ICsh34F?=
 =?iso-8859-1?Q?YiRS5d+CvFbhq4LyX1gIjUd7Va0U2PPnQhcHB+fCxjPxaUENAMtscIdto7?=
 =?iso-8859-1?Q?OkzDV1xWdKa7Tt8F/GfE8be7IHOpv/cln7pE2b6uDFjIZ+s9zNgLX+y8oD?=
 =?iso-8859-1?Q?zn9APYLZ/lp8+wdTcYbxSqYgd4pmgCOCvVv4V6aFM56kaKjsIaUbx0MKj/?=
 =?iso-8859-1?Q?myFy481eOhJoTQHD8VU6ZIqz7cwlf3Rt3AvfkkI8MuhG2wbsRyiWKljgNE?=
 =?iso-8859-1?Q?ME7zFp6bVJ45WZdsbZKTjR/q8l1EruzPzlbcrQLW73H+JV4dqwYIe6J6WO?=
 =?iso-8859-1?Q?ZinuOrfdXraSJ0ruzY1GVLD4oDdg6wOIyJUZama96NANDuGTCP6KyccPSp?=
 =?iso-8859-1?Q?07yq4VZs+6jVSg+CViXNbMjE2MNYpX9Qy+SLIbHmm9W+jU9XmI68nrhuzJ?=
 =?iso-8859-1?Q?uhPqMHWSU/klA46okKwnqP5Jofc50/pIy5yoVlc41CymWQJK9gIlQanfbn?=
 =?iso-8859-1?Q?v9bgwZHP9hOaRaWwrPR8hsk5s0LSSLj6fPZEV2ZCd9MQyusFqkcl6mQ2nm?=
 =?iso-8859-1?Q?X44ne6zuhGg9edDLFEqr5m4qaufY178Ab58w4AG2NNIeOk0/gIiQzgl2dW?=
 =?iso-8859-1?Q?rYC4rPuu7u8sibLzaz60tj/+auGQ5nLfWbpAXd2VsmSLFUIXs8v/32cl+D?=
 =?iso-8859-1?Q?NxfZYTR60s3zXSfb5cs97we49Dg7QozVbgD0vTvT2T9mAc/7ZMlDQ166Nc?=
 =?iso-8859-1?Q?AItrX+MGTMcYsklE6aPZRES13YJqjGgn3eqMkRnjXhSRwIRmO7CYjnOjrU?=
 =?iso-8859-1?Q?bCRmBX/XCapG4x13zzESmfwo4uDAZXSTMZgPrGIBiwn1IbRAFSpg2bHI4r?=
 =?iso-8859-1?Q?67ugN8f/ohfcKnBsFurIZskaybo72d1beTBs2vfYrNWUGtv5kMO9uPbUkK?=
 =?iso-8859-1?Q?8CYiINNSeUeOTSLzg1jdIfyIjiawHPY8mOuMERZvz6DGfMWlzFNZHCLF7N?=
 =?iso-8859-1?Q?q4YM5MvKRzsi//UYVi7F3nkGSVe595Jp0UXltYjEg4GXFCr23yEX8Fy+vS?=
 =?iso-8859-1?Q?WpeYWYar3ka8CQ3Wh+GaBIv2EELOjHD2T376GAH2oyCGCfXQvPpwZealE5?=
 =?iso-8859-1?Q?ntCt9vlk4OXXtZvsRyVW+XFoAPC2qXXwSdW5gog7xDppxq/Ite2hXq07av?=
 =?iso-8859-1?Q?9pBhcga0ifGuICArR0/mn9GGJ4MPEfg+eOzJNJKWDft0MBsV4WVmrtT1G5?=
 =?iso-8859-1?Q?3W/JRArW8Tdyg6cyPlD+QEmfXI3mx3kf0hwr7G/ZSFhra0sUCt63JeyYaK?=
 =?iso-8859-1?Q?GKQYaeqdu1KlGKgkI0f3w0nsJL1O5Lbx54uSkVdm4L4D3znlsMU9n7IvXA?=
 =?iso-8859-1?Q?YAVsLpU5tIgkwOPk0txQb4XslgTIO6rT8xiaaBFWzZShvV8bF2v5E0nRsB?=
 =?iso-8859-1?Q?r6pp+y76cpC67W932qHK0G3tXbP72C2k7i4lW6wJJ7AYgzV2HODghNFSwj?=
 =?iso-8859-1?Q?gh4xXw8xUZwZte1/XLOATPTgqlaSjDwhikOv8aJNuSRN8oc76IGqU+YU5W?=
 =?iso-8859-1?Q?ud6+19gIKozySm/qIclxnp+/5alN/bICNREBwIhrVoAIQxF2s7axYjLww+?=
 =?iso-8859-1?Q?v1MzcvWFvEq0G/1zCmrB8Zk4YZXpLD2sgHrPZcM3yaTB4b2VkabN6aPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc651b12-3c3b-4014-0f70-08dce469617f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 11:40:43.9757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOEfc6YX8jM3M+nHbXS1H9seRO5d7Oi0dmRtbUCf/HDaFquDIC3H0v/CyWoYf47+Knf0vmKxG0Oidvi2cGhJcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11044
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

Hi,

On Thu, Oct 03, 2024 at 02:18:48PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Allow imx/dcss to be built with COMPILE_TEST=y for greater
> coverage. Builds fine on x86/x86_64 at least.
> 
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>a

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu

> ---
>  drivers/gpu/drm/imx/dcss/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
> index 9d58f41bd00c..e014ed3ae66c 100644
> --- a/drivers/gpu/drm/imx/dcss/Kconfig
> +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> @@ -7,7 +7,7 @@ config DRM_IMX_DCSS
>  	select DRM_BRIDGE_CONNECTOR
>  	select DRM_GEM_DMA_HELPER
>  	select VIDEOMODE_HELPERS
> -	depends on DRM && ARCH_MXC && ARM64
> +	depends on DRM && ((ARCH_MXC && ARM64) || COMPILE_TEST)
>  	help
>  	  Choose this if you have a NXP i.MX8MQ based system and want to use the
>  	  Display Controller Subsystem. This option enables DCSS support.
> -- 
> 2.45.2
> 
