Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30103BA7D47
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2BF10E203;
	Mon, 29 Sep 2025 02:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DEPQoe32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C175A10E203
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVqWV7kV+qr7yVy/E0Wiahcu29VBX65Ezb+GRCz51rqIBnwBA4iwg7MEz4JuRQyZt0m4Y5AqYgRb4WmQINK8EiIayWdZeCQ5Xis4Pe1U3Xxs4W/AlUwTVmmics++lybtTSwJNfXXL64CdbZOlERzZBNGGqtfh6apQi5ULHKSlmVurFudErom/bV03TgBDHDzVYH7cFxeSbwpWMp0RerknAjAmrzisYEyE+Q2gKRTQqPCdHZdl35gAuPLzv0TotKMdurt5jM6elC9oTXxB1nUVgR/t0WFUi5ipL2LeEy8c16uMq4Thae4y5f3eQlgO9p7drAGrHuZIYTidkbi7tu7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pU0jj1j2tl/V3RcnB0LVTA4uBWoPVA9L+LF2PfE2J9A=;
 b=FZnoKhuu0rKLCWaZ1bK3WkwrKbC352mbt6SG4gBuCv2lJlIepNfxPhYN7OCfj5jTKw8neWzTikIBI2f0g84a1FcZ/0DxGqVZYuKH8B5aaOQROJjYFjhayR6eajd34QEQUZec1LVb9Ytl9tM7xn92iezYBS1u8EzsdUOrDOEhVc10cTZwFIXeb8ed1PG7lmx08XooDSGBLNQ4LMCMvNAi/yykONk9qGHZw4Vc0b/ZxXgY80JwqOt/liEPPouw2nwbjBPeu7bYgQ92mrINKEM7tdvniIdgcc/0muj9z6eC/Tizg22v6UK5ybcW7fARJWv+zKUf4JAzyM4tylEerbIVRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pU0jj1j2tl/V3RcnB0LVTA4uBWoPVA9L+LF2PfE2J9A=;
 b=DEPQoe32WrBqp+SQ8kUMchZBawVgi5OLCvDuBG+j0ywh0qvhv7xZVsArQPMQ6c5nkAlMvs6JuQ8Xn4XifcKcoXO5917eHK/9lJ8/ZArV8cxIcchT8HouT0hMbMHFVWV86VRzdPuYXTM0uib8G+Ir28kFKU9CNtZBYCIfWBZ2Z7zW5gUzYL1XpYpRhGDrLIrn7NE6rAHrBwlMtX7RvfVOzrxZD0Ld1dneUt8rdnpEsUnrCYOTCtq8+qoli1hNPyjJ3rP91CVKpwXfKuDpHxqKDhVrQQU/KJLHkZdgCO9L/n+Q68kEVKYZ4QhTmx9YNBKRfLkExIH3t7RmJDO2fs+0Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:41:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:41:49 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:49 +0800
