Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546EC2CC0F
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8A610E431;
	Mon,  3 Nov 2025 15:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cMXKMMP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B8B10E42B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:32:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etrNdMZpWIkHarRlMCb6YjP1zYFvb4tHNPNCwMYc7/vn+np+u9pFVKZQ5omio99HNWcPFnJh+fhj+cHeJI9CgC6VvzaJHuTJ7d1P7B9ohIHDwjjp8be3UUlGGVTDr0OC0DZ/LsXNwSqLhLsBxA+5rNTDb1aQipgy01/iDC5kG2qozdzQIe2eVFmEr33hq/D+ngTzlMA7dvxO02gyHb0IqV7hmNAaQ4oMiKcrodeNT7KeRkTRJoiFDpAAu5+EFPSqcRUuFjepd/0in/hyGfdmqExeen2bE3wAMl1eGY32a4km8cakIDWDjez83E/9vTf454E5QAcupeYGLNEJScpn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGiUlQY6dmIjKILe1KV7IC9eh3m39BVSpZ9cBG/0IlE=;
 b=NXYnu+je2oprwK9x7v21c1IfjunIlTHhvlseGlOsEgjyfqb/4T7I7TpQEAbl1MHVDp0c00b2uFP1Ws5MSeOmdCOaisvHY8uH0hdpIi9jBhEx+NcAZHWiCRV/4GcDRBHaeTMQWo1z72qZTawAelV2Rrv6NfFOg3U9B1cycnhO+JdxxHnbOyMSxMcbmoHfWZImJgq3XiE5w9ZD8CUCQOW8rBfIIEVKs3mYnAUPIWOMrE/qEoNLTMAIX4T+qVsuY5zsI+80yzLP4rphL7d06BQ4bZtZcnmav6hURUwhlXo4CFlrraFQUVR+I+AkARnEaxhBamlHczuYMHNSMpEzWhQ9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGiUlQY6dmIjKILe1KV7IC9eh3m39BVSpZ9cBG/0IlE=;
 b=cMXKMMP48RgjreEPcDemuCMSzJPuTXBkpUnOgxcHCXEm3CzeewyufcPicQAb4EXosaWkQErgeLcIq3FEeiVb6M+o/YBifbwttzFdr5jpJOc+Z3Af8ygVL3tBk6rkcG1x24auICRaYGcWWL/LWNqX9TK5wFuC5Kf1KYHtbFs+iLrav5CzlSdTiHNiTzL6rW2DYOVP+qT0Uy9Fy4EvRSWJvABVBQkXNUXzAThEIss7ymTKnutKYZjJYUyeVxfQwzJWb28P91R36NkWvv8US6MIepja2qypBIUxOzbD5D3WRSrqovcHfqkmxypS9jE8znNB7D2bP02yFAA6eSjGg7LR9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:32:37 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:32:37 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/9] dt-bindings: display: imx: Add i.MX94 DCIF
