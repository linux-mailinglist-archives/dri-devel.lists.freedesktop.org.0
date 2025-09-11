Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCEBB530CF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B092210EABE;
	Thu, 11 Sep 2025 11:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Guoyul3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B141810EAC0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:38:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVpQzR6gX4wgznhUQOsNZOokcl+EUDHjE5UBtlhFnP5+2/RgbunQ89lyznWcrp8kOU27Vmkj8uSBj4UPB0KGHKk+/z3gfMhRtIBcHxFvSg2yXjBMBxZXkjwt1GX7t/m0qwM29hK/a5PjzJjMwWlhupooGv/X45JXUV6c0cRvWqZEHEG5FDsKhfhWbl4DgQrKswtEFvh7fbBzKK1TMtzuBuR/pvi5TDL7HF0VnNuzP3dlqPL6fro8of1x90H+q9sIDbb7yRIq896275/t3NJCmrLwozCy8FV5haLn9qf2x2J5cTFrzFQmMJZBWh0p2Ipu6XZJTNcIUrrDjJjwf3NFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubB9zz1L61YLYrsKGuGpOrlXI1sJyCpHxG8KI3nmEAc=;
 b=WN5ZYpR9HI2sbldR1c0mFGfyG3t6MlmYvJJlOeonYXUcKjZ4rPzY5tKHG5hoac0BNhAqa3E0r5riM5q1M8ghBB6hiWBMOBX3GZhzDxlWawRGfeuNJHRmQfKT4IcC0UWbO+gALfY8TtQFTDmMdGOQavuziJAYBgOZhNTKHHzRqmjPm63GdkufcoZXQ/soXJ3WuT2DUw2NXc9Gi2PD78aLcv7Hce6fusr79wqRcunmoJyNxBZJfUk8T0ThZ4q14h5/4JkPbxNjiSuqvb9Gf0cifhya+ZgGT7GGEtsrf+xxWMs95K2rG03UTqbMo/4sOn/V3chEQcchuJJ/WvMvuvKlbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubB9zz1L61YLYrsKGuGpOrlXI1sJyCpHxG8KI3nmEAc=;
 b=Guoyul3i4HNFD1Wsdo+IAzL+eLL/5WT+aYJE4L7Y/wGgnj2lOE2tdzL3j8rg6r+gV/kVC1BuMBJC33Sbx7E8yTAsezlo5dCxRaPwUQGeForjO4XP+kR6Bcfh2cpFErLx/KA32lqILUdCl3lHQWt8LwOpefxll5S/MFL+ZcD8IWwVCm5OOlnukbgZVNubZekKzCNHTo7h1HSEZh4TXx5qsxgQsZi/flZwm6fFf0PH+TEk+Yw75fl8n1XhzhTyXAj7OQ1kx+UpVAKWbJJxsCrBlaLOcdTfEEmYHbRQnGcYKXrHDuRddGYQgh4mn33wuHm3TGKWHcGz7QoJimdiJbm1ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by VI0PR04MB10317.eurprd04.prod.outlook.com (2603:10a6:800:216::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Thu, 11 Sep
 2025 11:38:03 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 11:38:00 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/9] arm64: dts: imx943: Add display pipeline nodes
