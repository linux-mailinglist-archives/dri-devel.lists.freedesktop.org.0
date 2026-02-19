Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJO+EIO8lmntlAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4615CAD3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0529310E688;
	Thu, 19 Feb 2026 07:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="drGxmSDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA87D10E67D;
 Thu, 19 Feb 2026 07:32:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdDAUOpQV5gX7nsN2GJqKxssvLLyWBZG4o6CyGDRUqB/C/xH422FBXbZ42gyHdS9H6kvLXViVs/9Iw/Agp1hKeiU3nDPzZa2spZyPDY58Jt72dtf7Ytd9MxGU0tjyzFTOppEiVB7hnurUSOvm5/eKaH8dhBHrRNEOFVwmG7XXOVqRxGGsOO7DnZ5BDfxopenyVddDbXkCWO0rfkGoYLU+3apw5rKCvP5hD6kq6H7GaZZusej2gKunN/SmDv5PWJ15pHMTi8WhOWNmco96yfeHSEwQ7gP67hwo17KvZo8sA7OCXSVfwd2kl2WSycRF+EKkx5Ehe1Owld/rrAf9h8TZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkxsgvsKoEYmUfnm/Xz794GI7gmIDELnUboH719ceN4=;
 b=fx3mZvNBm08tznwugMOA99xi+g0Jv6eCYGf3x3RXKVW54RBdudr81qd3a0J/3lM57MvHRHhYQMULDgJLT02UKmX09jTiM1Ym/IKab8G+raMbd6pgFbhZzcgtQZCEc6K+Ftm2KBt6GFTn8C7R5Pp6lxNeCfEm6QwuWYYjE3nUi9rIXhf2xOimWTrI0n/oOGMbhdn3lmRJbbcfahP7TXgfacv8eSCpb03wWnNisKqj2Uhs520mos6vmAns0ffejy0pbjuwTfljVa7AVadMYeELnfmWyXnqOEOvALGMM0jSNdlu8QztuhzxGvVbWHEF4Vpjj+AchhkDqk4hpOAlVALugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkxsgvsKoEYmUfnm/Xz794GI7gmIDELnUboH719ceN4=;
 b=drGxmSDJRYDrLRz6iGnrnn1VaVEUC8Z4Gd1r/wy7qksXC8d6064nXU8q5PhqcyLyAK4QkPTtYhinxSrq+lGObMsp0bRccNj/RC6jiGJQjgVrf9eGVHk9wkYfel6HSpEh6ak9R2KKDQ4t5m6IB3Z5Yz0uwzBfQSpb2VhFfxNY1CyOJur8K1UY2VElPc1ssmIikwPQSKpnRvIe9Ap4mIYiMVfWOudZXc+Kt6ctpXsNbJidv1OU6wgYTJtjdKnFSEdg3FclQsSmgsmwJP9PdN/zmc8E0Xbdumu1QJa39LjGXepvp/LcDCqEf23flHMCp4tDhVxWfMEEr3riDtHJ3sQtoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:12 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:12 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v2 0/9] gpu: nova-core: gsp: add continuation record
 support
Date: Thu, 19 Feb 2026 16:30:49 +0900
Message-Id: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OwW7DIAxAfyXyeUwEBpl72n9MPRDjrD6EtECjV
 lX+fSy57vgs+/m9oHAWLnDqXpB5lSJLamDeOqBLSD+sJDYGo43XRltFc7wpWlKVdA+1basRcbL
 Rofdkod1dM0/y2J3f54Mz3+5NXY8hjKFwc8yz1FOHzo9IYxym3nn69IOJgfAjaB3Zkg8aLZJHA
 3+ui5S65Oeeu/a77CjrzT9la6+0GqweMHJ0jv1XWiVKeG+/4bxt2y9xwb5e/wAAAA==