Date: Mon,  3 Nov 2025 15:30:48 +0000
Message-ID: <20251103-dcif-upstreaming-v6-4-76fcecfda919@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
References: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::6) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU4PR04MB10500:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d71635-521f-4452-c4c4-08de1aee37a3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHlYeHVpT282bjNoMkExamJSNUZPQkZFVSsyVGZ4WDhPeDZkZkh6ZXFZMlNo?=
 =?utf-8?B?QWcxejJXWnNUMWwrdElIOWRRNVNtT05kS3d1U1BGMWcwSUVjeG5TNFliOXAw?=
 =?utf-8?B?SFpaMFNjNWE5WldVMnhwS21mT3lxUkdTK01qOEFYcy9JV2J4U2ZkTEszaURj?=
 =?utf-8?B?L29DaGtzT3cyL2FHdEZEVXRlb2RFZHkvNHFZU0ZYWnB3SElTc1VFOWdEaEd5?=
 =?utf-8?B?ampoS3RMVVFCRG16M2QrS3FNa3ZiL1RUTjRaMlVwVGhMYWdOamNFeUF2bkZJ?=
 =?utf-8?B?WUFLa1VRYi9ZaEJmOWJWQk1QVUpnTHdFekFjRm9kMnIxM0plelpUS1E2bDdE?=
 =?utf-8?B?US9PUXk5eGx4VXFKYjRWYkJlWHdONTlTOUpBYkgyWldkTGhKMmZyeFJZR3hB?=
 =?utf-8?B?ZElCQW9Ra3F3RjZKME1YbDVIWWZRS205aTR1V3RoQm5vNnk2S01wNnh1RkVq?=
 =?utf-8?B?SEdWaTkvMnJ4YkRKdlMrRnlzajRibUgzcUFzaEhTYmhuaFNrT3RNRWtlcVVF?=
 =?utf-8?B?LythYWsrNFY0K2g0TUg4SUczNHlEVitxbGtNdzM4bmNaSkpuZEV0dmk4T2Uv?=
 =?utf-8?B?TEpvUngvR3FzVklSVnlCMkw1WlgvV09CMUltZ1QwcWFHVklNVnl1ZDNrcDR0?=
 =?utf-8?B?QTZnNkF4Yi9tbEYwRFl0WmpDUWZSdXRGbjg0aGcxOHZwTjBQaS83V0NkVUo4?=
 =?utf-8?B?N2g5NGNLNWNPVllpMWVpd2NOYS9QREt6OXRUQTh6cWF2dzVoU1ljSVB6YjQ2?=
 =?utf-8?B?WGt1K1dGR0JpUFIreEswejgvd3Z2ajVZTkhrUTh6QmQ1b2JVVEhVdFF1QmRF?=
 =?utf-8?B?UHJRVU5jRDZhZWs4QXNhZjB2S0JnNUoxQ0xTcUNwQUVRRmJ5bWcwb1kraVNt?=
 =?utf-8?B?eFo0d2lVTjdNdEZxMi9KSDdTTzFWMndaQk15N3JIZDVqYWJDNy9BZWhGaWhV?=
 =?utf-8?B?T3JBVGkyRzNYNG95MWMxZGFUWk9zdmxLV1lMeFMraGcwNkVyU3VNNGZMREdG?=
 =?utf-8?B?eGZzL293ZVRVeWxkdmVmUnBnc2MxYWszNDBZUGZTVDBIb0VQZE1RRkZCS0FD?=
 =?utf-8?B?Y2l6K2hFajlSeDFDQVR0YWZZRnQwMDRhTDduOUJ5aGNuM0xBKzFlMmYrdWZT?=
 =?utf-8?B?NEoxYjdKaDFmOGxBYXBlRU1xa2VGM1ZSek9FRFVQTll4cVEvR3BzN3Jlejdl?=
 =?utf-8?B?bDJ0TmszeGNUM2x4cFRXNFQvWWlQMm5xdnFQakpxRjRGcGxOTnRoaTFMTTVE?=
 =?utf-8?B?UXI3cmluOGNmT2o5cHVFUUtPRThXdFhEdHlQeFpoZmZua0hVRmdCTkhocXVR?=
 =?utf-8?B?QnUyVEJMcHR4bTBrb1ZZWXlpZUdYaGZHNFpQSjdQMFd2MUJnTnlMTk0vUjVM?=
 =?utf-8?B?alRBMG5ZdHhUSEt5STBLeTlWTkZNZHZGVTBjcnA1T2MyalhLc2V4RDIwYjda?=
 =?utf-8?B?MnZFYkx4NGR6cVJrQmJOakhBN1M4R0dkWHZ0Z3Z3V3R0QS9JblBMWis3YU1y?=
 =?utf-8?B?d1didGtQdUFqdHNVSE9HQVVtK0F5NGcydnkrMENlaWZjY0JlWHI3VnIwSXdL?=
 =?utf-8?B?dEVDZUxmZnJTRmVmRGo1YytGanFNMGM4ZkZmK1poS2gzRE1ELzUrTDZHOS9H?=
 =?utf-8?B?Q25kVDZESEN3bm5yNnc4dnJjekNCQ0dBZ0pWUHFiTjNrcndEaVlURk1GKzJH?=
 =?utf-8?B?UzBGa0t2S2pkeG5ab3hRRUNueU4yQStub25jY3VkT3JESElsWDNBUkpvMysx?=
 =?utf-8?B?U2Q4amx5Z3piQ1Q4Tm5kWkFpeG1sYjlVR21YMmdTWjNsUzZDN2YxczJrcmZ5?=
 =?utf-8?B?NHRSU1ZVRzd4dXBhMUh3VmZUdWRLWGFtZ2FzMndlMFNERkVGWkViTHZpTGlB?=
 =?utf-8?B?RmlqOW8xSmlld0MxOTNqbmpPQjFjRmxORFhkNE1aQ2MvNnkrWHRvV1YzVURX?=
 =?utf-8?B?SU5PS21hZ1g3NXNNYU5EZ1RpUmFkTGxPZExYWkJUM09rdTI0Uk9ZV0J6bTdK?=
 =?utf-8?B?TGYwZ0JzZjdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU1oeDJsZ3p4dDhzUHBaUXIvL0R0dWpnN1Z4ajROYWFDMS9ON1htcXhnc3NJ?=
 =?utf-8?B?MWhFY0lISHhhVFVSd0lFbVNtZk0wcGtIekdQN3pWWDdZWi9hdks5eXM3MHJq?=
 =?utf-8?B?Y2tSSW5MN054dExpazBhdURwazhCN3NCcFhRSEZwdFBMUnFlMmkxS2JvS2dm?=
 =?utf-8?B?QUI5VGlCZ2FEMEc4TStub3VsVTIzcVZNR3J2RWROR2MxVG5JeE11bVV3OEhN?=
 =?utf-8?B?dnFsTG9YcE1SMTRKUFZIeTd6R2VUdEMwZnRyR0pGUU9nUG1VZTlOMEthU1Zh?=
 =?utf-8?B?QXBuV1N2eVFNV0dqeGJibmFIb2djVzZ4c05kSUtsdWVsUWlacDNtLzdBMXM0?=
 =?utf-8?B?anBjUlRqa0srTldBT1Y1R1QxRDZ6NVpuK3NvZlpnUTR2M3hxSzh2anlEN2pY?=
 =?utf-8?B?NU8vNEtRZVg1NWNMOFd2dnhIUWNrUlV3MlAwWFhzSzh2SWg0cUR3ZlE1ZmV6?=
 =?utf-8?B?R3ZGNzZWSC8yQ0xXLzJBT3AzZTZVL2pOMmgxeXRtaXloVUhnSUl2dFpWaXV4?=
 =?utf-8?B?dVcxSm51czNGVmY2TGtGWnNtUXZNcE1SM1hEQ05ZbDRUUkF2SFVvd2JacUg5?=
 =?utf-8?B?WXRYNGZZMWNzT2ZiTFRKTzExRFVVUkJGaG1iQjVCM2N0YTJoMGhDa0svK243?=
 =?utf-8?B?OG9LVDNEcEQwUEkwMmpDOHdJc2c1ZDhUUGxlekZxTEVjOGh6NkVLbVlYbWtV?=
 =?utf-8?B?U21PQzdYakNvWHRmdFIvT0drOWs5V0tDU2lwOUJXalYveXVQSGwvVGpYWEp4?=
 =?utf-8?B?Q2V2SXRpUVBxUGthWmxyaXUzc2hqRmdFVDVWanRGQUNKc0w2bHcwWGo2QzJv?=
 =?utf-8?B?RzRBSFErQnNBUGhZbWxnRk9EQktOcVJJM29zVm1sL3ZUdUhza24rR3E0dzZq?=
 =?utf-8?B?SElFNjZBNEFoaFVacFFjUFczRTFNMUg5OGljSTdDc0lpaDFicmkwWDYvOW9V?=
 =?utf-8?B?UzAzZm5QakxyT3pmai9NbWpYWktqQ0pyMEdkWWpDa1RvVTNMS3JITlVXZWtL?=
 =?utf-8?B?bWtPL0FkSTl4c3k3a0wxY3h3S2Q0VVRQU2hJVldtcTBzcG05a2lFZU5meEJp?=
 =?utf-8?B?anNLMmFoOTQzbXVlL1lxMjRERWtjbXlPUlZoMWx4TjZWNGxVRmE1WGs1U1Zt?=
 =?utf-8?B?clBSYjZVQ3ZNdWpYaTRTaGdBWDQvUzhzaVpCcEhEbDVkaTI1bkhGYk1rZVdU?=
 =?utf-8?B?V3kycXRQSVdLeGpjVnh2TTJsSG8zQnNVVGpRWjhWWTREQkFmN3R0MU9nWm1X?=
 =?utf-8?B?dXdwcnBxNzVzOTZuMyt5MURWT3N2NWJYTHc5bVMvbTdBYng2S0lqU0NYYzk5?=
 =?utf-8?B?cVNYMlVXMXQ2anJhZEg3Q0gzcnl2c2hsN3RZOWhndURvUktuU3ZqZGVlL1Bn?=
 =?utf-8?B?VlVZdnJSeFhGQ3dhSUNPZGF4SHpabXg3a0JoTWJRU1czMFV5Q0k4YVhleG8y?=
 =?utf-8?B?Zjdiamh1Njk2ekVHd3pMYWtTS2V5Yk1UTnMxM0RRYk9EeHlCbFJlYUhCSEZJ?=
 =?utf-8?B?QW1OT2todGNjQnVUYzBsVDc3YzdvR0JXUmROZlVBWkplUEtrdmpZbDBldWdD?=
 =?utf-8?B?OEhRdHZUaVAzL01xOTB6dWZWL2xFOHFwT09rV2M4Mmt1T3IzSUJucngybkFC?=
 =?utf-8?B?RGtOcHlQL2xPcEIxUEtWSWZEcFZRaHUwaStrT2UxZ0ViOVNaWGkxdHlabmJD?=
 =?utf-8?B?Yml0d1oyaWVvSGNwNEszUnp1WElQYnZoMFFXSEtrTTlsd0Y3RjdlZ0FadmJ2?=
 =?utf-8?B?aDNqM3Q5cmhwdXBEYmdtZW5OSmFZcVhmZDIvMUw4eG9ZMXZ6WmJTZW4ydGRG?=
 =?utf-8?B?Snhaalk1MG51TFFiUzdvdDloQS9YeklsZC8wRTE2VWd6Y2RTaWo2WTZQOWg4?=
 =?utf-8?B?S00yaE0xeldNOEdubWFQTWR4U2Q4YjRDdnF1Y0YxYjFyN2o5c2RuZ1BxSC93?=
 =?utf-8?B?aTRGTTBqNDZMSXZONmhBeFVvVWhmUHM0ZFVadG9OVnB4TFJTU0pFVDd0QkxE?=
 =?utf-8?B?NkFCV3E3dGtqZ1pKcEhTWW9SSjRoUkVqQXZaclA5K0ZPQlV4bVo3NE5RbHpN?=
 =?utf-8?B?YXlFQUZrUG02L2RnUGd6VUdNRWlja2VUVks1S3ZvZmxEU29PZGZKQXMxQlFm?=
 =?utf-8?B?RFdxdjlyMW9rWk9zdTNROU9NWXhkeW1nYm94MXF3QUZ4R3BSN0tlbzg0WDY5?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d71635-521f-4452-c4c4-08de1aee37a3
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:32:37.3741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/RbcOcVjnHBHMqYPhi2fHBjocmT2KCFX7f4LOUlyGpxmP0o8Ip07pa4zhe/53jWw+5tdBXONKL6DFWbHpMfBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10500
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

