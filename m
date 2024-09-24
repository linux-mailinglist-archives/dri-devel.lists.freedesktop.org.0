Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1797984245
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1CE10E699;
	Tue, 24 Sep 2024 09:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="irmrX5RH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2134.outbound.protection.outlook.com [40.107.22.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB59310E6AC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:35:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ng8pHfO7QppxAkZ6iZVuxIp/CpoGEizQHSPw154K7E4NWtbzetqJFTsVMcj4UGCK1YfFvCaCw2uG1d8pIfgLUpawLBWUa6ZfGsKaWeMKvd0fiGcXJmmjcdTeTo1K9dyoPOdy4cdH6Wgq1EEUuF4rM4DrMaBGK3vEdIvbPLAnIT64x60sFcBJxKdk2T23FGxRxaqmKlkiKAYjALBXQ3pY5m1bfuM/snFj0w3CYsG7TVcQiZ5JBlN4ckLrfZnS4eFhljMD3oPa+q6m4gjLcdio0u/uT/XhD+Wj3VaM8Fr8VIkBrC6Z4jVAOVyKCrRdEswzyCxUkZ+8Vh9/zgnxkEWizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCUNrfiazM84VPvOvcPC3ySxzvUaRvBpRG2jNIOjJIU=;
 b=FUqZdYbfIUreESSF8+OdHTUh2qIQOVXf2PJtm7fV4c55hHV923foYm4uez9dWC6fQIU8ktDuAHJ03VZPUUDbMGfuZ2iQq0rkSvkqzkEjUEoBBUdVEe15Pe5TfOoclAJhYodHh30U/qLATmywOqLUr7X4KZYr5wMnQkQsYVMG1mEmG+l/URxGANqoHdvfXaful8eSC9kJdT2yt2abB+1W5/Orsr9LrO2mZxfAlb+bZ7EXxQF9PNC+eU2Qjy2HaXh3wromBHmTwg1Dg2E+vIT2fviLpOluw01RAyARX+EhQNdfDS/hDMxueojsDHYSGveSMjUKFbJg9C83tN6DN29Sag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCUNrfiazM84VPvOvcPC3ySxzvUaRvBpRG2jNIOjJIU=;
 b=irmrX5RHCi10Bqv7FeAohqIWzcizdyu2kCPwTu5MPZtRpSryYAR3JWA51AeqPRRXfO/ybIGWFzYpeM4uwkslxOUuGGh+rTFzqZtsjO3FSvF5mVxDk7xCRlbasJ+ZIdxtfzX7xYAKT5Mqct07qR0HEOMK7gNe//HeLuiLU+zA0fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB9621.eurprd08.prod.outlook.com (2603:10a6:20b:61a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 09:34:55 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%4]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 09:34:55 +0000
