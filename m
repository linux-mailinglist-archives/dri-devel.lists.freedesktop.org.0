Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62DB0D3E1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51010E616;
	Tue, 22 Jul 2025 07:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="S9g6wo0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010048.outbound.protection.outlook.com [52.101.84.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4975310E616
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:50:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfG/bILDksGTYDj+MbyUUuhLnPxNJ2bn8daZPQHb/QNiSaHnamAj2AUxLcMvOaWzwz071hIFjiruqsU61hhGcCA54dLSy50boQH3SDMvjBvcNTRlmxFuQ9G9ewIUKmusNSgjNZv30XZprtQTZEBImz/qh/uhf7wNzYryaOLBmGjgNeqRd0ipinNfio1xWXeYJ7oIg4s0cdQRs8c8mDH7eZMY8IMFIf/byQrgYc3E2GANMezuhOugaldwm+TpqVdCotlGZxn9sMLQ9UUPJoxU2kmBT0TX4p3dyN3Ocsa7XYxfDooD5hmWCdIm4Dqe8B85biN8qB62Bbh2HqRExE9mYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FcmCDqCnIwagCR0ucU52IX0OTjEoUu17DlThrVw2vs=;
 b=vRkcwNdpkH+iJcyV1pRbVieOY8i+p/G50jomjXb5X3Nl6jae+T677RkdUv4Xw1GH3oJLYZiQbl2lqoajz3e/7oh0WIaiAtFpdxwtfgHDqD1wjQ2ZSxxNwlwRIV9RWm7SGeVhcRrvkyAG9/U85YIsmdKXn6pePoBreAjIDYIOMAth2RPDKXUX8E0VU3EKpOlVzj1yG3dJB4k6n9Dni6VjCnx7k//NytbIAhI1QwzKzE3yA+F2duxQdk6UxXdKZJqnhTBOU5BiuUtg/lCfzzIfjSGU2jcjuZehQFfF6ULhq0FIn5U69XiNZZ+34cVElxrmEnCdDzzPb/lo9xB4mAma5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FcmCDqCnIwagCR0ucU52IX0OTjEoUu17DlThrVw2vs=;
 b=S9g6wo0dyUkiqufVJlNVKazqx7ODTFPewZb3Lr6rO/dvff3D3vko+fEst981HyjHxrRknf/jw+s51NpFcthiQsr+F7N76w0nHP1cO0ue+2GD7ySmpX3lx+cV1iqXxJ7VPKS8ih/Z+yz570G9tceq0W4VE1DaTMBHkQqGRiT1Tjt5e0nz3Rkhu9qMOF3XACd/J4J5XCBiPv382fLZnQjUnaoXmGUTei6AxMP/Eg2ATPnBnP1ve+ucfYrhRfz9AXMcNbF5PlaOkqyiAaLtCup4Qd7qlxlp6fC0qnsuScAMO25dKfLmkD9m/1jkiKczd2kOhpaPIwLI/UqGDz0gxMFvYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7456.eurprd04.prod.outlook.com (2603:10a6:800:1ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 07:50:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 07:50:40 +0000
Message-ID: <85f1b9f3-0134-4385-9ac6-f3c6c2eb546f@nxp.com>
Date: Tue, 22 Jul 2025 15:52:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-3-shengjiu.wang@nxp.com>
 <4668607.LvFx2qVVIh@steina-w>
 <CAA+D8ANQdOuEiHrOWAbqVN2oFAAop2agBzKB2_YsoQ3_SFYYNw@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA+D8ANQdOuEiHrOWAbqVN2oFAAop2agBzKB2_YsoQ3_SFYYNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff03f12-8c19-4458-b083-08ddc8f4742c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|19092799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnQzOU43NUQ1RzhuemdaeVVQVmFHWnBvcDNNd0duU3MvaGNvdytLL3NMNGta?=
 =?utf-8?B?Y2NRZjJ3Y1N2Q1JRbGU1M2I2cm94WGpyUjZhNVVqc1hyWmVIV3pKSUF3SkU3?=
 =?utf-8?B?OEhvMlI0RzVYNU5JY0kyMWpwVGF2QUF0NjN2d08vUzlTY0FGYmQ3S3hmMGpZ?=
 =?utf-8?B?andlUE43OCtZbW8zNmtTaHFEdWlGRm84all0dmVXaEVqYkNrRDJwRm9vMjRC?=
 =?utf-8?B?RFg4cU9vZy9HQ0YxZGlsMmJ3OFpSR0xyREpMbGRvQnhyU2ZjelViTFFlaGU1?=
 =?utf-8?B?SXpwWExFQXBJcFE5K0h2R3Exc3dzay95UldZdmF3bWQ2cEVOd1hSalhXbDMw?=
 =?utf-8?B?dCtjSjdkVWRyMVU3RFp5ZDJnU0RENit6N1RBam9Tbk5jVzBERkRRd2dhZWtV?=
 =?utf-8?B?Snk4UWZSdDZsRDVuZVJZeWh0MFE3UWtQZmhxRG9uMXhOVGc1VDV2b0xrNGZM?=
 =?utf-8?B?OHBVRE5rM29wS1VOQmhCNGdzay92OTI0ZUk0UGVpakhlRjYwK04xak1xdjhW?=
 =?utf-8?B?NVRLZGtGQ0grMThyQW1aY1dwYUhzY3dMRXE4UlJnYzZPdjlTSXM2T2FWcHc2?=
 =?utf-8?B?RnltZHR4SVE5RVNwSG5FZ3U0M3pUazBHbUZxZ2ZDY3k3MjVlc3FmWlJITHRP?=
 =?utf-8?B?Z2x3dmR6SGxPWlp1NWVLZ0FEYnJTQm1FL3RYWlp2TWoyOW1ZT0trRDJDZmpv?=
 =?utf-8?B?V3liWHF5aWJjaXlXTDlxblJJNmhPUVdTMHBTVm01N2Noa1ZCK3dBK3RnMmxv?=
 =?utf-8?B?dmo2N0pseDdBTWt1ZzJuSk43c1d4M0V0VlI1SHByNXVoK0lEbHVXWjNKTHB3?=
 =?utf-8?B?ZkJ2TDR0RHNhU00wN3Vkby80T0Fqc1F5MXVrZ0lzeFRTZnRHU0l6UURDazVO?=
 =?utf-8?B?dWdwd0dUQXhWWS9Fb20wSGx3b2d5bEtBZ2RZbXhDck5wTmdoOEtvd2dnMC8v?=
 =?utf-8?B?SGI1d3pBL3ZNRE1pMzhnTVl0QUo2OWkzbnVMSlM0YlJYQ2xOejRvUjVuL21h?=
 =?utf-8?B?OVJTaVROVVhCd0xBKzVRbHNQU1dNM0krOS9yZndDckNCL2Y1WDVIWUpGcjJq?=
 =?utf-8?B?Njd1TXhxNTdFTkpXR3VJT295blJlaHNjbDdMS2dBTnVIdHBPMnJpVVZhUEx6?=
 =?utf-8?B?WDhwbCt3TEd4VHFEOU9Da2p3V01kVVdOWnZuemZ0cEozR3kyTGIrUERJcFkx?=
 =?utf-8?B?ZDVtZSsvWklmL1FwVEZHRHJLcjNZY2NRSFZFa2hyRGRURm9BUUEwOS9HcTdr?=
 =?utf-8?B?cU9VK3RlZFZqbFVGZmVHbmR6TWhwZHRKVzJ6QzhublRCcHlXbEdNTTZCNVVE?=
 =?utf-8?B?aFZYcTNiWjVhRG1NelVMclBDQXlBalllZ2pDaElNQ0RmVHQwSEVGNnJvK0pp?=
 =?utf-8?B?VHJwOURpWDc3UmVndGxvNmIrbkF1K1ZxNFhNVUJsSUtGOWNzcjhLUkROOEx5?=
 =?utf-8?B?Ymc4TFlCUnVLNnJWSXc5Nm40SU90ZERHVXQxVnhlOHp0cWVQVEdaTkdLYVhh?=
 =?utf-8?B?RDVmYWJ1dVc2L3JCeXBMTktKcC9QSjZHS2JXMVZkMmJXV0l5eXhyYksyU3VG?=
 =?utf-8?B?RDlROGZjdzFsRnAxd05zMlppV3l1UzVwM1VOdFNKblEyTnJua1FVSjdUeGtB?=
 =?utf-8?B?Y0hwdktQZVJXYWh6SmUrVWtmQk8rWTZXeWtoTVhiSlU3YXRZblJTcXFSSk0z?=
 =?utf-8?B?dG9xZlNaeVJrbWZUZVlicXYzVXp0MStWVEg3ZTl4UFlrNWdvR3RBS05DWjhQ?=
 =?utf-8?B?VzRESG9LVndWeXJJLzA3anY3VGJFQlNOMmJYRWh6QUxycWZLOXhFNm0yM3VM?=
 =?utf-8?B?b0ZKWFNKZytDT1FJbWZBb1hZVDR6TkR5NWVYRWJoMzhpdXREdmJOTEJ6MnJE?=
 =?utf-8?B?V1FUZFhWRU5sc2QxdDFxdzRsUlRNUXRNeGwzVDhuWWhNWHNVSWpHS0tUVW5M?=
 =?utf-8?Q?kesaL+AdOGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG5vQmdzenArRXkxcVF1aFRhbXpjUnhhaDFCV0pna2l5dWxmQjJLRjQrQ3FB?=
 =?utf-8?B?bXNqcTJOUWhDT1pYUzFyR2w3dXI0LzUrNGpHdGR3UHlidS9hN0ZNbGI5SFlP?=
 =?utf-8?B?aHR4Y05oWTFmdGkxUjczSVovenIwTkgza1p0eHZhOWhwS3RYU3BiYlJtY1Ux?=
 =?utf-8?B?a0JJSndndFhjSFZaLzZ1WXF5QVhKQjhROEVhN2VjMmRaSVVOTy8vZ0pUcTJD?=
 =?utf-8?B?enBLeUFCYi8zMGplc2YzVGtheXdMK2hCNTU2WEF5a3ZNbzZ4YkxZeUV0cTRI?=
 =?utf-8?B?WXlTR1ptUmx3QkVRU0ZyVU85dFpQLzhjbHR0VnF2UTNTMEFURnVGVWJNMmZK?=
 =?utf-8?B?bDMrc0E2VjVCSUVZeE5MWkpodjlieDdPS0xUUjBSMzdiMTFUeXVhVVZoc2ly?=
 =?utf-8?B?U3FVaXhYMkxHNHhWU0JLSmVxOWtmNldhK2U4Mml4eUdOYnd5bzNSeHk0VFd1?=
 =?utf-8?B?THRZWW1VV0FNRDExcHlZZUpwNkY4aCtvOTI0cGNRV25LNnpCTXhRa3FvWGRo?=
 =?utf-8?B?K3d6SW56bzhvbWVMWW9BcWY5am1yQ1RtOVprOEp6Z1Fna2R1SVc0SkJ0a3NX?=
 =?utf-8?B?TGFORFFVL3lOemNUQ1JVRkdtUlFwRUE2WDBxMjlHMG42VzE4ZUVMcnlZTlRB?=
 =?utf-8?B?SVcyWTJTS3JHa25SbHVuNDlodDhOWUNwLytVb1hmVDdwdjc3WkVJemxEajdu?=
 =?utf-8?B?SGZnLzdxVXNkYkkxbGgvTnRRUmpLUHJ1dDNIWmFSQ1FETEFLNEdxS3hnU1oy?=
 =?utf-8?B?dGFHRDNKVXZpVmVJZGpyQkFYS3MwZUtCZEplbjdGM3lReE9wVkhGd1RGV3I0?=
 =?utf-8?B?bndBUWxsc3VkeWhCRURBTXQ3QVlVS0pReFdBRzZBMHNZRFhaRHo2R0szVTFp?=
 =?utf-8?B?bnpucEEyR2h1SEhwVHZHMU85OE5HTklCNnFhSVdCTCtIYklRY2ZvZ0dCa3Ji?=
 =?utf-8?B?ZTJtRHlwVlBTSEN2bGlaK3huMVBtQUxaM1ZsSkw0R3luVzdyTDNtMUVmNVFa?=
 =?utf-8?B?VWpmUENESFpid3VlNkE3NnUwcDVWN0pVdU1HeXlTa215WXo3bFdyNXpob0c3?=
 =?utf-8?B?MHp1UllpcWZsM2YxNnYwdVdleHBFZHlPcDhOTFVKaXRpQ1BYVlJGWVh0akJL?=
 =?utf-8?B?MitLUEpJNW9TdXMreXg5cU44VWxub081c3h2V3lPUkdNTEJBN0l6bTZkUjl2?=
 =?utf-8?B?YXhFblM0SndxdDBaZGhRUUtyd3dFbVNHS3FkeDlwNU5tQ3dLMGV5azUwMW5h?=
 =?utf-8?B?L0dxRmZjN0Z2ZkVqY3NrYzhtSytkZlBXTDA2YUQvNVU4TGRiakphNGljdDRC?=
 =?utf-8?B?aEpMOFY0T1NVUHo4amZtNXl1cXgrT2lGUG9XV01BKzZuL1laUkVTQUJ6VHA2?=
 =?utf-8?B?NjVpZkpiNVhLTTNtQjVkYm5RLzNtd3VMR2taM2tWVEZiWXdCS0RGUFN2R1Zw?=
 =?utf-8?B?d3d0RnZUM09WeDUwY3F6QytRSk9HZS8zSWZEREo5REtrcnRJTG40RDJ2c3NL?=
 =?utf-8?B?THlJWERKTTRuUUg3UDdmVlN4L3dmT1gzYnRtUUJSbXYwNm5wMDBrVnR1THN0?=
 =?utf-8?B?T2VrZzJMK0xQaVZLajJOdm11UEd2VUxNUUsvd0NQVkk1RW1sLzc1dUxPSkln?=
 =?utf-8?B?c05pbnYxaUxYUXIwY015UHp2T3lIMGliTDJFZ1haQUh2MXNkaTcrbVR0N1F1?=
 =?utf-8?B?NUlaRGNUeDZIZCtNM0cvczhpcFZyRUxMN0JqVXFzNzhqYTRLQjM3TXgwNWU3?=
 =?utf-8?B?TmlZMWFBV3lIQWFCREtaR2hBNkxsQ3BXb1RIMVZBclNIeWtDRU5EYkJQS3R4?=
 =?utf-8?B?dEZNMEZON2hQVS9Gd01raWhDM2tUZ2tMVXVZa3pab3JicHBOcktmQU1DWkFW?=
 =?utf-8?B?bXQzRWtOV0lDSjVlQll1YWdSVjRvMU9QYVZRUWNzdmRvUTNESUJYWGppMlJy?=
 =?utf-8?B?NjV4ZTYvWTZwUDN1RTE4elNMVXVtZ1EzcDRmNFpyM1MwTVlwYUUxSCtVWXBj?=
 =?utf-8?B?QVNUeGFYc1dkMHlLcEtiS2JNQ3p2Tkd2dW1qcHF3dkE1UHVCN09LTW5xVGZu?=
 =?utf-8?B?K2xCSWVCM3RJZHhBTGt2Z0JqOFpzTWtiKzJkMlUxRHZGM0cvZGdRVkwyVFBy?=
 =?utf-8?Q?/6E8y1h9D3zgLHuKmfBRZELqT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff03f12-8c19-4458-b083-08ddc8f4742c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:50:40.6068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oawMFCWaLWjErMr0uCiJri9A0/EccQPBrdjLONYHknrLcoPG1pg1t37Qi4WA6hYCnXfF9txVufQDPv3xeEr0+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7456
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

Hi Shengjiu,

On 07/21/2025, Shengjiu Wang wrote:
> On Fri, Jul 18, 2025 at 7:51 PM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:

[...]

>> Am Freitag, 18. Juli 2025, 12:11:48 CEST schrieb Shengjiu Wang:

[...]

>>> +     /* IEC60958 format */
>>> +     val = 31 << FIELD_CTRL_P_SEL_SHIFT;
>>> +     val |= 30 << FIELD_CTRL_C_SEL_SHIFT;
>>> +     val |= 29 << FIELD_CTRL_U_SEL_SHIFT;
>>> +     val |= 28 << FIELD_CTRL_V_SEL_SHIFT;
>>> +     val |= 4 << FIELD_CTRL_D_SEL_SHIFT;
>>> +     val |= 0 << FIELD_CTRL_PRE_SEL_SHIFT;

[...]

>> But where do these numbers come from? I can see that downstream kernel
>> sets these bits depending on audio config being passed.
> 
> These numbers are defined in standard IEC958 spec.

Can these be defined by macros, even in a certain common header file,
include/sound/asoundef.h?

-- 
Regards,
Liu Ying
