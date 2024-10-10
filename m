Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04325998BF7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 17:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F002D10E0A4;
	Thu, 10 Oct 2024 15:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IxI7xerN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6407D10E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 15:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7+y+iEJYZKzdmzJ6A2IZ7rwb27sXbmxYth8HfbMrutpj1jmwI4jwfGGo5Ty+pw63BqRP23w9aQn7Zj5VaOEwwZyLAXzzKWiAggdSAS25cq0YM/TaLHoOkxDjiGeVWzG4dWzdHySXFQ2HSuPUEynEe48w1WJGVzJiveykqku3sPLy+hBE7HyBgG0SNRWzm6+cwtMhxCBwXAzlDcTVteEfRPmPNEy1WSdkqFg5oVUvCeEKt9qzoWwidmL/w4BzzkMNKTNaAEkMmvj5TPLchlBoQUefaRUnAlTf+9DLiS1Xk4Hby8OV3JYFZ1tVscWNmxevM8r8QFlbAzsde0RfoDg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOvTxzuTGn680qRYZEX29BxqJgSy50gXYhp8nBEANtQ=;
 b=F8LxNksYVOXJmTSIKZibXGF5QgnOEsV9Vibs7m+VCNR9S5Ya0Pzuk1C15FK8YgQDS7DruwMugPSlDkq6xmVg8vB9RMNLpPNl3ghJkUm06ohbR1wJX9OSuFEpttBHcJGccaUHOOX96UYiEjgZpZRMgPLHMO8ya5tieU5T0Tn8ePjnh4LpAOnedt5Hh9uP4qEhPA81N4Q5VGlFpAoLv7xE4M4yE4TBBwSawoCQ5s8lI9quxEY/tZmBpjspb9tNfxtB5bS4JNg2AR5gkhX5Bj5ZN1aE/0OMWQM5uHBz5hXwJgG9bZZk0u14zjL/62gl02B4154svvLvI9Rla26q5QRphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOvTxzuTGn680qRYZEX29BxqJgSy50gXYhp8nBEANtQ=;
 b=IxI7xerNKHa9hZS130oDgKMt01Kvm8TnkvJuflemmiKYra8e0wbU4Z6tFJm019LzN0qt6U4Il/1lFYaqYuB2qqQAOQV7xDFbPotlmgMCLFspEyqvd17hwI7qWDUHkPTY6hHvJdZFgoHSyHVlTj7cb1KpqTA4tlEaStWTsEFbg/S3dCDavmpPQm9qAhW4Huf3opEAJqmwQ0KiyO4lJvrf4+JIPXHK1GFn5jtLJXdSrUaVqmd8jq+MrXOU6vTJ1ZQt3kU7oAhuuaBW5gU8hJ3gwpbHzG0YClMY9BBn22Z/ftj9FgVwypxK653ENz+ORCPpLw8HIa729UFZoMs9+jCqlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 15:43:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 15:43:18 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/5] dt-bindings: mfd: convert zii,rave-sp.txt and child
 txt to yaml format
