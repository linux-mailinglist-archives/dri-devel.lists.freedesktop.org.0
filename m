Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C17C0C664
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C5D10E397;
	Mon, 27 Oct 2025 08:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RD6zQOIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A761910E397
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jek7aN42bpX2DwvSDLgw527mc87S98gRb7/FLM0azENxQDG/uEm1V6s4ftTOU+6EYei+gpKcTw190qOC4LIAe/milslhePoN4LwLTGmB74U6KHUcqjSCyL9IvCTjj427OinCVgzdO/g/PTc/6unhH3u3KMCV56auqCjk8L1uvQ95CaZvFGoWTNXkiuLoUu8Cknb2pxG0gzKJKg1gvDScEhlqYGarwp8B71OHXCGKG5o36gk7u0kodb/yVM0MM5l+XecUcMMJHX+L3SGGV8nlpGpPm7JELRRD+crajqEhatFriSw3Rk3rXjn9ltvd7iIsXt5TosbJkf64CL5biOVd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKViD7boMA+PcfgbiE4vV1FbVkCB1EwOH7mJNr4frc4=;
 b=T88XlYCFEL53Yyjh1jdbaY2En9Q1saPaZuoA1ImdxACehcwM+ISM4E1ocqUNZKLFX7G6li/PpsC9fnfvXnajuDaBj63yjoaWA2prEU+ebmjG16cyP6F8fbqesbC7mfbso3UnF9kDJgAvmk4ftlg4vl0r8+gBnOP5HTB8Vh6Tu4AF2H6bQD8bBOM+Je5i6rzCRGz1MzjUhZg0IOH+GO3FyxnOhoKbugr8hP+/RkLPzkI+qmaWz/yoeTJhYFyJHfyiu35GVWiZ03g6oHPzQdQdVXA7Muh/ZttP7oJULT+rxLPnhbj9GozkCHetwntYbE5J7ewhCUkGTYe2Pdm0YChwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKViD7boMA+PcfgbiE4vV1FbVkCB1EwOH7mJNr4frc4=;
 b=RD6zQOIHZvtiy7C/VDwUKkY8qOrnR+Q2+V4X0kjnUfb1P9kodvRs06GF0AP3QWol4FC1BbfCluq6f0ZjtVqjlnCFfFNyspU75jNqK5okTLqVjMW5zoOfceEm16jA6ACXaFwp4HARuliksanBvDZt5dzi8QUjQTjKNJZziK1/wZ7ZUbmjSM32hx7iRCtUtudJxpIPF3L0/xdHSk90GXc3s12avNpgVK9QkiV09bE40a56fo12KIMY0FbmuEUHJf9i01TQ2wjC0J8jvQ9eicqFyTBylpKAU2QigX253BDeyoUbKW9P479AVVhbA8KyBfKEXwmG5HLfpeMz1wFo9c+Lwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8739.eurprd04.prod.outlook.com (2603:10a6:20b:42c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:46:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:46:49 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v5 00/13] drm/imx: dc: Use prefetch engine
Date: Mon, 27 Oct 2025 16:46:50 +0800
Message-Id: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHox/2gC/23OTQ6CMBAF4KuYrq2Z/tK68h7GBc4U6UIwYBqM4
 e4WEhUjyzeT7808WR+6GHq23zxZF1LsY9vkYLYbhnXZXAKPlDOTIA0UoHi8Do4T8lsXqnDHmoN
 0QYE1XqBlmU2LOMyVx1POdezvbfeYLyQxTd9l+r8sCQ68cBpBVWS1qQ7NcNthe2VTVZJf7uXKL
 0lmbsh6Ql+iO5tfrpbcr3CVOYIgsOBKIvnL9YcLEHaF68ypolLpAs8KF9fHcXwBdAefw2sBAAA
 =
