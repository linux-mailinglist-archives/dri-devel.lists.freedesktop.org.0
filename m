Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1B9959A0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 00:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A4710E609;
	Tue,  8 Oct 2024 22:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MH8BHVp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2010510E18B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 22:01:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0adptMDalLltNJNszBZRpviAbCUUO3PhYswJ0HjVfnJcE5qUwqWn8Hs60CbFYL+BkGo3H5brCQBsPdj8qH8M2/Es3x5JlT/dImCOZG9lmSYBDQmHbbX8SHQ8ypN5JgZrT9x7t5coP96W6OJIeuzrpUiW6bJlAMosP3ch/xS1dLC0GLG4LwiRQmnBf3D/MvsrSDYFzAe3BHiZ2Q5Ehvl15NV28kuEDTysLMXECddrFvHUN8IC+KQ4A6Q0XIaRfA7Rhcrbj0s4uaGOkJ4voil1niAbGVGRNAVzzbm0yUiBDX66a7IUz6zfAgMIsQWT7dSEMl0Wmxxnzuzg2tfKdaRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKMLhaRngi3UY1wEwH3ZE1EO4slNAWsI5ttRamqlcjM=;
 b=lJDTJI0IjtNk4NsK0KxxCbUAxnXjX0czbKcP4Ybs9ygElHmfc1V9SSksdrlSD2yMOAoi+ErpRssII0sLdL/DF4XmImhoBfK3WyizIn8rS9/SLMxlyQ/CnEIyz3RywbRY6uayd8390foOwlscUTTlbzbSGx6JZOMvVW9caxpgR3LwqilcQYRXUG7+CS2R1axLPxBrIrJglM+pEXzn9diLMEoLTkT4wGzosFTDVMuddEVx60nCtX8yFbxHp+3W//UQ4cB8wx/kHMr+qVPoAAt0cJEUPLvux/Ftrm8Mny+5+ZQzZ6LbDbH/6bkUUs24DWHE5KVdJS64dG21Rp3J69r7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKMLhaRngi3UY1wEwH3ZE1EO4slNAWsI5ttRamqlcjM=;
 b=MH8BHVp2b5o7QzypAQ/ZsC9u+zBSZUD8KJfBGqe+QnARiAbezTgBWbkzm/5TOc3gx/yWz1ogF8f2qDv7JNWEhTCgQpxP8oHfZNwRXZ20voCV8Jca+vtB45ow461qDKhvqQVt1bpzC8vS0wNPGgo3C3mDsgIel804eC6KL85tuEf5nWfj6lQNCnTC+oIu03oEGO+BnVb9v0wGvtMHuPPRNiKVUOpD8g5ubPVvlCTse3aDiKxmICnn8IhDvPeu2mlXUufgvTWZ8FVTzYUd1Xn6xXgLLa6cdQ58Yjb3i2cmA3zYRstPkpNDGJef3MkwrzEKLxkgpd4Wcv61rNdGTbU4Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9667.eurprd04.prod.outlook.com (2603:10a6:102:242::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 22:01:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 22:01:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Oct 2024 18:00:58 -0400
Subject: [PATCH 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-zii_yaml-v1-2-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
In-Reply-To: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728424880; l=2748;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=TPOj0dAwnxlALBuntib6N0NNUbigzs7IIYQLlS930UQ=;
 b=YV4eGHDnHOD0U/P1s0ErYDir9F372dB/S5L32okHJZ5Z45EhArAw474V1WBAYAqR5UdrPIzjK
 0geEpJtKILDAAyK2mY1OfzGgAEcRgjuSaJLSOXueWivxqIa3A3VwrcT
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: a980d8dc-de2e-48da-952b-08dce7e4c56f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjlscjdVZlBsVEtyZXBvTDhWa2hOZkF5RjlNVEdHcDMwVGM4TW40TXhmOFVv?=
 =?utf-8?B?dEV0NnpkT3VYU3BnMWNqaVdxMG45YXdkM1FGalM0VC9mYkt1eGhrOThIMWJ5?=
 =?utf-8?B?c1lBQllUTm05cGM1aERUbmhleTA0TlFTVmJIYmtJUDJGUDZDNmppcUZiNk4w?=
 =?utf-8?B?K3ZBNTl5aWVRM01GWi9YRGlKdHl0OHJPaS9ERnNPOS8veG1Yc1MxNi9QL2NU?=
 =?utf-8?B?OEtyNzNlUUoyZWc1UkhVcUlwVHdZTmRCNUR0dkJxQW5vZjdZZWV0UjBNN1Zm?=
 =?utf-8?B?RHd4MExpL0tpYXBrNjdwS3d6Z1NZektrM0FPTHpGZkErOUovYzRWTXhHeVFJ?=
 =?utf-8?B?UFZHdEdtVGJuT0Z5YXVZbHBiOWRTMHNQWW9IL0k5U0tCNmJsS3VnTnBvdTNv?=
 =?utf-8?B?bWJTRm5KR3VaWm5RK3F1U1JGT2l1RnhvaHVTSFlBaXVJczQxK3plSElEK24v?=
 =?utf-8?B?eEx2bjJRT1drYWdyMSsxdUdRSnA4QXVmRXdvN0k3Z2NIeC9mZmNvc3ZENklm?=
 =?utf-8?B?emFtWGhiSDRwcXZPV2tvY080elRTVTh3dEw0Y0U0RUhFTlV3Y0c0TnoyQ01x?=
 =?utf-8?B?cXF0OFpPUFpsbHhRQUdpTnBIQTJncnBHbU44MXR2SnlTNEJxMGVhSXlnR3Bp?=
 =?utf-8?B?MkxrbG01dEEwZEs1NEdDRFgwNld6cUlzME4xNGRHRXByYXk0UlFCTjRvWW5a?=
 =?utf-8?B?TklTUlRFdDdsSndndWIzVHlVckFENGFkMmxqVUxabUVGazFkWkc4U201VW5u?=
 =?utf-8?B?UE9pb0JhOFZaa1VhSHR5Ym1LRDlpMkpvdXF0ZU5YbExqcDlRMDE3YW1zUlUv?=
 =?utf-8?B?c3VuWHQvQ0FLbXZ4TVFKOG5LcFR1U0dsc3hvbVltWFAyenM4TWZaZi9QM3dV?=
 =?utf-8?B?bzVyZS93cksvTG43RFE3SXAyOFVrWUZPTFBoTU40RHphR0k5c3dhMUdYVkpK?=
 =?utf-8?B?azVxMEwwYmdiRTVaY3AwVkM1RVJxUGwwTmQ0WmNWNUVkendzbGxUZkhtZzNG?=
 =?utf-8?B?bEE3VEg4TUJ6Y2hRUnNCbmtLREZSTFl3U1FwaUlnOWh1bTFoUUwvS3MxZU5B?=
 =?utf-8?B?VzJuNzBOaE04dTB4QzNTQnR0UjE2V0g5amR2cWxCaHdxVVNYKzZlOTRTcWZ3?=
 =?utf-8?B?N2JkcmNobFFJQ2RMMndWK1ByRSt4bGEybkE2ZTFRY1dIRXk4MDRwSjg0cG4z?=
 =?utf-8?B?MTVyc2o2RWhsYkZrTEJnWnZMODVOWkFpbERMc01iNENyWlJta0VtL0tOUGdn?=
 =?utf-8?B?YU1idjQ3M093KzV3MEEzTVdHQVN4NnRZWmwxeWxoN1gxUGRHOUNDVWlWZDJF?=
 =?utf-8?B?RnFPLyt4dHNLS2FEWStTbkJBQ09jMlN5OXBQa3Y0U3JnTGJLWUxZWGdmaWxT?=
 =?utf-8?B?azh2ODZUS2RNUy95OWpaL1lWVVlpbHEvSkVDZ09VcW5LSks1ZkhVSGxiOEhU?=
 =?utf-8?B?NDJKNzBycEdjeC9mVWdhOHIrTjJBQ0FEUWZVcXpvMHIvM29FYjRESW5FR2JP?=
 =?utf-8?B?ZThxWkJRYVpucGQzeU9EbWRxOTF1Yk53V3BPbXhFVTRxWUN1amlncVRnckp3?=
 =?utf-8?B?cit4QzVsTkpMTzF1YUJQU3RRNXlHaGxQWHpjOFN0L3U5dVFZbGNnUGNLMFlT?=
 =?utf-8?B?d1RMTFljbmFDSUwrM2Y3ZTEyWGNMME16V0s4RFNTZExRRm1lUHlsRngvVTdl?=
 =?utf-8?B?ekdUU3dFQmdKeVB1N20xZFFxQll4dUVYQkd5d2tUNUhjTlhueTk2M2lEM2lj?=
 =?utf-8?B?ci9BOGlDZjQrVlhQbXlyaXVLVXg4MTh2Y3R4bjRZdlp3enk0NkRaTy9VVk5F?=
 =?utf-8?Q?GjZQliKUdMeKhHDQL3rp7sRK85ZAqlSbKpPQE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzFGQlFRM2graSsyREJmV2wvTTdhSTVHNlhLdC9kdWNNeTRIdlorekVGZXRp?=
 =?utf-8?B?bFdlV2VlYmRjUXFGZTRRV1JEVVFxR3ZZTE1haXpUdE1JOFpjTXZPUFVFZmJj?=
 =?utf-8?B?WEFUVTlvRW5ieTE5SkVkQW9HM0lKZXhHVVBtRzIxZ1M0V043anZTWWJTdDI4?=
 =?utf-8?B?QTNrWm0ySDA1OVgrNnZhWC9BTmpmNDdvZ0JBcWpvL1l6QWFKM2pobVlFUFhC?=
 =?utf-8?B?ZjFyZ0RvVW1jRExJcXdydGlYcE5XMG0vL3UyTUtvNHY3bXBnZ08wUitYSWR0?=
 =?utf-8?B?OEYvOE9mVVBNQ25lcWRWSEtsVzBodDZZQkt3SjdxcUJ3SlZpZncwL2ZyVnhQ?=
 =?utf-8?B?b1A4SWlkUGZJd1pvOTJhcXQyNEV2TE1zZVdQbHZheUlRRTNoemtWYloycEF4?=
 =?utf-8?B?c0k3Qlo1T1FzeEJHczgzQStlb25DMjl0Vlk3TGcwdjltNXpDRDF5eG5ZMWZa?=
 =?utf-8?B?aW52Z0hzVWJsSWc5clFLQjU1VmtsQUlxYWdjc2UyT1ZDWnVUaW1ON01JRm1B?=
 =?utf-8?B?ZlA0aEZLdWJlMGxKWDFkaml5OUpEMjFsM0JnVGFYT3oveFNlY0hScERUaEFD?=
 =?utf-8?B?Qnh2L3pmRXRvTlJWcE1KdXNMYnorUVdIQThkakcrTmRacjh4anA4QVdVSDd4?=
 =?utf-8?B?V3pWaGxHc1kxbHJKK1VVZ0pnRTF6WHRmaWRRKzB2cCt2S3dZOU1lOFJWdy9h?=
 =?utf-8?B?Um1JUWJaaWVmZWdHZldiVEZpaUlMTmRxVXVMV3UzSkRGM0hMdGhmZzNSTEh4?=
 =?utf-8?B?VUFoTU5LbjdFMzFMMTRwZ3NIb3V5WUNRcmJaTnZGZnU2ZFhtVU1vcWZoNll1?=
 =?utf-8?B?cUJzdkUvYnJOeS8rL2kwUnF1OXJVTzVjclhKdWVZdytNcDFKbDR3a0c5d1RR?=
 =?utf-8?B?Zyt5UkVxOWJoUGtzLzA0b3BZWlJmdUtLcjlNdEdDWHgwYzJiTDVXcklQMlRF?=
 =?utf-8?B?c3Q1REpxS1VENE8wbzhibTlWbjV3TklwanpabTlSM1ZXRkpkaWNXMVpsbERT?=
 =?utf-8?B?ajRabktoWU80UlVJSkJqb1UrV0M0UzIveUJLZTArZGI4UVNYWW1BSUZCRCtO?=
 =?utf-8?B?RGZ2SzJxbkxsVjYxWGRxWjNDNW02ZzJtQ0pTK21DR2xyWjdZSXB4TGc0Wlcv?=
 =?utf-8?B?MUxLb0g4dklHdFJZcW41dnF6MGYwY1gyY2RZVGdtWlhQdFJnQnRCWFZESGd4?=
 =?utf-8?B?Zm44U3U1TkU4VzNycEdBVUNCY1lGRU1ZVjJ2a0JTUTFpYS9EME9vK3A2RHEy?=
 =?utf-8?B?OFd3aytFR1U3WHFlbGt4bi9oUW9BbG00R0d4REMyME54OUc1cFJUS3g2b3Jl?=
 =?utf-8?B?bHBzZUswM2R5WmlJa1BmV25XSHlMM1N6VmxjNnNwSkhhNDRyTWlNKzkzOENK?=
 =?utf-8?B?dXBwdEE1WlY0Uk9ld29ESUUzNjhxQ1U0dC9UWjg5UUpsRlFvY1hZUXdMQyti?=
 =?utf-8?B?MkVma2xhMy9RcGQ2czJ5T0ZVdTNkdVd3UTN3OVk2Z3dqMXZSTE9HNVlBN0VJ?=
 =?utf-8?B?TDBJNHVVb1RCcmVvaTRkanVLQlp1b2Y2OVZUcGdYR0xiNkFiMWVnQ25WRG1E?=
 =?utf-8?B?aU9xSGZPUWptaHpmQ3FET3UxQ2Mwa2x0dUNDR1l1UCtvd1EwWW53Ym1hVGZI?=
 =?utf-8?B?eG5TVFVjcEhlQnBjbjlsSEkxMFpqY005VXVjSXFmN1pKallmeE9EMkVHbWh6?=
 =?utf-8?B?M3VIcUdCVW5TR1hjK1VzQktGZmlLRDVhZkorcmFoK213WExwWE5pWmlXdHdZ?=
 =?utf-8?B?NzZ5Z2FZTm0wSERXK1dnd1FLdlltNGoxeHhlWEpsbDZhbHRBd3lSa2tHcGQ1?=
 =?utf-8?B?cWJ4T2tMOG8zZmFuV3phSDBmbmovSG9ZSEYyWnM2Umw3LzMreXBab1hGOEt4?=
 =?utf-8?B?OTl1cURpKzNLTGNMQzIyTFVpNk1Vcm9ZWXRhcjB2SzgvekZlSlRjcEtwckRy?=
 =?utf-8?B?Q09tVXJPVzVlVlNDb0pWZU1zYjJMdGwxcS9JSVdiK3owYWRMS0IyaisyMzlL?=
 =?utf-8?B?TmZ4ZU55cDNHTjhweWV6Z3drS1V4ZzFONkRzUWE2R1ROdFhyVGozRHlkdXBP?=
 =?utf-8?B?VXZRaFVCcGxMOVFTd2ovL25pMTBDVEd1ZFJkd3VSMkVYU0NxUC9uRHNuaWpD?=
 =?utf-8?Q?J6CM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a980d8dc-de2e-48da-952b-08dce7e4c56f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 22:01:33.1803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bnePxnEknUvFz5rMn+/96amn4ZjHRDMrqnoKWdcaz9wtohNIx3qA/FyWMAqnp1JaOq8Lf9RsF/KqZx9D2yBYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9667
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

Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
Additional Changes:
- Remove mfd parent node at example.
- Ref to backlight's common.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
 .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
deleted file mode 100644
index ff5c921386502..0000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Zodiac Inflight Innovations RAVE Supervisory Processor Backlight Bindings
-
-RAVE SP backlight device is a "MFD cell" device corresponding to
-backlight functionality of RAVE Supervisory Processor. It is expected
-that its Device Tree node is specified as a child of the node
-corresponding to the parent RAVE SP device (as documented in
-Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
-
-Required properties:
-
-- compatible: Should be "zii,rave-sp-backlight"
-
-Example:
-
-	rave-sp {
-		compatible = "zii,rave-sp-rdu1";
-		current-speed = <38400>;
-
-		backlight {
-			compatible = "zii,rave-sp-backlight";
-		};
-	}
-
diff --git a/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
new file mode 100644
index 0000000000000..fe9dba8231bf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/zii,rave-sp-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE Supervisory Processor Backlight
+
+maintainers:
+  - Lee Jones <lee@kernel.org>
+
+description:
+  RAVE SP backlight device is a "MFD cell" device corresponding to
+  backlight functionality of RAVE Supervisory Processor. It is expected
+  that its Device Tree node is specified as a child of the node
+  corresponding to the parent RAVE SP device (as documented in
+  Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml)
+
+properties:
+  compatible:
+    const: zii,rave-sp-backlight
+
+required:
+  - compatible
+
+allOf:
+  - $ref: common.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    backlight {
+        compatible = "zii,rave-sp-backlight";
+    };
+

-- 
2.34.1