Subject: [PATCH v3 14/14] drm/imx: dc: Use prefetch engine
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-14-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b6f075-6364-4c9f-4090-08ddff01bd63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFRFKzc1OThOME9mdDlTNU16Y0VxT1dpTWdOcTZzRzZ4NTZsNUw0NzB6UUJI?=
 =?utf-8?B?b1lmODhzS2F6TlFhdEx4STJ2R0IzbGFRWlhLRU5OcnZtYzBCbkJIcVg5NU1G?=
 =?utf-8?B?TU4yUHhTVXFHWGYwRnJqeWxPaUxGcVhQRkVOdEtocXJMK1FWWGRzdW5Ha3Fw?=
 =?utf-8?B?OTFabFFYRTM4MVE1TWFwbnh0OXJsaFBRbVh0RWRXM2NCRXJlWVFaYWZiNWxY?=
 =?utf-8?B?NmtyRU1PTnd0MkpZNzdUbGthYVY5Y1JGSmZIamdEL0VGZ0ZLUTR3THF4L3pq?=
 =?utf-8?B?TGVCUEpkMVNxZ0JuSUF4dEtBYUxuR0l0NEp3dkxwRmloMks3S0ViTHhuNTRv?=
 =?utf-8?B?UTNzUlFiYmd4N1lxT3JHNFlabTkzQVJMbkp2RWxPRWQzU25INUZwVExrRjFW?=
 =?utf-8?B?NjNsY1RLaE1wQXpHUFNEaXhJMzVMVUZRSTg3bUVYTlNGdW11RVBibWFSTHlO?=
 =?utf-8?B?bGxKWm9yakZ2Y3RWZzljWTBxTW95NWRtYkJkRGg4STVmd04xL1lnUVFwRWkr?=
 =?utf-8?B?djJuWEN1N0x1STErcUg3ZG5CMUhrNGJHaXpWb29SY3NIa2trT08rSFdEckl2?=
 =?utf-8?B?cFl0SUo5bnN1dE16d2k1aUpZMldobXRBdkRralZ0bTE1d243NURnWTk3cTJ6?=
 =?utf-8?B?b2ozT25VaXZzdGluNG5hWVJEeFdRc2ZuSi84RHpKN2ZPWHFwUlVCQnZ4cWZL?=
 =?utf-8?B?cGdVU3ZnN1VLQXczbE9Ca29zUmJzNGsyTVJRNmFXdDZQcEViTWtmdWhPd1dZ?=
 =?utf-8?B?RFVpaVNyNlZWeXA3YmREem8xRzVSem15N21SNXRibnhCMFUvb0MwU1dON2hC?=
 =?utf-8?B?Q1dzU1dtcmN1eFIvUys1T0MwZVJjYTZNVU0vaVVnbFVVd1VBaytjVFpwNVBQ?=
 =?utf-8?B?Qng5RjhibWc2eE5XOGl2QnFoc3BVaUlVSUhYaVo5bDVIMDdMU3Fqa3NZZWtx?=
 =?utf-8?B?VytzUjV6WUI2RDNGbHZQNjlNbmRKaFdjOURuNWs3WnlyZjF2N2hFZ2gvRDdY?=
 =?utf-8?B?d2RySEY5V0tydGhuOC8xaENxL3IyS1FPY00rN1hMUXdIdlp6Y3RoY2E5dUxJ?=
 =?utf-8?B?d0txaC94dVNFSUl2dlN2OVZUVEdnL3g3VkNqS0RudVhhRjA4N2pITkNNQ0hE?=
 =?utf-8?B?UW9vQWVTUHV0YTVCa2krcElqMXJraGg4Nko1enhYeHdPNlZzUHBSYUxYTVFR?=
 =?utf-8?B?TFpOb3h4UHJoS09IcWswMUNhQ3FmRG5nUExTV1ZReis0L2FkaVUwYWhqS0pv?=
 =?utf-8?B?OFNVUWlSWnVvZlBlQ0loeE40Znh5QXlmbFZwRnZQVjdSdDFTcGhjajVYcEpB?=
 =?utf-8?B?ZHRvOVhMd0dNMlQrL3FDNzB6WFVadlp1S1FGWFNxa1VROWdiTllmVVNrNlRl?=
 =?utf-8?B?ZWRWZUlMdmxtbzJMcFFTdTlnTEIxZzJRVzR6YTZPM045SURISWNmdEdiY295?=
 =?utf-8?B?UTZqelFZUGV0c0VKZ01BTFFTZEFPelpqMEZtWDg4cUNvUWF2Mmlwb0xwUHlj?=
 =?utf-8?B?aUJVUlQyU1Z6WHAxdEUyU2hpM1gyMEpmNGpDZlJqeUhGQXZCalV4T0F5dE96?=
 =?utf-8?B?d3lkWGJYZ0hWNFNTbGpEdHJsYjRuazVOcXZjdWhDSGlIbzFoWUlOSk9UWWlH?=
 =?utf-8?B?NnYvUGpidlV1MzJCUldzdTY3Uno5cFd0S1M0Q0p1TDRBaDQ4RmM5UEtOSXBV?=
 =?utf-8?B?NytOV1hnSlgrUDdNVUEvdkpYb2ErSGhWcVdybWowVWlFMnRVME9EOWpTYUZG?=
 =?utf-8?B?V2FYay9qU29tcFRBSk5hY0ZNTWkrYzYzZ25ETHVKczFVejNIV0dNK1pJdFUr?=
 =?utf-8?B?VWVBMXpKTVY5bE5hQ21BT05uWnRFR1MzcHhjTGYvSGpEcHpHTmVBYlp0WmRK?=
 =?utf-8?B?WmhSMHVrS1pQY3A0OGovMGtRTDRTdDhyTW1yVUZRbXJucFdaamJLV3kxQUlR?=
 =?utf-8?B?NkRLNkl3TVlCaTlQVDF0Z0gxU3pPMUJmdzlIL0tPYzE3djl5RkpDY1BtZ1la?=
 =?utf-8?B?a0tJc0ZZaTlkU1VYWGpvS0dUQ2hLeGYybTY2M1BZSjNoVTBQNjVxQTJuNndB?=
 =?utf-8?B?cE53bzh5aHRGSW9QTVRtbjA5dGZXZUpoc01Hdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEw2WjcvUFZJVzUzeHcvQ2hUOVFJbVhQcENtUGMzdG41cEptekpxakQ1WmJp?=
 =?utf-8?B?V1ZiUFpRc3NyZlBXZ1o0TVpMTWFtbTFtckRkZVlWMnZQL0pqa1A5R2JJTW1D?=
 =?utf-8?B?eXArTDFZY0V6b29rOHVhM1RmNWg2UytmUzFzTzlNdXI1TzhwaWRhaXZ1ZU9K?=
 =?utf-8?B?allSbUJGMWtZYWJkTjNYRUpORzBDekxCcG5xbHZhOWlJbG5pdmZubU1WTjRu?=
 =?utf-8?B?ZmcyOTZsT0RqdVJ4LzVUek0wbnZsQ05yNnMxL0g2MjRIbmNFSS9LVXlUbmtH?=
 =?utf-8?B?bmQrTWVFbEhvNFBpclU0TjZmMnkxWWVibEtCc3YxRG1iT0VBejR5akRVYytq?=
 =?utf-8?B?MTFIcWJEeCtJZlQ2Q1BFWHdUbmZCK00zaVlwbGtqNko0ZlRoM0FyeGt3VzNY?=
 =?utf-8?B?bDkrZmloSTJ2QVlQMmtaa1pEdDFLTWQwaWRIb3g5QjREKzExOVBZM0FDU3Nv?=
 =?utf-8?B?RUh1bCtleG1mZzZkcC8vRmhTR3dkZnFyVE02Nk5ZenQzRjQ2WmxkZkh6OTNT?=
 =?utf-8?B?ZWV3cVZOaGsycVRHUHlqNzQwdUdFNllqSFROYlhVbGFzdmxJeHR4UUk4Zzcy?=
 =?utf-8?B?K3I3czBEdDd5ODNqOVc3QVE1anB3UFkwUnhtTGVPZm5pdjdidDhtWlZGQ1Fr?=
 =?utf-8?B?OThqVVViV1BIMFMyYld2cDVXc2VYSThiTFlnRTMyK0FYd0VIL1FHcldINUho?=
 =?utf-8?B?ZmNiM2Z5eTJrMVFseldLR25JaDhaTFZCcy8wMWlEV3FRR0g0YTRFVUsxZlBC?=
 =?utf-8?B?WVBxTFdxam1rMFp4WUtzMUY4NFBGNTg3OExRZXZCSjdFbnpmMGlGU2ZBMEVN?=
 =?utf-8?B?d2pGRGJ3NDA5SmZmQmlyNHVOaHhpYzNSZGtDZis2SjFTWWNCRzk3VlV2dUlq?=
 =?utf-8?B?cTkrcGUwZUROZHdwL0J0N0N6OUtRR3BTYXJ2TXc5V1djV3FKVTBkVC9wS1dG?=
 =?utf-8?B?Z2Y1dENRMjR0WkdJMzFrSDg4Kzk0SDdrV1BPMHdHTEhuMkw5b3NnMXpVdkFX?=
 =?utf-8?B?dzFHdHErRmhWTzZ5L0NJMEpWVlRuRFBtckEvYXpuSVdlRXRscEdOR1YwY3c2?=
 =?utf-8?B?d3E4djFnRWVWVmFQc2dndmIxWmYycDJsNHpuc3R5aWVXQ3liOE5YNlBFaDI0?=
 =?utf-8?B?c3pQK1BCalBjempIZVFEQlpBVG1ZUFFsN2N5ZVNrWjljNEU2dkE5SU5vVkcr?=
 =?utf-8?B?dlV1QXVScDlZQkUvRGxpY3RycmpIenFIZVBuSnNCQmRHSXcyR0E1eGFlSFpT?=
 =?utf-8?B?djNJQ2FNb1FpU2d5UmlXNUNacVZ6U0hQYWYremhhYXU0NENRaWxLZVJVTDNi?=
 =?utf-8?B?UU91Y1VPRkgzRXhodlpGSWhCNG9HZ0ZrRVJGRmpOcjhxUTM3YWlFNDlycncv?=
 =?utf-8?B?Mnppa2ZScFk2QktpY0NmSDQyVkdLY0JqbDNXQmJ3cGNWSi93THZqRmpiRnpL?=
 =?utf-8?B?a3Q4NE1oL3F4T3R0S1E3bmJLUUhxb2ExUDMvRmhaODlTNFFSaHJESURqaFFp?=
 =?utf-8?B?VUlhWmI4RittQnJSMGxxanB2QSsrWUtxbHVKRXNnWDNzRTJ3TGxDMG42dEEx?=
 =?utf-8?B?Nkw3aGNDR0Vkc3hwdHF4enJPOWdJV0cwTklMTzBENkNJOGdVeDRoVWRRbUJC?=
 =?utf-8?B?RHdEUlJsWEs2TkJOdVIwa2MrTnFlRW41TkIrK1BqVlZsdUYzc2J1eGt6cE91?=
 =?utf-8?B?Ylp1TUlEcW5rUTdTSFBvYi9jL2t0emJhTDVHT3NXanFJWkcvTFpGVFNkVmVm?=
 =?utf-8?B?MTB3L2R1UHQzbFNmSHppaDJVNGRVTjhhTFJkeHhMTGx6dFd1dXk3OUUvWkxU?=
 =?utf-8?B?QUxBQnplVmUydjlnOW91cVBocXZCRTArbll2Qy9XNkVvWGZvbzB3TXhUOWZG?=
 =?utf-8?B?WFpzYlRvM1Z2aFNFWTFPUkRtVDZEcEd5RXFMQTF2QVJ2WlhGdUsxUmhyc09w?=
 =?utf-8?B?aU5ib3BrUmRiTVRTVWxOSzlDUlZUMmZmelo1OVdkdC8zTGZsSHNqK20yaXFy?=
 =?utf-8?B?SGRJZ1dtNi9COE5MaGtvSXNSQm5wb2hSUWtGUlR1NVVwdTNNdDZ6cVVrRGZh?=
 =?utf-8?B?dFgrL3d6NmVaZVZDOFE5YVNMZGN1b0NaOUtDL0IzNEZ3TUZBU1c5OC9Zcjg4?=
 =?utf-8?Q?VMUIW9V8syrUfa5kKKh8ggS/K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b6f075-6364-4c9f-4090-08ddff01bd63
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:41:49.5311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sftXChOLXh85a6BEFlKihP26c/0OsE8DOMA3JkJxfPzaKhXvwlunRKEASssRCdA4wfT22fjzg6fTudYRaBEtJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
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

