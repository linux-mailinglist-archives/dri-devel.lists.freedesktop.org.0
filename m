Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1768AF8D5C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2884510E9B0;
	Fri,  4 Jul 2025 09:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="H/m7xxOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AED10E9BF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:04:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ST279EY1ptF+dPl3nMBrjr/Gbmia4mTqkwXmJpDj1pX/cwI8l5BOeFuhPz6T9qzTUcAQ9HS6wUR0UUlrehy1xFChU7awHqzoa159QN6qf0kSxg0T7n+4aZlZHGi6T6CzvRSGf1Yx8OZVp+21sfSAi7/oFh2olrmtI3E/vL6HqgGHF9VqK1vCuZsxKCPLC1/dZHgJiCOPnfg2TKJW5Cesm9anIucuwUFnrqbbvtDu2oJnKWTTKwo1V0P59LCMMPMcVzzNYrWrZyL3gWD04Pis+Ar47qctep43F4SsZDtq34ACv7DNxMiCmzBXPt7oUN9xfIJgRuy+INS3Qg1ya/0NuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mr06ahcyfLHgow0xn8I40ztEASnRndXjkX77UKVuXKo=;
 b=AP1XsBlF3rR812psaa31osD2a552RpBS+RfsNoaa9YP42fsYvcmahit/jtErAgTwz4r1cMjpaW9LstviVPLMHUx6EANDb5qySNviWb9ZuIOYEV2D5pua+NPqooyYLZcBlcGIEvJ6PCY2HwQyj9rICxiY5GF2pxNDog9ZuDpBg2IQsjI85wo4TkuAySAWpoxG7o4oyc63hbyk9Y803QsCw7PXb7NIBDMM23rBpoUlfKZkHGDzOJUHa+7cRyfSos9RJjKwOkosdlJ8nBF6t7CVyLFMWo1sY9Sk1St88NDl45L3LflkveBWCExtHzsN0NTEe5hefkPv3UYH7AumVscJGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr06ahcyfLHgow0xn8I40ztEASnRndXjkX77UKVuXKo=;
 b=H/m7xxOmxKKUV5z1uoq4kix3pQw3pu4a9TpV7Tr9HbIAji7uyKdpVGGDf33+P5+8H/OjFKH54Y1E4jOhBIrEIy505WIzukjrZHOYQFS5hrmRIxhponBfofu6n19Av+FhLilqzW6WRm+rGU0EU8eV6O9gq9uzOZ3VYKaWkfhjv0crFc/ejUAxdWslkBjgPWYSPki62r83gDe2xyFKd7iGlEHkIoOSmn8Qy8i2t9ljgbnSs6m+6RD4sYVC8PYEMIoqehP8+sKibPqclHrCQsGdIRTs4kKc8Y2BaZZVb3+L/17LA9QNCUPoBZtWJ7TFxP9cyCeXkQq6VyjJbkmmWCqPkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:04:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:04:01 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:59 +0800
