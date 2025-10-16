Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80DBE1BC6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94C710E94E;
	Thu, 16 Oct 2025 06:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GCo/RxPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB99310E95F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:33:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEFFOcl4+soVpRanSlR0OU6N4aCShlixedOleF9rWi9IAiVqmdT0XM6ZE6PrGYctFXF1FzUf9C1QIwk9GQPPVHvQO6rhDOhh5TBkFvYk61vc31mAJ/2zdFvbo7VIcx79ALOsbgJl7Iezmr/FhR7Isulg/drz3spKWFaArqbVs5UA7S3FYXzPqsaqf9so1PYb1WMK4HWvzMs1JN6sf4sTKuT7kLdPL0D6CpweY4NnucUbgSXm4NySQ88CHE3RnncZ6daohxsLZOLeaWr9yRapQdOhLIqP4J1/aOTYsdlhBpPhymDINoMNNmiQ0VpR+O5IpnWJtSsaKMXvcMUgUKS2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS6TF+u7c4xshNYyYM7oDUlz9q0Nj4rpnMipVL4m8cg=;
 b=moirPqXypGukqufhISn64k7BDh1Eyof18s/puxJgX5O0DJDZV5jIL+j27Xq3EmgwlGmP1Z5hVShKXlFiAQp9i3TAAkjoHZKr8/pJfDe6uqMa7s0HcOYbwA5xRzral2doPpSLboPzhevLHTj2Ppzm2pNPBBtxzFeAB9ohTva3ry2d0mi7UmyolVfL9wZdysDpTOoDkyVaTAxBrkdCpJR17jJwKfEUx/fWEYsupobt6zvcSkdaJSksod9HwDN/L0EAlL8P3BMZBzPCLY7EiaQDBN6wg0V2T0yWYbYfW5B/vS4HeQkRIqkLpysqLmqmr4feiLGlUL5T6eZ2XG/Sqtl2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS6TF+u7c4xshNYyYM7oDUlz9q0Nj4rpnMipVL4m8cg=;
 b=GCo/RxPmelhK7JGD8yqupXM6OacypPbefZRKYgwjJnCr9gIEzfzPySQ/Eha6lUT3mjo4UpOE5zUyvsngM27Ztun1YAMTbXPvU0BE0QOmBU+q3pUWKMK8XgnNGPAYibOhK/BLSauWC/4SCQDhFZWo065LCo37NGf16NwBrD2URlXhlI5F+71NbEOrrUR+janbw21orYnjy7tZrRSYyeuFXzKldVsNSg0Jif5R6KTpSL8gmxY4gF2IW8OonbEJGQ9tf+Urt9LLocHVZQPUMqestcD83lXqazmIQmx+SZBSWlGL4O2l/O4GghgMsxUHAUvahW7WPSM3Uiu7Bb/YFEnX+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:33:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:33:10 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:25 +0800
