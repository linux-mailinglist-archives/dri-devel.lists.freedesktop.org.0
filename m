Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A73BDDE4D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 12:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5835610E286;
	Wed, 15 Oct 2025 10:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JjiXBm9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B2610E286
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArJ0TCgCAtKOKM22wW8VoUVAI7m9usEhL8vYdeP8gcuZgRId6Qkl29E1TWo3s3CaNw9tfDx7sBUQ9YMI6JE9QDiUXn7KATtZH6NHF3/h49RjsJlpXbhJM62yrNN1ObJv+WcvcKIjoBjXOTut3CmdBJJOBpqKfFl9UAurJ39Iw5SwTbwnyMxpCHBCrVZWlarijicRYwCQKoLpcsInT0z1AgdQBchxdWmMOzZ3kuDCP3tIJ32o9PwECv2gaJI65zUWvpybLNaw+A9u3T/DAW86iTYzyaXt6YXqvxKmLQR/ds+SsdoWHt59JP4FMIU04OLvMmKBin0JPBOq//431qg7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLowpIT+MwLwp8LY/gITwRgoaaYLwOxNtBj+X3R4nCs=;
 b=tHdhi2ILZuxxjCd6wBSnIJ48lRgViejrLHLgkfs3MYahQaukWp4/1reh5R6q4X1wAAmB+b5WbFd/pPFauSMiQsXyFSMP7sxIQ9dDLHfDBtuRm1AqsUoiFZlobkRrKni46tdTNcHKaCPj2cr4DRj00duUGCQRHHKkVbMEhv7pqsUnmdjgIpxURNDReXeJ/+s5w5od5mUiQlEnfRteqblQSjKfrNgTXS4Li/2mQfPSp/tY26hcRwjDIekkjbP4EChx93V6v/MCNiDp1PFdI+ytBzywZcP+cF2hM3pAL70vpSfyEqZBuax80EKCXgw4gztfzN7gbCaTyW6QnZIeA+O5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLowpIT+MwLwp8LY/gITwRgoaaYLwOxNtBj+X3R4nCs=;
 b=JjiXBm9Nl6w4EfMWL3kx1hNVh4RxFqbZ+63IqRjGIH4PEFEiMgtxDEJ4CekA7vzlcHyX//gvK/GEB19guGQcpGBHsKEGR44D99x54Fd0EDM6b+Aa8rGmoXu1uo9Kknk2IA/kqdMCzGsFoJAspNSseQzvJr7KGbCSlSdhoBAxBwR0OX5a6nqtP77+JNGmDJQwVVnxSiFOb79KQzQZM8cgeGNcU0xlSSDSu7+a6FP+dZYFmu8judCh8o9RQ8eNlyMXif5Mo3LmY/fRgb5gQUMqgNcaHeBBY+hIyyOVZvZnyWK+2TAIeQ/G3PHXIDEoU4uI7d2DYiFYFuoWPevd71OEyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10782.eurprd04.prod.outlook.com (2603:10a6:800:25d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 10:00:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 10:00:09 +0000
