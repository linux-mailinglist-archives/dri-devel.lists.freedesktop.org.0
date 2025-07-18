Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07926B0A842
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938AD10E182;
	Fri, 18 Jul 2025 16:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Jd2u0btz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012040.outbound.protection.outlook.com [52.101.71.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E24B10E182
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:15:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHIZ6m+nBon636mRwHERdNrHAnKxJ+LNacYTy0spaxrclqmER/NdHigPTR5IkQR69z7nnsPi3AHkZSv6TSF/sE2Gd0LpqUxdMzdtp5RyA/v5suQRVTu8ZCNLksXEHNRrGawoIetrhkXuGclTfxAktGOIwJBNLZzftHnfOEHVqP0ncROX3xHNI15EZpXYFO3IhSivzJ0IJsuN0dRz6XS7kwd1xvQYNO/piJeNehKtwZOoPYEeHWzdj2ybgWHxhouvYeeCLXV+uYVLk5lYgdb3YHB9I5tizYHvKnDBQIfKj/6w71eoI23dgYJkj/nT9MsJ+oLbpmOG1hcQFBHG+AQLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8nRUD7bOQUyrLmrTaMNoSTGcKnEcWtR8Anjz+wfCiM=;
 b=tYPt0CnLGkwHHZdFOn73oweXeVv5elmOj1VWm1FZ2sWD5mkOf3OMsxxD7iJ8/zELHmkXEULHzr+jKrF8+9wdhNumtqKyTdwr7d5atrJUGNgJF9t7a3fraEbsEopzU+ykAk+kxgesM98HOOE45lWYzgS2dIP0dd4LQjmb3pQbrzwb2OGIv/9PPOHJfvP3KWfE9wwEDg/CJdVChjYkTwD0dePll1U0LCvgb11qLSZudGIFZMOy0iSOaSlB1dLEiH3RKWb5ijP9IkY6Dn88NMwbw8lzIQo0Nw+ulxyHNloY+KUKZ1G3pdN4LsaZK3xnbVS5MFVSkjyJixcLNoEk7hMsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8nRUD7bOQUyrLmrTaMNoSTGcKnEcWtR8Anjz+wfCiM=;
 b=Jd2u0btzs84SjIo/TWpRRKh3fiUOcYKfyxiuNmiQ/ZJ+LdDrLYaqJXEQkKjeQXFMWM21Kp14CF18HWCIMH/hhkyQtinGUL/6OD9Aq3ohjDjBaWJo8vWrXrovVUcLP3jaYttAt8a4FburJd/5eVoH4qOM+fKKiOWC68OlA8TWl47zIBeryedehu1fm4gb7LnhaHPcaPHhAKIlPwfWg3URt4aCpocTE1bzXl22aeqOOdXzRDCxtqbQ6xS6bpFa2ZiA/auWDj6ZoUMvW60nqEZTZE+XnHEDaSezZrwFmxTMXOZHgcQh2bGKbzD3RBLh5oVWPqDHW8cZlCfODXIxTv9eKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7985.eurprd04.prod.outlook.com (2603:10a6:20b:234::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 16:15:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 16:15:23 +0000
Date: Fri, 18 Jul 2025 12:15:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de, shengjiu.wang@gmail.com
Subject: Re: [PATCH 1/4] drm/bridge: dw-hdmi: Add function to get plat_data
Message-ID: <aHpzElP09pEOi4id@lizhi-Precision-Tower-5810>
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-2-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718101150.3681002-2-shengjiu.wang@nxp.com>
X-ClientProxiedBy: AM0PR06CA0090.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 951d9501-ae3d-44b4-4f48-08ddc6164c61
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qZN0h89rk+S+oo8cViuM0VdtVzUWxor5BtmE7dj6tlbxP+XN7tQa8t0eUXXl?=
 =?us-ascii?Q?xN57MV7HB6jGlIl0Qjr63gi+Jf+mM9jW5UsLgg4Pe4DI8poUdvKXjEYqPQgS?=
 =?us-ascii?Q?tLmduEy1ILu60AuUu6uPnOvvF/XXylKQ1ZzV0Ln7Wg2yBRaQqTuIAxN+41yL?=
 =?us-ascii?Q?9gdu+rKQzF6WjMKaC2cCf2PoxBpYBvcwG00zVJdLe5IWBTQ31upIy/0vc8/C?=
 =?us-ascii?Q?R7LtkbnFtiE1i50MHAXGw5cQQ73sK4XocSLkEWOf8TXjAZ1L/77d1EmJpfQo?=
 =?us-ascii?Q?kk9H0DbEHYFGZVPjEkgSSqWO2pveGJcvzfSlnFsdZDeabLOFS9kJUydV/kcx?=
 =?us-ascii?Q?csBmipc2GNyh1L3esJkg27lBphTsUn//c8O45b9ptez77YO9VZh2RkJslz42?=
 =?us-ascii?Q?+d22tjrb5UJQg/jZj+EJGSXY6vYKaulLznU4CCcmsQwRT0yt61ixwexdUq/i?=
 =?us-ascii?Q?WSLpfnNPLxCsjHOe0/5F0ZkkOGl6clZgYGQDwMYblm3p3PcW9WCL87Wp/8PZ?=
 =?us-ascii?Q?0Byc8gR6YxZvkB/lCCz+RC48O7lPZt2UDSijvFBPG7mJW8X7dNir4T0NSmSC?=
 =?us-ascii?Q?dhDdTze02qht9iNO6PgmIio8YqeMtokY326Hs7lWGCC6YStD03B27CeqYLg3?=
 =?us-ascii?Q?CYreWo4yXEKwSKRfnDtED8ePzCDaVfcOuKxat834Sbf+pyvB5zWdDjkOAjht?=
 =?us-ascii?Q?MREhh3FFHQNGK+LXlTbPNoybTj5TwL/5JpMxOO9W1lFPOYd6bI6ymdaAfMtp?=
 =?us-ascii?Q?Hz7g3mlu2kFf447tUSAZKVug7XD/8scDfVSSDRfqDlitbnvQg7DEWyqvzunq?=
 =?us-ascii?Q?JcKNCbadipEfbnBc/k0C/sHm16fEnSOCxeo+T37uV4rix+TsPNthfp9IIUJ8?=
 =?us-ascii?Q?x8+xUbBONW9Xt3BJqshbxm0ggGtTzwzJvUJh929nDWZJcbxK+//jpWQ4xCql?=
 =?us-ascii?Q?LF5NMHMydpSTX/1lqxo39h3Gst6rHnwkWk2NOt0M+0qCQANB4D3C207kN2uf?=
 =?us-ascii?Q?6lyPLiHNKEBHJWKGp5HBV8aTQR0CoXkPOsDi9OneSRj9lZc4r6MDz6OKeiI6?=
 =?us-ascii?Q?xGQy66NwEuOADw+usICo8Ic/+vzz2/vXJLN4reX/bR58jFnAqoIw7TjM95Cp?=
 =?us-ascii?Q?8+OT4AtKV57/9zHZAatmVQXbKeMrLFD1lPwVdjtqYLMNOI1iy57nBCQmWngV?=
 =?us-ascii?Q?QnohsVPi241EX5zrIwWYbF1ekGwjGzWobdueNLDUl1UUIX0HKeFNS2eo6X9p?=
 =?us-ascii?Q?zpfSCZPrznzGCvoczcT+rAUkAj042jM/86HixKCzTIJW0h+CUzmu8sj/U6MP?=
 =?us-ascii?Q?TNIz+yjCMm50h3cmthR2Gxcbmxj9N6EzTzmzpErwuZoHVlUK1olEM0WRn+Cz?=
 =?us-ascii?Q?hR55Oi3rZYDcJlL5eifCeXYMc57GJBBFYNpB0uXq+hAdcA14lGUeJHCacTab?=
 =?us-ascii?Q?9eb94u+VnVgkhYr1NuIobMEESTCoEAe+8VVv4/S5Z7gZ8+NHeN3yrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0/UEYuoJIhrSVZRYVHaWxdpTlbfPrFgyfJlqYt7XGW4E2tg34LiAD6qT5B2m?=
 =?us-ascii?Q?7J0k1lNP8FGNS4ai+zqxQe/pujpKqWoS7nrqwDdxNoccAgA02Cjb6TSmfgMy?=
 =?us-ascii?Q?bdZszY0JeNSqFpgw+r6uWooATXuYIzMQbtIq+A7naoDCVZTsyfsEmSYchfVa?=
 =?us-ascii?Q?1y80Wm1NyWL9GzeyZmzAUmXhRMlPQhI3sl7TUADBCtdHud9+t/+ibKViaY2t?=
 =?us-ascii?Q?Z/Ck7Xupju7WjR8ynF6M+Que73vpl/jsggQ/gt8Zbm0X2HfTok1iEfh5sIZv?=
 =?us-ascii?Q?VhafCPlARVkBF/Fuy7H9dMMpYe2Ju+pZwOZRbYv20wcdXCAajKcFgOFSpScR?=
 =?us-ascii?Q?bKf6bPRUn7xNs3bC8oA736FgkAAIxbhxFXe+oEz2Ab9wyxqlIjuWeIGQobxB?=
 =?us-ascii?Q?4CBbhH6JytSwQxsy5iSD1r8AOKTjXQiL9D8aBpG9OdMZXxcyikm9tf1VxCMX?=
 =?us-ascii?Q?Y9ud2In8K4RNETSOJaZksapnu7hU0hWDS10HqH+13XPK5YylxhELWQPp1iRu?=
 =?us-ascii?Q?jem64jaIo4dpHggMSgHvXRKwsPnZgnTapIaOEx6octcWjOcmvfSntQ7civUW?=
 =?us-ascii?Q?t3gBMICkzdhmbnMOtoNDbFtX5W3oVjDtfPdxprHKEw61tyIzof88YRWmnqe8?=
 =?us-ascii?Q?P5hSFOIlqGPXAIJqLr9E0WLeyX3nUX27/U0tDnPng8SdiP5WXXZ4n6BOeKMm?=
 =?us-ascii?Q?j3Ke0g+dM8hO1GNfkHSAVkfBKk8ZNYkzvUgTdY6eLGbgT1We1AneyKEYvkbs?=
 =?us-ascii?Q?GWcZ28OvQlNVJZpqzmwiPNk1JL2UIQCWpg3UUjvYONCarOpOiPHkhTnIKQIg?=
 =?us-ascii?Q?xjC59dsdbu28r7+oT8OaJ5FZEHPx05ytUT+kYFwwxQ3q0ThZO0oeCvR/+8/b?=
 =?us-ascii?Q?J/tHaCbZD8ip+oXFOFwGWZtdCexVaHG2hQLtQB/LYUzvyi2K4aa3xSMCkbTN?=
 =?us-ascii?Q?TYEqWY2K4hw3ukrWOcYlXzRAVB82E5i+f9pUZ/ng8JT7mICR1Vs5lfVBr4rQ?=
 =?us-ascii?Q?185gmfUvic7tGewF5NxL04SV/wuiDhnD3UQeaKaozzz2Cf/r5kAIM31jqGiK?=
 =?us-ascii?Q?Wj2t8WnFB+dHzsaICwQSKE97vHkHCDo4PDtvu80EvrJr8KrmjfW8xui4fdNW?=
 =?us-ascii?Q?QtQvEEGUmX8Y2pwVGmRVkrngYHF9aGaUt3sH4dAjYij3AT6C15Qr7W/wqxFF?=
 =?us-ascii?Q?i/byOK8LBzzBuermRMp0iCiJ9JhM/yWtLoQ7X1vJz/zikA7WjW5B7oN2cDxU?=
 =?us-ascii?Q?qjglekTTOnViKyjJpu2jrTLyDb2e/BGRIfIYVkgj82Am+xy7/1zlcs6OmVxL?=
 =?us-ascii?Q?AVuDlCZ4NG9Y7yvsiwN8VCuvDz8ymQNw8qIj6xMBGGLTZmRhOd70PPuSw52z?=
 =?us-ascii?Q?vhE88Jc0FxHGRSJ1jtbkKm7aDgRVv9A5DRJFAeRlDKV5uXYNn4HXMsmMlStt?=
 =?us-ascii?Q?kS6FGzq+gCCUgAbUOusO87p7q8kytKxwcTu/8rWfqOl1Ix0JpkWlK3exVE3R?=
 =?us-ascii?Q?CBxK/waLMWZo4HSq+Ph1ic+tDKaLFXj66P6XoXEFjzDRywwdDF8+syqIZTmh?=
 =?us-ascii?Q?0spdDkHWkFXAB0QyWKRoKnDfd2qjBFT5guUS4KQW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951d9501-ae3d-44b4-4f48-08ddc6164c61
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 16:15:23.1467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kD+m7sJI+vbYccrr/12zvwLwbbcW/S/YK2OIsLjA5gx6hft8kc62wBhkrUJB0TqKCWBPLaR0sJvBDBik9T48DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7985
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

On Fri, Jul 18, 2025 at 06:11:47PM +0800, Shengjiu Wang wrote:
> The enable_audio() and disable_audio() callback pointers are in
> plat_data structure, and the audio device driver needs to get plat_data
> for assign these pointers. So add a function to export plat_data
> structure.

drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data

Add API dw_hdmi_to_plat_data() to fetch plat_data because audo device
driver needs it to enabe(disable)_audio().

Frank

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
>  include/drm/bridge/dw_hdmi.h              | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 76c6570e2a85..3dfa42178f6c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -198,6 +198,12 @@ struct dw_hdmi {
>  	enum drm_connector_status last_connector_result;
>  };
>
> +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi)
> +{
> +	return hdmi->plat_data;
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
> +
>  #define HDMI_IH_PHY_STAT0_RX_SENSE \
>  	(HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
>  	 HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a46baa0737c..a56a3519a22a 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -208,4 +208,5 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
>
>  bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
>
> +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi);
>  #endif /* __IMX_HDMI_H__ */
> --
> 2.34.1
>