One prefetch engine consists of one DPR channel and one or two PRGs.
Each PRG handles one planar in a pixel format.  Every FetchUnit used
by KMS may attach to a PRG and hence use a prefetch engine.  So, to
simplify driver code, always use prefetch engines for FetchUnits in
KMS driver and avoid supporting bypassing them.  Aside from configuring
and disabling a prefetch engine along with a FetchUnit for atomic
commits, properly disable the prefetch engine at boot and adapt burst
size/stride fixup requirements from PRG in FetchUnit driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-crtc.c  | 139 +++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/imx/dc/dc-fu.c    |  27 +++++++-
 drivers/gpu/drm/imx/dc/dc-fu.h    |   2 +-
 drivers/gpu/drm/imx/dc/dc-kms.h   |   5 ++
 drivers/gpu/drm/imx/dc/dc-plane.c |  46 +++++++++++--
 5 files changed, 197 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0..4c7aab360616cb1c84c31c83f16df703b1c2c6d7 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -25,6 +25,7 @@
 #include <drm/drm_vblank.h>
 
 #include "dc-de.h"
+#include "dc-dprc.h"
 #include "dc-drv.h"
 #include "dc-kms.h"
 #include "dc-pe.h"
@@ -204,7 +205,13 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 				drm_atomic_get_old_crtc_state(state, crtc);
 	struct drm_crtc_state *new_crtc_state =
 				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_plane_state *old_plane_state =