Message-ID: <92d928cc-d9df-4c9c-8571-da39001b91a7@nxp.com>
Date: Wed, 15 Oct 2025 18:00:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
 <2c4a42eb-8c49-4ba3-baa3-921ec52f730d@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <2c4a42eb-8c49-4ba3-baa3-921ec52f730d@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10782:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d4094f-76ec-438e-3144-08de0bd19f9a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|19092799006|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTI1VFBFeVlMNjJ3NUFSMGt4NFZHTzRwYjNxVDQrdjdRMXY2R204VkFVbWlJ?=
 =?utf-8?B?alpkUy9NR3liSGJhU0VKZnZ0NXVjcnI4NnRTTVJMSUhRbUhOWGt2WEZVZUlE?=
 =?utf-8?B?MmJGMVNvU2UwZnkxY2R4aUZLMy8wcDcwK0libUhQRDYvU0pxOGVWTXJMMDg2?=
 =?utf-8?B?VWwzNkVUS3ZSWHVEVXlISHFJYnZLU1prY2dqempKWWVSVC9CNHZmVDFRVUpG?=
 =?utf-8?B?YlNMUGVuSGw1Yk1Ianc1RWRVcTVMZ01RZGFxRnkxQlhYYy8xb0xNR3JQQUhn?=
 =?utf-8?B?SmdmS0JxVlY0dU9aZmd2MmZkbFBsanhLanJncG13NXpidzhaSGhwa0xibG4z?=
 =?utf-8?B?L3p4ZHJZc3EzUk5tY2V0amt0ekVXZlR1a09EN2RpaHA2b2tjbHZoZHhVNE90?=
 =?utf-8?B?UUkrQjd3elFTdTFHeXFPT21vTWxVTEk0SU9GcTVtUENSbm1UY3oxOXNQU0Qr?=
 =?utf-8?B?MkhwQTMxbjE2cjdNbG1LMTJqSzNRR0todzRQUEE0c1FSUmRTWHB0UWJVN2VC?=
 =?utf-8?B?L1pmSFdEOEZWUlpiZ2U0UlEyRVhZUnFDUG1JMVJJRmxBZk1OM1UyN2VFVHJm?=
 =?utf-8?B?a0VNL0QzUVZNcndZZ0tNYXhSNHNyQlpZUnIrMnNSN2NaMVVLd2wrazdsMmdp?=
 =?utf-8?B?S2Foelh3VUFBcUZMNzRMb2tHSHg3end4aWF3dDVJczdWSElhNEE2N2JIa2hr?=
 =?utf-8?B?a1Z6c2l3Qmo1MWc4UUJDV0VISk1vUE1kUXA2VkFkRlBrbzdJU0xtODFOaWs5?=
 =?utf-8?B?VFg0ZEkzQ3hMcjZlb1VObjI3enN0amNGdzVsMks3aVRMbWkyTW1KK2x2Z1h6?=
 =?utf-8?B?Z1IzTGExZE4zT1g1a3lwTmQ2bzZZakQ4Q21HRkw3OTlsMjRnellab1Fjb3Y1?=
 =?utf-8?B?dk9SL0ZuSmNzU2dodzdqUEFYamhObG9aYzNlMEdMY2FUUS80dWtyQ1RYR2J5?=
 =?utf-8?B?QXRzMDZpMlcrZXRKUTQwRTl1K0taOC9ncisxUkN1Vk10UTJhWWQrQVh6dXZZ?=
 =?utf-8?B?clZXcTI1WS9kS1FqTUNqZ1FEK2Z5ZjY4U3BBeFFjT1h6cGxBVDg1bXFtVWtS?=
 =?utf-8?B?NHh3cUZtaFoyajJhVlB3azFzZEFQSjJxalR3NTU1VExTcWVpWVJCMEQ3Q1U0?=
 =?utf-8?B?blU1SDFzL1lGcTgrK0ZJNXZ1MzFETi9TSU5iRVk2SkJyNU92WTJFcnlkYVAx?=
 =?utf-8?B?c0lRMEZHWHFuczR0QTJZU3B4L2hzc2d4T09UUlZIUHVhcEJVY0FHV1dYT3Y2?=
 =?utf-8?B?VEg1WjJTenhrbENJVXU0cGJqaUk4QUhGZnBaZHR4cjZaWHllUnUxUEpzcEdw?=
 =?utf-8?B?cXRhYmw4emxjempoeW9KcGhUQnMwTVhxanl4T3dXMnNncFZEc1NsM0xvRFlY?=
 =?utf-8?B?YTExK3JlamJhVG1KdDNHOGUzUitmVUhIWU9lVS9DSlJtcHVhME9YUmt0enVy?=
 =?utf-8?B?enBneTZiZGVVaXNsdHBCcDQ5b0p3NVU4c0lRZUxCa0crUk9BeHhlSnFxYVJZ?=
 =?utf-8?B?YnhwcHFGWW5tRGlWSU50Tyt3aVFqTWRMQWZOSzZnWldBTzJGUGhrQTZQeG4r?=
 =?utf-8?B?MFUrZ3laanJYZFpTWGdXbHRwd2hyVStVOElxbHgxZGlIc0ZzREhWaDVHSkdP?=
 =?utf-8?B?WjhoWHRzT01TMjFlNDU1TDNJeVBmSzRmT1VkUnpDU2xhVVNpYmRLc05mc0VM?=
 =?utf-8?B?MVlFMUVuRVJuZ28vUDRSTG1XcGQ5L1FZKzAwWkFZbEhXZ3dZYTVxaUVsT2c0?=
 =?utf-8?B?dGptTzNObG1KeTJ1L1VKZXZpck80bVRhZGYxUndneW5kMVovR2FrZ3M0cGtK?=
 =?utf-8?B?WnlseExNYkxZek41S0w3L1EydUdNa1ZoR00xSkhCbUJZQ2dQNUxsS2tkelpu?=
 =?utf-8?B?VHR6U0FqcFMvMWJtYzVhNTJrM0lsdU81eHVjbTBBWk45dUQxN2tUbzZ0MVY0?=
 =?utf-8?Q?GvQbXs3JauuhScJouWpxTgs67egSFiZn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVM4d1FEd2ozU3JObmdqb2lPMzFzNVRWd21LT3pDK01YSzdxTGQzRzM2Wlhh?=
 =?utf-8?B?TkVqVG40TTdPQ2Ixa3pVM1podUtFL0hHNW1FRXFIclEvZWZNVTBma2xBN1hR?=
 =?utf-8?B?Y2dLM0JmSDVhaG1OYlpBTE5xU2Q2eVludmV0TzI4WSttR0ZpT3RxVzNaaVVl?=
 =?utf-8?B?Tk1xMktNTTFDNmh2REFWS1d6MEdjbVpmc2J5SVZXaEZmN29EczNYbmQxKzhR?=
 =?utf-8?B?R2k2cUJXZ0VpdXp6VDBIN1lua2dFN3BJejJoQUVUK0wyQVpTSjlFK0llQWpu?=
 =?utf-8?B?UEYva0Z4a0ZHcjdnREVHcCs3dHBkdDRidWlSYzVKT2hXeU94dllEd1B6QjZI?=
 =?utf-8?B?bi9Fa1k1eVdLKzFGdU5LY25xQzhhOGRxdFJldk8yOElEejE0UzNaRGJSMDNv?=
 =?utf-8?B?d0d1OFk2aWErMTFLdmtyY2NaQ2puUGhQOHpEM0xRSnRYRVlneENXbkFHOGc3?=
 =?utf-8?B?NGVWOU90dS9XeUR2WGtva2NYamJieXZMa3c5VzlOQU1qeU9tQ3dCOUtGc1Rx?=
 =?utf-8?B?eHFBaXJXbVhpRjVkQ1NTcHJMMmd0MWdlMUMwWjRwVGQwYnBZRXo4N25qM1JZ?=
 =?utf-8?B?S04zZFFTNVR4RWtVTU5sTEJLVGczTm0rRlZaTGpnTWJacHkrTy8rRjRmNHVp?=
 =?utf-8?B?bjRvNTE4c3NHNVZUcDlzY0wxSEZiakVsQmtOaGZuQW9qODVEdGxMRXMwZEhO?=
 =?utf-8?B?cVFscDdWZDdLbHF1RDZYYjY1dSs5WEZBZ253alFESXdEbVM1TWlMc2hSelNR?=
 =?utf-8?B?WDZzRlNoVklmRWxzS00xWWNvdlh6WVR0b3ErVGhydVA1OWN4WEUyU0IwNWE2?=
 =?utf-8?B?ano3SFJFWGVVS1FxcVhLWEFwbW9iNVFMU1BWZjNYU09qNmhkUzg3Q2tBWTNP?=
 =?utf-8?B?MEI3SnA1SytSNXJGcC9qUVdra2Qyd3VWZElCWjM5TTFQak5WWVcxMEY3WDVl?=
 =?utf-8?B?bGtkMDN3NWVGK1psODQ4L294YWp3MVo2enNuSXZCOUpCYTVIckhPaytOMkN1?=
 =?utf-8?B?NWhVT01pL1BSY21reGxxZElsZVUyaW9iQWlqSFBjMytkM0RxalhhdkdxbllB?=
 =?utf-8?B?czlYNVJkelNCTDFFOEp1ZUFCRjNhekhqL1d6alpiN2cwaG9taVI2djJYTzJh?=
 =?utf-8?B?Tk5ZZnRlSWczbHFEaHY2d2NCaUw5L3dYVjdTL1FBTEE3RStIWklTb3N5Tnhp?=
 =?utf-8?B?Y2swSkN6NG9rSXFEKzFHNUZsZVhCRE45MWkrbGxWc2hPTlUxVU9rNW9UOUwz?=
 =?utf-8?B?UlpESzRBR2QvSGlPdnVwNFZjWEM1SXBnemVGSHkyT0pyYkpML2xhN2ZUWTMr?=
 =?utf-8?B?a0V0WjJIN2llbE5qUlpGK3BBeVFOQkNvQnpYRFRUUllIUnlOSE5weTV4NFlU?=
 =?utf-8?B?bmF3MU9lSmNneXlYa2h0azhNU2EvSU44VTdTc1ZCc3h2RTF6RmZjbzZJUHZi?=
 =?utf-8?B?RnV0T1NtekU5WEZ6bDByTDIxc0F2RU9XVUtneERleWZxb3RJb2tSOEN0L0Fv?=
 =?utf-8?B?Vkl2aFl5ZVpYMnd1bGxJNklPMzdLRldacitZc3dCQkZmbnV6MDdDVkp3a011?=
 =?utf-8?B?Y0NqWU9ud1EvZWwyMUpqcUlxTXlSZzg2bFNXM2wzTmt0NnJ4SW12S001ZEhZ?=
 =?utf-8?B?NFZBL3FmdGJ3L1I1dktUT2RaamI4ZklEVUY1YldQaCtOTkFjaG9uWXl6eTVa?=
 =?utf-8?B?REJBSE9QMUMrWTUrU3hlWDZFTkZvVzVubWdIUkJoaXhBQ052cVIwSFc0S1lU?=
 =?utf-8?B?VXpuREpCTnBHZ1QyZjZGZEdvMi9meDJaR2hLTlhDSXpCZVZsOVpXRVpEVUtw?=
 =?utf-8?B?QVFJbGx3MDd1WUZsOHI1SjFTYncySWYvWjF6VGpyeG9SNUtqTVY1ZkpZL0NH?=
 =?utf-8?B?OUY5TGpraDNwVkZEK1pValRzZE5mVWNWWllqZEpsT2pnN3JTNXNTUE1rRnAw?=
 =?utf-8?B?ai9UUExrR29jeE9zdTRZaEVKS2JGVXVac3cvb2dVVmo3Q0hubUVCRVhBS1Bn?=
 =?utf-8?B?NzlhL0RJZExVWlN6SmxIOWg3T1dncXdmQSszUFlvSUhpTG9rK0Y5RXdIRHpL?=
 =?utf-8?B?OEpyT0U4bk5vNEFuN2tGcDJJSlFGQkxxTzh1cDVRYTBsa1ZTQ00rVHNxelYw?=
 =?utf-8?Q?zrvYXIm/mK48gv//1NMQdyXXI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d4094f-76ec-438e-3144-08de0bd19f9a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 10:00:09.0223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JbvIt7EEvKcSxRhB45bX/wYTXTVPK6pnunQvOt1WRQ5NaBMDCZ8qlKUazxKm+/HvUD1BeGKPmEsXmVFuVFLWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10782
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

