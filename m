Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAB5BE137E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D95510E0C6;
	Thu, 16 Oct 2025 02:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="PWwggfW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAAE10E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqLYRuT9BIow+IPHqShEqq6DOuNX1GhS1ix9d3RdxpG88m54ER7gw38wDArMtDMaU99KemQamduZ15dXn3mcxD9IWwrAkaYPtp4Mfsqwa3xIJeHu8EpJW4lE4b1tsLec47Si/twJYyS+N5a25PQ6cVZLIgI5Bhor4+iPaCBJxcbmHOzCrJRrHlqAZpCwy8AVVylUd49CaLAu/+uK9nxFbsWklK8A83EVXdTerVSn/HhQUL5bV9FGGWDWXc57e2jjN6hVCcdHtxDV3TzTrOorfRt6K3Dl6Hwob7bUrme+FGHfOuZXgtsezIdNytpVmjVkllAzAQ8UegZYNqrdHhdH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnLDRSoEw3nq8Nihyks1MNkhSIeQvRxjQrHaIMhUqUY=;
 b=wOGuNSJdM07gHbIsxBgF2J7RWyWj9icsUw905+vCKdfL8ACX3K/PFRiyBlBnr1zgIc9PYUXs1d3N/06rNmOJ6aXRczO/T//IE1XAAVZT5BFN3WXu1qN35AcAAnvNg4P2LX4oX+v2etOhNtnwRrcIdNxqylo7i8qJQRUp0tZozoze+4rUF86fv3aJNxZ+tUNYBz+jcoBUVMRuzbYc7qzyERZcZNLZ9GRbSxj6njKeY0FspvN5/c5SrRuyF6pP0HrezBgdArapFij6Qrw5hklUjPe6yb3xRMLq1dbNaODXhmub5sblua1s7zetViDvEyQ1xCHiLTrNNSqL7HauLy7Ydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnLDRSoEw3nq8Nihyks1MNkhSIeQvRxjQrHaIMhUqUY=;
 b=PWwggfW+9SHxQ0o5d5DM+bXbQaiaeI3bwI4eLbFHif//GQA/8UO7J1Ieix/c78kEsKGRM6tuIbUfoMlOu6nwscgeXQDfnQu3qaNv3Dt5odkZB8B8yh/yaSttCyzCVlmbBAP4QhAyK13FxvrbOIe4URXr4AAKigs6wkr8YA3S99+KFIJlmDwkE6Z1VcL8lQet0sE5uhWFOaDtxw6QxwOAqpJGWjPJsOJyBMBrPSYZTi5S8YiJ9L2GqMhZ8ZhUEjP/vomfLPPlt6iVaO7hMKHLRc71b3kUDns67MVEXs9vTAcQRkdSJPHlBxWxfYeSs4pO/CNSjBxmTFzvB0qO4/hGbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV2PR04MB11352.eurprd04.prod.outlook.com (2603:10a6:150:2a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 02:07:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 02:07:03 +0000