Date: Thu, 11 Sep 2025 14:37:07 +0300
Message-Id: <20250911-dcif-upstreaming-v5-7-a1e8dab8ae40@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::8) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|VI0PR04MB10317:EE_
X-MS-Office365-Filtering-Correlation-Id: 857ebc08-33e3-4706-806f-08ddf127a949
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEdWbXpEZ3FzZHBCelZ2aTJHZHJmbU9YTTRTbHZ1OGZQeW0wNDhjY0FYSDdG?=
 =?utf-8?B?L1JVZjlzTVkyTEFLbEtzYzF6aHNyd0IrVDhWY1FmWWYzZ054VHUzRWxNeEE2?=
 =?utf-8?B?Y3hwMTlJKzVmWmp4WEVJczdob29xL1dad0VTWUxnZmdFeVZCaVBISVNocEZv?=
 =?utf-8?B?QlorR2ZZMGdyNS84djZPU0orSVRuWlZ6eFlpZEJwUVdjU0Q0MGQ4QTVLcjIw?=
 =?utf-8?B?ZG1xOE1CdDduUWg2bC9EdUdFMXJXWHlYTTFjekczRmVzRk05OVF4NzNKaUdP?=
 =?utf-8?B?TWt1UmxvYkoxS0J6U1d2M2xCcXpTYnk3VEY1SjZIWTBMOGRtRWQwUzArWGY1?=
 =?utf-8?B?eDNld2JZbm9VREExN2VYSXZWUVQ3Wm9iWkpta0htOG5NVzBBZFR6dUtPWFRI?=
 =?utf-8?B?ekRhSGRVamRTRWIyYng1aG5zQWQ4OTh1cWpuL296TG93b254c1lEbWlkUHRS?=
 =?utf-8?B?djJTK0ZoSElNZU9xQWY1RnFib1NjVy8xN2pVQjYwZm9wRFFlY09SZy9MSzJD?=
 =?utf-8?B?UEhFVEtTa0ZQNGFLWk9WeGRWTVg2cU5ZWVVzZVhxQUtyY2E1Z2hNY2NOWXJi?=
 =?utf-8?B?d2RibXpTSEZmMHl4NlhWYU9pMU1Kb2xPR1pJcWVpemdFK1B6RXk4SlVJci9i?=
 =?utf-8?B?V2xPM3dkWHlqbUdrMzQzOW5LeTQ5Q0tIdmpmUnAycHhSRFJsUGZ4NTdHbFpj?=
 =?utf-8?B?VnNqMDFPaWQ1Yzc1YmlhWDk2dHViWHV0VjlEK1ZmOW8wNjRKMjFqMDB5Rksr?=
 =?utf-8?B?MkVSU0I1SzBiS2lhNHppbUJiMjRNdE56SSs5Q01SZVJ5Z1p5dFpWbTY2SkpU?=
 =?utf-8?B?amVuUW1wSFN3QWE4eDhZZTE1bkV1SE1QRlVDTTJHSExkYVFKc3NDVE5CMXlF?=
 =?utf-8?B?RzNJaFRBeGxCUXdiVHh1ckM4UVIzQVJFd3BQZUNpYzdVamI1b1ZEZCtOMUor?=
 =?utf-8?B?NXlleVl5QUczUENSbDRIZGR6aXBGd1FOYVFFUHpQdTQ0eU16MzZPZ2M3OGtv?=
 =?utf-8?B?THFocjZFWU9IVkJ4Q3RLSG9vTFZ5bEZUT1pieUtoNWw4L2tZb2xSRDBtYWVI?=
 =?utf-8?B?dGhrc3dxb3V2UGg3TVhTS3dvL0tOdzZGNHlSS3Y1U3pIWkNOVkxTSlFrSklo?=
 =?utf-8?B?NzMxU1ZZeExJd1BnaysxS3NHQ0xGSXp3ZjVDUVlrc3MxU0RDRjMyenJGNmZB?=
 =?utf-8?B?bWhXam9jS09wLzZWZjZjSTcyUWJ2aktRdFhXMzErL1pYaVR3N08zc0w3dTk4?=
 =?utf-8?B?akxJNlNHZllRRGZUYmU0K2pKRzJHSzdxSjNpdHhjdXh1VWsrbFp6UDZJOEtU?=
 =?utf-8?B?RHdBVFltSEZHb2NxK3FZdWNXVG5rMWwyLzFndUIwSnVOOWJ5Sk9tV2tPR3Z4?=
 =?utf-8?B?OWJjMm1YdDdpbDNjVWlQMXhDbjFPanJHRG5xSXl6aWxVdkQzNTl5d0kxMCtR?=
 =?utf-8?B?UzdEY3lsakZtREhNaEE0VnlJRE8vcTNNRVRWUEowVU5DY0ZEVklWQkpsazlt?=
 =?utf-8?B?NFFFVnR0TXZycUJiRFlPMFF1LzE0SkVVZVVNQ0t3Rm5XM3JZblA3WlFuSDFa?=
 =?utf-8?B?KzlhVTc4OU5LdnVEOStmL25NZWl0M2FYNFBpTnZYdFFHRDV3czlMRjlyUGpJ?=
 =?utf-8?B?dFJzTzBta0hwWnRrTzVOa3dkQU9GREh0ay9wbXBZYUV5Tkhld2VTeE0xSHR0?=
 =?utf-8?B?VlFBRHpIVk5HVCt4VjRSNHhqNitIV0pCcFVScndOVGFFUmtRTFRuc0luSTRn?=
 =?utf-8?B?WkJNLzEzUGd3YkNxWTBiR083Mng0MXpBdGpML0pHWHFHKysvN3NxNDQwdlhm?=
 =?utf-8?B?bmd6N3RJbWdyaDVIa1NKSFF1OVNTbXB2YVp1eTZFQmxhcUQxNk9VUUxNMTN2?=
 =?utf-8?B?TXQ0YzRDVVBBSWhaS1RoTDIwOXYvR0liNWw4QkpDZmdNV1FYd1dhVkU3Q1dk?=
 =?utf-8?Q?184Q1/kxDi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEkycEpkSzRuZmVrKy9IRjhjVk8xV3BIUElBTm50bThEZVAwTUVBNnFHM1Bu?=
 =?utf-8?B?bUs3RUtZYXZpRmI4eXQ1bmFlMjhGWmVLTWdpV2hTRHZ5OEVZQlc2ZEI5eEw0?=
 =?utf-8?B?YXJDYUpsZ3B4a2RpeGUvTC9tQ3hjOVhPaDJrbEczRXd1QnZoRURxcFFnTkZp?=
 =?utf-8?B?YlBHWlVRVEdJSFNrN2M2TlhKMU9JekEzazMxNWlzekNvWFFYa2pjUDZTQU5F?=
 =?utf-8?B?dnJWUUJyWmRsc2w4WWZKaHRETkdhQVh4enYxbldVQ0VDNU9EYWxGV2ZmWUZv?=
 =?utf-8?B?bzFCeW45YTQ0NUcvMTkvTmg5bitxVUlObVYxRUxBYXhWd2pvRVIvNnBlMmpj?=
 =?utf-8?B?VitPejJ4WWNTNkR4Vk1RZlQ3c1JHM090YkdJMXJMT0l6a3N3cjNwQVFPQ0lJ?=
 =?utf-8?B?WWJWRmhMWkZ0YWg4VXhSR3VVZ0xaZ3FPWUFlbWtnVWszNWNCcXZnN0hzRlpX?=
 =?utf-8?B?OVovVCsrVVB0RzJzb0xBd3pudzFLWC9hMVJKYTQxTUlkcHZiRTZ6VFdTY1pF?=
 =?utf-8?B?T1ltWHBBUGRlaUJxQjJTRFJPaXVFb0IrRklWQm1aWEZ1S2lQOXJ3QWZ4K0Jj?=
 =?utf-8?B?UkNBWkFHbkhwbUJqWS9uMDlINmhaYkp1U2JJRkFBSndxUEFWTmVWdGhCSFRW?=
 =?utf-8?B?N2h2Q01PSWUrOG9vZFRRbHFOTnk2TGx1akM4anpsZm0vSmtTbFM5djFvMFpm?=
 =?utf-8?B?bDBEWlEybkpUMjRwaitwVlJoMTI0bGtoeHdNZEpHT1d3M2xKSFRBL1V3M0Y0?=
 =?utf-8?B?M01NSC9Ib3lzSHFEM09QNUZlWTd1Yjl6V3MwRitHQXJmN3J1OEM2MHlMK3ky?=
 =?utf-8?B?VWRhWDVySWVYNWRySHl6VFRETUszK2Z1ejRkSWhwTHhPUFFRa1Y1UXJZaGZz?=
 =?utf-8?B?Y3ZsVWJ5bXArOGdVUEc4ako1cDRLeW9QOWpUN1JNNjkzTjkyN2Vldm0ydG5Y?=
 =?utf-8?B?eDNJR3Badm9aeVFyNGFCczFXMjZzWXpkMFEzTWJYNTZmYXJYSS9ycS9SU0dQ?=
 =?utf-8?B?d2Vqb3JDczVMZUVlYmZSTTJWOHJFUDZyRHhBNWdDR3dTWC9CS1VCSlJNS2lt?=
 =?utf-8?B?NVBVMkp3VTlReFJiSlQxYm1RcndmT1AyQ1VlSUJzanBpcDBmYlNZeVFaVE95?=
 =?utf-8?B?czFYQ2YzK0pFZnplNllORUtXWC9kT25uOXlFamUxaXJDWFdjb0N2NTRDS1Jx?=
 =?utf-8?B?aWprMDJPTGY5cG9uakFUV0xaeHE1ZVk3a2Q3ZkZPR3paaC8vNmhabTc3cUxp?=
 =?utf-8?B?REh3VDVNNFFJZ0VLWkEwVE9Ydk56QVZuaTExMXZJOCt5amU4QXoxanNEeDUx?=
 =?utf-8?B?RXVDb2hwQTlxaGlwUnRFQ1VLcmIzV3VPcytjeUl5N2FsdUxBNldWM0tqWnd3?=
 =?utf-8?B?TERMSURWTC9iU0FET3dXZ214Nm9zSlpPejFhdThweWlHU3loR1owRDZRRFVH?=
 =?utf-8?B?SzZWSUR3Q3ArU2QzVC9XUVhyME55ODY0N0EyT21mcDk5TC9WSm1XZzF2SzNh?=
 =?utf-8?B?S2RYQzJwQ0hwQndMOW8xemI1Nk5VdGVhd1hEWEpUZkYwa1ozUlZQN0dNS3Uw?=
 =?utf-8?B?OTRjVlcrSUFlUFVVd3RHL0c1VXVTY3ZsZHNkZFdRdXc4eFZrUU9jSGZ0RWM5?=
 =?utf-8?B?Wk9sUGFSMHF1aFN5cllheFZIakFTdDlGeU9OSWtVMmFlaFJpYytFN2ZQN2Ry?=
 =?utf-8?B?UUt0bXUrajk4bHA5WnByNjdYZ3N4djNPM0l5NW5Ob3FRbitJT2FQV1RqWk40?=
 =?utf-8?B?dmMrT0FoTk1xVlJ0VTFWNTVtR2FxRnNlVjRzY0FmZ2p6VnpJNytSUjdtcW04?=
 =?utf-8?B?akM5SGR5U0I2TkpGUDRic1dYNTAxQmM3WnNXbFhmQmtLc3FBK00zTGYza1BC?=
 =?utf-8?B?eHZ0eWpaeXRPYnZ6VU5pQ1lxR2psSHRJSkZHUG85TDEveFJtaHFnTkZ6V2dp?=
 =?utf-8?B?UUtWUHhqbXB0WDBIVW5pY3lyL3Vpc1BxTVdVNnkycGN5bTlNaitxaGpDWVRJ?=
 =?utf-8?B?VjR0aVZmcWdBZ2tVRmNYOVprcUxwZ2l6T0UwWUtueWdPM2x2S3BNZ2diQjlD?=
 =?utf-8?B?d0N0cXJqQkRoYTNpTkp2cmUxMTgyM3JpM1BUMno1em9WVld5TXlIN0Nybk9O?=
 =?utf-8?B?WFYvQjNUWjdKdUU4N3VwNlYyM1plOWJVS2I4K3RYODAvNVZiSVVWM1F4cHBx?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 857ebc08-33e3-4706-806f-08ddf127a949
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:38:00.9115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0w/GtxWdgAyTQp0Sj9FLgB5RjNR5FU1bSV//YWsuGumrMyi/3sEvL62Jbqp3glFa2iLnfLTsxVHCNj04tI10w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10317
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