Subject: [PATCH 12/14] drm/imx: dc-lb: Drop initial primary and secondary
 input selections
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-12-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB11011:EE_
X-MS-Office365-Filtering-Correlation-Id: 002584e8-c162-47b0-e4a8-08ddbad9b810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmpZY0NSOWZUR2RYMkt5dHVMeWI4Zlp3NWJmOHBldndZak5SVzN4Q2tkNzhN?=
 =?utf-8?B?K3k3S0d0NmNXUkozYm56dnZURjNPRzJVbWlSU3hZRzJVMlZaSU02dVNKVFdB?=
 =?utf-8?B?bTJPc1ZUdGFXOW02R3FFbGNsSS9XQWJSYkJRL2JOUW9KNXRXTklnK0Y2ajJB?=
 =?utf-8?B?d2E2SCs0a1dReE9lQkowdUlwQkwvRjRhSkkvclZDWWIyZ1VmaXBkZ2RYa1Z0?=
 =?utf-8?B?VlBYVlU1akFTTFhTTzV1TlJjWThqV2UrTTdqNm9JcWZabkRVc3hYVDFHZkxT?=
 =?utf-8?B?RlkzMHpGbzJ6dUZ5NHlodXZPbXpWZ3ZhQVFmbG1uK09QUHpmY1Fvc3NLRkZr?=
 =?utf-8?B?WE1pWFhHVlV1eVhPbjFWVUFnK0Y3LzM4OHAvREMyeC9uSDlUemJRR3c1V2Zi?=
 =?utf-8?B?MzB0SktQa2wyUGhYWVcwbms3Q2FvUjB6a2RlRkdwejNUNXJiTUlzWi84UVk2?=
 =?utf-8?B?ZEh6U3RCN0tFOHRKSVZYamYwRVNhTlAxTnFkSWFicDZ5US9EUGVGdVo5ekFw?=
 =?utf-8?B?TytzaWtidDNqQzdHZHpWa2p4dkdEYXE2UDR2NWsyay9jcmRqTkdHdWN4TWkv?=
 =?utf-8?B?b01iY2Q3Nkl5S1VDWHV1Vlp1N29ScTFRYXR1b2kwQXFkUyszNnZTNTBGY3JT?=
 =?utf-8?B?Z2xPb3lrK2k2dkN0K3k2dG1jQmhVY0pTODFnTDh6VlkxeEd3ZFhMUmF2Z1Zy?=
 =?utf-8?B?c0h2a0w0N0NDcndhQVhlUlV1OHRwV2RPazNGb0ZBZ1lUazBHeDRZbVJnMlMy?=
 =?utf-8?B?WGlrSjlWa0trNDcxTjBONitKNzBIV3FCM1F2UVN6N3dnbXNjMzNneGg5RUJP?=
 =?utf-8?B?YXorMk4zNjlMc0NPdEIwWTJnSUlxdUV3bHRpTi93b3hUblB0aE9yUjBEYWRj?=
 =?utf-8?B?MEFsMEJTSUUrai9hRHpob29JS0RGWW8zbHN4c2x4YjBFNmVGSzZDeEpKNEpR?=
 =?utf-8?B?K012WjZvVkNBTm10U2k5N0dVVW9vT29VbVR3SDNWVmZYeU5LOVRhV2FHWU9W?=
 =?utf-8?B?SDFoNDFtMnFUTlhxOG1RaWlDam9vRVNucGtuWG54ZGRyZTA5bFIvOFR1TjE2?=
 =?utf-8?B?U2t1Ni9Jcm1qdDhybW8yalRmNnRoVVFIZ1BQRzJ5UWhsR0lUK2d1TFVGM01S?=
 =?utf-8?B?RnhoU1NrQzVMUGlaeXdYQ0xraVBjMElCbFEvbktXTXRXMytNZndtVnBrbzlr?=
 =?utf-8?B?bTR2T3IycUpTU3hpeVFXdkM3enRVb3lXV2RYL1YxeWZTTE9YNk9JZ094Z2Y5?=
 =?utf-8?B?QTFFNEVOQnB6NGhMeHM1dUJuK29ESjRWQ0lnMVBkbWxDaThCUDBsRm9iNE1s?=
 =?utf-8?B?Z2xKUGhqWm1DL2x1UFIvR2JrZTFtSXc3WjJ2ODU3R0d3TDYzYkdoV1BJVVBq?=
 =?utf-8?B?bEJtYUFkUVRwQnNmZ0tqd2lLVlA4QkRXQUhJU0tWR09XZWFjMTR0cVROR2pX?=
 =?utf-8?B?OWNXdjkrclBuMUdwYlM5eEpSYStlZkJra0dKS1BHY3RjWis2TWUrWUJQOEVH?=
 =?utf-8?B?WUpycFZ0Sy9RVktOL2FLNVpuSWROMVltR3F4U2dWNXlvbys0a3pjK3dwZW53?=
 =?utf-8?B?ckI3RXpVQlhWQitpY2N4ZGZmbVpZcmdxOXNjNDZhVXdXR01STEN0YklNTVht?=
 =?utf-8?B?SlR1TVJaVmlTU0E5YzgrRWVteUF0UDdMQzJtMlJLakdGU3lUMlhMeVpPVnVl?=
 =?utf-8?B?cS9jY2t6dHE1dkpUUkZDNklHM1VLQjlYSklEUmlBQ0FMUkdGZG4waSs4QWEx?=
 =?utf-8?B?MHB3Z1dJMytnbWMxNzM5UTRYMkpBaGgzUktrZmxWaDhWNXorQk9kOXJLMnh0?=
 =?utf-8?B?ckpLUm5MSkJBQkhGR0IybE5HVjlkNkQvTFZxdjFRdGlIc01VS0tUaTFXK29w?=
 =?utf-8?B?Ri9HM3AyZ3liZnA1enhRK2VSeWVrLzVvcU4zd0NHNmJ0SEdKTlBHV2xTeG1P?=
 =?utf-8?B?RlkycHgyc01GaVhqN2M2dWpnUUpiQmQ3ek9vZ1hFemNUUkhFUEZQUXc0ekN5?=
 =?utf-8?Q?puD0DmcI4iQ6Awo7nEhUL85kmgu+pU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3hNMzBzQldVOGVid2VTSXN5T2pWZHFKZHNldDFWcnl2SlpQa24xN2tSMEpy?=
 =?utf-8?B?aWIwc1ZzeTBkU0YybE5lbnVxd2JPbEVxVVBteGdDVEtueHBEbWFDOTBBTFNB?=
 =?utf-8?B?Ynd3NjZjNndUS2V6eTVWRkcvQnlIYnhHTDRWbndnbUduQnQ1RTA5TVB5dEZz?=
 =?utf-8?B?L2JTcU9rNkpXK1VNUzFTRWJSYTJTbE5YYmlJazB5SkpCMHhsdFdQMnoyNVpO?=
 =?utf-8?B?cHQrNUdrR2kzOHNsaW92cjVTZGFZUUxQTXhrQ0RUMzg4Nm9ES012bkdTckZv?=
 =?utf-8?B?UjdOUXU0U1lXdGJIUDNlTFZ0aEw3Z3Rsd1V0MmhhSmxGN2l3YzFTMk9UWUtJ?=
 =?utf-8?B?MlNyclVLVnlyQkg4SUhFUEVWd3VNdXpxcUl6ZGxXTVorVXRYZDdpY0dBYkRD?=
 =?utf-8?B?T2UyTzdvMnVTRzhpL0lKMUxjeFFmM3FEekhWWkVIRlN5N3FjK1oyRU9qZTQz?=
 =?utf-8?B?Ny8xMnFZR09UNStidXpvODZGdTdzc0xaZ1dxMTlSMjd4RDNaR1lXc2lFR2xY?=
 =?utf-8?B?bXRrNFU3ZCsvYWY1MUYyYlNucm1Ha0FLOSsyN1Z4ZGdQZ3plK3p4akhCMW5U?=
 =?utf-8?B?TW1xTnpVaVNDbXNHdW03VGRpVE9BQ0QxWmtBd2owZ2FhbWtRYnpaMVJWNzIr?=
 =?utf-8?B?ZkZDQUVTMnM1djBtVVVqaURNTVVVY2xNSFI2b3lzc0ZNT0pWM3FReWdHd3Z0?=
 =?utf-8?B?L2d6VXJDZ2dRMjF3dnFaZlpkMnExZ0pLb0hSam5ndEZES2picUN4Z28vZWhD?=
 =?utf-8?B?VHp4R1dtc0JIdTl4TFlQV241NjFBRUNQU0NiY0w1eW9Ld0wrR1d0MUtjNVBy?=
 =?utf-8?B?Z2o3NGJmWFc0cDZTcG9VL1YrZjdncVFWbERiTDhDWUtvejVhZTB2bVVLSTNx?=
 =?utf-8?B?SzJxTFhFMXc2ZS9la2FST2VMallPLzNmSG5rTkYzRUt4ZlBiTUUyQ2kyQVZt?=
 =?utf-8?B?SHlxSzZvQWNRdWpPQi9oYW8yV3RBMStHbFFqYnJyOUVjUG9OWTAxU1V2NzZp?=
 =?utf-8?B?UFBFa2VYTFNyZjg0Mk1UeW1HV3JxWlNYaEE1WWU3OVZncE1uMXgrV2FKMjBm?=
 =?utf-8?B?RjZMbUFaWFY2UGd6L3dGVDQ2NEtnaHFMdG9WYnQyNU5YMVA5UW1Iclpkemg1?=
 =?utf-8?B?aEtnMDdTSElncE9tY283L2Y1T1EyTVV1UWdpQTlTdzd4TjlQcjc3YTgwcjVr?=
 =?utf-8?B?RlpHTDRjK1E1cS9kZmNKSjJlY3ArRHhsa0RiQnhLYzg0ZlFsMDZLSVhlMGNr?=
 =?utf-8?B?NUpabkNNQmUzaHp6dnhQM25JTTl5TWdsWDBuQ0JrQXo4Q2ZlN2YxR0IyeVVU?=
 =?utf-8?B?YTk5ODgxZGJ3dHJ3aURpQUd3ZXRaS2hIQ0FlRFRjT2V3U0s4Y0lOdDlzcU00?=
 =?utf-8?B?Y1Z3aHF4MEhtSVpFOGdqTHdWVHloM2pMTUJuTmNRd1Zsby9GR2kreCtHNFRu?=
 =?utf-8?B?QWw2RDcxZWRGSHRZWmdpUlFsSVNHSENqT1UrNXl6L00vUlAvR1lHaWMzdDhL?=
 =?utf-8?B?RFQxN1BsakZqYlFnMjRJcUJtNWJPMUMraVBXUlRqNERYR1oveDl5YVJkdU1x?=
 =?utf-8?B?WjN0RUVUaVNRTDFwWjNzWHB4R0tlQmkvTHJrbStvTGtQSDJXTitBN0NvWkJm?=
 =?utf-8?B?ZjFnRFBFQU5KTndHS00yWFN2eklTOEtxNEU4QnAzMnMzbTNmeUY2Wmh4cDV4?=
 =?utf-8?B?S2p5aGhUQmw4WUNOZGREREZlemM1YmpSN0VYUisrekRRL0R4cER2ekN4cVFB?=
 =?utf-8?B?TkMxYnlFcDRzWm5kbmRwcXBibUlWL3NhS0tibnRxTTFxbVR5aW5icERoT3hP?=
 =?utf-8?B?Z1RYOEdaTVFKZFEvZEhsb25CQmNxVmhCVDkvQzlzK0pwSWVibmhzcFBJNTI2?=
 =?utf-8?B?Q3QzdGxsUStRWWU5RnZZN1IzV3RMNVNpWG51WkVYNUhpakU1MlozUWNibzBN?=
 =?utf-8?B?Z2pnL0dMVjFWM1hCRllBOG1OcG5aVmJRVXhQL0tMU2k5VitacmpxcW5EQzRh?=
 =?utf-8?B?ZityNXcxd0hUYjM4RVpjOTNldWk1QUJRYlRHTExDUGJzdEJqak95NzhkcG9s?=
 =?utf-8?B?MDFBWHBxMXg0aHB0eUY5c1ZuZmk2ZHl3MFNiVEJ3ek9MRDc4bjZXNERmQnA1?=
 =?utf-8?Q?b64Q7tNQeJKdSHwizdUI1wWLU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002584e8-c162-47b0-e4a8-08ddbad9b810
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:04:01.7656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Scd5iJ/96q27QBtal9jxm6Vrx5X7gGC8BXmrUm+HSs56NVo2wOjP38eBmsGLTle8oUR9jJmD/V2NkLcwwM96wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11011
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

It's unnecessary to set initial primary and secondary input selections
because KMS driver would do that when doing atomic commits.  Drop the
selections.  This is needed as a preparation for reading LayerBlend
secondary input selection when trying to disable CRTC at boot in an
upcoming commit.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index b0f3fb818799b58597e8ae41d868338c3fd40800..d0a805469ae79d467c7e71ebf75e1befb80e15f3 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -254,8 +254,6 @@ int dc_lb_get_id(struct dc_lb *lb)
 
 void dc_lb_init(struct dc_lb *lb)
 {
-	dc_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
-	dc_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
 	dc_lb_pec_clken(lb, CLKEN_DISABLE);
 	dc_lb_shdldsel(lb, BOTH);
 	dc_lb_shdtoksel(lb, BOTH);

-- 
2.34.1

