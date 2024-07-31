Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60460942608
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 07:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9115510E1F0;
	Wed, 31 Jul 2024 05:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d2GR5ecc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011020.outbound.protection.outlook.com [52.101.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB0C10E1F0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 05:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5oIcty7EnN5gu284utkbv6lGO87TxIT7b6/Bnvqg8vYPUAmxF9vu3gHlMfaBkG1NVfR7L5ZerrJDLT8gJmL7Z1+YnJBQleDWYjYkvjmKuW70qqNNEBz9Ryl3LeeONDoyDmgEzyuBCZmiziuVM0pNtAXG5XWZKHfYiLTP7JwNvTYWnHPZApfo/ZCOhZCjn0KaIWD3zqN+9X8ysiYDlvLOCq0I8eAkeaN7w97bHk+tKWMYMjXdnwYBTX7xeGj3JjQ0NJ6V0TzWW2iuYwK873eW5KZh52d+SUkTrwHihSDkaB1VflYJpht3hCU+dYUtCo4/8Z8hvfPvg9lW1Pe06VQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZUylqxx+I/ezKkHSP1Cif+I7Kmg2WOMzLnlq/TjuVw=;
 b=KlPQ1/cbUxzBCsUJUWdtS/DMHjU3ADzE2P7Iqrsgyd9+5D3tyHXfsMyxxdwYh8YS/hF+3YYKYfdIlH0aeuzUfnn/Zr0wERGANmxBPb4Lfal1f1T9CAEYAvy4ftTdLwhvoJQAA9XAOnUDFORctNl3TmkYIqNgP2Y/idtAP6lAI4sGJSGLfj4n4bYMC+gP0gaRMcWjFa+0R4bo8x5I8d7EWowaviNePRbREKUb8N5qCPsyn7QZVGthzBsmHzQ93a99MfeKAlXBdzSDhbkZOFG6oLN3a1IEthNBgr44wzkG8w5XHQZ34nIHPQoKQ421fLXKgBhk+q8saeTdWzactZv40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZUylqxx+I/ezKkHSP1Cif+I7Kmg2WOMzLnlq/TjuVw=;
 b=d2GR5eccqBFoEJwChCot6b/eERADcLGhNWZRoQmE16pqwRTJvmYX22jYd1W9NYQlfpqCzcaP38A4hD4pOzCErfegU+oXqVoc0mARoFMSTNLHQkCixtG7xidkopMSr9hZ3Obx1E14Dkifiy+UlMj1S5fXsBLj24idamHAPoAyXnZjsrzdppEEwGZPGh+87dF0QXsmhgCrAehxZLHT5Cv9WzmDajvoyezn9ylgLULpeCyCUUgSloxDBLmqsV0GGfvvUTmAYQOMXwSU2uxY7ZfB2p+cD6sRAEVJu0ofBwf9cZ+PQMip4TaLWDJPo7T61x1drK7P1HIPGKwbPsN3t0unTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7446.eurprd04.prod.outlook.com (2603:10a6:10:1aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 05:53:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 05:53:24 +0000
Message-ID: <887b1baa-6a71-4a1b-85c1-7b3b0abbccff@nxp.com>
Date: Wed, 31 Jul 2024 13:53:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-8-victor.liu@nxp.com>
 <ibdzow7lvbimaefrp2z2aolgp4pytpq3dcr2y3pegjavvknhgm@2e6j3f4zytqp>
 <107d89b9-e7b8-4613-bc07-9af7b52c2b8a@nxp.com>
 <0e7a8d52-6556-4531-882f-73513f99259b@kernel.org>
 <81afd7ef-c4a6-49e8-b232-8007a25aaf51@nxp.com>
 <edf48813-3e2e-4fe2-b2e5-80f68ef0172f@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <edf48813-3e2e-4fe2-b2e5-80f68ef0172f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:196::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5da0d4-168e-4c02-3a74-08dcb1251750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGRFZi9lNGxWYkc1TnRXK0Q3aVluOGUzWmIyek0zOWVSVmRzbjVpUDRkak1z?=
 =?utf-8?B?UU4yQ1FFQzhjbzB2QU1sOWZjT3ZVK2lzVGdDajJrR2dSeFBaMksyUjJpaUxk?=
 =?utf-8?B?Sk1ZaTU0NmFjVzAxVU9sOGFWZmRrUnR1MnM3STdSRVZneGdUbGRjZ2VjRTd2?=
 =?utf-8?B?bUx2TVFiZktFelZjSWVhS3NNbGQ0ZUM3MFhQajB0bHFhbWRlNk51UytEYjRq?=
 =?utf-8?B?cys5RzFqTWl5eUMzM3RCaUJkcXkvOHdKUW9EaFRzcFZlU24zWGZuRWkreGN5?=
 =?utf-8?B?Y2hKeWNqZlJPWndsanpkd2FqWFFoYTBoTUJZTXJnOWNmcU9TUjFwNjV1V2da?=
 =?utf-8?B?dWNXOWc4Y1hHVE5NU0hhRkx5YzdOYk9Fb3hRQ3p6TUNLSmVNMnRYajg2RTB1?=
 =?utf-8?B?SVh0eGF3TWhvK292TGJXMHFQL1lyZXVweWw2ejRTT29rUlBRT0dRelNMZ3cz?=
 =?utf-8?B?MXJCSGNpTmpRTE1OMTNFai9BV2cxcUtTSUNKLzlsV3VpZ09wZlE3eXhJV3J1?=
 =?utf-8?B?QWJtbjUwcFVDR1ZuVnQwL3l0WUtFbzBmMDM1VlNEMWxoSC9nRVR1M2lVREo4?=
 =?utf-8?B?NjZNSmxDMVB0eHJTVCtNZ2NJK1FCd3RPcHBycXNNRVRON2k2dm00ZjVNQnl0?=
 =?utf-8?B?SjR5VGluanhSM28zRnJLRmhjbllQZnhqRTZKV0t6dk9HRXVNQlZzTkNwblFY?=
 =?utf-8?B?K2NyMkpQclBqTDkrek9PV2RFVUcrNUFXNTNjbkFpdnh4T0hyTXBYb3AyMlhq?=
 =?utf-8?B?T2FpM3BGY1lHOGR6NUR4aitKdW1wbmZJSVVXK2RBVnRZWmlJeHJtYjF4bnR4?=
 =?utf-8?B?djZOenRmYWdqVTVGeGFrVEw5NlJDQmxFVktzdE5SY3h5ZGR0NTgyNTBVS0c2?=
 =?utf-8?B?WkRzQUNZQlhZRUozandLK3NhWE9TYjZUUEg1NEd4RzdSOFdYd3YvR211TE05?=
 =?utf-8?B?VG42eTZBalNmZUkwOUtCVFBvUFIxLysyWFNWeUNxUmd5SEFuOUxORlhKYmtz?=
 =?utf-8?B?R1hTT0hlaUhhejdEb0ppeGxxd1ZXUjVXQnl3Y09MbUZFOTBROVVjcFBDRkhu?=
 =?utf-8?B?WURiWXFnVzR3RVNOSVlkNjBKazYvZmVjWVZnWnh0L0xGYXNPVGhXcmc0Ny9M?=
 =?utf-8?B?R2ZCbUxCYXdaRjhXYnZEa3M4Y0VyV2NVVzR1TTFZS052MlREY0htNm55eDVE?=
 =?utf-8?B?U1crQ0FiQmxCL2ZuNXVwNFJUOGpxc1RsV0Zla0tRR3h3a240ZG5idlcyY3Fm?=
 =?utf-8?B?YmlKY3VVcjJ2NUdmeEdZS0Z2RzRuSnNrTFRlZm9PSEM1Sm00WDE0Mi9abWpF?=
 =?utf-8?B?eWV1cmpVbFJWdnJ4d0JpczdUY1ZIS2RXbm9jN3lEVWNJTXo2dUlKQkNNd2Ns?=
 =?utf-8?B?Yk9KY3NpSFB1MTU3TlFyR3lTN1JJcTR1SFp4TUV6bHdoRTJ0WmlnR2lIWEs1?=
 =?utf-8?B?VlZGTk16V2xpR2hNbThFTTY3clpPQkpIME90ckd6QXdYbFdIQlNJMzlIREVa?=
 =?utf-8?B?d0xOTGNtb3hJcTIzSFJLdHVvVUtRT2dsUTQyVFFoMW0xR0haSnZvL3F6Z3JQ?=
 =?utf-8?B?VWNBNTQ2UUFla0hCaE05ZDNRcUthOFNYV05XQmRtamZVYkVYZnlaVXVFTkhM?=
 =?utf-8?B?OThGcjM5THJHV1lZeXR0R2tSYXJOR3BqNGdMcnNvak8yWVlNMGlmaGFPNHIz?=
 =?utf-8?B?Q09xV0ZNQXF0d1pEdnY4NW0vRll2emRhbGQ1R05xU0p3MEFaZ1JVUVozcjUy?=
 =?utf-8?B?eWRROGd0YVNROEE1YmFrZGtIelhWUzBDem5NOUo2YzBLeERZUkhQZWtESmxE?=
 =?utf-8?B?Q3RnTVhaSERHUWtreE9VQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2NadENocGxiS3dZUEpHK0VWcmZibnlqYzUxVS94dFJ3ZTlVd25zVzNZZVI3?=
 =?utf-8?B?Y1YxdDFuc0I5SUpvNlpnRndDbnU4U0lwbm4zVlpIa3VzN3BuTE02YUtpSXZL?=
 =?utf-8?B?b0k5dXBxT05uOUNEcUQwR1ZNQk1vVXhac3crWU4xM1FqTlNyU1NYVk52R1d4?=
 =?utf-8?B?OFlHdllTK3V2cVpoSGR1dnRsQ1pHYTNqai82U1ZFVXlmMExGYlZnWWhoRVA4?=
 =?utf-8?B?aU5yNjd5YUhibXNZckpkYzM2R0c0VnNyQWErb1BCL3N1WXk2Ylg4Z3RGb3lm?=
 =?utf-8?B?c2VTUC9DdU50RHpWNTlxcDRsQ0gra1BIUjgvc0Y2bWRVNHR0SGpqWHFWMzBP?=
 =?utf-8?B?TkM2RGJSeVc1RjRKS0N0NURtaDZRRHZVNDBEcmJyRjY4MHlPQTlEWElhK2or?=
 =?utf-8?B?ZnFPUHNkNlhYbDNxaFEwamsrbDUvNElPWVRXOXg5ak9zQVlRMDZVK1NOaGIy?=
 =?utf-8?B?aEZiS0tqWFA0WDZPZXNFMDBBeWU3b09tek16QS9IUThsMWg5Vno3ZHZWaGR5?=
 =?utf-8?B?eTJEc1RTbkRwak9ic3cwTGY4L2w0K2plenRldTJZYmJQV0QxWEs1bWkyT25w?=
 =?utf-8?B?eXJhck5JdEQzT0huT2Z4UzZvZFlmc2M4U0dlK2ZBckVCQ2F1cXVuRzVCVDQw?=
 =?utf-8?B?eUhKNlpCdVJMSkRoRjNWUEhkYmtveGo3TFFkMzFJVVMyYm9kY2NHNXExMktt?=
 =?utf-8?B?V1duNm9mSXd2R0thN3RyNXNKT2VYRFNpM3EvSkk0alJSNXFJdk4vcDdEek5J?=
 =?utf-8?B?YUNLejc5NjFpMitRZTZUdjZlSk9HbWR4YzYxaUJqZEdPNnNGYmVJQ1FhVEVh?=
 =?utf-8?B?QUVTNWNNd2FRN0lpdFV1YUxSMkNpWWU0RjVzbzk3bGpQYnhLUWpXV05malpM?=
 =?utf-8?B?TE1CMnJ4MFdlWXluaWFYbmxmaG9tNlpVWUhpQVRnUEtKUEl4aGRjb2UycEhJ?=
 =?utf-8?B?ZENkOEp6TGFOeDBnSjJOQWMwb1JwMG5XbXNydXh5NEJJaHhxcXBYUHQ5b2No?=
 =?utf-8?B?RUREaDhuYk4zc00vcXNpa0hqYXQxaEZnV0t1QVU5c0NGd1hEMWFKY0R6NXRW?=
 =?utf-8?B?VTZBYUV5Nk1GNU15Z0Jac0o5aEtCOTZVblBZeGZNN0VLMkJQQTBMUURQc0FB?=
 =?utf-8?B?VHA1QXBOanhQY2wwRXBkMHZqQUZuSmhteXNIL3BIeStOcHQyS0ZsS04zbGo4?=
 =?utf-8?B?QnZJRE5wNk1GWi9qb1g4amZiSmZneEt6ZWc5TityRHI4a092TGhSY25VbGV5?=
 =?utf-8?B?c0N2SGZPYUllNUNIM0VCVkxDcFAvSzBiNG14d0pCQTVqWklOWkxxVDVCMWJw?=
 =?utf-8?B?cnh4NkJGTGNsOGF6Y0l0QnJ4bWpobEhJTVdIVXE0dHdhM3oxUjAwbTV1dGVS?=
 =?utf-8?B?aWVtTTk1REJCZVRxaGdOT0RyTDY0T1BHUjdnUGtuMndiSllndUVEMkJLVWhp?=
 =?utf-8?B?VkdxdGhGb3kvejdrQWU5cklpV0RJYmRRQUN1UmV3L01Tc1luNlJ3Vk1FYTVB?=
 =?utf-8?B?QUxPcGoxVzdycmlVUzNwZDB0MTI3S1Z3dU1FY3NOeXNuR0RIbkZnQXNib2Vr?=
 =?utf-8?B?clg4NCswNmtiOFNMYWNxWU9FWmV5U2xoLzFIYVN4SitOZ05hSkUzL0FnT0Jt?=
 =?utf-8?B?YURPRTgrVWlGZVFFdW1QbFpTVTVqdU9wV09EcXlad0NqK1ptR3gvM2N4Vk5G?=
 =?utf-8?B?Uzk0L3ZaOXg3LytVdjlDT0pDSVkvMjhXYURhN1Z3cklUMWk3dkNPTVVCZ2hX?=
 =?utf-8?B?ZEgwcWg0S3M0aDR4SDVFQ0pVUks5TURsdXpVNlU0WXpWRXFPdFJRemVjZXZG?=
 =?utf-8?B?RHlqRFpBRHFqYVB0MlBYU2RGbENsWU0xaHpxY1gvVTNBV0pKeDFERnlyT3Mz?=
 =?utf-8?B?Um5RbE9HQ21yenJYQmk2RU0vVG5DUkVkelF5QXFOTE5BdkQyakVTMFFmWFhK?=
 =?utf-8?B?ZEs1dU5vSTF6c1RldXMyK2IvZm1pczJRajh3b0NrNHlXeVlxRmk5MFhBbXUv?=
 =?utf-8?B?dlUzTjNwREE5WVZOSTEzMGFnVEk2NFhLUjdLT204VzVaMVhGTWFwVGhwYmFN?=
 =?utf-8?B?eVRYa3pGZnZKZmZyN284TlBwaWlrS3BUOGZsMlBINUdDU2djdUlYU0F3Tjg2?=
 =?utf-8?Q?Wl113hcCiJwwUSE10mlL2HDBc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5da0d4-168e-4c02-3a74-08dcb1251750
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 05:53:24.5087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQi8FNS9bs/5RBhx478E8Y6zk8spekMCrIzljw8KSnnHtFbpYGumsON6AQzCu2hqn1SLF4xyIl6eenpLhR7tbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7446
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

On 07/30/2024, Krzysztof Kozlowski wrote:
> On 30/07/2024 11:42, Liu Ying wrote:
>> On 07/30/2024, Krzysztof Kozlowski wrote:
>>> On 30/07/2024 08:55, Liu Ying wrote:
>>>> On 07/28/2024, Dmitry Baryshkov wrote:
>>>>> On Fri, Jul 12, 2024 at 05:32:34PM GMT, Liu Ying wrote:
>>>>>> i.MX8qxp Display Controller pixel engine consists of all processing
>>>>>> units that operate in the AXI bus clock domain.  Add drivers for
>>>>>> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
>>>>>> well as a pixel engine driver, so that two displays with primary
>>>>>> planes can be supported.  The pixel engine driver as a master binds
>>>>>> those unit drivers as components.  While at it, the pixel engine
>>>>>> driver is a component to be bound with the upcoming DRM driver.
>>>>>
>>>>> Same question / comment: create subnodes directly, without going
>>>>> through the subdevices. A lot of small functions that would benefit
>>>>> being inlined.
>>>>
>>>> Like I replied in patch 06/16, I can't create sub devices directly.
>>>>
>>>> Can you please point out typical ones for those small functions if
>>>> the comment still stands?
>>>>
>>>>>
>>>>>> +static int dc_cf_bind(struct device *dev, struct device *master, void *data)
>>>>>> +{
>>>>>> +	struct platform_device *pdev = to_platform_device(dev);
>>>>>> +	struct dc_drm_device *dc_drm = data;
>>>>>> +	struct dc_pe *pe = dc_drm->pe;
>>>>>> +	struct dc_cf_priv *priv;
>>>>>> +	int id;
>>>>>> +
>>>>>> +	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
>>>>>> +	if (!priv)
>>>>>> +		return -ENOMEM;
>>>>>> +
>>>>>> +	priv->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
>>>>>> +	if (IS_ERR(priv->reg_cfg))
>>>>>> +		return PTR_ERR(priv->reg_cfg);
>>>>>> +
>>>>>> +	id = of_alias_get_id(dev->of_node, "dc0-constframe");
>>>>>
>>>>> Is it documented? Acked?
>>>>
>>>> Like I replied in patch 06/16, I can add aliases nodes to examples,
>>>> if needed.
>>>>
>>>> No Nak from DT maintainers I'd say, but I hope there will be direct
>>>> Ack(s).
>>>>
>>>
>>> It was not Acked, because there was no documentation added for it.
>>
>> I may add aliases nodes in examples in next version, if no objections.
> 
> Example is just example. It is not a documentation. You must explain it
> in the binding, e.g. description.

Ok, I'll explain it in the dt-binding description in next version.

-- 
Regards,
Liu Ying