X-Change-ID: 20250703-imx8-dc-prefetch-028e306591c6
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5b0838-2713-45f4-1a34-08de15355e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWFWWnNhaU4xMFJDck9yckFvQVcwYzBGSnJCcFRDOFpGT2IrRktEL0tCTVky?=
 =?utf-8?B?V0R4UnRnd3lrZ1ZUZitVYTdiUWFpNG92bXczRFVGcytGZWEySWxKdkQ3cDk2?=
 =?utf-8?B?ek9pYlpHZk9RTjBmRU9SRnRBVVFYck5KSVk1ZHlpb1owSnA2U2JZMlJrd1VH?=
 =?utf-8?B?eU9DNC9ZRXBMZUQ0UXVUeWsxS3MwcmcyZWJ5UEJiNEVSc3JMZCtRajh4U0M3?=
 =?utf-8?B?RkNYYTZMQ2tWVENIa1YzOFZPNGdtWENXZEVYamNGOVk5U3oyRHN0NkJaSllN?=
 =?utf-8?B?VXIyZzBLZVN5aVF2dmwyYmFEMnJGMncrNHpPbjRVZ3Q3VTBHZmtiWUk3U1kr?=
 =?utf-8?B?TkRGc1JQT1lrbVhOYzNTUTc3Q09pRlNYUk5kTk5KTGJsVVczQzN4OTZHbERE?=
 =?utf-8?B?bXhMc2V1cTJ0Z0RvWHVaK0dVOENTUUoyTFlscVloOFU3ZjVRUnhnMUJKc2M0?=
 =?utf-8?B?UkxXZDRLRnQyQ1JtMVNiYW91d1dCcEEybVovdVZmL05iNGxwTVl5QzR0dmNM?=
 =?utf-8?B?aVZoSUp6cW41STBYclF2bmJFWDBkRGF5UGlyVGV6SGsvVkFXdElIcVlKcHRS?=
 =?utf-8?B?b0hHYi84UXU1eUpPR2JOcjJKZmRYZy9jTlk5M1YrZUNsN3hNdk9sOG5vM1ZP?=
 =?utf-8?B?RnY2RFZxRGRSNmRycGNFTTV2M3lGZkFGZG9obVdGUFRsUG9YK0NFSHZRWkR2?=
 =?utf-8?B?V1dqQVpIUDlXaExWb3o1Vk42Rm00WllqSy9nSFI1YndOblZ4dkM0bWdNZUFG?=
 =?utf-8?B?ZzNhelVkYkwreGVrVTg1eDl0ajhYTjZzUjE5N2lybmkyYlZBRERrY3dSVU1Z?=
 =?utf-8?B?TzBRMG0yaGJ4aFZVenkxbEZaRmZYbmxSVDZUc3BUK0dVeTc0VGdOdHU1N0xD?=
 =?utf-8?B?bXJtbm4xRDh0Mnd3WGY0eHRjVkFHVmdyUHR2QzBCb2xJdlljTFpPMWpFbUl0?=
 =?utf-8?B?am9XZm95RzQwdUNXa2dmRDBSM3l0Z1V2akFQTmRNdTRZd2hFZ0FpNGdDVnFM?=
 =?utf-8?B?cEJ0TDRNSnYzRjRLOXh1SGVPRkpkdzY2WUJIa0ZXYThBSkw3N0tjbG9TSUdT?=
 =?utf-8?B?aDVVM1Z1b1lCUzhuZC9XOWY1UmFPcUYxMHdXeWl1RFBwc05EQlYvWEVPU3hG?=
 =?utf-8?B?VmRwN3kwS01qMU1yRjl0dGFMYUNQQ3hidWFzNWJzQ01RcFZabzBPSnFSdTlZ?=
 =?utf-8?B?QmFwR2wrYmlSY3B4UzRpdlhEU25EeDJUUDlzTkdNR3h5ZDhtTzFCMEh6TWZH?=
 =?utf-8?B?Vlc4OC9iS0JSenp5ajd4NFE2bStFRnhaaEpxM1dXZ0JJRWsvczFYYjQwSkVU?=
 =?utf-8?B?eVlhMmJiTHdLeFJhaGlKY3BPTmRFMUlSWm1GM2ZFQVF6d0NPQ3Qxakc4RGNP?=
 =?utf-8?B?VFpiZWUraEJITmlKMHRZYUFTNEtRbG9heFJIR1lRaEJaM0cwQndpbU9oOTBv?=
 =?utf-8?B?R0s0ZXYvMWdLUzltcGx4T3F5SEhRRjlJN2xtTklNaEVZRWRMUnZMa0dtV2p2?=
 =?utf-8?B?L3BHUmVla0hpdTcreXVzcWZxSEtuWklCTk5kdGNUaFdVYlh3ckNRZVpTR3BQ?=
 =?utf-8?B?N2gwMGFpdFNjRVcvamtrcFlsRXh5TGlicmdBU3BLWUs2U2VoYXg1WHg5Zith?=
 =?utf-8?B?RElMbFpzT0p3MEdEcUUxbHRkSHZldlVUVG02SkNZblpUbUR1UDdDOWR6ditm?=
 =?utf-8?B?bHBXTm96SDZhMnpmOUVlTXAvV3dQSkZnS3VLNks5dnU0UlFCSm0yeVdxdEg2?=
 =?utf-8?B?Q2FaMm00b3JsWkRzVmZ3akFGWElueUxXQkN3eFc3NWhPVmMrcHdBNitCcVlL?=
 =?utf-8?B?SUtjcTZlOStXcXU5SHVEa3ArdVVLUXB4akdkVk40SVowZVZFbXJmSUtwc0pW?=
 =?utf-8?B?Qm1oK2taWThHNjIzMjVDRVVKcVlwUldZTGJtcEpLR2VPcjBDM3BqVFpCeldz?=
 =?utf-8?B?K2N6TEtiZEVUbytiYW04NFVUWUVPT2tHVWhEeEVJS2NMTWYyUHlBSU5ESDJR?=
 =?utf-8?B?R0hSeWxuRGdaU1o3dVZvL0ZQcG0vMjhqb2laMVJJMzNYc1NENzJUbFpUclVS?=
 =?utf-8?B?Yjc4QkwwWjliN29yQW9QNVVsdE1HQ1kvcHdVdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TS8yT0lZczV4TGlmWGtXVWk3ejZVcWlKK2Q4OHR0Zmswbll2Mk9ySHo2WWFu?=
 =?utf-8?B?SFBQeWN3TFJPMjFMYVBlOVFvQWl2RklmaEVjd3FWVmxicG5OUFhuODQzdytL?=
 =?utf-8?B?UU5aNHpRc29OYUkwbDNYM0VBOXdxTkRkRGc5L0h3NmFzYmpiSVlBbGxWajMw?=
 =?utf-8?B?QkF4TWYyZlB0S1A2b3JmZG53S2Jjd1JLUFZxempVbmNvY29qalJQN0U2ZjVF?=
 =?utf-8?B?MHplZTd2QWorTUFoNytQZGFQak9FeHdXM2dHcEY3MDVSOGxZbjZQMlBqNjZj?=
 =?utf-8?B?a1VkQjFGeDFySTJaK3d1ZU1JQnZEdFVJdmVpTzl2SEo2KzJPR2phQ05CMDRU?=
 =?utf-8?B?STZQZE9Sd2RjS2IzNkVUZUJsZE9UOENjeWt1OWl0dk9ISFd3SkxwOWtpV0RQ?=
 =?utf-8?B?cHM4bk1kVDhFeHdPYjRyMGVKSXlsMGExa1BweFphdnBhN3JpejhRNEpycC84?=
 =?utf-8?B?VmJ3Q1d2QW9NMGsyaXJyQUpVRUUzQVhmeG1RRGttMmk2RjRmMzdJTjR0dXNL?=
 =?utf-8?B?QTEzWWZ1OStBOEIrMTR5Y1dmWnRzZnFXNldCZEd0d0JYKzRlbnZJdDhXUnRC?=
 =?utf-8?B?YkY5R2hOeXZwaDlHN1N4SzUzSXBiRTdWb3UrNUVkeHBhRDVsaEJzRTFKeDlw?=
 =?utf-8?B?OTQxb2VPdXp2clpwOXVyM2cxMVNpSXd1bGFPa2FzZFFsVG1iUnlwcnJCNks5?=
 =?utf-8?B?SmxrNWZrWWt2ZC9UVVo1RENQUVF5MzA4MFFVTVFjQmN5OW9uY3ZQRnVyVnFk?=
 =?utf-8?B?bFlVZ0NtWmdaYzhjQ21oM0hsbmQ0RzlPQmJVdVFaZmdMbkRjK3ZoQ2t6cldk?=
 =?utf-8?B?TE1ra1RFRWRRRWVwUFFVM3hsQlZjMFFqOVBMMXRJSnlFV0ZlbGtxb1J6cTNB?=
 =?utf-8?B?eXlub2pUaC9MYUJCV2hHYWMzdHU2eHVpTXV3VTJ6THUyUFZHM0Zibkszc2Q2?=
 =?utf-8?B?ZGc5Qll6Qi9NeUNCd0h2eHdHNHBJcFpaMElTOVB1Ly9sSVh6cG1oYmRmVVEv?=
 =?utf-8?B?NlFkbGQ2cmpuQWJIRW5GLzcvZXQ4MjVWZmFCUVZLTFFFQ21DeUwvWThsaSt0?=
 =?utf-8?B?S2ZyUmxPakw0YXFTUUIvQXJJRm5mOVhMc3g4MTlJYUExVFdPYmg3R3dCNnVU?=
 =?utf-8?B?d0c5NWNGNEZaZDlMY0x0dGNLNUEzUGNraWQweHpWMGlSVW5ydExSeHBYeWQv?=
 =?utf-8?B?Q1E1dllNSG1BNElMVXEzenJLMnhZUFBOYXdlTk9NM2RxNFBMQ0MzZnpmR0dE?=
 =?utf-8?B?bS9MelNidzN6K0xqMXdIZmkydjluZmttNGQwRFNGd0lDbDhHT0lUOEhCYXdx?=
 =?utf-8?B?dXViOS9Tb0pqUXlWN3BSOHFGQ2x0Ny94TStoMnA0TXU1QnlnNS9oVWpqUlpX?=
 =?utf-8?B?SzdPSFRBQ3FBS3oxTkZCbFZzYjZuQmhBR2JtbDZRYmtuOGRBd0FnR3RhYzJQ?=
 =?utf-8?B?RXFxbDFGd0lkeDZRUDlKdGdVbllFUTdtSWs4NnZPcXphMEJ3Ukw3MTE0VExC?=
 =?utf-8?B?TnpYdDVCR29pSnptckJZTC8zUEM5Q3k5NnRyYUN6eDlCL2YrTHFKcStmY1BN?=
 =?utf-8?B?TjN4cFZLYlMyS1hQSWF0eFZWQmRueXZMdVAzTlM1M3g3Vkd6MHBpa09oK2p4?=
 =?utf-8?B?VU4zbTlMd0dtRklHQW9WR3NNelRNVVZwMERwNktDNlllVDRPREVBQlVNZHJ5?=
 =?utf-8?B?cVdNQ3lqcWc4RjZnTTZzbTRHVm9lWFJnRmoremhLWWc1VjZWM25aWWZwZnJW?=
 =?utf-8?B?RWY0N3ZKZXF5bFM3S3UxaTdaYmdwK0VOSGtlRkRIaWFyZThFdGxxWm11Ynow?=
 =?utf-8?B?U3pKM1Fqc3FJb3ZDTFcrdXp5SUpCc0hYekRWeEZzVzNtUWM5c2I1dkFhbVhU?=
 =?utf-8?B?OVlWVEtpTkFqTDEzZ0tFVEx2WnB6Y1RPcVVxN2F0OVVVcmFsN1VVU0gySFdX?=
 =?utf-8?B?L011QTFTKzB0dktsNFdRQzZnOFNDWElwd2w5RzRZalJkQVk2bFFUTnlPK3hQ?=
 =?utf-8?B?K0szampLYnA0Q21VcTVIcm1hRktOdERzY2NscEdCQ0NJeDYzenlIZkI3SVZN?=
 =?utf-8?B?OTJiZDBHaDl2VFRPL2cxSkNadDhmeW1PR0pZclRqWW5KT1JZajRHZTJacjcy?=
 =?utf-8?Q?nW0COXKZ7hBFQymyBl/WV9nSO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5b0838-2713-45f4-1a34-08de15355e0f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:46:49.0430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exLLw6sPt5P1w9l9hc+o//AN1npYPq+sfzMgk9nQ3MK8oO5oct6c1H6lf7yNR+8Q295vOHH88MLGw2XJqbhnLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8739
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

