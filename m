Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410FCBA7D29
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8D110E1FC;
	Mon, 29 Sep 2025 02:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ED6MdBcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D6210E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:41:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVstS+9ZS3ysAnvsGIdJjsuDsXhfzddPnQJY/W8IE0OaJvVnx/UkqIbLIOF8mDRKuf4z32Cd3xhQtXaGf3r89oWzddMnz+9iZrWjna51V64KV34SLiJz3gmQZO6vVEBiQb0tDY6v7iyd3n8OOfnObcNH5Isons78Qn32CML/StX+CQzavo8lu8dQZzP7U6Ck/uaO5JhPftr2bNKvgfdkcOZ78AB98hOW03C+SYaYbBCDw0xvBie+bTO+t9yvIiqRL5lGGd5u3EeA0UhYKuumVv8S+K1Rz5OLOkz48zKBQfJhTKdJjxXY6ShJrP+Ek3GJTG+pniu64HE3EaqLaMLCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x444hUPMWFUDiyv7erfnmsGuhdeca+JG8dX2tHlgqMY=;
 b=b7PPXq7hBU2QVQjxNB12YbAy//RlAsrOCYpAie6QAVujQnNIrZmxt3JT624QhHNiWHcFmhxtsBlWq2Bubdmm0BmzqK8g0YQUYUzo6wfMKS54lVN+DQmWLRLYO1X+DEwrLNwf55ybKQXfNhkKdbcHW8q9LzrLseiuOILPcLM27IbaYP4UmOxl4Nd+hQdxIod/upyssP40i2hFDaQmEL/XnS9/NqgWHiczuEeNlUkk5yqYgVsx9c+g8V1KzvgSFzQ3WTGBbQTWXw9nd9O9Fuutrn1ORr95pfj5DwlkOnlQBp5fdIuAWxomjJaVDt6jbvsqnKnfxzISo27hsmfw9khLlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x444hUPMWFUDiyv7erfnmsGuhdeca+JG8dX2tHlgqMY=;
 b=ED6MdBcqLAD8h6kZJg+A/BJ9a1QeL3eem8oZVovCw3ECVv5QWzKfW0pRxShZHSdbPo3GWnVWq/tw7EH4cwLgevdVEqh7/q9Hv55zulouilMoVVN8552Hww+eLW1QQbmPsIfP+TUbSQ4qaA1zXerCYj2mcuUPl1bgyd6yobIH7SlKdkug+zqrpamEo7oHHjGgu0SA7vFDg9MtmvPxH7uYOYu4B/YFjV5OqOFJPcOT7wraujxXT+0gJ+FLr0zbzAufYbOj/05/K2HXCWw4xHjD4eqG84+chEszxr10+G7NC10lsY7pLJx2y7CvnZGJS65aaVIPLyjADLMnfXBEaiaPsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:41:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:41:20 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:44 +0800