Subject: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
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
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: e895c4db-6e4a-432f-3f5d-08de0c7ddfde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGVFOHVVU0V0UVNrZVBCUFlPTWV0aFMzYSsyM1h5R3h6OG5wZ1VBeTlJTTNx?=
 =?utf-8?B?amdSRUdBTFJGM3dtN0lBRDN4Z2V0RHc5QUc4cDhDbUU2R2FGT0h5anV0U21S?=
 =?utf-8?B?RDlWVWFtT1J5YVRrUVZ6MHBqSnRYTlBlSFl5c0tIYjBRYStBQndGM1Bacjhm?=
 =?utf-8?B?OU5TazBpc1ViVTNoTndWQzBBWnJVNXRERXVqR1hMM3J5WnhyTFpycGZ1UWlX?=
 =?utf-8?B?TnRIUHdhWkN0bWpQbG9ZdU5mbE1UaGFSaHNaL0hvWE5SMm1UNXBlREdrMVlu?=
 =?utf-8?B?djFFY0pESmYzNHRGL1RaQ1l3STBqdmZQN0h5bEViU1hrTzJmbnVjRjhIcFlL?=
 =?utf-8?B?SUpKcUZIWXJiSk9Md0NwSnl0TEVhay9jVmJSSS93b1lhOEp2ODIxdk45cDdG?=
 =?utf-8?B?aks1VzBYZkxWUDFTanpZMXgxeEgyVHlsenkwK3hEUFZyTVF0VEw2eGNraklD?=
 =?utf-8?B?VWN4R1Y3KzhsKy9LZXIrbkltb3Vxd0dDbURpTUpObXZSRGhHdE5KbDc4a1Ju?=
 =?utf-8?B?NldSUXFEUDJnNnpIdEcrWTVWV2VQUDlqalN6MmxmNWM4MVM0eFM5bEljRDkv?=
 =?utf-8?B?V0lqNUpMcjFmY01uaVJCWW5Bc3lKT3dPR2I5SmMxMlpGKy9EcDFkOGRXb3Vs?=
 =?utf-8?B?eWdSVWxiaFhNTUVNV1hYMGIwRnFyd05uTXhNMnVubjR1S2lpR05uVm1pL2Vv?=
 =?utf-8?B?TU82RzcvRFpOeEZ3WUZEbXJOV1N5YkdMZkJ2eGRUVzFKOXhwSjVVU3A5UjJ1?=
 =?utf-8?B?Vk1rZnRONHdYSUpFRFNSU1V4ZFpINTRaYTQ1enpka2txcVBVM256VDV2U05x?=
 =?utf-8?B?R2lKUnVJaXc2NWxFUVMwc1BPL09lWHNQUGNwejJVQlRlL2hSOTF0SWJMS0pU?=
 =?utf-8?B?WklGSkV4R29KdStZQy94em1TeXZZVVM2cFYxdEVhS2k3V2pyMGl5a0UvNTZm?=
 =?utf-8?B?L2EreEh6eVhTSGVMN2JSZVJtTm45NHA1dlFMTU5qbDFzcE5VbHZZSzVTNnhm?=
 =?utf-8?B?VUVLeEpCeFhqallKN1FhSFdkVG9JYlF5Tnp4dU1qeUIyVTI5dko2ZElIczdY?=
 =?utf-8?B?Z2ZrOVdwZFlkczZhT2NCUTdLMnJUNVVWYkpYMUZ3dE9FYXJzaVQ3aTdrS1BD?=
 =?utf-8?B?KzNFU21BY3A2K211c29CUXhqbXRxeHNScEZnMjBNMzVOQ0VGRTNSVk5aTDNk?=
 =?utf-8?B?R2ZzZTBSOGlMTFBQdzA0aEVlQnhjd3ByRXUvWVlsNno0WlZ2NXNtUTlqYVZF?=
 =?utf-8?B?ODB6WTRkZDk4K3BFNVNOMkF6Ly80Wi9xNVNSaUVHcU9EdmhjWmxBZUlWTENR?=
 =?utf-8?B?MG9Keldab252ZzBzMzZ0YmpGTmcrTHNrT1A1TzJHWHY1ckVEbGpibHU1QVk2?=
 =?utf-8?B?Nm5pUUltY2JoSFlSUFdsYmZaVEpFTXhWYWxRQVZXeThFMHJkVUpkZEN6VjlV?=
 =?utf-8?B?UUNNTUlQOEtydjZRaFppTFJKOE1sZG0zUHkwZElPSWVWQ0lrTlpGMkNwek1r?=
 =?utf-8?B?YitZQ3RoZitaK0pDQnBlYVNsTWRvWDZDQ3F3MTQrNCtsTk9ZbjFnYS9XemlM?=
 =?utf-8?B?NTNvUlhxa3hBblhLRG5EK3BweUZKcExBblFPMWxlOUQ5YWJvNm5aR2xEdlJD?=
 =?utf-8?B?Si9SVVVTNEhoVDk3OUdIWEQ2bHhpd3huQy80YUFzNSsrMGFHNzJjOXBCSmRK?=
 =?utf-8?B?MzBNamRucEduMzMrWlVqMUJYd3ZWcUV2aVE3bjM4c3dkb2NUejEyVzBBSzhL?=
 =?utf-8?B?RXEwL3ZSQnpZc2tuYk5Pb3cxL0FHUFhxLy80MEVMbjRINExoSUlNQmJGOXRL?=
 =?utf-8?B?YzJoeDdpZ2pHdXVYL3o3WFl6ODJ2SmpSd0dpWVpGb3RFSUlZaWs0ZmNvYVNJ?=
 =?utf-8?B?cmsrZ3ZILzZMQjNDMXRDNmNXZllEUTlSbmlUaGZDWFlmYnByZnJ0dG9JTEhw?=
 =?utf-8?B?Sm9oOWxLWCtKM2NQL2UwV2FmaFNZSU0vOGNnY1pFM2g5VExFbW1uYVRCZlR5?=
 =?utf-8?B?TDNycFZFSmJ6cVNaY1pmSlhiV2s4Y3RwUXd0YVpxSGhZaGpKS3Bjd1FWelFQ?=
 =?utf-8?B?RldFdkdPdkpLTm81a2VWVThuWHo3dE9xanZIZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TklBU0tOR0xkY3dWZGcrNlAwVmpPZS8xV2lsY2UwY1hCQUozR1NIRjgrWFpP?=
 =?utf-8?B?VGE4bTR4MWJ6YWR4cnVOVFNSU0N6Rmh1M2NITktVN3BnMWhmZnhmdU8yMFRo?=
 =?utf-8?B?dC82amt4L3FUSitWdkRMZVpxVTZSNlVuck9HQjRYOTd1SWZCblRSVUNiU2Vt?=
 =?utf-8?B?UHNPMVRZbVVqRllrRVVPS2lOQ09Oc3E4UjlmdHcvNXRPR1FEZDJSMnE1WG00?=
 =?utf-8?B?U3IrREJtNmYwQ0lZNkxlalBzSUNHRjJHY25VVzlSdWpxV2ZDTk04VTVwdkY4?=
 =?utf-8?B?aUtlbGhJVmFRb2ZlN1RqVWQ3aHdRUGJUMXZpL3BXRGpDMmc0c281ZDJHenlw?=
 =?utf-8?B?bGRDV1NLR0YvbnQ3L3hnZ3JTa3htNmNPeVpiWHk2T0k4dU92UGNlQWRnWFV4?=
 =?utf-8?B?amtQdFZjNU5CakNBZ1p3ci8rODBXV0RHZDkyTU8rdWVqcG9ERjMvazV1eXhC?=
 =?utf-8?B?NVdWQlg1ZlgrNEp5bzFJb294OWZXMnd2VzBWY05aM0hHNnFQZTB4dWt3dnhx?=
 =?utf-8?B?QzQzN0h3aFJ1ZEUxbVZXZzA5RHQvMlVpaS9jdmdqaGt6YzE2aTZueVo3QnFk?=
 =?utf-8?B?aEUrSGg1U2JtK3dPcHliMUF3TkMvOWI3L1pIaVlsQWJoR1NvOUlLN2Q0TGhF?=
 =?utf-8?B?VE95RmpwaktEYWk0MHFoT0NlWWJTU3dTZjJ3MUJjK0xGNG9rRVdjMVpzL1Rx?=
 =?utf-8?B?eURJc095RWczTTIyVmUrRVl6K0JwZ09iL0lwdkdEWG54aXhUbmxjOTgxR0o3?=
 =?utf-8?B?NHRvMzhjTzdxVUpYZ1FiZHJmSXEwNGRacXVkblE3S0RCQlNJZ2Nkc0JJTWND?=
 =?utf-8?B?UHhLWXoyMHR4WDQxUlJWZStDQ3gxeXNETTZtZ2lma3grZkxkVjVNNGk3THZw?=
 =?utf-8?B?NG5IZ2dKQUw4NXNmMkowTmZ0Z1pFRGR5YitBMTVLT1FNeE9XYjdjZ2pTT09P?=
 =?utf-8?B?bVFyZTBmaS92Zm40bWNMd0YrQlYwSktIdDVIOEw0aU90a1lWWkdNbC8vMTZC?=
 =?utf-8?B?cWluSkdtOXFhMmxyNGJwZWUvL080R1FRWFgxa1Q0YzlFTXlaVjQ0OEtHMnRT?=
 =?utf-8?B?Z1VzYjNXMHM0Q2VEOUd3RlA3c250ZWl5anJPazF3RGErVVpRWjlxbEZ1VFVI?=
 =?utf-8?B?ZlU4TjBPZWNURGg0cm9admR2TnU0T2F1SThISUtEY2pQbW42UGVQSWxaS2Vp?=
 =?utf-8?B?b2JQV2ZPM01UeGRQVUxKL2JCYU1NUDF5VEdhcFBDdmIyWEZkTHpGc3ZOb3pl?=
 =?utf-8?B?d3Yvb1d5QUY1TjJ6NlMzRmE5MVkweEJMVFdzQml4Z1BCTVpBa3haUGxHNThq?=
 =?utf-8?B?VXBTZmY4bFVjVk9QZTdBZmF0SDlGcXFXVUk2aXRzS3VFNENrNDBKRy9GbWIw?=
 =?utf-8?B?RjNtRmt1MGdJMml1WFlvT1BqVU42S3NZakR3NHJBNkM0RGQ5Tk9NL2dkS2ZC?=
 =?utf-8?B?d0loUTN2VHJ6ZG9Hdmc3SUFidzJzdytpTXQyWm5Kelk0amVmWTZwMnBISlFD?=
 =?utf-8?B?Nm9GdUZqSXprM2tFdG11cUtjR2h3YkFxalhZbS9SekRiRktGM3JJWVYremVS?=
 =?utf-8?B?b2EraWRWOURFc0p1SFExQ21GNkJmaVBZb3dBUmlWQVJqL2hxTXB2RE1OSlhF?=
 =?utf-8?B?MS9ybmFIbGVXM1cwRmFrei9DNW0rWGttUGNQZVRRbVdnV1ZBVGdGUS83UEJk?=
 =?utf-8?B?aCtXYjRlb2d0d1d3bFA2eFVnTUlJMzdsNENjTU1oVjNIL1NUM253bUhLSnhx?=
 =?utf-8?B?VEJJamxKS29PQkxEMlBneDNCcWpneWd5aS91dWxpdURXQUNnSkQ2RTJhcHYz?=
 =?utf-8?B?SktuY2RmbDlFUU8vMHNxbTNNZ0d2WnZFS1JzUHFpem4rYzFVNU5mWGlQSkZi?=
 =?utf-8?B?L01BbytWQzFpT1dQdmpsLzVSYXkxeGt5eDNLc3JZQTAxcy9EbjBSR25IbWtq?=
 =?utf-8?B?UUhkVGRQTWdiN2gxSlpiYW45VEVlU1BaQ0diL01zeCtxS20zVWVDU2RYVE52?=
 =?utf-8?B?OUpwUlNQVmp5cjRYOVB4cW1MbWl0N01zVHFhUzZvMVRwK1VEWSs1Y01mMkxo?=
 =?utf-8?B?SzFseFBMT3B0ZG1rc1lSdlIwSGF2bU5TYWJVRUprMWlEd1g2b1QwU2F2WFlO?=
 =?utf-8?Q?GH9htBb1t+7mt/q/1JcXt/x8R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e895c4db-6e4a-432f-3f5d-08de0c7ddfde
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:33:10.3258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRzzhkcLxnVH7PSd+S6GzqTRBL0mGlg/vl2wGxGEOU/qTbzRtkO1vI+tTOM6ZO6ToywB2Y3/lTtXLqn2Wr3NwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9964
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

Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
It fetches display data, transforms it to linear format and stores it
to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
a gasket between the RTRAM controller and a FetchUnit.  Add a platform
driver to support the DPRC.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Call dc_dprc_enable() only when start == true.  (Frank)
- Collect Frank's R-b tag.

