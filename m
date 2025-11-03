Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22833C2CC06
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E1410E424;
	Mon,  3 Nov 2025 15:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XtJcZnqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013065.outbound.protection.outlook.com
 [52.101.83.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E153910E424
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hs5a5v2uQacvkxsxxhw/sa/1Dl8sq7Bnn5KNSrQjJjc4hIPS0B9y4doNOAl3dIGAOBIjlAMFunjEKgxSkGBShis/7e68rw2MLxuNMHSbBpbyk6j3kyuQ89v8cHkOJt+9aKGUTJti9qeTC871Y7B/QUTAksJz1yaBgmFWk7cGAwilfegSeFyvJ3vyjMjbju67EsznXfliFH/JFjrubXUBc0NXxuKJS9A9+DTmlTJTV/iT95JAHlTvk1K3P37wttdEYdg/KHWqJwqhHEgF1on4nSuaZNoRZb6IyUmWfGtWKwIC8jARGUjXyRflIixZzXp2tApAIh5CfwZntskVun96Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rEXvg/Qw5B4zOpe0GKOk4USg2iPGS2KsctpEQBRBGc=;
 b=xkBxo6rIrpVJEKGaTzFAl5/xXIL/oHx+6DHkw+bfgJcM5+PTcqPC5ihbWwx5+zY3c0ieTGDCjtoaGk0sDZVTR1uDIPvudPWEFq0jGaw5iwOf50ti93nJWDzLRawjUCqCjUF9hoFvoDR8aA1mYbOSaLLOYDFYQ9gksicsxLQCnPkOBwg0ooKuI+oL3p8bbirUj+g4jcmDFHuX6s+c6ID+2P4yESu5OaaYqiWNS3PeKLCAaNPjYjCoemyAYiFUKCAcrmNt7p1evbkZ4DkUW+wMPTEUCbR+4M9qneGOA7llfCt6xxVqZiUMwLoOa4E3N6BvU+ASBJH2prPDMvUU+FBWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rEXvg/Qw5B4zOpe0GKOk4USg2iPGS2KsctpEQBRBGc=;
 b=XtJcZnqJtpqlUGnO4iFw+ruyosahqICWOK2EPrfHCAlnBF7eLJGSTtebRveAOvDc0zu6Q2YGMt3ZGqgx7UsbBhw69N9I1uh1OaNzrqTrplhuHMHg+/qYF0coqfiy9RNo+ZIEy/KkXQRBGocjYQSGo72z7h6rNipc7VjXk13O/MD4BlmlwXqM5S6iT1jRjz2gDtNEyPbq2Ps2AW/MxX0mJ+1y4wDXxDIoxPJAsPWW4CitUhJhu8+1LkwYA2rVXOqZKFkulUQ/en/F1jeWYq7ELsCzxjKJZSDPIwjeDj505vADAikOCe6fNO0a0iWp4/1Xbazqvuqd5tTyk/+xT/rVzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:32:32 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:32:31 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Mon,  3 Nov 2025 15:30:46 +0000
Message-ID: <20251103-dcif-upstreaming-v6-2-76fcecfda919@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3e73f61b-9ae1-4e8a-dff8-08de1aee343c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUwwR1R5QU5iS3RwcEtpYnl4RnpldTNEcG9xMXdoRk8zL05iNlhwazd6aDAy?=
 =?utf-8?B?eGtLMzQzVDFCQkpST0twL2FHaTlDNHRSdkFwQUZwSzFqUWYrTFduQlJjOVYy?=
 =?utf-8?B?TEFaMkwrRGRySmU0Ym1UZjd5T3RLdTl4dFozL3ZjaCtQSzFSVjFYbVlEcmpP?=
 =?utf-8?B?S3NXNUlpTDM1d2c1eDZCZS8yOVdMRzM1aTJrRFdxNG9BVkhXNlVyZXgwTXh1?=
 =?utf-8?B?VnFSWE9FbXBGT01oMnF6NWg5YU9laDhQUkxsUFNoTExZbEF1Mnk3SmhzbnZO?=
 =?utf-8?B?cEJhay9qVFhUZUVHV3hSN1dqa0R0a1JRT0lkNWpoVzZjbHhFa0lkM1BGaWIv?=
 =?utf-8?B?TmdPVm9JK3J2THJlSW1TSU4vbUE4ZldrSVo2MzQ5K2wzcjgwdXBVMnBaUE9x?=
 =?utf-8?B?c29URkRvamtMS0dOSFNFa0tRRmtmN2V2dmxWeXVqRTZHeE1US3B0VFBUL0Fa?=
 =?utf-8?B?RE1tUEJ6cEZ4dTUwTnpFVHE2QjBnOVNPeWRNTFBTUFpuKzJ4cVZpR3d3R2oy?=
 =?utf-8?B?UTBwbTh5bkJyYkE3YklpMlV6aVFZVmxoSE9abzAvZzJxN21DWkVyL1NGSlN3?=
 =?utf-8?B?M1ZhVUZyUjBNR1NXb0JFcVBWMlM2WldVMFo3TWpYRXpLcjYwTzB0QjJlNXJz?=
 =?utf-8?B?Y2d6S0xwL1RoR0tzdHhGWXJyUFpTSWc1RGg0d3VOVk9VYVpKT0VCZC8xWnJu?=
 =?utf-8?B?NGVINnV0Rkt5c1F2SmFvRHhoaXNhZ1JCTjltWWJyRFV5WjR1VjBRaFNpUkNa?=
 =?utf-8?B?MUNBWlc3ZmxETW16TTBrN3RZZmplRTJxT0JHbG5OcWNOMVlmM2dqa0lhRjJX?=
 =?utf-8?B?bTkvZ2ZWeXNCblltWk0yVHlaY2dmMTlyYTg2MytTWjdjejg1YWpuVzM1TFJT?=
 =?utf-8?B?QklhS1F6ZjFoQzdIUzVtMkJNOWM3TytYeDFxOXlZaFFzYzV1bTZLdE1HaFRt?=
 =?utf-8?B?WkswZ2NaZEJMZjdYaWpGdUdrVTN6WW1Rcit1SEZ5Z2NBbUovQXhxTkpPbGRi?=
 =?utf-8?B?Qlk3amJFejQwVEpoT1FhUzhqTjdWeDNXeHVvenZ5cHRYb3cyVTEra2V5SzFm?=
 =?utf-8?B?ZWhPTEpScWJHOEVLN3dhck00U3ZyTWZXTTFNMUlrUEJzRjhIa0ZBNlRwblRF?=
 =?utf-8?B?Uy9YRVNNMDRSWWk0bmY5cDE5ZmNaUlJQSXVKeTUySUZYRlc2MkRQSmx3R1E2?=
 =?utf-8?B?UU1nSXBPMGdvdURhWkR1YVZyclFnLzFIblBmL2trWW1rRmxVa1ZmWjFlUEJG?=
 =?utf-8?B?Zk1FUEcrMUFSYWQ1RjN3eGRHYWVKQy93NFdseGVPdXpiWENIR2ZIVVpxOFRW?=
 =?utf-8?B?aFBXZWd2TVdab0hJd0xaUDlRNUV4S1pvQlI1K2hxVExZTGpnbERlUS9uWTMw?=
 =?utf-8?B?eEljbUw0ald4R2wrM0UwR2czL2U2ejE1UTJiZnpYZ0E0bGlZaDU3SXVKbG9S?=
 =?utf-8?B?YVNudUpWRzdDY2NoNWdOS2tNOHBBUVNuM095S2xTZTVJdEg1aWQ2YXlRU3VU?=
 =?utf-8?B?WDhvMkVsRVIzd0N5eVJnVXlwYXJCQ0dTYU1MMDN4T0VqVEdUQkxiTGo3SE80?=
 =?utf-8?B?ayttc0ZuNVNqT09pTlhmTWViWG55blJNbEtIa21GOWliNWFDcTdkeElxenA2?=
 =?utf-8?B?cUNJbnJKa2l1d2x1ZEE5L0J2RVBZZEwrTWZpZGtmR0hQcUo2OTFMY3RWT3Uy?=
 =?utf-8?B?YnBVSTViaHlIczBoMzk2emNUQWUrTXFLbTk3dDNGS0laZ0tWOE5TaXdFWXFx?=
 =?utf-8?B?b3VTdk1hUTU0bWcxeEJrV0tqUjdteGlaK011U2xycFF3S21MNUdyTXgwOHRn?=
 =?utf-8?B?U2lBTm04aURIUmZPUUN0cXgvYTBYNGpUMFl3bmRUOFhIb2UzbDJKeU5kcmdM?=
 =?utf-8?B?MzhJTWNabDJDSkk3UVc5RlRyc2FSMG0ydUx3WXMwakhQU05ZZU85N3pGZHRa?=
 =?utf-8?B?TVE1U0tSTGFHLzJQVWxDK1E1SFQ0dFlEY3kvd2F6N3grb29ZRGNNemxyUExM?=
 =?utf-8?Q?OnGFTtXdXYc6m+txSZIjvCEeuDQMFI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHR6RlVPY3JpUTFZQi9USnoxc1piREdFeTFad1ZxY2ppTzNuZUN1RjdJQlR0?=
 =?utf-8?B?Wk5oVzNrNHlRT05CakhuaU5LVkpOQjZSczhSdnVVWWVZM0xIWit6NmhXT3ZP?=
 =?utf-8?B?RFB5RVdEQlJpN0VjS2dkRFhvMW1CZXorL0xXMnVKUjVmbGdwbnBuSVA5Ylds?=
 =?utf-8?B?L1Nac3l5d2owSzdWTXhDaTF1TnBLQXI1b1REZVBGRVIwSGUvVTNIbHFOb1pu?=
 =?utf-8?B?OThQSXFWNjVOeGtIcy90RlNKOXdDWkpRZTZCWWJlakJSR0VoUVVIVVhDS3JP?=
 =?utf-8?B?Y0FyczRwM1AyaEdXK1FyVnBiTjBvWEt1WlBPeE9UTTJqV214RjVkRkRFQmFX?=
 =?utf-8?B?SmZ5bFJJV3ZGSFErdkcwamR5VmJXbmp4czVSU05YRTdRczhBZGtiQS9QOHZX?=
 =?utf-8?B?Qkt2R1VjMFdmRG9rczFyMjVyTmdRcEdabnZhZXZCSWxDeXpydkNLaVpUOE9X?=
 =?utf-8?B?V3pFR2lENk5zNU5WNFpTdEtYTXY5a0xweXFPNklKRCtVa3VhWkdaZFdhVy8x?=
 =?utf-8?B?ZURPVVhKRmlLSUhwNVVTa0dtdkJsTEcxbzFxdDJ1YURRSFd3cGQzdGJZUmp4?=
 =?utf-8?B?QXF4bG5kcXFYZHJNWTRrajUzaTlNN3l4UGpoV0ZRcmM5aDVKdTFxN3RZaHpZ?=
 =?utf-8?B?T0tIVGdNU0NqcHZuTWpPZlFrMHJoU0xicU91SW5OWXNtS1VFKy9JUVlRS2JM?=
 =?utf-8?B?SXdEbTgzbjArSzdRTzcvL0RybWF3d1ZLbzdIRU82Mm50VjZVdWRhYUlLZkpO?=
 =?utf-8?B?aFB3MWptSkV5UHY0ZE93TVViNkp2Zm5GR05uOWYvZmE5N0kwRUxOWm13Q1FI?=
 =?utf-8?B?YWsrN041VnFyNkFFU1pTYldjVC9aLy9NcURwMng0aHBxbDNhL29xSlUweVcy?=
 =?utf-8?B?NXdTN3N0N0pDUVJIU2gzWDFvWkJ1bk5wUmcrbWRpckdZL1BGYlBKb0lBRzJO?=
 =?utf-8?B?eWZNeWd5WFkvK3YzNmFZdk5wMjF0eGk2VTBteTRmNHlkSmxoaGw5RWJRcitz?=
 =?utf-8?B?UlNRSnBvK3YwaVlWMjRHZVVwUFVBdzNuRnZ2YmxpYmVQMjlVaFlHVlAzSGtF?=
 =?utf-8?B?WXZLZnN2dW94aktZRldwQTFPTXp6VUR1Mk1GL3RjNkROTzVwWmR3Y2c4T0kw?=
 =?utf-8?B?aG4xLzZOYTIzd1NNR0x0aURxbWorNDIxYy81Q0gxRml0eDR1QXZOTVJ5SG5z?=
 =?utf-8?B?QURZbEc5bWdINExXM2h2NGdHZGNIbmh5M3pUOEFBaWhxRTJRT0VxU2V5UUdu?=
 =?utf-8?B?aWRJTjlJbkE0bWU5dVVwNG5tcjN5VW9lMDJSckNlOERTRGlRMEdaalA0TlJa?=
 =?utf-8?B?dHBoaGlEekQ3ZW5QQTQwQkJQdHR2ZllaWGNoRzVSRVk2ZlJTMkNOOGFCZHdy?=
 =?utf-8?B?cW5vSWdESHAxdVdneDM4Sk04OC9SK2VxSC9UUGRlNWxKS1M0QVk5YzJnK2p6?=
 =?utf-8?B?cWRZOUxSdGs2Zng2QVZ5ckVNVU95YjRFSEU1TUFHcys0TTdZTDArSERUZHRl?=
 =?utf-8?B?Y2JWZGFpWWxaMHcvRHVyYlZqczBjTTZoZHgyM1VBaGw4WSsyUU9CS05FQTZV?=
 =?utf-8?B?VDdTQ0l1TjB2enNMVXkyREYwSm1FU2lBS2Y5VElReXBnaEl2eWNQU2syZ2V5?=
 =?utf-8?B?WThqR1FCNW5ZcmNVNEVicmE5U1ZiRUZJMS82d01UMmg3TGp2MmpQZU1XcUd5?=
 =?utf-8?B?Tzl2YllXMzFEajUrV1N4bWhiNEduSmNEeVcxc2trblphK2d6czBsR0dMK3VK?=
 =?utf-8?B?ZFpIeFhjbUpYaW5kNDBRb3A0NnltRlhvOVUyTDZpR3RrRkdpK2YxZE5iUmtq?=
 =?utf-8?B?U2FkdDlFUWVrQm0waUYwVytMNEJKTGRjeXM3VjRBcEFIZWNWWk9RVjRkNyt5?=
 =?utf-8?B?TTNSWFBqTlQ4VUxEcWdJbFRGd0ZYNnplVHhONFdKRVRlYkpCdDZ2blNmWDdP?=
 =?utf-8?B?MlBYazg0YXRCWHlzWTlRVDNXQW53bVlaNSt3d0kzUWdXSDVFWitnKzlnQXkz?=
 =?utf-8?B?WnZrbVF2RGJSTmlONytzU0dGSWdHZHdEZ2g5RWI0NGF4eDhhdXRjZURWaS9M?=
 =?utf-8?B?WVU5c0lvUTdlRTdxNUwyUnlia1AzMVhhNW1WZFFML1pBTXcwMGs5ZUY4OHdC?=
 =?utf-8?B?aE9nMmNuc1dVbW5hSW5ib2QzeGlDdkF0RVFkSEhIdUJvRDlqVE5uUExrVDJZ?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e73f61b-9ae1-4e8a-dff8-08de1aee343c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:32:31.7635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBbUMgkweGv7gpytrBiUQCotHLHVZNVdrOJzrQtGC/PXI5XAam/2zcP8MKxGrWJM5Uhxsgw37VP/q1660us+TQ==
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

From: Liu Ying <victor.liu@nxp.com>

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..665053d0cb79d2b4f50e69c397863ab024553867 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -15,7 +15,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
@@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
@@ -118,7 +117,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
 				 bridge, flags);
 }
 
@@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -317,33 +314,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_ldb->regmap))
 		return PTR_ERR(fsl_ldb->regmap);
 
-	/* Locate the remote ports and the panel node */
+	/* Locate the remote ports. */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
 	of_node_put(remote1);
 	of_node_put(remote2);
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
-		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
+		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
+						      fsl_ldb->ch0_enabled ? 1 : 2,
+						      0);
+	if (IS_ERR(fsl_ldb->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
+				     "failed to get next bridge\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;

-- 
2.49.0