Add display controller and LDB support in imx943.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 53 ++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 657c81b6016f21270a1b13d636af72c14ab4f8ef..9a91beef54e8680a31db06b3afab4a20d780dc94 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -148,7 +148,7 @@ l3_cache: l3-cache {
 		};
 	};
 
-	clock-ldb-pll-div7 {
+	clock_ldb_pll_div7: clock-ldb-pll-div7 {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
 		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
@@ -174,9 +174,60 @@ dispmix_csr: syscon@4b010000 {
 		lvds_csr: syscon@4b0c0000 {
 			compatible = "nxp,imx94-lvds-csr", "syscon";
 			reg = <0x0 0x4b0c0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
 			#clock-cells = <1>;
 			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+
+			ldb: ldb@4 {
+				compatible = "fsl,imx94-ldb";
+				reg = <0x4 0x4>, <0x8 0x4>;
+				reg-names = "ldb", "lvds";
+				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
+				clock-names = "ldb";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						lvds_in: endpoint {
+							remote-endpoint = <&dcif_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+		};
+
+		dcif: display-controller@4b120000 {
+			compatible = "nxp,imx94-dcif";
+			reg = <0x0 0x4b120000 0x0 0x300000>;
+			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "common", "bg_layer", "fg_layer";
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
+				 <&scmi_clk IMX94_CLK_DISPAXI>,
+				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			clock-names = "apb", "axi", "pix";
+			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			assigned-clock-parents = <&clock_ldb_pll_div7>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+			status = "disabled";
+
+			port {
+				dcif_out: endpoint {
+					remote-endpoint = <&lvds_in>;
+				};
+			};
 		};
 	};
 };

-- 
2.49.0