Message-ID: <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
Date: Thu, 16 Oct 2025 10:07:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
To: Rob Herring <robh@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251015132442.GA3241958-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV2PR04MB11352:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d746f79-b0a2-473b-c364-08de0c58b2c8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHhUQzZNSHMyS1NvSUlLS2ErdVFGK21vVjFTQjlyeEZQdUYrU1JGM0JtT0JR?=
 =?utf-8?B?TmRDeFRVMm9nUnZMRWtvd3JteUFpMktxR0dvOGcvWnlLam14alkxN0pPWXhx?=
 =?utf-8?B?SUw0Vk1mVXg0WHRSOE9wRjd3aEZlK0tqU1RKTjgyWU5aWE8xc1RqZ0NNN3Za?=
 =?utf-8?B?U1FVQ25mQWZ5WllzUVYzdmtGMTRlT2hCMURwT2FCbGFYSFgxYXQ0MkpKc3Z2?=
 =?utf-8?B?VENnQngzRXhkRFM0UWQyczFsMnViaXJCODNiK0ZjaU8zaExLd2tsWG4raDBh?=
 =?utf-8?B?OEhHV2s1cmdjRlAwNkRBalRIdk51Wkx5ZEJLbXZhVUNiTE1wZ2E1SUVmY1dQ?=
 =?utf-8?B?Y3hNQ0w4UGVHczBWYURTcWhadVFHWlR1b2t2bVp6ZEVZZFNnOGg2cHpQcXNw?=
 =?utf-8?B?QS8rTUJnZHdZSzVBbnNzdnpYNFpETWRvTmQrSE9aajAyTFZGUk5FVVZrM1pK?=
 =?utf-8?B?Si9WeFZCaTUwWmk1V2FXZFJjeXBQVFhTMlNJV3FvdUZ0S20vSUVXSkhjSUsw?=
 =?utf-8?B?YmNMNnA0Y3F5d1FiMlZTZ1VMb3dCaURxNFNieGNrU2Z4TzdmRktkNTZQZk92?=
 =?utf-8?B?bFJCbDdFZjF2aVJOcDBRM2ZzV3BQN2NxYjJwam1NRGYvMEw1M2NxUEtUV01a?=
 =?utf-8?B?UEw4WmsxVlpiOENqTTYyZXZiTjFQNTBnU2tlSnFGNm51S0FWeTdLMUk5Rkd2?=
 =?utf-8?B?Qm81UEcwV3FnNk50Z2l0eVIxWGdCZHN4YmZXMGpxMlNCQ2xuMXR5S2FES3R2?=
 =?utf-8?B?Sm1jQjZPakIyNTVjaTczZVBhbTloWE1yMGpYNjhERTkzYzV6TG5zMExMQ2Ju?=
 =?utf-8?B?eGszRndZT3pTd3lHeWM0VEpvWmtaakhBY250NnZmNi9oRkNjd28vMzV3SVNn?=
 =?utf-8?B?RmhOV3hDb0NrSm9wakZIcDJTc0srdkdtamthdmxDNGYzQ092U1NNT1U3Sngy?=
 =?utf-8?B?WDBEa2FaOWQ1U1QrQllST1JrbzhSMUdYSE1XdWZORFR5bGZLa0FQcEpJTmZC?=
 =?utf-8?B?eGEwM2kwSGxwY0Y3QnU1NXVvK2xBSzdEVEcyYzcxMlJrbFBVMlE5VlRHZWl2?=
 =?utf-8?B?MEZlZU9pcXFGNnUyeStHTEpHTWdnMmxhM3A1TjRpQ3d1UmpaaVV2TUoycEtN?=
 =?utf-8?B?SXZnNjBFRXRzTFcyTTdIRXhIbEtMWGlWc25xUFd0NDNpU3RVL0RqSnM0eEdL?=
 =?utf-8?B?MFhtVndzZEpPVWVNQUpaaGRDVmhjN1lJZFZaK0FSQ3VreHZ1TXNaeHl6c1Ez?=
 =?utf-8?B?aWliUWFLaUZJODZ6c2poRjR0QU5aOFNtVTVTb1M4OUdrVmt3L2RGYlFJSE5K?=
 =?utf-8?B?ZXFDR3NKU3pDMnJnQVRIZnA4cVBhZjZWZmpsckxnRHlCd2tzQXFCMUFlU2lv?=
 =?utf-8?B?RElMb29JaFNsdUJ5ZDRZMzAvc2NFU3Yxb1hDMjcweFd3Umo0cTB5c2lsZGZx?=
 =?utf-8?B?NkFWRkpaYnh3enc4U0M1TmVodUVoSEFlSjhvaVZIRkkwV1ZlRDhQSWtuRTFn?=
 =?utf-8?B?NHVZSTFRYVp3dldBMlloSjVRQVV3OU9aWEl2M3VEUXp2NmI0dWxRODJIZjFE?=
 =?utf-8?B?TjloWGR3YnNOeXFod0RsbXZ2Yng1UVMzV2owYnozdTJqUmZvMWE0aFoyMWFa?=
 =?utf-8?B?bDF5TXl2M1VoWU92TFdBdFhSdjBhNVk0QzY0dW96cUdMTHN1L1VocXZsTkk1?=
 =?utf-8?B?YzNMaXhteTdGdHBscldzTFFWMm1pY1RaalZJMGxpMDZrcjlOSGJGcmxjbzc3?=
 =?utf-8?B?eEpTK29pbVJtSURxOUZzbDMxR1ZSd1M0Y0FMSXE5aGR4YmRHSXJQdnNMMlkx?=
 =?utf-8?B?TkpHU2JYa2ZkMUdwZi94VDFyTEhPTThWczJQZERlZTExSDlZR1FPTGcxVHVT?=
 =?utf-8?B?TEcwZEtHMkhMeVgrQWRhNU5zMUZRanR0blNaMWpVcnh0WHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWFkZUFOQ2pFMmcyU2pqOWFUU3pWamR1RnNLVnJ2SVJScTJxNlREaTVoTGhu?=
 =?utf-8?B?YTAzd3gvaTQ5d25YeHVyakt2ODlMTGVQdFdzOTY3ZGFVMTd6d2lJUVlWdjZP?=
 =?utf-8?B?bEV3Q0VsUjMrcTYvaU9XeHIvVmVNOGVZQnpMRkZxaVJLMkRLRkZKT2xqLzJs?=
 =?utf-8?B?cHVUYlpSdXZ0YTdKOFZ5bUEzMDNORkg4b080a0pYeHV4bjVveXpVQ0dEcDQ4?=
 =?utf-8?B?QWRoN0IzSVFFc2Noa09TWTl2U280dVdISkt4dnNSbXp3SVYrUDh4a1ZmTCts?=
 =?utf-8?B?Um1ydHV6cWxpbDJ1UlBMQ2xOU2tqS1VTcER6RkZoWmcvSWNLV0NIZTlZdGgv?=
 =?utf-8?B?WVdDZU5VMUE4M2doczhIdGpMR3c3Qk9PYXdacTgrbEhQL0J6cmxBeFZnUGIx?=
 =?utf-8?B?YlB5TGY4M3c1NDMxT3RHYklGQjlVeFhEUTBGTVhOQk9OOUYyY251ejVPMHhr?=
 =?utf-8?B?UTdzeG5GV05reks5Y0Vnd2tLL0dJZzU3OXk2TkZTOXNJdUpXM0taMHc0WUQ2?=
 =?utf-8?B?Y2JRbFFlaDZvcGFhSW4zSjFtVlFnV0NnRGF3aXZlQXdVbklCQno0QWdraVJK?=
 =?utf-8?B?NUZBVndvYjNiQk5ORDFDVU9zR1ZRM0wyNU9PaVUvSTdMaDROSXhocnJDRHdT?=
 =?utf-8?B?dzQvK1Bqc0hDcTJRTmVQZ0lzVmFRZWVncEtWZ3U2YXpiM21CUE5BdjlDcDBE?=
 =?utf-8?B?OWNqekRpTlhZRi9xa3AzUHYwcGdpKzd1R1RsLzJyaEJiRkFQM2NxbGZxTjdV?=
 =?utf-8?B?bnh6b295ZWc4SGxZK0o0eHUrSkl5WTcya1E2VW0wMVVkbmkrNzB1ZnJ0VzJG?=
 =?utf-8?B?K1NETUE4aDNDVzlwc3hVSXhGZjVsMFJETUlxNDEzL3VMNGpDc3FiOG1QQXBi?=
 =?utf-8?B?SE9sVXNhdmN5MDAwNlRUMzZDdHA4R1hmQkdhd21LekFOQVZoQ2xjTEFIaXE5?=
 =?utf-8?B?Q2pTamRFUGY1QlhlNWxSdUVBd0g0S0s2RkRZY3U0QktjUkpuSzRnQUpJU2xn?=
 =?utf-8?B?dCtqNTVreTdWTlY0bVBjT2wwcGFWdGt1ODEyM21zd091WmwwR3k2VFNyejJl?=
 =?utf-8?B?d0t6NWtBTWhCQ2FOcDBxTG5kSjExdnBwdzRjWlZ4Mk9CZXE4czYyUFdyZTdr?=
 =?utf-8?B?VWNMVFVsbzBSZmpoOUVFTXQ1RVpiRWV5Q1dOZnJwVFN5M0dxTHk5UEVzVDhj?=
 =?utf-8?B?RDBMT3JRMmFTeVJ4RTcvWmdNekJEMC8zUzdKYWdvdEdQVW1kbFZSWDh1Ri85?=
 =?utf-8?B?NldIbjVIVXFmYm5YV1ZqdjZSVlN6SXQ3b3hsODdoZTNMTWhLZnp6d0R0c1BS?=
 =?utf-8?B?d3NQQ2ZlNTduT2x5NDVJYUJxRzBSODlrOGtCQTNyMlVldzF1bFBpVUp2VDcz?=
 =?utf-8?B?ZHNjNXJMeWozSit5SEFPZHdJSGZUNnN3dU84ZTFDbEN5TU82QVhIRFdDOFlI?=
 =?utf-8?B?bzk0czc2ak43bFdrbDhSYm5yb1VzS0dQWGdaalZBWXhTQ1B5cnVySlNtODB6?=
 =?utf-8?B?TnB4bGVMVEVOYnpaZXNFa3dmUitOeUp1MFYzbVBTNUZQV0tpWWJNU3hSWGto?=
 =?utf-8?B?cUZsYjlEMVFsRWlJVjZVcUxuUDU3YWpJcHBERnd1b2NqYVZ2OWpzOVp1TWpz?=
 =?utf-8?B?OFM1ZzdveHhrWjBKVFAzeklrY1JONm1Fa2VaS0R5ZkdISllJYjhCU2N0QjRG?=
 =?utf-8?B?c1ExbzdRaVhmMHFoNFVsdjdUZWlIY3dHRVdqMG5NM0JJcHRVUEpYTEo2TTMy?=
 =?utf-8?B?VlZhTFV0eCtoakJ3SFowdXE0Qk5GMlVvK0huYm9MYlVramplem9ORUlKeDBT?=
 =?utf-8?B?NXk4VXkzek1teW1jS3NwSGRwc1pSdmJlVzNWWFFhVUZ4UHlwWU0rR3lISWVt?=
 =?utf-8?B?WUpmK094WFh4UkFWTEl6eU4zNFNoVGIvNXlaVFVrTmdIeGYyT0hCUk1DZnl5?=
 =?utf-8?B?YXBWaUFMM2Q1cDlrVTFDQUZNZFZCK3VwbGMzd0JyeldhV3QwM2cxelJVanBG?=
 =?utf-8?B?dW54RlFvckwyUmdPNTBPOEU0SWVENzI4b2JVK3JBZHFpaldXYnpOSFB2RXVw?=
 =?utf-8?B?WlRkMHR3TmZ2dmh1TnpxRGFuZ1BjYkVEeWxqRnVCenhTSXlweElkbWgrTkRj?=
 =?utf-8?Q?xQyhnxOsR+h1hOQVD/52Qml9n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d746f79-b0a2-473b-c364-08de0c58b2c8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 02:07:03.1922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEHSHG/D+OmdlA54NIQB9P1Rx94ECYEIslvZ0KrFkRAcqmCvMoaTjvF6wfFTFluQUDJMAI5jmQq6TkpsPsBJDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11352
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

