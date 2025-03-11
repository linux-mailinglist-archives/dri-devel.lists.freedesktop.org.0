Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543FCA5B6CF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 03:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BAE10E50E;
	Tue, 11 Mar 2025 02:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EsUyyeps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1D210E50E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 02:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YruQJeUNp8KepIaAzZqa1TmSopH+GemIycaBqn65dMOvmV6AIFdU1dt5JIa218+yHMtmGM9QxNUtkcJ9koTwBSas4nkui/4leZWGOHyf+kkg3FJWf0NzKlMHAXwWHKvO3CRUmXKgi3IqMmqxzCW+8GIh4ChERTPGAlA9VJamdxWcoNGHRYZWq5a6MRvIRPFa+GWxm8Ao0ufFhEq0uXkd43SJsHPKp+i/KWTXlp2mdOaf3euF5SWFdsGCv7GzxL27ndMwOwyV3xqcbk2hydtAQC+/jCZ6B20x6RPlPvkykI/JplEYXu9BeMU6rTmgSomcQT9s0qc8/UdtAxmh2f6ZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEidqWRi/s4XjLzPszfUvhyuEl2jVkyAoF4cGfILH1s=;
 b=a1Qj4+ppU/I7mnPCXjoRphefAOL/IIop4LPTOgvhoGcXsoiaXGIzvbhwfbkhliFBjbTzl3JtQVuMy45NAFzbcb6DW97kk1RBxcorksW/oZUbx5b92I0XXQnf7RPeJ5XikjXuHWVGohGCfPnPSx0d5jV8IbHo8IblAGnMp94OG2ymZnk9rbPFLrPDT7j0JpZN2fX88E+0fmOpwYPvJGM85DMe8JI/ORvg+nLP+bECF9judlzUsuwJ/xFwKRIkVH+ParX5Fveb63K0kIH1cT1JvjyXX7DXf38vROCNwazc9EvZ3ks0C0nG76snZ05N36y1vxJNyavsXnidZKXj7d0INw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEidqWRi/s4XjLzPszfUvhyuEl2jVkyAoF4cGfILH1s=;
 b=EsUyyeps4pYo42K2mCZ//XfqkcEp7QYU1c3UlU1HSacepmVfb9b4Qtx4OEnNO/stWMyRwUHrjQ+Ha6D1S7Oe1WMON+puaA+HPOECnZ6FeI3NVhh/RQtWDvk2eVW/8ds/V4nl/rfAiPk2Qd8wJsireDFWKETky4v2h5XPbeflXMDFbdFOsbzWL3EJadkZumoyQ0mXreRsKnr8MTLUFfN82l2Uhg0+PFjFfqoFKCYst+7MHo30EXgf913BmlZYHWG+TICuryFhSd5ifq3brC1jV5l1KrKar5mSeGuaax8vf7x6znEAre09ZfqgKCwqT4IbOS4T7CAAc4TsPEQ5GvwiWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10991.eurprd04.prod.outlook.com (2603:10a6:150:206::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 02:37:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.025; Tue, 11 Mar 2025
 02:37:23 +0000
Message-ID: <77beb311-c836-4908-bfa6-fbeda69eee99@nxp.com>
Date: Tue, 11 Mar 2025 10:38:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
 <20250304152320.GA2630063-robh@kernel.org> <1891036.atdPhlSkOF@steina-w>
 <20250305163805.GA2071011-robh@kernel.org>
 <7d98163d-10c8-457d-92e7-6a1d6e379beb@nxp.com>
 <20250306-kangaroo-of-pastoral-typhoon-8aefb2@houat>
 <0e82c4d6-8b93-4dd0-ae34-155e537ab344@nxp.com>
 <20250310-hopeful-helpful-quoll-e0dee8@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250310-hopeful-helpful-quoll-e0dee8@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10991:EE_