v2:
- Manage clocks with bulk interfaces.  (Frank)
- Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
---
 drivers/gpu/drm/imx/dc/Kconfig   |   1 +
 drivers/gpu/drm/imx/dc/Makefile  |   6 +-
 drivers/gpu/drm/imx/dc/dc-dprc.c | 466 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
 drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
 drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
 drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
 8 files changed, 523 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
index 415993207f2e3487f09602050fa9284fd0955cc7..507dc9a92d96be225cd9b10968a037dad286b327 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,6 +1,7 @@
 config DRM_IMX8_DC
 	tristate "Freescale i.MX8 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	depends on IMX_SCU
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index e3a06ee3ce1a5117d0a9a00fdf7655ee31be3caf..fd5d62783971d575cf18d3e27d742d91dee7623e 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
-		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o dc-prg.o  \
-		    dc-plane.o dc-tc.o
+imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-dprc.o dc-drv.o dc-ed.o \
+		    dc-fg.o dc-fl.o dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o \
+		    dc-pe.o dc-prg.o dc-plane.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.c b/drivers/gpu/drm/imx/dc/dc-dprc.c
new file mode 100644
index 0000000000000000000000000000000000000000..22fc7d8210dd2bb15fd15bc0f42c2dc2fd7f57dc
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-dprc.c
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#include "dc-dprc.h"
+#include "dc-prg.h"
+
+#define SET					0x4
+#define CLR					0x8
+#define TOG					0xc
+
+#define SYSTEM_CTRL0				0x00
+#define  SW_SHADOW_LOAD_SEL			BIT(4)
+#define  SHADOW_LOAD_EN				BIT(3)
+#define  REPEAT_EN				BIT(2)
+#define  SOFT_RESET				BIT(1)
+#define  RUN_EN					BIT(0)	/* self-clearing */
+
+#define IRQ_MASK				0x20
+#define IRQ_MASK_STATUS				0x30
+#define IRQ_NONMASK_STATUS			0x40
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR	BIT(7)
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR	BIT(6)
+#define  DPR2RTR_UV_FIFO_OVFL			BIT(5)
+#define  DPR2RTR_YRGB_FIFO_OVFL			BIT(4)
+#define  IRQ_AXI_READ_ERROR			BIT(3)
+#define  IRQ_DPR_SHADOW_LOADED_MASK		BIT(2)
+#define  IRQ_DPR_RUN				BIT(1)
+#define  IRQ_DPR_CRTL_DONE			BIT(0)
+#define  IRQ_CTRL_MASK				GENMASK(2, 0)
+
+#define MODE_CTRL0				0x50
+#define  A_COMP_SEL(byte)			FIELD_PREP(GENMASK(17, 16), (byte))
+#define  R_COMP_SEL(byte)			FIELD_PREP(GENMASK(15, 14), (byte))
+#define  G_COMP_SEL(byte)			FIELD_PREP(GENMASK(13, 12), (byte))
+#define  B_COMP_SEL(byte)			FIELD_PREP(GENMASK(11, 10), (byte))
+#define  PIX_SIZE_32BIT				FIELD_PREP(GENMASK(7, 6), 0x2)
+#define  LINE4					BIT(1)
+#define  BUF2					0
+
+#define FRAME_CTRL0				0x70
+#define  PITCH(n)				FIELD_PREP(GENMASK(31, 16), (n))
+
+#define FRAME_1P_CTRL0				0x90
+#define FRAME_2P_CTRL0				0xe0
+#define  MAX_BYTES_PREQ_MASK			GENMASK(2, 0)
+#define  BYTE_1K				FIELD_PREP(MAX_BYTES_PREQ_MASK, 0x4)
+
+#define FRAME_1P_PIX_X_CTRL			0xa0
+#define  NUM_X_PIX_WIDE(n)			FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_1P_PIX_Y_CTRL			0xb0
+#define  NUM_Y_PIX_HIGH(n)			FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_1P_BASE_ADDR_CTRL0		0xc0
+
+#define FRAME_PIX_X_ULC_CTRL			0xf0
+#define  CROP_ULC_X(n)				FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_PIX_Y_ULC_CTRL			0x100
+#define  CROP_ULC_Y(n)				FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_2P_BASE_ADDR_CTRL0		0x110
+
+#define STATUS_CTRL0				0x130
+#define STATUS_CTRL1				0x140
+
+#define RTRAM_CTRL0				0x200
+#define  THRES_LOW(n)				FIELD_PREP(GENMASK(6, 4), (n))
+#define  THRES_HIGH(n)				FIELD_PREP(GENMASK(3, 1), (n))
+
+#define DPU_DRPC_MAX_STRIDE			0x10000
+#define DPU_DPRC_MAX_RTRAM_WIDTH		2880
+
+struct dc_dprc {
+	struct device *dev;
+	struct regmap *reg;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct imx_sc_ipc *ipc_handle;
+	spinlock_t lock;	/* protect IRQ registers */
+	u32 sc_resource;
+	struct dc_prg *prg;
+};
+
+static const struct regmap_range dc_dprc_regmap_write_ranges[] = {
+	regmap_reg_range(SYSTEM_CTRL0, SYSTEM_CTRL0 + TOG),
+	regmap_reg_range(IRQ_MASK, IRQ_MASK + TOG),
+	regmap_reg_range(IRQ_NONMASK_STATUS, MODE_CTRL0 + TOG),
+	regmap_reg_range(FRAME_CTRL0, FRAME_CTRL0 + TOG),
+	regmap_reg_range(FRAME_1P_CTRL0, FRAME_1P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(FRAME_PIX_X_ULC_CTRL, FRAME_2P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(STATUS_CTRL0, STATUS_CTRL0 + TOG),
+	regmap_reg_range(RTRAM_CTRL0, RTRAM_CTRL0 + TOG),
+};
+
+static const struct regmap_range dc_dprc_regmap_read_ranges[] = {
+	regmap_reg_range(SYSTEM_CTRL0, SYSTEM_CTRL0 + TOG),
+	regmap_reg_range(IRQ_MASK, IRQ_MASK_STATUS + TOG),
+	regmap_reg_range(MODE_CTRL0, MODE_CTRL0 + TOG),
+	regmap_reg_range(FRAME_CTRL0, FRAME_CTRL0 + TOG),
+	regmap_reg_range(FRAME_1P_CTRL0, FRAME_1P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(FRAME_PIX_X_ULC_CTRL, FRAME_2P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(STATUS_CTRL0, STATUS_CTRL1 + TOG),
+	regmap_reg_range(RTRAM_CTRL0, RTRAM_CTRL0 + TOG),
+};
+
+static const struct regmap_access_table dc_dprc_regmap_write_table = {
+	.yes_ranges = dc_dprc_regmap_write_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_dprc_regmap_write_ranges),
+};
+
+static const struct regmap_access_table dc_dprc_regmap_read_table = {
+	.yes_ranges = dc_dprc_regmap_read_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_dprc_regmap_read_ranges),
+};
+
+static const struct regmap_config dc_dprc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_dprc_regmap_write_table,
+	.rd_table = &dc_dprc_regmap_read_table,
+	.max_register = RTRAM_CTRL0 + TOG,
+};
+
+static void dc_dprc_set_stream_id(struct dc_dprc *dprc, unsigned int stream_id)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(dprc->ipc_handle, dprc->sc_resource,
+				      IMX_SC_C_KACHUNK_SEL, stream_id);
+	if (ret)
+		dev_err(dprc->dev, "failed to set KACHUNK_SEL: %d\n", ret);
+}
+
+static void dc_dprc_reset(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
+	fsleep(20);
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
+	fsleep(20);
+}
+
+static void dc_dprc_enable(struct dc_dprc *dprc)
+{
+	dc_prg_enable(dprc->prg);
+}
+
+static void dc_dprc_reg_update(struct dc_dprc *dprc)
+{
+	dc_prg_reg_update(dprc->prg);
+}
+
+static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
+{
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
+}
+
+void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
+		       unsigned int width, unsigned int height,
+		       unsigned int stride,
+		       const struct drm_format_info *format,
+		       dma_addr_t baddr, bool start)
+{
+	unsigned int prg_stride = width * format->cpp[0];
+	unsigned int bpp = format->cpp[0] * 8;
+	struct device *dev = dprc->dev;
+	unsigned int p1_w, p1_h;
+	u32 val;
+	int ret;
+
+	if (start) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to get RPM: %d\n", ret);
+			return;
+		}
+
+		dc_dprc_set_stream_id(dprc, stream_id);
+	}
+
+	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
+	p1_h = round_up(height, 4);
+
+	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
+	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
+	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
+	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
+	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
+	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
+	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
+
+	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
+
+	val = LINE4 | BUF2;
+	switch (format->format) {
+	case DRM_FORMAT_XRGB8888:
+		/*
+		 * It turns out pixel components are mapped directly
+		 * without position change via DPR processing with
+		 * the following color component configurations.
+		 * Leave the pixel format to be handled by the
+		 * display controllers.
+		 */
+		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
+		       G_COMP_SEL(1) | B_COMP_SEL(0);
+		val |= PIX_SIZE_32BIT;
+		break;
+	default:
+		dev_err(dev, "unsupported format 0x%08x\n", format->format);
+		return;
+	}
+	regmap_write(dprc->reg, MODE_CTRL0, val);
+
+	if (start) {
+		/* software shadow load for the first frame */
+		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
+		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
+
+		/* and then, run... */
+		val |= RUN_EN | REPEAT_EN;
+		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
+	}
+
+	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
+
+	if (start)
+		dc_dprc_enable(dprc);
+
+	dc_dprc_reg_update(dprc);
+
+	if (start)
+		dc_dprc_enable_ctrl_done_irq(dprc);
+
+	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
+		width, height, stride, format->format);
+}
+
+void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
+	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
+}
+
+void dc_dprc_disable(struct dc_dprc *dprc)
+{
+	dc_prg_disable(dprc->prg);
+
+	pm_runtime_put(dprc->dev);
+
+	dev_dbg(dprc->dev, "disable\n");
+}
+
+void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
+{
+	dc_prg_disable_at_boot(dprc->prg);
+
+	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
+
+	dev_dbg(dprc->dev, "disable at boot\n");
+}
+
+static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
+
+	dc_prg_shadow_enable(dprc->prg);
+
+	dev_dbg(dprc->dev, "CTRL done handle\n");
+}
+
+static irqreturn_t dc_dprc_wrap_irq_handler(int irq, void *data)
+{
+	struct dc_dprc *dprc = data;
+	struct device *dev = dprc->dev;
+	u32 mask, status;
+
+	scoped_guard(spinlock, &dprc->lock) {
+		/* cache valid IRQ status */
+		regmap_read(dprc->reg, IRQ_MASK, &mask);
+		regmap_read(dprc->reg, IRQ_MASK_STATUS, &status);
+		status &= ~mask;
+
+		/* mask the IRQ(s) being handled */
+		regmap_write(dprc->reg, IRQ_MASK + SET, status);
+
+		/* clear status register */
+		regmap_write(dprc->reg, IRQ_MASK_STATUS, status);
+	}
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load UV buffer ready error\n");
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load YRGB buffer ready error\n");
+
+	if (status & DPR2RTR_UV_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO UV FIFO overflow\n");
+
+	if (status & DPR2RTR_YRGB_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO YRGB FIFO overflow\n");
+
+	if (status & IRQ_AXI_READ_ERROR)
+		dev_err(dev, "AXI read error\n");
+
+	if (status & IRQ_DPR_CRTL_DONE)
+		dc_dprc_ctrl_done_handle(dprc);
+
+	return IRQ_HANDLED;
+}
+
+bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width)
+{
+	return width <= DPU_DPRC_MAX_RTRAM_WIDTH;
+}
+
+bool dc_dprc_stride_supported(struct dc_dprc *dprc,
+			      unsigned int stride, unsigned int width,
+			      const struct drm_format_info *format,
+			      dma_addr_t baddr)
+{
+	unsigned int prg_stride = width * format->cpp[0];
+
+	if (stride > DPU_DRPC_MAX_STRIDE)
+		return false;
+
+	if (!dc_prg_stride_supported(dprc->prg, prg_stride, baddr))
+		return false;
+
+	return true;
+}
+
+static int dc_dprc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct resource *res;
+	struct dc_dprc *dprc;
+	void __iomem *base;
+	int ret, wrap_irq;
+
+	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
+	if (!dprc)
+		return -ENOMEM;
+
+	ret = imx_scu_get_handle(&dprc->ipc_handle);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
+	if (IS_ERR(dprc->reg))
+		return PTR_ERR(dprc->reg);
+
+	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
+	if (wrap_irq < 0)
+		return -ENODEV;
+
+	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
+	if (dprc->num_clks < 0)
+		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
+
+	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
+	if (ret) {
+		dev_err(dev, "failed to get SC resource %d\n", ret);
+		return ret;
+	}
+
+	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
+	if (!dprc->prg)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "failed to lookup PRG\n");
+
+	dc_prg_set_dprc(dprc->prg, dprc);
+
+	dprc->dev = dev;
+	spin_lock_init(&dprc->lock);
+
+	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
+			       IRQF_SHARED, dev_name(dev), dprc);
+	if (ret < 0) {
+		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
+			wrap_irq, ret);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, dprc);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	return 0;
+}
+
+static int dc_dprc_runtime_suspend(struct device *dev)
+{
+	struct dc_dprc *dprc = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
+
+	return 0;
+}
+
+static int dc_dprc_runtime_resume(struct device *dev)
+{
+	struct dc_dprc *dprc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	dc_dprc_reset(dprc);
+
+	/* disable all control IRQs and enable all error IRQs */
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_dprc_pm_ops = {
+	RUNTIME_PM_OPS(dc_dprc_runtime_suspend, dc_dprc_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_dprc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dpr-channel", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_dprc_driver = {
+	.probe = dc_dprc_probe,
+	.driver = {
+		.name = "imx8-dc-dpr-channel",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_dprc_dt_ids,
+		.pm = pm_ptr(&dc_dprc_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.h b/drivers/gpu/drm/imx/dc/dc-dprc.h
new file mode 100644
index 0000000000000000000000000000000000000000..f977858b57fec2f19775a97dc0baf011ca177c0b
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-dprc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DC_DPRC_H__
+#define __DC_DPRC_H__
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include <drm/drm_fourcc.h>
+
+struct dc_dprc;
+
+void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
+		       unsigned int width, unsigned int height,
+		       unsigned int stride,
+		       const struct drm_format_info *format,
+		       dma_addr_t baddr, bool start);
+
+void dc_dprc_disable_repeat_en(struct dc_dprc *dprc);
+
+void dc_dprc_disable(struct dc_dprc *dprc);
+
+void dc_dprc_disable_at_boot(struct dc_dprc *dprc);
+
+bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width);
+
+bool dc_dprc_stride_supported(struct dc_dprc *dprc,
+			      unsigned int stride, unsigned int width,
+			      const struct drm_format_info *format,
+			      dma_addr_t baddr);
+
+#endif
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f..17b9c4d0953d46be0a2cd276f06298d848fdcbdd 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -269,6 +269,7 @@ static struct platform_driver dc_driver = {
 static struct platform_driver * const dc_drivers[] = {
 	&dc_cf_driver,
 	&dc_de_driver,
+	&dc_dprc_driver,
 	&dc_ed_driver,
 	&dc_fg_driver,
 	&dc_fl_driver,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 557e7d90e4ea8ca2af59027b3152163cf7f9a618..93a8ce4e7c314770b64ccb631628b7e79648c791 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -74,6 +74,7 @@ int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
 
 extern struct platform_driver dc_cf_driver;
 extern struct platform_driver dc_de_driver;
+extern struct platform_driver dc_dprc_driver;
 extern struct platform_driver dc_ed_driver;
 extern struct platform_driver dc_fg_driver;
 extern struct platform_driver dc_fl_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
index b72bb9154642c388db912450f7e9db973bb7fb87..972cb7cfd840284654d3d02f75dbac59a53a9a70 100644
--- a/drivers/gpu/drm/imx/dc/dc-prg.c
+++ b/drivers/gpu/drm/imx/dc/dc-prg.c
@@ -19,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "dc-dprc.h"
 #include "dc-prg.h"
 
 #define SET			0x4
@@ -63,6 +64,7 @@ struct dc_prg {
 	struct list_head list;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	struct dc_dprc *dprc;
 };
 
 static DEFINE_MUTEX(dc_prg_list_mutex);
@@ -216,6 +218,16 @@ dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
 	return NULL;
 }
 
+void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
+{
+	prg->dprc = dprc;
+}
+
+struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
+{
+	return prg->dprc;
+}
+
 static int dc_prg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
--- a/drivers/gpu/drm/imx/dc/dc-prg.h
+++ b/drivers/gpu/drm/imx/dc/dc-prg.h
@@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
 struct dc_prg *
 dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
 
+void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
+
+struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
+
 #endif

-- 
2.34.1