On 10/15/2025, Rob Herring wrote:
> On Sat, Oct 11, 2025 at 06:51:16PM +0200, Marek Vasut wrote:
>> i.MX95 Display Controller display engine consists of all processing
>> units that operate in a display clock domain. Document DomainBlend
>> block which is specific to i.MX95 and required to get any display
>> output on that SoC.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Abel Vesa <abelvesa@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Liu Ying <victor.liu@nxp.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-clk@vger.kernel.org
>> ---
>>  .../display/imx/fsl,imx95-dc-domainblend.yaml | 32 +++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
>> new file mode 100644
>> index 0000000000000..703f98e3321e8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX95 Display Controller Domain Blend Unit
>> +
>> +description: Combines two input frames to a single output frame.

I'd like to comment on patches in split patch serieses(to be sent if needed).
But, since I provide the below interrupt information, anyway I take the chance
to comment more:

Add more description about the unit according to i.MX95 DC IP spec:
The unit operates in four modes:
- Primary mode: The primary input is used for output.
- Secondary mode: The secondary input is used for output.
- Blend mode: Primary and secondary inputs are blended, according to the
              programmed blending functions.
- SidebySide mode: Primary and secondary streams are projected side by side,
                   i.e., primary video on the left side and secondary on the
		   right.

BTW, I confirm that two Domain Blend Units exist in i.MX95 DC while they don't
exist in i.MX8qxp/qm DCs.  And, as you can see, this unit supports multiple
modes, this would impact how an OS implements a display driver a lot, especially
Blend mode and SidebySide mode.

>> +
>> +maintainers:
>> +  - Marek Vasut <marek.vasut@mailbox.org>
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx95-dc-domainblend
>> +
>> +  reg:
>> +    maxItems: 1
> 
> No clocks or other resources?

As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    domainblend@4b6a0000 {
>> +        compatible = "fsl,imx95-dc-domainblend";
>> +        reg = <0x4b6a0000 0x10>;
>> +    };
>> -- 
>> 2.51.0
>>


-- 
Regards,
Liu Ying
