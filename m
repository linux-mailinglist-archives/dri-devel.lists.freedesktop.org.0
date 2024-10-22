Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01219A990C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 07:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C81610E5DE;
	Tue, 22 Oct 2024 05:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SPkffYIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2069.outbound.protection.outlook.com [40.107.241.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C5010E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 05:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUs3eYgDqx3tjL2it9ZhsDavSZ3odTjWP9iHRyEJ/gogmwTmQzx9WKwrYd8GNunCRfUHPebdDnl7kwj3hhL8jVNRED+2uk7K40TAvddWen9x6j4Uq9YFWLFNgDzz3E2Nr32Ic2gi9ymKnT27mXTiTGizhVGoNIoljYWK610/z33CVlQC3XBxDzVWIrTDE4dzaTxSSZfTGM5aSH2swoNoZZGIv0NSy3NxBRQbhDKZq6caQ8K7Z4tr0TvLIbA+/L/w5KmPr824fGt57FXTPuNc3V9TgvHHdmEo0kIjmhqmNc79F+riUhD9n1/dUln1rCE0hXVzmnUFF9Eb/VdIkjz3UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyRcQMkBv3uSXBOKlAJqIb6BR99sC2U6rR9Mryfzmm4=;
 b=gWGB8lynBSo56DOk2v9+ASES01qAvkDBk1zSqSS3Yj7MmC1cwWN/uwjTgALfsElLvSReeAVLYOK3upPDbU+Hr12bYELSQLIaBwMcev+8dUyEl/kQohGGTXKcE9rfrKW7L9OK+ZOzlBo7c4Z33aggzX2l7X60AkXgXaG1EdRy+Vug4CGFQPM0/44Qov0Ue428VfA9yAGK5gL5p/2QIc6LeMXOPqeHcIGsd8swOU4LRQnMmsea1BZYUHTdC2O0DOvPcGd0OWRgDipucljfDjrmzgBBjEBoFDLddq0g/LRgPrKml7oHI/shBfwkBaAyEa05qnC6v7pgO3xrIJJtV4C3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyRcQMkBv3uSXBOKlAJqIb6BR99sC2U6rR9Mryfzmm4=;
 b=SPkffYIivGHp7QCGratdiB1+4dS8JJ3MKk/hM0As164ruroWvLKRrDjwYhtzGW6QKvybDvqswnVj/2oEkRjqa/2TjHPumZIYpXZ7lw/4+ZMKPSYDPgdkvi+gHsIhZzMyM1sy6ts52rjhNopb/+Dlu/X8zC99AKz3Hghm0fv8DnFtY1QbEyx9Is9cB2+YusRwAXJ9NAti7ThQhTRYOWCphCLQnPdCDHIEIjD2AmgAQiLwsYVy4XsZRPxaX3ciBocDKvtjoNrP77jdjUpUqyfI48TcHpI9wSaCjFTYykFhirpBKrLso7rtNU6jxL3cr6yiXPHxErUiXWdE1E7fWsnbmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 05:58:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 05:58:48 +0000
Message-ID: <6d7ec7de-4d48-4273-a707-c70e34996787@nxp.com>
Date: Tue, 22 Oct 2024 13:59:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <20241008223846.337162-2-marex@denx.de>
 <d6a34efa-47ad-439b-8b0c-a427cf087cb3@nxp.com>
 <0e47b529-59f2-4d25-8c5d-30ca1dc4e964@denx.de>
 <3341a6a7-ac0e-4594-a670-b3a6d583b344@nxp.com>
 <207b20ff-cc7b-40aa-8dde-bc5aabdfb414@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <207b20ff-cc7b-40aa-8dde-bc5aabdfb414@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB11037:EE_
X-MS-Office365-Filtering-Correlation-Id: d8281e75-87a7-487f-39c5-08dcf25e98d9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUNsdkltelBuM3NvU2hyWkswQXFJNmdvWFQ0RGlzNEhkTEUrcUVJUWFNT3dm?=
 =?utf-8?B?Mkh2WW5oeWE4MGJOVWR1MkVoYjdOT0ptc1Y5V0hUZ2dTS1RQK21IaUJQa3hl?=
 =?utf-8?B?N1EvL3FhWHg4cE5IK2dsSXRyWjRBVUhSZEZ1VkZ4YTdSMWNheGNsbUN5ZkZG?=
 =?utf-8?B?UXNmOThLYWNhT2dVSWlWZ1drOGZDQTBwZmtRM3JIaE5ZWFhPbi80N3owdWRp?=
 =?utf-8?B?bnJqRk1CYzRBSk5RWkdmRm5OV1AzTjVEY2NiQWh4am5aM3JBMjRzVzJSOU9x?=
 =?utf-8?B?czJ0WTIyR2o1Rmx2Z0ZVNjU3ZTBDelVTL3FqVG5GK0pOcHE3ZjlVUkRMWVNW?=
 =?utf-8?B?UUhIenY1d0NyZ3JrWmVVRHlOVm5aT2dUdVFGWjhkdXg2TFI4ZW9FZkpxUStK?=
 =?utf-8?B?bTVCMnREMTFYeDdJaEExSGFSOVJpbXJVQmRQYUdzZ29xaVo2Tk9FM3BMa1RC?=
 =?utf-8?B?VTZrdk90d0RJN2EydkR5SnY5TzV6eVJra2NqdXBRaGJYK0FMNFlMUnhUU3dY?=
 =?utf-8?B?OVhacGtoM1UzQTJZS1RpZ2lyYUlnbE1INFBVc0NCTUFRTnBxc3ZMeHBZY1pK?=
 =?utf-8?B?VVloeVo3SEtlOXFzN0pkdjFKOWtWdGhON1NOSWVTRmIvUnZXZkwrTFlOQmxa?=
 =?utf-8?B?QmFENllTUFY0RUhRK1R5Z09ubk9RVFR6U0UzakhWLzQwN1JrTDIrQmVMdnFH?=
 =?utf-8?B?RXRlNWxlZSs0cDlmVXNtZ3p0NzRWOXphZVlGeW8xMkJYWENYWlVIY3B2MjdG?=
 =?utf-8?B?VkdkTWI4V3BSajBCVWp1dmEzMDFWcmJSU2Y4Kzd6bXh0SGJyQWJyWDR1Mjlr?=
 =?utf-8?B?TDRjSThVaWlWK0VEM3RiMWk2ZVRuand6OG9NcVViejY0ZGZtQ3VIQys3KzB4?=
 =?utf-8?B?VnNWQjlhbnFwZVlQY1laM3hFNVU2RVFIWnYzYkFjTEJ2ZkpuT1FGWWpyOUx5?=
 =?utf-8?B?OE13WGFEOGpaZEsyaWVLZEdyWjI3TkxaUmh0MjZIWm05Zi9YOXNsQmtYVlI0?=
 =?utf-8?B?d01EcC9pdjZpd0sreDRHVWo3eDdQcmEyemprazFaM0o5NDJzQjljVGk2V1Va?=
 =?utf-8?B?SjI4YzNPSW44cXg3ZFhpdnJZc2UzRkVPaXB4RmFYc2FKY09IaC9abG5GQmhn?=
 =?utf-8?B?VE15MUdtbDhObVlKRkNKTHJKVzNZUU1sQnNmeG5tVlBWWlhoTWtHVkovQ2NH?=
 =?utf-8?B?bnRpM1NhQ3BGMzFSWGsrajZTcVhQVFdYcEMxL0t2cndiUmRhYW8xQUcyQkU5?=
 =?utf-8?B?SXlmcVQ3eFJCNE5HMGoyS2JBUUo3S2svcUVha2xsdklaTkNSZ2VtZUJFNnlv?=
 =?utf-8?B?QVVXTWhrM1VoNWdOVDY3N2IyaUFkYytkalI4NGZ0cmpuRTZvRnNSR1ZGTUxk?=
 =?utf-8?B?RlNpNG9pcDA2QVk4UFRDTWVreFVpdUI1Ymg2NVZXUW9lcU12TVdzbGtHV253?=
 =?utf-8?B?SysxTFk2NXRUaDg2dnpocG4yYnNxVzhDYlJDbkE1NlN2U0xWb2JjZ2ljblN2?=
 =?utf-8?B?S1hIazFjU1VYd1FNMmllbHVwdWJ3bUdjczNkVTNpdGJIdm1KZXdrMkNNMXhO?=
 =?utf-8?B?TytXM29MSDc5V01VWERaQ2dSaUJqWjViVDQ3MkFsaG5HMWJ3UkdMeWJNV0tB?=
 =?utf-8?B?REJZOVlYQlp4Wm5Eb0ZLWHBHWkhOVEpWcUpTVjRmZk56YUQ4ZDRKWmNSL3Uy?=
 =?utf-8?B?MGFZRE42QVlKcVNVakp5TFpiaDhVMC9UdXUvcktmUCtocTc2RFV1azhaTzNu?=
 =?utf-8?Q?hgw2EOGD1+/Xxa3pYo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2dzbis0czNFdENyQ3FFT1lRbVNnd292bytKT0tYdkdhem9RMnRRZlNaa0x2?=
 =?utf-8?B?M01HMEh0ZWlIaXIxajlMQlV0M1hlZ3V5ZldwNmNMMlBtWXBBankvY0N1RGpB?=
 =?utf-8?B?em9yc1ZsaUUreHZQUHhvZHM1TVdNUEtlRWpTb1c4SEtGWGFhanFsdVprZ3d2?=
 =?utf-8?B?Q1JJWVdKS1dVQXFGaWJZYWRQeGcvVzV2cjV0L01EUmIyU0NmNndscDlrSmxw?=
 =?utf-8?B?M1J1Vjc0QXQ4SlEyN3pyR09ja2kzY0RRMGxPVTlSTEhINFY2aEpKTzVHTmZ1?=
 =?utf-8?B?QXJOeHVxUzV2YmdBL2JiTXNnNnZrL1diTHV5SHA1YVMwWXJ0ckNjcnVFZVZG?=
 =?utf-8?B?V2o1S1pyclR2Z1RxcWw3THdIQ1BHUmlBSStBNzhzTHp3Z0YrOFhnd2xkQkxX?=
 =?utf-8?B?N1V0ZHRaREVvbzRxMEhxS2VPazlqS1RMb2l6V3hKM1lGY1c4U3YwVEh6Sldx?=
 =?utf-8?B?Y043K0puUXQyNEk0blhoSGFvRGJTRG5zSEI5ekpCcXloWTErZWx5TGFGWmph?=
 =?utf-8?B?NzBZY1paSVlVSWRSNjI1WFE5eXRsSHRtbnZUTTBCOGEzQzhaUTQxWWdzdHRV?=
 =?utf-8?B?QTZlYnc2ZVlZVXJMdHZFVXNQSVlhVWQ0WFRQU3M0NmhCNmJjbEgrOEdyZHlE?=
 =?utf-8?B?ZzRTbjlxdFVjUDF5RXpoTjNMQmQ3c1BpdWNFV0JnYWEzZ2hCN2ZSbmg3b3or?=
 =?utf-8?B?a1ZiK2taSjczc3YxZUVKRU9TYlU4SW1xUE5CdWJyQkRYRHhENGc4SW92ZXV3?=
 =?utf-8?B?TEk2Q0cwQjFSV2FuK0JXL0kxZ2lIeFVUR2JLQXVuUkZiU29ZR29mMy9hNGJp?=
 =?utf-8?B?RW04N0hxWWoxaU9ZYWllZHYyeDlxRXVPUEFKWXNodXczNERPUUE1ZURsY0ZH?=
 =?utf-8?B?RUUrOUhzakVlYXpZai91aFdaYWgvUUVUOWU5blNxai9QM1JXVjVDQ0NKN0l0?=
 =?utf-8?B?TDBxOHpqTmJTbjZaM2pFUTBLVjF5VnppUmxJeFBFWkRSZEVDcTdjRnRKZ1FC?=
 =?utf-8?B?RjlGeTNNVXVWTmoxYXE0cmx5YWpWd1NMSUNxdGFaTC92Y1hFWVVIb0x0L2NS?=
 =?utf-8?B?YlU2eUVTMW1sU2tTMXlLbVJwenZKdlZFOXBOZ2ZFb1dMZTJ4VGxIWVF0NHlP?=
 =?utf-8?B?NTFieklENWZYM2l0VUp5L2ZVcjZEMUExQ2VETUNoaUpqekFuYzRtejdYMTBh?=
 =?utf-8?B?VUpvTFpSTTF5ZUFCK0d6THdYM3BOM05aNExPdGVnZXMyb0hhVWpXREdTaktr?=
 =?utf-8?B?TWtIOERGOE5PVk02MWVEcFc4VVlSM3JBbUxVYjZMVklMSGx3R2Raa0JuSE5F?=
 =?utf-8?B?OHVjQ1hoTGxQd2xhSmNhcy9HeE92bnR3RU9nQnUxb21UM0Q5WlVZbHhJNXR4?=
 =?utf-8?B?NzVwQlAyb1lJMUs2MnJvdkdFU21UaVV2ZFVuVnFueXRhNUZzS3hvQ1FGWSsw?=
 =?utf-8?B?MzBwUlV5YmkrT3NZWWNtR1UwK29kTWxJT3dEUjZoWEZUKzhya0huNHg4aGlM?=
 =?utf-8?B?SXZjL1k5MWRteUhvbVoyOEQ3RTFxTWh4NTZUZEFETnp4ekZDZ0h6TG5jTWI1?=
 =?utf-8?B?TlJWdy9XWXVCTUh2bllnRW56TW0xZ2VWRGhYMWp5U3BNMllMcXBRVUVyOEtG?=
 =?utf-8?B?Q2pzcXlvb2ZHTGRuWWQrdHBwYU1mS1cwMi92cmVrWlBkMC9OV3ZYVXBwSXZL?=
 =?utf-8?B?Wk5RdHZ3RlliYU04cGhVRTVMQTdSeHh0OHFxSThjSGlsaE80NEtnYXR5S01S?=
 =?utf-8?B?a25iV2M4WXAyU3l3eUR2b3RrSHlsQXhNL0NxKzljRXV5ZUlDWFFHczlwc1Rh?=
 =?utf-8?B?WHcvM1I4QTBFUmVwbDBqbk91SGVhMERub2lqU3JKcHYwTmFkSGx0eG95Z3p1?=
 =?utf-8?B?eDJsTzg1aEZIZWREM0hRWWNJMTNidjcxdWUyTm11bHRsV2VHdkRJdWdUbVJC?=
 =?utf-8?B?VmN2OHBLbUlVdE5LRHBVUHlSR091ZzBIUlVxcTBrbUsyQXpQNzNySEpVQUtU?=
 =?utf-8?B?MHR4cy9wcnJabDV6Tjh5UTJzbk9nbFF4bGRkQlpsOE95RUFPSFl6bGthK0Fh?=
 =?utf-8?B?ZlFWc2VjcGh6cTI4RFZ4NDFVUmRjZGgzVmxSbVJpdmg3TngwWkhPQTM4dmU1?=
 =?utf-8?Q?HEdE/EGqceLt95aOKHPUdxax7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8281e75-87a7-487f-39c5-08dcf25e98d9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 05:58:48.7705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoQInRgpcHxSrCaCMGHlyT3wJhNlCq5WT1Cr8P8TxFsFUhF+cMP6E+HWdHRJqqBAT6wAhyzZKmA6hwq4j6VBlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
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

On 10/13/2024, Marek Vasut wrote:
> On 10/11/24 8:49 AM, Liu Ying wrote:
>> On 10/11/2024, Marek Vasut wrote:
>>> On 10/10/24 9:15 AM, Liu Ying wrote:
>>>> On 10/09/2024, Marek Vasut wrote:

[...]

>> Anyway, I don't think it is necessary to manage the clk_set_rate()
>> function calls between this driver and mxsfb_kms or lcdif_kms
>> because "video_pll1" clock rate is supposed to be assigned in DT...
> 
> I disagree with this part. I believe the assignment of clock in DT is only a temporary workaround which should be removed. The drivers should be able to figure out and set the clock tree configuration.

I think the clock rate assignment in DT is still needed.
A good reason is that again we need to share one video PLL
between MIPI DSI and LDB display pipelines for i.MX8MP.

> 
>>>> The idea is to assign a reasonable PLL clock rate in DT to make
>>>> display drivers' life easier, especially for i.MX8MP where LDB,
>>>> Samsung MIPI DSI may use a single PLL at the same time.
>>> I would really like to avoid setting arbitrary clock in DT, esp. if it can be avoided. And it surely can be avoided for this simple use case.
>>
>> ... just like I said in patch 1/2, "video_pll1" clock rate needs
>> to be x2 "media_ldb" clock rate for dual LVDS link mode. Without
>> an assigned "video_pll1" clock rate in DT, this driver cannot
>> achieve that.
> 
> This is something the LDB driver can infer from DT and configure the clock tree accordingly.

Well, the LDB driver only controls the "ldb" clock rate. It doesn't
magically set the parent "video_pll1" clock's rate to 2x it's rate,
unless the driver gets "video_pll1_out" clock by calling
clk_get_parent() and directly controls the PLL clock rate which
doesn't look neat. 

> 
>> And, the i.MX8MP LDB + Samsung MIPI DSI case is
>> not simple considering using one single PLL and display modes
>> read from EDID.
> You could use separate PLLs for each LCDIF scanout engine in such a deployment, I already ran into that, so I am aware of it. That is probably the best way out of such a problem, esp. if accurate pixel clock are the requirement.

I cannot use separate PLLs for the i.MX8MP LDB and Samsung MIPI
DSI display pipelines on i.MX8MP EVK, because the PLLs are limited
resources and we are running out of it.  Because LDB needs the pixel
clock and LVDS serial clock to be derived from a same PLL, the only
valid PLLs(see imx8mp_media_disp_pix_sels[] and
imx8mp_media_ldb_sels[]) are "video_pll1_out", "audio_pll2_out",
"sys_pll2_1000m" and "sys_pll1_800m".  All are used as either audio
clock or system clocks on i.MX8MP EVK, except "video_pll1_out".

You probably may use separate PLLs for a particular i.MX8MP platform
with limited features, but not for i.MX8MP EVK which is supposed to
evaluate all SoC features.

> 
> [...]

-- 
Regards,
Liu Ying