X-MS-Office365-Filtering-Correlation-Id: fc16d76e-6ffc-4615-7448-08dd6045a72a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzA2d1hMWjQ5RzdwNmNnNkUwVWgrWFVyaUR6dmUvbGJOSUlPWWgrbkFsYllT?=
 =?utf-8?B?WnBmazhGb1NkSktpT0N3NERNWlRpVENPZlNVTzZsWlZmZ3Z3eHRCbzRaZzhP?=
 =?utf-8?B?MkFDRW1kSUpGMDZLVm00YWhKNWV6UnNlUmRIV3U3NUZubXpOSTVyb29hVURt?=
 =?utf-8?B?OFJuYkVsKytUR2NyTmpKMnpOQ2N4eHNQTFQycUp6THNydzRuZzdLMkVObHBO?=
 =?utf-8?B?N05ldzRQcjF1bEdBOHRBdWxnN1plZytTWGJZay9FV0Fwa1VZSUlBa2tSVEdh?=
 =?utf-8?B?VzAvRVpKK1B1V05YdGZZQ0dOZU80Zjh0ZmFhMURJQ1dodDQ3UU9kTUtONERa?=
 =?utf-8?B?YXFOMExqRG1GRDZVYlJmQktRVHNub3JLcDYrRWxKRnE2TTNYcE9wZ0RrU3JL?=
 =?utf-8?B?cHQ3QjZRakNCZ2l6VHRCSTYxRkR0Zm9ockc2M0dRMEpSVlRuR3BPME5UaGVL?=
 =?utf-8?B?RzNoNXc2VUwyTWszeGl4K09YRjRMQ3U4SDVZVXdyS2ZKdWl3ZytDQXRLQlpQ?=
 =?utf-8?B?NHFYYzFVZHdXZEtlaXhlYW1YMGI0czBSNFhBZDZYU1F4S3JGc05lNk81WXEw?=
 =?utf-8?B?K1JLeVVuR3pJV3hrb0lNc0ZUeGh0bjRjbjRwLzhmazhVRWlOdXo5WjlCQXY1?=
 =?utf-8?B?UFlyTmdUdmpqdExXbmZ1ZVNqL01FQmtlQWxzQ056SFlJaFdqOW55Tk0rR3M0?=
 =?utf-8?B?OFgvWU9hNTZVR3VMQjMzTll0MWIwaWtGZWNuTFRBUnFPYXpDOTF6OEhJaUp5?=
 =?utf-8?B?dERmWENKaC9heFpOM2JJbVdGc3NSakRFMnZ3aGhOZ2N3aUZHZ2t4OGFqVWJh?=
 =?utf-8?B?QzRxR3Uvcy91ZVd1ZWZERFlLWkJrdmhqZ1lhSWdaMjliWnF0SklaK0RTRWZI?=
 =?utf-8?B?a0VVdWl3bVhiSlVvSnIvWWM5Tm1BeE5vWkpBNnl3VTRFV0JHR1dCM1NoT2da?=
 =?utf-8?B?Q2FTamlOUDB1ZE1wZmt6SjQ2NVJyY0xjQTEzSCtJZEVJaVY1Sll2N1VTcXlG?=
 =?utf-8?B?U1NDbEpSaC95bGVlZExkQWpUY1dKNEhxRWFEOUE2OHcvTmphRndjczFsblF5?=
 =?utf-8?B?TThJYTZzQXZoNmx1SFFUNDNhblVDWGdHbTlLemZhU3hTdU9jS2g1eUdRcUFw?=
 =?utf-8?B?U3hRR01PTVpkZHZaaENObWRkbW1iUFZ5OEZjbTErZ25OaHh3YStlRzBUN05K?=
 =?utf-8?B?cjZPZlY4by9TVGJBYnlwTVVqSzhYVlBWNm1KZU9OR2FDQ1g2eDN2NC9Nbmd0?=
 =?utf-8?B?ZGRkTG5STnQrNXRlbnJPS0tNZGt5RG42Y2NtbWxLMHUyVjJTN1haMy9jUnlV?=
 =?utf-8?B?S01jVTBXVkg3OWt4TXRkNUd3bUdZMll3dWxqZUFNU041UWRhbzdFVXU1dUxL?=
 =?utf-8?B?b2x6QmtDcE9XSUx2eXcvRFpMRTBkbTQ0TWp5RXBPR0tFSHlHcFVVaEtUVCtJ?=
 =?utf-8?B?K0xLSHpwUXhQdzEraVdvTm1yWnhMMVhJaHdUREc3c3k3VnBaa1ZDMCtGaXJJ?=
 =?utf-8?B?bnlPejZmNWlwcm1wVjJFT296MStwdGVBemxMOVFRaXBCaCswVzZDR3FPZWFP?=
 =?utf-8?B?MExpek4wRy9HcFFuTG02dHVnMDdBYmNUNVJaK21KZnlSSTBNak02aW1qdUlu?=
 =?utf-8?B?WTdQd0VMSXpycmllVjRnVksyb2gyZWg0MDlaRHJRUmxncVdtSmVyM3QveWND?=
 =?utf-8?B?TWhLRmI2eUxEL29ISFVEUzNCZXRUamZWREZOM3hNOUtBYkwzakVPYlU0Z3ZN?=
 =?utf-8?B?Z1FVMnBEVGQyNllXcnJSaS9DQkl3OGdzTit0S3JhbU1Jc2F0amdIb1h1Y2p2?=
 =?utf-8?B?OG15ZDBMWk4yMVB0MysrQkRIdXF5MlIvV0dTbXoydjBMN2E3b0NJUkFTNDVm?=
 =?utf-8?Q?cFFXlnIaKf4jQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1VIWDRET2NPWkdtdlYxdWowM2FtVFU2NlJ3N2pyYmZjVEhva3RrY0RBV3hD?=
 =?utf-8?B?bUh5NldsK0xxNWk2dVRNYVQ3aExmRlJEOHFHUUUwcllFTStySWg2TWtaeGw5?=
 =?utf-8?B?b1FZWHR5WmdJZ2kxRFI1bndyclRnL3pEZTRsandNQWZtQnVwQVVpUUxsN0VK?=
 =?utf-8?B?TlpMK1JsQXZhYUprcE92VXNQdklZSHFkMGJ2dlJZM3UxTjFEZVJyby8xZjZo?=
 =?utf-8?B?VlZmZHBKWUtMcHlUcExmTmtGS3hoQkpuZ1FtaU5ZT1RRZkhRaTQ5WkxSR2R4?=
 =?utf-8?B?VStUdDkwSk9Tcjh3WFZTQURUZkJ3clR4ZW5Ha2VsK2lOLzBRaDdQQndsb2tv?=
 =?utf-8?B?bzJnelkxZzREQ3k5c3AyZG41ZFhsMDV1TkdkZUprc1ZxbGpjSFNSY1ByMXNn?=
 =?utf-8?B?djd5TUFnV3oydjdRN3NvZXhYdnpRdmowYmJKM2Jya2JuRkZSc0l5cDVSckgr?=
 =?utf-8?B?VWlsMkRrZDVYbkRZaURzVWsyTTVsU2dFMDArNElFVWJmTnM2MTlaVUcycG5F?=
 =?utf-8?B?Q05ZRkYrQUFnTHhVemE0MXBEZEN3ZFNxU3pnWWNydUZDNm9aSjk3U21lMk05?=
 =?utf-8?B?YmNRVlRyb2oyd1RHYkgyWklja2dsa1JncnlhTCtPRUkwSHdzNlZYTjMyRVNM?=
 =?utf-8?B?dW0wUDdZeDRjZWlWRWswdUdyVks5NDA0WnVCZHBpZ0RIRFRtam1VU2plWWZI?=
 =?utf-8?B?THZGL0VCTjZFQmhHYWk2YUU3bVI1MEk1OENBS3NJY2hmWWlKckhwR2tYSXNi?=
 =?utf-8?B?aUpUcEdsVGFSeEh3OGJyTWtFWFAxbFFQUEEvbW9NbUpoaC9MRjlnekVKemNU?=
 =?utf-8?B?aldoWDVqU2hybDNORjduUVlJbHRTUldoOCtteXp5ZWI1amhVZkVZaFJnT3Zi?=
 =?utf-8?B?cmxQVWVjdU8xamVYVExPUVc5U052Uy95dGV3emRPYklvS1dValJxY01KVUJ6?=
 =?utf-8?B?NUlzaFRhYlIwY0g1YnlUOGk0eG90b1pMY0t4cFR6d2p1cExPSlkvUzVvdGs5?=
 =?utf-8?B?NkxjeHR2S1JQVXdRR291VXRsdDRtQk00UnExT3dnL0ZweGF3NStzV3ViZXdX?=
 =?utf-8?B?aXF5ejRHclR2dEtkZzYrOU54MWZBa2ZYdVJVR3Z3cG50ZUpvNWhzanZ4RTlt?=
 =?utf-8?B?aHlpVVl1SjY5VWNxcVpCZXE2SklYUzZxSTFqWWltQmhHV3o0eElzYzRlcWxm?=
 =?utf-8?B?WVp0Skk3YTJpLzBNdkNoZDJlMlVGU1VMRDNLMzJIUFZIT1BLYUtHdnMwYlFJ?=
 =?utf-8?B?SG8rY2M0MVVjbytuaTZYbEhZbTJtNk1zbzVLYm9UNUVTM2pBMTB0ZUxqN0pu?=
 =?utf-8?B?TGxvSy9LMTJ3R2ZEL1FndnRIQllRZk42RXIyeXZEL3VtWW9kVmU4cE1qaUVM?=
 =?utf-8?B?YTJFN2p5cG1yaktIVkRqYUNjcFQzRlNUMloyMDhBcmdLb1J4U2ZlcVljTTNx?=
 =?utf-8?B?V3FzajBiT2ZVdi9vQkEzbzZDeEFDdDV1S0dHbFkwNHFwdGxjUVo1UFpHR1B5?=
 =?utf-8?B?SjcxNnJLNTJpNlU3WFBHVUd4Zi9STDJMVWVxUnducXBIK3ZHVXdNeTlUb2lm?=
 =?utf-8?B?bFhLa1dCYXhaQ1FjZHZRTXdBMlY3em85VTNYUFhMS1oxYUNaZTJhcFl5bTJD?=
 =?utf-8?B?aTUzVnA0TUcvY2l5L3huNm9OdmtROHByR1JtcjBFWUhuRUpSRDYyWXBzV1hD?=
 =?utf-8?B?RS8yUkE5Yk5OM3hOV2JTSFMvaGdZdis2dEIzWnNBUUFhMFU5Wm84OHhqY1NN?=
 =?utf-8?B?YXNhNWg5S0ZuakpCdnJBZ3NzMUVtQ2Z5SlRpYnlFWDN5cVduOFBuMGhNb3Ay?=
 =?utf-8?B?ejZ2VVp6aGZXRnZCdUE5V0tFelU3MFVxY3B2R0xuNDdHMjluVC92NHhIaHFB?=
 =?utf-8?B?dlFMS0NHZUg0cUdDeUw0dmtZMG9yU2tGZU8vUzBUQU9qQW80QlBLRjJxSmFX?=
 =?utf-8?B?SC80OGplSXEvUU1rVDBDQUlKYk5pdy9qdExuVGoyb3lldmFtc0NGK1pYUHdt?=
 =?utf-8?B?YXFaKzRWTDZ6SlorUElQeTVNdmc1K3pocWkxZ0JtTy9qT0UzKzRMa0dZNVNR?=
 =?utf-8?B?WFNnZXVWeGFBTzExRHlMVWJmRWJwNlpseWp6K2Y0Z1l6NDlUSUpFdHpkQU1y?=
 =?utf-8?Q?L7WEx4Cc2ZQFbK/8S+WcAisei?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc16d76e-6ffc-4615-7448-08dd6045a72a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 02:37:23.1480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yQM3UX19KNBfxeuK+W1N2I4mehg3XROiaoXJ8NBtLUJ4V2IBgYLnUmfXGlrUaMd56rcsHAExErn+SOMNcnDew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10991
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

