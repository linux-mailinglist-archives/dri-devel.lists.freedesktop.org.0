Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B395A79F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 00:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A9B10E6FE;
	Wed, 21 Aug 2024 22:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cLn49Py1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E547610E6FE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 22:08:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOCdj3l48ksWqgWCWDLv4ZSsZBF9SeMaJlVXKWRs6XCbnrkpYWzaKnFQ6svFt9EoCONE2xaSSbi/bvzEOACbDqiOfnOp5Opt9jbOJZEGwxwbOjoRrm8fKPJnruHLclYUJLLBEH4c7T+zpsawQydPxjNVmrlap5RosPWRQhJ6lBcejbnuBeiJBrhPWezFYktOFEp7Uvq2yjXGI6+UD0d1zQ6o8JoWg3ezCzDwjq5X4urkri80YRLZLEVmmMI1gq+lAX/2BkY6bjvFzO0MXpsyzg8J3xSN88EHlbc951OnA1FMBhlRBm8lbGnnILLS7X+CfUyhDpVSfhFCDeYHPMA7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKGKDZJgp7qInlP1pRiUdyCCG/lu/sO8uyFc+Rcbmm4=;
 b=qZXN8Uo6i/2ZhAqNOBhjW2wfS7WbWKeo5rk0Norbgq5VEyz9nqKJi/PuJU+wltQr9++cFpIjwJrix/xdEbCVAm/z8rd4zZyGDTqFDuTIURARnpYNouciVOmdmQrLBsJ0Jl10uURNPz26ET49fpT3clH1AthUBERlvLtM6hO3V0eZBp3DhcxB+SCg420EmSxxK98rzQAw5g21xdvxjQYHG4D2Jp+uQSxGUX7ZQ5F3fRD6G/V1RupjAt6FWjzQdYyPqSt09emUo5DeE3M0s1wJmCoFcp0nacTrBVLkY4CdTPEzj5JetvprHaE8igXu7KvAtHweN5pe7jWa04B5p2B7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKGKDZJgp7qInlP1pRiUdyCCG/lu/sO8uyFc+Rcbmm4=;
 b=cLn49Py1wY9ksCS2m++/mV4QcrjQ+7tAPh/4fjTAojY1DKeIzaAbk94JzqeoX3be59k83CXzTIxUIlefKeA6QucpZUayHyRnQS3RSd9glRwhpCHqDpo5Zwp/srKrUViLB0PSD3uk5GtzLUEYidPyjUWq1aAj2nkbnrw0uBitjJak8xVgjMDG3vfMNQPWjLOg+yCZ2MmfMVxbLyTlbFdpGY/ZbUXrgSpnE98+WqYGUDGIkWjgx9xO/K0frnVSujiLFhp8toVw/bO+o1LNZqesX1gFCaAviQXFV67YErz+SGTtR99h3n5ipJo9gquKi0BKT2wVbZq5v5tJXlFQ6Vd87w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10820.eurprd04.prod.outlook.com (2603:10a6:102:487::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 22:08:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 22:08:36 +0000
Date: Wed, 21 Aug 2024 18:08:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add support for JDI
 TX26D202VM0BWA panel
Message-ID: <ZsZlW0xUCUDOkDAx@lizhi-Precision-Tower-5810>
References: <20240821-jdi-v1-0-6e3ce584072a@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821-jdi-v1-0-6e3ce584072a@nxp.com>
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10820:EE_
X-MS-Office365-Filtering-Correlation-Id: 5539cf20-8aa4-4423-b4be-08dcc22dce27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o0bvK4BgBYOxITrWIiuoGPxOY0TT1EOautvxr+43oqVa7VEL/7RainwDf/2n?=
 =?us-ascii?Q?SXHk6qKI9NBWkPDnZHlYf5TQHPUJlgduFYAJ1UC9rdU3NHfHydc69vOZjM1P?=
 =?us-ascii?Q?qcR1WN/2JO/XKTbtn4ArKRJ88rQTD7FZ7nPiLcl2/KPH3DfF1wuLvrc7y/pF?=
 =?us-ascii?Q?YNgLPQVHGKaV01QTSolRu04xD5nxw9aopu8SVp25EggZRNI03PCGIJC+h5rs?=
 =?us-ascii?Q?is1DKIrt5FZTnmUmS4j/hokBhFN02udL9XhRF8M/j7AgLkg+A2u94GTy6iVV?=
 =?us-ascii?Q?u3vpm+dPNVafOOsI5g5gckRHnE9r+gUJoS88IXn7mu+S8mGiVZnCHUq39JcV?=
 =?us-ascii?Q?OtVZLB2Z3Ts4bu64Tq4VwnplrHVXqJvTsD1pA7ev842FXzsDl8UOSQxIHxSa?=
 =?us-ascii?Q?prHY54kNLxaLyzL7SMHJCVzGPFn1bHwzvgIpUQsVWtT1uxOPHydbEsTmKWik?=
 =?us-ascii?Q?zZmkynh7Tc2qyc/hSKv1DvE/1WVBOVGs+MIWxeVDMwqISF9HhvEMzOpv3I9D?=
 =?us-ascii?Q?Ynbof9JYqxog9X50VOSaPa8zXvMiZGuruD8KoT0y9lYkIo5zHFNGxKZBJGN9?=
 =?us-ascii?Q?LrUmj4bLhHuR8KtO4AwbODxScNweF9uf5lnWzNlda1r7layVucnB2A11qbKG?=
 =?us-ascii?Q?h4vMlJCkE9fFxsXqDrJBQm2B1hB/erUT7tmIP/8oE5+00HOh31gb0T5LcPah?=
 =?us-ascii?Q?ohzfF9SY8C8JbPNpLKjc+juFXV+TDT9UPjo/xRNX0yU72UUrRlPEmiQL2j+c?=
 =?us-ascii?Q?3uyyPHjPr2KEkx/nRqgZGcf/UEcmHBuGoDJD20tn/exwm3TPk9cn8PDtijBH?=
 =?us-ascii?Q?Lbp8OJItZrsMZzE+GePy1DOxDlTpw3XWG6lvHMC6wr1b7+p71R+M7Z5OAzV4?=
 =?us-ascii?Q?55+ohXi08F3m67i71L4eyy5W6rRUeA6F2yK6jAX6m2RcC7GLKQ0DYedOfovo?=
 =?us-ascii?Q?rGmJ9bhd7ECnnKHflRwevBvfwIFtoQP1Z3v9+LRvk+fovhar/axPZ/h+KygP?=
 =?us-ascii?Q?y+gipZ7s2iXSQywHJWGUChZ4v4GT1j5DBmWeI7q/e4mWF9PIhtLbdvjDIhaI?=
 =?us-ascii?Q?gq6jLzG5vHJZgZVabASYNujPuhwwd2Soh/vu2istkZdr3zwljjbPfj5QoG1X?=
 =?us-ascii?Q?YPSBQ4SkX6zI5v5CO4O8q1989IhZG/A7ueKP8XAgRaZg2fiwaI5QC3SP7XCd?=
 =?us-ascii?Q?BCPpm49OVeIOxrGxCYO5TB3SOG3Goi+3FqnHtAWkHaSKKIJ9oNyYOHFLQ84X?=
 =?us-ascii?Q?OKv1X7KXusEJ8ywWvA5nndYlbtfCEEA6jodCM7iHpTExveUkNZh02qlIezLs?=
 =?us-ascii?Q?VuDgCuNnoBAdR0gDVrRGSw8yxLud0+nnPRN5dWBr3E7iymnOGClZTPYTkKwZ?=
 =?us-ascii?Q?7CjhbwbgRWiR7vGxWR+0ua9tfzlXj3WETfJT0NUBD8pbrTeSFwo08nY6dvlX?=
 =?us-ascii?Q?I622ZOoMPq0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QNwMQDTPP7fu/Ctqc5bB0jZ9eVS3D21QDsgp9zYEGiulsJpmrbfXrhm0XAty?=
 =?us-ascii?Q?EJd/Xk7vRKSHRveI303gR2pJEpRvOceZp+VpmWsu6/6H1AOBUJrszn7g0H2h?=
 =?us-ascii?Q?lEts0TR7NFejRtliCyNYWPBwulrzZ5Eas7BGeTgzsxJ/Xr9z3meQx075Vl82?=
 =?us-ascii?Q?p5mXeAW6ZEtLa0Uwd2hQ65b6JOfKb82hRizUwOTMUzb9A3paoKdH49r/G0jf?=
 =?us-ascii?Q?yCeRxMV1x136Es2+9HfehdJME7ZCMUsrVxRWBET7cwChMWKxldWruEvWuKu2?=
 =?us-ascii?Q?NgP1uFkgxuIoO4ebuhO9ooq6rCLoMdloh3UTN9+06jCz0y1iyuiWRbY14r19?=
 =?us-ascii?Q?8C3uXWnkHcAiSNIPQvaXZ9kCAtgIAPc9feSubeYboAbIN2+Pou7vMo1bkSKT?=
 =?us-ascii?Q?BwEHq9tuf+sW/P4hU6nxzoAjSjHHHlmyDEgKE2EelDlaoj5xk8lKBJNBlP4w?=
 =?us-ascii?Q?mTrN5TQXGpbrTOkz43TrESlaIGwytFikOUj7R26aJKUW/11OtGAha4voe92x?=
 =?us-ascii?Q?rYaR81ESDAWpOSAtvAC4Wkpc8VeEKgdHEk+9gs7kp8PkSr6H1feiNfwxBHOe?=
 =?us-ascii?Q?83gmXV84MsU3buI2KuBBXPilUnap64i5aub+P0D9OosQnXhp6IJHUFyDybvH?=
 =?us-ascii?Q?gdYgUGPT55WUdIAudwneF87FElzjRCrvRh/DLXG5I+8hICrOfve6xUhDPpPd?=
 =?us-ascii?Q?1y3xOXatZU1X3IGb45NQS1c/bRTv8hdsndporADY58fIzbF6lg1tUDKwZ+iv?=
 =?us-ascii?Q?e4NOLLTIDpOKmdfi/5IlPoiQANHTMvBn4a3eQti9VDazOn4gAbICUyE1yhEB?=
 =?us-ascii?Q?WVPKUZiL50ihwTt1jQt50JCCXxRIhTF7Zn/rmMtGSbG8GA7bkEcF9sveTDS3?=
 =?us-ascii?Q?tY4N4UuwHBrp9I/tWzPrNouQfMATIgerXk6cfZBU9FGCadunTGKzUZGkMAAT?=
 =?us-ascii?Q?SmX8LjUxq36TdcyzqOIxvC+E5hO+vcsgG7aSC/lSnTqX1EQGav6jM+mArMRS?=
 =?us-ascii?Q?sCfWd9aseUDuoZZS3gfTiwLNM5UMsILYroYBxhDkK3xcTx2pwn9pEpwxOk3w?=
 =?us-ascii?Q?6acVYEIh5Deex7TKWSPVhxLqguon07sFAe7kvHcFR66/Adt0ZN8OZHTiuZg7?=
 =?us-ascii?Q?XlB5+ZYZN6bRxujCvS+39VslLBLyIZJVsDU8qaIxOBJK7UTmECTeJ10avX5O?=
 =?us-ascii?Q?6LI6aC1u0asUVO7aYOHegLovN1pkH4O/W6uzDFVIKs2qDhipTWDQ4dVuBrvP?=
 =?us-ascii?Q?iZCYTwv4wprsVqk88WMSF+FkBqK/j014nLLb3/0BSMJOFLR29wR65JwANTZt?=
 =?us-ascii?Q?L3bvIYY5Vg4xLXsV1dPtzNxVWd3TMleia7JdTuABsYOMp5I+K1zm/LQ9Xa6X?=
 =?us-ascii?Q?LOd6ForCTvAUv3nu0nhBtzQKrG7zK86fj1ZPSzu+pxsDI40XY9U1X15l1CtT?=
 =?us-ascii?Q?Xc6h4UaG2/HZCpeJCF2DZwVypZzhJsRZfC2Bh1uxRvGedIZof668g2rqP4qE?=
 =?us-ascii?Q?s8+lCd/eDipFCgXH/SR3RQaNlCRxZrg2u/EOgev2f7/uuxjZjbuHaqZ9BXF1?=
 =?us-ascii?Q?EphvKfz7RisFkOqvNvjIT7XzwO0rjELe0zxIauIG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5539cf20-8aa4-4423-b4be-08dcc22dce27
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 22:08:36.8681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adgVj4pZAikNipVyW6HGDNH67ii/nMwNJB5xGEVniWWlQ3GmzvnMAmtEEvbxzXHnPu2siAKBd/a4qGzfToWHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10820
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

On Wed, Aug 21, 2024 at 05:52:10PM -0400, Frank Li wrote:
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Jessica Zhang <quic_jesszhan@quicinc.com>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Liu Ying <victor.liu@nxp.com>
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: imx@lists.linux.dev
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Sorry, I just find it is same as koe,tx26d202vm0bwa after post.
Please forget these!

Frank Li

> ---
> Frank Li (1):
>       dt-bindings: display: panel-simple-lvds-dual-ports: add jdi,tx26d202vm0bwa
>
> Liu Ying (1):
>       drm/panel: simple: Add support for JDI TX26D202VM0BWA panel
>
>  .../panel/panel-simple-lvds-dual-ports.yaml        |  2 ++
>  drivers/gpu/drm/panel/panel-simple.c               | 38 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> ---
> base-commit: eb8c5ca373cbb018a84eb4db25c863302c9b6314
> change-id: 20240821-jdi-a5e016700cfe
>
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
>