+			drm_atomic_get_old_plane_state(state, crtc->primary);
+	struct drm_plane_state *new_plane_state =
+			drm_atomic_get_new_plane_state(state, crtc->primary);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	bool disabling_plane;
 	int idx;
 
 	if (drm_atomic_crtc_needs_modeset(new_crtc_state) ||
@@ -216,13 +223,40 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 
 	enable_irq(dc_crtc->irq_ed_cont_shdload);
 
-	/* flush plane update out to display */
-	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+	disabling_plane = drm_atomic_plane_disabling(old_plane_state,
+						     new_plane_state);
+
+	if (disabling_plane) {
+		unsigned long flags;
+
+		dc_crtc_dbg(crtc, "disabling plane\n");
+
+		/*
+		 * Don't relinquish CPU until DPRC REPEAT_EN is disabled and
+		 * sync is triggered.
+		 */
+		local_irq_save(flags);
+		preempt_disable();
+
+		DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+		dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
+		/* flush plane update out to display */
+		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+
+		local_irq_restore(flags);
+		preempt_enable();
+	} else {
+		/* flush plane update out to display */
+		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+	}
 
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
 
 	disable_irq(dc_crtc->irq_ed_cont_shdload);
 
+	if (disabling_plane)
+		dc_dprc_disable(dc_plane->fu->dprc);
+
 	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
 
 	drm_dev_exit(idx);
@@ -320,14 +354,33 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_crtc_queue_state_event(new_crtc_state);
 }
 