DCIF is the i.MX94 Display Controller Interface which is used to
drive a TFT LCD panel or connects to a display interface depending
on the chip configuration.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/display/imx/nxp,imx94-dcif.yaml       | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fb25300e25529699adeb4caad9837d7af23a3581
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX94 Display Control Interface (DCIF)
+
+maintainers:
+  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+
+description:
+  The Display Control Interface(DCIF) is a system master that fetches graphics
+  stored in memory and displays them on a TFT LCD panel or connects to a
+  display interface depending on the chip configuration.
+
+properties:
+  compatible:
+    const: nxp,imx94-dcif
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: CPU domain 0 (controlled by common registers group).
+      - description: CPU domain 1 (controlled by background layer registers group).
+      - description: CPU domain 2 (controlled by foreground layer registers group).
+
+  interrupt-names:
+    items:
+      - const: common
+      - const: bg_layer
+      - const: fg_layer
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: apb
+      - const: axi
+      - const: pix
+
+  power-domains:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: Display Pixel Interface(DPI) output port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display-controller@4b120000 {
+        compatible = "nxp,imx94-dcif";
+        reg = <0x4b120000 0x300000>;
+        interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "common", "bg_layer", "fg_layer";
+        clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
+        clock-names = "apb", "axi", "pix";
+        assigned-clocks = <&dispmix_csr 0>;
+        assigned-clock-parents = <&ldb_pll_pixel>;
+        power-domains = <&scmi_devpd 11>;
+        port {
+            dcif_out: endpoint {
+                remote-endpoint = <&ldb_in>;
+            };
+        };
+    };

-- 
2.49.0