Date: Thu, 10 Oct 2024 11:42:37 -0400
Message-Id: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO31B2cC/22MQQ6CMBAAv0L2bM12RVo5+Q9DTIEqmwglrWlA0
 r9bOXucyWQ2CNazDVAXG3gbObCbMtChgG4w09MK7jMDIZUSUYsP830140uottSY9UWrE+R89vb
 By766NZkHDm/n1/0c5c/+mUQpUPRYtUZZqojO12mZj50boUkpfQF/AlKRngAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728574994; l=3634;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=FFW9vTTfu+1LclL+1qqt/RPtoMWa7YWs4PSsGztXa/s=;
 b=8Nvc42lR5QBNJ7txTr4fwA9aJRDpDJW2m1gbpeWChi2U+uVeQ96hFOBzEtMqDvQBCzeyaICv0
 LaRaxSVOf0SBFgg7MtlG8Rf0+ozJNXH5UXUuvZ9q8bY8vl2SyaIubLp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: a5630e25-b258-4bc8-fc27-08dce9424360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OStRbEwyNks3bTMrRHhlTE5NK0dTVllDZlAzNUQwSjFaMCthMENtY1NteDND?=
 =?utf-8?B?RmVEWFBNUjU0Y3ptYUFreTdYTCtJRVVjU3h3V1FYOFdBZ1k5aUp2VW5HcjN0?=
 =?utf-8?B?MElmYnF5N1Rrb21YMEhvVndkZ2dKVUdXalo5Z0VZeWNWcGVLWXc3cVV4YkY0?=
 =?utf-8?B?ZElPekV6MXRuaHl2Qko0MnhHRFloRFJnQm1BOUlSTjhROWNhWXI3a2JKeFVN?=
 =?utf-8?B?WGRIY21JQWNGUVBaT2NDeWk1bmFyVU5Dak0xWDQxV0ZWQ0pZUFFZenNXck9C?=
 =?utf-8?B?RUE1QktEVHoreS9yaXg5a1pkV0hDVXpSUnl6U0ZVSXlWNTJ6UFNZQ3BROHhi?=
 =?utf-8?B?Z1h2amJTNkI4TU5KbEZqYVBuU1dSQmFjMG1wY3JmS09wTmJ4THNlSk8xRmI2?=
 =?utf-8?B?dllWUHliL0xZZjBkV1J1SUxyQ3dpazRDUEpZQ0thVlQrcVJ2dFdlQnlWcUFT?=
 =?utf-8?B?SUJNUWZ4UEFuT01EdURlS2dQL2hqMDFEUjFkOFFQbUxUdUxFMmVaSThveDY2?=
 =?utf-8?B?TWg4azZrdndXZnZHNnJTSHNnTmlkNHE2dEM3dGs1b0hDWThaTG5hS05ud1Jo?=
 =?utf-8?B?UlBJcUk2TkVST09HMnNFY05sR21BOUlES0doK3FWTFo4bGVXeWRZVGw0U3BD?=
 =?utf-8?B?MVpreWJWbWRVMzlRWDkwajRsTk9MOG8vWU9VQm1IKzRwcWRpVkc5Mk5ndzh1?=
 =?utf-8?B?cXFCbUt2Y0YrRlZYU3VTTjg1NkRGdTJjYzV1K1B4MTFuRkpDdVRNQ1ZKdm1J?=
 =?utf-8?B?M2h4dVF3MzM4N21vcUgxYVZIcllWTWs4TTJkS0xlWDliTjRCdDRzaFJSeG1v?=
 =?utf-8?B?N3hTQjhGWHBXZXlpTmwwOENLRXhLRVFIRG1mSUgwbGR1Sm9Qd21jTzU0dmNl?=
 =?utf-8?B?YUNYaDBIazFWZCthdTdkMHMzaVF6dTR2by9xNE9vakswcnVlVG9la2FOWHJQ?=
 =?utf-8?B?WDY5L0RnY0tBNitPdE14WEQrSmMzSVB4RjhMSS9pU1dFaHEzU2orQm1hMFpX?=
 =?utf-8?B?RDdROFZIWi9wa3ZxL2VDL01YeTJkbytRYTBPaUR5dm1yWldaK2N0SlJDd0xy?=
 =?utf-8?B?RFdYZ2UvWUpvS3oraXdYaVpHRFY0dVNkMk14L1YxZU5WN3F5TXJTOUphVnd2?=
 =?utf-8?B?bEZER3VnQ0lwWkhsYms2MVlZb2NZeUNiTnhQR1dhM3RBdXBMaUkrcWxUSTRq?=
 =?utf-8?B?V3dqbkYvQmhtcUtKT2tvRmJlUlluMzlZZmdnMlQ0dGQxTmpucm1TNnN6OUU5?=
 =?utf-8?B?VkowbzM2cllhT1FmLzhsNnpiUjYxM2ZEb0pxZDZ0d2pxZENBaVloT2lEbnI1?=
 =?utf-8?B?TmlIQzN4cXViM1MvNDdVb1dZR25qR0hsMTloNFNtblZXWFcrTFFheW1uZXI3?=
 =?utf-8?B?Y2I3VWtlQmNMTU5VMWY2N0l1U0lPRjFnMmZ3cjgxRFozQTJGV3dCN0lqdU9F?=
 =?utf-8?B?TCsvcVg2ZWQ1YVhrUXNRTmVvSWFDQ3ZqWTZWYjIxOEZEQy82WHhvbGtCMm5W?=
 =?utf-8?B?ODVQeXVEQVdQRDMvTjZyNVNjaUd3dzRzYzExd2RDTjZiUFRJWm9XaysreVNw?=
 =?utf-8?B?Qnl5LzR1aFNBYzF3ZGJIRE9SZm1yMDVPb2R4ZzdhY1QrRW9IalFFb0h0WnVu?=
 =?utf-8?B?djhWWTZIRFdVYlFZZTluV2JuU1RmUThlZjdYU042Z3hOZnJOU2VXdUhvQ09J?=
 =?utf-8?B?bGtPa2t2UnZKU0FLdDdKYnlodmRYcy8vTzR5SGRoT05EYncrdHdSWTNyeHVJ?=
 =?utf-8?B?NjJuOVJVWVB4T3V2NmhRQldUUTBKWWZpY1Bzd1lxOUs5ejVHcXJyMEJxRHRY?=
 =?utf-8?Q?8g/X6LmqpzxA2G+YDE4ucZPztQl3TlausPTlg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVhrRXdsNnpFV1hLc3Vsa09BM2JmTjF1a2FSaS8vbzVkcG9HL2NuL0tBVFE4?=
 =?utf-8?B?cmw0RS9NTlUzNDNGdStWZnVzZlVXWlNxZVUySjl1WitjMFZlQ1ZnUWdOS0RB?=
 =?utf-8?B?YWpQS2FQNzE2ajJIQ3Jxc05YNzBQdmN1dnpzMy9ENEo5Rld2UC92eHc4L3BP?=
 =?utf-8?B?WHJrb081bldwZEdvZGZ2NjloTk00QWpLMnhwUU9FKytXVHhYU0FsSmNiRkx3?=
 =?utf-8?B?eDRqVWM5bG8rdjN5UTBHTXZYOE81YzZJcldta2YrV2o0QlFEbitNZmZXZ1ll?=
 =?utf-8?B?SmwwVk9rbE1XaE5wNitIRm1Dd1dNanBraHNwdnpFVG9STUFBZGx4dUFwdXB3?=
 =?utf-8?B?Tk9OT3ozWTlVVFEzUm1aNHZVdUJOMTlkZ3Z2SVo5dlVOaE9HeFRWNiswcVph?=
 =?utf-8?B?YUI5S3EzQjRiSFZ2R0hBeVFJMi9MWGExRzVyT2N5Zmd0Q2luN3hHK3NtSGFk?=
 =?utf-8?B?UEhXdVd6dmlicDh6MzljeUhxQVFtSDhIeTQ1bVlDSkFPMEpTb0cxS2tXSWpT?=
 =?utf-8?B?RE1scFc1TEFJYWtWNTMxaWdad1A0SnpNb3duWkFDUTl1K1didExkcnFqS2po?=
 =?utf-8?B?cVcrZmJFbUZ4UEEySk5mSnZYOUZSZTY0clNQSzVIdEE5U205QkdHZFVrVWdw?=
 =?utf-8?B?MG01OHBaTUhjZlFVdHZNYmdxMUF1bUd6TWJtMGdJZ0tyQ21TWFRNb3h0Zldt?=
 =?utf-8?B?WFZTaytucDhGWSswcnZVRlJtbXMvRTFMRUMwejB5Z1JJMmt2d0xUNkdjVkZr?=
 =?utf-8?B?bWRQKzlwYnU3OHlraUM0bGNuVXFzWHd5QjVqNVpuZlkvRnNTVCtXaXlaak1y?=
 =?utf-8?B?dzI0RmdUUkRaN2w4MDhIbjMzL1NiSXdjTDNCYzBHeXFNZnorRnYyb1ZiMG14?=
 =?utf-8?B?a2hvczZTNUgwWHJGSkFKSWR3QnVMTGRrVzVHMjdXdUh3c3FQSW5KaFJURGJn?=
 =?utf-8?B?UDgvdW9oeGYrMGtGMmRJNEp3eE1mVExRdmo5ZHF1aHBaOW9UZ1RRSXhPQ3NH?=
 =?utf-8?B?SEU1cGNOajhxUFN1Y1Z1Z200ekR1Ym85K1RJZ0hrYTJYblhMOU43VHcvRUsr?=
 =?utf-8?B?ZThSNkwyQi93SWlhYjBEKzVUMGtGU1BQelFaWXdycWIrQzhYbHVDNGZOY2hX?=
 =?utf-8?B?TzU0b3JxTDd1M2RTQmdjODd4c041R1QwcVBEaTJ6SXNpRWJzeW1nSnFPU1ND?=
 =?utf-8?B?MU10ei9GUklEN3I5UWtZT25xNFBjTURQU3lUVDQxcUJHOWhEeC9TZ090WVdC?=
 =?utf-8?B?bWYwbVVjd0FtdlhhaWs2M2pCZmI1MHk5TzYxUTlmTW1UNkcxYUdmS2U5OTVu?=
 =?utf-8?B?eVliRnNGUkZSTXMzdTJEUmdRVjlzU3VVUng1eG8rdktHWVFTWVQyZUZrMDhX?=
 =?utf-8?B?d0ZqUmJ4SUhMTFNSa2hPZ040QjI0ajUxeGFOQmFYTW9kY0xicVBpRWhKM1VH?=
 =?utf-8?B?ZVFFdnUzM0lqVW5oZy9ZRmQyN0t4RlV2K2VTa0VHR3BuczVENGhHdFBKcEt0?=
 =?utf-8?B?MEYyUFQrNlJ0Wnd6S0p4bFFNTnU2RWg2N3FZc0MxNzR1YVRDVkNWM2FpNVZn?=
 =?utf-8?B?VG9wUldES0xUbXBkZHNPb0FRaXFLdXZxVHE4SDdBNEVRK1NiREpRM01ZMWlL?=
 =?utf-8?B?SjAzWXg3MXdPcndlM2MyNHRJSHlmeGlydW5JL0pXZGFGbDRvNS81akZJamZi?=
 =?utf-8?B?cnlBYnRaTGt2c1htVjBZb0w5UHpocHdPMklpVzlSb3pVWHhER0NqWktZREpT?=
 =?utf-8?B?YlZvUWxldS9TN0ltUjhnSGRHS20vMHNBQUhmVktkKzFDNG15Ym5ZbzBkVnRt?=
 =?utf-8?B?ZnNrQytJYVRuaTBGYkF0aEtwcFFiQW00Ynp2NkJqMmptSDhEcng4WVlLL2dH?=
 =?utf-8?B?cmdqYmE5c2ZySlBya2NPays1cUM1UHhTUUgzM3lPRWhZOFE5bE9jMVh3UW9t?=
 =?utf-8?B?dk5jek1RRnFhczYvSzNJUlhoRjZqVVkyd3ozZHFhaU5mS0htcUZ1R25Cc25z?=
 =?utf-8?B?YVlmcDdVc3ZNMjAySFRxSmhKNW1nSkVlWTZnQ2ZoRGNvTm1mcHd3QXJISUJ4?=
 =?utf-8?B?aWxVYmtRS2dWbUJoYks1N21nYnA3TXoweURSSkQ2bnpvb3NlbG4yRUdSSTNz?=
 =?utf-8?Q?J8gc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5630e25-b258-4bc8-fc27-08dce9424360
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 15:43:18.8433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnEq11VNAPKtbXXqPBKu3oIQd9M0hB1t5IHExss74nqFhyFpruOfGmOabt66ED9VpzMPAGInp3j+kWb6lpzcLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984
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