Message-ID: <3dfe0855-3f58-432f-922d-4c936f36c731@wolfvision.net>
Date: Tue, 24 Sep 2024 11:34:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] VOP Support for rk3576
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, minhuadotchen@gmail.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
References: <20240920081626.6433-1-andyshrk@163.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240920081626.6433-1-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0050.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::39) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: 61482539-9e03-4d6a-60d8-08dcdc7c260e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlpuNXd4bDFqaVc1b3NGaUN2WVAxMmtFYnBOVHBGcnlwZjRLeGNZUjdPbG9Q?=
 =?utf-8?B?dGdHSUlqU2VTQWJJT3FvNDl5UFJRZHJzd2NaajZsZEh3THBwRmgvdmZTMXNw?=
 =?utf-8?B?bE85ZzZveGhEWklrSWY1eEI4bUxxS1ZOeng5S1F4V0F4SGhDRkRURlI2RXhl?=
 =?utf-8?B?KzR2MjZrUmdZYjB0QUgrdFZuRk1wUWp4VCtQMWFvcE5Sb1NSTUtTMU5NVnVB?=
 =?utf-8?B?OE1rd3NlN3JlY1dPdU4zRk0xTHB6eVF0dnBncVdOc2J0M00wNDhMdjgzZTZY?=
 =?utf-8?B?N1A0ZkpZMTJZMmVxazhLMys1UHVhYmRCZUJSR0QrWXFqSUg3MC9sdTc2Z2FG?=
 =?utf-8?B?SnVYS25BYkIwb2pJZDJTR3lPVko2UG5RK3dFR01XVEpUeGg4elcxVzdHMzZY?=
 =?utf-8?B?My9JdmtKYyt1Tk9WVEVFWkxRamlTRFNMeXpCbjNiSUFWc2pFT3FBeE54NGRG?=
 =?utf-8?B?Mm9sb1BRVXVjQzZoQThwcFRLZXlVbWN1OFE3Sy9wNld4K0l0bnAxWmdLRXQ1?=
 =?utf-8?B?RDI4WWRVYTRMYjRGSy9vSWJxZkNlZm9hWHM1VE5VZWMza0hSMkplYm9JTEtD?=
 =?utf-8?B?N1cyckhLSnFLQ29xVU1YdHFZVkdHMk1wdTBYdityVERLS1BHZHNVcWsvM2Fi?=
 =?utf-8?B?QzRMdTF6RHZmRGt3UG0rVVBFWWdoS0QxL21aVWNzWnc1ekhtSlFSWnVMWEwz?=
 =?utf-8?B?VG1uRkR5blQ4YlJ5MUxtZXZkL2xZWEJwbHF4TzJacm1jaGtYTE1LMVN5bGVS?=
 =?utf-8?B?KzFJZkZCWThJd0lURDFzRDV0RmlyTTFmcFFyZG5XbDN1SklrR3FrdE5kUnE0?=
 =?utf-8?B?blBQSzNkT2VLKzRyMTRSRmRhSk4vYzNNVFRDaGtUUjJuczBJaGRTaFdIWE5K?=
 =?utf-8?B?VnFGSG4xUzJpcDNTWnZST0ZwVGVraXhkTUhmSGY1WUVJQlpBaWozblo1WXUz?=
 =?utf-8?B?T1VLV0NhU25mNWFvU01Well0SUhYT3pnV2xlcy83bE9hKzI4QTg4WS9WdTUv?=
 =?utf-8?B?UTQwb3ByYzhPSFBEenlKeStYRC8rNStRWjh3RWsxTXFnQzdEZENxY2ZORDdv?=
 =?utf-8?B?K0NPZ2FBbXppYWYyaDM0NTYvbjlremVUWGJZVDRyUFhud1ZFUW9odUFUajFJ?=
 =?utf-8?B?eWdpeERDcElZdGR1d0hQSFp6K0hOVUt6dEh2WXltbllqOUFib1Q1eU5QdGJh?=
 =?utf-8?B?RHZCN0ZGcEROeHlHcHlST3ZGRzZLNVVEMEk2MXU2TDRUanVvaG5ZK05KN3pP?=
 =?utf-8?B?U1U1SWwzLzl2RC8rajRUdGxuRFRsUUIwNm8yU1pVVy9VVHkrUkhHbUVTSHVM?=
 =?utf-8?B?Um9WM3c1VmpVMUM1V0UveEpNL3lSVlltQXZJSzZpRmJlbWlSMmpkNHp5S08x?=
 =?utf-8?B?dVhhYVdBNmxwT0QvbEJyNmdmSmdGNWpkVTU2a3RjSklIc1E3M2xWZDAyOEQ3?=
 =?utf-8?B?alFzdkR3TjBUY2lmU0ZuS1ljdzZDUUhkYmJtVWE2NkY1QjRpQS9hWG42QXZa?=
 =?utf-8?B?emdNQkhET0M2WFBPVE1qRHlWU25jWlkyKzE5cXM5b09USEdWeEhEbEliQXZJ?=
 =?utf-8?B?Qm5YTEdRWEsxYS9hN2ZmVFJYNXNQWG91cjVyRyt4VGt4Y0d3UkYrQnhIYzd1?=
 =?utf-8?B?Tk9aL0gvaEROOS9xc1V6dG1jdzZ1N2V3NEFFZ0dhS1h3K0dMd1RMNmlDZ3Z4?=
 =?utf-8?B?WWlKODRObGdpZ01NWEUxaXhTR1BxT2JNVjF2V2pWanFtNzcxZFVqQ2J3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0lzR3NudVhJdlBlOWtWT1hNZ2NCVkxTQ09pSFBjS3FIVUkzQ252bldoVm9D?=
 =?utf-8?B?WHNNcC8wd0pEWFVQZkRYUXJaUStEOGZkOXdhMmR0eWREaTVBeVg1aHlNWWRp?=
 =?utf-8?B?MDEvc3czK2MzbDhXenFKaDV0NkQxL3NqZjFqOVZWcGsydEQwMGE4ZlpGR0hU?=
 =?utf-8?B?cENaSHJvaE1wY0l1NnkwZmNsTjdhSVJVVWtrbzdtWENnL3c4SG9Ec3k5S0cz?=
 =?utf-8?B?NFlKRnZUU2JOMjhTc1ZQTVdaaXVJOFJRbE5TcHB3RkZqejgxdSs1MitRZGJY?=
 =?utf-8?B?RkVQZXdMcVlvT0NCWFpSdlk1eXRicmhWSFl3WDJ6Z0ZWNnAyeERaNjRJdmhE?=
 =?utf-8?B?ajhtbjJVYzdCN1QwTXNad1hzZUNFd0JNRklvWjE2RlYrbndpUTZ6NlV1bi9L?=
 =?utf-8?B?RFk3SEZBNHE0Yjg2b09YTmNESE02emxPOHY2QnFmVnlCRmZWdXNvWmxNaXJr?=
 =?utf-8?B?eEFVMGJIZU1mQVRsWXFRNGNKdVRYU1hkMmQzRFVzSUNhbXpKVXF4S1pvLytl?=
 =?utf-8?B?c1VBZ29GRnhtN3owUXU2ZUZBV2FidG9uVVBkTGE3aHpyaVBSbnpoS0hZb1ZK?=
 =?utf-8?B?RFY4VjBRa083SXRJdDdRSFAxYlI4akFsaUZDOTUvYTRXcllZR2ZyaTNFc0pC?=
 =?utf-8?B?SzlqZjdnY2tGL2pKTjVhaDE4U3pUZGRlRlFNMEwwWmlIWitlM1VPeC9YVHAy?=
 =?utf-8?B?UW9jV3VWVHhnODlwaUJVOHBXeHZYNVplRWNFSHR4eGtlNm5tL0FYSUZqakxS?=
 =?utf-8?B?czdWTHpIRGRTakZSNElzOFBsV2MyejV5U1NpaDlBb09hUnFSZ0tJOE9DeEo0?=
 =?utf-8?B?bXlhM05nVFhCR2pRNG84NS9tdHowTXhrM1d1UEtDVlRVRmVGbS84eDNVWUtX?=
 =?utf-8?B?SzVqdGluYU1DNVR0U1R6MEpLUkV4L01pL0p1N2J1Z3ZRcG1QdkUwR2RhVnpt?=
 =?utf-8?B?NE5Kanl0V2xrUjl2TWpEOVhzSjZpVWM4UEdra2FFaWpGZWliZjVZUTlxa1dm?=
 =?utf-8?B?Z3BsSU5mcHhhMDRZQnpvNzQ0VmNqdXg5MHJaeUZXTkxIdjhrKzlzRTFlY05V?=
 =?utf-8?B?blVkMExBdXlvczFMZG5pZURMbFQwUFo2UjBYUk5vbjAvY0tvcVNiY1oxMTY1?=
 =?utf-8?B?UHJjMUlJM0cyKzhDTzJXckc0TUNiSXlNU3krUEptdEtzdGx6L3cvdkZaVlh3?=
 =?utf-8?B?eGhIa2ErNUU5ZkxWbnQ5QTN0N2RoWXA2OEh3MHA5NzVlYmFGbVZmRjMzTWpp?=
 =?utf-8?B?OXJsQ0plYmd2WjVBSVgxNVIrdFVNY2Q2SFBleGpGQ1A1dGR4K0E3TTR2czVq?=
 =?utf-8?B?dGtEMlNPQkdpRk9UNmkyTzRqa1QrS0xWVW1mNHoxM3NxS1NjM2NRMjRPdmx2?=
 =?utf-8?B?UUwwNWRzbnhYNFlCRk15bWE2Yy9mc0F2VTBtNTJ4cDFJZEd2QTQxMnpsNVQv?=
 =?utf-8?B?MGxSSlpZbTk0ZHNkbXI5TTdQdDRuUVQ1dGJlUEJlZmFDbm8yWGVMWHNQbzdo?=
 =?utf-8?B?ZmlRZHdTQ3NtUmFaT293Z0xybGJBdHp4MUZqUitJaGtPUndLM1RyMUpGTmFS?=
 =?utf-8?B?RENLVlZ5ZUtLQ3I1T3ZRb0NOdWRScDBucDQrbnBadW01dUlkUC96b2E2ZFRD?=
 =?utf-8?B?ZDZQcXUxeXZLNi83Z3lBRUxMZHc0ZHFydXBSbXh0NDhpS3o4YkxSdWpjYVR1?=
 =?utf-8?B?ZS9SL01DZkdXYUdqb1JJTEcyVG5VSnhFRXhlTE9uaHhyYmpNNjRXaExEbyt1?=
 =?utf-8?B?UXJkeEpNK3laeWtUT0xJSFplUmxSSGNpRHBiNVV1TmptVU9pNmsrR3c3Z1Y3?=
 =?utf-8?B?dmd1ZlpyMWhXUEJKdUtCd3RGdUQyUnV5SFVya0RFclRSZXNWVmQvODhpY2c3?=
 =?utf-8?B?RXFDaThmVEVPZWU2ZFVTWWRuODFodklCQjZmTkpQeFA4UWg0ZGMxYVRTd0t2?=
 =?utf-8?B?YXNGdDllNTVZS2l5L3owa3JGSFpkczJsaEl5Z2VjRDFLdFB0VW50dVNpSWhz?=
 =?utf-8?B?QzZxbjF3VnB1cTFFcThvRnNXRGhKclpMQkxVVnpOR3JKaXZNcC9Semo4UVpN?=
 =?utf-8?B?OTVabVMveTlqUVl2SmJrZXgxVWF2RVpYVUpqMHJNVG9rSVRqSk9MMDFOcUZJ?=
 =?utf-8?B?eFZLamdBNWlTbURSdFJoUWNRQW1tV0x5bG1pc3BRWlJSRUIvaUxEemoyTnJV?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 61482539-9e03-4d6a-60d8-08dcdc7c260e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 09:34:55.3425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZKwVGOi7B6kPVC8VwulneXY9bJPec9y2wxGUaO+voc3qPisSdHLbKD6Fbsz6pfkXuqg/PxmePJC8QpggylGqMnxaBwfnSDxYulz6tX5Ic0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9621
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