Subject: [PATCH v3 09/14] drm/imx: dc-ed: Support getting source selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-9-c01d0608add2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ad134339-79d8-4eb5-d1f5-08ddff01ab8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFlNUnBOQXJGRWhiZUx2bmtmQ09XaWY1dEk2VVpoUGM3T2F0NjZFTUl6cnNY?=
 =?utf-8?B?WWdhT2NSTXh1Z2VKd2xGeG5SUUdXSjkwOFQwTGdXYnUvOFZ5VWFQNU84ODNO?=
 =?utf-8?B?Vm42ZGJ0ZHhUcVA1K1h3TEJnZDQrMHJFU0RzUzQ3aEtEOFgybndkSWxhdGhV?=
 =?utf-8?B?cGV3eUJGZGdpZXcvNitkeXRPWHZnUjFpeEZMczduQjV1THlGZlRuZU5OdDNy?=
 =?utf-8?B?WXcrS3VoZnFhK040N3F5QXE4QXI3NkVsWHhCM0pnZWl4ZUxGSnR3Q1ZBRFZD?=
 =?utf-8?B?blJFa1dpNElLVVd3Vy9KQXJhaCtueklHUWc2UW5YSkJsL1RvcVIwMWM3dCtM?=
 =?utf-8?B?VjlLaDgwUFlUQ1ZkZnl2b0N4L0NyM1ZUTzdHc2FsOVFUTXlKVmRPV0dNanl6?=
 =?utf-8?B?UWRPRVNHc0E3UUJuN0M2ZXM1U0lIVGp2SDNNUEJUSlpKdEdJVWY4cHJod05a?=
 =?utf-8?B?VFowRTJPZ1FnaVVoNTVzU2ZUdFhBRmxIeGdmSFdnSDJvbzdMeHFFZ09GREJ6?=
 =?utf-8?B?MUhveXJZYWFHdnJEenhwOFlMWERZSTJOVW8wdTMxOXU5a29zQUt0U3B3N2o4?=
 =?utf-8?B?S2dqcnZlb0I1N1ZYYkh4enplZ016QzBtcjdlWTVMMFg1QnNBWXVscVdZMWNW?=
 =?utf-8?B?RkgyVVFtRE1wQksvYXFKcmMzeXNHUEhLYitkWXlnUk9wOC9wQ3hscElydzhU?=
 =?utf-8?B?TEgwOVdpVWRjRDhoc2xMRGRzbWhiQWxjdklkTGF1NFpwMXkwWmNkWkNpajNJ?=
 =?utf-8?B?MjBtbXN5alZ1V3diK0dvN1d5K3BqcWlRWDdBNmI3L3gwUWtURW9NcDJvL3k3?=
 =?utf-8?B?eUNlZkZzcVg3OGxSR1Z6QjVLNjJuNHAxV0JKK3A5WjdsQzBzMk8wbkJKcDRj?=
 =?utf-8?B?MU5YbFV1a2pQSEFaN1pvL1krVGllOEhGMVVqaktnbFRzNS9jdXc4S1YxdTEv?=
 =?utf-8?B?VElZZWZ1dnZBak9QNWRYY1VZYXhnTi9yMGxwbUsvZnhQUDZvUm9uWkZDbjZN?=
 =?utf-8?B?NGVpOFROcWljeTI5cnlJbWRMeXQ4Z0RxWFFPeFhkbkl5eVlxWlluMVNKbW16?=
 =?utf-8?B?RmlhWGQ5c1VnMTZZRm1MNDlpQzNLRCsvZEgwakpLWWVuOEtqbkJpQmpJcUhS?=
 =?utf-8?B?Zi8yWmtwYUZGMk5rQmZKUmxkVFNmMlRwYU1vVXNqV0RWcVFLdkdxUGk0OU4z?=
 =?utf-8?B?TXphamt3RS9VSWNBbmtON2U1aVI1b2lnZFR5SjBkanZvUE5aQTRHNlVaOUM4?=
 =?utf-8?B?NUsrb09Qa3oyeTc2TGd1UWRFVXV5RlVDSHZ2RHI5Y25DbWJFRjdnMW9zN1FH?=
 =?utf-8?B?WEpEdXZJUTh1TTdUL3lWc0ZBc2p6Y0NFV21TY1hKclJHb01yR04xUjJlVjlw?=
 =?utf-8?B?YTF1VzdlZ09VdURDZ1p2aExsSnFrbGJVRFpLbmVNVFRkcjVVOGJaSHVqb29o?=
 =?utf-8?B?eXdOZ3FJRVhnM1VuUGh2d0RFYUJ0eXlLSzJkUHpKVFViano0dkI4ODlFcWhw?=
 =?utf-8?B?SUd3SWJ1ODRrb2tGWFNYTGtFK1Z5UjFJWDc3YVBzdmM3YWNpZmIzdVQ5WUJL?=
 =?utf-8?B?aVVua2hGRUtSbjRQZUZHMzNwOVFOTGRzZzE4cjZtWTRET2RPQmpDZDlGYTlT?=
 =?utf-8?B?TmczSTdXd1lJS05XYU5TQXJWeFJoU2RoVWZMcWlNRG52THI1THpWYkliMlJR?=
 =?utf-8?B?cEx5NzZGd2xYaU11Ukd2THl2Z25oWGxCbzlHVytjSVI5UWxuQSt0OUduWmNU?=
 =?utf-8?B?ZE16Qkl2M1pNY05YbXpUWmM5NmlibzlDSVIwejR1Y3NYRitlU1VsT1dXV3VR?=
 =?utf-8?B?YUM5cis5eStVTWUwSllEckJIQW9sMXpQNUo3TzlXdExmUjF0SHRUZHRRVjNa?=
 =?utf-8?B?NmJIdEtsNFFqbTJrYkNsLzhNM0tNNzRhaFpDV0NUT2ZnZW02VDYzcE45eUhD?=
 =?utf-8?B?d1RtQVpYRFZ3Tmw2K0MyL1lWR0VWOXdhQk9zOGJhTE1MV3B6Wmlqd2hYaXdD?=
 =?utf-8?B?MWVrQk9Ed0VxYkUrbmhFN05DM24zNTdZekVvVjR1WW41NHdiNEUzdFFYd1Bq?=
 =?utf-8?B?QzE0eGJSQVREYkt0NzBySm84ZXRFMkZMN3o5QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm0wK2thYStEdGtLN1NIMjJ5bG1KSlVvMDBpVm1QUWFod2p4TDZnbE1Sb0Fi?=
 =?utf-8?B?Y2tFaDN6ZklpcGFXQVVabGtLYTlITGc5ZXU2eGw4c0grUWhaZzlrZG5xL21D?=
 =?utf-8?B?NXhxRVdFd2dmV29UM2VvcDlaOS9Fd1E5UHZHcEs4bFdjRzUwL1lJQVgxZVZ0?=
 =?utf-8?B?NzhNNDd2WSt0MXFTUmUwOU83VDJVN0pwVkNGS0cvTldrZmpiQjVoQzh4ZjZZ?=
 =?utf-8?B?YUo5Z3lweVdSVVRYTUtIVXZGYkpyN1VqREQray9ybmNJUG8xYkVMUUJNMHRl?=
 =?utf-8?B?aWQ1WVpMcnkvRzJhdFpabGRldUFJWEZZSm5uMWtTWGRDRnhpeXdPTEJ3cGxG?=
 =?utf-8?B?c2V5dkVwK1VZWlJJaVdLQVN3aURCQndXUzJLcksvR3JTV3FBUWNNZSthWERJ?=
 =?utf-8?B?MHdzYjU5bnZuUVFwSU9iQXVJRVhqSVE1VTlxUGExQjB4UThHUjhRZSt5ZFpY?=
 =?utf-8?B?eWhCRTFZU2FuVktWVCsyeTZHREVZNHFrZ0RxZWpTQkJlMzRsb1k1Qjlvc1l4?=
 =?utf-8?B?OFNFQVBnNWZjNVJEV3VNNmZ3VlVxTk45NFdFY1ZaRWZrMEYxb0NONDBLSWtD?=
 =?utf-8?B?TG5iYzBJZXZ6VTMrWFkvM1h1bHBpTStCZlMrOXV0bk9IUU8zeTZlU2tyUytn?=
 =?utf-8?B?TEtEMk93Wk5EMzRWSENvemFyTFZOcDBaOUZpSWd4bHhqVlRrbnlyc3Jkbk41?=
 =?utf-8?B?SFA3ZC9ucTlmK25sR3RBWFJBWVUwaGFKSUEyMGJDWDFIUXJzb1ZLbU5nSDhL?=
 =?utf-8?B?ak5xOU9mMFZJQ2FQdmRTZmdmMmRrV2dxd3hoM3o4N3ZqdXlEZ3NIbFZoRUVL?=
 =?utf-8?B?d0o4MGQ3ZXp0bVpmTnVTZ3dMTFpJam9IT2hCbEpYL1JoN0wzZCtURE4yU3Zt?=
 =?utf-8?B?OWpvbnA5UUhoam9sVVRTYWlmMXpCaWlBTUJpZ1JHRmU3cTFVTUFRQ2dRVkpN?=
 =?utf-8?B?eGtTVWRXa1lVRFlLcmdGRjd1SVpVZlV5REp1Q0NLR0hLRnpOWGZHNTZHTUlr?=
 =?utf-8?B?V0xqc1Rlc1hWQ3g1OXk1L0pkSTkxTlYrMThZbEZ3blpmbGp5aXBmSWk3b3VJ?=
 =?utf-8?B?NlpkU095dVBnbWdjU3hWYVlYOGRXR0piYlJxdVdST1F1OXVPeDZrWFZCOGk5?=
 =?utf-8?B?MzdqRWlVSm1qa0FFMS9PMCtRc1BxZU9IOXZrNjZsZ3RZcWR1QXV0SXhOMkhp?=
 =?utf-8?B?TU15MHE5aXJTeFIvZ1pEYXc3UlFkYzhJb1NNeWZIcnc5b3FMQkJ4bnkrRldL?=
 =?utf-8?B?b05YSHlJYUJMbHBEOHE1Y3c5VmNVTHJxZlZBeGk4VGxGMzBUeWpnUXpHTzVs?=
 =?utf-8?B?cXYyNjJnNk1JSWVVbHlNZ2FOeCtJN2RETWVEdEFlWGVYa3MraVRJOTgraW9i?=
 =?utf-8?B?Z3owYjVVWG5tSzVPMUV5elNMVmpJRXdXNmROM3ZIQmN4OUxSUlJ5MDlFaXpP?=
 =?utf-8?B?RDNkVE9Jdkg3VjBDVDZUcEFHNkV5ZTFsUXo1L0F5RW9pL25ScWFFNFlTOXhi?=
 =?utf-8?B?TkE4S3JaRjBGZ0Y5TlZ1a2JJQ21BQnpSVDVnbDh2M1hsMU8xOW4rWFFhQUNF?=
 =?utf-8?B?a3ZBcWdrdmpJZXpjQnhzSWEybFBUOVMzNjdhTlVGTjljN0R0UG1VZHZVNHlB?=
 =?utf-8?B?Um5yemZjTWY0UDVXV2JNYTg0OWJmSXZrRDlFZTlOdi9LUk5XRmdvcWZtMFRy?=
 =?utf-8?B?dmREeEMwdExONTNhQjVmbmNBTFpFREI4Y3pFSlZsR0NLVEFocVRJSjV6aTk4?=
 =?utf-8?B?SWthWU9pNnpVczgrTmkwMFhYOEpJQUs1T3cybWNPc2ZLT1lPTWhZNWNmNmVM?=
 =?utf-8?B?UmpDcStNL002Y25OSkd2dk1sZlNBWVJYZDBTcXhkTGlmc21WKyt2RFZ6RklO?=
 =?utf-8?B?M2FlK0xWZFdLQzVHUFZsaFIxWnFrSmorUlJndWtNVlUrb3M5WURlN2lvMDRO?=
 =?utf-8?B?ek9CNVh3bWczcjNRT2R0b2JCOHpYQjdjeU8yODQrcmF2UlFTMHYvTTF3Z1RG?=
 =?utf-8?B?OFZ6eGgrVlZub2FuNHI3aHMwVUtoYlBoNEsvaEVXREdTWVQ4QklWY2tlaEh0?=
 =?utf-8?B?TlFRTzJOOXdXQzZBRWlGWnk5K05mSXU4cGFYR2ZEVGpoZ0pCMEdKanNueFN1?=
 =?utf-8?Q?dzCCU7CAOSRxQ/B49wm3C8QZn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad134339-79d8-4eb5-d1f5-08ddff01ab8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:41:20.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTbsXF1TqroZkWGjxqSrr/2Tv7dL4HeP5fjCY9dpMHdvUkyha2pRh5nW4qTtV7EOvgnaowcnfAClFpcP/64cyA==
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