On 03/10/2025, Maxime Ripard wrote:
> On Fri, Mar 07, 2025 at 11:10:00AM +0800, Liu Ying wrote:
>> On 03/06/2025, Maxime Ripard wrote:
>>> On Thu, Mar 06, 2025 at 03:02:41PM +0800, Liu Ying wrote:
>>>> On 03/06/2025, Rob Herring wrote:
>>>>> On Wed, Mar 05, 2025 at 10:35:26AM +0100, Alexander Stein wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Am Dienstag, 4. März 2025, 16:23:20 CET schrieb Rob Herring:
>>>>>>> On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
>>>>>>>> A DPI color encoder, as a simple display bridge, converts input DPI color
>>>>>>>> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
>>>>>>>> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
>>>>>>>> bits in every color component though). Document the DPI color encoder.
>>>>>>>
>>>>>>> Why do we need a node for this? Isn't this just wired how it is wired 
>>>>>>> and there's nothing for s/w to see or do? I suppose if you are trying to 
>>>>>>> resolve the mode with 24-bit on one end and 18-bit on the other end, you 
>>>>>>> need to allow that and not require an exact match. You still might need 
>>>>>>> to figure out which pins the 18-bit data comes out on, but you have that 
>>>>>>> problem with an 18-bit panel too. IOW, how is this any different if you 
>>>>>>> have an 18-bit panel versus 24-bit panel?
>>>>>>
>>>>>> Especially panel-simple.c has a fixed configuration for each display, such as:
>>>>>>> .bus_format = MEDIA_BUS_FMT_RGB666_1X18
>>>>>>
>>>>>> How would you allow or even know it should be addressed as
>>>>>> MEDIA_BUS_FMT_RGB888_1X24 instead? I see different ways:
>>>>>> 1. Create a new display setting/compatible
>>>>>> 2. Add an overwrite property to the displays
>>>>>> 3. Use a (transparent) bridge (this series)
>>>>>>
>>>>>> Number 1 is IMHO out of question. 
>>>>>
>>>>> Agreed.
>>>>>
>>>>>> I personally don't like number 2 as this
>>>>>> feels like adding quirks to displays, which they don't have.
>>>>>
>>>>> This is what I would do except apply it to the controller side. We know 
>>>>> the panel side already. This is a board variation, so a property makes 
>>>>> sense. I don't think you need any more than knowing what's on each end. 
>>>>
>>>> With option 2, no matter putting a property in source side or sink side,
>>>> impacted display drivers and DT bindings need to be changed, once a board
>>>> manipulates the DPI color coding.  This adds burdens and introduces new
>>>> versions of those DT bindings.  Is this what we want?
>>>
>>> There's an option 4: make it a property of the OF graph endpoints. In
>>> essence, it's similar to properties that are already there like
>>> lane-mapping, and it wouldn't affect the panel drivers, or create an
>>> intermediate bridge.
>>
>> I don't see lane-mapping anywhere. Do you mean data-mapping instead?
>> data-mapping is not defined in dtschema. Only lvds-codec.yaml defines
>> data-mapping in endpoint.
> 
> I meant as a general concept. The properties are data-lanes and
> clock-lanes in
> Documentation/devicetree/bindings/media/video-interfaces.yaml

This requires referenceing video-interfaces.yaml in existing DT binding docs
and driver modifictions, which adds burdens.

> 
>> With option 4, I guess you meant display sink drivers, i.e., panel and
>> bridge drivers, wouldn't be affected. Then, display source drivers, i.e.,
>> display controller and bridge drivers, would be affected. This adds
>> burdens for driver developers/maintainers(though almost no effort from
>> DT's PoV), doesn't it?
> 
> Not necessarily, panels have a phandle to the parent endpoint too so
> they can do that walk and configure their format if it's any easier.

I'm sorry, I don't get your meaning here.  I have no idea how to support
this new property in endpoint-base(graph.yaml) or video-interfaces.yaml
_without_ changing existing display source drivers.

> 
>> Moreover, why it has to be the display sink drivers which are not affected?
>> DT writers might choose to set the format at the sink endpoint, e.g., setting
>> RGB666 at the sink endpoint of a RGB888 DPI panel or bridge.
> 
> Why wouldn't you run the panel at the highest bpc possible?

Because hardware designers route less data signals than regular ones to the
DPI panel or bridge.

> 
> Maxime

-- 
Regards,
Liu Ying