Hi Andy,

On 9/20/24 10:16, Andy Yan wrote:
> [...]

A few minor nitpicks:

> Andy Yan (15):
>   drm/rockchip: vop2: Add debugfs support

There is an extra space in the extended commit message ("...summary:
dump..." -> "...summary: dump...".

>   drm/rockchip: Set dma mask to 64 bit
>   drm/rockchip: vop2: Fix cluster windows alpha ctrl regsiters offset

Typo "regsiters" -> "registers".

>   drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
>   drm/rockchip: vop2: Fix the windows switch between different layers
>   drm/rockchip: vop2: include rockchip_drm_drv.h
>   drm/rockchip: vop2: Support 32x8 superblock afbc
>   drm/rockchip: vop2: Add platform specific callback
>   drm/rockchip: vop2: Support for different layer selet configuration

Typo "selet" -> "select"?

>     between VPs
>   drm/rockchip: vop2: Introduce vop hardware version
>   drm/rockchip: vop2: Register the primary plane and overlay plane
>     separately
>   drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
>   drm/rockchip: vop2: Add uv swap for cluster window
>   dt-bindings: display: vop2: Add rk3576 support
>   drm/rockchip: vop2: Add support for rk3576
> 
>  .../display/rockchip/rockchip-vop2.yaml       |   13 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    4 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 1572 ++++---------
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  274 ++-
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 1948 ++++++++++++++++-
>  5 files changed, 2683 insertions(+), 1128 deletions(-)

I gave your changes a quick test on my RK3568 device and did not find
any regressions ->

Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568

Thanks and best regards,
Michael