On 10/14/2025, Marek Vasut wrote:
> On 10/14/25 10:51 AM, Liu Ying wrote:
>> Hi Marek,
> 
> Hi,
> 
>> On 10/11/2025, Marek Vasut wrote:
>>> This large series adds support for the i.MX95 display pipeline, including
>>> DPU, DSI and LVDS support. Most of the components extend existin drivers,
>>> DPU is added into DC driver, DSI into iMX93 DSI driver, LVDS into iMX8MP
>>> LDB. Pixel link and pixel interleaver drivers are reworked to work as two
>>> independent channels, since there seems to be no dependency between their
>>> two channels. The i.MX95 DTSI changes are also included.
>>>
>>> Since the DPU chapter is missing from the i.MX95 RM, this is based on the
>>> NXP downstream kernel fork code and there might be issues.
>>>
>>> Majority of this series are DPU patches on top of the DC driver, I tried
>>> to keep them separate and easy to review. Later part adds LVDS and DSI
>>> support, this can be split into separate series.
>>
>> Like you said that this patch series is large, please split it.
>> Also, make sure proper maintainers are in TO or CC lists for each patch(b4
>> tool should do that automatically for you), e.g., patch 37 should be sent
>> to Thomas Gleixner <tglx@linutronix.de> according to MAINTAINERS.
> 
> I had to trim down the CC list for this series, it was enormous.
> 
> I wanted to put this whole thing on the list first, before I start splitting it up.
> 
> For starters, I think I can send these separately:

