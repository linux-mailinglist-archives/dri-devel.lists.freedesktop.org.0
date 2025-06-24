Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36DBAE5A23
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 04:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B6D10E4A5;
	Tue, 24 Jun 2025 02:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KH9ZuxQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED2410E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 02:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJFv7mFbCTYupkLF1ECubqpmdTWkOfla1N409PwTmMZ51kv6RvvAOt57v7Myg0meqPbwpuFeM5nLXivHiTQSoMmtK7Ct8u+m692vKUgie/xLLJycP1AR3CFT4BoSxRtyf7TaLLO+sstiXzdTtH6h2zH37oSDIRUjJ7+y2job1oRQvNhUJjgb1dMUf7tVa7mFl95MSyCMUk6aqA7YWeueXvlqDW6b4Wu5anu896weUYzQToJ9nSuV8E+o72BMTrg7EzDEcTeNii8II2n7bEJyEAPlaNPk1ypMdcki3PzOJBvZ9kDP0FFkOIJQUhbqlMp47GpMAYeWp6mcAA8bRfj/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mlx7Wzvck+LDM+vom4QWU8wPz5vyE0oqs558/YD9ALU=;
 b=yCqRHQT+9RicyXETRm8luQzLBGhyPbvPaYIN8UsBFtO1exIOJy8HrG/yQmbMqh6Uujb/0bRfFNnHNBt4j7ZdQMFDeLq7EZuXynF22RPV4Sp1cI4uIFXDZ3Lmx/4yzgqt93Tu00E2K0439IrwHqlk6TwW0O3VIRd58dn1Z+meXv3x7OEmf7C7Gm70jziroPdzYU0fRSLxIe/PbYniIb0wQVHAvz+rvnnDH5+7aZFmQbzXJGJwKpX5YKiOFnCxStM2uz7qlKRXWGcwXHJL1K58YTsyd77/dn406AGaiqtaEa4l+bA3oiUtqaCxzKriMgrxpMDhQ4y03QMqZ1wYlhDRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mlx7Wzvck+LDM+vom4QWU8wPz5vyE0oqs558/YD9ALU=;
 b=KH9ZuxQxi1O1LnqxfNe+LpzFUrToAIgN76+6cnKamPGLhI0d71kM2JCYYUVLNbLeebOThfilNL+VNRUkhDlBWj5xyl8IvYE5QcjZAly8bvi+DPK1FRVhDTW+uyLPK0rSmbuFU/TWLQS98GaVd099v27CEq8x1NXQIVkxSXWETexfEBgAvUl0rpUD8VNIq2zQPNQTMEoKBTungFt/EBwbZ6FYcTZC7WWPBc0jz5eYbnzOYMTrC8/qXZWspMFRAh/PNEQoFhmInL83cLskW7fKKU5uiBPlldXAaZOw3j9MF9q5ombDYOwCGZ7WAeSghbbLRhyMNkwraE5CK6CD2/xoZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB7112.eurprd04.prod.outlook.com (2603:10a6:20b:113::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 02:42:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 02:42:34 +0000
Message-ID: <1d8908b1-b38e-4226-9433-cd9405c7ca63@nxp.com>
Date: Tue, 24 Jun 2025 10:44:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-2-0321845fcafb@bootlin.com>
 <be6a4d90-2c6e-42be-9948-df1840fd2f83@nxp.com>
 <20250623160903.01c56bfc@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250623160903.01c56bfc@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM7PR04MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: a19c0aa7-dda8-495c-657a-08ddb2c8c5cd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjZ2Y2szWUZqei90SWpBZWdFNDEzUXpndmtjSGZPRUlNL3Q2NjFISmtpU0hx?=
 =?utf-8?B?Z21IRnFES0Z3RStDK0NxdzRYdmZiQTR1d0NRb28wenpaVWt4UnhhbmtWajZw?=
 =?utf-8?B?djhMS3pHcFJEUGtiUWNqTTV6MHBxdjlpRDRaMXZ0RGEwTEs4K1BQSzN2LzFJ?=
 =?utf-8?B?RGJDNzh6dURxZjZvQVJYZzcrY01rNzJSRjZTbzFQU0Q1VDlTTlU5NSs2K2ZU?=
 =?utf-8?B?Z1kwNTJXT1BVMWNmMUJsTi95SEtlOW5JYjVwY0ZJMWZab0gwa2VPVzVaVGht?=
 =?utf-8?B?a0Z0K2tOMHNRdE92amhWZituMDFUWHRMM2tMcHh5S05HUUhKUkRtU25nMXBp?=
 =?utf-8?B?eWtsOHdjSFdsMVRlU1ZXTVN1bm5EZUplVTFiMmVyS1U0c3Y1dDNlNDBoZFVs?=
 =?utf-8?B?Z0NFV3R2QmhWbTR4M1IwMm11N0VpRVgwSmpmZkZzU1JiclZ6MnJCVXhNTEF5?=
 =?utf-8?B?VjF3RGtCS3BkTGF0bHh0SGZYWGR3Y3NCczdrV2pqbHpuMFdGMXVUS0ZPR2NX?=
 =?utf-8?B?WmNYZTFMdnZHZW81Q3RVQ2MwYlloTjEyUGlFQmdNdWtRcGNBdHRNaWV6ZjVi?=
 =?utf-8?B?SVYvY2M3WDhNL0NKR0Y0VExkaUhHNFRlUmRpWjFlMDRzTDdlUmRIZG82b0hu?=
 =?utf-8?B?anVrSm9ZNnV6Tm9qS0tVRUNqZkNZVlhxaXRDU0Z5U3l2Y2hneHpUMEFBVWJL?=
 =?utf-8?B?Rk5RWFh1Z055UFJnY1Avc2RpY2Z4OEhIRmlaSlRpS1BoSjdwNWp0RG1NR1Rq?=
 =?utf-8?B?R2dRcndTamZKRXp6VXBzYUEzTUFUN0I3U3dzQnpJa3dJYUZaeWMrWG5sdmVm?=
 =?utf-8?B?T1c1b2Z2ZHJLMWI5bXJ1dkJ1Y0N5VlFTVlMvVmVuN2Jyd0Y0N3FMczJwS3lm?=
 =?utf-8?B?VEJ5Y2NKTHNNTTYwTVk4SzRPeEV6ZTdhRXgreDcrTFZoOGQ1STdQMWpQbDln?=
 =?utf-8?B?NXV4TW84cHpITk1wYW4wb1hBNFQxODdlckYrRjZMM3hEemhySVc4azhETHdh?=
 =?utf-8?B?UjZWYkpxbXFaek5STzNqNUZGbVZBSU9TYUg1T1hGQ3VZQW5GSE8rd1lod3Vt?=
 =?utf-8?B?YTlySHVPbEpsdkFCYUJJc0FkK3JNeFNaMTdoWThXU0o5Ylo4djh0UFl2eU1m?=
 =?utf-8?B?U0xvZzRBdkFJYWVrNVNFWnJrRWJ6eWdUWXlHazJ6MzNZUUtNMVo5OWtOSUl1?=
 =?utf-8?B?RWVmYnRoOEFRd1N3RlRKYVlMTjJMd0JnU3hoVlV3YWNPVlk2WjlOYUpuSkVU?=
 =?utf-8?B?YVpqalNUUjFrcWFVTFRXWGp4T3cyVFZRUjFNWEtrZmY2ajVxQXBJVEpFSTFE?=
 =?utf-8?B?NFIxcFBVQno2bksvZVFwMjluVENYWG9UT3dibWk4UTB4TWwxNHFDUktscjZu?=
 =?utf-8?B?aUsvcVFkUHBYclEzeEl1ZDF6ZFAwbFplMW9kemVEamlURUhuYnUyVE9xK2RD?=
 =?utf-8?B?MnRtY2I3d1ZFcldwQlFzcmdTdkx4Y1VEK2Z1cmtVbTNsVlQyN0g2MU1sajJ0?=
 =?utf-8?B?NlBaOXpXT0ZFNFQwTzFjTHFoK08xN3czQUlLM25NSXN4czJVSUMySzI2Nnc4?=
 =?utf-8?B?c1V5V09nR0h3eGFwQWsyZmhFdVZtYjQrY3Jab00yeDEzUUQ5Y1FjVlB1SW9p?=
 =?utf-8?B?UHYxc1lLZzB3NzVCWVBVU3Z3NE03WHJVNnJvWDNtQ1VtSk1pZ3MwZlR2T1hV?=
 =?utf-8?B?ZjI1ZmcxbHZMd2c3SmRDOVlaUzkvODEzakhKM2crcDZDT3JYdVJpZloxaFhh?=
 =?utf-8?B?a3ZOY3JTMjJpanAzdEhuQmc3TVhYZ3VHemJPckNBZTZKOXV5b1lmYUZEMWNH?=
 =?utf-8?B?VzY3cmk2eGJZQVFRWVBYVWZwZ3Y3UU0wUnlzSFlyaEFIdlp5MnoxU2E4Tjc3?=
 =?utf-8?B?RlBHeHdGUFZPbGREMjRPNHlZUFJLL00rR2VERnRHV2NMRE1qcGszMXh1MXlw?=
 =?utf-8?Q?YV6auGJiYtQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVhHOCt1ZE4zcHZqazFudWxpLzBzVU1MeEdiOU5uMTZucnN0K3ZzQVJFZVdh?=
 =?utf-8?B?ZEd4V2l5eFE0dEJRdzRTYyswMUFGSXZ6NDBldlpMSll4UUEwUkFnRUZhbEsy?=
 =?utf-8?B?N2NtMFF4VTVudkF2anQ1dE1UWUVvZUxDTDFkTHZXQ0E0Uy9BTzZmam9rWElM?=
 =?utf-8?B?bFJxUVFmeVNYSEFKYnV6TWZFdXVwOHpkTWlFejhpMUNIbXhGVXdXZTdVY2pU?=
 =?utf-8?B?eGd4Q2NtaUg2Uk8rbmVTbFByenpGdGFVNUVnaFRzSjRwaWNmZC9hZjE0dXlw?=
 =?utf-8?B?RTBmLzNERjZCVTB4eld4MHpTZVFvd0p6bVQ1QWl6aG53akQ5REo1WThMRzRG?=
 =?utf-8?B?RnZDcnZOMW52aEphSUFtWVVRSHdJVll1b3NxM0xFdG1tc0VpUmhSdVhRRXBX?=
 =?utf-8?B?ZXJ2enp6NGVlcTE3YmxhYWkrLzE1SkRkR1ZuSjhjME1kUjhOTENpNGs3bWpP?=
 =?utf-8?B?VWoxTXBJQlNZa0RKK3ZuRVRrdW5HcjRySlUwM0FqdktQVkFkQnNEQ3h4dzJM?=
 =?utf-8?B?MmUzTWRzVHppUFJmY3YrZkNiQVRhZEo3Z3hZbVAxQ292RzRoeFhhUG9KQ0V0?=
 =?utf-8?B?NS81a2p5bzQvRGZvUU5NZFZoUGNscnBNNWhKemgvWE1tZVE4UkpURjhJRFdk?=
 =?utf-8?B?QXgzZHJEM2JwcUVRRXdlWk1VdXpyNTdxdHFBdmh0MzFHQnNUWk1uT0JYdXls?=
 =?utf-8?B?bUFuclIyemxjN29OL0c2elZESHNMakVPVVJTejdlK214TXJzcFhLTEFmUTc0?=
 =?utf-8?B?UUR0K0tsR2w4QWlhY0p6SThwV242MU5pZllJdDZHR2dRMlJqR2YxZmx5U0Jy?=
 =?utf-8?B?TXIyTGdDRmtIL2VxWmRzZU55dVRmenB1MXZVRzNzS0dKUTNkZ2NMYlJhTTV1?=
 =?utf-8?B?SVpsTFpEODlGM1Y0V0JtRHVXUldJVkZHVU1XeEQzWHQzVjVQOVhJM2VPM1VP?=
 =?utf-8?B?V3ZsKzFCWVllSHJ6V280QXJyOTNOa2FJaTVpTVoxbzVubGJvZU5DRWdhMVFr?=
 =?utf-8?B?cFZIZ2xPSGh1Z0dMWjc1TURtc1RIWUx2T2UzMlM1QVRjUVdoeWtTbkxoNUlO?=
 =?utf-8?B?TmdEbFBzYS85SklXVEVnNUp3WTdjK2dxazBoTmpPMDR1UjJ5MFhCa1pkeVJ3?=
 =?utf-8?B?Qkc3WThqT0hlSlNEMExrU1F1Rkg4NS8xYzNOenFVWXdNWXlobTEwUG5wRm8x?=
 =?utf-8?B?MlJnYTBwdUhyeklTem5tMVV4UVFBWVdpRHFtS1lkQmZpdlJRbnR0b0hHRElz?=
 =?utf-8?B?YjZXRE1qZDcvMFVSV1RiSjRxRHBza2k5ZG9CTEIzeVRNeXJSaUxIVVNaTDVp?=
 =?utf-8?B?OG9tQVhTazM4TGZCM0EraDFuL0lNK2VwZGowOERDbkh2NzAvcEE2UTlLWkJN?=
 =?utf-8?B?K3c4RHlqcm0wK2gxakl2WjhuV0IxTXhCTVF5MGxSWEF5ZGpTR3k4cWdWVG05?=
 =?utf-8?B?dFZjTUdIU2Y2YjZweWxvUjRrdjg3STA5Lyt2THNydk5SNXlYdnZlR20wL2pk?=
 =?utf-8?B?VjhvaC9hREdyNk5ZZmlzR1UrelhMKzR2MGhEaGhvYVdTMzJYdVRJUTJOU1Jm?=
 =?utf-8?B?K3J5aUtrUTRLR1lEaFdGc3BQRzdmWDhJN250dU12Z0xQNkpJMGVWaXdVdjZi?=
 =?utf-8?B?T0NqYmhsazdZZlU5ODF4S09HRzNhMjB1Unh0VjNHU3RldVZ4VHZpZlBva3Iz?=
 =?utf-8?B?WDJwN05lVFFna3JPeVA2dmkveTd3QUk5eTh3d2ZxMUdHYytvNHMxRFJtWFli?=
 =?utf-8?B?ajBFSEtXUUVvTlB1Y2srajJrN0ZOMTVuT3BxRVhkM2dxSkU2UlFwMmxLRDhP?=
 =?utf-8?B?MHNkUnI2QVhOMnZENC9WNEx5MzY1cDdoR2pNVWRhSElRNGtuTmZoTVRZNDNV?=
 =?utf-8?B?NWkvU2hCa2V6OURvdnNjcU1JNHRwcXJ3ay8rUGtybzJOcVE3L0htYkNUenNj?=
 =?utf-8?B?SGRJcmllVjYwOTBGRmtJQmpOcTE4OWNyOWk5OEpvTjdSd2dGSzc5UjdzSWpq?=
 =?utf-8?B?OFZYc3h6VUZmYlBJMVdaWGNEcFQ0djFWeFVBSTJEQkp2NEg4a1VTaENQYTRu?=
 =?utf-8?B?WWdGREF3U2hnVDZNalFjMGhBWGdMWXAwTU5IT0N5WWNxc1JBOG9BeHJCYUgr?=
 =?utf-8?Q?JJ6GVzzhw0khc/OExTE7Tylts?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19c0aa7-dda8-495c-657a-08ddb2c8c5cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 02:42:34.1215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrYfyvHYWxi/lzVtH5mmyeduPcownbbfwyZHzh+CugG0Yzr3iIDXBAGLZa6L2ph2OgGR59A4kdBrbFl/blFItw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7112
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

On 06/23/2025, Luca Ceresoli wrote:
> Hello Liu,

Luca,

> 
> On Mon, 23 Jun 2025 10:56:13 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
> 
>> On 06/21/2025, Luca Ceresoli wrote:
>>> drm_bridge_chain_get_first_bridge() returns a bridge pointer that the
>>> caller could hold for a long time. Increment the refcount of the returned
>>> bridge and document it must be put by the caller.  
>>
>> To make sure the incremented refcount is decremented once this patch is
>> applied, does it make sense to squash patch 3, 4 and 5 into this one?
> 
> I see there is a trade off here between bisectability and patch
> readability.
> 
> However about bisectability the problem is limited for this series. To
> get an actual get/put imbalance you'd have to be able to remove the
> bridge, but removing (part of) the bridge chain is not at all supported
> right now, and it won't be until after chapter 4 of this work (see
> cover letter).
> 
> However I realize there is an issue if:
> * patch 2 is applied but patches 3/4/5 are not
>   (it does not make sense to apply this series partially, but this
>   might happen when cherry-picking?)

Yes for cherry-picking and bisecting.

> * an entire DRM card is removed where
>   drm_bridge_chain_get_first_bridge() is used by some components
> 
> If both happen we'd have a get without put, thus a missing free and a
> memory leak for the container struct.

Yes, that's a memory leak.

> 
> Note that, besides drm_bridge_chain_get_first_bridge() that this
> series covers, there are various other accessors: see items 1.E.{2..8}

IIUC, without those items addressed, the issue we have is use-after-free,
but not the memory leak this patch introduces(without squash).

> in cover letter. For some of those there are many more changes to apply
> because they are called in more places. Squashing them would result in
> a really large patch that is likely hard to review and manage.

If the squash is done for each item separately and properly, I'd say
the memory leak issue can be avoided.  I assume patches for each item
would not be large.

> 
> So I'll leave the decision to DRM subsystem maintainers. For the time
> being I'm keeping the current approach given that Maxime already
> reviewed these patches in the past, not squashed.
> 
> Best regards,
> Luca
> 

-- 
Regards,
Liu Ying