Add a helper to get ExtDst source selection.  This is needed by
disabling CRTC at boot in an upcoming commit which tries to get
the source selection.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-ed.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index 86ecc22d0a554bf3eced218df0312b513e10e179..b514790bb765329295553f89d16ee1167ef411dd 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -150,6 +150,32 @@ void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
 	}
 }
 
+int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src)
+{
+	u32 val;
+
+	regmap_read(ed->reg_pec, PIXENGCFG_DYNAMIC, &val);
+
+	switch (val) {
+	case LINK_ID_NONE:
+	case LINK_ID_CONSTFRAME0:
+	case LINK_ID_CONSTFRAME4:
+	case LINK_ID_CONSTFRAME1:
+	case LINK_ID_CONSTFRAME5:
+	case LINK_ID_FETCHWARP2:
+	case LINK_ID_FETCHLAYER0:
+	case LINK_ID_LAYERBLEND0:
+	case LINK_ID_LAYERBLEND1:
+	case LINK_ID_LAYERBLEND2:
+	case LINK_ID_LAYERBLEND3:
+		*src = val;
+		dev_dbg(ed->dev, "get source selection: 0x%02x\n", val);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 void dc_ed_pec_sync_trigger(struct dc_ed *ed)
 {
 	regmap_write(ed->reg_pec, PIXENGCFG_TRIGGER, SYNC_TRIGGER);
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index f5e01a6eb9e918516adfc89949665fdd2ff1e40e..0b81dc6b251c452e7ca72f1cd12af065bafaa198 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -85,6 +85,7 @@ void dc_cf_init(struct dc_cf *cf);
 
 /* External Destination Unit */
 void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src);
+int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src);
 void dc_ed_pec_sync_trigger(struct dc_ed *ed);
 void dc_ed_init(struct dc_ed *ed);
 

-- 
2.34.1