X-Change-ID: 20260203-cmdq-continuation-b99f3d5966c3
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4aced4-70af-458e-2b88-08de6f88fefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1dmYnF0aW5TVFgyOGN6S0ZoWWo5S04yT0ZscVlaVTFiUmtvenladEVzWU8w?=
 =?utf-8?B?LzRFTFFqdlBJRjdKeDRYQTRmM3huSEhqd0pkMm5iWCt3MThkaFNlclFiN001?=
 =?utf-8?B?eXluSVRRVGcrVzd0VXBnaU5nYnBPK2xzakFoNkxRRzFkcDJLQTd2Qi8rdnp6?=
 =?utf-8?B?RHhLMkxTdEpjQUxpODdLUHc1SGVwSTJBVHJsQnBzbldGY0loZW5zMzM4em5o?=
 =?utf-8?B?aVZVWXRZSThsYTlLbzJlZmVSLzdQR1RkVHdBQTlEeU9QTHFZVmNQOWNaWWEv?=
 =?utf-8?B?NjJqTkM5bE5oejBFdmNpSW1HYnJMSzJ6R00vV2oxK0N3ZTJhakZzNzJNb3Fx?=
 =?utf-8?B?TWFDalhtaHZSeTBFTGVPWlBJaUZ1Ui9VbTV3aVUyeXR1NkFNb3RNbG9RR2Iz?=
 =?utf-8?B?clBNQ1FZNk5zREViUWVPamxzZnR1THFnUk9nRnNhemp6d0pYcFh5UDRaRmtr?=
 =?utf-8?B?a05pdjJYaWZLVFN5cFp4SklCelJvaUJyeTRPdmZNTDkzdmxVRDljUnpYWEpx?=
 =?utf-8?B?eUJqK21NVTJMQ3lVS0lPUURNSkVNcFVuRy9nOFJGT3R4N1VENCtQMjBiMnhj?=
 =?utf-8?B?a2Z5VzY1SUgwblZtZW8rdlgvN3JPKzZWcm5IbkpLNVpOUkVOUEJJMUg5Wlgy?=
 =?utf-8?B?ZGtjVzllSGphTDhzcG54V0F4aTZQRXNNdHVYSFMvaG5PbTQyK3YySlhyc1R5?=
 =?utf-8?B?MXV4c0JFTXY3TzlDdXJZNklwUGZ5dTJodWRaeGVCckNId2ZCL1FQQWp0aGV4?=
 =?utf-8?B?bjFWWjU5OW0rbGh2SFJYS0huUG00QWozWmVYV2llU0pGcjY1L0xLTUlkMHZr?=
 =?utf-8?B?Q0pQdnhNSkdRRE5WMTJuN0ViczQxMDFtNkhBMEpLMkpKcW1xUzNPQ2dHRjdj?=
 =?utf-8?B?RGxFaW5hb0pxdGZWb2F1bEhPRmZlaVJlaktGRFBqR1hYWERWUFdLWjlYdjMx?=
 =?utf-8?B?MzVnU0IxUlNYZjNDRjFlNFNTNGZGZUM2VG1HTndTOWtBdFJFUlRtQUVIRVNU?=
 =?utf-8?B?UlhBRzUrclQzYytXMWJvMy9wUTI2amZialpBVFZkb3hyajI0TXMzY0dIbEZ0?=
 =?utf-8?B?WC9nbHRwQ3Fvem1uNTFxN2Q0ZUZWdW1HNFUwVmxybldLK3BGbHlSMGIvYTVK?=
 =?utf-8?B?VVVPN3JLdzNQemRtNlRGU1htUFV2QmZnUmFubVRIdXdmeTNJTGtpRzdiSS9D?=
 =?utf-8?B?UVF5dlJCN0JXNHpYZDVPMVczZXh6RXJBbjhlM1NtVUhnV2k0UUpTK2I4VUh5?=
 =?utf-8?B?d0hSbVZlM3RrUTA5VmkwOFhrZlY3bUF0SFRHYytTaGNSZWFJSVVpOVBOanZV?=
 =?utf-8?B?QzBnOUNTVkZNM3E5NjhEaTM0T3FFT3k0UkdSd0ZHZDhYaHh4L3oyeTk5ZENJ?=
 =?utf-8?B?WEs4NTRkZyt0K2c4cEZYaHdHWHBaSlhSNHViN0U4NmprQ2FDQVJjUG5uVUJk?=
 =?utf-8?B?TnZKcG1tTEIvK1FmOHNIczlwaHU1UjlndE93V0pJNnY3YmZUcWNtQ1BrbDli?=
 =?utf-8?B?RUZjcU1aa2V2NXUybTB2RVhVUFhjZFprQjZtdS92d09PRjd1SVJnemhlNitP?=
 =?utf-8?B?bkY1VHMxWnJ5VkJVYmZWay9wQlBQclNCcG13bFlWN3VzMU9VNjRkcFZvWVlk?=
 =?utf-8?B?cldsODFqNndLOHg5bVNRVFo2UVMvZW44dmpjYjdvQVNTMUdsQVM5bCszOGhR?=
 =?utf-8?B?KytNVFkvaFNUTnBiRUNEaXIwSmtxUEphTVBJSFp5REloMzdKRE1yUmF2aTM2?=
 =?utf-8?B?U3lSWUhmS3ZDZXhabU9iNDdyYko0ME5mM3lxMGQ3MmtZUEhMNkJ6Y2NhZ3JX?=
 =?utf-8?B?SXF0VGRFTXhIN1MxUUluQUlvSEpnL1pDNlROZW1OaFJsSzE2alRtQ0tFaXh0?=
 =?utf-8?B?d216czJnVWpEbmc0cDdNVm5xNkhvbzVrSS9PcUlvWU50K3o1QVdHY1J1ODgz?=
 =?utf-8?B?dmtLSzBsTG5hdjFsTGZVU1lmcTh1V1kzSjBBWFdmenpGa2dBV3Q2Tlp2N2g2?=
 =?utf-8?B?SnhJSHp2eU9LZlhZL1crQUtYamxQMUJXMlFUK1VFakx5NTJjcVkvZ1g1YU1L?=
 =?utf-8?B?SWFHdTFoV2R4NmtSZFpINHRWVlQyMlJRbVc3LzVOcXRzdUNuanJlMHp3Mml2?=
 =?utf-8?B?eEozczgzdDFQQ1pBbVZ3R21TTGhPSXg0a0Q5aCtNRE5GaGNFSjVaU3VVeXBI?=
 =?utf-8?B?Qmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmdKRFR3VGpuSTl2aHFUb0RKWmExeHZiaWxwdmZWWHlUVWEwMDRUTlN2VEtm?=
 =?utf-8?B?NzhIZkNycWZ5Z2RTS1ZqUy9uSyt2N2RmMVE3Sk1hZ1VwekxMbWdKL2ZPR2NJ?=
 =?utf-8?B?Q2lhQ0hLcUpJaEY3M2FRS2VYTnpBK0ZvaFdTQks0MlUwcFp3dG80OUdjaG03?=
 =?utf-8?B?KzV3Q0Y0cGs5UlFwOGwxdXNkZ2cyNmltNnAxZjBlNnlwNEdXakM3QkdKQUlw?=
 =?utf-8?B?cHNwQndwZDZnZU5nV0thcjlYZGlvTy93QWUwUmJGNEpMTVV0eFo0T1lSZzdL?=
 =?utf-8?B?TkNyTnJJVFArWGRDK3lyMUt6aFZSb1BnK0NxbWJlNjhYWkZqMGdzRHU1M1lu?=
 =?utf-8?B?dVF0TFYvU2JTVnBMeUxrWTBMR1V5dXo1L2p5OE1YclJsRkVpRDdVS2NlckZ1?=
 =?utf-8?B?Y0RkUmJmQVhWS2VZaXBvQUFXTkU2cU1rZ21YZHZGbVV3Y2pCQmErWmp1ZVJm?=
 =?utf-8?B?NU9DeGxzT2R4ZUpueGhPcnoyaEFNc2JSQUNYb1JPekcwNVdKOTkrSjMwNzh2?=
 =?utf-8?B?RTcxMjRtYmZYTnBGSTN5RHpIVXpENFhSYTlyby9RZS9ZR3dtSlFWRGNUL3Fr?=
 =?utf-8?B?NEYra2QyMjJQS1lpYjZta0k5OUZnZFhEL2o2YmdxaStiSUlCSFhYaXhiNmVs?=
 =?utf-8?B?dVRUT285ZVlWeE0wZzZac09lTGE5RFZDdFluSDRsWTV1aExpc0lGM0lWbElP?=
 =?utf-8?B?empPSmZnR3ZMNU9CWVdRVGdUd0tVVVF1NFBzTGxta0x0dnFhUTIvQ05kRytl?=
 =?utf-8?B?M0w4YlVtUjlqYzU4Y0dpN0oyeHcramg3VXFpU1VKU1VoRFJjbDE2QkxoQ3c4?=
 =?utf-8?B?ZC90Z0JmU2xZYWMwV3p6ZmZTOEpONWo3T2I4eWJ1d25SRjVGL3dkUnZaRXlE?=
 =?utf-8?B?Wm1xQTRRdEliNU1Cc2JSaVR3OVBUempjOExXdm9HTnpNM2lpcFl3a1IvN09V?=
 =?utf-8?B?L0tzeHBId2xtSkhVMXBNWm9zbi9LejhFcnAwdWVTNEFZM0UwdUN0WUU0V1R3?=
 =?utf-8?B?S1prMzUyaVRUOCtFOGIraU9BSk03ZHBXMWJ3aWkxUWxpNC85eUFDKy95UFlC?=
 =?utf-8?B?aWd2ZzkrLzVmM3B2QlpadzUrSFg5UHlPa1Rxa2hxcjFRVFQvUjlid1Z3czZT?=
 =?utf-8?B?WisyQzRvSWlyMVNKTS9MbWhVcW1GRkRDWWlkTnc2cXhDU0dXc2ZnU3QxeCt1?=
 =?utf-8?B?TzFoblFDWVhvek9xZUJBWkwyaFN1Y3NqN09ZZEhMK3pwMWErcHoxOWUrZ2lV?=
 =?utf-8?B?dGZVMHNlUjY5anlHRGE0TXV3bXlSYVNtdFpWWkUyb2NFNjVHVnM1SW9jSURY?=
 =?utf-8?B?Q1hTZXV2dFFaREt1WmJBMmk3M0puMS9MS2xrN2QxQVBJOEYvbG1obDFSSU5a?=
 =?utf-8?B?eVJZYzBTOW5OVVFvZTNIaENzaWJiZEFNMTVEQ2g2WW9ZOTR4OU9hT3lzYkxK?=
 =?utf-8?B?WlhkQ1Rmd0ZZTHpEZnJ1Q20xd1VHNnRYdi9lNTVrTjJRL2ZWR2ZuZWh1SjA4?=
 =?utf-8?B?VnIrUlhQZld3c2R5L0k0UnVKTERKVmF6Sk1OWFUzTmMreVgrYjlFY2gxQ3lT?=
 =?utf-8?B?dEhsV0hERnJwMlJRUlJ0d2t5aThITUJYdE1qNkFQWHF4blRTUU9VUE5tZHlO?=
 =?utf-8?B?VlNIcjduUDBCSm1pUWlFM1V1MVBoelFIYVVHOTBXM1d5ZjNNcHBPT3NqN2Nr?=
 =?utf-8?B?RlBjTG85U1FOUGQwSDk0R1lGVTJsTmt1YWs5dTd6QlVtN202K2xiakpUOGs2?=
 =?utf-8?B?VzNKM3FrMEw0dHIxcUorUFFaZmpERGptZXpMOFJ5Zkpqd1d2SjlJVnUyYmEx?=
 =?utf-8?B?cmhsSlBiVGE3VVlUdmQ0V1N3a04wTngvbGJnNmNIVG9teHcvWFhNSmNubDQx?=
 =?utf-8?B?cmxQQTNvMHZETi9KOEpVdmw4YW0zOXdDaFZwUCt3TnZhMVJ6WHZzRHNQbGVl?=
 =?utf-8?B?bUZRRllYNkJucXRRR1NFK1kweTBXalNsUkZzUVZ2Y1BvUWNORzN0Y3RiQXdR?=
 =?utf-8?B?TzBCdmZIRkprOWw1a0YvMHhEcUUxSVBmeVdJcjJDV2p5c29ZcUljNG85V1VG?=
 =?utf-8?B?cEJOaUJWYjRHdmpaTCtaY3RmdUZRcnV2MjVBYXZrTGp1N0VRYldzMzdWejB1?=
 =?utf-8?B?ZTBPK0xQbVdEVnhBYnI3ZjF4S1BjL1BHMTBVM1I1VzVkRXV3Ly9XVitnejA2?=
 =?utf-8?B?OE5BQmlRMDBmSlFKM2tiTDNFb0djeHJsQTc1bkxEckFvT05pRnNkUURNeXZx?=
 =?utf-8?B?ajlhYnFDbWRFL1dDZkMxYklQMnNMdjVlKzBEenhCNXFtdjZ0OTBoVy9SYUJh?=
 =?utf-8?B?TXdyeUZkYkcvc0RJS2l0QkdTdEJ4K2FLY2Q2MkUwZm5PMjA0WXRiUFMyc1JM?=
 =?utf-8?Q?6iI8qLnoMH4zYURjf+h5WywJ4nHndXaP+hlQWSBwNZN/E?=
