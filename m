Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D89AB00EE
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 19:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BED10E204;
	Thu,  8 May 2025 17:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="O0fkckih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD5510E204
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 17:04:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaE5ULxvEhS42eLIYDCam90sg6QrYwThg6gRb2uC/iAlhzjqUZUp+IcT9eVZy/OaYTyeHBZWm1i3/cXOIixIhJDxwE+ujb7hRC7kLkSPH5C0Aesql5A2u9WlAj+q6PRtmwlJuiuHZtUuN3+qrIBdJ9xxF/Tz0pI3V8ZVgsv76gtlYpnGI1N625YrTio2we+XoO/GK0ACjVaF3LIztiNj8Noskf97QZsdohipmyqjfnbo6DIUPWJOTWSCDIGG6rH272XaHWVYTpR2M6bX4Sf54PuS9xmamt1SjuVmYoWZs5fMD0HCCcoeG8QtZy0ILFythpcN7M4V3ayOsrB1ptO0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMsXnGvBs1tEymB+TmtqElh8uukk+/EV2T/zFI62RiY=;
 b=JXGifcBtv+fwxwqChGMW8qsvKpjNh54eWs2gkGxeOpOkMhci0cZGEfI6z4bIjQ1lHkDjvwpDl+zxDB4IZeQvCGDrf/hSAhrrGW4hyWEAIB2PwuicXIAZwMesiRwKxNpLcCsxxuyE5i3jg9pAgr0hc8fuv5X7hS2DFIbUFRtfXEovAwgpsWfhivTZhdok1PXFCvFPLvGkfStspHL8LyNDcdCQ0gXQcei61YkgHiVdnmgNVGbCXLOntOuNGxWb7kXARR2c2bQb/a8XdsZvPV9ZpV7uPdI11ps3OMHFuddDQselMSj7wxB0Vb+bOQdk57uRTmy8x74Xd7TnjsJOJPhZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMsXnGvBs1tEymB+TmtqElh8uukk+/EV2T/zFI62RiY=;
 b=O0fkckih7iDmc+Fv+IffmSBYT3VfDQi7jPYT+7f7JfijbBv7inYKze7qKApbKudiNow1i1gHQVhSZCU3VRouG1zJFQxW6MQ0Q9x/HbEuPQ7+rEE/E7W+fTgtKq7moqeMhEzlDYwBUJ4aQxMZV/UKS1RPWIaRkpdeEccwvs5KHoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYYPR01MB12272.jpnprd01.prod.outlook.com (2603:1096:405:fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 8 May
 2025 17:04:29 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 17:04:28 +0000
Date: Thu, 8 May 2025 19:04:11 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 hienhuynh <hien.huynh.px@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: rz-du: Support panels connected directly to the
 DPAD output
Message-ID: <aBzj9CZH3JtzR6og@tom-desktop>
References: <20250508095042.25164-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508095042.25164-1-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR0P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::8) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYYPR01MB12272:EE_
X-MS-Office365-Filtering-Correlation-Id: 3712a51d-f1ae-4dad-4d23-08dd8e5264a7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K87V67GcwzRaJtxM0DMfWZxhUsW4Q102IHdMqBB22Yg2gS7VE8n4ISkohET1?=
 =?us-ascii?Q?p0sSquvMMKGE5vSgJUU8R3XorFjPKv//Gy+lgC854joWlmwR+8YoygwslY1H?=
 =?us-ascii?Q?NdsPSTbdcUoMdDVlDtcVxygmE7jBbs9gahSfFlC7tbwWhvj1MoOMPdyfCPCw?=
 =?us-ascii?Q?3dFUHB1+1lVkbpPJ4l5hs0kJmBBjG1Zd9MB1oEJqiDq4wUUxXsQqTHzPDUcC?=
 =?us-ascii?Q?ogkqFuGEvv3iAsWZouySEA58ywbfGv9rQeDCWUAAnadpf9mAxGTZVQTJjjGF?=
 =?us-ascii?Q?uvRpgxWwJwEWvj8/AGpBCtGegG+nN6PZDArBXXL2D0n+YU/ZPxzvo4O5eMuy?=
 =?us-ascii?Q?GtLi1LvZvFBwRyBT3YeHIYxN97I2FcSK1w2A6v0Ldpts7j31mt4APHkJgiDr?=
 =?us-ascii?Q?91sxzB4+5H0BKgQSfpCvSRGKSgpLhjHneVvEwDD7MrInaHJ44j+Z/Q00Fn6k?=
 =?us-ascii?Q?Bt22UPIqo3kjg2ItWJMyOZixhLDQ0zhTeQvzQQYTlE9agTsmuws0mqb+/jhV?=
 =?us-ascii?Q?b3NyIH0kGlqr63BIa3FpUaAOGyZiEIMwxyLRsRHm74JCEMX7hr5lkksVbUee?=
 =?us-ascii?Q?R+sjgbX0xj9h+yWxDuiufHgwLanjNPxXmzojv/lalLMY07+1p/bl6NOhvaiN?=
 =?us-ascii?Q?tC/hKza2opGEC1U7ow2ewfBKdqGn1OEFqDcBdLdA7Xp8TKm9/q+EDwKFo9Cz?=
 =?us-ascii?Q?9fglmXImCiy+ZlQFkU3+TdRWBBpym9xzeT9nxgxyd7aTD49CdKVZ5OLb+mgG?=
 =?us-ascii?Q?lDUXpfQnNMFpo+a4EwP3hMErD3y9svFzSQw1sShC45I74YqZRMIu3Zi1pID9?=
 =?us-ascii?Q?i2GTv0E1xoa5TyKWLv+qBEAuWTCjOgc03cP6fmm34HotXxrMjZIHPb6DxIno?=
 =?us-ascii?Q?RzGJeVyAPfOxhb6ZdVD0cLm+8QJwCRJMOjJlwJBRRwfBnA7FVfjYmlu3gwas?=
 =?us-ascii?Q?lJbNcu2oKovps2Uy/6f3/IryFYhQJ4K06iKPPluUtTHb18i0DQPTfiBab8nH?=
 =?us-ascii?Q?L5LM6VVCfZ9/2jNma1n9T681V7JEvyLdKZnd4Rb0D/PRVwrua0EcKlkDKKNh?=
 =?us-ascii?Q?KAElMnZNAmRT5JwQ/6JkjNTXhH4wQpMktlooNdrhBFeNISmUT2bo4YJNjZFK?=
 =?us-ascii?Q?Yxk8ESAkoBKtObGTA+JxlUYXgan3+OEwBSGaHipuan/xnY+yr06kylw0ry8Y?=
 =?us-ascii?Q?1vCUhpJvG2L+Dr261fP2rE70zkjrvQ86RXlm3xusD1izXYZck8gEYIlhviYO?=
 =?us-ascii?Q?Tw3sadoCNrP4a1E6//107JYGPjh/phFDoXlX4XDVV+Gv3xl+ELvQhm6isAlj?=
 =?us-ascii?Q?FcqWkvpTMYxLRi5i+trW8h8kgApEery4GSkI3QCWG9gItihpypLUGfp+JnWm?=
 =?us-ascii?Q?cZ5KyKWFq/AedaUmJBCpASqVPl5sMW1FjuFO2gbc92O6xMtJgJAOx5nS/pP6?=
 =?us-ascii?Q?dqJbU68UZDmRhQHn3WNFF2QZcOiK9CnxYkPVH9F3vL3RGHSczvMyhA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5uDzRs6yjLsdvuDF0NqDUJlzU+9jq31+6rEW1HCb2VnujdNENAsPw5rykdg1?=
 =?us-ascii?Q?nuwrlzn8U3iYXoO1RmyCCmYp4GwD2PY6bf3lbGV16CN7eUzEIOFzQ1wCOevf?=
 =?us-ascii?Q?AI51ZgFG7gVjwDV68QQP0cg3tqdPhgL7OcziT409axanY/EDvbVAp+kdStEA?=
 =?us-ascii?Q?Ky/NYSjm1lmJxB/IUC9VHKmALUcWsfqCJjEj07HHvvYDy7bp3rSDTpdndGbS?=
 =?us-ascii?Q?1Mekskm1jP4seMrCnkG+oxkPMx+fV0qyAu7YIksQc8QSs+XX2FsHif458ImR?=
 =?us-ascii?Q?09qgCNvsTbehWop+jwOAk4L0yG4x6rbMWPPcAzZbF3WHcSa9fa2JqJCaFUn1?=
 =?us-ascii?Q?iu2RlJa4w1NcXWRVh9RThYJtI8++QSzmKPedBgVpWYLu3xpQUAskobqIAdR4?=
 =?us-ascii?Q?LGAMliHmoydXddp7qG1IHiazIC4damZlNdIzZKimo+O3KWxW5xQK/bF1o8Mb?=
 =?us-ascii?Q?8avNKEQpEt0byYJxQ0ywvXext+HwEJRNUUOBNU218r6ph+ymu6H6cllUXusZ?=
 =?us-ascii?Q?dBFbgGTjZcKPOJeUGafZibx/CawEL8FB2NbeilTOc+rdR+qZdPt0y2AAVR82?=
 =?us-ascii?Q?/RlJKhJj1IRT+aYCTG4K4nUUIsrZuQ82uC+04aXhCAU2qUFK/rtf7qzdSBro?=
 =?us-ascii?Q?VpAdh5+Am0Bmd6/oLI7KsTZCk5smZF8Lluhr+FwyLJwIthICliWe8+7jfM77?=
 =?us-ascii?Q?NMcJpcTJ1xMpb6bDpxdo+SgpDb3ElaLittYzEtgoFkq/f4YDA0zf82TeqJuh?=
 =?us-ascii?Q?Dnq3IEKDRy7k5od7PqqXN9DBL9XPihR3mgvNwrkfhDRqdJDoXygwP9R3gdlw?=
 =?us-ascii?Q?k3zDCBfRhG7TWje96X2eNwmLMvROL/eCu7JnwDC4AO74OXsmh0ZQaceR1Q+R?=
 =?us-ascii?Q?6u1Qam/99txpCswGaEVN8juPHaRVmkhQnbHJmv4iPoaz7gtebaQl2KWO6uUY?=
 =?us-ascii?Q?IzAufgQTHxHE35zSvi/d72xAEKxPUFg/uDlxCJ6q6AVsE8SMX7a2GqzbMoUD?=
 =?us-ascii?Q?VuUgZCl/FtT+JgD6XveYxVHqF9muq3rtOLhJEOMZYn0jsIVqDSpKmLpotXuh?=
 =?us-ascii?Q?Dmdthz67bIlkgmoa3j4CWFZAqetonBja6Wi+EcHQ9dlhTCpM/jqrapqvfkJE?=
 =?us-ascii?Q?uPYw9ZKJBb0fAfPjNTV0FR7/w6EmZJNreCRiUfAxxYCnBTumpGPZBow/RlTp?=
 =?us-ascii?Q?4hyX5Ncr2s4wvhEoE9b2SkCxo9IOKFrUi1WW+ZNcDNoICCpNR3Rloxd0jqLN?=
 =?us-ascii?Q?I0qehN7VvGTaOxfcMkLpOD/INENE+cxI4hTYB/vdENsWrik38bISomRzNDG2?=
 =?us-ascii?Q?CxmpVqqFZfxknCq60Z9RUfP/J2WXo3Dv7/fmr9/2z45eW6ZlSBosXjdGxwl5?=
 =?us-ascii?Q?9wG25d16broLAmpGncaCVrmmk7ccdpXxwS6JbaJmi/+g/HCX7vgtn4ajqK2m?=
 =?us-ascii?Q?R6W13Fz1MeGO0/AANRjVSgubexaAcS0pkm7dQsYB6ny8EzeYh3nUJTbQSN4N?=
 =?us-ascii?Q?g7kEwf/PhwxHQssAq8TebmSE+LraGQVALX3KBFcBLMIntXfKPXdCyidf2DMu?=
 =?us-ascii?Q?oYsgB/lHNOncb7uLeLKxcsvKwiCxNh4IELgMNY1hF6COo/yrOkhbp9pd9u0H?=
 =?us-ascii?Q?LSfwx+Jm5t5odcynnuu4jdM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3712a51d-f1ae-4dad-4d23-08dd8e5264a7
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 17:04:28.8755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nd78a4tfL/h+X8c40W4Cih82qNMX/z/CiSMVPFPHG4LR/jcGDTPnMVzX/o5qzOSywF2iCGfFW9SemRRPKh9/OsJv5d4c6FMryI1QB8EfGNtMqRD3vHJQYl1M01raq/oT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12272
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

