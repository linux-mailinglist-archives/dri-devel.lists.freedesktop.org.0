Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526FEC2CC1B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9822210E428;
	Mon,  3 Nov 2025 15:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EsHUjV48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A5A10E428
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:32:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USFI2VmLRytx1EWZjYdEeCWcjFZ4jtotiZz1J1OLzz/eWf6r1axO4qiJJI1zYshz882ENmX1T+DDuwsRDGw7zxg0U9aDlqwi606ZV4uP/qg+567Q3s8IXqfzgRF5jkgILAKXBGY9YDq8MaRBy2ZDvvCT9yDcoVEmmYWS+8lIVHyz8p1T5zuqEk74gVv2pAj/GYqX1cFCaPjmlA58PHb6qIM0aKl45t/IoE5SV0L8UDQmM05t+/a8XqTErx0/NDBbKGYpWhSXql/xV6V191BqIQRaRDeyzT+QqG/e10HOu5Ubcr1stiOD6IBO0f3SNVGd3+o3wBSFDb1Jo7iPRqrlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubB9zz1L61YLYrsKGuGpOrlXI1sJyCpHxG8KI3nmEAc=;
 b=w2EWvzKJxEGVLQuKCVXFVv23OmedleK/nyTnc0OTzI113Q+3EomfJP958PX19Cuc66dWRuupA5wbQuBOaVRFgIoUsGFFDcScq5LH+YCUF19Vnspzy9T+2YtVkzLPY4BJbL7WBqtbE6V5wVhflsGq9+Vm4XnPhOtHlwU5Qi6m/vGyLz4BO/flHtiLaJ0BU1d1b/FiSV8DY0HyXnOuRARPmXcaGmx8DzouL9SFSwUTYysxFVLVzXGUs8Boi8L9j3t9O5KZQTsRbsvk7a6cP5mHQYwtNKi/QAwqK6AeQwvOE3h/02Fnf2tG6VbohYsgSzm8uYZ71mMD2l9eWsiG1zntqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubB9zz1L61YLYrsKGuGpOrlXI1sJyCpHxG8KI3nmEAc=;
 b=EsHUjV48cslEwESL8jrC18Ze7xuxZ6/ZO6+9U8WQDj5OVbB5J5/9DqICNrap88kC1c5/iB2JqdQMmf4WJkiekrpwViYpSgt/6n8XGwKdhOqb2kUvDWbzeD7QCEoVzHkr0/LojskUkVHQBzOwAXM2rLVB/1T1fPbK3KeJ5LgJBYxlV2eYvBUpJlD9Ix28qmADE9rkEb6HolL/hJ60lpVurpuni5uLY+6WAbC/uJ2NJkcrIeo/HiAoxtvH5j0u4cuXA2B8BE5DV68xZjdnjadFoSPvt7IJ1lXBWYhqZq/fSKqzR5N1Djs1OqFN7cK7sGUlBLTdlTR2QW4MtFEibksiFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:32:49 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:32:49 +0000
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
Subject: [PATCH v6 7/9] arm64: dts: imx943: Add display pipeline nodes
Date: Mon,  3 Nov 2025 15:30:51 +0000
Message-ID: <20251103-dcif-upstreaming-v6-7-76fcecfda919@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
References: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::23) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU4PR04MB10500:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aaf8664-fb3b-4f59-b302-08de1aee3eb6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFZQdEhWbmZsS2U3WVpHR3g5VHNpb1dGTlJlN00zZWdwRWVNNUFaaW9NNDJi?=
 =?utf-8?B?aU9XNisxQ05nWXIzUnI3ZHdzM21pcnRSOXprRXRjL1EzRDZmUWRQNDk1Sm83?=
 =?utf-8?B?U1I3SDYzTXJJZUQzTlJQSFUwbWV2YkZYeENWbUpPWGFPMTRwRmJzNzgrazky?=
 =?utf-8?B?UnhESnlpR250RmhMOEs1VTNVM0pKOGhsRzMyeFV1RTl0M2NnVU85OGwwdi85?=
 =?utf-8?B?cDJZNDlmS3R3UzQyWFZ2YnBDVjR5N2VYZWwzK2paYWtFSXdRVEpnc3oxZEl2?=
 =?utf-8?B?UVBEemVkKzBZUlozRzZQa2Q3MXZyRDFiY2lxUDdmWlo2NHhXVUdydXY2VDdr?=
 =?utf-8?B?NTg1ZzFPRzRmZE9PN2gzWm40ckdMYU5EK1g3SEM2aEh5dU5OZy9RNFZyendl?=
 =?utf-8?B?RHlLQklscC9QR09JOHNIQVhNMDkxOFBqWjVIZ2ZDQ3V5TlhmTGtqUVJHRkcv?=
 =?utf-8?B?aGRycTY1M1lHOVNWdTRCd2d0SjUvWThlanJpVUg0TkVGbUJBSGJHS2RzRWZ6?=
 =?utf-8?B?QnpXczlrdTFTTStsbUdpYm52cjF3b2dPeWtLM1BUd3ZiZWU4OEdBUjl3ajVN?=
 =?utf-8?B?UVV2dlVLeWZQY1EzQ09iUDVCd2M5bkRQSk5vYnpHbzhtTDNaaW0yeENWTTBJ?=
 =?utf-8?B?dW80L2JyRVZwWnJYR0hOWFRTaHp1L0tlMnJCR1RTcEFsVnhKeEVlQVQ2ZUNH?=
 =?utf-8?B?Z1dmTHFVYWZZZWk5eHppVU1jVE0xcFF2bVY3WktEQnlVeE5XZlgrajBKYkdt?=
 =?utf-8?B?Z0dHZ01GNGhrMjQwdUFaM0JzaXNZdnU1NUI4TTNJYk5NL2FOVFlPRUQ3UWV3?=
 =?utf-8?B?KzQyNFhqU1NmM2lxalJoNGhFTnU1K1cvUUIzdFN1c21yc0x3eThMS216Uy9Q?=
 =?utf-8?B?bFd5N2F0c0VjTTcvYU94azdsd2g5c0I5N0Npd2hrUkVZNCtZOFVnVjBkNlNM?=
 =?utf-8?B?S0s2ekpieHp0KzVkbHd1cW9YeFFucExkeGFGM2ZqSzIwWTQ3dDF4dlNyUlhi?=
 =?utf-8?B?cWhYUjlvRHdaY3FObjRrc3czL25RWmFQNThQeGdNeVhwb1pmWUpsRDMvV240?=
 =?utf-8?B?Y0RZcWZuQys0K3ZXWHIxVWVhTHd0RTRwV2lyYXUrSXVHY2gwOXRLRVJBbzBp?=
 =?utf-8?B?cDcyQW9TTFBrTi9CSHVTUlVTN0dTVGVFTG5BaFBzbW1TSjRxVUxxZXBvMTlp?=
 =?utf-8?B?VEQveEhSSE9YRUMxTzBuZVE0YkxnVnFPME5NZGxRNmRvL3pyelJWT0lZMTk5?=
 =?utf-8?B?N250T2lCeG92Y0xVbmVsRHk2Wk1sSzJrM3BWOXFvWTFhZzRHZlZ2OTZRcjJG?=
 =?utf-8?B?ZDRLVnB1VndrVGxnR1AzQ3ByY21uNEFWY2t5YUluYnZWRkVTdGtZTUtEbWZv?=
 =?utf-8?B?MEJmOEprdk03Qm9FUTVRQStjTU16NTRtTXp3Nms3Qm9TK2xuTlRWbTZ2cTZp?=
 =?utf-8?B?TzdmQ0YydmlRWUxjbDIrOHVhZitHS3JzcjBmUHFIa08xcVp2cFh2S3dXN0Ny?=
 =?utf-8?B?akFocVZnMWNFSi8za09aVFVoZzF5SWxncnV3RW1hRmlvZ2I1RlpzOHppcWtZ?=
 =?utf-8?B?eERhU2FrYW9RVUp3MVBiZC9TVlZ3S3lEUjNvdGJIOURNY2JhUnhiUjlQOGZy?=
 =?utf-8?B?dGpoMG9yRlZJMHp5U3RycTVZSmVKZ000WTdhQkdnL3pRcUF1dTZnbzcrT3Y0?=
 =?utf-8?B?QjhyQTBobGQ4Wk50UGYzSVJZWHpMSm83dXU1NkRHOEVieUhBS09Ia0NxcUtP?=
 =?utf-8?B?OGlYaHd3a0xIUEpaVGduaVFQa1JKMWZvTWFRczdxZmxqYW1tTDFQOEhiN0N0?=
 =?utf-8?B?aDhpbzNNQ1Q4ZHhLdWtQN3l0NHJBMWxQUzhkU1ZFYmtnQnNHVWRPNDR6bGVt?=
 =?utf-8?B?U1YvODhFZERtZWxtRmNsWU1DZWR3QXZ0ZkpHaEVlVkxlcjFUNkRsS3VHQm1p?=
 =?utf-8?Q?5IHuk0mkhTUNI/7HIkCSV7cYmRXn8pVo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0cvb0lwV0U0UEdmRkpOMmRYeHJNeTZwcStoNXczU1FMTEJIVjhTWm5vOEFV?=
 =?utf-8?B?VTNCKzBFS3o1Y09UdCtwTnlkWkFydTBUak40WU91OFdCRFFFa283SHZxSDVo?=
 =?utf-8?B?TTRlcHdVVlZYS0lpN2MwalF0cHp6ZmtiSmZPSFpLaWFUbWtUR2JOZFo3YVJR?=
 =?utf-8?B?OU1KcnZheVBnaHJ6TythdjN1UGU2TTZHTjVZQVplRkh2M1UzSWxsNkxvTHpF?=
 =?utf-8?B?ZGtJSGd4Y0JrdFp3d0pIOTdQK1NUOFZRU29aU092c3c0ZjdaQmM2dVZCbzZP?=
 =?utf-8?B?STJVNGJiNWtvMnMyZDVVZXNkdzNvdUIyaU16R1RPTWVONnlaWTFpRlVTYU95?=
 =?utf-8?B?alRSSFUzM3RkajRTK1c2dEM5MmtOV3dFeXB6UjJ4eUN1eFF2Y0JZWUJUOTJI?=
 =?utf-8?B?WFN2dGtyT0xDSzRQQTZZaFJrNXZIQ1Bud04yaEtYV1p1ZWxzQ0xaOWlwbWk3?=
 =?utf-8?B?c3Zmbm51M1Y3ejhmWHo1NEZlQlNhOW0xSy84R1krSWx3R2pJYnk5QnNBeits?=
 =?utf-8?B?TVBsc1dLLzFEZCtLSFh1TkplNllhb0pqZ2UyTTFNQlcybFFJMWNjNmZFK2pS?=
 =?utf-8?B?NkpZbHdMbFBjNi9NZ3dvK2F3RytBMmxYOHptdzIxOGtxSmpvdlpodkIxaDln?=
 =?utf-8?B?ZlB5UzdoL0E4VnRFc1c1emNBbmMyWXV0ZUFwQk9OdnZqdGtMMDZNUWtmb2l4?=
 =?utf-8?B?NlJONkFzNWFINFd4blFjZDVpclBjOFNES3E2V1JmZThtVTNlaklQbTQ1cHF2?=
 =?utf-8?B?MENTZnZWTUxZUGEveU1HY3IzenVtcThWR05yWVd5Ni9TVHlveUUzL2RiakUr?=
 =?utf-8?B?NWgzSXhGZnpwZm4rMGdaeGZob0xKaXBCQlVJb3B3eUpoWS8wNmtTM05oamZV?=
 =?utf-8?B?aEpCaFdtaFFsSGFrNzV6eExDdXNmS082TUNLQVRsZ1lDMnpWVUpUQ2pUbStP?=
 =?utf-8?B?VWpPZkl6UzhxT1pleXFtVkFBQzI2RWJ0SklENHd1YVFoTXhnY3R0S3E3c054?=
 =?utf-8?B?RFkyTURyazRrT0RvdEdGRzVhQkdDU0E4VHlEMGNOUEZTYWlNL3hOT1QxcDky?=
 =?utf-8?B?NWpRMmorR2hqWEIyQnNJUGVOOEUyOGZpU2hLbUp6bWRRS2cxMDJJZ0g3WDYw?=
 =?utf-8?B?VThoT3d0ZzlycUNlek94LzcvU1pOVWE4U3BOYURSbTFBQ20yZGF2SkZQWmV0?=
 =?utf-8?B?R1VhNExFWStieTlMVGhHZVFqdEVsMDBwYzN0YUZPd3FNZVNoZ0Nza0d6ZEtD?=
 =?utf-8?B?ajk0dER2WEFQUHY4bituM2JRSDQwTnYrMWN4d2JZeEdTdFlDcVpQdkFBaFl0?=
 =?utf-8?B?ekI5andBRXZVb09rWlVNZWRPblhxdlZOZmdrYkRVb2JWT0o0NE1tR1VGMGM4?=
 =?utf-8?B?K3cvUGNVNVB3VWMrY1dsUHZRSTRuU1UxYWQ4a2ZVZEpRNHp4aVdrRUJ6T0M4?=
 =?utf-8?B?enZwYUY1QXgvemFhZFREUmtuMjFtbnd1UUJEcHgzNmRWdEp1SDZUY1IzVXpW?=
 =?utf-8?B?SlA2MzNTakpWZFZNbnViTTZHTUFjdUdhWWVGUGxVSExDVWZveFltek93cVE1?=
 =?utf-8?B?TzZyVld6ZUVnMXBnS0J2dDVQc1JrOFJxcHV2OTBTbXdTTTIrNEhFQXdkWkZU?=
 =?utf-8?B?MW1Sd1Y0U0VoR2dCc05DRzY0eUU1clRBYWlJZmc4QithODdyVEFHeEZlQTky?=
 =?utf-8?B?U25VUmZDUDl5czYyMzE4UjZxeEdJVEUzWE9UMktBc01rSHlkNWVtRXVwNHVr?=
 =?utf-8?B?bHR6THdJS0dxd214ZFdpRUxhVGF1MU5KTzBoclpya3ZPcFdnUUdMYk5wTjdC?=
 =?utf-8?B?aUhzSlFMUktZTVJUOCtUVWU2b3BaKzBvOUtuWDR3UFdKNldPZnlDU2kxTm5K?=
 =?utf-8?B?dWpRSlRXYThBbHI4OWJXRmlMYVZaQ09NYkJNSDdoS3J2d1J4M3lQN3YyQ1pE?=
 =?utf-8?B?bEdzVjRMMzdHcjNCelZnNEZhWVNrS1BPaUhxRzdVOW5HY1d2OHhab3FxUHph?=
 =?utf-8?B?eGFMeEpnaDFtZ1pkYU5FTEJ2ZFR3Q3BoQ2dLL25GMVJhMlFySGRlWGhwVHlB?=
 =?utf-8?B?ZU5pay81d2tWNVhULzRCaDZOZ1F2RnY1Wmlxd24yRFNqT1poM3ZMTGREVkVs?=
 =?utf-8?B?UVlrU2VXK0crbTJoN0NOSVBPZE53MW1ZYUlSVnQ5TUdOdEI2cDVrSEMyR051?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aaf8664-fb3b-4f59-b302-08de1aee3eb6
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:32:49.2981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qBCNqA6kRZEMH2ZFDLInLRXOVly9Omg4bJAWjWk5LpKLddCTmLBI2iU5SHfSk8YR28m/zRjyOSTXi8eVweahg==
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