X-MS-Exchange-AntiSpam-MessageData-1: KkhaTwHmKYrWOg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4aced4-70af-458e-2b88-08de6f88fefc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:11.9240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxyNKn3crcJK1FO2/wxsXA4pRjqnm2Pqa6FEn11Uzh3gw2pxSGV7G449JyXK4rXSMt6WFmgBGSiB2l6jKqi9OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: C1D4615CAD3
X-Rspamd-Action: no action

GSP commands over 16 pages need to be sent using "continuation records"
which essentially means splitting the payload over multiple commands.

This series adds a command type `ContinuationRecord` which just writes
its header and whatever payload it is given. It also adds types
`SplitState` and `SplitCommand` which support splitting a large RPC
into smaller ones while transparently letting regular sized RPCs be sent
without extra copies.

The send pathway uses `SplitState` to send all commands, but if
the command fits into 16 pages, it still writes directly into the
command queue. If it is larger than 16 pages and needs continuation
records, it writes into a staging buffer, so there is one copy.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v2:
- Added doccoments
- Renamed driver_bytes_available_to_write to driver_write_area_size
- allocate_command_with_timeout merged allocate_command with timeout parameter
- Replaced hardcoded GSP_PAGE_SIZE * 16 with bindings
- Changed oversized command error from EIO to EMSGSIZE
- Added EMSGSIZE to kernel/error.rs
- Split WrappingCommand functionality into SplitState + SplitCommand enum
- Made max_size a const (MAX_CMD_SIZE)
- Removed send_continuation_record + added comment for type inference
- send_single_command now consumes the command
- Extracted command_size + used in SplitState 
- Link to v1: https://lore.kernel.org/r/20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com

---
Eliot Courtney (9):
      gpu: nova-core: gsp: sort MsgFunction variants alphabetically
      gpu: nova-core: gsp: add mechanism to wait for space on command queue
      rust: add EMSGSIZE error code
      gpu: nova-core: gsp: add checking oversized commands
      gpu: nova-core: gsp: clarify invariant on command queue
      gpu: nova-core: gsp: unconditionally call variable payload handling
      gpu: nova-core: gsp: add command_size helper
      gpu: nova-core: gsp: support large RPCs via continuation record
      gpu: nova-core: gsp: add tests for SplitState

 drivers/gpu/nova-core/gsp/cmdq.rs                 | 118 +++++++---
 drivers/gpu/nova-core/gsp/commands.rs             | 256 +++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs                   | 106 +++++----
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |   1 +
 rust/kernel/error.rs                              |   1 +
 5 files changed, 408 insertions(+), 74 deletions(-)
---
base-commit: 956b9cbd7f156c8672dac94a00de3c6a0939c692
change-id: 20260203-cmdq-continuation-b99f3d5966c3

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

