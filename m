Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F44BC18342
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 04:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F99A10E0EC;
	Wed, 29 Oct 2025 03:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="USNTdWnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747AA10E0EC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 03:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xyi/JnXu6T3ORChwqBUjuwPbAb3LIs7kg4XwxSZsOqLZ6OgLzOe+aUBIZvuAzpdurTq1xrDsc8fp4+rLd79MeLbpcdowNUrhOAIiTqzVHwsVSGBzWD/6j6QvdNKCN2m7LERJdTWqpBGn8Za0yFF8ogAtPrkhfqpPu1iU52Y6jMT2zHo08aG6C6vzctCpZlrWIKogtatkNxfi0YSsRoP1jaP17Bb4A0ryVmnvaLzy3ndjdlKCr+flVuF8B1Nj1ACkX0sbmVNKGtYHXz67zbQKrRtOqW62Dn12cjxCmMTHajo5rvJtrqW4KaOjn87A/JwSxxjFUXJcDJ7qXwGY3TNxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYQgwnmaor9RKCTk1Uc+s/xyFObYDmBrxhvDmWZQ+0I=;
 b=SgV94L9+J7a8ar5lva5Qj/oeZXb2aqbg8lO4iOlRW7cOhoUTJKfqiaNHidoz58E3SIBwjh3bVBYNnjWP7aq3DIBs3PVqYAQpB9ijJ4sbIBkut54lrYItUZQMj+FFQko/gOMIIQrhrltVkYehXVF+HVYb0tS+ZKiQ0qn4Uz9rRjasuoRiAZgvX/CN8kqUBXF5/BH0OVjtKYbyiwLBwZv9UdOMOnC1MhTevtW/pMNGZlrotLfg43AbyIDX4s5+8NI4i7MY+s/IUUGQ1QTet69H9sdhoihFfO+J8r7xq1rXjtWTyWqK0H3YZKjQtcb7pRHJR/H1hJgqXhOS9PERd077Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYQgwnmaor9RKCTk1Uc+s/xyFObYDmBrxhvDmWZQ+0I=;
 b=USNTdWnHraSJSROjG5RV/pjJxQ9SrhGeP2JpISKKxMYm7GzUndX0p+3JcAP/itUPxHxs1jx6Izc7uwkBB4BQaeoDiD49F0INR1ywnJno8zRaIdEv/lnrTCS5UIiOwWOlKAufdJnRAslKUaKk2UuQZCfwyB53pdKt9Gofc9osNBdmwSK1/KTATkjnD8Bm0VPdRSE5zm0HAykHYm+CkKzspLYN21S4szvySToV4pbzeZYkCewzvZyYcRt9eCWMM+AoNR3Sm2Nz+fzBkCQrDuD29Dwu6g7DbJifH2pl/+XtAHeGLKrXEI/E6HrO6JJR6kYalDS65xv46JuOt/frasGpFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10975.eurprd04.prod.outlook.com (2603:10a6:800:26b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Wed, 29 Oct
 2025 03:41:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 03:41:24 +0000
Message-ID: <1a52c081-ebb7-487b-850f-e50fb36b739a@nxp.com>
Date: Wed, 29 Oct 2025 11:41:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ldb: add support for an external bridge
To: Francesco Valla <francesco@valla.it>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Fabian Pflug <f.pflug@pengutronix.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10975:EE_
X-MS-Office365-Filtering-Correlation-Id: 5927a15a-848e-4132-5dfe-08de169d0895
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|19092799006|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWJvRUYzaE5PN0tXNnpieWpuRWZleStpYlhzL0hLWkFOUTZvQWFrTXJkUFNu?=
 =?utf-8?B?anRXd2xiczdWRlBwbmtJekF5b04wb1FscDBPRitxc3VxWUkwNkp0RWhGeU1M?=
 =?utf-8?B?MjlNcm9RejByMG5CYUxWQ3dHYW1YdFFHT0JzMitCNkxJSVZCaU1Pdkowb09G?=
 =?utf-8?B?cGVpY1JVcFNkNG9yUmZEdy9ERUNKcXZFV01UYkx5Tkg5TnR0ZC9xeWJPcFhB?=
 =?utf-8?B?c25aQVpBSDduWW0vNDJNU3pVbjlPc2xpZzZIR1MzWVUxSWcvd3dPclUvN29I?=
 =?utf-8?B?WHpYWVhmU0NOeEZwY1gzcWJqcWoxQTZSMjcySXF1aThQRzhteGpFekVDczZL?=
 =?utf-8?B?bWF6SVdWRVlwV2kxamZSZkJkblhTQmZDaGhMVjdlSGZpNGFPcXI4VWNQMjRn?=
 =?utf-8?B?MGxMWkNKOTBVYldwbDVUenlrenpTUEY2a3dHTEV4TlFtOVE0d2tXL216YmxR?=
 =?utf-8?B?TGx4dDNTcG9VZGp3cHlRc3V1VzJzNG5UOEFjQmJDeGZlbXduckFvbTgwTkZl?=
 =?utf-8?B?SzdFOGVtUXZPY3QrL2tzNGwvUFd4TzFDT01EKzQvUXJCNjVWR2FGN3RLdW9o?=
 =?utf-8?B?WDhHdm9hQUdQRG9YeE1jNWlkWGNHNmpJczlxVUJRU1ZnRUUwa2xTZWVxOU82?=
 =?utf-8?B?VDJWc09oZGIvdmhyRWlWb1dMOXlGTWcycUIxRmk0NmV2T0xhVDExUGtuTXZV?=
 =?utf-8?B?ZFFFM3NLSWFsakJNUnhsdEdBWkM1a1NzdmhnenJlRmFQUFV5K3ZodWxmVUdP?=
 =?utf-8?B?TlZtaU95Y1pPSE56MkEyYTdrZVU3TmhHQUxVdWdXZUJNVkJHajhLM2k1T3Ax?=
 =?utf-8?B?RzJCQU1NeThrYUJOUTVLNlh5OCtXN0swWWJMdGl4NUdiNkdFTnUzaVJCSks5?=
 =?utf-8?B?SmgrTmR0OWJ6anVqRW1rUHlySnlRN0RxTnZaY1d3R1lBOTZ3ckhMTEFSY2lZ?=
 =?utf-8?B?Z0U3WXN3MXBwK3g4SjFSVkphVHZsblJ1R2w1YlpuTlhjMk5Kc2dhOFVrUTVq?=
 =?utf-8?B?REYvOVVpZmh1SEQzZUN4MkVWL2ZPbzBQVGl0Q2FxY3p5RHNwY2dCL0pQMWNl?=
 =?utf-8?B?bWUrYnBjd3lpamtDYkJmS1V4bWhYSEZ1cE5nTVh2bFZwUjRBNS9RS0lwcFRG?=
 =?utf-8?B?TlNBa1dNNkhhd2VuUWFwVVNFZkcxM3drT2JyMFRwUDlldjJ0Wjl6Q0dHSXd3?=
 =?utf-8?B?YVJDMWxmMEh0SDIzbjVZWWhtTHJCd1BPNEpIZm5SN3I4bDBWWjZwb0FFRVF2?=
 =?utf-8?B?UWkrSytvNHluUGxKUGMyNnlmTlU3TjFDM2tRLzhNYnR4a1B2SXhpbitVTUdQ?=
 =?utf-8?B?d2FSVktXbUMwTllSa1BSQkFrTEtPb09FR2xIWTR5Q2hCTmxFTW40YUxmOS83?=
 =?utf-8?B?dWFYTVZ3aXpwcm0rSW5zVEdHc3Rwd1JJUEtzWE5MWm1xSk9HdEFTQkphUUhB?=
 =?utf-8?B?cDVidzV1QzBvUDZ0Z2VvN0dWRHpWaEQrQlJHakFGWmNmTXo3Z0hHYldGNWgy?=
 =?utf-8?B?Vmx1UW5KUTVhdDYwRnVCSTZUd0lrUzBVOHpUWE1FUk13UWNoVEZIMHRXWkxE?=
 =?utf-8?B?c0d6ZDlnbnBXVG9meURCVkpGMjQxa2N1WEY4RXJrSk1LSWw0M3EwVEppVFBz?=
 =?utf-8?B?Smt4dVU0bzlIRUk4NkQ4cEdCR2pZeCtLek9hS1dYd1llMTNmVFRCNE5sNWQ5?=
 =?utf-8?B?MEY2SEFDNGxUc1JNWmVBdlRYckZnYUlORHUxZS9MMnlNNWh6aVp4aFA5Ukp4?=
 =?utf-8?B?WVBOUEh4ZTJsbGFxcjNSdk1UdlA0N2lnVFBHb0hJY1VlbC9BRWJkNUhTZXVk?=
 =?utf-8?B?c09ROTRqRXJ4a2hqeWwwaHRIQUNnZS9vNUpxVWlPdEgvTnNQMEVxSWI3L1Iw?=
 =?utf-8?B?dGlwRjYyNDFJYUQxQWpKdlhJeDRvdW5iaUVaNHhQTTFXbUJJUFFPckw1dHI5?=
 =?utf-8?Q?hjM51Wr+qsKfFNGkKyf/ao7T+rXpolDC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzBkMys5d3FVdURCemdKakxUaS94NVMvK0J4eDNDQitEK1htNDV4aUQzOG8v?=
 =?utf-8?B?Z1JFOWR5VnR5YXo5QUZJY2U4WktvNG4zYmwyajB2RzkxSFRMU1MwUGdwL2dZ?=
 =?utf-8?B?MXRlanNqR2dRQUtmNlFLZ3VhTGFFWjB3aFFuckZiRjA2MXdWaG91a2E1akxx?=
 =?utf-8?B?RHhSdHdGVjZ3UkExMGM2LytORXlKdVQwNUtwZ0dEdkdTZGdGQnB6QkRNQlpO?=
 =?utf-8?B?UFY3SzdNdDlNRFhEb1pPSTFpamJ0TkVsMnI1eXdVL09IUm5ETFNJUXQveHBx?=
 =?utf-8?B?TW1Mbng3emp1ak14TjlKSXFrUUZlRXUrUVhVVTlOMkVjVWxNR3ZRWFBKdnRG?=
 =?utf-8?B?U0wxMFpHMWpyNjVBcFBBVGlrQnl0T3ZkTHhpVVE1WWVhcGMzbjhkSXUxdUJw?=
 =?utf-8?B?MDVBM1RkV2JTUVhtYnNRbGtRM1dpcGF0Y1pRSTZ5SGZsaURHczJPdmRHenla?=
 =?utf-8?B?eEtGYStQbnppRTIyNnNwTGZKeVFjUXVtTzB2SEg5Z3UxRUVNcnlKVVdZd1dR?=
 =?utf-8?B?L3cwakxmMDdraDJJbjdGbXljbW9BMjdRY0NtM0RZVFNCTkRUVnVQZXM4b1Y2?=
 =?utf-8?B?L1ZHVCtWdTFZbzZTaDZiZUEwU2MvNEhobjJXU0d0Mk5jcEsyVUFDTU9peFhT?=
 =?utf-8?B?b2dUUDBvVzI5cmRlTFc2eWlJYlJLMWtIcnVkYTVtczZtcWlRMkpveXZzT242?=
 =?utf-8?B?NzlWS3lMcituenMwdkkvR3FmYVZtcEtXMWcrOUMrL3FsNVNUVzBQbWZQZnla?=
 =?utf-8?B?VitLQm1GQnhXMy9NSFZ3M3pja1FoOE1VV1VSSDloUXJLMXFZTW5Mc29xYUw1?=
 =?utf-8?B?aWErMk92V0RwSkdmbVRsbWdoa2RkTm41dElmUmJXUW81UmFUYm93WlAzU21P?=
 =?utf-8?B?VlpHZ3dRT0VsLzAxSVRUYkR2enBKL0R3d2I3S2g5dm93WUd1WldnRW5rNTl6?=
 =?utf-8?B?dG02QlU0QUZsVTRSY2kvNzJ1WGxGSVdDNVAzRVpTRTlkM0xjYXlUU05hOFd6?=
 =?utf-8?B?SjZBcEVMOXhuc1pTVUdZTVM0TUpCT0F5Zm1qOUNlMllaQ3RjdWNmMWtUaE56?=
 =?utf-8?B?U3VSRElJd3A3djFzRkp6ZzEyY0VYNjVCaUJ3dW1OYm44WEdvbEs2RWVFNTNn?=
 =?utf-8?B?WEVWMndjc1drUHFwM1A2VnFZT1dHRmlXZTArSlZ6ZlpPcVlGblNGeGs2NFg2?=
 =?utf-8?B?T0g0R2dIKzB4MSt2akpZdG9Cb0pXQkRsSXo1U1d6eG04Z2NFSGVlWGpoUSsz?=
 =?utf-8?B?eTZEOFg5eWsrRm5wNDVmQ1Q1RmVZcUpKc084WTNtbytBQ1R4TkEzR1g5blNH?=
 =?utf-8?B?Qy8wVzdIODlvOVJYOFkzSGRxZW0wY0lzK3hQdFZZcHNLNzREYks2V3M5a0cw?=
 =?utf-8?B?RUdyV0pRUXptWlIzMTh3dWhtb3Y4R3ZKdnN0V3NqNy84WXcwcnlsU2wyWk05?=
 =?utf-8?B?VVh1QmRjY2FuQWxnYUVxQlhGUkIwWDBDU3ptSGU3MGhTZTZaVGZqV0wzUWxF?=
 =?utf-8?B?c1ZVcDBFU2gyTmxnSktEcWNITEt2eElZUnRhb1dzVTd6L1E2QmNnQ2h0T0lh?=
 =?utf-8?B?d2VGTW9xaU9pZVRjaUxZUlFnVEEwaDk2UHMxZkpka3k2UTZkcjd1NnFQOFpN?=
 =?utf-8?B?VEJyVzNNSHVhQXRPdzMwaEZtWUYxanJ4TThpK2Z0d3hoSUdxUU5TWGdrVTM4?=
 =?utf-8?B?RGo0UmM0alQ2WWpCQ0svQzVrOUN5VS90aytia0NyTmt3TXZSRU5tZnhoQWJa?=
 =?utf-8?B?bThmbVVPUys5RndZZUdtV3N0bGN4LzR4RHV5bEtkOWZnQ3pnS3N6R1JlNTN6?=
 =?utf-8?B?TDlNTWZpQ202NFhRK0xEdk40R0o1TjUxWnQvZ0FNc2tyL0kzWmFxSU1OenhM?=
 =?utf-8?B?Q2ZsTi9RMW1pa0ZEbzYyYUh4UnN0QnJrbTdQcHNqY3R2bFRRMVFiNG1SL2g2?=
 =?utf-8?B?MVhFOHF1Mi9QUk5oTWpuUVFNOHpyN05LUFJ0d2EyU0VGWlcydUd2eXlCd2Z5?=
 =?utf-8?B?S1o4YmFpcXRTSTMrejJiWXBRQjFmV29YSlQxOTJVU0lUT1RlK3U5VDVtNktj?=
 =?utf-8?B?QXR4bnpvaURIY2hmV0grc1R5UlRpZmE1eVl5Z1RSTnRpTTZRSnFPNWVpOXZJ?=
 =?utf-8?Q?p6jtVmOqyCjslGFlFj/zjdx52?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5927a15a-848e-4132-5dfe-08de169d0895
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:41:24.5055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeYPeDQffVh+6KmHQXj1TNB5lYhlJwVZZtA6wVoSIyw+sa2cSJ16JE1EpdBSaf4dDU3MkMjECRD3h83o1chdEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10975
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

On 10/28/2025, Francesco Valla wrote:
> [You don't often get email from francesco@valla.it. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> One option for the LVDS port of the LDB is to be connected to an
> additional bridge, such as a LVDS to HDMI converter. Add support for
> such case, along with the direct connection to a panel.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> I was trying to add display support for the i.MX93 FRDM on top of the
> patch sent some time ago by Fabian Pflug [1], using some of the work
> already done by Alexander Stein but not yet merged [2], but then I
> noticed that the support for LVDS-HDMI converter bridges was missing
> from the LDB driver already present for the i.MX93.
> 
> Not a fail of the driver itself, obviously, but I wonder if/how the
> existing i.MX8MP setups (e.g.: [3]), which use the same driver, work
> correclty. Unfortunately I don't have the i.MX8MP hardware to test them.

[3] was in my previous patch series[a].  Only patch 6&7 of [a] are applied,
so for now [3] doesn't actually work with i.MX8MP.

And, patch 3 of [a] supports the external bridge this patch tries to support.

[b] is another patch series which includes my patch.

[a] https://patchwork.freedesktop.org/series/139266/#rev7
[b] https://patchwork.freedesktop.org/series/154381/

> 
> Anyhow, a patch for such setup is attached; it was tested on the i.MX93
> FRDM using [1] and [2] plus some more devicetree modifications.
> 
> [1] https://lore.kernel.org/all/20251022-fpg-nxp-imx93-frdm-v3-1-03ec40a1ccc0@pengutronix.de
> [2] https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@ew.tq-group.com
> [3] https://elixir.bootlin.com/linux/v6.17.5/source/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
> 
> Regards,
> Francesco
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..fad436f2e0bfac8b42096a6fcd0022da0f35284e 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -294,7 +294,6 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct device_node *panel_node;
>         struct device_node *remote1, *remote2;
> -       struct drm_panel *panel;
>         struct fsl_ldb *fsl_ldb;
>         int dual_link;
> 
> @@ -335,15 +334,24 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>                 fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>                 fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
> 
> -       panel = of_drm_find_panel(panel_node);
> -       of_node_put(panel_node);
> -       if (IS_ERR(panel))
> -               return PTR_ERR(panel);
> -
> -       fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -       if (IS_ERR(fsl_ldb->panel_bridge))
> -               return PTR_ERR(fsl_ldb->panel_bridge);
> +       /* First try to get an additional bridge, if not found go for a panel */
> +       fsl_ldb->panel_bridge = of_drm_find_bridge(panel_node);
> +       if (fsl_ldb->panel_bridge) {
> +               of_node_put(panel_node);
> +       } else {
> +               struct drm_panel *panel;
> 
> +               panel = of_drm_find_panel(panel_node);
> +               of_node_put(panel_node);
> +               if (IS_ERR(panel))
> +                       return dev_err_probe(dev, PTR_ERR(panel),
> +                                            "Failed to find panel");
> +
> +               fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +               if (IS_ERR(fsl_ldb->panel_bridge))
> +                       return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
> +                                            "Failed to add panel bridge");
> +       }
> 
>         if (fsl_ldb_is_dual(fsl_ldb)) {
>                 struct device_node *port1, *port2;
> 
> ---
> base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
> change-id: 20251028-imx93_ldb_bridge-3c011e7856dc
> 
> Best regards,
> --
> Francesco Valla <francesco@valla.it>
> 


-- 
Regards,
Liu Ying