Before discussing how to split, a bigger question is that is it fine to
support both i.MX8qxp DC and i.MX95 DC in the same imx8_dc_drm module?
Separate modules look more reasonable to me, considering the fact that
there are quite a lot difference between the two DCs.

> 
> - drm/imx: dc: Use bulk clock

I don't think this one is needed because reach relevant block has only one
clock.

> - drm/imx: dc: Rework dc_subdev_get_id() to drop ARRAY_SIZE() use

It doesn't seem that this one is needed either, if we use separate modules.

> - drm/imx: dc: Rename i.MX8QXP specific Link IDs

TBH, I'm not a big fan of adding LINK_ID_x_MXy to enum dc_link_id, since
the members may have the same value and it's kind of a mess considering
future SoCs.

> - drm/imx: Add more RGB swizzling options

This one seems ok.

> - dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX95 support

Ditto.

> 
> Then in second round, probably all these clean ups:
> 
> - drm/imx: dc: *: Pass struct dc_*_subdev_match_data via OF match data

Same, doesn't seem needed, if we use separate modules.

> 
> And then rest afterward.
> 
> What do you think ?

I kind of opt to separate modules.  Maybe, to save some code, an additional
module can be introduced to wrap common part as helpers, plus some callback
magics, like fg->dc_fg_cfg_videomode().

-- 
Regards,
Liu Ying
