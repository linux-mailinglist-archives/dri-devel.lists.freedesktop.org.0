Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F260B2D2A9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 05:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78F310E24C;
	Wed, 20 Aug 2025 03:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Lz4h+Y/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F409910E24C;
 Wed, 20 Aug 2025 03:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYBK8EfLdpVqrj6s09whtI8IxSRApkL26mvrV2l4qjlvpPfY1MYAryaV6PcX5CXXQ/axPJExCw+1jp6OKPrmnM9SwPTkjA5OJm/KW8pOkPlosEYVif36wtp7CjZn6RpiT3JaDCKOSR/BV1h5tZ+LqYEt3ffyxm0KR5GShNEwFlfi7hsfWRCtpQMSBhfQ7m9v484R5B8MCHsHo9/LrllLwkbiF70LNvAlJqoinrHPndlrChzdw7/8SC0XOxp7iKhqPZfKPV2ruFTi5Rfhzb/WGwGserU7eSWc13PImLo0unaHFgrHMiTUai0704G+0OAehBosSUVE66S7naqNrUG0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdKGuLf6z0eR4PGH7oVtXRDlh2c83S3L5o9qgY2zDHw=;
 b=mpT+UYP7v8AWo1c7aa/SFmUNQFYFPuvRLnGex9zWDdErrOIBKMNNjzwsCArJxy2q+ba5L04IW5hM4m3dbsynZ9AXiGcifMzhT4AfpR3V3Tf53ySpSFfWTe6gv2UPMkz8IvmuU035BsSLn4/EKd0GDzHbMlM/l7u8/cuB3yns/27eVQgFZbZSj2JS603nCRyJfRhjL1VxvCNpSr7/rcnH5BelGQn0tU6HGhM8dk39QMS/VtCIeaVveDqlJnfgmenAcJZ/5+B2QqTCfwCKl7tJzUPCvNrc7bYbTKbF2k1xm4CHAfbCakmy6V3HL2atgrtlk6lqrPBD0eJUIFRlKZlGRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdKGuLf6z0eR4PGH7oVtXRDlh2c83S3L5o9qgY2zDHw=;
 b=Lz4h+Y/JK4k3cHRWgorg7tNHwZiL436z5ajxx2C9DlwevyGAYGktf4cWHwQU20E/tRc7DlSK56uoDJ2okAsLbaZXgP3H0fTbHBCIWdwQA8fCCP6bF54GqMXxB4QBexvIMvicLLUYOh/Cy0wYcGGkUc6/WdAZ/VLXzjihxauU0YbRUDOIBlF2RFIxUMvtujPBC/Fm1uwYt3Df31cmk0H/Rbe07ltU45za1LVFngVwt0N47EtVKdVcb4wEuHfFEZAiBgq6WIV01kQkF78g86rZATHZ6XrUJERrHzSDFk7JRgYU2PEIyEGU4TnqscFCtTaBBSu26D0B9H2cuW36lG6kXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10984.eurprd04.prod.outlook.com (2603:10a6:10:586::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Wed, 20 Aug
 2025 03:39:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 03:39:46 +0000
Message-ID: <87eb59e3-6605-45ca-948f-8db37f680567@nxp.com>
Date: Wed, 20 Aug 2025 11:41:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] drm/bridge: adv7511: declare supported infoframes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-2-7595dda24fbd@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250819-drm-limit-infoframes-v2-2-7595dda24fbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10984:EE_
X-MS-Office365-Filtering-Correlation-Id: 4efc15fc-6d89-490c-2fda-08dddf9b34e8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUxHRWltVE8zTDlRb01zZGFNKzVDZzFDb2F6ajhnd21ZSUNWcVBpYlo4T2ZI?=
 =?utf-8?B?Sm9ua1VNT2F5WldWZ0pDSmYwUDl1T0RrSXVhLzFaQnVpY2NIMkgwc0pGLzdv?=
 =?utf-8?B?Zno0dnF0Yi9jSWpXemhmWnRsSFFHS084dVR0UE1mbUZsSzRiOXI5MlFRSGNF?=
 =?utf-8?B?akJ4c05ic2U2eG8vVXNCTUsyZk51QjVDZE1DQm96R3ptcTBvRUJpeXlTNXgx?=
 =?utf-8?B?SWE4elhQQlNESFR0RzJiSnYrSEdCZkxPQVVHdW42VUpzUTNaOEZ1QXRFL1p5?=
 =?utf-8?B?YTh0M1NheWpnT2VjNDZzcHErN2xSeGlCcDlPajFqL0dFME4zQit4ODh3UUtP?=
 =?utf-8?B?cHMzNDhKUU5udVR0eUJzQzdJSTEzaHFIRlgyN2tBOThqMGdheEFXTjBpU1Zl?=
 =?utf-8?B?aWs2b3FFM3F4cVEzOHVEbjgxNzZxajVaaDlSeGFpRzJUem9yMHJBNlhCb3VX?=
 =?utf-8?B?cXlBTXFYSUVJM3Bva29KU0ptUmpoZjNvVzV0a1ZsSWFPNUVrNThqZ0x4SHBP?=
 =?utf-8?B?QjNqWjdpM09hUzNyMkFEZ0VaNDY4WEJBL1dSWHloNTZFV2xER1gzUkxWMVVD?=
 =?utf-8?B?ZEo0VDlUejZSRTdpWE9MTVJOa05FNVJtQ0NyTTFyWnJOVEpsdnFXdS9heDIz?=
 =?utf-8?B?VFRzNlNUYWRoN1V1ZHNlNjcvWjZNbmtwTUhaejFIVmlReWRHY3FpL1J4N0ta?=
 =?utf-8?B?UkdHL1ZvWUNzZUMvdS83dDYvZmhseE42SEh2Q0hMcm9xUjdUMVMva1hCSXFJ?=
 =?utf-8?B?TFMxSlBGZ1RDMGNsTEVYNEtNWkZsVTJlWjBXSlQ2eFNoazYwY1ptclNLNGIx?=
 =?utf-8?B?cHpUTWlZa3lxYU92b0VvZnRlUDcvTVA0Z1R1b2J3YnM1c2lvTmJ3NWVoazVD?=
 =?utf-8?B?bmNkWHBKNTdQN01kNDU4VVczRW5TL2NTaUJMM1VLWFltT0wyTm00Z1IxR1M3?=
 =?utf-8?B?S2Y1cFRUOEM5MzR5REFZRW1ZUDZjVStkZWZaU1cxZkRqcDhmQnlSTHg5Y3kv?=
 =?utf-8?B?MzlqdFpqZTZvaEl2a1dSNHZlRlRwZzR4eWR4dUwvQmxLWnFYSS9INm5CZmVS?=
 =?utf-8?B?cFlWTldqL0J5L25wTjQzLzlpQTRUQnVpYzRpOGZNdVU5aXBpeHN2SWV1WHM0?=
 =?utf-8?B?aVlRQVgrTE94Wml3WDdBelFqWFdaQVdEb1M4ZjUzaFFtOTlORzdTMjRDNmlZ?=
 =?utf-8?B?MnlMVyszMmJzR28wV1p1NjVIZTViV1ZRNWdjcGlSc1RYMFd6ejNrTTNEQjdU?=
 =?utf-8?B?UXpHd3FKZFJwTWZhNjZQQ3Y0MlYxR3g0RzhyNEdqZHRSS0YxL0NFbk9YWUpB?=
 =?utf-8?B?a1plY2xVd2JhZ0Y0bzE3em05U1RSUTQxSXcyQzJiU29VcXNjZHJHQW9nVXJo?=
 =?utf-8?B?SHp5Y0Z6MWovWWpMQ05ZTjB0eXUrQ2ZQSWtoVUxlTHdCUUFXMmdjM0dhaEFP?=
 =?utf-8?B?L0cwWDBXSms0aDJsNGFHRENUWmR1aGhkM09xZ2o3ZG5wQnBQZVI2NVdGMFRT?=
 =?utf-8?B?MlNqSTJrZlBEV1RyTmowalkva3JRUFZvUXBGUFJzTmpicE5IQ0JPS3NSc1Rv?=
 =?utf-8?B?S2k0QytLeGJ4ZkQwa1B4U29rcjF5a0w4QjQwYUhzOEdSSS9VMTcvQTZOMVl3?=
 =?utf-8?B?TDJNaWJQREw2WE0vV0p6M1VycUNOZEJJMjZSdmhnZnI4Z0ZFUGRsU3cwQ21D?=
 =?utf-8?B?MlNNdXVnaU1naVo2VGpBc3JZdmdqcjVEeWVYd3BaMmQ3cG5LdmRqUnhBU280?=
 =?utf-8?B?RmRoQWtLNWZuZTduTnVmNjBIMzdtNUZpYVQxVXY5NGh3b3VKRGRGZHFPN2Y4?=
 =?utf-8?B?YlB6Yko4SVVycWlwdHhZUC8zMnozYytQMCtKTjZ4WThUTzRMR1VWc1gvTXZN?=
 =?utf-8?B?dmwwN0hOZEZnQjlxMDc4RUhsY0VYZGowOFI3NmRwRVJmTW5MUkxURVE0dEZx?=
 =?utf-8?B?R0twN2c1MktjZjVnZXpaV0F1MmhxM0tFWGlBVktrUzV4djBtOWJWR3UweUFY?=
 =?utf-8?B?RG1BOFF2SUdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVAwY2w0OWcwZEIzWVhZTlFRQ25RbHhHbU9kNWJLQjhpcUJVWWY2c2Nib3NG?=
 =?utf-8?B?T3JtcTBBVUkweXZqOHRacmxSZjMrSHc2Wjh2V2NZZjFGQk9oRlpyU1NLSDB5?=
 =?utf-8?B?RjhLNUZieEN3YUlHdnFwNzlWejJUdnFrV3hTR2ZIK1Q1RnJ6VS81VjhYODdx?=
 =?utf-8?B?OW5WbUI1SnFHdG9acWtnMU0yMjF6bmZ2dmFZWjU4NFlrcDlPUUdVaHp0blMv?=
 =?utf-8?B?UFhSZ0l4N1A5RElibUQ3ajJ1a3prdWo1R3dHQ2FkenRnN0xQeEdjV0NrVmMx?=
 =?utf-8?B?dm9SdjdRd3FEeTNwZjFrbURWWnAzb1BhYWZUZlNrK2c3aEFNaHFEREpsSGp5?=
 =?utf-8?B?NDVFcWxacXdiNVV2SVloY0lOSXhVelQvNE53bk83WitLdUlnQksza01TV0RE?=
 =?utf-8?B?UXoxbDNxZlNta1kzYkZ2czA2RjBQU013ejVSaWZFVjMwY0lJSDl6bzRGazFN?=
 =?utf-8?B?alNlWXN3V2UwVG5ZdGkxYmVJaVkyRU1aWENLVDZVTjlwb2JKZU5wV0lBZllJ?=
 =?utf-8?B?a01mc3diSFhLR3Vna3RuQkpLUnlhT1FIM3hRandrTEp3R3d3OFhBaFRBT204?=
 =?utf-8?B?eWl2Y2pGcndsUXdyeHo0QWRLbTN4U09XUkNqcy9yVUdzb3F0elB6ckxpaFdu?=
 =?utf-8?B?YWUyUi9pdEx0TW10bjEzRlBJRWFCU1RtenRObzJ0aCt6UWlSNkdlRHpHN3VU?=
 =?utf-8?B?RWk0M1NBeXBNd20vUXNwRGNaRDM2K1FpTm1pNjJMY0ZzcmJ6bDFiNVVkM2ZH?=
 =?utf-8?B?ekYzNTdERGdyZFY1anhJZklkeFRJSitKZ2hvQlIrQmNmbnJleEg2UmNyQXN1?=
 =?utf-8?B?U1VxdzlxN2ZHQURhWW1nQlArcGRjVnNCc1FNcjdZNU02ajlSQ2ViUzVlbTdo?=
 =?utf-8?B?K0txbzdubk5RbHkxREErcXRQM2lJRkp4N1I3bUNnVjJHRWJSRzZvNUNzZ2hJ?=
 =?utf-8?B?Q1grTHBGMkI4eWJhckRhL1Q0WjQ0aDZHUWZyNTducVhvWGtnRVhyRUhNVGxa?=
 =?utf-8?B?QzB1TjE0aWFGby83VzNjWHF6Z3d2eUFQc0MyYU0ydjBLWWg3cXpZTUJjQ2dN?=
 =?utf-8?B?anBudFYzbDhLa1FFVnk5ZFNwSUdpbnkxQjFSb1Jmb2NDV3RPVUx6RndoNU95?=
 =?utf-8?B?dUZyc3dnbVFzcG1JVXZ1RWNBeks5OWdXL29NWTZxVzFQeVhUcEN0WE01aWV3?=
 =?utf-8?B?Wk9UMXlwTVdIM2RpSW1obnFVM3hCakZScG05L3liQjU2bHVRN0xEb1FWY1ZE?=
 =?utf-8?B?ZFo2M2tKZ1pDUzFYUmhUU2dqcGswWjVwRzNTVzF3bmNSSEd4WnQ0RWlabS9U?=
 =?utf-8?B?Z0xHeUF3MHFzY2xuSjVhZEo4Q0NWSkc2T2JVbGg0SmxpN0I0Zng4SFFaejJx?=
 =?utf-8?B?MnRHVUNLSXBxT2g2RlcvUEVyMTJKeENRYjBBeEl1K2tQSDRpS1FRaHlCWUFZ?=
 =?utf-8?B?QkJDUkhZZ0hMZXdreTZKT3gxVUEwa2lYYWxmSmtGNVZtc0cxQ3h4R05ZY2F1?=
 =?utf-8?B?R2xTUGZIYzVWR3dXN05pdVhPd21Kd1Y1S1BTeDQxWVFHN2txQS84VGpTb0F6?=
 =?utf-8?B?QkVUNHVlMDMwWFg0RkpMbHhoWCtvK1RrVkRFR2xiWGNIUW5VZkxJa3EzTnRt?=
 =?utf-8?B?MFNBOXlYT2wxOXRKMWVMYVlnVzJXb1lqQzRDcXc4aGs3QWJ5eHVKbEQ2YUgr?=
 =?utf-8?B?c3hLRm1oNHpSdWlsSjI4TG8rZjBlSXJDZWQrZDBuQTlIcU5rTzhQeEdDdm45?=
 =?utf-8?B?YnR1YmpsZkNtVWVqM1VMWi80UTVkM3RaZHhvaVZoeStZdlBlTVF4SmNFZ0Nk?=
 =?utf-8?B?TGVqTDRrc0hlYXF2OWhEMU1OWEduQjhWMkttMFVUNENYWWo4Zndra2hGakk3?=
 =?utf-8?B?THdxOStzeFdFYTA3ZmREdyt5N01kYjg4UzVrWC9DOStiVlNOVXUzWDVBU1dL?=
 =?utf-8?B?RWNvN3hMSEdwUXFHV242VXJvZHpOeEpENUdmTnRkSE0wWjJzT28ycTNuTjBm?=
 =?utf-8?B?SGRhdnpVTnJPU2VHd2RVMDQ0S0FUOXV1TzRaQnpJV2dIZjFFdDVyM3RHTW1q?=
 =?utf-8?B?QVRJdmp2N1VRSE5MTVltOHl3SGlMYjVlbnljMTZ2cmJ3MDZueTFOdklsRlJ6?=
 =?utf-8?Q?IT+bZN5AYSP1VifV/1BXwZLUu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efc15fc-6d89-490c-2fda-08dddf9b34e8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 03:39:45.9699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xo+di9kQ5qFz5j3haCf4CNVFNtpcKOhYi/l1os1xJPs+RgGCj5S3+PMZ+uBe5avo45fkU6OSMD2n6HpwB8qG5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10984
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

On 08/19/2025, Dmitry Baryshkov wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface. Audio infoframe is handled separately.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