Hi Biju,
Thanks for your patch.

On Thu, May 08, 2025 at 10:50:35AM +0100, Biju Das wrote:
> From: hienhuynh <hien.huynh.px@renesas.com>
> 
> This patch is based on the commit 73eb5476df72 ("drm: rcar-du: Support
> panels connected directly to the DPAD outputs").
> 
> The RZ DU driver assumes that a bridge is always connected to the DU
> output. This is valid for the HDMI output, but the DPAD output can be
> connected directly to a panel, in which case no bridge is available.
> 
> To support this use case, detect whether the entities connected to the DU
> DPAD output is encoders or panels based on the number of ports of their DT
> node, and retrieve the corresponding type of DRM objects. For panels,
> additionally create panel bridge instances.
> 
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Tested on RZ/G3E with the following pipeline:

DU -> adv7513 -> HDMI panel

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 44 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> index 564ab4cb3d37..5e6dd16705e6 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -22,6 +22,26 @@
>   * Encoder
>   */
>  
> +static unsigned int rzg2l_du_encoder_count_ports(struct device_node *node)
> +{
> +	struct device_node *ports;
> +	struct device_node *port;
> +	unsigned int num_ports = 0;
> +
> +	ports = of_get_child_by_name(node, "ports");
> +	if (!ports)
> +		ports = of_node_get(node);
> +
> +	for_each_child_of_node(ports, port) {
> +		if (of_node_name_eq(port, "port"))
> +			num_ports++;
> +	}
> +
> +	of_node_put(ports);
> +
> +	return num_ports;
> +}
> +
>  static const struct drm_encoder_funcs rzg2l_du_encoder_funcs = {
>  };
>  
> @@ -50,10 +70,26 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>  	struct drm_bridge *bridge;
>  	int ret;
>  
> -	/* Locate the DRM bridge from the DT node. */
> -	bridge = of_drm_find_bridge(enc_node);
> -	if (!bridge)
> -		return -EPROBE_DEFER;
> +	/*
> +	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
> +	 * DT node has a single port, assume that it describes a panel and
> +	 * create a panel bridge.
> +	 */
> +	if (output == RZG2L_DU_OUTPUT_DPAD0 && rzg2l_du_encoder_count_ports(enc_node) == 1) {
> +		struct drm_panel *panel = of_drm_find_panel(enc_node);
> +
> +		if (IS_ERR(panel))
> +			return PTR_ERR(panel);
> +
> +		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
> +							 DRM_MODE_CONNECTOR_DPI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	} else {
> +		bridge = of_drm_find_bridge(enc_node);
> +		if (!bridge)
> +			return -EPROBE_DEFER;
> +	}
>  
>  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
>  		enc_node, rzg2l_du_output_name(output));
> -- 
> 2.43.0
> 