-static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
+static inline void
+__dc_crtc_disable_fg_along_with_dprc_repeat_en(struct drm_crtc *crtc)
 {
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	unsigned long flags;
 
-	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	/* Don't relinquish CPU until DPRC REPEAT_EN is disabled. */
+	local_irq_save(flags);
+	preempt_disable();
+
+	/*
+	 * Sync to FrameGen frame index moving so that
+	 * FrameGen can be disabled in the next frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
 	dc_fg_disable(dc_crtc->fg);
-	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
-	disable_irq(dc_crtc->irq_dec_seqcomplete);
+	/*
+	 * There is one frame leftover after FrameGen disablement.
+	 * Sync to FrameGen frame index moving so that DPRC REPEAT_EN
+	 * can be disabled in the next frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+	dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
+
+	local_irq_restore(flags);
+	preempt_enable();
 }
 
 static void
@@ -335,14 +388,29 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *new_crtc_state =
 				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_crtc_state *old_crtc_state =
+				drm_atomic_get_old_crtc_state(state, crtc);
 	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	int idx, ret;
 
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
 
-	__dc_crtc_disable_fg(crtc);
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (old_crtc_state->plane_mask)
+		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
+	else
+		dc_fg_disable(dc_crtc->fg);
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (old_crtc_state->plane_mask)
+		dc_dprc_disable(dc_plane->fu->dprc);
+
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
@@ -373,7 +441,10 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
 	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	enum dc_link_id ed_src, lb_sec;
+	bool disable_dprc = false;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
@@ -383,13 +454,53 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 		return;
 	}
 
+	ret = pm_runtime_resume_and_get(dc_drm->pe->dev);
+	if (ret) {
+		dc_crtc_err(crtc, "failed to get DC pixel engine RPM: %d\n",
+			    ret);
+		goto out1;
+	}
+
 	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
 		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
-		goto out;
+		goto out2;
+	}
+
+	ret = dc_ed_pec_src_sel_get(dc_crtc->ed_cont, &ed_src);
+	if (ret) {
+		dc_crtc_err(crtc, "failed to get content ExtDst's source\n");
+		goto out2;
+	}
+
+	if (ed_src == LINK_ID_CONSTFRAME0 || ed_src == LINK_ID_CONSTFRAME1)
+		goto disable;
+
+	ret = dc_lb_pec_dynamic_sec_sel_get(dc_plane->lb, &lb_sec);
+	if (ret) {
+		dc_crtc_err(crtc,
+			    "failed to get primary plane LayerBlend secondary source\n");
+		goto out2;
 	}
 
-	dc_crtc_dbg(crtc, "disabling at boot\n");
-	__dc_crtc_disable_fg(crtc);
+	disable_dprc = true;
+
+disable:
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (disable_dprc) {
+		dc_crtc_dbg(crtc, "disabling along with DPRC REPEAT_EN at boot\n");
+		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
+	} else {
+		dc_crtc_dbg(crtc, "disabling at boot\n");
+		dc_fg_disable(dc_crtc->fg);
+	}
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (disable_dprc)
+		dc_dprc_disable_at_boot(dc_plane->fu->dprc);
+
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	if (!dc_drm->pe_clk_axi_disabled) {
@@ -397,7 +508,13 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 		dc_drm->pe_clk_axi_disabled = true;
 	}
 
-out:
+out2:
+	ret = pm_runtime_put(dc_drm->pe->dev);
+	if (ret)
+		dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\n",
+			    ret);
+
+out1:
 	ret = pm_runtime_put(dc_crtc->de->dev);
 	if (ret < 0)
 		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 47d436abb65157de7cab74565e44b199be76de52..bc439c3520d45f894c0afab5b3d52f2f3309c2e2 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -124,13 +124,28 @@ static inline void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
 			  SETNUMBUFFERS_MASK, SETNUMBUFFERS(num));
 }
 
-static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+static unsigned int dc_fu_burst_size_fixup(dma_addr_t baddr)
 {
-	unsigned int burst_size, burst_length;
+	unsigned int burst_size;
 
 	burst_size = 1 << __ffs(baddr);
 	burst_size = round_up(burst_size, 8);
 	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+static unsigned int
+dc_fu_stride_fixup(unsigned int stride, unsigned int burst_size)
+{
+	return round_up(stride, burst_size);
+}
+
+static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+{
+	unsigned int burst_size, burst_length;
+
+	burst_size = dc_fu_burst_size_fixup(baddr);
 	burst_length = burst_size / 8;
 
 	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
@@ -150,8 +165,14 @@ void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp)
 }
 
 static void dc_fu_set_src_stride(struct dc_fu *fu, enum dc_fu_frac frac,
-				 unsigned int stride)
+				 unsigned int width, int bpp, dma_addr_t baddr)
 {
+	unsigned int burst_size = dc_fu_burst_size_fixup(baddr);
+	unsigned int stride;
+
+	stride = width * (bpp / 8);
+	stride = dc_fu_stride_fixup(stride, burst_size);
+
 	regmap_write_bits(fu->reg_cfg, fu->reg_sourcebufferattributes[frac],
 			  STRIDE_MASK, STRIDE(stride));
 }
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index 44b9497e53580589a05bcb180eb2312ea4449da4..09570955a5b92105ef7010f71fa615a1cefc9b7e 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -87,7 +87,7 @@ struct dc_fu_ops {
 	void (*set_baseaddress)(struct dc_fu *fu, enum dc_fu_frac frac,
 				dma_addr_t baddr);
 	void (*set_src_stride)(struct dc_fu *fu, enum dc_fu_frac frac,
-			       unsigned int stride);
+			       unsigned int width, int bpp, dma_addr_t baddr);
 	void (*set_src_buf_dimensions)(struct dc_fu *fu, enum dc_fu_frac frac,
 				       int w, int h);
 	void (*set_fmt)(struct dc_fu *fu, enum dc_fu_frac frac,
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index a25d47eebd28792e4b53b4ecc89907ce00430c2c..8b45b21a6f8a7e6e6ed2563499753200bdd42ebc 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -130,4 +130,9 @@ struct dc_plane {
 	struct dc_ed *ed;
 };
 
+static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct dc_plane, base);
+}
+
 #endif /* __DC_KMS_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index d8b946fb90de638da2bf4667307f11b06f4e77f5..8ef754492b2dcb5d986a63f516328f8d2512c7b6 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -17,6 +17,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 
+#include "dc-dprc.h"
 #include "dc-drv.h"
 #include "dc-fu.h"
 #include "dc-kms.h"
@@ -44,11 +45,6 @@ static const struct drm_plane_funcs dc_plane_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
 };
 
-static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
-{
-	return container_of(plane, struct dc_plane, base);
-}
-
 static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 {
 	int src_h = drm_rect_height(&state->src) >> 16;
@@ -88,6 +84,28 @@ static int dc_plane_check_fb(struct drm_plane_state *state)
 	return 0;
 }
 
+static int dc_plane_check_dprc(struct drm_plane_state *state)
+{
+	struct dc_plane *dplane = to_dc_plane(state->plane);
+	struct drm_framebuffer *fb = state->fb;
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	struct dc_dprc *dprc = dplane->fu->dprc;
+	u32 src_w = drm_rect_width(&state->src) >> 16;
+
+	if (!dc_dprc_rtram_width_supported(dprc, src_w)) {
+		dc_plane_dbg(state->plane, "bad RTRAM width for DPRC\n");
+		return -EINVAL;
+	}
+
+	if (!dc_dprc_stride_supported(dprc, fb->pitches[0], src_w, fb->format,
+				      baseaddr)) {
+		dc_plane_dbg(state->plane, "fb bad pitches[0] for DPRC\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int
 dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 {
@@ -123,7 +141,11 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	return dc_plane_check_fb(plane_state);
+	ret = dc_plane_check_fb(plane_state);
+	if (ret)
+		return ret;
+
+	return dc_plane_check_dprc(plane_state);
 }
 
 static void
@@ -131,6 +153,12 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state =
 				drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_state =
+				drm_atomic_get_old_plane_state(state, plane);
+	struct drm_crtc_state *new_crtc_state =
+				drm_atomic_get_new_crtc_state(state, new_state->crtc);
+	bool needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+	bool prefetch_start = needs_modeset || !old_state->fb;
 	struct dc_plane *dplane = to_dc_plane(plane);
 	struct drm_framebuffer *fb = new_state->fb;
 	const struct dc_fu_ops *fu_ops;
@@ -152,7 +180,8 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 
 	fu_ops->set_layerblend(fu, lb);
 	fu_ops->set_burstlength(fu, baseaddr);
-	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, fb->pitches[0]);
+	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, src_w,
+			       fb->format->cpp[0] * 8, baseaddr);
 	fu_ops->set_src_buf_dimensions(fu, DC_FETCHUNIT_FRAC0, src_w, src_h);
 	fu_ops->set_fmt(fu, DC_FETCHUNIT_FRAC0, fb->format);
 	fu_ops->set_framedimensions(fu, src_w, src_h);
@@ -161,6 +190,9 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 
 	dc_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
 
+	dc_dprc_configure(fu->dprc, new_state->crtc->index, src_w, src_h,
+			  fb->pitches[0], fb->format, baseaddr, prefetch_start);
+
 	dc_lb_pec_dynamic_prim_sel(lb, dc_cf_get_link_id(dplane->cf));
 	dc_lb_pec_dynamic_sec_sel(lb, fu_ops->get_link_id(fu));
 	dc_lb_mode(lb, LB_BLEND);

-- 
2.34.1