Fixed below warnings:

arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- change all maintainer to frank li.
- Link to v1: https://lore.kernel.org/r/20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com

---
Frank Li (5):
      dt-bindings: input: convert zii,rave-sp-pwrbutton.txt to yaml
      dt-bindings: backlight: convert zii,rave-sp-backlight.txt to yaml
      dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format
      dt-bindings: watchdog: convert zii,rave-sp-wdt.txt to yaml format
      dt-bindings: mfd: convert zii,rave-sp.txt to yaml format

 .../bindings/input/zii,rave-sp-pwrbutton.txt       | 22 --------
 .../bindings/input/zii,rave-sp-pwrbutton.yaml      | 36 +++++++++++++
 .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------
 .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 +++++++++++++
 .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 --------------
 .../devicetree/bindings/mfd/zii,rave-sp.yaml       | 63 ++++++++++++++++++++++
 .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 40 --------------
 .../bindings/nvmem/zii,rave-sp-eeprom.yaml         | 54 +++++++++++++++++++
 .../bindings/watchdog/zii,rave-sp-wdt.txt          | 39 --------------
 .../bindings/watchdog/zii,rave-sp-wdt.yaml         | 47 ++++++++++++++++
 10 files changed, 236 insertions(+), 163 deletions(-)
---
base-commit: 2c1dd8a45abe738d15a9ebe015a17eeac9a3b13f
change-id: 20241008-zii_yaml-7b4802029873

Best regards,
---
Frank Li <Frank.Li@nxp.com>