This patch series aims to use prefetch engine in imx8-dc KMS driver.

One prefetch engine consists of one DPR Channel(DPRC) and one or two
Display Prefetch Resolve Gaskets(PRGs).  It prefetches data from
DDR, resolves data in tile formats if needed and outputs the result
data to FetchUnit(s).  When one PRG is used, a prefetch engine supports
processing pixel formats with one planar, e.g., RGB formats.  When two
are used, pixel formats with two planars are supported, e.g., NV12.

For now, this patch series only supports prefetch engines with one PRG
because it is enough for XRGB8888 which is the only pixel format
supported by imx8-dc plane driver.  Two PRGs would be supported by
future patches.

Patch 1 and 2 add dt-bindings for DPRC and PRG.  They were reviewed
by Rob[1][2].  I slightly modified the patches' commit message to use
imperative mood.

Patch 3 fixes FetchUnit dimensions as related to prefetch engine function.

Patch 4 disables CRTC at boot if needed to support prefetch engine better.

Patch 5 and 6 add PRG and DPRC drivers.

Patch 7 to 12 do preparations before using prefetch engine in imx8-dc KMS
driver.

Patch 13 uses prefetch engine in imx8-dc KMS driver.

[1] https://lore.kernel.org/lkml/20201207165945.GA430214@robh.at.kernel.org/
[2] https://lore.kernel.org/lkml/20201207170206.GA434964@robh.at.kernel.org/

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changes in v5:
- Squash MAINTAINERS file update into patch 1&2.  (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com

Changes in v4:
- Rebase onto the latest drm-misc-next and resolve conflicts in patch 4&10.
- Sort bits and bitfields in descending order for register PRG_CTRL in patch 6.
- Cc Marek as stakeholder of the driver due to recent i.MX95 DC patches posted.
- Link to v3: https://lore.kernel.org/r/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com

Changes in v3:
- Call dc_dprc_enable() only when start == true in patch 7.  (Frank)
- Collect Frank's R-b tags.
- Link to v2: https://lore.kernel.org/r/20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com

Changes in v2:
- Rebase the patch series onto next-20250922.
- Collect Alexander's and Frank's R-b tags.
- Manage PRG's and DPRC's clocks with bulk interfaces in patch 6&7.  (Frank)
- Sort variables in probe function in reverse Christmas tree fashion in patch 7.  (Frank)
- Link to v1: https://lore.kernel.org/r/20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com

---
Liu Ying (13):
      dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
      dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
      drm/imx: dc-fu: Fix dimensions
      drm/imx: dc-crtc: Disable at boot
      drm/imx: dc: Add PRG support
      drm/imx: dc: Add DPR channel support
      drm/imx: dc: Use TCON operation mode
      drm/imx: dc-ed: Support getting source selection
      drm/imx: dc-lb: Support getting secondary input selection
      drm/imx: dc-ed: Drop initial source selection
      drm/imx: dc-lb: Drop initial primary and secondary input selections
      drm/imx: dc-fu: Get DPR channel
      drm/imx: dc: Use prefetch engine

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 +++
 MAINTAINERS                                        |   2 +
 drivers/gpu/drm/imx/dc/Kconfig                     |   1 +
 drivers/gpu/drm/imx/dc/Makefile                    |   6 +-
 drivers/gpu/drm/imx/dc/dc-crtc.c                   | 191 ++++++++-
 drivers/gpu/drm/imx/dc/dc-de.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-dprc.c                   | 466 +++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-dprc.h                   |  35 ++
 drivers/gpu/drm/imx/dc/dc-drv.c                    |   7 +
 drivers/gpu/drm/imx/dc/dc-drv.h                    |   5 +
 drivers/gpu/drm/imx/dc/dc-ed.c                     |  27 +-
 drivers/gpu/drm/imx/dc/dc-fl.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-fu.c                     |  49 ++-
 drivers/gpu/drm/imx/dc/dc-fu.h                     |  11 +-
 drivers/gpu/drm/imx/dc/dc-fw.c                     |   7 +-
 drivers/gpu/drm/imx/dc/dc-kms.h                    |   7 +
 drivers/gpu/drm/imx/dc/dc-lb.c                     |  23 +-
 drivers/gpu/drm/imx/dc/dc-pe.h                     |   2 +
 drivers/gpu/drm/imx/dc/dc-plane.c                  |  46 +-
 drivers/gpu/drm/imx/dc/dc-prg.c                    | 320 ++++++++++++++
 drivers/gpu/drm/imx/dc/dc-prg.h                    |  39 ++
 drivers/gpu/drm/imx/dc/dc-tc.c                     | 114 ++++-
 23 files changed, 1497 insertions(+), 30 deletions(-)
---
base-commit: 6674f54b21a6b20f8157426bd0ace3e249b3e4ba
change-id: 20250703-imx8-dc-prefetch-028e306591c6

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

